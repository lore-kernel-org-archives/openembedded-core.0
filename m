Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04263C55183
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:07 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21176.1785666540999244573
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WWCHVfuX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so5988825e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666539; x=1786271339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sQTQzgWJW0iOkR18nZdh3mOTnZcKQKKSMIZ8BpTY2AQ=;
        b=WWCHVfuX6OiBESGBg1SKyf5ajwyJ+okOa3lMQkJxSsSgEuW0xJ5pRKdfCzEc/h8GWH
         Ws0fbqUj8S8nKuznMiWGGjeNQwiCAij37vqaj60iEe69ipfvgIcftJdh0lBmfpg6k23k
         eC4RN+tu5fUW6PUyA746gU2p2AVXLmoBIMtbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666539; x=1786271339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sQTQzgWJW0iOkR18nZdh3mOTnZcKQKKSMIZ8BpTY2AQ=;
        b=FQCeJDcSF3FmFa2F4zU5BURRFj5exLvY8SchqBhGDwASPVparslfmziikqlQabB7mP
         1XBk1iy/J2ZfdNJUcyqGrUS44m9sMwsEV6V6kndxqgmVH9GV0oFs19rcCSFrVL60/SOB
         Rc1W+NerfIzxVpPtt/eWy2QO0ptCmhmwEMmcv2R4xtG/aWnhD/Zha0PLLd8m5/6EGVZW
         FTyuB/8yJzxa+Cnq/5ScbwVH8tV+RVqQeYLAeSgOTjzbfFZGvqeSNS0asrscrmuCcry4
         AOnFIcNyfPlC2HBGk6AD/tIvAAKV5R3MC0j8jNscEP3jN5YlAB8MTJ3vk569h7V6xuXq
         o5/A==
X-Gm-Message-State: AOJu0Yw61AoVDziXd94Dp97QkNZJX6U9lEtB0GSYPQImz5Qz1jML/sZJ
	tTKO1lmIEOE9kLyfQ9hbeNN9a/m46zeRtbEQ8dbDbtS1+/fOEm+tvfbEPV4yWJuJ6E8Dr2fxN/2
	wtTCuqEs=
X-Gm-Gg: AR+sD12Kl3Csd9V1RS1uu8q0rZPyPLvRGkuQLdLoPbo/DKMB/4lvpJPfRWOqX3To0aX
	SAFrtKcjv6QeD4T3wtOe527litRV4l6yHHiP5+I8KqppLX9fgmS2Ui713yAiy+7b4Xb49Vc1QCP
	JvndpXY4fiJek/uv78G50q7i+gHibwr8kx+yZrN0pt3MnkASLx5kcMGO3H8RWlKQExySii9XszT
	O/mmuDp8TGHu6237qk8PIBIuia+HkfFRERvLuhDZspmlWH6Tuoo0sUT1jKq4sheaabBAmahz63Y
	rfRiCcgyo40neL+7OwSQrwVsEZ5/vxGCqxcNoAENZ5DJms6CWjSGPfxt2QeCcNeQBAQ/cmnyDnL
	Rp+LKu660Mva9GiuymEMCCEIVa+F1vOSdiFFvX72XOvhN9W0jEuPP1BA8rq24VibflV/qbLBj/V
	TgAkD4FZy3ErvAjJ6TnopBeSzTHbo6RrKK0yQCPt1rCh8R8xos0+m40bYb1QSXA6x5kwd0P9JHp
	cs8yGxlVg8lbwvXVA==
X-Received: by 2002:a05:600c:4504:b0:493:c194:4e7a with SMTP id 5b1f17b1804b1-4980c66c9a8mr115078355e9.3.1785666539176;
        Sun, 02 Aug 2026 03:28:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.28.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:28:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/25] lib/oe/kernel: Move python functions from linux-kernel-base to library code
Date: Sun,  2 Aug 2026 11:28:32 +0100
Message-ID: <20260802102854.3952760-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242528

This means get_kernelXXX needs to become oe.kernel.get_XXX and means we can
clear linux-kernel-base to allow it to be removed, starting to simplify the
file structure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel.bbclass            |  4 +-
 meta/classes-recipe/kernelsrc.bbclass         |  4 +-
 meta/classes-recipe/linux-kernel-base.bbclass | 46 -----------------
 meta/lib/oe/__init__.py                       |  2 +-
 meta/lib/oe/kernel.py                         | 51 +++++++++++++++++++
 .../linux/linux-yocto-fitimage.bb             |  2 +-
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |  2 +-
 7 files changed, 58 insertions(+), 53 deletions(-)
 create mode 100644 meta/lib/oe/kernel.py

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 91248467bef..aeaec8ccbd4 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -233,7 +233,7 @@ KERNEL_DTBVENDORED ?= "0"
 #
 # configuration
 #
-KERNEL_VERSION = "${@get_kernelversion_headers('${B}')}"
+KERNEL_VERSION = "${@oe.kernel.get_version_headers('${B}')}"
 
 # kernels are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -643,7 +643,7 @@ KERNEL_LOCALVERSION ??= ""
 #
 # Note: This class saves the value of localversion to a file
 # so other recipes like make-mod-scripts can restore it via the
