Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6CCC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:30:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.29733.1644427846282682854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E96FA113E;
	Wed,  9 Feb 2022 09:30:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 649243F73B;
	Wed,  9 Feb 2022 09:30:45 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
Subject: [PATCH 2/2] kernel-module-split: modules should recommend the kernel
 image
Date: Wed,  9 Feb 2022 17:30:36 +0000
Message-Id: <20220209173036.3823144-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209173036.3823144-1-ross.burton@arm.com>
References: <20220209173036.3823144-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:30:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161576

Currently each split-out kernel module RDEPENDS on the top-level kernel
package (e.g. kernel-5.15-yocto-standard). Whilst at first this seems
correct, as modules obviously need their matching kernel, there are many
situations where the kernel is provided out-of-band and forcing the
kernel in via RDEPENDS in the wrong thing to do, for example an
initramfs really shouldn't contain a kernel image, but can contain
kernel modules.

Change the module splitting logic to use RRECOMMENDS instead of
RDEPENDS, and tighten the dependency to kernel-image instead of kernel
to pull in just the image, which also means PACKAGE_EXCLUDE =3D
"kernel-image-*" is sufficient to ensure the image doesn't get pulled
into an image.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/kernel-module-split.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kern=
el-module-split.bbclass
index a29c294810e..4429fee4b51 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -175,7 +175,7 @@ python split_kernel_module_packages () {
     module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
     module_pattern =3D module_pattern_prefix + kernel_package_name + '-m=
odule-%s' + module_pattern_suffix
=20
-    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descrip=
tion=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursiv=
e=3DTrue, hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_package=
_name, kernel_version))
+    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descrip=
tion=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursiv=
e=3DTrue, hook=3Dfrob_metadata, extra_recommends=3D'%s-image-%s' % (kerne=
l_package_name, kernel_version))
     if modules:
         d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
=20
--=20
2.25.1


