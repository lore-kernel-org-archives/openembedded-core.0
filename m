Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46431EB64DD
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 02:31:24 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.23082.1689993073851446932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 19:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fdo8SPG9;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-40551e2deebso3707611cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 19:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689993073; x=1690597873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9F2g25EnmS3+EK+6YH8AnDTkbcuSJe2d7sbs6yAHHFU=;
        b=fdo8SPG9kjDJUwsHitDkffH3a+PBofyYEcBUY6+jWR9wt1xGNjtkPcM7KwAR4QomeY
         x2BnW6r5xA12rE0qX0og4E9Iaa7j4H1cDH3yZd21XkFBNDZrEoRvpiwiRWb8UC40QEId
         VjzbYuz2E4PKnVXYJ4TSh/mUPD6Su9rBtnFn8/bFivO3D7EDcTswFxp7mnu66j7vVE3I
         LWs7Kl276OfrgDdK8MSWUDe5PNJCL9EWY0Cr/bZBK+td+brUfbKztzcxVaMnZrUAgOXh
         DOUR0DaqLwzQ8nAZXUFy0SYV94trFEQAaOcRvyjawc6o/dd2G/AXmEnT9LuQBVMzVeL6
         3pmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689993073; x=1690597873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9F2g25EnmS3+EK+6YH8AnDTkbcuSJe2d7sbs6yAHHFU=;
        b=TRZSivRVUIR1IlBNfqUBAjRLjN++gJeOyssDwC8tpmXIbRyxxAdYNekTmLFuSMa744
         ujreEn+BeHjJ+o5tYt/h/covTlCS37YDN6kpVNC2bZRZjtK5ezf6iymqVbctnkx5pn5V
         yBLibUMHpePESs76jpDij1M2ntetgPJwf857gQlpp7hdqqLP+fVcvIZDmg91VcMw5JBD
         vHh1KPLvFTDVRlKOzU7ECLeTbQ/Gdj16WYFrpmocF8J2ngJ+dJ820dDEJ3CkeeO71agY
         35fLa4Ket95yFD9UPHrEC6YpeaoYbjSkfXoqztHxRl8NrBxboNjTtkmwBSABTbdb1reI
         rxVA==
X-Gm-Message-State: ABy/qLaRkVlKF1Zt+ZnqqB9Hv8PLtBHALqQMDzDm5Wz3Fh0kfTHZ6KBa
	2mUXIGb9T/mU+hsPY4ogiOI=
X-Google-Smtp-Source: APBJJlHBNFb/T2Dt+879+mOty7021iV6AmyRssiELffUow5wyKZu0sFbLd9q0aj/cTK6QAoY//Cy+A==
X-Received: by 2002:a05:622a:1352:b0:3f7:f9e2:7187 with SMTP id w18-20020a05622a135200b003f7f9e27187mr2083620qtk.7.1689993072602;
        Fri, 21 Jul 2023 19:31:12 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id z10-20020ac8710a000000b003f9bccc3182sm1703114qto.32.2023.07.21.19.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 19:31:11 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel: make LOCALVERSION consistent between recipes
Date: Fri, 21 Jul 2023 22:31:09 -0400
Message-Id: <20230722023110.1039163-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 02:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184712

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The initial fix for localversion setting in 6.3+ broke older
recipes and also broke recipes setting localversion in a kernel
recipe, as make-mod-scripts (and other locations) can trigger
a regeneration of files and don't have access to the variable.

Moving the setting of this variable to the global namespace
doesn't make sense, so we follow the example of the kernel-abiversion
and save a kernel-localversion to the build artifacts.

Recipes that may regenerate scripts/dynamic files, must
depend on the do_shared_workedir of the kernel and use the helper
function to read the file storing the localversion.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

This is the first iteration of the localversion fix. I tested this
against 6.1 and 6.4, both with and without a KERNEL_LOCALVERSION
set, and I was able to build and load external modules in all
configurations.

I made the export of LOCALVERSION broad enough that any kernel
build component that needs to regenerate scripts should pick up
the value and we'll have a consistent localversion.

This of course follows the lead of what we did with abiversion,
but is a bit simpler, since we don't need it for depmod, etc.

I've noticed a few issues with the way that the -abiversion and
-localversion files are handled with respect to package names,
as well as how on-target module compilation can have issues
outside of a .config based localversion .. but those are existing
issues and they can be addressed once we've fixed up module
loading when LOCALVERSION is set.

I say "first iteration", as I'm sure there's some sstate or
corner case I missed, but I have broad enough testing now that
it needs more eyes and soaking.

