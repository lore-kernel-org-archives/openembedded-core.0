Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8755C55171
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:27 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21192.1785666567050733877
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CQil/QsV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980dc26022so5707485e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666565; x=1786271365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qv+hgYGWi+d/k7yxW1dHkvrXF1GJ9mDSbRo1m9isgK8=;
        b=CQil/QsVe647PcHcxVkpy592r0phN+klq8nwA9fqXS7wWu1AblG7pzoGRDaPrxaZxU
         E+tsvJjKdXt5zV1vBFGgpdkVqH1orXpUtFsg1IFq6dUEyCGbKxCoudv93b4woe1SlPqx
         Nt8dM9EbA9tw7YKgbYX9whAbR7416o9rqm3fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666565; x=1786271365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qv+hgYGWi+d/k7yxW1dHkvrXF1GJ9mDSbRo1m9isgK8=;
        b=mAVYui8/r6HAQZgdmrDu5dq0+bKvHjfU9lsvnIyfzK1TCT3LkfEYtBOJIHgguZVGfR
         EfvQstyz5jvSA8tm2ovb99OHoKa8DMqrL0SjOpDZMZEpWIloVfXoZpIZZcAsv3g0y4g0
         cNpjoL8LzfwVlEKMPWZIzV9Oqf4XSlAXA/rAhW5SKAif6IrwjDW5ljDbrTrPkz50mcLm
         QInxDg5Ebe35mlDLZZSmbycbH27UOkzEOPqYG0RGZT4jKd25sIWcM/21ynzHeIdDa7Rz
         E3aOpioKIrT0ben7y6pAUw24RCHdetVzZOa89J9HU3xCiC+5o1nyC8GOgz3bYu53U2Qw
         M2Pw==
X-Gm-Message-State: AOJu0YzFbU0+aNgkXTMcvCrQhM/u3UKn0DCTi242VdDs5B4KXxI2u4LE
	RmyLwf9Qts8QEqlez1wUdws+jr8BUJygC9PSgr3JvMR+qxpAiX+QK9VgL7qajkqwmaq30cEQgVy
	Z16vOOas=
X-Gm-Gg: AR+sD12iJwJazzrnwceBJ8Q/1yWoEAJwHfpHcRrtW+tghN0ehI0I+Qo/+vP54+o2ltR
	fQxAvu1xQlv5aqR9uveROtVkaty/LQJKvkqC6gB6NOrka5TaasC67ZiyauHy5CrqsU3iP0HO/aT
	+/VMuHblbmd1lElA0T5/ijTWu/A+nW/KtU5g8N1SF9xg16GqDaSTP9NAm2S0d34B9DpxenCTxtb
	dr6L6Rnq/42soJF23dF28j3O288v8r/tkBqfav8RxbrLFwYYQxxvuLumN6v9UyS8EZMPX+lsGSE
	rXfm+B4lWnl4xOKtZGQAjs/b2+KW/D64ouuEhq7q4BoytXVMAFn08EjkBU0BA8HJaX2jxsDZyCB
	QSkiXevaHk86uvU7p7+VxpRA+IF4KVuoIAgEwigB+LY4stjIBX8DmgpQS2eTcE/DguE2zcYp8kw
	ejaxEMwVh2LCGZ+8tce9Ishlu7Edrc4Q+6zQY+lVUkaX48T6CNFzrBbsHiUlFnYxmVP9jilIBUr
	jLdf3LuV/Fkqk4d+w==
X-Received: by 2002:a05:600c:840f:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-4980c64520fmr106919075e9.2.1785666564863;
        Sun, 02 Aug 2026 03:29:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/25] utils: Move functions from utils.bbclass to utils.py
