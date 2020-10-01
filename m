Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2636.1601568676340167714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 09:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F71C1063
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Oct 2020 09:11:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF6C73F70D
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Oct 2020 09:11:14 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] parted: improve ptest
Date: Thu,  1 Oct 2020 17:11:11 +0100
Message-Id: <20201001161111.2889773-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201001161111.2889773-1-ross.burton@arm.com>
References: <20201001161111.2889773-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a RRECOMMENDS on kernel-module-scsi-debug as this module is needed
for many of the tests.

Create the udev mount blacklist directory before writing into it, as it
doesn't always exist.

Delete any existing log files before calling make, as otherwise the
tests cannot be repeated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/parted/files/run-ptest | 2 ++
 meta/recipes-extended/parted/parted_3.3.bb   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/parted/files/run-ptest b/meta/recipes-=
extended/parted/files/run-ptest
index f39c478ce6..374f1bfbc9 100644
--- a/meta/recipes-extended/parted/files/run-ptest
+++ b/meta/recipes-extended/parted/files/run-ptest
@@ -1,5 +1,7 @@
 #!/bin/sh
=20
+mkdir -p /etc/udev/mount.blacklist.d
 echo /dev/sda1 >> /etc/udev/mount.blacklist.d/parted-tmp
+rm -f *.log
 make -C tests test-suite.log
 rm /etc/udev/mount.blacklist.d/parted-tmp
diff --git a/meta/recipes-extended/parted/parted_3.3.bb b/meta/recipes-ex=
tended/parted/parted_3.3.bb
index aa4d8042cf..a1fd3ef07b 100644
--- a/meta/recipes-extended/parted/parted_3.3.bb
+++ b/meta/recipes-extended/parted/parted_3.3.bb
@@ -46,7 +46,7 @@ do_install_ptest() {
 }
=20
 RDEPENDS_${PN}-ptest =3D "bash coreutils perl util-linux-losetup python3=
 make gawk e2fsprogs-mke2fs"
-
+RRECOMMENDS_${PN}-ptest =3D "kernel-module-scsi-debug"
 RDEPENDS_${PN}-ptest_append_libc-glibc =3D "\
         glibc-utils \
         locale-base-en-us \
--=20
2.25.1

