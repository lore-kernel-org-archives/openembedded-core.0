Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537C2D36119
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 19:49:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29423.1730836143731408218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 11:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C5CA1063
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 11:49:33 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C13073F528
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 11:49:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] selftest/container: fix IMAGE_FEATURES assignment
Date: Tue,  5 Nov 2024 19:48:54 +0000
Message-Id: <20241105194857.3351281-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 19:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206748

Assigning IMAGE_FEATURES=3D"" in local.conf doesn't actually do anything
useful, as bitbake.conf has IMAGE_FEATURES +=3D EXTRA_IMAGE_FEATURES afte=
r
the include of local.conf.

In this test case, this results in IMAGE_FEATURES still using
EXTRA_IMAGE_FEATURES, so the image contains the files installed by the
post-install-logging feature.

As the intention here is that container-test-image is as minimal as
possible, move the IMAGE_FEATURES assignment into the image itself so
it actually works, and update the expected file list to remove the
post-install-logging files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-test/container-image/container-test-image.bb       | 1 +
 meta/lib/oeqa/selftest/cases/containerimage.py                 | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-selftest/recipes-test/container-image/container-test-im=
age.bb b/meta-selftest/recipes-test/container-image/container-test-image.=
bb
index d5f939c6e98..26b6409d1d6 100644
--- a/meta-selftest/recipes-test/container-image/container-test-image.bb
+++ b/meta-selftest/recipes-test/container-image/container-test-image.bb
@@ -4,5 +4,6 @@ LICENSE =3D "MIT"
=20
 IMAGE_FSTYPES =3D "container"
 IMAGE_LINGUAS =3D ""
+IMAGE_FEATURES =3D ""
=20
 inherit core-image
diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oe=
qa/selftest/cases/containerimage.py
index 23c0a1408a3..d1ac305a845 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -42,7 +42,6 @@ class ContainerImageTests(OESelftestTestCase):
         self.write_config("""PREFERRED_PROVIDER_virtual/kernel =3D "linu=
x-dummy"
 IMAGE_FSTYPES =3D "container"
 PACKAGE_CLASSES =3D "package_ipk"
-IMAGE_FEATURES =3D ""
 IMAGE_BUILDINFO_FILE =3D ""
 INIT_MANAGER =3D "sysvinit"
 IMAGE_INSTALL:remove =3D "ssh-pregen-hostkeys"
@@ -55,8 +54,6 @@ IMAGE_INSTALL:remove =3D "ssh-pregen-hostkeys"
         expected_files =3D [
                     './',
                     '.{bindir}/theapp',
-                    '.{sysconfdir}/default/',
-                    '.{sysconfdir}/default/postinst',
                     '.{sysconfdir}/ld.so.cache',
                     '.{sysconfdir}/timestamp',
                     '.{sysconfdir}/version',
--=20
2.34.1


