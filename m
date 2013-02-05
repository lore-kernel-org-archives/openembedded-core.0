Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U2rbl-0004vf-88
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 00:07:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2013 14:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,610,1355126400"; d="scan'208";a="281408768"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2013 14:51:14 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue,  5 Feb 2013 14:52:49 -0800
Message-Id: <8bf58d16654191479ceb9e3863b9f0d9ae629af7.1360104547.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1360104547.git.dvhart@linux.intel.com>
References: <cover.1360104547.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1360104547.git.dvhart@linux.intel.com>
References: <cover.1360104547.git.dvhart@linux.intel.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Darren Hart <dvhart@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 7/9] oe-git-proxy: Add a new comprehensive git proxy script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 23:07:28 -0000

oe-git-proxy.sh is a simple tool to be used via GIT_PROXY_COMMAND. It
uses BSD netcat to make SOCKS5 or HTTPS proxy connections. It uses
ALL_PROXY to determine the proxy server, protocol, and port. It uses
NO_PROXY to skip using the proxy for a comma delimited list of hosts,
host globs (*.example.com), IPs, or CIDR masks (192.168.1.0/24). It is
known to work with both bash and dash shells.

V2: Implement recommendations by Enrico Scholz:
    o Use exec for the nc calls
    o Use "$@" instead of $* to avoid quoting issues inherent with $*
    o Use bash explicitly and simplify some of the string manipulations
    Also:
    o Drop the .sh in the name per Otavio Salvador
    o Remove a stray debug statement

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/oe-git-proxy |  124 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 124 insertions(+), 0 deletions(-)
 create mode 100755 scripts/oe-git-proxy

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
new file mode 100755
index 0000000..4f1871a
--- /dev/null
+++ b/scripts/oe-git-proxy
@@ -0,0 +1,124 @@
+#!/bin/bash
+
+# oe-git-proxy.sh is a simple tool to be via GIT_PROXY_COMMAND. It uses BSD netcat
+# to make SOCKS5 or HTTPS proxy connections. It uses ALL_PROXY to determine the
+# proxy server, protocol, and port. It uses NO_PROXY to skip using the proxy for
+# a comma delimited list of hosts, host globs (*.example.com), IPs, or CIDR masks
+# (192.168.1.0/24). It is known to work with both bash and dash shells.
+#
+# BSD netcat is provided by netcat-openbsd on Ubuntu and nc on Fedora.
+#
+# Example ALL_PROXY values:
+# ALL_PROXY=socks://socks.example.com:1080
+# ALL_PROXY=https://proxy.example.com:8080
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
+#
+# AUTHORS
+# Darren Hart <dvhart@linux.intel.com>
+
+# Locate the netcat binary
+NC=$(which nc 2>/dev/null)
+if [ $? -ne 0 ]; then
+	echo "ERROR: nc binary not in PATH"
+	exit 1
+fi
+METHOD=""
+
+# Test for a valid IPV4 quad with optional bitmask
+valid_ipv4() {
+	echo $1 | egrep -q "^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}(/(3[0-2]|[1-2]?[0-9]))?$"
+	return $?
+}
+
+# Convert an IPV4 address into a 32bit integer
+ipv4_val() {
+	IP="$1"
+	SHIFT=24
+	VAL=0
+	for B in ${IP//./ }; do
+		VAL=$(($VAL+$(($B<<$SHIFT))))
+		SHIFT=$(($SHIFT-8))
+	done
+	echo "$VAL"
+}
+
+# Determine if two IPs are equivalent, or if the CIDR contains the IP
+match_ipv4() {
+	CIDR=$1
+	IP=$2
+
+	if [ -z "${IP%%$CIDR}" ]; then
+		return 0
+	fi
+
+	# Determine the mask bitlength
+	BITS=${CIDR##*/}
+	if [ -z "$BITS" ]; then
+		return 1
+	fi
+
+	IPVAL=$(ipv4_val $IP)
+	IP2VAL=$(ipv4_val ${CIDR%%/*})
+
+	# OR in the unmasked bits
+	for i in $(seq 0 $((32-$BITS))); do
+		IP2VAL=$(($IP2VAL|$((1<<$i))))
+		IPVAL=$(($IPVAL|$((1<<$i))))
+	done
+
+	if [ $IPVAL -eq $IP2VAL ]; then
+		return 0
+	fi
+	return 1
+}
+
+# Test to see if GLOB matches HOST
+match_host() {
+	HOST=$1
+	GLOB=$2
+
+	if [ -z "${HOST%%$GLOB}" ]; then
+		return 0
+	fi
+
+	# Match by netmask
+	if valid_ipv4 $GLOB; then
+		HOST_IP=$(gethostip -d $HOST)
+		if valid_ipv4 $HOST_IP; then
+			match_ipv4 $GLOB $HOST_IP
+			if [ $? -eq 0 ]; then
+				return 0
+			fi
+		fi
+	fi
+
+	return 1
+}
+
+# If no proxy is set, just connect directly
+if [ -z "$ALL_PROXY" ]; then
+	exec $NC -X connect "$@"
+fi
+
+# Connect directly to hosts in NO_PROXY
+for H in ${NO_PROXY//,/ }; do
+	if match_host $1 $H; then
+		METHOD="-X connect"
+		break
+	fi
+done
+
+if [ -z "$METHOD" ]; then
+	# strip the protocol and the trailing slash
+	PROTO=$(echo $ALL_PROXY | sed -e 's/\([^:]*\):\/\/.*/\1/')
+	PROXY=$(echo $ALL_PROXY | sed -e 's/.*:\/\/\([^:]*:[0-9]*\).*/\1/')
+	if [ "$PROTO" = "socks" ]; then
+		METHOD="-X 5 -x $PROXY"
+	elif [ "$PROTO" = "https" ]; then
+		METHOD="-X connect -x $PROXY"
+	fi
+fi
+
+exec $NC $METHOD "$@"
-- 
1.7.5.4