Date: Sun,  2 Aug 2026 11:28:51 +0100
Message-ID: <20260802102854.3952760-23-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242547

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass              |  2 +-
 meta/classes-global/package.bbclass           |  2 +-
 meta/classes-global/sanity.bbclass            |  8 +-
 meta/classes-global/utils.bbclass             | 90 -------------------
 meta/classes-recipe/cross-canadian.bbclass    |  2 +-
 meta/classes-recipe/image.bbclass             |  4 +-
 meta/classes-recipe/populate_sdk_base.bbclass | 10 +--
 meta/classes-recipe/populate_sdk_ext.bbclass  |  2 +-
 meta/classes/multilib.bbclass                 |  2 +-
 meta/conf/multilib.conf                       |  2 +-
 meta/lib/oe/utils.py                          | 85 ++++++++++++++++++
 meta/recipes-core/glibc/glibc-ld.inc          |  2 +-
 meta/recipes-core/meta/dummy-sdk-package.inc  |  2 +-
 meta/recipes-core/meta/meta-environment.bb    |  2 +-
 meta/recipes-core/meta/meta-go-toolchain.bb   |  2 +-
 .../packagegroup-cross-canadian.bb            |  6 +-
 .../packagegroup-go-cross-canadian.bb         |  2 +-
 .../packagegroup-rust-cross-canadian.bb       |  2 +-
 18 files changed, 111 insertions(+), 116 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 4684dbd60c8..8b4abe8f1e2 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -72,7 +72,7 @@ BASEDEPENDS:class-nativesdk = "${@get_base_dep(d)}"
 
 DEPENDS:prepend = "${BASEDEPENDS} "
 
-FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
+FILESPATH = "${@oe.utils.base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
 # THISDIR only works properly with imediate expansion as it has to run
 # in the context of the location its used (:=)
 THISDIR = "${@os.path.dirname(d.getVar('FILE'))}"
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index cb92b495714..3d293dead77 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -54,7 +54,7 @@ PKGDEST = "${WORKDIR}/packages-split"
 
 LOCALE_SECTION ?= ''
 
-ALL_MULTILIB_PACKAGE_ARCHS = "${@all_multilib_tune_values(d, 'PACKAGE_ARCHS')}"
+ALL_MULTILIB_PACKAGE_ARCHS = "${@oe.utils.all_multilib_tune_values(d, 'PACKAGE_ARCHS')}"
 
 # rpm is used for the per-file dependency identification
 # dwarfsrcfiles is used to determine the list of debug source files
diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 5c5cf311da1..91c22599bfe 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -720,13 +720,13 @@ def check_sanity_version_change(status, d):
 
     missing = ""
 
-    if not check_app_exists("${MAKE}", d):
+    if not oe.utils.check_app_exists("${MAKE}", d):
         missing = missing + "GNU make,"
 
-    if not check_app_exists('gcc', d):
+    if not oe.utils.check_app_exists('gcc', d):
         missing = missing + "C Compiler (gcc),"
 
-    if not check_app_exists('g++', d):
+    if not oe.utils.check_app_exists('g++', d):
         missing = missing + "C++ Compiler (g++),"
 
     # installing emacs on Ubuntu 24.04 pulls in emacs-gtk -> libgcc-14-dev despite gcc being 13
@@ -737,7 +737,7 @@ def check_sanity_version_change(status, d):
     required_utilities = d.getVar('SANITY_REQUIRED_UTILITIES')
 
     for util in required_utilities.split():
-        if not check_app_exists(util, d):
+        if not oe.utils.check_app_exists(util, d):
             missing = missing + "%s," % util
 
     if missing:
diff --git a/meta/classes-global/utils.bbclass b/meta/classes-global/utils.bbclass
index 443f0c65560..cee847594ee 100644
--- a/meta/classes-global/utils.bbclass
+++ b/meta/classes-global/utils.bbclass
@@ -265,96 +265,6 @@ hardlinkdir () {
 	(cd $from; find . -print0 | cpio --null -pdlu $to)
 }
 
