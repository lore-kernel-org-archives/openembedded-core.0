Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id EA7AD61566
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 07:23:35 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Sep 2013 00:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,852,1371106800"; d="scan'208";a="356708373"
Received: from sorvi.fi.intel.com ([10.237.72.152])
	by azsmga001.ch.intel.com with ESMTP; 06 Sep 2013 00:23:01 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2013 10:23:00 +0300
Message-Id: <1378452180-2872-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] connman: Ignore the NFS root network interface in init script
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
X-List-Received-Date: Fri, 06 Sep 2013 07:23:37 -0000

The connman init.d script tried to ignore all the network interfaces
if NFS root is configured. We should only ignore the interface
that is used by NFS root.

[YOCTO #4587]

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman/connman | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
index 67ba7c8..2625ade 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -29,8 +29,18 @@ done
 do_start() {
 	EXTRA_PARAM=""
 	if test $nfsroot -eq 1 ; then
-		ethn=`ifconfig | grep eth | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
-		EXTRA_PARAM="-I $ethn"
+	    NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
+	    NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ ]*\):.*$/\1/p'`
+
+	    if [ x$NET_ADDR != x ]; then
+		for i in $NET_DEVS; do
+		    ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
+		    if [ "$NET_ADDR" = "$ADDR" ]; then
+			EXTRA_PARAM="-I $i"
+			break
+		    fi
+		done
+	    fi
 	fi
 	if [ -f @LIBDIR@/connman/wired-setup ] ; then
 		. @LIBDIR@/connman/wired-setup
-- 
1.7.11.7


