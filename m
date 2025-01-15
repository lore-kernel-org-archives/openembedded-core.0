Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333B9C02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 20:48:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.32963.1736974115731195091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 12:48:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KtZsCo5M;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3863703258fso875907f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 12:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736974114; x=1737578914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWMj5bN5fuGXE1UhIqy2X0p3f9SZ3z6P7lxQm/+LWpc=;
        b=KtZsCo5MxQrQu2QqOipx0PJB72vQD1ZAZ2fDytnF6I2JKgrFPBcQvQ+pnBExfFxc9D
         dsyQ6jAcF2EqlKsFu5VCJoZ6nUVQ5N/GPHRtAFcQ/3NuwH3uOrHDeZsSq1Lx066Hcr3W
         drg74HOiTWv7hBlITQBlafRn5ttHkW4LBXcp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736974114; x=1737578914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWMj5bN5fuGXE1UhIqy2X0p3f9SZ3z6P7lxQm/+LWpc=;
        b=etDGntfSOImQaqBujYG1NFME/2XEE9aWNTZF33CvPWi3VnFryVeQK+qkmX1QVj9Ylv
         MBH/6RVk2NTUjhC0Fm9Pyux7D/LxVFKPsV2112sfzWvuM7fg3eJ05mtKDj1MJwkV2qSr
         Y4ifIKG6E7aGxgmv0rIKRv64V82Ckk9RsB/jbToFhE3I+Ko8EIFVdR+fFI9F/BfmG3Qm
         QFdHZTc8KoB1cJzmxKQryjcaChNYDwaA3JSNWUbqDp/HInLaCBjEn1kLoYImmc5x0vXN
         uabcU1oyqkSoqGfrw8oIrI+QOAU2MHOecFVX20aCq6I/8+Nc+NwuhJrAPwXRrlD4W09G
         NFAg==
X-Gm-Message-State: AOJu0YwSlh3qMrrxRNPUglEt41qyLA/6gOjQA6bWPErEk+rslc3/y1ow
	1YN4hBHDI62He59oauRe9Ud5Tp1fakLzFa+p5tUbX7uen4iKSfKiF1M/+Q7LiNzRhHaiW+ic4PI
	OEUo=
X-Gm-Gg: ASbGncto7c356k+YL5t4kIbh4kge4DA2zdJl11xDr3+GSLtsKgYMQR+bdAGJasg2Ist
	zXbgc4HeNuI3HdQtk91lj1XCJkqu3qtAr28LipCn1InYvIrylGvkeCUJ1zlO0ayhqWee8mlPcH/
	ZF6b7UZux5jrCRkagr3dQuIB2AoLxOYNUiEx2JPJqmUQHUdzpUyo6sbXaWoEU+0yPF1HwZILyTC
	qo2JkPWt6ZKsOTNL5AL2scYm8iyTl1g5KBU6uK+etYeQpy5dieGMZT1QEHp7pMq6ruC93pLniI/
	Rd/obOwaWA==
X-Google-Smtp-Source: AGHT+IEmE7lBciztmx6ZYfEYH1qng1QlrxL7Tyu/nDBuzlyeF+GbD4Z8KnT3WYL5RSsLJMJrXs8pdQ==
X-Received: by 2002:a05:6000:1889:b0:38b:d807:f3be with SMTP id ffacd0b85a97d-38bec4eecbemr75953f8f.3.1736974113470;
        Wed, 15 Jan 2025 12:48:33 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:36ca:bea8:400e:f60e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80d4sm18137766f8f.85.2025.01.15.12.48.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 12:48:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] base: Add virtual/cross-XXX recipe specific provider control handling
Date: Wed, 15 Jan 2025 20:48:30 +0000
Message-ID: <20250115204830.4030611-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250115204830.4030611-1-richard.purdie@linuxfoundation.org>
References: <20250115204830.4030611-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 20:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209927

Currently, providers are set on a global config basis. This change allows
for a select set of providers configured in RECIPE_VIRTUAL_PROVIDERS to
be selected on a per recipe basis. This would allow for the selection of
virtual/cross-cc as gcc or clang for example.

Note that this only works for values in DEPENDS, values in task[depends]
flag values need to use the ${PREFERRED_PROVIDER_virtual/xxx} method, as
used in this patch in a handful of places.

