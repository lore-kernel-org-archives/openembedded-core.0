Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U3weD-00012l-6k
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 23:42:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Feb 2013 14:24:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,632,1355126400"; d="scan'208";a="259980220"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2013 14:26:01 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri,  8 Feb 2013 14:27:25 -0800
Message-Id: <e047d9a0971c82b52b3c164c995ce8f588490dc6.1360362264.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1360362264.git.dvhart@linux.intel.com>
References: <cover.1360362264.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1360362264.git.dvhart@linux.intel.com>
References: <cover.1360362264.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 7/7] oe-git-proxy: Use socat instead of BSD nc
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
X-List-Received-Date: Fri, 08 Feb 2013 22:42:22 -0000

BSD nc was commonly available on the current distros until Fedora 18
appears to have dropped it. socat appears to be a reasonable replacement
with availability on Fedora and Ubuntu and going back some time as well.

Update the script to use the socat syntax.
Simplify the logic a bit by using exec for the no-proxy-needed cases.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/oe-git-proxy |   59 ++++++++++++++++++++++---------------------------
 1 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index 4c2f179..98191fa 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -1,13 +1,11 @@
 #!/bin/bash
 
-# oe-git-proxy is a simple tool to be via GIT_PROXY_COMMAND. It uses BSD netcat
+# oe-git-proxy is a simple tool to be via GIT_PROXY_COMMAND. It uses socat
 # to make SOCKS5 or HTTPS proxy connections. It uses ALL_PROXY to determine the
 # proxy server, protocol, and port. It uses NO_PROXY to skip using the proxy for
 # a comma delimited list of hosts, host globs (*.example.com), IPs, or CIDR
 # masks (192.168.1.0/24). It is known to work with both bash and dash shells.
 #
-# BSD netcat is provided by netcat-openbsd on Ubuntu and nc on Fedora.
-#
 # Example ALL_PROXY values:
 # ALL_PROXY=socks://socks.example.com:1080
 # ALL_PROXY=https://proxy.example.com:8080
@@ -15,27 +13,13 @@
 # Copyright (c) 2013, Intel Corporation.
 # All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-#
 # AUTHORS
 # Darren Hart <dvhart@linux.intel.com>
 
 # Locate the netcat binary
-NC=$(which nc 2>/dev/null)
+SOCAT=$(which socat 2>/dev/null)
 if [ $? -ne 0 ]; then
-	echo "ERROR: nc binary not in PATH"
+	echo "ERROR: socat binary not in PATH"
 	exit 1
 fi
 METHOD=""
@@ -111,28 +95,39 @@ match_host() {
 	return 1
 }
 
-# If no proxy is set, just connect directly
+# If no proxy is set or needed, just connect directly
+METHOD="TCP:$1:$2"
+
 if [ -z "$ALL_PROXY" ]; then
-	exec $NC -X connect "$@"
+	exec $SOCAT STDIO $METHOD
 fi
 
 # Connect directly to hosts in NO_PROXY
 for H in ${NO_PROXY//,/ }; do
 	if match_host $1 $H; then
-		METHOD="-X connect"
-		break
+		exec $SOCAT STDIO $METHOD
 	fi
 done
 
-if [ -z "$METHOD" ]; then
-	# strip the protocol and the trailing slash
-	PROTO=$(echo $ALL_PROXY | sed -e 's/\([^:]*\):\/\/.*/\1/')
-	PROXY=$(echo $ALL_PROXY | sed -e 's/.*:\/\/\([^:]*:[0-9]*\).*/\1/')
-	if [ "$PROTO" = "socks" ]; then
-		METHOD="-X 5 -x $PROXY"
-	elif [ "$PROTO" = "https" ]; then
-		METHOD="-X connect -x $PROXY"
+# Proxy is necessary, determine protocol, server, and port
+PROTO=$(echo $ALL_PROXY | sed -e 's/\([^:]*\):\/\/.*/\1/')
+PROXY=$(echo $ALL_PROXY | sed -e 's/.*:\/\/\([^:]*\).*/\1/')
+PORT=$(echo $ALL_PROXY | sed -e 's/.*:\([0-9]*\)\/?$/\1/')
+if [ "$PORT" = "$ALL_PROXY" ]; then
+	PORT=""
+fi
+
+if [ "$PROTO" = "socks" ]; then
+	if [ -z "$PORT" ]; then
+		PORT="1080"
+	fi
+	METHOD="SOCKS4:$PROXY:$1:$2,socksport=$PORT"
+else
+	# Assume PROXY (http, https, etc)
+	if [ -z "$PORT" ]; then
+		PORT="8080"
 	fi
+	METHOD="PROXY:$PROXY:$1:$2,proxyport=$PORT"
 fi
 
-exec $NC $METHOD "$@"
+exec $SOCAT STDIO $METHOD
-- 
1.7.5.4



