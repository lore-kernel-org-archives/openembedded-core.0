Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15BEC43217
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1501.1668022307744120925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93D2923A;
	Wed,  9 Nov 2022 11:31:53 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F11EB3F703;
	Wed,  9 Nov 2022 11:31:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 07/15] oeqa/selftest/imagefeatures: set a .wks in test_fs_types
Date: Wed,  9 Nov 2022 19:31:27 +0000
Message-Id: <20221109193135.291048-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193135.291048-1-ross.burton@arm.com>
References: <20221109193135.291048-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173040

Set WKS_FILE to wictestdisk.wks, which is a very simple Wic file that
simply contains the root filesystem.  It may not actually boot but this
test doesn't care, and it does exercise the wic image construction on
all machines.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeq=
a/selftest/cases/imagefeatures.py
index df796eaed09..af38150613b 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -206,9 +206,12 @@ class ImageFeatures(OESelftestTestCase):
         skip_image_types =3D set(('container', 'elf', 'f2fs', 'multiubi'=
, 'tar.zst', 'wic.zst', 'squashfs-lzo'))
         img_types =3D all_image_types - skip_image_types
=20
-        config =3D 'IMAGE_FSTYPES +=3D "%s"\n'\
-                 'MKUBIFS_ARGS ?=3D "-m 2048 -e 129024 -c 2047"\n'\
-                 'UBINIZE_ARGS ?=3D "-m 2048 -p 128KiB -s 512"' % ' '.jo=
in(img_types)
+        config =3D """
+IMAGE_FSTYPES +=3D "%s"
+WKS_FILE =3D "wictestdisk.wks"
+MKUBIFS_ARGS ?=3D "-m 2048 -e 129024 -c 2047"
+UBINIZE_ARGS ?=3D "-m 2048 -p 128KiB -s 512"
+""" % ' '.join(img_types)
         self.write_config(config)
=20
         bitbake(image_name)
--=20
2.34.1


