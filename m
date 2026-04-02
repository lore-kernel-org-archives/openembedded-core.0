Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E77DD3941D
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 13:41:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15926.1775137312434640373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 06:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=LG7I7lTF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1023A32E3
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 06:41:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 93F393F641
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 06:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775137311; bh=b8BkDD2rCsiUig9hA++ax4CBcbu+zMqM3/iMHyXIv58=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LG7I7lTFUbuVFxbjLbjdopXj2GTQbC/Box/YwyRUr9afsqSQIrakQrm5Ohu/64W/R
	 W4jA8otHoa72tGSh3OHqgfHp2kAxGhGIZm6D0Y94eS6fPW4T9J3fU2CrW5c1qgnm5t
	 dgPXDI6jaoN5OSVd6V6ksWpvnVHl5TUvsDBgUT1I=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] ghostscript: ensure the native compile uses C17
Date: Thu,  2 Apr 2026 14:41:43 +0100
Message-ID: <20260402134143.1045721-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260402134143.1045721-1-ross.burton@arm.com>
References: <20260402134143.1045721-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 13:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234525

GCC 15.2 defaults to C23:

  $ aarch64-poky-linux-gcc --version
  aarch64-poky-linux-gcc (GCC) 15.2.0
  $ aarch64-poky-linux-gcc -dM -E - </dev/null | grep STDC_VERSION
  #define __STDC_VERSION__ 202311L

As of ghostscript 10.06.0 the build is good with C23[1] and our cross
compiler is 15.2, so we can stop adding -std=3Dgnu17 to the target CFLAGS=
.

However, our buildtools are currently using GCC 14.2 which has the
interesting behaviour that it has a -std=3Dgnu23 option but does not then
actually claim to support C23:

  $ gcc --version
  gcc (GCC) 14.2.0
  $ gcc -std=3Dgnu23 -dM -E - </dev/null | grep STDC_VERSION
  #define __STDC_VERSION__ 202000L

This then interacts badly with autoconf 2.73 which tells the compiler to
use C23, breaking stdpre.h which handles a number of different
compilers and C standards.

A bug has been filed with ghostscript[2] to try and handle this this
case in the source, but a workaround is to tell the native compiles to
explicitly use C17.

[1] ghostscript ae9409464 ("Bug 708160: Fix compatibility with C23 compil=
ers")
[2] https://bugs.ghostscript.com/show_bug.cgi?id=3D709290

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb b/m=
eta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
index 951cbc19565..e0add4bae96 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
@@ -40,6 +40,7 @@ EXTRA_OECONF =3D "--with-jbig2dec \
                 --with-fontpath=3D${datadir}/fonts \
                 CUPSCONFIG=3D"${STAGING_BINDIR_CROSS}/cups-config" \
                 PKGCONFIG=3Dpkg-config \
+                CFLAGSAUX=3D-std=3Dgnu17 \
                 "
=20
 EXTRA_OECONF:append:mipsarcho32 =3D " --with-large_color_index=3D0"
@@ -47,7 +48,7 @@ EXTRA_OECONF:append:mipsarcho32 =3D " --with-large_colo=
r_index=3D0"
 EXTRA_OECONF:append:armv7a =3D "${@bb.utils.contains('TUNE_FEATURES','ne=
on','',' --disable-neon',d)}"
 EXTRA_OECONF:append:armv7ve =3D "${@bb.utils.contains('TUNE_FEATURES','n=
eon','',' --disable-neon',d)}"
=20
-TARGET_CFLAGS +=3D "-std=3Dgnu17 -Wno-error=3Ddeclaration-after-statemen=
t -fPIC"
+TARGET_CFLAGS +=3D "-Wno-error=3Ddeclaration-after-statement -fPIC"
=20
 inherit autotools pkgconfig
=20
--=20
2.47.1


