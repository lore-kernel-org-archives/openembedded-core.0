Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 640B06AD45
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 04:38:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5Q4cuMv006451
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 21:38:56 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 25 Jun 2013 21:38:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jun 2013 12:38:48 +0800
Message-ID: <0b1fb9cdba7112c18f686cafb277101f5f0bacf2.1372215660.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372215660.git.hongxu.jia@windriver.com>
References: <cover.1372215660.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] adt_installer_internal:add sudo when permission deny on installation directory
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
X-List-Received-Date: Wed, 26 Jun 2013 04:38:53 -0000
Content-Type: text/plain

When the user doesn't have rights to access the installation directory,
the sdk installation will fail, add sudo to fix this.

[YOCTO #4760]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../installer/adt-installer/scripts/adt_installer_internal            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 16677e7..175d285 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -199,7 +199,7 @@ escaped_sdkpath=$(echo $DEFAULT_INSTALL_FOLDER |sed -e "s:[\+\.]:\\\\\\\\\0:g")
 
 # We don't change the script in-place since we may want the user to re-run
 # adt-installer script
-$SUDO sed -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" scripts/relocate_sdk.py > scripts/relocate_sdk_tmp.py
+$SUDO sh -c "sed -e '"s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:"' scripts/relocate_sdk.py > scripts/relocate_sdk_tmp.py"
 $SUDO chmod +x scripts/relocate_sdk_tmp.py
 
 dl_path=$(find $OECORE_NATIVE_SYSROOT/lib -name "ld-linux*")
@@ -258,7 +258,7 @@ qemu_type=`echo "$1" | sed -e 's/x86_64/x86-64/'`
 sysroot_image_name="core-image-$target_sysroot_image-qemu$qemu_type.tar.bz2"
     #echo_info "Extracting rootfs: $sysroot_image_name, using pseudo..."
 
-scripts/extract_rootfs $sysroot_image_name $target_sysroot $OECORE_NATIVE_SYSROOT $user_inst_type
+$SUDO scripts/extract_rootfs $sysroot_image_name $target_sysroot $OECORE_NATIVE_SYSROOT $user_inst_type
 check_result
 
 echo_info "Updating environment script with target sysroot location."
-- 
1.8.1.2


