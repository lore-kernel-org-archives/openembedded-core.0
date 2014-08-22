Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 4C7F370F6E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 21:31:19 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s7MLVKkH008678; Fri, 22 Aug 2014 16:31:20 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014082216312035-290497 ;
	Fri, 22 Aug 2014 16:31:20 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 16:30:54 -0500
Message-Id: <1fc12be837df1ae2f464ad60184279ac500c27e6.1408742574.git.rich.tollerton@ni.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1408742574.git.rich.tollerton@ni.com>
References: <cover.1408742574.git.rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/22/2014 04:31:20 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/22/2014 04:31:20 PM,
	Serialize complete at 08/22/2014 04:31:20 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-22_06:2014-08-22, 2014-08-22,
	1970-01-01 signatures=0
Cc: otavio@ossystems.com.br
Subject: [PATCH v2 08/12] udev-cache: parametrize sysconf file paths
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
X-List-Received-Date: Fri, 22 Aug 2014 21:31:24 -0000

The udev-cache facility uses files that represent system states, to
ensure that the cache tarball is valid to apply. These paths were
hardcoded in several places; collect them into SYSCONF_CACHED and
SYSCONF_TMP.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/init       | 10 ++++++----
 meta/recipes-core/udev/udev/udev-cache |  6 ++++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 1d073c2..7ffa4a6 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -14,6 +14,8 @@ export TZ=/etc/localtime
 [ -d /sys/class ] || exit 1
 [ -r /proc/mounts ] || exit 1
 [ -x @UDEVD@ ] || exit 1
+SYSCONF_CACHED="/etc/udev/cache.data"
+SYSCONF_TMP="/dev/shm/udev.cache"
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 [ -f /etc/default/rcS ] && . /etc/default/rcS
@@ -66,13 +68,13 @@ case "$1" in
             if [ -e $DEVCACHE ]; then
 		    readfiles $CMP_FILE_LIST
 		    NEWDATA="$READDATA"
-		    readfiles /etc/udev/cache.data
+		    readfiles "$SYSCONF_CACHED"
 		    OLDDATA="$READDATA"
 		    if [ "$OLDDATA" = "$NEWDATA" ]; then
                             tar xmf $DEVCACHE -C / -m
                             not_first_boot=1
                             [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
-                            [ -e /dev/shm/udev.cache ] && rm -f /dev/shm/udev.cache
+                            [ -e $SYSCONF_TMP ] && rm -f "$SYSCONF_TMP"
                     else
 			    # Output detailed reason why the cached /dev is not used
 			    if [ "$VERBOSE" != "no" ]; then
@@ -81,14 +83,14 @@ case "$1" in
 				    echo "udev: olddata: $OLDDATA"
 				    echo "udev: newdata: $NEWDATA"
 			    fi
-			    echo "$NEWDATA" > /dev/shm/udev.cache
+			    echo "$NEWDATA" > "$SYSCONF_TMP"
                     fi
 	    else
 		    if [ "$ROOTFS_READ_ONLY" != "yes" ]; then
 			    # If rootfs is not read-only, it's possible that a new udev cache would be generated;
 			    # otherwise, we do not bother to read files.
 			    readfiles $CMP_FILE_LIST
-			    echo "$READDATA" > /dev/shm/udev.cache
+			    echo "$READDATA" > "$SYSCONF_TMP"
 		    fi
             fi
     fi
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index aaf1ddd..497d257 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -17,6 +17,8 @@ export TZ=/etc/localtime
 
 [ -f /etc/default/rcS ] && . /etc/default/rcS
 DEVCACHE_TMP="/dev/shm/udev-cache-tmp.tar"
+SYSCONF_CACHED="/etc/udev/cache.data"
+SYSCONF_TMP="/dev/shm/udev.cache"
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 
 if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
@@ -24,13 +26,13 @@ if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
     exit 0
 fi
 
-if [ "$DEVCACHE" != "" -a -e /dev/shm/udev.cache ]; then
+if [ "$DEVCACHE" != "" -a -e "$SYSCONF_TMP" ]; then
 	echo "Populating dev cache"
 	find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
 		| xargs tar cf "${DEVCACHE_TMP}" -T-
 	gzip < "${DEVCACHE_TMP}" > "$DEVCACHE"
 	rm -f "${DEVCACHE_TMP}"
-	mv /dev/shm/udev.cache /etc/udev/cache.data
+	mv "$SYSCONF_TMP" "$SYSCONF_CACHED"
 fi
 
 exit 0
-- 
2.0.4


