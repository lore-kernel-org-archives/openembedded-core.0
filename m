Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TeDW5-0006N5-0c
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 00:27:37 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5816566eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 15:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=muodtWmXhyZgZbSxfXnpUQSS85nkTpnd4H0yemcmz/k=;
	b=hl0mcjiyxGN73etLzBk3Bme8qExuMRFbvpv82J3gOKn3g1F/1UrIqNoDapi+pxUQtl
	kUT8UYLjuIlTekMi140XLVKpIU4NV/j5YDECAADwnspKhv2IM8CG+9cXF5rNGfSmDv78
	GpVhge33FVFgGi6mBP4/0gY/Uk+NJHjPGJXl6diH+DWOr+pHzlldpxneWJ6UTQtEDRDJ
	yzJ60PqgLXnmhEE62FwBF4QTG6ylyU/fuEpDboEY3Fip5r88XfwmXGG1e4rkPd+mkV6K
	YM5ehvoRlWzH6jDABkSLGjYQa8FRtAESJ0qUUBSv/76csTKMpfs7kQQVXvXPUdLvblNj
	ZA2A==
Received: by 10.14.208.137 with SMTP id q9mr77099935eeo.28.1354230803010;
	Thu, 29 Nov 2012 15:13:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a45sm6691554eep.16.2012.11.29.15.13.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 15:13:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 00:12:36 +0100
Message-Id: <b23e96711c6f847eb6f467b66fa1a3d639845970.1354230112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/8] arch-arm*: unify appending to TUNE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 23:27:38 -0000

* that we always use TUNE_FEATURES_tune-arm* variable and add only one TUNE_FEATURE to it
* for bigendian always use littleendian counterpart and append bigendian TUNE_FEATURE

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv4.inc     |  2 +-
 meta/conf/machine/include/arm/arch-armv5-dsp.inc | 13 ++++++-------
 meta/conf/machine/include/arm/arch-armv5.inc     |  6 +++---
 meta/conf/machine/include/arm/arch-armv6.inc     |  6 +++---
 meta/conf/machine/include/arm/arch-armv7a.inc    | 15 +++++++--------
 5 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index f3c3391..bfa2377 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -13,7 +13,7 @@ AVAILTUNES += "armv4 armv4t"
 ARMPKGARCH_tune-armv4 ?= "armv4"
 ARMPKGARCH_tune-armv4t ?= "armv4"
 TUNE_FEATURES_tune-armv4 ?= "armv4"
-TUNE_FEATURES_tune-armv4t ?= "armv4 thumb"
+TUNE_FEATURES_tune-armv4t ?= "${TUNE_FEATURES_tune-armv4} thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv4 = "arm armv4"
 PACKAGE_EXTRA_ARCHS_tune-armv4t = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4t"
 
diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
index 0ae6411..524a62a 100644
--- a/meta/conf/machine/include/arm/arch-armv5-dsp.inc
+++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
@@ -7,8 +7,8 @@ require conf/machine/include/arm/arch-armv5.inc
 AVAILTUNES += "armv5e armv5te"
 ARMPKGARCH_tune-armv5e ?= "armv5"
 ARMPKGARCH_tune-armv5te ?= "armv5"
-TUNE_FEATURES_tune-armv5e ?= "armv5 dsp"
-TUNE_FEATURES_tune-armv5te ?= "armv5 dsp thumb"
+TUNE_FEATURES_tune-armv5e ?= "${TUNE_FEATURES_tune-armv5} dsp"
+TUNE_FEATURES_tune-armv5te ?= "${TUNE_FEATURES_tune-armv5t} dsp"
 PACKAGE_EXTRA_ARCHS_tune-armv5e = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5e"
 PACKAGE_EXTRA_ARCHS_tune-armv5te = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5e armv5te"
 
