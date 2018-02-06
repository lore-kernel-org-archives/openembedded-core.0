Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3997858E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:23 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id m11so4163745iob.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dKwnz6WqgiBS94dE94SpgVINs7Oulw63wSV6pLrcpN4=;
	b=d+bfMK+unnOeK6S94dDsKKX1bXtdW7igN3Bfgu25vBvZyowQXX6HwjCLnm0z4vCDX+
	WlCDSJIaQ+tg5kbSUFcj0jkBZJWjlkIzKIfJYVsfgZi+bpb9munc5QZoUUhRQ1cA6P/6
	Qj2BEtZPrqzl3BvFeBwUCwa4wLJ5kRMt3XfSSKNbjoGVF4QBD2Ix8t2+wBpbAaTHltTB
	SN9QKJ/EYw/ZH4KU9T//QFKMa1wEoIo9R56FQcjax236T+GXYR2FBqA1+H3FZJOp/yOO
	bKEPR4B6B1dA+vfSy1e8SClbyZNNxvFHjPggMR/x8Stuvd5y3wUjrkqWE37W2eA2LnZm
	D4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dKwnz6WqgiBS94dE94SpgVINs7Oulw63wSV6pLrcpN4=;
	b=DGBfSbt3fGAZ3yuGv82Mcjo87cnprLxHlDZEnPnVjuV10DDxSY9Hr3Z9LRmvwqq5jf
	dRhsV3OP3O31b9QnWiPiiMTlYPWNp7FztqLLArDqpEOy58thwd/0c6rvdjnbtqqVUuE4
	6QTTu354naFHCbkrGNjqzT0ayZA0dg7y76czac98Y+fbvWqrmCWAMpVsTrCD3zlc7paH
	ykZ1IjXE8UXHXOVoyVXpZVPSctchJsolhkUvuYk4y7J8D/hbyGfGZBeobh5M8F3bpW+s
	xVKyd2SeZnSBgJ/hegHRRYecWCgPFeg3JYDF007Dzham4Z+eE17ScPF9ZUIN6WAnwhLt
	EyDw==
X-Gm-Message-State: APf1xPCvLjYnghtxnpboPt8RTciqg/3a5+7XHTERzuS98kBIORMoUc8B
	TLwwyMrwZGCI9VsVs+YZVlhg+ksQ
X-Google-Smtp-Source: AH8x2241e1XSAZ5X/LxGGuJGEypXtqZ7YCCsEX3ZIl9HXFlHXDKX7YR29F9kqaKb5r1DtglAWdIXxA==
X-Received: by 10.107.53.213 with SMTP id k82mr4682661ioo.170.1517954604391;
	Tue, 06 Feb 2018 14:03:24 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:23 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:30 -0600
Message-Id: <dbb866f16197306fbd689ed9499a58c48a4e5c74.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 11/14] icecc-create-env: Allow multiple tool aliases
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:23 -0000

When files are added to the environment, multiple aliases can be given
for the file (by calling add_path multiple times with a second
argument). All of these names will end up with a symlink to the original
file.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-create-env/icecc-create-env              | 110 ++++++++++-----------
 1 file changed, 54 insertions(+), 56 deletions(-)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
index 90d249df9f3..537e38a9ba0 100755
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -4,7 +4,8 @@
 # Copyright (C) 2004 by the Icecream Authors
 # GPL
 
-target_files=
+target_paths=
+target_aliases=
 
 is_dynamic_elf ()
 {
@@ -32,15 +33,33 @@ fix_rpath ()
     fi
 }
 
-is_contained ()
+add_path ()
 {
-    case " $target_files " in
-        *" $1 "* ) return 0 ;;
-        *"=$1 "* ) return 0;;
-        * ) return 1 ;;
+    case " $target_paths " in
+        *" $1 "*)
+            return 1
+            ;;
+        *)
+            target_paths="$target_paths $1"
+            return 0
+            ;;
     esac
 }
 
+add_alias ()
+{
+    if test "$1" != "$2"; then
+        local alias="$1=$2"
+        case " $target_aliases " in
+            *" $alias "*)
+                ;;
+            *)
+                target_aliases="$target_aliases $alias"
+                ;;
+        esac
+    fi
+}
+
 normalize_path ()
 {
     # Normalizes the path to a file or directory, removing all "." and ".."
@@ -61,20 +80,17 @@ normalize_path ()
 
 add_file ()
 {
-    local path=`normalize_path $1`
-    local name="$path"
-    if test -n "$2"; then
-        name="$2"
-    fi
-    test -z "$name" && return
+    local p=`normalize_path $1`
     # readlink is required for Yocto, so we can use it
-    path=`readlink -f "$path"`
-    toadd="$name=$path"
-    is_contained "$toadd" && return
-    if test -z "$silent"; then
-        echo "adding file $toadd"
+    local path=`readlink -f "$p"`
+
+    add_alias "$path" "$p"
+    if test -n "$2"; then
+        add_alias "$path" "$2"
     fi
-    target_files="$target_files $toadd"
+
+    add_path "$path" || return
+
     if test -x "$path"; then
         # Only call ldd when it makes sense
         if is_dynamic_elf "$path"; then
@@ -208,52 +224,34 @@ link_rel ()
 }
 
 tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
-new_target_files=
-for i in $target_files; do
-    case $i in
-        *=/*)
-            target=`echo $i | cut -d= -f1`
-            path=`echo $i | cut -d= -f2`
-            ;;
-        *)
-            path=$i
-            target=$i
-            ;;
-    esac
-    if test "$target" == "$path"; then
-        mkdir -p $tempdir/`dirname $target`
-        cp -pH $target $tempdir/$target
-
-        if test -f $tempdir/$target -a -x $tempdir/$target; then
-            strip -s $tempdir/$target 2>/dev/null
-        fi
-
-        fix_rpath $tempdir/$target `dirname $target`
-    else
-        mkdir -p $tempdir/`dirname $path`
-        cp -pH $path $tempdir/$path
+target_files=
+for path in $target_paths; do
+    mkdir -p $tempdir/`dirname $path`
+    cp -pH $path $tempdir/$path
 
-        mkdir -p $tempdir/`dirname $target`
-        # Relative links are used because the files are checked for being
-        # executable outside the chroot
-        link_rel $path $target $tempdir
+    if test -f $tempdir/$path -a -x $tempdir/$path; then
+        strip -s $tempdir/$path 2>/dev/null
+    fi
 
-        if test -f $tempdir/$path -a -x $tempdir/$path; then
-            strip -s $tempdir/$path 2>/dev/null
-        fi
+    fix_rpath $tempdir/$path `dirname $path`
+    target_files="$target_files $path"
+done
 
-        fix_rpath $tempdir/$path `dirname $path`
+for i in $target_aliases; do
+    target=`echo $i | cut -d= -f1`
+    link_name=`echo $i | cut -d= -f2`
 
-        path=`echo $path | cut -b2-`
-        new_target_files="$new_target_files $path"
-    fi
+    mkdir -p $tempdir/`dirname $link_name`
+    # Relative links are used because the files are checked for being
+    # executable outside the chroot
+    link_rel $target $link_name $tempdir
 
-    target=`echo $target | cut -b2-`
-    new_target_files="$new_target_files $target"
+    link_name=`echo $link_name | cut -b2-`
+    target_files="$target_files $link_name"
 done
 
 #sort the files
-target_files=`for i in $new_target_files; do echo $i; done | sort`
+target_files=`for i in $target_files; do echo $i; done | sort`
 
 #test if an archive name was supplied
 #if not use the md5 of all files as the archive name
-- 
2.14.3


