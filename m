Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDtao-0005Jl-Qf
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 09:51:10 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so617268bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 00:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rFGkot51xR9i68b58LXygr9jnpcJfWrFpkxhDKt44Ic=;
	b=X+E5cmhPteiCIFCwQA7oG2P69pfykrH/QPpKjXr++lfhP4sHOGhLF1vBNe22Q0It7k
	PxWu4r6OgLq4WjxkC1Nqtwc7Yv2SiuhFU0baRV0vYmzpSV7EgCdxIHDeUHuqF+pzMBMd
	rtaiaTqI+vOzV68i+lf90omWOYI+Tc3CwhXFU=
Received: by 10.204.7.199 with SMTP id e7mr1961801bke.40.1318405530406;
	Wed, 12 Oct 2011 00:45:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm1066491bkn.7.2011.10.12.00.45.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 00:45:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2011 09:45:04 +0200
Message-Id: <9e0189cadfc1211c918dac076619f71ec3e4d19a.1318405370.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
References: <49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318405370.git.Martin.Jansa@gmail.com>
References: <cover.1318405370.git.Martin.Jansa@gmail.com>
Subject: [oe-core 3/4] conf: machine: includes: add armv6-novfp support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2011 07:51:10 -0000

From: GNUtoo <GNUtoo@no-log.org>

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv6.inc  |   45 ++++++++++++++++---------
 meta/conf/machine/include/tune-arm1136j-s.inc |   10 +++++
 2 files changed, 39 insertions(+), 16 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-arm1136j-s.inc

diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 9f2e9ac..3dd6566 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -9,24 +9,37 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv6", "-march=armv6", "
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 # Little Endian
-AVAILTUNES += "armv6 armv6t armv6hf armv6thf"
-TUNE_FEATURES_tune-armv6 ?= "armv6 vfp"
-TUNE_FEATURES_tune-armv6t ?= "armv6 vfp thumb"
-TUNE_FEATURES_tune-armv6hf ?= "${TUNE_FEATURES_tune-armv6} callconvention-hard"
-TUNE_FEATURES_tune-armv6thf ?= "${TUNE_FEATURES_tune-armv6t} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6t = "${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6-vfp armv6t-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6hf = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp} armv6hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6thf = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp} armv6hf-vfp armv6thf-vfp"
+AVAILTUNES += "armv6 armv6t"
+TUNE_FEATURES_tune-armv6 ?= "armv6"
+TUNE_FEATURES_tune-armv6t ?= "armv6 thumb"
+PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv6"
+PACKAGE_EXTRA_ARCHS_tune-armv6t = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv6 armv6t"
+
+# Little Endian +  VFP
+AVAILTUNES += "armv6-vfp armv6t-vfp armv6hf-vfp armv6thf-vfp"
+TUNE_FEATURES_tune-armv6-vfp ?= "armv6 vfp"
+TUNE_FEATURES_tune-armv6t-vfp ?= "armv6 vfp thumb"
+TUNE_FEATURES_tune-armv6hf-vfp ?= "${TUNE_FEATURES_tune-armv6-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv6thf-vfp ?= "${TUNE_FEATURES_tune-armv6t-vfp} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv6-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5-vfp} armv6-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6t-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp} armv6-vfp armv6t-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6hf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp} armv6hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6thf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp} armv6hf-vfp armv6thf-vfp"
 
 # Big Endian
-AVAILTUNES += "armv6b armv6tb armv6hfb armv6thfb"
+AVAILTUNES += "armv6b armv6tb"
 TUNE_FEATURES_tune-armv6b ?= "${TUNE_FEATURES_tune-armv6} bigendian"
 TUNE_FEATURES_tune-armv6tb ?= "${TUNE_FEATURES_tune-armv6t} bigendian"
-TUNE_FEATURES_tune-armv6hfb ?= "${TUNE_FEATURES_tune-armv6b} callconvention-hard"
-TUNE_FEATURES_tune-armv6thfb ?= "${TUNE_FEATURES_tune-armv6tb} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp} armv6b-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b-vfp armv6tb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp} armv6hfb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6thfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp} armv6hfb-vfp armv6thfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv6b"
+PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv6b armv6tb"
 
+# Big Endian + VFP
+AVAILTUNES += "armv6b-vfp armv6tb-vfp armv6hfb-vfp armv6thfb-vfp"
+TUNE_FEATURES_tune-armv6b-vfp ?= "${TUNE_FEATURES_tune-armv6-vfp} bigendian"
+TUNE_FEATURES_tune-armv6tb-vfp ?= "${TUNE_FEATURES_tune-armv6t-vfp} bigendian"
+TUNE_FEATURES_tune-armv6hfb-vfp ?= "${TUNE_FEATURES_tune-armv6b-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv6thfb-vfp ?= "${TUNE_FEATURES_tune-armv6tb-vfp} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv6b-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv6b} armv6b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6tb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv6b-vfp armv6tb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6hfb-vfp = "armv6hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6thfb-vfp = "armv6hfb-vfp armv6thfb-vfp"
diff --git a/meta/conf/machine/include/tune-arm1136j-s.inc b/meta/conf/machine/include/tune-arm1136j-s.inc
new file mode 100644
index 0000000..ce9ae7c
--- /dev/null
+++ b/meta/conf/machine/include/tune-arm1136j-s.inc
@@ -0,0 +1,10 @@
+DEFAULTTUNE ?= "arm1136js"
+
+require conf/machine/include/arm/arch-armv6.inc
+
+TUNEVALID[arm1136js] = "Enable arm1136js specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm1136js", "-mtune=arm1136j-s", "", d)}"
+
+AVAILTUNES += "arm1136js"
+TUNE_FEATURES_tune-arm1136js = "${TUNE_FEATURES_tune-armv6t} arm1136js"
+PACKAGE_EXTRA_ARCHS_tune-arm1136js = "${PACKAGE_EXTRA_ARCHS_tune-armv6t}"
-- 
1.7.7



