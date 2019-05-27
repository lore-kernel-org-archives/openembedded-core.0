Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 519926B8BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 07:45:38 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z28so9104863pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 00:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FRIu6rJML42euUxNrpI3wRHaROUtAxVO3VbkpDBFBN8=;
	b=fkT0zrh9ZyNMg/Dh3hy4A79JQ8O528BsUBg7UVkjC8NZUH0FLknR9WU7FTrTj54Z2E
	jNRPS9tsyfAG4mGT+ZiOkqLhIHc3J6o7FHmldjoe/BU/E2cIGvVsFuz+M0aEjeKyU4w+
	0vTY6o3Zz/45aUApRC4+5yX+VULqfEOek2pun66KMYeBZTKwLV/8U+H5G0HpmBt2bVfa
	CiItiVsEatR/z4/j9kxz7bzByxE+OoUuD2b6Ce8T8uT8eWQJaFEmte2jmkhDts4dzG2F
	uajeV2i5pX6ILcxUdNKIwT+i8SSLq5/S5/KP7JxrKfOzC2AlGiPli00EmAY8//uTMP6P
	n83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FRIu6rJML42euUxNrpI3wRHaROUtAxVO3VbkpDBFBN8=;
	b=r1HhH/mWzMJ6X7HHr4LoHSG1whJIk4CLQDGLq1hP2G05HQrrgZdgVuAv282Fhm3J6c
	MM9H7FBYLWI2LCiwInnBjSojP39JRG6RzAz0oC5k0ek3Nzy9T8yUMyWQEMZO9mjGmwW0
	a74XNu0c3M2nLGeP8m1zOTUVTsYnx0GNhnpAj1lT1ylaBba5Lzws/M/LrQl4Sd3xLcmy
	D8uJYOSewKxHBi36pgAQRf28haG3IPP1lPTTf1m4MzlTdBXoF4g+X8U8G+oO66mn2Vqb
	YwzafzET0sl+73GAVdvDraNlVNLR6kM2G3w99bGJxTMjr4IJJhWZ1Tqt7n9UlgKJWi8R
	bgIQ==
X-Gm-Message-State: APjAAAUjVKi9q1VVNKFFnHUdbvPbS9VrDzTpTP6+sTkxg8AdIIYjIwRE
	yRdwhROpLwKkWZ73AErW/9g3Gvc1Whs=
X-Google-Smtp-Source: APXvYqynAbhnjb30W/Xv2Od82GidWiLS8coPtCW0mWxRkx2ei7uNoQdGsUfAOMi6VXtG2thVxc6XIw==
X-Received: by 2002:a63:4710:: with SMTP id u16mr21943634pga.447.1558943138770;
	Mon, 27 May 2019 00:45:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id f2sm8576995pgs.83.2019.05.27.00.45.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 00:45:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2019 00:45:26 -0700
Message-Id: <20190527074526.27553-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] binutils: Workaround mips assembler crash on target
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
X-List-Received-Date: Mon, 27 May 2019 07:45:38 -0000
Content-Transfer-Encoding: 8bit

assembler ends up crashing on target sometimes due to
segfaults in libbfd, therefore avoid using -O2 for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.32.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.32.bb b/meta/recipes-devtools/binutils/binutils_2.32.bb
index 51a9748906..89315915c4 100644
--- a/meta/recipes-devtools/binutils/binutils_2.32.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.32.bb
@@ -20,6 +20,11 @@ EXTRA_OECONF_class-native = "--enable-targets=all \
                              --enable-install-libbfd \
                              --disable-werror"
 
+# gcc9.0 end up mis-compiling libbfd.so with O2 which then crashes on target
+# So remove -O2 and use -Os as workaround
+SELECTED_OPTIMIZATION_remove_mipsarch = "-O2"
+SELECTED_OPTIMIZATION_append_mipsarch = " -Os"
+
 do_install_class-native () {
 	autotools_do_install
 
@@ -47,3 +52,4 @@ PACKAGE_BEFORE_PN += "libbfd"
 FILES_libbfd = "${libdir}/libbfd-*.so"
 
 BBCLASSEXTEND = "native nativesdk"
+
-- 
2.21.0


