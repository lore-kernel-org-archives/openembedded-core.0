Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RW2w7-0006aH-8i
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 10:28:11 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2011 01:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81968140"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga002.jf.intel.com with ESMTP; 01 Dec 2011 01:21:28 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 17:21:27 +0800
Message-Id: <7c75cf6a7d4a3c102f1f44eca16eb5c43c530391.1322731182.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322731182.git.dexuan.cui@intel.com>
References: <cover.1322731182.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322731182.git.dexuan.cui@intel.com>
References: <cover.1322731182.git.dexuan.cui@intel.com>
Subject: [PATCH 3/3] runqemu-ifup, runqemu-internal: be wiser when locating the network tools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Dec 2011 09:28:11 -0000

When working on the self-hosted-image work, I found the PATH variable in the
Level-1 target doesn't have /sbin and /usr/sbin, so "runqemu" can't
run properly since the tools are installeld at
/sbin/ifconfig
/sbin/route
/usr/sbin/iptables

The patch is used to fix the issue by setting a temp PATH when running which.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 scripts/runqemu-ifup     |    8 +++++---
 scripts/runqemu-internal |    3 ++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index 870cb6b..9e697a8 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -64,7 +64,9 @@ if [ $STATUS -ne 0 ]; then
 	exit 1
 fi
 
-IFCONFIG=`which ifconfig 2> /dev/null`
+PATH_TMP="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"
+
+IFCONFIG=`{ PATH=$PATH:$PATH_TMP; which ifconfig 2> /dev/null; }`
 if [ "x$IFCONFIG" = "x" ]; then
 	# better than nothing...
 	IFCONFIG=/sbin/ifconfig
@@ -74,7 +76,7 @@ if [ ! -x "$IFCONFIG" ]; then
 	exit 1
 fi
 
-ROUTE=`which route`
+ROUTE=`{ PATH=$PATH:$PATH_TMP; which route 2>/dev/null; }`
 if [ "x$ROUTE" = "x" ]; then
 	# better than nothing...
 	ROUTE=/sbin/route
@@ -84,7 +86,7 @@ if [ ! -x "$ROUTE" ]; then
 	exit 1
 fi
 
-IPTABLES=`which iptables 2> /dev/null`
+IPTABLES=`{ PATH=$PATH:$PATH_TMP; which iptables 2> /dev/null; }`
 if [ "x$IPTABLES" = "x" ]; then
 	IPTABLES=/sbin/iptables
 fi
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 2968ed9..3214fde 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -141,7 +141,8 @@ if [ ! -d "$LOCKDIR" ]; then
     chmod 777 $LOCKDIR
 fi
 
-IFCONFIG=`which ifconfig 2> /dev/null`
+PATH_TMP="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"
+IFCONFIG=`{ PATH=$PATH:$PATH_TMP; which ifconfig 2> /dev/null; }`
 if [ -z "$IFCONFIG" ]; then
     IFCONFIG=/sbin/ifconfig
 fi
-- 
1.7.6