Bruce


 meta/classes-recipe/kernel-arch.bbclass            |  8 --------
 meta/classes-recipe/kernel.bbclass                 | 14 ++++++++++++++
 meta/classes-recipe/kernelsrc.bbclass              |  1 +
 meta/classes-recipe/linux-kernel-base.bbclass      | 11 +++++++++++
 meta/classes-recipe/module-base.bbclass            |  1 +
 .../make-mod-scripts/make-mod-scripts_1.0.bb       |  3 +++
 6 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index df4884b6c4..b0db99faa3 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -79,11 +79,3 @@ KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 KERNEL_STRIP = "${CCACHE}${HOST_PREFIX}strip ${HOST_STRIP_KERNEL_ARCH}"
 TOOLCHAIN ?= "gcc"
-
-# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" in
-# the local version. Having it empty means nothing will be added, and any
-# value will be appended to the local kernel version. This replaces the
-# use of .scmversion file for setting a localversion without using
-# the CONFIG_LOCALVERSION option.
-KERNEL_LOCALVERSION ??= ""
-export LOCALVERSION ?= "${KERNEL_LOCALVERSION}"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index b3865dcb0f..907cc4f61a 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -550,6 +550,7 @@ do_shared_workdir () {
 	#
 
 	echo "${KERNEL_VERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
+	echo "${KERNEL_LOCALVERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-localversion
 
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
@@ -639,6 +640,19 @@ python check_oldest_kernel() {
 check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
 do_configure[prefuncs] += "check_oldest_kernel"
 
+KERNEL_LOCALVERSION ??= ""
+
+# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" in
+# the local version. Having it empty means nothing will be added, and any
+# value will be appended to the local kernel version. This replaces the
+# use of .scmversion file for setting a localversion without using
+# the CONFIG_LOCALVERSION option.
+#
+# Note: This class saves the value of localversion to a file
+# so other recipes like make-mod-scripts can restore it via the
+# helper function get_kernellocalversion_file
+export LOCALVERSION="${KERNEL_LOCALVERSION}"
+
 kernel_do_configure() {
 	# fixes extra + in /lib/modules/2.6.37+
 	# $ scripts/setlocalversion . => +
diff --git a/meta/classes-recipe/kernelsrc.bbclass b/meta/classes-recipe/kernelsrc.bbclass
index a32882a5d2..ecb02dc9ed 100644
--- a/meta/classes-recipe/kernelsrc.bbclass
+++ b/meta/classes-recipe/kernelsrc.bbclass
@@ -11,6 +11,7 @@ do_patch[depends] += "virtual/kernel:do_shared_workdir"
 do_patch[noexec] = "1"
 do_package[depends] += "virtual/kernel:do_populate_sysroot"
 KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
+LOCAL_VERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
 
 inherit linux-kernel-base
 
diff --git a/meta/classes-recipe/linux-kernel-base.bbclass b/meta/classes-recipe/linux-kernel-base.bbclass
index 65cc48f304..e2187a73f0 100644
--- a/meta/classes-recipe/linux-kernel-base.bbclass
+++ b/meta/classes-recipe/linux-kernel-base.bbclass
@@ -39,6 +39,17 @@ def get_kernelversion_file(p):
     except IOError:
         return None
 
+def get_kernellocalversion_file(p):
+    fn = p + '/kernel-localversion'
+
+    try:
+        with open(fn, 'r') as f:
+            return f.readlines()[0].strip()
+    except IOError:
+        return ""
+
+    return ""
+
 def linux_module_packages(s, d):
     suffix = ""
     return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
diff --git a/meta/classes-recipe/module-base.bbclass b/meta/classes-recipe/module-base.bbclass
index 094b563b1a..2a225881ba 100644
--- a/meta/classes-recipe/module-base.bbclass
+++ b/meta/classes-recipe/module-base.bbclass
@@ -20,6 +20,7 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
 export KBUILD_OUTPUT = "${STAGING_KERNEL_BUILDDIR}"
 
 export KERNEL_VERSION = "${@oe.utils.read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
+export LOCALVERSION = "${@oe.utils.read_file('${STAGING_KERNEL_BUILDDIR}/kernel-localversion')}"
 KERNEL_OBJECT_SUFFIX = ".ko"
 
 # kernel modules are generally machine specific
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index e3b258753f..a91680d497 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -21,6 +21,9 @@ DEPENDS += "gmp-native"
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
+KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
+export LOCALVERSION="${KERNEL_LOCALVERSION}"
+
 # Build some host tools under work-shared.  CC, LD, and AR are probably
 # not used, but this is the historical way of invoking "make scripts".
 #
-- 
2.34.1


