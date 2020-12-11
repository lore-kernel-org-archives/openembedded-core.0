Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9198.1607702966373164317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Dec 2020 08:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D39D31B
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Dec 2020 08:09:25 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17CCA3F66B
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Dec 2020 08:09:24 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel: set COMPATIBLE_HOST to *-linux
Date: Fri, 11 Dec 2020 16:09:22 +0000
Message-Id: <20201211160922.4125554-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The target system triple contains whether the target is Linux or not,
so use it to avoid situations where you can attempt to build a kernel
for systems which don't support Linux.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/kernel.bbclass              | 2 ++
 meta/recipes-kernel/linux/linux-dummy.bb | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1a444efabf..2f1006ddf0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,5 +1,7 @@
 inherit linux-kernel-base kernel-module-split
=20
+COMPATIBLE_HOST =3D ".*-linux"
+
 KERNEL_PACKAGE_NAME ??=3D "kernel"
 KERNEL_DEPLOYSUBDIR ??=3D "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") =3D=
=3D "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
=20
diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kern=
el/linux/linux-dummy.bb
index 649fc04dd1..95dc85ff2f 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -26,7 +26,7 @@ DESCRIPTION_kernel-vmlinux =3D "Kernel vmlinux meta pac=
kage"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
-#COMPATIBLE_MACHINE =3D "your_machine"
+COMPATIBLE_HOST =3D ".*-linux"
=20
 PR =3D "r1"
=20
--=20
2.25.1

