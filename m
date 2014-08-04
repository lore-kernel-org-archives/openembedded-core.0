Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7CC7018E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:41:40 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74IffIf020194 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 13:41:41 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080413414168-622922 ;
	Mon, 4 Aug 2014 13:41:41 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 4 Aug 2014 13:41:02 -0500
Message-Id: <17ffe840a21d09f0dcb1cdfeb13d9d21331055f9.1407177403.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:41 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:41 PM,
	Serialize complete at 08/04/2014 01:41:41 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_03:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
Subject: [PATCH 10/20] udev-cache: parametrize sysconf file paths
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

From: Richard Tollerton <rich.tollerton@ni.com>

The udev-cache facility uses files that represent system states, to
ensure that the cache tarball is valid to apply. These paths were
hardcoded in several places; collect them into DEVCACHE_SYSCONF and
DEVCACHE_CURRENT_SYSCONF in the defaults file.

Natinst-Rally-ID: TA44427
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
Natinst-ReviewBoard-ID: 58620
Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/init               | 8 ++++----
 meta/recipes-core/udev/udev/udev-cache         | 4 ++--
 meta/recipes-core/udev/udev/udev-cache.default | 4 ++++
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index bcb9040..5db029a 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -66,13 +66,13 @@ case "$1" in
             if [ -e $DEVCACHE ]; then
 		    readfiles $CMP_FILE_LIST
 		    NEWDATA="$READDATA"
-		    readfiles /etc/udev/cache.data
+		    readfiles "$DEVCACHE_SYSCONF"
 		    OLDDATA="$READDATA"
 		    if [ "$OLDDATA" = "$NEWDATA" ]; then
                             tar xzf $DEVCACHE -C / --exclude=log
                             not_first_boot=1
                             [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
-                            [ -e /dev/shm/udev.cache ] && rm -f /dev/shm/udev.cache
+                            [ -e "$DEVCACHE_CURRENT_SYSCONF" ] && rm -f "$DEVCACHE_CURRENT_SYSCONF"
                     else
 			    # Output detailed reason why the cached /dev is not used
 			    if [ "$VERBOSE" != "no" ]; then
@@ -81,14 +81,14 @@ case "$1" in
 				    echo "udev: olddata: $OLDDATA"
 				    echo "udev: newdata: $NEWDATA"
 			    fi
-			    echo "$NEWDATA" > /dev/shm/udev.cache
+			    echo "$NEWDATA" > "$DEVCACHE_CURRENT_SYSCONF"
                     fi
 	    else
 		    if [ "$ROOTFS_READ_ONLY" != "yes" ]; then
 			    # If rootfs is not read-only, it's possible that a new udev cache would be generated;
 			    # otherwise, we do not bother to read files.
 			    readfiles $CMP_FILE_LIST
-			    echo "$READDATA" > /dev/shm/udev.cache
+			    echo "$READDATA" > "$DEVCACHE_CURRENT_SYSCONF"
 		    fi
             fi
     fi
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index e730608..7406e07 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -23,12 +23,12 @@ if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
     exit 0
 fi
 
-if [ "$DEVCACHE" != "" -a -e /dev/shm/udev.cache ]; then
+if [ "$DEVCACHE" != "" -a -e "$DEVCACHE_CURRENT_SYSCONF" ]; then
 	[ "${VERBOSE}" != "no" ] && echo "Populating dev cache"
 	(
 		tar czf "${DEVCACHE}.tmp" dev -C / --exclude=log
 		mv -f "${DEVCACHE}.tmp" "$DEVCACHE"
-		mv /dev/shm/udev.cache /etc/udev/cache.data
+		mv "$DEVCACHE_CURRENT_SYSCONF" "$DEVCACHE_SYSCONF"
 	) &
 fi
 
diff --git a/meta/recipes-core/udev/udev/udev-cache.default b/meta/recipes-core/udev/udev/udev-cache.default
index 656c2a4..7f39a68 100644
--- a/meta/recipes-core/udev/udev/udev-cache.default
+++ b/meta/recipes-core/udev/udev/udev-cache.default
@@ -2,4 +2,8 @@
 
 # Comment this out to disable device cache
 DEVCACHE="/etc/udev-cache.tar.gz"
+
+DEVCACHE_SYSCONF="/etc/udev/cache.data"
+DEVCACHE_CURRENT_SYSCONF="/dev/shm/udev.cache"
+
 PROBE_PLATFORM_BUS="yes"
-- 
2.0.4


