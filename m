Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A5BC7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 13:20:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14644.1750339252055456608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 06:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 980A412FC
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 06:20:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D2E53F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 06:20:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/4] scripts/test-remote-image: remove useless postconfig arguments
Date: Thu, 19 Jun 2025 14:20:43 +0100
Message-ID: <20250619132045.1521932-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619132045.1521932-1-ross.burton@arm.com>
References: <20250619132045.1521932-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 13:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219078

I can't see a reason for this script to need to use postconfig files
to bounce a variable assignment through another, so remove them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/test-remote-image | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/test-remote-image b/scripts/test-remote-image
index d209d228544..1d018992b07 100755
--- a/scripts/test-remote-image
+++ b/scripts/test-remote-image
@@ -152,8 +152,7 @@ class AutoTargetProfile(BaseTargetProfile):
         return controller
=20
     def set_kernel_file(self):
-        postconfig =3D "QA_GET_MACHINE =3D \"${MACHINE}\""
-        machine =3D get_bb_var('QA_GET_MACHINE', postconfig=3Dpostconfig=
)
+        machine =3D get_bb_var('MACHINE')
         self.kernel_file =3D self.kernel_type + '-' + machine + '.bin'
=20
     def set_rootfs_file(self):
@@ -215,13 +214,11 @@ class PublicAB(BaseRepoProfile):
     def get_repo_path(self):
         path =3D '/machines/'
=20
-        postconfig =3D "QA_GET_MACHINE =3D \"${MACHINE}\""
-        machine =3D get_bb_var('QA_GET_MACHINE', postconfig=3Dpostconfig=
)
+        machine =3D get_bb_var('MACHINE')
         if 'qemu' in machine:
             path +=3D 'qemu/'
=20
-        postconfig =3D "QA_GET_DISTRO =3D \"${DISTRO}\""
-        distro =3D get_bb_var('QA_GET_DISTRO', postconfig=3Dpostconfig)
+        distro =3D get_bb_var('DISTRO')
         path +=3D distro.replace('poky', machine) + '/'
         return path
=20
--=20
2.43.0


