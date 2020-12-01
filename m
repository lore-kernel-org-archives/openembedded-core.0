Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.11594.1606836192141173569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 07:23:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD1CC30E
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Dec 2020 07:23:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6920C3F575
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Dec 2020 07:23:11 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] package_manager/ipk: improve remove_packaging_data
Date: Tue,  1 Dec 2020 15:23:05 +0000
Message-Id: <20201201152305.2375723-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201152305.2375723-1-ross.burton@arm.com>
References: <20201201152305.2375723-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

/var/cache/opkg wasn't being deleted, and /var/lib/opkg doesn't need
to exist as there are no lockfiles that write into it after this step.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/pa=
ckage_manager/ipk/__init__.py
index 2753b139ed1..da488c1c7f0 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -403,9 +403,9 @@ class OpkgPM(OpkgDpkgPM):
             bb.fatal(result)
=20
     def remove_packaging_data(self):
+        cachedir =3D oe.path.join(self.target_rootfs, self.d.getVar("loc=
alstatedir"), "cache", "opkg")
         bb.utils.remove(self.opkg_dir, True)
-        # create the directory back, it's needed by PM lock
-        bb.utils.mkdirhier(self.opkg_dir)
+        bb.utils.remove(cachedir, True)
=20
     def remove_lists(self):
         if not self.from_feeds:
--=20
2.25.1

