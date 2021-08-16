Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.25993.1629128315234533274
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 08:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A16806D
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 08:38:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BB7C3F66F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 08:38:33 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/buildoptions: test buildhistory PKGSIZE and FILELIST fields
Date: Mon, 16 Aug 2021 16:38:29 +0100
Message-Id: <20210816153829.1351730-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add tests to ensure that PKGSIZE and FILELIST fields are set correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa=
/selftest/cases/buildoptions.py
index be49322f9c2..f99881758e3 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -148,6 +148,30 @@ class BuildhistoryTests(BuildhistoryBase):
         self.run_buildhistory_operation(target, target_config=3D"PR =3D =
\"r1\"", change_bh_location=3DTrue)
         self.run_buildhistory_operation(target, target_config=3D"PR =3D =
\"r0\"", change_bh_location=3DFalse, expect_error=3DTrue, error_regex=3De=
rror)
=20
+    def test_fileinfo(self):
+        self.config_buildhistory()
+        bitbake('hicolor-icon-theme')
+        history_dir =3D get_bb_var('BUILDHISTORY_DIR_PACKAGE', 'hicolor-=
icon-theme')
+        self.assertTrue(os.path.isdir(history_dir), 'buildhistory dir wa=
s not created.')
+
+        def load_bh(f):
+            d =3D {}
+            for line in open(f):
+                split =3D [s.strip() for s in line.split('=3D', 1)]
+                if len(split) > 1:
+                    d[split[0]] =3D split[1]
+            return d
+
+        data =3D load_bh(os.path.join(history_dir, 'hicolor-icon-theme',=
 'latest'))
+        self.assertIn('FILELIST', data)
+        self.assertEqual(data['FILELIST'], '/usr/share/icons/hicolor/ind=
ex.theme')
+        self.assertGreater(int(data['PKGSIZE']), 0)
+
+        data =3D load_bh(os.path.join(history_dir, 'hicolor-icon-theme-d=
ev', 'latest'))
+        if 'FILELIST' in data:
+            self.assertEqual(data['FILELIST'], '')
+        self.assertEqual(int(data['PKGSIZE']), 0)
+
 class ArchiverTest(OESelftestTestCase):
     def test_arch_work_dir_and_export_source(self):
         """
--=20
2.25.1

