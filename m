Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11649.1606836190962916303
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 07:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0D1330E
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Dec 2020 07:23:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A7E53F575
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Dec 2020 07:23:10 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] reproducible_build: clamp the rootfs tarball mtime to the epoch
Date: Tue,  1 Dec 2020 15:23:03 +0000
Message-Id: <20201201152305.2375723-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201152305.2375723-1-ross.burton@arm.com>
References: <20201201152305.2375723-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

To handle files being written to the rootfs outside of the package manage=
r,
clamp the mtimes to the epoch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/reproducible_build.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/repro=
ducible_build.bbclass
index 2f3bd90b073..28a25fb492d 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -116,3 +116,6 @@ python () {
     if d.getVar('BUILD_REPRODUCIBLE_BINARIES') =3D=3D '1':
         d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_e=
poch_stamp")
 }
+
+# Clamp the mtimes of the tarball image filesystem type
+IMAGE_CMD_tar_append =3D " --clamp-mtime --mtime=3D@${SOURCE_DATE_EPOCH}=
"
--=20
2.25.1