-# helper function get_kernellocalversion_file
+# helper function oe.kernel.get_localversion_file
 export LOCALVERSION = "${KERNEL_LOCALVERSION}"
 
 kernel_do_configure() {
diff --git a/meta/classes-recipe/kernelsrc.bbclass b/meta/classes-recipe/kernelsrc.bbclass
index 93361842989..b105fc15990 100644
--- a/meta/classes-recipe/kernelsrc.bbclass
+++ b/meta/classes-recipe/kernelsrc.bbclass
@@ -10,8 +10,8 @@ deltask do_unpack
 do_patch[depends] += "virtual/kernel:do_shared_workdir"
 do_patch[noexec] = "1"
 do_package[depends] += "virtual/kernel:do_populate_sysroot"
-KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-LOCAL_VERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
+KERNEL_VERSION = "${@oe.kernel.get_version_file("${STAGING_KERNEL_BUILDDIR}")}"
+LOCAL_VERSION = "${@oe.kernel.get_localversion_file("${STAGING_KERNEL_BUILDDIR}")}"
 
 inherit linux-kernel-base
 
diff --git a/meta/classes-recipe/linux-kernel-base.bbclass b/meta/classes-recipe/linux-kernel-base.bbclass
index 76d8b4d4513..566b2c96ba7 100644
--- a/meta/classes-recipe/linux-kernel-base.bbclass
+++ b/meta/classes-recipe/linux-kernel-base.bbclass
@@ -4,52 +4,6 @@
 # SPDX-License-Identifier: MIT
 #
 
-# parse kernel ABI version out of <linux/version.h>
-def get_kernelversion_headers(p):
-    import re
-
-    fn = p + '/include/linux/utsrelease.h'
-    if not os.path.isfile(fn):
-        # after 2.6.33-rc1
-        fn = p + '/include/generated/utsrelease.h'
-    if not os.path.isfile(fn):
-        fn = p + '/include/linux/version.h'
-
-    try:
-        f = open(fn, 'r')
-    except IOError:
-        return None
-
-    l = f.readlines()
-    f.close()
-    r = re.compile("#define UTS_RELEASE \"(.*)\"")
-    for s in l:
-        m = r.match(s)
-        if m:
-            return m.group(1)
-    return None
-
-
-def get_kernelversion_file(p):
-    fn = p + '/kernel-abiversion'
-
-    try:
-        with open(fn, 'r') as f:
-            return f.readlines()[0].strip()
-    except IOError:
-        return None
-
-def get_kernellocalversion_file(p):
-    fn = p + '/kernel-localversion'
-
-    try:
-        with open(fn, 'r') as f:
-            return f.readlines()[0].strip()
-    except IOError:
-        return ""
-
-    return ""
-
 export KBUILD_BUILD_VERSION = "1"
 export KBUILD_BUILD_USER ?= "oe-user"
 export KBUILD_BUILD_HOST ?= "oe-host"
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 13d887a4aad..faa9987c8ca 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -12,4 +12,4 @@ __path__ = extend_path(__path__, __name__)
 BBIMPORTS = ["qa", "data", "path", "utils", "types", "package", "packagedata", \
              "packagegroup", "sstatesig", "lsb", "cachedpath", "license", "qemu", \
              "reproducible", "rust", "buildcfg", "go", "spdx30_tasks", "spdx_common", \
-             "cve_check", "tune", "classextend", "purl"]
+             "cve_check", "tune", "classextend", "purl", "kernel"]
diff --git a/meta/lib/oe/kernel.py b/meta/lib/oe/kernel.py
new file mode 100644
index 00000000000..421debed9af
--- /dev/null
+++ b/meta/lib/oe/kernel.py
@@ -0,0 +1,51 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import re
+
+# parse kernel ABI version out of <linux/version.h>
+def get_version_headers(p):
+    fn = p + '/include/linux/utsrelease.h'
+    if not os.path.isfile(fn):
+        # after 2.6.33-rc1
+        fn = p + '/include/generated/utsrelease.h'
+    if not os.path.isfile(fn):
+        fn = p + '/include/linux/version.h'
+
+    try:
+        f = open(fn, 'r')
+    except IOError:
+        return None
+
+    l = f.readlines()
+    f.close()
+    r = re.compile("#define UTS_RELEASE \"(.*)\"")
+    for s in l:
+        m = r.match(s)
+        if m:
+            return m.group(1)
+    return None
+
+
+def get_version_file(p):
+    fn = p + '/kernel-abiversion'
+
+    try:
+        with open(fn, 'r') as f:
+            return f.readlines()[0].strip()
+    except IOError:
+        return None
+
+def get_localversion_file(p):
+    fn = p + '/kernel-localversion'
+
+    try:
+        with open(fn, 'r') as f:
+            return f.readlines()[0].strip()
+    except IOError:
+        return ""
+
+    return ""
diff --git a/meta/recipes-kernel/linux/linux-yocto-fitimage.bb b/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
index 4dcffb62094..75dbcb2af5c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
@@ -10,4 +10,4 @@ inherit linux-kernel-base kernel-fit-image
 
 # Set the version of this recipe to the version of the included kernel
 # (without taking the long way around via PV)
-PKGV = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
+PKGV = "${@oe.kernel.get_version_file("${STAGING_KERNEL_BUILDDIR}")}"
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 338a50de916..ab984f4bcfe 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -24,7 +24,7 @@ DEPENDS += "virtual/cross-cc virtual/cross-binutils"
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
-KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
+KERNEL_LOCALVERSION = "${@oe.kernel.get_localversion_file("${STAGING_KERNEL_BUILDDIR}")}"
 export LOCALVERSION = "${KERNEL_LOCALVERSION}"
 
 # Build some host tools under work-shared.  CC, LD, and AR are probably

