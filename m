Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 16C9265E48
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:41:40 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74Iff9C016927 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 13:41:42 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080413414179-622929 ;
	Mon, 4 Aug 2014 13:41:41 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 4 Aug 2014 13:41:09 -0500
Message-Id: <7b6bd6dce94e0b3d570dd2a710a44fe3c6092346.1407177403.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:41 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:42 PM,
	Serialize complete at 08/04/2014 01:41:42 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_03:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
Subject: [PATCH 17/20] udev-cache: fix udev-cache changes to work with busybox tar
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
X-List-Received-Date: Mon, 04 Aug 2014 18:41:41 -0000

busybox tar does not support the --one-file-system option that we use to
keep tar from archiving unnecessary files that live under /dev but are
not mounted under the devtmpfs.  Instead, when GNU tar is not present,
use find to pass tar a list of the files that need to be cached.

Additionally, busybox tar does not complain when timestamps are in the
future, and the OE busybox defconfig does not have the
TAR_NOPRESERVE_TIME option enabled, so don't use the '-m' option with
busybox tar.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/udev/udev/init               | 14 +++++++++-----
 meta/recipes-core/udev/udev/udev-cache         | 12 ++++++++++--
 meta/recipes-core/udev/udev/udev-cache.default |  4 ++++
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 3a52e98..6caf7d5 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -70,11 +70,15 @@ case "$1" in
 		    readfiles "$DEVCACHE_SYSCONF"
 		    OLDDATA="$READDATA"
 		    if [ "$OLDDATA" = "$NEWDATA" -a -f "$DEVCACHE" ]; then
-                            tar xzf $DEVCACHE -C / $DEVCACHE_EXTRACT_OPTS
-                            not_first_boot=1
-                            [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
-                            [ -e "$DEVCACHE_CURRENT_SYSCONF" ] && rm -f "$DEVCACHE_CURRENT_SYSCONF"
-                    else
+			    if [ ! `readlink -f /bin/tar` = "/bin/tar.tar" ]; then
+				    tar xzf $DEVCACHE -C / $BUSYBOX_DEVCACHE_EXTRACT_OPTS
+			    else
+				    tar xzf $DEVCACHE -C / $DEVCACHE_EXTRACT_OPTS
+			    fi
+			    not_first_boot=1
+			    [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
+			    [ -e "$DEVCACHE_CURRENT_SYSCONF" ] && rm -f "$DEVCACHE_CURRENT_SYSCONF"
+		    else
 			    # Output detailed reason why the cached /dev is not used
 			    if [ "$VERBOSE" != "no" ]; then
 				    echo "udev: udev cache not used"
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 7eea5fb..43bc67a 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -28,10 +28,18 @@ fi
 [ -e "$DEVCACHE_CURRENT_SYSCONF" ] || { echo "not found"; exit 0; }
 [ "${VERBOSE}" == "no" ] || echo "found; building cache."
 
-(
+if [ ! `readlink -f /bin/tar` = "/bin/tar.tar" ]; then
+	(
+	find /dev \( -type b -o -type c -o -type l \) -xdev | cut -c 2- | xargs tar czf "${DEVCACHE}.tmp" -C / $BUSYBOX_DEVCACHE_CREATE_OPTS && \
+		mv -f "${DEVCACHE}.tmp" "$DEVCACHE" && \
+		mv "$DEVCACHE_CURRENT_SYSCONF" "$DEVCACHE_SYSCONF"
+	) &
+else
+	(
 	tar czf "${DEVCACHE}.tmp" dev -C / $DEVCACHE_CREATE_OPTS && \
 		mv -f "${DEVCACHE}.tmp" "$DEVCACHE" && \
 		mv "$DEVCACHE_CURRENT_SYSCONF" "$DEVCACHE_SYSCONF"
-) &
+	) &
+fi
 
 exit 0
diff --git a/meta/recipes-core/udev/udev/udev-cache.default b/meta/recipes-core/udev/udev/udev-cache.default
index c71826e..d2c1e5c 100644
--- a/meta/recipes-core/udev/udev/udev-cache.default
+++ b/meta/recipes-core/udev/udev/udev-cache.default
@@ -12,4 +12,8 @@ DEVCACHE_CURRENT_SYSCONF="/dev/shm/udev.cache"
 DEVCACHE_EXTRACT_OPTS="--exclude=log -m --exclude=udev.cache --one-file-system"
 DEVCACHE_CREATE_OPTS="--exclude=log --exclude=udev.cache --one-file-system"
 
+# Busybox tar does not support --one-file-system option
+BUSYBOX_DEVCACHE_EXTRACT_OPTS="--exclude=log --exclude=udev.cache"
+BUSYBOX_DEVCACHE_CREATE_OPTS="--exclude=log --exclude=udev.cache"
+
 PROBE_PLATFORM_BUS="yes"
-- 
2.0.4


