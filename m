Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B8A1171974
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 15:58:13 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 21 Sep 2016 08:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,374,1470726000"; d="scan'208";a="12190223"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga004.jf.intel.com with ESMTP; 21 Sep 2016 08:58:14 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 07:54:25 +0000
Message-Id: <facdb05bcfaa9eab9eed0b7db17fad854f6ec046.1474444335.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1474444335.git.mariano.lopez@linux.intel.com>
References: <cover.1474444335.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] toolchain-shar-relocate.sh: Add error-handling
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
X-List-Received-Date: Wed, 21 Sep 2016 15:58:14 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The relocation script of the SDK doesn't have enough
error handling when replacing host perl with SDK perl
or changing the symlinks. This will add those checks
along with a sanity check of xargs.

[YOCTO #10114]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/files/toolchain-shar-relocate.sh | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index d4bcf0e..e491153 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -1,3 +1,8 @@
+if ! xargs --version > /dev/null 2>&1; then
+	echo "xargs is required by the relocation script, please install it firts. Abort!"
+	exit 1
+fi
+
 # fix dynamic loader paths in all ELF SDK binaries
 native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
 dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
@@ -7,6 +12,10 @@ if [ "$dl_path" = "" ] ; then
 fi
 executable_files=$($SUDO_EXEC find $native_sysroot -type f \
 	\( -perm -0100 -o -perm -0010 -o -perm -0001 \) -printf "'%h/%f' ")
+if [ "x$executable_files" = "x" ]; then
+   echo "SDK relocate failed, could not get executalbe files"
+   exit 1
+fi
 
 tdir=`mktemp -d`
 if [ x$tdir = x ] ; then
@@ -14,7 +23,7 @@ if [ x$tdir = x ] ; then
    exit 1
 fi
 cat <<EOF >> $tdir/relocate_sdk.sh
-#!/bin/bash
+#!/bin/sh
 for py in python python2 python3
 do
 	PYTHON=\`which \${py} 2>/dev/null\`
@@ -53,9 +62,18 @@ done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
         -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" \
         -e "s: /usr/bin/perl: /usr/bin/env perl:g"
 
+if [ $? -ne 0 ]; then
+	echo "Failed to replace perl. Relocate script failed. Abort!"
+	exit 1
+fi
+
 # change all symlinks pointing to @SDKPATH@
 for l in $($SUDO_EXEC find $native_sysroot -type l); do
 	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
+	if [ $? -ne 0 ]; then
+		echo "Failed to setup symlinks. Relocate script failed. Abort!"
+		exit 1
+    fi
 done
 
 echo done
-- 
2.6.6