@@ -18,8 +18,8 @@ ARMPKGARCH_tune-armv5e-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5te-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5ehf-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5tehf-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5e-vfp ?= "armv5 vfp dsp"
-TUNE_FEATURES_tune-armv5te-vfp ?= "armv5 vfp dsp thumb"
+TUNE_FEATURES_tune-armv5e-vfp ?= "${TUNE_FEATURES_tune-armv5e} vfp"
+TUNE_FEATURES_tune-armv5te-vfp ?= "${TUNE_FEATURES_tune-armv5te} vfp"
 TUNE_FEATURES_tune-armv5ehf-vfp ?= "${TUNE_FEATURES_tune-armv5e-vfp} callconvention-hard"
 TUNE_FEATURES_tune-armv5tehf-vfp ?= "${TUNE_FEATURES_tune-armv5te-vfp} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5-vfp} armv5e armv5e-vfp"
@@ -44,10 +44,9 @@ ARMPKGARCH_tune-armv5ehfb-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5tehfb-vfp ?= "armv5"
 TUNE_FEATURES_tune-armv5eb-vfp ?= "${TUNE_FEATURES_tune-armv5e-vfp} bigendian"
 TUNE_FEATURES_tune-armv5teb-vfp ?= "${TUNE_FEATURES_tune-armv5te-vfp} bigendian"
-TUNE_FEATURES_tune-armv5ehfb-vfp ?= "${TUNE_FEATURES_tune-armv5eb-vfp} callconvention-hard"
-TUNE_FEATURES_tune-armv5tehfb-vfp ?= "${TUNE_FEATURES_tune-armv5teb-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv5ehfb-vfp ?= "${TUNE_FEATURES_tune-armv5ehf-vfp} bigendian"
+TUNE_FEATURES_tune-armv5tehfb-vfp ?= "${TUNE_FEATURES_tune-armv5tehf-vfp} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp} armv5eb armv5eb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp} armv5eb armv5teb armv5eb-vfp armv5teb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp} armv5ehfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thfb-vfp} armv5ehfb-vfp armv5tehfb-vfp"
-
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index 0bcc1f0..5fdfa23 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -15,7 +15,7 @@ AVAILTUNES += "armv5 armv5t"
 ARMPKGARCH_tune-armv5 ?= "armv5"
 ARMPKGARCH_tune-armv5t ?= "armv5"
 TUNE_FEATURES_tune-armv5 ?= "armv5"
-TUNE_FEATURES_tune-armv5t ?= "armv5 thumb"
+TUNE_FEATURES_tune-armv5t ?= "${TUNE_FEATURES_tune-armv5} thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv5 = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5"
 PACKAGE_EXTRA_ARCHS_tune-armv5t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5 armv5t"
 
@@ -52,8 +52,8 @@ ARMPKGARCH_tune-armv5hfb-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5thfb-vfp ?= "armv5"
 TUNE_FEATURES_tune-armv5b-vfp ?= "${TUNE_FEATURES_tune-armv5-vfp} bigendian"
 TUNE_FEATURES_tune-armv5tb-vfp ?= "${TUNE_FEATURES_tune-armv5t-vfp} bigendian"
-TUNE_FEATURES_tune-armv5hfb-vfp ?= "${TUNE_FEATURES_tune-armv5b-vfp} callconvention-hard"
-TUNE_FEATURES_tune-armv5thfb-vfp ?= "${TUNE_FEATURES_tune-armv5tb-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv5hfb-vfp ?= "${TUNE_FEATURES_tune-armv5hf-vfp} bigendian"
+TUNE_FEATURES_tune-armv5thfb-vfp ?= "${TUNE_FEATURES_tune-armv5thf-vfp} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5b} armv5b-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb} armv5b-vfp armv5tb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp = "armv5hfb-vfp"
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 451a008..4c6548c 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -14,7 +14,7 @@ ARMPKGARCH_tune-armv6t ?= "armv6"
 ARMPKGARCH_tune-armv6hf ?= "armv6"
 ARMPKGARCH_tune-armv6thf ?= "armv6"
 TUNE_FEATURES_tune-armv6 ?= "armv6 vfp"
