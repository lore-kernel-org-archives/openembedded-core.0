Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EEFC4321E
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.654.1648751360410980869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1CD213D5
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 639B33F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/23] oeqa/selftest/buildoptions: set PACKAGE_CLASSES in
 test_arch_work_dir_and_export_source
Date: Thu, 31 Mar 2022 19:29:01 +0100
Message-Id: <20220331182915.22128-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163850

test_arch_work_dir_and_export_source uses the archiver to generate SRPMS,
so explicitly set PACKAGE_CLASSES to ensure that package_rpm is used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa=
/selftest/cases/buildoptions.py
index bfe613b847a..135e88e1f06 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -177,7 +177,12 @@ class ArchiverTest(OESelftestTestCase):
         """
         Test for archiving the work directory and exporting the source f=
iles.
         """
-        self.write_config("INHERIT +=3D \"archiver\"\nARCHIVER_MODE[src]=
 =3D \"original\"\nARCHIVER_MODE[srpm] =3D \"1\"")
+        self.write_config("""
+INHERIT +=3D "archiver"
+PACKAGE_CLASSES =3D "package_rpm"
+ARCHIVER_MODE[src] =3D "original"
+ARCHIVER_MODE[srpm] =3D "1"
+""")
         res =3D bitbake("xcursor-transparent-theme", ignore_status=3DTru=
e)
         self.assertEqual(res.status, 0, "\nCouldn't build xcursortranspa=
renttheme.\nbitbake output %s" % res.output)
         deploy_dir_src =3D get_bb_var('DEPLOY_DIR_SRC')
--=20
2.25.1