-
-def check_app_exists(app, d):
-    app = d.expand(app).split()[0].strip()
-    path = d.getVar('PATH')
-    return bool(bb.utils.which(path, app))
-
-def base_set_filespath(path, d):
-    filespath = []
-    extrapaths = (d.getVar("FILESEXTRAPATHS") or "")
-    # Remove default flag which was used for checking
-    extrapaths = extrapaths.replace("__default:", "")
-    # Don't prepend empty strings to the path list
-    if extrapaths != "":
-        path = extrapaths.split(":") + path
-    # The ":" ensures we have an 'empty' override
-    overrides = (":" + (d.getVar("FILESOVERRIDES") or "")).split(":")
-    overrides.reverse()
-    for o in overrides:
-        for p in path:
-            if p != "":
-                filespath.append(os.path.join(p, o))
-    return ":".join(filespath)
-
-def extend_variants(d, var, extend, delim=':'):
-    """Return a string of all bb class extend variants for the given extend"""
-    variants = []
-    whole = d.getVar(var) or ""
-    for ext in whole.split():
-        eext = ext.split(delim)
-        if len(eext) > 1 and eext[0] == extend:
-            variants.append(eext[1])
-    return " ".join(variants)
-
-def multilib_pkg_extend(d, pkg):
-    variants = (d.getVar("MULTILIB_VARIANTS") or "").split()
-    if not variants:
-        return pkg
-    pkgs = pkg
-    for v in variants:
-        pkgs = pkgs + " " + v + "-" + pkg
-    return pkgs
-
-def get_multilib_datastore(variant, d):
-    return oe.utils.get_multilib_datastore(variant, d)
-
-def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
-    """Return a string of all ${var} in all multilib tune configuration"""
-    values = []
-    variants = (d.getVar("MULTILIB_VARIANTS") or "").split() + ['']
-    for item in variants:
-        localdata = get_multilib_datastore(item, d)
-        # We need WORKDIR to be consistent with the original datastore
-        localdata.setVar("WORKDIR", d.getVar("WORKDIR"))
-        value = localdata.getVar(var) or ""
-        if value != "":
-            if need_split:
-                for item in value.split(delim):
-                    values.append(item)
-            else:
-                values.append(value)
-    if unique:
-        #we do this to keep order as much as possible
-        ret = []
-        for value in values:
-            if not value in ret:
-                ret.append(value)
-    else:
-        ret = values
-    return " ".join(ret)
-
-def all_multilib_tune_list(vars, d):
-    """
-    Return a list of ${VAR} for each variable VAR in vars from each 
-    multilib tune configuration.
-    Is safe to be called from a multilib recipe/context as it can
-    figure out the original tune and remove the multilib overrides.
-    """
-    values = {}
-    for v in vars:
-        values[v] = []
-    values['ml'] = ['']
-
-    variants = (d.getVar("MULTILIB_VARIANTS") or "").split() + ['']
-    for item in variants:
-        localdata = get_multilib_datastore(item, d)
-        values[v].append(localdata.getVar(v))
-        values['ml'].append(item)
-    return values
-all_multilib_tune_list[vardepsexclude] = "OVERRIDES"
-
 # If the user hasn't set up their name/email, set some defaults
 check_git_config() {
 	if ! git config user.email > /dev/null ; then
diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes-recipe/cross-canadian.bbclass
index fe991f44bb5..25e67d9e079 100644
--- a/meta/classes-recipe/cross-canadian.bbclass
+++ b/meta/classes-recipe/cross-canadian.bbclass
@@ -94,7 +94,7 @@ python () {
     # Also need to handle multilib target vendors
     vendors = d.getVar("CANADIANEXTRAVENDOR")
     if not vendors:
-        vendors = all_multilib_tune_values(d, 'TARGET_VENDOR')
+        vendors = oe.utils.all_multilib_tune_values(d, 'TARGET_VENDOR')
     origvendor = d.getVar("TARGET_VENDOR_MULTILIB_ORIGINAL")
     if origvendor:
         d.setVar("TARGET_VENDOR", origvendor)
diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 53f1a9dc45b..460e5ab39fa 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -33,7 +33,7 @@ PACKAGES = ""
 DEPENDS += "depmodwrapper-cross cross-localedef-native"
 RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL} ${IMAGE_INSTALL_DEBUGFS}"
 RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
-PATH:prepend = "${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
+PATH:prepend = "${@":".join(oe.utils.all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -102,7 +102,7 @@ USE_DEPMOD ?= "1"
 PID = "${@os.getpid()}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-SSTATE_ARCHS_TUNEPKG = "${@all_multilib_tune_values(d, 'TUNE_PKGARCH')}"
+SSTATE_ARCHS_TUNEPKG = "${@oe.utils.all_multilib_tune_values(d, 'TUNE_PKGARCH')}"
 
 LDCONFIGDEPEND ?= "ldconfig-native:do_populate_sysroot"
 LDCONFIGDEPEND:libc-musl = ""
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 1d9faecc16b..a321e7ef445 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -11,7 +11,7 @@ PACKAGES = ""
 
 # This exists as an optimization for SPDX processing to only run in image and
 # SDK processing context.  This class happens to be common to these usages.
-SPDX_MULTILIB_SSTATE_ARCHS = "${@all_multilib_tune_values(d, 'SSTATE_ARCHS')}"
+SPDX_MULTILIB_SSTATE_ARCHS = "${@oe.utils.all_multilib_tune_values(d, 'SSTATE_ARCHS')}"
 
 inherit image-postinst-intercepts image-artifact-names nopackages
 
@@ -77,9 +77,9 @@ TOOLCHAIN_HOST_TASK ?= " \
 "
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= " \
-    ${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
-    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
-    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
+    ${@oe.utils.multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', oe.utils.multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', oe.utils.multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
     ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'kernel', 'kernel-devsrc', '', d)} \
     target-sdk-provides-dummy \
 "
