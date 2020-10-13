Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.9966.1602589461142311586
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 04:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iQ+fJ69h;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: rehsack@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id g4so20599581edk.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=KJM6h+o2OVORjDdzzL1QgRzpZ700OEpHFVZ0JjeBK8E=;
        b=iQ+fJ69h69xg2uy6AdEj557QVAVPH1A9bQ0yJ4g5auStJ4KShfNT5PzAmxSG4ubPId
         QceK/rCIzfo7MrzeXgsEHyibi/9OqdmKPfQOdd0OujBKgJKPQ+rsuYgMtztXUVb9MAbV
         wJkCAdVc63Y3eX5bb0raRebgX/wKMtZRJE6CtGAYuVo/VmhHB3lC4KZ5nLVdG2rio+AW
         DwUiXJZtUbTjbOji5tWSwKZ1YQFRQOvd+Qz4xn6xrJ8m/dZTOSko+qb9VcYo3lk744Op
         0beJCKa9qw4byXYQ2Ppcj96qFOMq+uaIToUTDJ6IU+pgmuiQP0EKUfJIDO94nP1kpmbw
         1lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=KJM6h+o2OVORjDdzzL1QgRzpZ700OEpHFVZ0JjeBK8E=;
        b=KmYXjE9P+WE6ODN4mVAfA9l0VicMCfMu3+tFDFCz1sNC6DTFeEds8M8u/Dhp5vW1OY
         UxUtnhG2oAbG+W7X8ht7kIZLzNOWEOeR6rSH29Blvxkt3YoZDBDeTXCiTkbm+M6d5kMm
         vxLphOUJMMcovhdSK4RHx2s4jYFim6nRkMyAC5ca0TFHQ1+I5h8CX+6hw+UiRu4AOwDm
         lmfJ3HplX98HTgSE/OdFkpmWr8gsVMbvBHJPXrrsm68S+4ZRLzm1VwilzHDrHfarjiBC
         ru4R6wnLHpeICZa53rkDwEKV/FjLRt5qiWIVgBLUsydvIapbkSuUwnIYjeFyKcQDcQOZ
         fktg==
X-Gm-Message-State: AOAM532kvMTktuGHQ6IMkqOwe0vJUyIPtW3fywLAYFufHvlhMYdIKaAa
	+IZDCm1hkIVYosiT42r9kHhmUeGsdfc=
X-Google-Smtp-Source: ABdhPJww0Gnj4QR44DirkleSVFiVkvK+uu3hWPtBTVDGzeABWt17lCorX0+C7SJWfEBRu5y2q6AfdA==
X-Received: by 2002:a05:6402:651:: with SMTP id u17mr19075660edx.206.1602589459092;
        Tue, 13 Oct 2020 04:44:19 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p5b25b0d4.dip0.t-ipconnect.de. [91.37.176.212])
        by smtp.gmail.com with ESMTPSA id k11sm12235200eji.72.2020.10.13.04.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 04:44:18 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jens Rehsack <sno@netbsd.org>
Subject: [OE-Core][PATCH] toolchain-scripts: replace `` by $()
Date: Tue, 13 Oct 2020 13:43:50 +0200
Message-Id: <20201013114350.3078-1-sno@NetBSD.org>
X-Mailer: git-send-email 2.17.1

From: Jens Rehsack <sno@netbsd.org>

