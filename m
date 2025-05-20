Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74109C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 18:24:54 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.27967.1747765492708270243
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 11:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=mJL8wjqR;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from CPC-alhe-6FX66J.redmond.corp.microsoft.com (unknown [70.37.26.60])
	by linux.microsoft.com (Postfix) with ESMTPSA id A1768201DB31
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 11:24:51 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A1768201DB31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1747765491;
	bh=f/Nws7X0Pi5HoyMOZFjEiIhu/rMwoyEf2UEFiNJcg98=;
	h=From:To:Subject:Date:From;
	b=mJL8wjqRP9MowJtT79r6cGnhkgClsKcp/HGvkYpfgBu11Yefv38EFBNENU9RTQO+Z
	 oIHHOFNe8k33CJtnefp+Q6wE18H/dWf+Lbs4evrbeKBR0oovF7ifv/oAqnkb/qHSVc
	 6PopoKB9C50EcLmdW+2KZBEDKYXtO5mBzMeuiaS0=
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] newlib: Upgrade 4.4.0 -> 4.5.0
Date: Tue, 20 May 2025 18:24:46 +0000
Message-ID: <20250520182446.203636-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 18:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216931

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

Licence changes:
- Adds BSD-2 for libm ld128 functions on 5c5ae2c08
- Adds Synopsys arc-*-* targets on 820dd50

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 meta/recipes-core/newlib/libgloss_git.bb | 8 ++++++--
 meta/recipes-core/newlib/newlib.inc      | 8 ++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/newlib/libgloss_git.bb b/meta/recipes-core=
/newlib/libgloss_git.bb
index 3c97a7f296..92bb81050b 100644
--- a/meta/recipes-core/newlib/libgloss_git.bb
+++ b/meta/recipes-core/newlib/libgloss_git.bb
@@ -21,8 +21,12 @@ do_install:append() {
 	install -d ${D}${libdir}
 	mv -v ${D}${prefix}/${TARGET_SYS}/lib/* ${D}${libdir}
=20
-	# Remove original directory
-	rmdir -p --ignore-fail-on-non-empty ${D}${prefix}/${TARGET_SYS}/lib
+        # Remove original directory
+        rmdir -p --ignore-fail-on-non-empty ${D}${prefix}/${TARGET_SYS}/=
lib
+        # Remove empty include dir
+        rmdir ${D}/${prefix}/${TARGET_SYS}/include
+        rmdir ${D}/${prefix}/${TARGET_SYS}/
+
 }
=20
 # Split packages correctly
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newl=
ib/newlib.inc
index 50113ba433..5b5025148e 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -8,16 +8,16 @@ LIC_FILES_CHKSUM =3D " \
 		file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
 		file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
-		file://COPYING.LIBGLOSS;md5=3Dc0469b6ebb847a75781066be515f032d \
+		file://COPYING.LIBGLOSS;md5=3Dfaa6f6ad545714df2a7d1276ed899f15 \
 		file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
-		file://COPYING.NEWLIB;md5=3D4f1a15846ffee91e352418563e1bce27 \
+		file://COPYING.NEWLIB;md5=3D61255563bbcda142f581b94591b6a589 \
 		file://newlib/libc/posix/COPYRIGHT;md5=3D103468ff1982be840fdf4ee9f8b51=
bbf \
 		"
=20
-BASEVER =3D "4.4.0"
+BASEVER =3D "4.5.0"
 PV =3D "${BASEVER}+git"
 SRC_URI =3D "git://sourceware.org/git/newlib-cygwin.git;protocol=3Dhttps=
;branch=3Dmain"
-SRCREV =3D "ad11e2587f83d61357a32c61c36d72ea4f39315e"
+SRCREV =3D "5e5e51f1dc56a99eb4648c28e00d73b6ea44a8b0"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 DEPENDS =3D "virtual/cross-cc"
--=20
2.45.2


