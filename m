Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web11.11649.1606836190962916303
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 07:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3631C1042
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Dec 2020 07:23:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D271A3F575
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Dec 2020 07:23:10 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] package_manager/ipk: neaten OPKGLIBDIR logic
Date: Tue,  1 Dec 2020 15:23:04 +0000
Message-Id: <20201201152305.2375723-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201152305.2375723-1-ross.burton@arm.com>
References: <20201201152305.2375723-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

oe.path.join handles path components starting with / for us.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/pa=
ckage_manager/ipk/__init__.py
index 416ed23d474..2753b139ed1 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -172,12 +172,7 @@ class OpkgPM(OpkgDpkgPM):
         if prepare_index:
             create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLO=
Y_DIR_IPK"), "package_write_ipk", filterbydependencies)
=20
-        opkg_lib_dir =3D self.d.getVar('OPKGLIBDIR')
-        if opkg_lib_dir[0] =3D=3D "/":
-            opkg_lib_dir =3D opkg_lib_dir[1:]
-
-        self.opkg_dir =3D os.path.join(target_rootfs, opkg_lib_dir, "opk=
g")
-
+        self.opkg_dir =3D oe.path.join(target_rootfs, self.d.getVar('OPK=
GLIBDIR'), "opkg")
         bb.utils.mkdirhier(self.opkg_dir)
=20
         self.saved_opkg_dir =3D self.d.expand('${T}/saved/%s' % self.tas=
k_name)
--=20
2.25.1

