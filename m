Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id CC581783AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:21 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id f34so4123788ioi.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/CXlxm0an0A8r6l9MFqX8olR6cf7GUFrrQcIXER6JBE=;
	b=ES5id113O5lBK58U5WEPyNGj4cW1AInXcHSQcyIZ/N+P81d9lOqT2kejpaw9AD95DG
	MpFLTZsLUGXc2GvK0u6AuUPcaFPQOPZnsvgV1t41tjbqo0xHHm7IXMGuooh3tvaMG8ha
	fIy+/9T5GLMKovRMtfKB2K9TU7kCdvcKER3imlBFZNHgsFBNxufEojPq8ywLl+H7/P6P
	XuRaeTTRCP1ymdnlCSSMao9W5qRsy8FPp2H/Q/Xze8k9rVQrU7KtQM1bf71EgayLXRtp
	V0KAKavVCsUl2c5Ur1rDSO3KGEoVYfCM5mw25Qsa879E/XDd9jJwo8WPDVp8HniYnp0Z
	WU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/CXlxm0an0A8r6l9MFqX8olR6cf7GUFrrQcIXER6JBE=;
	b=bvyUWrFhvWq5nWlyo+WecRzk9CySCUskDwWov08k8jq8rBnMGYVk64ao5cjQXXX+Af
	NnfdQGEwk7nW732dquN6SN7HhBhiveK6wm+J0p/e3exkPATG0kHXXfKTo20e+70xO77O
	+RwFSXOVQ81AzxWIGc78b0Mv0wGq17XRUVppTwsXxKGcT3WKLGwEhek8SRvA2f8qSLpD
	LnRu8cfEqvJTVk1lHx9xlddOBJ7WHbsJgBTgfKf8PY3C7tQ09X82pJsqAP7t+Po8Dk31
	yo+MJwPEsnLTWWwLG7HQVTx95UDLL9n2bPm87Czz14TZ8LCfp8QNShN44xBgTcnDz8Y2
	RGlw==
X-Gm-Message-State: APf1xPCQ8gm/lc6DF/Mm9XP7xDYNyPxw9HkjcKpy5ew5xqFgNJyP9E6R
	XEUrTGrh123HnlVnsDpD2xAzYT+/
X-Google-Smtp-Source: AH8x2247hsDsZIPmAXtIagG2TmYKkDY5mh/jC+rBxCEaIsQsVo0ROthf9Z9h8e6BuGkud4WNSeDtJA==
X-Received: by 10.107.142.147 with SMTP id q141mr4685109iod.15.1517954602698; 
	Tue, 06 Feb 2018 14:03:22 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:22 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:28 -0600
Message-Id: <7900a07468bd546bcd2c8fd2f864765a5a6f7be1.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 09/14] icecc-create-env: Fix executable rpaths
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:22 -0000

Executables in the toolchain archive occasionally contain runtime
library search paths (RPATH) that use the $ORIGIN placeholder. However,
in order for that placeholder to work, /proc must be mounted. When
iceccd executes the toolchain in the chroot environment, it doesn't
mount /proc, so it is unable to resolve $ORIGIN resulting in a failure
to find dynamic libraries.

The fix is to replace $ORIGIN in executable RPATH entries with the known
chroot executable path.  In order for this to work, the actual real path
to the executable must be resolved to remove any symlinks, otherwise the
calculate $ORIGIN replacement will be wrong. This is done by using
"readlink -f", which is an acceptable dependency because Yocto already
requires it.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-create-env/icecc-create-env              | 40 ++++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
index 426b093d91c..90d249df9f3 100755
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -12,6 +12,26 @@ is_dynamic_elf ()
     (file -L "$1" | grep 'ELF' > /dev/null 2>&1) && (! file -L "$1" | grep 'static' > /dev/null 2>&1)
 }
 
+fix_rpath ()
+{
+    # Patches the RPATH for a file. When the program is executed in the chroot
+    # be iceccd, /proc is not mounted. As such, $ORIGIN can't be resolved. To
+    # work around this, replace all instances of $ORIGIN in RPATH with the
+    # known chroot path to the executables directory
+    local path="$1"
+    local origin="$2"
+    if ! is_dynamic_elf "$path"; then
+        return
+    fi
+    local new_rpath="`readelf -w -d "$path" | grep RPATH | \
+        sed 's/.*\[\(.*\)\]/\1/g' | \
+        sed "s,\\\$ORIGIN,/$origin,g"`"
+
+    if test -n "$new_rpath"; then
+        $PATCHELF --set-rpath "$new_rpath" "$path"
+    fi
+}
+
 is_contained ()
 {
     case " $target_files " in
@@ -47,9 +67,8 @@ add_file ()
         name="$2"
     fi
     test -z "$name" && return
-    # ls -H isn't really the same as readlink, but
-    # readlink is not portable enough.
-    path=`ls -H $path`
+    # readlink is required for Yocto, so we can use it
+    path=`readlink -f "$path"`
     toadd="$name=$path"
     is_contained "$toadd" && return
     if test -z "$silent"; then
@@ -108,6 +127,17 @@ added_as=$1
 shift
 archive_name=$1
 
+if test -z "$PATCHELF"; then
+    PATCHELF=`which patchelf 2> /dev/null`
+fi
+if test -z "$PATCHELF"; then
+    PATCHELF=`which patchelf-uninative 2> /dev/null`
+fi
+if test -z "$PATCHELF"; then
+    echo "patchelf is required"
+    exit 1
+fi
+
 if test -z "$added_gcc" || test -z "$added_gxx" ; then
     echo "usage: $0 <gcc_path> <g++_path>"
     exit 1
@@ -197,6 +227,8 @@ for i in $target_files; do
         if test -f $tempdir/$target -a -x $tempdir/$target; then
             strip -s $tempdir/$target 2>/dev/null
         fi
+
+        fix_rpath $tempdir/$target `dirname $target`
     else
         mkdir -p $tempdir/`dirname $path`
         cp -pH $path $tempdir/$path
@@ -210,6 +242,8 @@ for i in $target_files; do
             strip -s $tempdir/$path 2>/dev/null
         fi
 
+        fix_rpath $tempdir/$path `dirname $path`
+
         path=`echo $path | cut -b2-`
         new_target_files="$new_target_files $path"
     fi
-- 
2.14.3


