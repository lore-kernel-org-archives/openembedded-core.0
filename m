Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA116C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1542.1668022313087574989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0380323A;
	Wed,  9 Nov 2022 11:31:59 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60A9D3F703;
	Wed,  9 Nov 2022 11:31:52 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 15/15] classes/testexport: move to classes-recipe
Date: Wed,  9 Nov 2022 19:31:35 +0000
Message-Id: <20221109193135.291048-15-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193135.291048-1-ross.burton@arm.com>
References: <20221109193135.291048-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173048

This class should be in classes-recipe as, like testimage, it is specific
to image recipes.

This also solves a regression where simply IMAGE_CLASSES +=3D "testexport=
"
doesn't work if testimage isn't already in IMAGE_CLASSES. The testexport
class adds testimage to IMAGE_CLASSES, but by this point it's too late.
Now that the class can only be inherited via IMAGE_CLASSES, we can
simply inherit testimage directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/{classes =3D> classes-recipe}/testexport.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/{classes =3D> classes-recipe}/testexport.bbclass (98%)

diff --git a/meta/classes/testexport.bbclass b/meta/classes-recipe/testex=
port.bbclass
similarity index 98%
rename from meta/classes/testexport.bbclass
rename to meta/classes-recipe/testexport.bbclass
index f7c5242dc5e..0f0c56107f8 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -7,12 +7,14 @@
 # To use it add testexport to global inherit and call your target image =
with -c testexport
 # You can try it out like this:
 # - First build an image. i.e. core-image-sato
-# - Add INHERIT +=3D "testexport" in local.conf
+# - Add IMAGE_CLASSES +=3D "testexport" in local.conf
 # - Then bitbake core-image-sato -c testexport. That will generate the d=
irectory structure
 #   to execute the runtime tests using runexported.py.
 #
 # For more information on TEST_SUITES check testimage class.
=20
+inherit testimage
+
 TEST_LOG_DIR ?=3D "${WORKDIR}/testexport"
 TEST_EXPORT_DIR ?=3D "${TMPDIR}/testexport/${PN}"
 TEST_EXPORT_PACKAGED_DIR ?=3D "packages/packaged"
@@ -176,5 +178,3 @@ def testexport_create_tarball(d, tar_name, src_dir):
     tar.add(base_name)
     tar.close()
     os.chdir(current_dir)
-
-IMAGE_CLASSES +=3D "testimage"
--=20
2.34.1


