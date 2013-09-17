Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2C36023B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 07:48:01 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Sep 2013 00:48:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,921,1371106800"; d="scan'208";a="295774182"
Received: from sorvi.fi.intel.com ([10.237.72.152])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Sep 2013 00:48:01 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2013 10:48:00 +0300
Message-Id: <1379404080-28423-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] connman: Try to figure out NFS root interface if using DHCP
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
X-List-Received-Date: Tue, 17 Sep 2013 07:48:01 -0000

The commit c73487302270a7c2d3bbbb191ce1dd63ee2016dc missed the case
where the NFS is using DHCP.

[YOCTO #5176]

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman/connman | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
index 2625ade..bf7a94a 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -30,16 +30,23 @@ do_start() {
 	EXTRA_PARAM=""
 	if test $nfsroot -eq 1 ; then
 	    NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
-	    NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ ]*\):.*$/\1/p'`
+	    NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ :]*\).*$/\1/p'`
 
-	    if [ x$NET_ADDR != x ]; then
-		for i in $NET_DEVS; do
-		    ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
-		    if [ "$NET_ADDR" = "$ADDR" ]; then
-			EXTRA_PARAM="-I $i"
-			break
+	    if [ ! -z "$NET_ADDR" ]; then
+		if [ "$NET_ADDR" = dhcp ]; then
+		    ethn=`ifconfig | grep "^eth" | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
+		    if [ ! -z "$ethn" ]; then
+			EXTRA_PARAM="-I $ethn"
 		    fi
-		done
+		else
+		    for i in $NET_DEVS; do
+			ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
+			if [ "$NET_ADDR" = "$ADDR" ]; then
+			    EXTRA_PARAM="-I $i"
+			    break
+			fi
+		    done
+		fi
 	    fi
 	fi
 	if [ -f @LIBDIR@/connman/wired-setup ] ; then
-- 
1.7.11.7


