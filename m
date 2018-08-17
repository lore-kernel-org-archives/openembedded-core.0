Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2750678AB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 04:43:42 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id b90-v6so3143193plb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GrZRi5WE6cX0EPbkcO90L4dD/uXWYVJpCf5GiUA1008=;
	b=H0w5S8bp3oYWvhLqwjJc3vp6G0ojv6tzKmu3WxfDwH9hWqUbT0PremhRT4+KjgxMPx
	nBdVEru1+oj9imrcKzgZtRVzKCZAYCo7z8MyMh/eS5WyuOycMDii0ZfFSLaUajywNKQk
	itglW+wu4YhPzRiRecnI4dr63rD3FnfaywLeo6z1W9HBFopw0vwr++Maw6Sevu2Xw1jX
	WaU8S0ysEnIyGVeKadJoqr4iQBOFbFxKJaEzG4L4VK3N+r2+IXpZMNRz24qLSpURHzxk
	FDOS60I4+aifOdUR9OO7vbKHX2AmFNjDWV1wQlSpdgp33NJSXgbMbGeS4B7b7ZHPkyKr
	24wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GrZRi5WE6cX0EPbkcO90L4dD/uXWYVJpCf5GiUA1008=;
	b=WjvAkCfccZFs6P5582IOJYoMItFuhd5CAmCbZxL/TjUjkTjshHrPD3DXFK3sqCGTbj
	blaIzJGClDswijyZmZx+ZwlukdOnwg/Cph1YE5JkCR7/PIDQpgwCNcbSd+ccPRpWzPFS
	1alAt2TiVrWbPGGiTO9c8C6YGbmey+TMBtPwbPyECPYkFpMVLt0gifaKRiqQzrfRWFhW
	+hvvskmXTROE38aLtrOv54KxLY+bP+RcNwR7Sgf1Gu7466MhKavT9GNGmlGEgW3b8DSY
	Actj+AhEvz24El8PGnhKTg1vCte2lS9KmpQNVwD2kTWKRoRT1sUfVDZfu4tK0qSZdSe2
	9a+w==
X-Gm-Message-State: AOUpUlHuu4HTFN73A5qi74hEE5kRsRojG1E7UYiv+c086gwVOeO3cGwU
	K7+Jh0V9K5Yhfa4V9ZIs6Q+85gTK
X-Google-Smtp-Source: AA+uWPxU0uWHehmAaev02Ed2+mnIlwpP+b7uBXXQ+DBXR2wAX5HDt1fy6looQ2LG3lzYiV6MEwdfWA==
X-Received: by 2002:a17:902:925:: with SMTP id
	34-v6mr31899241plm.307.1534481023041; 
	Thu, 16 Aug 2018 21:43:43 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	r64-v6sm1157526pfk.157.2018.08.16.21.43.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Aug 2018 21:43:42 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 21:43:31 -0700
Message-Id: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/7] openssl: consolidate target name mapping rules
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
X-List-Received-Date: Fri, 17 Aug 2018 04:43:42 -0000

Merge duplicates + minor reformatting (no functional changes).

Note that the openssl 1.1 recipe still needs to be updated to handle
MIPS Release 6 ISA targets (e.g. linux-mipsisa32r6, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-connectivity/openssl/openssl_1.0.2p.bb |  7 ++--
 .../recipes-connectivity/openssl/openssl_1.1.0i.bb | 39 ++++------------------
 2 files changed, 8 insertions(+), 38 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
index 5d41977..5a2593c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
@@ -164,7 +164,7 @@ do_configure () {
 	linux-mips*)
 		target=debian-mips
 		;;
-	linux-microblaze*|linux-nios2*|linux-gnu*ilp32**)
+	linux-microblaze* | linux-nios2* | linux-gnu*ilp32**)
 		target=linux-generic32
 		;;
 	linux-powerpc)
@@ -179,10 +179,7 @@ do_configure () {
 	linux-riscv64)
 		target=linux-generic64
 		;;
-	linux-supersparc)
-		target=linux-sparcv8
-		;;
-	linux-sparc)
+	linux-sparc | linux-supersparc)
 		target=linux-sparcv8
 		;;
 	esac
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
index 7929d81..8a8d928 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
@@ -51,28 +51,13 @@ do_configure () {
 	esac
 	target="$os-${HOST_ARCH}"
 	case $target in
-	linux-arm)
-		target=linux-armv4
-		;;
-	linux-armeb)
+	linux-arm*)
 		target=linux-armv4
 		;;
 	linux-aarch64*)
 		target=linux-aarch64
 		;;
-	linux-sh3)
-		target=linux-generic32
-		;;
-	linux-sh4)
-		target=linux-generic32
-		;;
-	linux-i486)
-		target=linux-elf
-		;;
-	linux-i586 | linux-viac3)
-		target=linux-elf
-		;;
-	linux-i686)
+	linux-i?86 | linux-viac3)
 		target=linux-elf
 		;;
 	linux-gnux32-x86_64 | linux-muslx32-x86_64 )
@@ -81,23 +66,17 @@ do_configure () {
 	linux-gnu64-x86_64)
 		target=linux-x86_64
 		;;
-	linux-mips)
+	linux-mips | linux-mipsel)
 		# specifying TARGET_CC_ARCH prevents openssl from (incorrectly) adding target architecture flags
 		target="linux-mips32 ${TARGET_CC_ARCH}"
 		;;
-	linux-mipsel)
-		target="linux-mips32 ${TARGET_CC_ARCH}"
-		;;
 	linux-gnun32-mips*)
 		target=linux-mips64
 		;;
-	linux-*-mips64 | linux-mips64)
-		target=linux64-mips64
-		;;
-	linux-*-mips64el | linux-mips64el)
+	linux-*-mips64 | linux-mips64 | linux-*-mips64el | linux-mips64el)
 		target=linux64-mips64
 		;;
-	linux-microblaze*|linux-nios2*)
+	linux-microblaze* | linux-nios2* | linux-sh3 | linux-sh4)
 		target=linux-generic32
 		;;
 	linux-powerpc)
@@ -112,15 +91,9 @@ do_configure () {
 	linux-riscv64)
 		target=linux-generic64
 		;;
-	linux-supersparc)
-		target=linux-sparcv9
-		;;
-	linux-sparc)
+	linux-sparc | linux-supersparc)
 		target=linux-sparcv9
 		;;
-	darwin-i386)
-		target=darwin-i386-cc
-		;;
 	esac
 
 	useprefix=${prefix}
-- 
1.9.1


