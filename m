Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8333.1622039425513241498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 07:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 588ED1516
	for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 07:30:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0220D3F73D
	for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 07:30:23 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] rpm: limit xz threading
Date: Wed, 26 May 2021 15:30:21 +0100
Message-Id: <20210526143021.3920457-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../rpm/files/less-threads.patch              | 24 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb     |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/less-threads.patch

diff --git a/meta/recipes-devtools/rpm/files/less-threads.patch b/meta/re=
cipes-devtools/rpm/files/less-threads.patch
new file mode 100644
index 0000000000..d6db85f28a
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/less-threads.patch
@@ -0,0 +1,24 @@
+Instead of telling XZ to use as many threads as there are processor core=
s, just
+hardcode this to 4.
+
+On large systems with lots of cores, XZ will use unreasonable amounts of=
 memory.
+For example, my ThunderX2 reports 256 cores and rpmbuild takes 3.8GB of =
resident
+memory when packaging cmake. Limiting RPM to just 8 threads reduces this=
 to
+1.2GB without massively reducing the compression speed.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
+index 52be6a38d..c4034e9e5 100644
+--- a/rpmio/rpmio.c
++++ b/rpmio/rpmio.c
+@@ -799,7 +799,7 @@ static LZFILE *lzopen_internal(const char *mode, int=
 fd, int xz)
+ #ifdef HAVE_LZMA_MT
+ 	    } else {
+ 		if (threads =3D=3D -1)
+-		    threads =3D rpmExpandNumeric("%{getncpus}");
++		    threads =3D 8;
+ 		lzma_mt mt_options =3D {
+ 		    .flags =3D 0,
+ 		    .threads =3D threads,
diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-dev=
tools/rpm/rpm_4.16.1.3.bb
index 95a6f5cf71..f7e9378061 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
@@ -40,6 +40,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/r=
pm;branch=3Drpm-4.16.x \
            file://0016-rpmscript.c-change-logging-level-around-scriptlet=
s-t.patch \
            file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N=
32.patch \
            file://0001-tools-Add-error.h-for-non-glibc-case.patch \
+           file://less-threads.patch \
            "
=20
 PE =3D "1"
--=20
2.25.1

