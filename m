Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8617600FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 07:48:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5S7m4u4019305
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 00:48:04 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 28 Jun 2013 00:48:04 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2013 15:48:22 +0800
Message-ID: <2ccd03dec928da5c5649928442a23246d93a4959.1372405535.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372405535.git.Qi.Chen@windriver.com>
References: <cover.1372405535.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V2 1/1] udev-cache: take a read-only rootfs into consideration
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
X-List-Received-Date: Fri, 28 Jun 2013 07:48:03 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

In case of a read-only rootfs, we skip the process of generating
udev cache, as the data cannot be persisted between reboots.

However, it's possbile that the $DEVCACHE (default to /etc/dev.tar)
exists in a read-only rootfs, no matter how it's generated or installed.
In such situation, we try to use $DEVCACHE if possible.

Besides the basic changes in the logic of udev cache handling,
this patch also adds code to output more information if the udev
cache is not used and VERBOSE enabled.

This patch also changes the readfile function to readfiles function
so that it could handle more than one file at once.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/udev/udev/init       |   54 +++++++++++++++++++-------------
 meta/recipes-core/udev/udev/udev-cache |    6 ++++
 2 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 9b81700..fd8d476 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -18,15 +18,17 @@ export TZ=/etc/localtime
 [ -x @UDEVD@ ] || exit 1
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
+[ -f /etc/default/rcS ] && . /etc/default/rcS
 
-readfile () {
-   filename=$1
+readfiles () {
    READDATA=""
-   if [ -r $filename ]; then
-       while read line; do
-           READDATA="$READDATA$line"
-       done < $filename
-   fi
+   for filename in $@; do
+	   if [ -r $filename ]; then
+		   while read line; do
+			   READDATA="$READDATA$line"
+		   done < $filename
+	   fi
+   done
 }
 
 case "$1" in
@@ -52,29 +54,37 @@ case "$1" in
     mount -a -t tmpfs 2>/dev/null
     mkdir -p /var/volatile/tmp
 
-    # cache handling
+    # Cache handling.
+    # A list of files which are used as a criteria to judge whether the udev cache could be reused.
+    CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices /proc/atags"
     if [ "$DEVCACHE" != "" ]; then
-            readfile /proc/version
-            VERSION="$READDATA"
-            readfile /proc/cmdline
-            CMDLINE="$READDATA"
-            readfile /proc/devices
-            DEVICES="$READDATA"
-            readfile /proc/atags
-            ATAGS="$READDATA"
-
             if [ -e $DEVCACHE ]; then
-                    readfile /etc/udev/cache.data
-                    if [ "$READDATA" = "$VERSION$CMDLINE$DEVICES$ATAGS" ]; then
+		    readfiles $CMP_FILE_LIST
+		    NEWDATA="$READDATA"
+		    readfiles /etc/udev/cache.data
+		    OLDDATA="$READDATA"
+		    if [ "$OLDDATA" = "$NEWDATA" ]; then
                             (cd /; tar xf $DEVCACHE > /dev/null 2>&1)
                             not_first_boot=1
                             [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
                             [ -e /dev/shm/udev.cache ] && rm -f /dev/shm/udev.cache
                     else
-                            echo "$VERSION$CMDLINE$DEVICES$ATAGS" > /dev/shm/udev.cache
+			    # Output detailed reason why the cached /dev is not used
+			    if [ "$VERBOSE" != "no" ]; then
+				    echo "udev: udev cache not used"
+				    echo "udev: we use $CMP_FILE_LIST as criteria to judge whether the cache /dev could be resued"
+				    echo "udev: olddata: $OLDDATA"
+				    echo "udev: newdata: $NEWDATA"
+			    fi
+			    echo "$NEWDATA" > /dev/shm/udev.cache
                     fi
-            else
-                    echo "$VERSION$CMDLINE$DEVICES$ATAGS" > /dev/shm/udev.cache
+	    else
+		    if [ "$ROOTFS_READ_ONLY" != "yes" ]; then
+			    # If rootfs is not read-only, it's possible that a new udev cache would be generated;
+			    # otherwise, we do not bother to read files.
+			    readfiles $CMP_FILE_LIST
+			    echo "$READDATA" > /dev/shm/udev.cache
+		    fi
             fi
     fi
 
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 8a84fa9..db5a513 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -15,8 +15,14 @@ export TZ=/etc/localtime
 [ -x @UDEVD@ ] || exit 1
 [ -d /sys/class ] || exit 1
 
+[ -f /etc/default/rcS ] && . /etc/default/rcS
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 
+if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
+    [ "$VERBOSE" != "no" ] && echo "udev-cache: read-only rootfs, skip generating udev-cache"
+    exit 0
+fi
+
 if [ "$DEVCACHE" != "" -a -e /dev/shm/udev.cache ]; then
 	echo "Populating dev cache"
 	(cd /; tar cf "$DEVCACHE" dev)
-- 
1.7.9.5


