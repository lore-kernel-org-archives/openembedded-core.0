Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ABA07607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 21:50:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 22 Oct 2015 14:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,184,1444719600"; d="scan'208";a="669848796"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga003.jf.intel.com with ESMTP; 22 Oct 2015 14:50:02 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 13:39:20 +0000
Message-Id: <91875c3a02436a231743919c42c17584904016c7.1445520365.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1445520365.git.mariano.lopez@linux.intel.com>
References: <cover.1445520365.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1445520365.git.mariano.lopez@linux.intel.com>
References: <cover.1445520365.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/2] runqemu-ifup: Check if the tap interface is set up correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Oct 2015 21:50:01 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The process to set up a tap interface is as follows:
    - tap interface is created
    - An IP address is assigned to the tap interface
    - The interface is bring up
    - A route is added to the target using the tap
      interface

Of all the previous steps, only the first one is
check if it was sucessful. The status of the others
are ignored and all of them are required to have
basic connectivity in the target.

This patch adds the checks for the rest of the stpes
needed to set up the tap interface.

[YOCTO #8550]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 scripts/runqemu-ifup | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index b5a3db9..d9bd894 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -91,10 +91,25 @@ fi
 
 n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
 $IFCONFIG addr add 192.168.7.$n/32 broadcast 192.168.7.255 dev $TAP
+STATUS=$?
+if [ $STATUS -ne 0 ]; then
+    echo "Failed to set up IP addressing on $TAP"
+    exit 1
+fi
 $IFCONFIG link set dev $TAP up
+STATUS=$?
+if [ $STATUS -ne 0 ]; then
+    echo "Failed to bring up $TAP"
+    exit 1
+fi
 
 dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
 $IFCONFIG route add to 192.168.7.$dest dev $TAP
+STATUS=$?
+if [ $STATUS -ne 0 ]; then
+    echo "Failed to add route to 192.168.7.$dest using $TAP"
+    exit 1
+fi
 
 # setup NAT for tap0 interface to have internet access in QEMU
 $IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
-- 
1.8.4.5