@@ -119,7 +119,7 @@ python () {
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
 SDK_DEPENDS = "virtual/fakeroot-native ${SDK_ARCHIVE_DEPENDS} cross-localedef-native"
-PATH:prepend = "${WORKDIR}/recipe-sysroot/${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
+PATH:prepend = "${WORKDIR}/recipe-sysroot/${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(oe.utils.all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
 SDK_DEPENDS += "nativesdk-glibc-locale"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 7d28415ab37..8349e03db58 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -462,7 +462,7 @@ def prepare_locked_cache(d, baseoutpath, derivative, conf_initpath):
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = get_sdk_install_targets(d, images_only=True)
     sdk_targets = d.getVar('SDK_TARGETS')
-    ext_sdk_target_set = set(multilib_pkg_extend(d, sdk_targets).split())
+    ext_sdk_target_set = set(oe.utils.multilib_pkg_extend(d, sdk_targets).split())
     excluded_set = set(excluded_targets.split())
 
     # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included in the locked signatures,
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 6e90af261dc..7266f6661d9 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -32,7 +32,7 @@ python multilib_virtclass_handler () {
             d.setVar(name + "_MULTILIB_ORIGINAL", val)
 
     # We nearly don't need this but dependencies on NON_MULTILIB_RECIPES don't work without it
-    d.setVar("SSTATE_ARCHS_TUNEPKG", "${@all_multilib_tune_values(d, 'TUNE_PKGARCH')}")
+    d.setVar("SSTATE_ARCHS_TUNEPKG", "${@oe.utils.all_multilib_tune_values(d, 'TUNE_PKGARCH')}")
 
     overrides = e.data.getVar("OVERRIDES", False)
     pn = e.data.getVar("PN", False)
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index aff55c1e9da..d692723da3b 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -1,7 +1,7 @@
 
 baselib = "${@d.getVar('BASE_LIB:tune-' + (d.getVar('DEFAULTTUNE') or 'INVALID')) or d.getVar('BASELIB')}"
 
-MULTILIB_VARIANTS = "${@extend_variants(d,'MULTILIBS','multilib')}"
+MULTILIB_VARIANTS = "${@oe.utils.extend_variants(d,'MULTILIBS','multilib')}"
 MULTILIB_VARIANTS[vardeps] += "MULTILIBS"
 MULTILIB_SAVE_VARNAME = "DEFAULTTUNE TARGET_ARCH TARGET_SYS TARGET_VENDOR"
 
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 082f6cef74f..d24f49b875a 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -553,3 +553,88 @@ def make_arch_independent(d):
 
     d.setVar("qemu_wrapper_cmdline", "def qemu_wrapper_cmdline(data, rootfs_path, library_paths):\n    return 'false'")
 
+def base_set_filespath(path, d):
+    filespath = []
+    extrapaths = (d.getVar("FILESEXTRAPATHS") or "")
+    # Remove default flag which was used for checking
+    extrapaths = extrapaths.replace("__default:", "")
+    # Don't prepend empty strings to the path list
+    if extrapaths != "":
+        path = extrapaths.split(":") + path
+    # The ":" ensures we have an 'empty' override
+    overrides = (":" + (d.getVar("FILESOVERRIDES") or "")).split(":")
+    overrides.reverse()
+    for o in overrides:
+        for p in path:
+            if p != "":
+                filespath.append(os.path.join(p, o))
+    return ":".join(filespath)
+
+def check_app_exists(app, d):
+    app = d.expand(app).split()[0].strip()
+    path = d.getVar('PATH')
+    return bool(bb.utils.which(path, app))
+
+def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
+    """Return a string of all ${var} in all multilib tune configuration"""
+    values = []
+    variants = (d.getVar("MULTILIB_VARIANTS") or "").split() + ['']
+    for item in variants:
+        localdata = get_multilib_datastore(item, d)
+        # We need WORKDIR to be consistent with the original datastore
+        localdata.setVar("WORKDIR", d.getVar("WORKDIR"))
+        value = localdata.getVar(var) or ""
+        if value != "":
+            if need_split:
+                for item in value.split(delim):
+                    values.append(item)
+            else:
+                values.append(value)
+    if unique:
+        #we do this to keep order as much as possible
+        ret = []
+        for value in values:
+            if not value in ret:
+                ret.append(value)
+    else:
+        ret = values
+    return " ".join(ret)
+
+def all_multilib_tune_list(vars, d):
+    """
+    Return a list of ${VAR} for each variable VAR in vars from each
+    multilib tune configuration.
+    Is safe to be called from a multilib recipe/context as it can
+    figure out the original tune and remove the multilib overrides.
+    """
+    values = {}
+    for v in vars:
+        values[v] = []
+    values['ml'] = ['']
+
+    variants = (d.getVar("MULTILIB_VARIANTS") or "").split() + ['']
+    for item in variants:
+        localdata = oe.utils.get_multilib_datastore(item, d)
+        values[v].append(localdata.getVar(v))
+        values['ml'].append(item)
+    return values
+
+def extend_variants(d, var, extend, delim=':'):
+    """Return a string of all bb class extend variants for the given extend"""
+    variants = []
+    whole = d.getVar(var) or ""
+    for ext in whole.split():
+        eext = ext.split(delim)
+        if len(eext) > 1 and eext[0] == extend:
+            variants.append(eext[1])
+    return " ".join(variants)
+
+def multilib_pkg_extend(d, pkg):
+    variants = (d.getVar("MULTILIB_VARIANTS") or "").split()
+    if not variants:
+        return pkg
+    pkgs = pkg
+    for v in variants:
+        pkgs = pkgs + " " + v + "-" + pkg
+    return pkgs
+
diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/glibc/glibc-ld.inc
index da8fcc430b1..0fb8d090bc2 100644
--- a/meta/recipes-core/glibc/glibc-ld.inc
+++ b/meta/recipes-core/glibc/glibc-ld.inc
@@ -5,7 +5,7 @@ GLIBC_GETLOADER = "${@get_linuxloader(d)}"
 def glibc_dl_info(d):
     infos = {'ldconfig':set(), 'lddrewrite':set()}
 
-    loaders = all_multilib_tune_values(d, "GLIBC_GETLOADER").split()
+    loaders = oe.utils.all_multilib_tune_values(d, "GLIBC_GETLOADER").split()
     for loader in loaders:
         infos['ldconfig'].add('{"' + loader + '",' + "FLAG_ELF_LIBC6" + ' }')
         infos['lddrewrite'].add(loader)
diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index 60dfe9f73bb..d2781a64643 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -24,7 +24,7 @@ PR[vardeps] += "DUMMYPROVIDES"
 PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
 
 DUMMYPROVIDES_PACKAGES ??= ""
-DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
+DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([oe.utils.multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
 DUMMYPROVIDES += "${DUMMYPROVIDES_PACKAGES_MULTILIB}"
 
 python populate_packages:prepend() {
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index e2590993130..f8140612817 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -21,7 +21,7 @@ inherit cross-canadian
 do_generate_content[cleandirs] = "${SDK_OUTPUT}"
 do_generate_content[dirs] = "${SDK_OUTPUT}/${SDKPATH}"
 # Need to ensure we have the virtual mappings and site files for all multtilib variants
-do_generate_content[depends] = "${@oe.utils.build_depends_string(all_multilib_tune_values(d, 'TOOLCHAIN_NEED_CONFIGSITE_CACHE'), 'do_populate_sysroot')}"
+do_generate_content[depends] = "${@oe.utils.build_depends_string(oe.utils.all_multilib_tune_values(d, 'TOOLCHAIN_NEED_CONFIGSITE_CACHE'), 'do_populate_sysroot')}"
 python do_generate_content() {
     # Handle multilibs in the SDK environment, siteconfig, etc files...
     localdata = bb.data.createCopy(d)
diff --git a/meta/recipes-core/meta/meta-go-toolchain.bb b/meta/recipes-core/meta/meta-go-toolchain.bb
index 758963d1e58..cb2b11bb1eb 100644
--- a/meta/recipes-core/meta/meta-go-toolchain.bb
+++ b/meta/recipes-core/meta/meta-go-toolchain.bb
@@ -8,7 +8,7 @@ TOOLCHAIN_HOST_TASK:append = " \
 "
 
 TOOLCHAIN_TARGET_TASK:append = " \
-    ${@multilib_pkg_extend(d, 'packagegroup-go-sdk-target')} \
+    ${@oe.utils.multilib_pkg_extend(d, 'packagegroup-go-sdk-target')} \
 "
 # rv32/ppc32 do not support go
 COMPATIBLE_HOST:riscv32 = "null"
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 49c075eb116..4b0499b1b97 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -11,9 +11,9 @@ GCC = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 GDB = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 RDEPENDS:${PN} = "\
-    ${@all_multilib_tune_values(d, 'BINUTILS')} \
-    ${@all_multilib_tune_values(d, 'GCC')} \
-    ${@all_multilib_tune_values(d, 'GDB')} \
+    ${@oe.utils.all_multilib_tune_values(d, 'BINUTILS')} \
+    ${@oe.utils.all_multilib_tune_values(d, 'GCC')} \
+    ${@oe.utils.all_multilib_tune_values(d, 'GDB')} \
     meta-environment-${MACHINE} \
     "
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb
index d0596efe7a7..56c2a73f467 100644
--- a/meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb
@@ -8,5 +8,5 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 GO = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 RDEPENDS:${PN} = " \
-    ${@all_multilib_tune_values(d, 'GO')} \
+    ${@oe.utils.all_multilib_tune_values(d, 'GO')} \
 "
diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
index 7e220d2cce6..c73c8d33335 100644
--- a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
@@ -8,7 +8,7 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 RUST = "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 RDEPENDS:${PN} = " \
-    ${@all_multilib_tune_values(d, 'RUST')} \
+    ${@oe.utils.all_multilib_tune_values(d, 'RUST')} \
     nativesdk-binutils \
     nativesdk-gcc \
     nativesdk-glibc-dev \

