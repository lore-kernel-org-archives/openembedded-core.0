Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23492.1599165120773201703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 13:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22D451424
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Sep 2020 13:32:00 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B955A3F71F
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Sep 2020 13:31:59 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] kea: bump to 1.7.10
Date: Thu,  3 Sep 2020 21:31:53 +0100
Message-Id: <20200903203153.1300390-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903203153.1300390-1-ross.burton@arm.com>
References: <20200903203153.1300390-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is the latest release in the 1.7.x series so should be a safe
upgrade, and means we can drop a patch as the AC_TRY_RUN has an
optimistic fallback for cross-compiling now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../kea/files/0001-remove-AC_TRY_RUN.patch    | 34 -------------------
 .../kea/{kea_1.7.7.bb =3D> kea_1.7.10.bb}       |  4 +--
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-remove-AC_TR=
Y_RUN.patch
 rename meta/recipes-connectivity/kea/{kea_1.7.7.bb =3D> kea_1.7.10.bb} (=
92%)

diff --git a/meta/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.p=
atch b/meta/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
deleted file mode 100644
index d7ca9ff8fa..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9d6b8321c5b46199baca907f3d42bdcaaf1958a8 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 23 May 2019 23:59:42 -0700
-Subject: [PATCH] remove AC_TRY_RUN
-
-AC_TRY_RUN doesn't work in cross compile env,
-use AC_COMPILE_IFELSE instead to fix below configure
-error:
- | checking for usuable C++11 regex... configure: error: in `/builddir/t=
mp/work/core2-64-poky-linux/kea/1.5.0-r0/build':
- | configure: error: cannot run test program while cross compiling
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c880b77..dd40c7c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -580,7 +580,7 @@ AC_TRY_COMPILE([
-         AC_MSG_RESULT(no))
-=20
- AC_MSG_CHECKING(for usuable C++11 regex)
--AC_TRY_RUN([
-+AC_COMPILE_IFELSE([
- #include <regex>
- #include <iostream>
- int main() {
---=20
-2.21.0
-
diff --git a/meta/recipes-connectivity/kea/kea_1.7.7.bb b/meta/recipes-co=
nnectivity/kea/kea_1.7.10.bb
similarity index 92%
rename from meta/recipes-connectivity/kea/kea_1.7.7.bb
rename to meta/recipes-connectivity/kea/kea_1.7.10.bb
index d2e41e0db2..e2560b2399 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.7.bb
+++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
@@ -9,13 +9,11 @@ DEPENDS =3D "boost log4cplus openssl"
=20
 SRC_URI =3D "\
     http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
-    file://0001-remove-AC_TRY_RUN.patch \
     file://kea-dhcp4.service \
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
 "
-SRC_URI[md5sum] =3D "4f8d1251fd41ef2e822a4eb3f0797d46"
-SRC_URI[sha256sum] =3D "0bba8b045672884a928ff4b2a8575ac5ba420eb6ba47a933=
8f1932bc38dcf866"
+SRC_URI[sha256sum] =3D "4e121f0e58b175a827581c69cb1d60778647049fa47f1429=
40dddc9ce58f3c82"
=20
 inherit autotools systemd
=20
--=20
2.28.0

