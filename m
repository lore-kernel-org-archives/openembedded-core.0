Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2635.1601568675872601156
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 09:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADE1C30E
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Oct 2020 09:11:14 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58DF03F70D
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Oct 2020 09:11:14 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] coreutils: improve coreutils-ptest RDEPENDS
Date: Thu,  1 Oct 2020 17:11:10 +0100
Message-Id: <20201001161111.2889773-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add perl-modules to the RDEPENDS to avoid having to list all perl
modules that are required, as this package isn't going to be installed
outside of testing builds.

Remove libmodule-build-perl from RDEPENDS, it appears that this isn't
needed anymore. With and without this package the test results on my
image are the same: 619 tests, 462 pass, 154 skip, 3 fail.  This
*drastically* reduces the build impact of enabling ptest as
packagegroup-core-build-essential (thus target gcc) is in the dependency
chain.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/coreutils/coreutils_8.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes=
-core/coreutils/coreutils_8.32.bb
index f8ae3fd94c..9d1eceef54 100644
--- a/meta/recipes-core/coreutils/coreutils_8.32.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
@@ -158,7 +158,7 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 inherit ptest
=20
-RDEPENDS_${PN}-ptest +=3D "bash findutils gawk liberror-perl libmodule-b=
uild-perl make perl perl-module-file-stat python3-core sed shadow"
+RDEPENDS_${PN}-ptest +=3D "bash findutils gawk liberror-perl make perl p=
erl-modules python3-core sed shadow"
=20
 # -dev automatic dependencies fails as we don't want libmodule-build-per=
l-dev, its too heavy
 # may need tweaking if DEPENDS changes
--=20
2.25.1

