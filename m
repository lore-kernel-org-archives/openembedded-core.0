Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BF6E271AC5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 03:56:38 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g130so21515827wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 19:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4MvCKQYgvAQK5BRfBEe8TAcIr5qJaRQQAGkhLcA2Wcw=;
	b=oLhZ505rPzTJEdhoN3tQXIhyuenodQzKQkJAuLcJwjX2PJYO996AAFxFyXJj+3ecZY
	f3n1jZe0sXniRseTPv/FviKotwwYolmBMVN2M8zPbB6WH/FY7USXF9GNmso7xOuj6Bmf
	qOT8Ae0MNDCOfXXUqubvJnc/m+BtlT0BwfXevNpsUxSCrc3WbsZXRbczbjMEBfYRD0Ph
	Fv5xT1N+8IDHl8aAaCiK/McFuMj5DBQw5h0hG6G+A91MYFgBSgYwVZFkPlihZBzhw7LF
	Yrf3Jjd50R7MOXzCnMSH+a7lYtje/omCWxKKTVV6HvxIGbBkra8XOsxI3XM9jUciqv8r
	khQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4MvCKQYgvAQK5BRfBEe8TAcIr5qJaRQQAGkhLcA2Wcw=;
	b=t7dmuhJZjWfyjlzVcpuSp+Jz0QVHosA4/X3Gc4LfFLBdPDvQjaZxlXG9NuBmnFfgrB
	tMwGgzIxzQ+hHkDr5YrNz7EwE6ETTp9dmp73sArbg0j4J0HnaVplRTSYAxKiSr8woCD/
	VCJ/Aq3ptw2tcrKMa3DIR1Odqwbwt+ZqOdeTxPAkeXDW3Xs65luUvDF1cHaBaxUovbgw
	DnqWyWJ5MPWAQESuti1X0qYqHCGNV7FbJ5aD9OvLtbFztXv/gDVmCQGSoms8avW8NoPB
	OMnUTFJ0STMQp9zYgFuPhsd8e3fMEzarvP8gemAuOXhbUyF2m4XoKa6suxRdDlJU8a8+
	omyg==
X-Gm-Message-State: AJaThX6+gf4lLY6mlKd8/r7baZpgJ+P00kvI/EIXvCuxYojaANjT+dMQ
	vxQrTtHL7SeslIE6D7+PIpWiLQ==
X-Google-Smtp-Source: AGs4zMaeFAsHmO0RrDFhIV5fxI1QNMy2GH5/4RGaoMjAOTogtQsZCVhAkVTytpdmZHAhj0drKa36Ig==
X-Received: by 10.80.204.152 with SMTP id q24mr38536376edi.108.1512532599062; 
	Tue, 05 Dec 2017 19:56:39 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58])
	by smtp.gmail.com with ESMTPSA id c2sm773605edi.66.2017.12.05.19.56.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Dec 2017 19:56:38 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Dec 2017 04:54:31 +0100
Message-Id: <1512532471-15979-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] toolchain-shar-relocate.sh: let $relocate control the entire script
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
X-List-Received-Date: Wed, 06 Dec 2017 03:56:39 -0000

From: Ming Liu <liu.ming50@gmail.com>

