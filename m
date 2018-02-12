Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id AE34B7826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:31 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id k80so6606128ioe.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dKwnz6WqgiBS94dE94SpgVINs7Oulw63wSV6pLrcpN4=;
	b=Hbto6rlT8H8MV/ewtp9i/FwOP7rskabQeIDEfkS9wFLU+gzTgs0VKc1D5kH8Z1wdVg
	khZfHjSJXTzbr22EGQYcBCnHWwVOiyHX4zaLzyiH0UQhFYJXMrwJvVkJwrcK0t98tOyn
	iJSoF0vCnzTakNINp/KLpCZuuI5BI2obj0eh0yUabQVMIaE7JmBcwT6gqyQZPmC2U/2i
	Raw329Nl7KTO/Gvdat+cQXjH/x3w2nDn2oMiZlBxHj43nNzzUQ7OQgVNqhs4mW7SvEtb
	8qm8gGDti33ud/XDsbieYA/Ui7G1G/qzikCKCx7nSwfSjV5U12pa5uqlRXf1eW7kSWk1
	Bh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dKwnz6WqgiBS94dE94SpgVINs7Oulw63wSV6pLrcpN4=;
	b=GO8bbvFUJjPrrF08jZ1JOaLWYs445te7Qu1D0ZbbmVpmaNMtUnTveaqLDLFHaf7kCU
	dFQkGvQgKmZ5E006YHvMSlF03XJeK7MqX1si/nqaMXIAX6bspb1UfNpr/X6Mq8jsEpoR
	PgOIqUkHmGudvg9HwjooxpOpxZKxQSKVxM9bySiHRyhXdW0ZhOwuS7Rza9X2kvmyxrQh
	CElEisz54Mnk4NzSAkVv8SrImsgo384bg426Kw6yO7paWzEi46ADf5E2uNQPnkewZTaY
	TifU8Lrj9E9/zlrORd3yK4kloZNq9nxQtEGmZHgKMQZ2jdMJIJkdlVbDM4GC7SNHmtjT
	O1hw==
X-Gm-Message-State: APf1xPDsnHHmRmhcNtdMahrWhkO/B2EEH0itGEnQOpwFw9uB1wZol04I
	lvo/redqkWGbkNAq1kw8NIR/EDCX
X-Google-Smtp-Source: AH8x2240k+pYycriWsOGK1lsn+bNH7G4LFNUXARjCJO8qMmWbGLXULcjCXsDKpXSec9qHk5sRl+zfg==
X-Received: by 10.107.176.14 with SMTP id z14mr13007536ioe.8.1518454353016;
	Mon, 12 Feb 2018 08:52:33 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:32 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:52:06 -0600
Message-Id: <84d3395ee219e9be7f64e38f41eb2d0b393996ea.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1518453683.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<cover.1518453683.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 11/17] icecc-create-env: Allow multiple tool aliases
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:32 -0000

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


