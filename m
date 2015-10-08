Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id BAF2B73CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 14:33:39 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so28674153wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 07:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=3NAiNjjwVF+rmlvd43DqNTfslTL3j3XLgEF2syEdsx0=;
	b=I534beCBQPyRDSybtsl0ymv5ftihmm8LoehyrVCQEkKoqQyDbGn3uS9LiFJiLH9IqJ
	DW1TGt11ta65lUnzPKg3+JaBst/5GoZd5KTYJLENAM1BpIFFU4BK6pL92+wmPN1qELH5
	9gYV1RokUoCTA8vLHf4fqfSIJUxea05YtnJ9cxxQkUtegetPCrxEzkch2gJ/W6gwL/Fh
	yGL9ZpeMZz1psXAvGAsXVYTfxIKB8YVEC5oF2bXli6AuN2+whkRD/aCNDro78ngsbsn7
	rh9YAS4KM3cwntLVAKSfQUwJlJyWCOKme5YFciyf34aZ1maPUOjhPu4m8wj0bb6WzuRX
	P/cw==
X-Received: by 10.194.22.165 with SMTP id e5mr7959774wjf.50.1444314819786;
	Thu, 08 Oct 2015 07:33:39 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	gd10sm12868949wjb.47.2015.10.08.07.33.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Oct 2015 07:33:39 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Date: Thu, 8 Oct 2015 16:33:37 +0200
Message-Id: <A543BCF1-FAD0-4993-B357-1BE49B062F63@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] gcc: Avoid non-aligned access for ARM5e
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Oct 2015 14:33:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


[Icedtee Ticket #2153] -- see =
http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=3D2153

This patch prevents gcc generate code on ARM5e accessing 64 bit values, =
because gcc doesn't ensure they're 64 bit aligned.
Accessing a 64 bit value from a 32 bit alignment causes segmentation =
faults.

Patch is taken from =
https://github.com/archlinuxarm/PKGBUILDs/blob/master/core/gcc/0001-ARMv5-=
disable-LDRD-STRD.patch

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 .../gcc/gcc-4.9/0065-ARMv5-disable-LDRD-STRD.patch | 24 =
++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-5.2.inc              |  1 +
 .../gcc/gcc-5.2/0042-ARMv5-disable-LDRD-STRD.patch | 24 =
++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.9/0065-ARMv5-disable-LDRD-STRD.patch
 create mode 100644 =
meta/recipes-devtools/gcc/gcc-5.2/0042-ARMv5-disable-LDRD-STRD.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc =
b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 691ba5f..9a1b44e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -80,6 +80,7 @@ SRC_URI =3D "\
     =
file://0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
     file://0063-nativesdk-gcc-support.patch \
     file://0064-handle-target-sysroot-multilib.patch \
+    file://0065-ARMv5-disable-LDRD-STRD.patch \
 "
 SRC_URI[md5sum] =3D "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] =3D =
"2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git =
a/meta/recipes-devtools/gcc/gcc-4.9/0065-ARMv5-disable-LDRD-STRD.patch =
b/meta/recipes-devtools/gcc/gcc-4.9/0065-ARMv5-disable-LDRD-STRD.patch
new file mode 100644
index 0000000..68fe3b9
--- /dev/null
+++ =
b/meta/recipes-devtools/gcc/gcc-4.9/0065-ARMv5-disable-LDRD-STRD.patch
@@ -0,0 +1,24 @@
+=46rom b1884b6d1950422a32f9ced0be6d5492e4315547 Mon Sep 17 00:00:00 =
2001
+From: Kevin Mihelich <kevin@archlinuxarm.org>
+Date: Wed, 7 Jan 2015 18:43:57 -0700
+Subject: [PATCH] ARMv5: disable LDRD/STRD
+
+---
+ gcc/config/arm/arm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/arm/arm.h b/gcc/config/arm/arm.h
+index c60d9a4..65c60b9 100644
+--- a/gcc/config/arm/arm.h
++++ b/gcc/config/arm/arm.h
+@@ -282,7 +282,7 @@ extern void =
(*arm_lang_output_object_attributes_hook)(void);
+ /* Thumb-1 only.  */
+ #define TARGET_THUMB1_ONLY		(TARGET_THUMB1 && =
!arm_arch_notm)
+=20
+-#define TARGET_LDRD			(arm_arch5e && =
ARM_DOUBLEWORD_ALIGN \
++#define TARGET_LDRD			(arm_arch6 && =
ARM_DOUBLEWORD_ALIGN \
+                                          && !TARGET_THUMB1)
+=20
+ #define TARGET_CRC32			(arm_arch_crc)
+--=20
+2.2.1
diff --git a/meta/recipes-devtools/gcc/gcc-5.2.inc =
b/meta/recipes-devtools/gcc/gcc-5.2.inc
index f6673e6..044e8ae 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.2.inc
@@ -73,6 +73,7 @@ SRC_URI =3D "\
            file://0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch =
\
            file://0040-nativesdk-gcc-support.patch \
            file://0041-handle-target-sysroot-multilib.patch \
+           file://0042-ARMv5-disable-LDRD-STRD.patch \
           "
=20
 BACKPORTS =3D ""
diff --git =
a/meta/recipes-devtools/gcc/gcc-5.2/0042-ARMv5-disable-LDRD-STRD.patch =
b/meta/recipes-devtools/gcc/gcc-5.2/0042-ARMv5-disable-LDRD-STRD.patch
new file mode 100644
index 0000000..68fe3b9
--- /dev/null
+++ =
b/meta/recipes-devtools/gcc/gcc-5.2/0042-ARMv5-disable-LDRD-STRD.patch
@@ -0,0 +1,24 @@
+=46rom b1884b6d1950422a32f9ced0be6d5492e4315547 Mon Sep 17 00:00:00 =
2001
+From: Kevin Mihelich <kevin@archlinuxarm.org>
+Date: Wed, 7 Jan 2015 18:43:57 -0700
+Subject: [PATCH] ARMv5: disable LDRD/STRD
+
+---
+ gcc/config/arm/arm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/arm/arm.h b/gcc/config/arm/arm.h
+index c60d9a4..65c60b9 100644
+--- a/gcc/config/arm/arm.h
++++ b/gcc/config/arm/arm.h
+@@ -282,7 +282,7 @@ extern void =
(*arm_lang_output_object_attributes_hook)(void);
+ /* Thumb-1 only.  */
+ #define TARGET_THUMB1_ONLY		(TARGET_THUMB1 && =
!arm_arch_notm)
+=20
+-#define TARGET_LDRD			(arm_arch5e && =
ARM_DOUBLEWORD_ALIGN \
++#define TARGET_LDRD			(arm_arch6 && =
ARM_DOUBLEWORD_ALIGN \
+                                          && !TARGET_THUMB1)
+=20
+ #define TARGET_CRC32			(arm_arch_crc)
+--=20
+2.2.1
--=20
2.4.3

--=20
Jens Rehsack - rehsack@gmail.com


