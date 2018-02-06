Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 50D757855C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:19 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id b198so4141242iof.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Bao+UzTgIvgNBwswqMWw85SCIcSIWoOCmqrowjdaFgc=;
	b=DfAd/JEHT/zpmVrXTRxGDLblK+qb+Cf/yK6Ugs+5fUjcT2nHCGUsk+NAfYz+n0wOqV
	XFOUztk+k16Rrt4/lxOtbwsOPfdlltc9RQIQNq9k1WN8VqC8+CLnpSL2kcMuDE2Y38x2
	rsuTDswcsmj4uumRFzx2zaHZ0rTHH7FuveSKx14gTe12HL7XzjSpoXY/UYPfVaddTKat
	pvd3zjA9rFr473lLCFv7kfFsNBFBIgO1K03mGQL0WXdtiOYfnjnLRQEcStulpjd0wGFY
	XXJAkUm3XmiY9+GAyoR5c0yGQ95lnXjDR+3h2oUTS6mABw4XK11mbEOGV2G6QIkBpNMX
	l3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Bao+UzTgIvgNBwswqMWw85SCIcSIWoOCmqrowjdaFgc=;
	b=lwd3tkdHOqSvS9QhOCE6WB3bNSdqYQNP0fRBWvlztlYzymlT38NYcrrSeL1UR9LVEY
	D5ztL6qS0VWLFMGmtYpoDH9i5zjJxgPH3xeJCSRRd/U1GX2F+319EWK4X7bcshBEAfOQ
	Vk3eUv3iuJnH1KEBrAZBeITMYoU+39lLG9ic9aU8MhSr3Cvju7HMoRTyghYfsZt5qt+W
	RT+zEuvTMb9mdA8/gQWLpmXqRbF8qW/ZVkLydJCtaRRTzVzuRMe1xXmI3U2ytZPRD+4I
	L3zQZ0r8u9t57BhUFoU8gZvMd6wpX4BM7vqU8L188KHQF1W7uJHlR7qG6+pj40eZnghv
	+Zrg==
X-Gm-Message-State: APf1xPDt0QoNySa6pHvOfNjP0DIylplZ0NkPB0QTMaqmvboEcF9dsgIg
	zs7yj1cMaR1V0x0ZOlS/Fp0RKBYx
X-Google-Smtp-Source: AH8x224G6deEGCeOos+OuTfClZEIJgBUt6vn8FBCBcSXIViydB1XZeq7p7z3Gmn5uQl2RGPieJH7WQ==
X-Received: by 10.107.4.133 with SMTP id 127mr4852428ioe.209.1517954601176;
	Tue, 06 Feb 2018 14:03:21 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:20 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:26 -0600
Message-Id: <aa64ba8170cfc4ee511d736c8666f1ccc8ed8d48.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 07/14] icecc-create-env: Symlink alternate names
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:20 -0000

Instead of renaming files to a new path in the toolchain archive, keep
the files with their original paths and create a relative symbolic link
from the new path to the original file.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-create-env/icecc-create-env              | 64 +++++++++++++++++++---
 1 file changed, 57 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
index 7636d090a48..0791bd54b27 100755
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -21,10 +21,28 @@ is_contained ()
     esac
 }
 
+normalize_path ()
+{
+    # Normalizes the path to a file or directory, removing all "." and ".."
+    # entries. Use pwd -L to explicitly prevent symlink expansion
+    local path=$1
+    if test -f "$path"; then
+        pushd $(dirname $path) > /dev/null 2>&1
+        dir_path=$(pwd -L)
+        path=$dir_path/$(basename $path)
+        popd > /dev/null 2>&1
+    elif test -d "$path"; then
+        pushd $path > /dev/null 2>&1
+        path=$(pwd -L)
+        popd > /dev/null 2>&1
+    fi
+    echo $path
+}
+
 add_file ()
 {
-    local name="$1"
-    local path="$1";
+    local path=`normalize_path $1`
+    local name="$path"
     if test -n "$2"; then
         name="$2"
     fi
@@ -129,7 +147,7 @@ if test -n "$specfile" && test -e "$specfile"; then
 fi
 
 ltofile=`$added_gcc -print-prog-name=lto1`
-pluginfile="${ltofile%lto1}liblto_plugin.so"
+pluginfile=`normalize_path "${ltofile%lto1}liblto_plugin.so"`
 if test -r "$pluginfile"
 then
     add_file $pluginfile  ${pluginfile#*usr}
@@ -146,6 +164,19 @@ else
     exit 1
 fi
 
+link_rel ()
+{
+    local target="$1"
+    local name="$2"
+    local base="$3"
+
+    local prefix=`dirname $name`
+
+    prefix=`echo $prefix | sed 's,[^/]\+,..,g' | sed 's,^/*,,g'`
+
+    ln -s $prefix/$target $base/$name
+}
+
 tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
 new_target_files=
 for i in $target_files; do
@@ -159,11 +190,30 @@ for i in $target_files; do
             target=$i
             ;;
     esac
-    mkdir -p $tempdir/`dirname $target`
-    cp -p $path $tempdir/$target
-    if test -f $tempdir/$target -a -x $tempdir/$target; then
-        strip -s $tempdir/$target 2>/dev/null
+    if test "$target" == "$path"; then
+        mkdir -p $tempdir/`dirname $target`
+        cp -pH $target $tempdir/$target
+
+        if test -f $tempdir/$target -a -x $tempdir/$target; then
+            strip -s $tempdir/$target 2>/dev/null
+        fi
+    else
+        mkdir -p $tempdir/`dirname $path`
+        cp -pH $path $tempdir/$path
+
+        mkdir -p $tempdir/`dirname $target`
+        # Relative links are used because the files are checked for being
+        # executable outside the chroot
+        link_rel $path $target $tempdir
+
+        if test -f $tempdir/$path -a -x $tempdir/$path; then
+            strip -s $tempdir/$path 2>/dev/null
+        fi
+
+        path=`echo $path | cut -b2-`
+        new_target_files="$new_target_files $path"
     fi
+
     target=`echo $target | cut -b2-`
     new_target_files="$new_target_files $target"
 done
-- 
2.14.3