There is a series of checking/substituting being processed in this
script, I would like them to be controlled together by $relocate which
make more sense from my point of view rather than it only controls
relocate_sdk.sh. And another reason why we need this fix, is that
sometimes we do not install nativesdk ld-linux.so or other nativesdk
packages if we not want do relocate, which can save some space and
reduce build time for us, but in that case the SDK installer will fail
on some sanity checks without this fix.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/files/toolchain-shar-relocate.sh | 101 +++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 51 deletions(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index e3c1001..04e7582 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -1,28 +1,29 @@
-if ! xargs --version > /dev/null 2>&1; then
-	echo "xargs is required by the relocation script, please install it first. Abort!"
-	exit 1
-fi
+if [ $relocate = 1 ] ; then
+    if ! xargs --version > /dev/null 2>&1; then
+        echo "xargs is required by the relocation script, please install it first. Abort!"
+        exit 1
+    fi
 
-# fix dynamic loader paths in all ELF SDK binaries
-native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
-dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
-if [ "$dl_path" = "" ] ; then
-	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
-	exit 1
-fi
-executable_files=$($SUDO_EXEC find $native_sysroot -type f \
-	\( -perm -0100 -o -perm -0010 -o -perm -0001 \) -printf "'%h/%f' ")
-if [ "x$executable_files" = "x" ]; then
-   echo "SDK relocate failed, could not get executalbe files"
-   exit 1
-fi
+    # fix dynamic loader paths in all ELF SDK binaries
+    native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
+    dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
+    if [ "$dl_path" = "" ] ; then
+        echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
+        exit 1
+    fi
+    executable_files=$($SUDO_EXEC find $native_sysroot -type f \
+        \( -perm -0100 -o -perm -0010 -o -perm -0001 \) -printf "'%h/%f' ")
+    if [ "x$executable_files" = "x" ]; then
+       echo "SDK relocate failed, could not get executalbe files"
+       exit 1
+    fi
 
-tdir=`mktemp -d`
-if [ x$tdir = x ] ; then
-   echo "SDK relocate failed, could not create a temporary directory"
-   exit 1
-fi
-cat <<EOF >> $tdir/relocate_sdk.sh
+    tdir=`mktemp -d`
+    if [ x$tdir = x ] ; then
+       echo "SDK relocate failed, could not create a temporary directory"
+       exit 1
+    fi
+    cat <<EOF >> $tdir/relocate_sdk.sh
 #!/bin/sh
 for py in python python2 python3
 do
@@ -39,22 +40,20 @@ fi
 \${PYTHON} ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files
 EOF
 
-$SUDO_EXEC mv $tdir/relocate_sdk.sh ${env_setup_script%/*}/relocate_sdk.sh
-$SUDO_EXEC chmod 755 ${env_setup_script%/*}/relocate_sdk.sh
-rm -rf $tdir
-if [ $relocate = 1 ] ; then
-	$SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.sh
-	if [ $? -ne 0 ]; then
-		echo "SDK could not be set up. Relocate script failed. Abort!"
-		exit 1
-	fi
-fi
+    $SUDO_EXEC mv $tdir/relocate_sdk.sh ${env_setup_script%/*}/relocate_sdk.sh
+    $SUDO_EXEC chmod 755 ${env_setup_script%/*}/relocate_sdk.sh
+    rm -rf $tdir
+    $SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.sh
+    if [ $? -ne 0 ]; then
+        echo "SDK could not be set up. Relocate script failed. Abort!"
+        exit 1
+    fi
 
-# replace @SDKPATH@ with the new prefix in all text files: configs/scripts/etc.
-# replace the host perl with SDK perl.
-for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
-	$SUDO_EXEC find $replace -type f
-done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
+    # replace @SDKPATH@ with the new prefix in all text files: configs/scripts/etc.
+    # replace the host perl with SDK perl.
+    for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
+        $SUDO_EXEC find $replace -type f
+    done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
     awk -F':' '{printf "\"%s\"\n", $1}' | \
     grep -Ev "$target_sdk_dir/(environment-setup-*|relocate_sdk*|${0##*/})" | \
     xargs -n100 $SUDO_EXEC sed -i \
@@ -62,18 +61,18 @@ done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
         -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" \
         -e "s: /usr/bin/perl: /usr/bin/env perl:g"
 
-if [ $? -ne 0 ]; then
-	echo "Failed to replace perl. Relocate script failed. Abort!"
-	exit 1
-fi
-
-# change all symlinks pointing to @SDKPATH@
-for l in $($SUDO_EXEC find $native_sysroot -type l); do
-	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
-	if [ $? -ne 0 ]; then
-		echo "Failed to setup symlinks. Relocate script failed. Abort!"
-		exit 1
+    if [ $? -ne 0 ]; then
+        echo "Failed to replace perl. Relocate script failed. Abort!"
+        exit 1
     fi
-done
 
-echo done
+    # change all symlinks pointing to @SDKPATH@
+    for l in $($SUDO_EXEC find $native_sysroot -type l); do
+        $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
+        if [ $? -ne 0 ]; then
+            echo "Failed to setup symlinks. Relocate script failed. Abort!"
+            exit 1
+        fi
+    done
+    echo done
+fi
-- 
2.7.4


