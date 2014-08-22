Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8C870F70
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 21:31:19 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s7MLVKRI008683; Fri, 22 Aug 2014 16:31:20 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014082216312037-290498 ;
	Fri, 22 Aug 2014 16:31:20 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 16:30:55 -0500
Message-Id: <7db18f933460f111085749ee49a70796eab4068a.1408742574.git.rich.tollerton@ni.com>
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
Subject: [PATCH v2 09/12] udev-cache: get system config immediately before cache
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

The system device configuration -- /proc/devices, /proc/cmdline, etc. --
and the contents of /dev must be stored as simultaneously as possible.
Otherwise, hotplug events could be processed between the time we get the
system config and the time we archive /dev, and the udev cache may be
incorrect.

To solve this, update the cached system configuration inside the
udev-cache initscript, not the udev initscript. Also, run it before
archiving /dev, because it should execute nearly instantaneously.

We still need to compute the system configuration inside the udev
initscript, to detect if it changed, so refactor it into a new function
sysconf_cmd(). This also allows administrators to modify it for
machine-specific requirements.

Evaluating the system configuration requires a shell function
readfiles() defined in the udev initscript. The only salient differences
between readfiles() and just using `cat` directly are a) readfiles()
skips files without error if they don't exist, which is necessary
because /proc/atags is in CMP_FILE_LIST but does not exist on all
targets; and b) input lines are concatenated into an output shell
variable with newlines stripped. (a) can be eliminated by not including
/proc/atags in CMP_FILE_LIST if it doesn't exist. (b) is O(n^2) anyway,
and makes $NEWDATA, $OLDDATA etc. very hard to read, and we don't need
to strip newlines anyway. So make sysconf_cmd() use `cat` and remove
readfiles().

Instead of storing system configuration in shell variables ($NEWDATA,
$OLDDATA), store them directly in files: redirect to $SYSCONF_TMP
instead of storing in $NEWDATA; read from $SYSCONF_CACHED directly
instead of reading it into $OLDDATA. This turns comparing $NEWDATA vs.
$OLDDATA into a call to `cmp`. However, busybox lacks `cmp -q`, so
instead, redirect cmp's output to /dev/null.

$OLDDATA and $NEWDATA go away. This obviates the most of error message
printed when the udev cache can't be used, but it probably wasn't of
much help, because $OLDDATA and $NEWDATA are so large that they would
have scrolled off the screen anyway. Beyond that, this error is so
important that it should probably be printed regardless of the setting
of VERBOSE. So leave the "udev: cache not used" log message and remove
everything else.

Because the udev-cache initscript evaluates the system configuration
itself, it makes no sense to signal it to run by storing the system
configuration in a file. Instead, signal udev-cache execution by
touching a file, $DEVCACHE_REGEN.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/init       | 44 +++++++++++++---------------------
 meta/recipes-core/udev/udev/udev-cache | 17 +++++++++++--
 2 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 7ffa4a6..10cbf56 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -16,21 +16,20 @@ export TZ=/etc/localtime
 [ -x @UDEVD@ ] || exit 1
 SYSCONF_CACHED="/etc/udev/cache.data"
 SYSCONF_TMP="/dev/shm/udev.cache"
+DEVCACHE_REGEN="/dev/shm/udev-regen" # create to request cache regen
+
+# List of files whose contents will be included in cached system state.
+CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices"
+[ -f /proc/atags ] && CMP_FILE_LIST="$CMP_FILE_LIST /proc/atags"
+
+# Command to compute system configuration.
+sysconf_cmd () {
+	cat -- $CMP_FILE_LIST
+}
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
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
@@ -62,35 +61,24 @@ case "$1" in
     mkdir -p /var/volatile/tmp
 
     # Cache handling.
-    # A list of files which are used as a criteria to judge whether the udev cache could be reused.
-    CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices /proc/atags"
     if [ "$DEVCACHE" != "" ]; then
             if [ -e $DEVCACHE ]; then
-		    readfiles $CMP_FILE_LIST
-		    NEWDATA="$READDATA"
-		    readfiles "$SYSCONF_CACHED"
-		    OLDDATA="$READDATA"
-		    if [ "$OLDDATA" = "$NEWDATA" ]; then
+		    sysconf_cmd > $SYSCONF_TMP
+		    if cmp $SYSCONF_CACHED $SYSCONF_TMP >/dev/null; then
                             tar xmf $DEVCACHE -C / -m
                             not_first_boot=1
                             [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
-                            [ -e $SYSCONF_TMP ] && rm -f "$SYSCONF_TMP"
+                            [ -e "$DEVCACHE_REGEN" ] && rm -f "$DEVCACHE_REGEN"
                     else
 			    # Output detailed reason why the cached /dev is not used
-			    if [ "$VERBOSE" != "no" ]; then
-				    echo "udev: udev cache not used"
-				    echo "udev: we use $CMP_FILE_LIST as criteria to judge whether the cache /dev could be resued"
-				    echo "udev: olddata: $OLDDATA"
-				    echo "udev: newdata: $NEWDATA"
-			    fi
-			    echo "$NEWDATA" > "$SYSCONF_TMP"
+			    echo "udev: cache not used"
+			    touch "$DEVCACHE_REGEN"
                     fi
 	    else
 		    if [ "$ROOTFS_READ_ONLY" != "yes" ]; then
 			    # If rootfs is not read-only, it's possible that a new udev cache would be generated;
 			    # otherwise, we do not bother to read files.
-			    readfiles $CMP_FILE_LIST
-			    echo "$READDATA" > "$SYSCONF_TMP"
+			    touch "$DEVCACHE_REGEN"
 		    fi
             fi
     fi
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 497d257..5a1bc78 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -19,6 +19,16 @@ export TZ=/etc/localtime
 DEVCACHE_TMP="/dev/shm/udev-cache-tmp.tar"
 SYSCONF_CACHED="/etc/udev/cache.data"
 SYSCONF_TMP="/dev/shm/udev.cache"
+DEVCACHE_REGEN="/dev/shm/udev-regen" # create to request cache regen
+
+# List of files whose contents will be included in cached system state.
+CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices"
+[ -f /proc/atags ] && CMP_FILE_LIST="$CMP_FILE_LIST /proc/atags"
+
+# Command to compute system configuration.
+sysconf_cmd () {
+	cat -- $CMP_FILE_LIST
+}
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 
 if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
@@ -26,13 +36,16 @@ if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
     exit 0
 fi
 
-if [ "$DEVCACHE" != "" -a -e "$SYSCONF_TMP" ]; then
+if [ "$DEVCACHE" != "" -a -e "$DEVCACHE_REGEN" ]; then
 	echo "Populating dev cache"
+	# Run sysconf_cmd before `tar`, not after, so that as little time as
+	# possible elapses between creating $SYSCONF_CACHED and $DEVCACHE.
+	sysconf_cmd > "$SYSCONF_CACHED"
 	find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
 		| xargs tar cf "${DEVCACHE_TMP}" -T-
 	gzip < "${DEVCACHE_TMP}" > "$DEVCACHE"
 	rm -f "${DEVCACHE_TMP}"
-	mv "$SYSCONF_TMP" "$SYSCONF_CACHED"
+	rm -f "$DEVCACHE_REGEN"
 fi
 
 exit 0
-- 
2.0.4