The PROVIDERS are removed from the recipes so that if a version of the
dependency accidentally slips through, the build will fail and the user
can correct the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass               | 18 ++++++++++++++++++
 meta/classes-global/staging.bbclass            |  4 ++--
 meta/classes-recipe/kernel-yocto.bbclass       |  4 ++--
 meta/classes/multilib_global.bbclass           |  6 ++++++
 meta/conf/distro/include/default-providers.inc |  1 +
 .../binutils/binutils-cross.inc                |  1 -
 .../binutils/binutils-crosssdk_2.43.1.bb       |  2 --
 meta/recipes-devtools/gcc/gcc-cross.inc        |  1 -
 8 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index dbbf6cef8c8..3d623c80a91 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -542,6 +542,24 @@ python () {
         d.setVarFlag('do_devshell', 'fakeroot', '1')
         d.appendVarFlag('do_devshell', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
 
+    # Horrible duplication with allarch as we need to set this before expanding DEPENDS below.
+    if d.getVar("PACKAGE_ARCH") == "all":
+        d.setVar("INHIBIT_DEFAULT_DEPS", "1")
+
+    # Handle recipe level PREFERRED_PROVIDERs
+    depends = (d.getVar("DEPENDS") or "").split()
+    virtprovs = (d.getVar("RECIPE_VIRTUAL_PROVIDERS") or "").split()
+    newdeps = []
+    for dep in depends:
+        if dep in virtprovs:
+            newdep = d.getVar("PREFERRED_PROVIDER_" + dep)
+            if not newdep:
+                 bb.fatal("Error, recipe virtual provider PREFERRED_PROVIDER_%s not set" % dep)
+            newdeps.append(newdep)
+        else:
+            newdeps.append(dep)
+    d.setVar("DEPENDS", " ".join(newdeps))
+
     need_machine = d.getVar('COMPATIBLE_MACHINE')
     if need_machine and not bb.utils.to_boolean(d.getVar('PARSE_ALL_RECIPES', False)):
         import re
diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index c58ac63c57d..55581e129b6 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -128,8 +128,8 @@ do_populate_sysroot[vardeps] += "${SYSROOT_PREPROCESS_FUNCS}"
 do_populate_sysroot[vardepsexclude] += "BB_MULTI_PROVIDER_ALLOWED"
 
 POPULATESYSROOTDEPS = ""
-POPULATESYSROOTDEPS:class-target = "virtual/cross-binutils:do_populate_sysroot"
-POPULATESYSROOTDEPS:class-nativesdk = "virtual/sdk-binutils:do_populate_sysroot"
+POPULATESYSROOTDEPS:class-target = "${PREFERRED_PROVIDER_virtual/cross-binutils}:do_populate_sysroot"
+POPULATESYSROOTDEPS:class-nativesdk = "${PREFERRED_PROVIDER_virtual/cross-binutils}:do_populate_sysroot"
 do_populate_sysroot[depends] += "${POPULATESYSROOTDEPS}"
 
 SSTATETASKS += "do_populate_sysroot"
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index dea9eba1c2b..b8ace98787e 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -454,8 +454,8 @@ do_qa_unpack() {
     return
 }
 
-do_kernel_configme[depends] += "virtual/cross-binutils:do_populate_sysroot"
-do_kernel_configme[depends] += "virtual/cross-cc:do_populate_sysroot"
+do_kernel_configme[depends] += "${PREFERRED_PROVIDER_virtual/cross-binutils}:do_populate_sysroot"
+do_kernel_configme[depends] += "${PREFERRED_PROVIDER_virtual/cross-cc}:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
 do_kernel_configme[dirs] += "${S} ${B}"
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index c95c3a586d3..fcdda265ac7 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -155,6 +155,12 @@ def preferred_ml_updates(d):
             extramp.append(translate_provide(pref, p))
     d.setVar("BB_MULTI_PROVIDER_ALLOWED", " ".join(mp + extramp))
 
+    virtprovs = d.getVar("RECIPE_VIRTUAL_PROVIDERS").split()
+    for p in virtprovs.copy():
+        for pref in prefixes:
+            virtprovs.append(translate_provide(pref, p))
+    d.setVar("RECIPE_VIRTUAL_PROVIDERS", " ".join(virtprovs))
+
     abisafe = (d.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
     extras = []
     for p in prefixes:
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 506d77811fa..881cc64a007 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -1,6 +1,7 @@
 #
 # Default virtual providers
 #
+RECIPE_VIRTUAL_PROVIDERS = "virtual/cross-cc virtual/cross-c++ virtual/cross-binutils virtual/cross-sdk-cc virtual/cross-sdk-c++ virtual/cross-sdk-binutils"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/egl ?= "mesa"
diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index b908393c1f8..9c371e7e137 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -1,5 +1,4 @@
 inherit cross
-PROVIDES = "virtual/cross-binutils"
 
 PN = "binutils-cross-${TARGET_ARCH}"
 BPN = "binutils"
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb
index afc91a9b3bd..6752659304e 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb
@@ -1,7 +1,5 @@
 require binutils-cross_${PV}.bb
 
-PROVIDES = "virtual/cross-sdk-binutils"
-
 inherit crosssdk
 
 PN = "binutils-crosssdk-${SDK_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 4549f92c2f7..7afdf585779 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -3,7 +3,6 @@ inherit cross
 INHIBIT_DEFAULT_DEPS = "1"
 EXTRADEPENDS = ""
 DEPENDS = "virtual/cross-binutils ${EXTRADEPENDS} ${NATIVEDEPS}"
-PROVIDES = "virtual/cross-cc virtual/c++"
 python () {
     if d.getVar("TARGET_OS").startswith("linux"):
         d.setVar("EXTRADEPENDS", "linux-libc-headers")

