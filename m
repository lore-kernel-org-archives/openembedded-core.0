Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id DD83F65F8E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 07:30:24 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id kx10so8231209pab.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 00:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UPNTKdDhBt+Ikvh8Z0oIlXhr83/t6IqiCc6B00Xd+w8=;
	b=RyTORMKTjY03Wztczo4IihiKE+9d+anZTR94CSqdyvhAkDVTdlfEHL98Wgb7tVrRaf
	FvddUsQmKznQ5XKtxaalJ4IzBQwxSKR+wHCUKzKtYkmmioyqD/HHrVHGsq3jBWbNQvvn
	xWDCCMn3Nip3ZYFp1jfVWMSrgZeveJEUbUCZ17Cq//tWpjdkpRZJDsfqpyxr0Mv7T0g3
	v4IrSHPM8Uazoo2XZiSPhvtkubLowke8b6pYFK+W85AN9H25L00GQMNzIYo7ciYp7JZU
	IhliKvVoHcX8A4DBj9opEqzFgaiB3C6jPqPt8QDCv8W4+C4x9Ro6m4CLgvQ4T5qjc0Vv
	BjEA==
X-Received: by 10.66.191.39 with SMTP id gv7mr3245502pac.150.1399361425554;
	Tue, 06 May 2014 00:30:25 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	zv3sm91381360pab.20.2014.05.06.00.30.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 May 2014 00:30:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 May 2014 00:32:50 -0700
Message-Id: <1399361570-7655-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH] tcmode-default.inc: Adjust for new toolchain component changes
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
X-List-Received-Date: Tue, 06 May 2014 07:30:25 -0000

Recently we renames the cross compilers as well as spun out
libgcc-initial from gcc-initial out. We need to also express
it in default tcmode otherwise defining GCCVERSION and/or BINUVERSION
outside OE-Core does not cover all cases

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 03742d8..0e81f06 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -30,9 +30,8 @@ UCLIBCVERSION ?= "0.9.33+git%"
 LINUXLIBCVERSION ?= "3.14"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-cross-initial ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-cross-intermediate ?= "${GCCVERSION}"
+PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
+PREFERRED_VERSION_gcc-cross-initial-${TARGET_ARCH} ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-intermediate ?= "${SDKGCCVERSION}"
@@ -40,9 +39,10 @@ PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GCCVERSION}
 PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
 PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
+PREFERRED_VERSION_libgcc-initial ?= "${GCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
-PREFERRED_VERSION_binutils-cross ?= "${BINUVERSION}"
+PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-crosssdk ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
 PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
-- 
1.9.2