Replace backticks (``) in toolchain-scripts with $() to separate 'style'
changes from technical changes when stacking is needed.
Most shell script coding styles meanwhile encourage $() ...

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/toolchain-scripts.bbclass |  6 +++---
 meta/files/toolchain-shar-extract.sh   | 14 +++++++-------
 meta/files/toolchain-shar-relocate.sh  |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index db1d3215ef..d0e0c1aad3 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -66,7 +66,7 @@ toolchain_create_tree_env_script () {
 	script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 	rm -f $script
 	touch $script
-	echo 'orig=`pwd`; cd ${COREBASE}; . ./oe-init-build-env ${TOPDIR}; cd $orig' >> $script
+	echo 'orig=$(pwd); cd ${COREBASE}; . ./oe-init-build-env ${TOPDIR}; cd $orig' >> $script
 	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${STAGING_BINDIR_TOOLCHAIN}:$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
 	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
@@ -178,8 +178,8 @@ toolchain_create_sdk_siteconfig () {
 	for sitefile in ${TOOLCHAIN_NEED_CONFIGSITE_CACHE}; do
 		# Resolve virtual/* names to the real recipe name using sysroot-providers info
 		case $sitefile in virtual/*)
-			sitefile=`echo $sitefile | tr / _`
-			sitefile=`cat ${STAGING_DIR_TARGET}/sysroot-providers/$sitefile`
+			sitefile=$(echo $sitefile | tr / _)
+			sitefile=$(cat ${STAGING_DIR_TARGET}/sysroot-providers/$sitefile)
 		esac
 
 		if [ -r ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config ]; then
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 04527f891f..1ae1aff15e 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -7,7 +7,7 @@ INIT_PYTHON=$(which python3 2>/dev/null )
 [ -z "$INIT_PYTHON" ] && echo "Error: The SDK needs a python installed" && exit 1
 
 # Remove invalid PATH elements first (maybe from a previously setup toolchain now deleted
-PATH=`$INIT_PYTHON -c 'import os; print(":".join(e for e in os.environ["PATH"].split(":") if os.path.exists(e)))'`
+PATH=$($INIT_PYTHON -c 'import os; print(":".join(e for e in os.environ["PATH"].split(":") if os.path.exists(e)))')
 
 tweakpath () {
     case ":${PATH}:" in
@@ -30,14 +30,14 @@ INST_GCC_VER=$(gcc --version | sed -ne 's/.* \([0-9]\+\.[0-9]\+\)\.[0-9]\+.*/\1/
 SDK_GCC_VER='@SDK_GCC_VER@'
 
 verlte () {
-	[  "$1" = "`printf "$1\n$2" | sort -V | head -n1`" ]
+	[  "$1" = "$(printf "$1\n$2" | sort -V | head -n1)" ]
 }
 
 verlt() {
 	[ "$1" = "$2" ] && return 1 || verlte $1 $2
 }
 
-verlt `uname -r` @OLDEST_KERNEL@
+verlt $(uname -r) @OLDEST_KERNEL@
 if [ $? = 0 ]; then
 	echo "Error: The SDK needs a kernel > @OLDEST_KERNEL@"
 	exit 1
@@ -178,9 +178,9 @@ if [ "$SDK_EXTENSIBLE" = "1" ]; then
 	# The build system doesn't work well with /tmp on NFS
 	fs_dev_path="$target_sdk_dir"
 	while [ ! -d "$fs_dev_path" ] ; do
-		fs_dev_path=`dirname $fs_dev_path`
+		fs_dev_path=$(dirname $fs_dev_path)
         done
-	fs_dev_type=`stat -f -c '%t' "$fs_dev_path"`
+	fs_dev_type=$(stat -f -c '%t' "$fs_dev_path")
 	if [ "$fsdevtype" = "6969" ] ; then
 		echo "The target directory path $target_sdk_dir is on NFS, this is not possible. Abort!"
 		exit 1
@@ -256,7 +256,7 @@ echo "done"
 printf "Setting it up..."
 # fix environment paths
 real_env_setup_script=""
-for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
+for env_setup_script in $(ls $target_sdk_dir/environment-setup-*); do
 	if grep -q 'OECORE_NATIVE_SYSROOT=' $env_setup_script; then
 		# Handle custom env setup scripts that are only named
 		# environment-setup-* so that they have relocation
@@ -288,7 +288,7 @@ fi
 
 echo "SDK has been successfully set up and is ready to be used."
 echo "Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g."
-for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
+for env_setup_script in $(ls $target_sdk_dir/environment-setup-*); do
 	echo " \$ . $env_setup_script"
 done
 
diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index e3c10018ef..f529a96da3 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -17,7 +17,7 @@ if [ "x$executable_files" = "x" ]; then
    exit 1
 fi
 
-tdir=`mktemp -d`
+tdir=$(mktemp -d)
 if [ x$tdir = x ] ; then
    echo "SDK relocate failed, could not create a temporary directory"
    exit 1
@@ -26,7 +26,7 @@ cat <<EOF >> $tdir/relocate_sdk.sh
 #!/bin/sh
 for py in python python2 python3
 do
-	PYTHON=\`which \${py} 2>/dev/null\`
+	PYTHON=\$(which \${py} 2>/dev/null)
 	if [ \$? -eq 0 ]; then
 		break;
 	fi
-- 
2.17.1

