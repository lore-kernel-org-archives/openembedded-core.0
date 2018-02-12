Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 637877826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:28 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id g14so11766413iob.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Bao+UzTgIvgNBwswqMWw85SCIcSIWoOCmqrowjdaFgc=;
	b=Yro7j316DP9uwg/Dxzx0805wlyKGwWqjh1oU+jykCDrchmXoex8o5F+0rx0t6FBr2s
	RNWW73+g4qkw8LMT3Uyjup1EyOIuTNNatADSH7HptD0aEDzPFt1BRunMloZd9WwfGqGE
	hnX2X1UriLPoE3lW9ZMD3k0qEFeOyWJrsfUmIpVITiSV0604aYLffXbAa/rqRTFnKKb5
	cFeuc6y1HnCIoVnCZn0P4q2LmnhgK15m7FZA41mONqBHwJZL8UYA6QgxITi2AWLgHvtw
	QaOUAJXlnAD+UFoUpKgOrfSf2pI4hn5wzwTFpIRiTkt8MFzVvUUU+vaGknUHrY/fX3Jc
	wKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Bao+UzTgIvgNBwswqMWw85SCIcSIWoOCmqrowjdaFgc=;
	b=CM5ddjOfFee1LBHAtIIQl00JOcrsHb7waTX0WHtB4O478oMkwUEQrvqRDc6AxDPRxN
	0wwhsr19teq/Ivy6QzXbmeK2XYovOHkhZchfeqTQtHssLioQLaKQMR/HJTjbRcEuMXjs
	PMiQ87RLearzjKovXq9EnRvqeqgRc3Jz8Kz1nb7pf5uoRAsQeNA+h7lvusYj8uT7tjV3
	hIzajQSGIsEQkfnfmCR1NqEy3nsmlDnjSdSiSCAdJNR/tNn/n8eF0EQGPWn602U51vWv
	P1470c8lYmyZk7AJuhISFBCLJoFYHBydbMgyGwgxJnvWES7N0Un2ylLMLnQSVcovTQTd
	Pp1g==
X-Gm-Message-State: APf1xPC13AnbabDjNPmftbtot8nW1oNoGwiUjceEIaNi59vtbuqnzJko
	tT8q7vxqoQdYW7ovdEzPZaM+tLWX
X-Google-Smtp-Source: AH8x226xMrMS29CS+BmOPsV1AG7ovXySHKJBQrI86HIyW8bUg2fam0KiVuS4MKER/aRVtp65DCSjWw==
X-Received: by 10.107.111.2 with SMTP id k2mr13183147ioc.11.1518454349651;
	Mon, 12 Feb 2018 08:52:29 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:29 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:52:02 -0600
Message-Id: <70f9c82cbb4e0b8f715df5e664d37b483dce5177.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1518453683.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<cover.1518453683.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 07/17] icecc-create-env: Symlink alternate names
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:28 -0000

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


