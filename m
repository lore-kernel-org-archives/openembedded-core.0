Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184E7C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 18:07:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8684.1647022043112148293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 10:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: diego.sueiro@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 379A4175A;
	Fri, 11 Mar 2022 10:07:22 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A38ED3FA45;
	Fri, 11 Mar 2022 10:07:21 -0800 (PST)
From: Diego Sueiro <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] grub-efi: Add option to include all available modules
Date: Fri, 11 Mar 2022 18:07:12 +0000
Message-Id: 
 <70d715ed8ec47c9dffdd563749f3825d055c805e.1647010520.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 18:07:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163074

Include all available modules If 'all' is present in GRUB_BUILDIN variabl=
e.
To achieve this we need to search for all .mod files in ${B}/grub-core/ a=
nd
pass them to grub-mkimage command.

Also, add the verbose option to grub-mkimage.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta/recipes-bsp/grub/grub-efi_2.06.bb | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.06.bb b/meta/recipes-bsp/gr=
ub/grub-efi_2.06.bb
index df5f23e22e..9857e8e036 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.06.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.06.bb
@@ -46,11 +46,21 @@ EXTRA_OECONF +=3D "--enable-efiemu=3Dno"
=20
 do_mkimage() {
 	cd ${B}
+
+	GRUB_MKIMAGE_MODULES=3D"${GRUB_BUILDIN}"
+
+	# If 'all' is included in GRUB_BUILDIN we will include all available gr=
ub2 modules
+	if [ "${@ bb.utils.contains('GRUB_BUILDIN', 'all', 'True', 'False', d)}=
" =3D "True" ]; then
+		bbdebug 1 "Including all available modules"
+		# Get the list of all .mod files in grub-core build directory
+		GRUB_MKIMAGE_MODULES=3D$(find ${B}/grub-core/ -type f -name "*.mod" -e=
xec basename {} .mod \;)
+	fi
+
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
-	grub-mkimage -c ../cfg -p ${EFIDIR} -d ./grub-core/ \
+	grub-mkimage -v -c ../cfg -p ${EFIDIR} -d ./grub-core/ \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IM=
AGE} \
-	               ${GRUB_BUILDIN}
+	               ${GRUB_MKIMAGE_MODULES}
 }
=20
 addtask mkimage before do_install after do_compile
@@ -70,6 +80,7 @@ do_install() {
     install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${D}${EFI_FILE=
S_PATH}/${GRUB_IMAGE}
 }
=20
+# To include all available modules, add 'all' to GRUB_BUILDIN
 GRUB_BUILDIN ?=3D "boot linux ext2 fat serial part_msdos part_gpt normal=
 \
                  efi_gop iso9660 configfile search loadenv test"
=20
--=20
2.35.1