-TUNE_FEATURES_tune-armv6t ?= "armv6 vfp thumb"
+TUNE_FEATURES_tune-armv6t ?= "${TUNE_FEATURES_tune-armv6} thumb"
 TUNE_FEATURES_tune-armv6hf ?= "${TUNE_FEATURES_tune-armv6} callconvention-hard"
 TUNE_FEATURES_tune-armv6thf ?= "${TUNE_FEATURES_tune-armv6t} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6-vfp"
@@ -30,8 +30,8 @@ ARMPKGARCH_tune-armv6hfb ?= "armv6"
 ARMPKGARCH_tune-armv6thfb ?= "armv6"
 TUNE_FEATURES_tune-armv6b ?= "${TUNE_FEATURES_tune-armv6} bigendian"
 TUNE_FEATURES_tune-armv6tb ?= "${TUNE_FEATURES_tune-armv6t} bigendian"
-TUNE_FEATURES_tune-armv6hfb ?= "${TUNE_FEATURES_tune-armv6b} callconvention-hard"
-TUNE_FEATURES_tune-armv6thfb ?= "${TUNE_FEATURES_tune-armv6tb} callconvention-hard"
+TUNE_FEATURES_tune-armv6hfb ?= "${TUNE_FEATURES_tune-armv6hf} bigendian"
+TUNE_FEATURES_tune-armv6thfb ?= "${TUNE_FEATURES_tune-armv6thf} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp} armv6b-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b-vfp armv6tb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv6hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp} armv6hfb-vfp"
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 827b426..a8ebd82 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -15,9 +15,9 @@ ARMPKGARCH_tune-armv7at ?= "armv7a"
 ARMPKGARCH_tune-armv7a-neon?= "armv7a"
 ARMPKGARCH_tune-armv7at-neon ?= "armv7a"
 TUNE_FEATURES_tune-armv7a ?= "armv7a vfp"
-TUNE_FEATURES_tune-armv7at ?= "armv7a vfp thumb"
-TUNE_FEATURES_tune-armv7a-neon ?= "armv7a vfp neon"
-TUNE_FEATURES_tune-armv7at-neon ?= "armv7a vfp neon thumb"
+TUNE_FEATURES_tune-armv7at ?= "${TUNE_FEATURES_tune-armv7a} thumb"
+TUNE_FEATURES_tune-armv7a-neon ?= "${TUNE_FEATURES_tune-armv7a} neon"
+TUNE_FEATURES_tune-armv7at-neon ?= "${TUNE_FEATURES_tune-armv7at} neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7a = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7a armv7a-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7a-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7a armv7a-vfp armv7at2-vfp"
@@ -59,12 +59,11 @@ ARMPKGARCH_tune-armv7ahfb ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb ?= "armv7a"
 ARMPKGARCH_tune-armv7ahfb-neon?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-neon ?= "armv7a"
-TUNE_FEATURES_tune-armv7ahfb ?= "${TUNE_FEATURES_tune-armv7ab} callconvention-hard"
-TUNE_FEATURES_tune-armv7athfb ?= "${TUNE_FEATURES_tune-armv7atb} callconvention-hard"
-TUNE_FEATURES_tune-armv7ahfb-neon ?= "${TUNE_FEATURES_tune-armv7ab-neon} callconvention-hard"
-TUNE_FEATURES_tune-armv7athfb-neon ?= "${TUNE_FEATURES_tune-armv7atb-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7ahfb ?= "${TUNE_FEATURES_tune-armv7ahf} bigendian"
+TUNE_FEATURES_tune-armv7athfb ?= "${TUNE_FEATURES_tune-armv7athf} bigendian"
+TUNE_FEATURES_tune-armv7ahfb-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} bigendian"
+TUNE_FEATURES_tune-armv7athfb-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb} armv7ahfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7ahfb-vfp armv7at2hfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-neon armv7at2hfb-vfp-neon"
-
-- 
1.8.0



