Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 926DC6017E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 05:48:06 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBB58jpj020295 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 23:08:45 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121023084527-1004395 ;
	Wed, 10 Dec 2014 23:08:45 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 23:08:03 -0600
Message-Id: <1ab0e781e82f5045f7792fb5babc3d1f1fc54068.1418274272.git.rich.tollerton@ni.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418274272.git.rich.tollerton@ni.com>
References: <cover.1418274272.git.rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/10/2014 11:08:45 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/10/2014 11:08:45 PM,
	Serialize complete at 12/10/2014 11:08:45 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-10_09:2014-12-10, 2014-12-10,
	1970-01-01 signatures=0
Cc: ken.sharp@ni.com
Subject: [PATCH v3 2/9] udev-cache: replace readfiles() with cmp
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
X-List-Received-Date: Thu, 11 Dec 2014 05:48:08 -0000

Currently, udev-cache system configurations are compared as shell string
variables, read into memory with the readfiles() function. This is more
complex, and significantly (27-41%) slower, than comparing them using
`cmp`. (Performance was verified on both Cortex-A9 and Intel Nehalem
systems.)

So just use cmp. This requires a few other small changes:

exclude /proc/atags from CMP_FILE_LIST if it doesn't exist to avoid
errors in `cat` and `cmp`.

`cmp -q` doesn't exist in busybox, so instead, redirect output to
/dev/null.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/init       | 29 +++++++----------------------
 meta/recipes-core/udev/udev/udev-cache | 17 +++--------------
 2 files changed, 10 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index d26cbfc..ee79670 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -20,17 +20,6 @@ SYSCONF_TMP="/dev/shm/udev.cache"
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 [ -f /etc/default/rcS ] && . /etc/default/rcS
 
-readfiles () {
-   READDATA=""
-   for filename in $@; do
-	   if [ -r $filename ]; then
-		   while read line; do
-			   READDATA="$READDATA$line"
-		   done < $filename
-	   fi
-   done
-}
-
 kill_udevd () {
     pid=`pidof -x udevd`
     [ -n "$pid" ] && kill $pid
@@ -63,14 +52,12 @@ case "$1" in
 
     # Cache handling.
     # A list of files which are used as a criteria to judge whether the udev cache could be reused.
-    CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices /proc/atags"
+    CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices"
+    [ -f /proc/atags ] && CMP_FILE_LIST="$CMP_FILE_LIST /proc/atags"
     if [ "$DEVCACHE" != "" ]; then
             if [ -e $DEVCACHE ]; then
-		    readfiles $CMP_FILE_LIST
-		    NEWDATA="$READDATA"
-		    readfiles "$SYSCONF_CACHED"
-		    OLDDATA="$READDATA"
-		    if [ "$OLDDATA" = "$NEWDATA" ]; then
+		    cat -- "$CMP_FILE_LIST" > "$SYSCONF_TMP"
+		    if cmp $SYSCONF_CACHED $SYSCONF_TMP >/dev/null; then
                             tar xmf $DEVCACHE -C / -m
                             not_first_boot=1
                             [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
@@ -80,17 +67,15 @@ case "$1" in
 			    if [ "$VERBOSE" != "no" ]; then
 				    echo "udev: udev cache not used"
 				    echo "udev: we use $CMP_FILE_LIST as criteria to judge whether the cache /dev could be resued"
-				    echo "udev: olddata: $OLDDATA"
-				    echo "udev: newdata: $NEWDATA"
+				    echo "udev: cached sysconf:  $SYSCONF_CACHED"
+				    echo "udev: current sysconf: $SYSCONF_TMP"
 			    fi
-			    echo "$NEWDATA" > "$SYSCONF_TMP"
                     fi
 	    else
 		    if [ "$ROOTFS_READ_ONLY" != "yes" ]; then
 			    # If rootfs is not read-only, it's possible that a new udev cache would be generated;
 			    # otherwise, we do not bother to read files.
-			    readfiles $CMP_FILE_LIST
-			    echo "$READDATA" > "$SYSCONF_TMP"
+			    cat -- "$CMP_FILE_LIST" > "$SYSCONF_TMP"
 		    fi
             fi
     fi
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index a1410f5..e0e1c39 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -21,20 +21,10 @@ SYSCONF_CACHED="/etc/udev/cache.data"
 SYSCONF_TMP="/dev/shm/udev.cache"
 
 # A list of files which are used as a criteria to judge whether the udev cache could be reused.
-CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices /proc/atags"
+CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices"
+[ -f /proc/atags ] && CMP_FILE_LIST="$CMP_FILE_LIST /proc/atags"
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 
-readfiles () {
-   READDATA=""
-   for filename in $@; do
-	   if [ -r $filename ]; then
-		   while read line; do
-			   READDATA="$READDATA$line"
-		   done < $filename
-	   fi
-   done
-}
-
 if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
     [ "$VERBOSE" != "no" ] && echo "udev-cache: read-only rootfs, skip generating udev-cache"
     exit 0
@@ -43,8 +33,7 @@ fi
 if [ "$DEVCACHE" != "" -a -e "$SYSCONF_TMP" ]; then
 	echo "Populating dev cache"
 	udevadm control --stop-exec-queue
-	readfiles $CMP_FILE_LIST
-	echo "$READDATA" > "$SYSCONF_TMP"
+        cat -- $CMP_FILE_LIST > "$SYSCONF_TMP"
 	find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
 		| xargs tar cf "${DEVCACHE_TMP}" -T-
 	gzip < "${DEVCACHE_TMP}" > "$DEVCACHE"
-- 
2.1.3


