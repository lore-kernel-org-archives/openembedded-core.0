Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web10.44367.1590461561660142572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 19:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49WJRC1ns2z1rx8y;
	Tue, 26 May 2020 04:52:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49WJRC19hQz1qr50;
	Tue, 26 May 2020 04:52:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id hYERklYFLVWY; Tue, 26 May 2020 04:52:37 +0200 (CEST)
X-Auth-Info: LG4PBEvbJDP+9kLNZVmnd89c/dosaWCMrbfuTr7/s64=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 26 May 2020 04:52:37 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] [zeus] icu: update SRC_URI
Date: Tue, 26 May 2020 04:52:31 +0200
Message-Id: <20200526025231.295350-1-marex@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Alexander Kanavin <alex.kanavin@gmail.com>

New releases of ICU are published on github.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/icu/icu_64.2.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/icu/icu_64.2.bb b/meta/recipes-support/=
icu/icu_64.2.bb
index 2ed807787d..d09776f4bc 100644
--- a/meta/recipes-support/icu/icu_64.2.bb
+++ b/meta/recipes-support/icu/icu_64.2.bb
@@ -6,13 +6,18 @@ def icu_download_version(d):
     pvsplit =3D d.getVar('PV').split('.')
     return pvsplit[0] + "_" + pvsplit[1]
=20
+def icu_download_folder(d):
+    pvsplit =3D d.getVar('PV').split('.')
+    return pvsplit[0] + "-" + pvsplit[1]
+
 ICU_PV =3D "${@icu_download_version(d)}"
+ICU_FOLDER =3D "${@icu_download_folder(d)}"
=20
 # http://errors.yoctoproject.org/Errors/Details/20486/
 ARM_INSTRUCTION_SET_armv4 =3D "arm"
 ARM_INSTRUCTION_SET_armv5 =3D "arm"
=20
-BASE_SRC_URI =3D "http://download.icu-project.org/files/icu4c/${PV}/icu4=
c-${ICU_PV}-src.tgz"
+BASE_SRC_URI =3D "https://github.com/unicode-org/icu/releases/download/r=
elease-${ICU_FOLDER}/icu4c-${ICU_PV}-src.tgz"
 SRC_URI =3D "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
@@ -27,5 +32,5 @@ SRC_URI_append_class-target =3D "\
 SRC_URI[md5sum] =3D "a3d18213beec454e3cdec9a3116d6b05"
 SRC_URI[sha256sum] =3D "627d5d8478e6d96fc8c90fed4851239079a561a6a8b9e48b=
0892f24e82d31d6c"
=20
-UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
-UPSTREAM_CHECK_URI =3D "http://download.icu-project.org/files/icu4c/"
+UPSTREAM_CHECK_REGEX =3D "icu4c-(?P<pver>\d+(_\d+)+)-src"
+UPSTREAM_CHECK_URI =3D "https://github.com/unicode-org/icu/releases"
--=20
2.25.1

