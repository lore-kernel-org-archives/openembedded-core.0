Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id D4DBC7826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:29 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id f4so17972041ioh.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/CXlxm0an0A8r6l9MFqX8olR6cf7GUFrrQcIXER6JBE=;
	b=KbK0B7GdatMqHRx0ql8/Cp9CuzExlc+Fns95Qh/WUXXFZi8K6X4rd4ccfGIeyi0xxx
	H9sDn6HDchnt21VOguxNx2b4QwGWJUd4EkEw3D2mGU5Ezs8SDAmSw9Zvez4mrgS1KSaL
	CH6RtaMcVxkkJCpGXw7izEhELxkQBwclSzZ8azuMXBTTXWMV44jjN15A0v0eq+7yaxR/
	grXfnVTBS9aw3JZjs3ZKr29r/P8YMq+MZQNh3ZwK4j1+xICrJV8CscCl/K+kfGlwMcTo
	BmJnxgim7yeOhRcIYwLplGrVZ/TwDHxGasqBUKO4nYX9GOla4vpy/gBBa+oH64PboZTw
	5CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/CXlxm0an0A8r6l9MFqX8olR6cf7GUFrrQcIXER6JBE=;
	b=kyP8ts4Q7tFbWl04Qc2t+/+97+9zPS+3Xbfkl1LRiY9zHOHShrjnWBQwQXKZ88hzq7
	p0vABKPXjZWhJp0VLA6uxiybz3GqKs3q2ur3gfPz1NdSkiGxpN8Mifk0iV52kwmR7MlV
	LON1+nVNwycINOO9vA0fDCT1e+MpPiJ+Dq3sBdORe6J70pmAKiD+7QH9UQGLJP9yCim+
	mAdrGS7cVV0K1Rl01nsecdHREkQs1ppN6BQEJJaXPNUJ6XQswPJ5GMLgJloQeKAxgz2l
	yg4ihq6PA9lHAnvtW5M1HOiWUhf84hCZPDpLeBsFA9wO983X7PVjbhNFCJ5oXvnJNIKw
	QVng==
X-Gm-Message-State: APf1xPBIgkpOU8I32zTzttAE7Vs/a4upMyakreHEAyJDpc/aFrSiNh6P
	wyeXRe7JxqenNSw2jjPdnU4Ot2qi
X-Google-Smtp-Source: AH8x225iv8v5cgX3LRvmWekmQjItjNXMN67sM5ba1ZEYNoKf8cHwuDk9kOiN6EIijZc4Gim/cLkfTw==
X-Received: by 10.107.158.77 with SMTP id h74mr8294944ioe.262.1518454351188;
	Mon, 12 Feb 2018 08:52:31 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:30 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:52:04 -0600
Message-Id: <c48ec67f93383f915a37c3d659b0b03d4da9cd13.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1518453683.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<cover.1518453683.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 09/17] icecc-create-env: Fix executable rpaths
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:30 -0000

Executables in the toolchain archive occasionally contain runtime
library search paths (RPATH) that use the $ORIGIN placeholder. However,
in order for that placeholder to work, /proc must be mounted. When
iceccd executes the toolchain in the chroot environment, it doesn't
mount /proc, so it is unable to resolve $ORIGIN resulting in a failure
to find dynamic libraries.

The fix is to replace $ORIGIN in executable RPATH entries with the known
chroot executable path. In order for this to work, the actual real path
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


