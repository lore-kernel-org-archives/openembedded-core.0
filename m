Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8754.1622041153558087979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 07:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 256931516
	for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 07:59:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C31B83F73D
	for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 07:59:12 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package_rpm: pass XZ_THREADS to rpm
Date: Wed, 26 May 2021 15:59:10 +0100
Message-Id: <20210526145910.3930141-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

By default RPM uses the number of cores as the number of threads to use,
which can result in quite antisocial memory usage.

As we control the macros for compression anyway, we can pass XZ_THREADS
to limit the number of threads if needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/package_rpm.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.=
bbclass
index 84a9a6dd12..86706da842 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -684,8 +684,8 @@ python do_package_rpm () {
     cmd =3D cmd + " --define '_use_internal_dependency_generator 0'"
     cmd =3D cmd + " --define '_binaries_in_noarch_packages_terminate_bui=
ld 0'"
     cmd =3D cmd + " --define '_build_id_links none'"
-    cmd =3D cmd + " --define '_binary_payload w6T.xzdio'"
-    cmd =3D cmd + " --define '_source_payload w6T.xzdio'"
+    cmd =3D cmd + " --define '_binary_payload w6T%d.xzdio'" % int(d.getV=
ar("XZ_THREADS"))
+    cmd =3D cmd + " --define '_source_payload w6T%d.xzdio'" % int(d.getV=
ar("XZ_THREADS"))
     cmd =3D cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
     cmd =3D cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd =3D cmd + " --define '_buildhost reproducible'"
--=20
2.25.1

