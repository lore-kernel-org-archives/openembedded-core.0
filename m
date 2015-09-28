Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 77609755FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 07:09:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8S79lrj006177
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 00:09:47 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 28 Sep 2015 00:09:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Sep 2015 00:09:46 -0700
Message-ID: <c863983a0f775079fa0bff7983be09ae6841e923.1443424138.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1443424138.git.liezhi.yang@windriver.com>
References: <cover.1443424138.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] toolchain-shar-relocate.sh: make it faster
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
X-List-Received-Date: Mon, 28 Sep 2015 07:09:50 -0000
Content-Type: text/plain

Make the extrating faster by:
* Merge the two heavy t"for .. find" loops into one
* Move the commands out of for loop rather than inside, this can reduce the
  forking amount.

As a result, when install:
* buildtools-nativesdk-standalone: 14s -> 7s (50% saved)
* core-image-minimal-core2-64-toolchain: 56s -> 47s (17% saved)

[YOCTO #8404]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/files/toolchain-shar-relocate.sh |   24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index dfb8e16..4ef2927 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -26,25 +26,21 @@ if [ $relocate = 1 ] ; then
 	fi
 fi
 
-# replace @SDKPATH@ with the new prefix in all text files: configs/scripts/etc
+# replace @SDKPATH@ with the new prefix in all text files: configs/scripts/etc.
+# replace the host perl with SDK perl.
 for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
-	$SUDO_EXEC find $replace -type f -exec file '{}' \; | \
-		grep ":.*\(ASCII\|script\|source\).*text" | \
-		awk -F':' '{printf "\"%s\"\n", $1}' | \
-		grep -v "$target_sdk_dir/environment-setup-*" | \
-		$SUDO_EXEC xargs -n32 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
-done
+	$SUDO_EXEC find $replace -type f
+done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
+    awk -F':' '{printf "\"%s\"\n", $1}' | \
+    grep -v "$target_sdk_dir/environment-setup-*" | \
+    xargs -n100 $SUDO_EXEC sed -i \
+        -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" \
+        -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" \
+        -e "s: /usr/bin/perl: /usr/bin/env perl:g"
 
 # change all symlinks pointing to @SDKPATH@
 for l in $($SUDO_EXEC find $native_sysroot -type l); do
 	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
 done
 
-# find out all perl scripts in $native_sysroot and modify them replacing the
-# host perl with SDK perl.
-for perl_script in $($SUDO_EXEC find $native_sysroot -type f -exec grep -l "^#!.*perl" '{}' \;); do
-	$SUDO_EXEC sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
-		"s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
-done
-
 echo done
-- 
1.7.9.5


