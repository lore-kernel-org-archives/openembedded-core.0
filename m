Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED4DC433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 11:05:21 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.10207.1636023920752069587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 04:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OTcDntCD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id t30so7941137wra.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 04:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CX9V2prFz17tjhwUK/+U/XCQ5oHRPPDNvij0HF9UR7E=;
        b=OTcDntCDKxp3spcwYivty/LvxmjcKmk6PZcjNW0He9BCNvz6GlvWXngcB3nJvvqVQ1
         SVMH0vx4yPrW+N73HSTbNWmJrK589aWZYx0tr43gjD4vjagS8RrGWTX2faimA8LqyfFl
         1TIUJ0Ubk0lh/H1YJ8Ty2AGrsdCPQ8rUBQz38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CX9V2prFz17tjhwUK/+U/XCQ5oHRPPDNvij0HF9UR7E=;
        b=Zlnqky8ZDdOUeECSzJ/gsuVl4MZDjswb2zEUNw1ESxVPHAtX0Cl+ekLT7fmSxgIs/F
         MzqUFIG8PhWzmLUqJ3q1eK9MxyC2z8/2312WhgJjCAi/gfmSWwn6t5lftPUQCd5EWn7I
         l/fkYbx6UIAjjCiG4iNEEyoToQOaAv3BDIMKPtlS/EifzSytV+yp5ednkH0zbQMW0NV9
         DIIfqGOkYcRIQKk4CYazUZLZ6NDcJUzsUnBT6v1DEemp300/JcBSIwkoeoWg8mcaYxvn
         DHroWj315+zUC8jaq6mPBDK9stJUb4OAsXmqXQ8m97t4Shho3kB4yhi+ZP8yTxUwoKmp
         9+aA==
X-Gm-Message-State: AOAM531tX2BC182+4o4ae/XoE35DUd5NhSXZ/i0sTvHsjiCR2nIw7iuJ
	V/ugMk5/e6/1f09aqTObaRZkC66x2brdbQ==
X-Google-Smtp-Source: 
 ABdhPJxR7CemKDhvWQRaxDGNYmlwrjHTp88aZTzBoChq3Z3/ULFZRTvE2IjqfcsRypZTygOxWOi4uQ==
X-Received: by 2002:a5d:658c:: with SMTP id q12mr39037770wru.34.1636023918213;
        Thu, 04 Nov 2021 04:05:18 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2578:3d9c:c55b:5282])
        by smtp.gmail.com with ESMTPSA id
 l26sm4855219wms.15.2021.11.04.04.05.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 04:05:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH RFC 2/2] conf/recipes: Replace VIRTUAL-RUNTIME with
 PACKAGE_GLOBAL_RENAMES
Date: Thu,  4 Nov 2021 11:05:16 +0000
Message-Id: <20211104110516.3616891-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211104110516.3616891-1-richard.purdie@linuxfoundation.org>
References: <20211104110516.3616891-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 11:05:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157839

I don't think anyone has ever liked VIRTUAL-RUNTIME as a solution. This patch
replaces it with PACKAGE_GLOBAL_RENAME.

There are two types of VIRTUAL-RUNTIME. Direct package replacements like
getopt or keymaps and "namespaces" for things like "device-manager" or
"login-manager". The later are different in that one recipe may provide
several but they need to be configured individually. If they were all
"systemd", we couldn't replace the correct ones.

As such this patch introduces the "virtual-XXX" namespace where the
system is expected to resolve these into final values as per the configuration.

The advantage of this approach is that we no longer need to have specific
VIRTUAL-RUNTIME parameterisation for a user to change a particular dependency,
they can just do things like:

PACKAGE_GLOBAL_RENAME[keymaps] = "mykeymaps"

or simply:

PACKAGE_GLOBAL_RENAME[keymaps] = ""

to remove it. You can see examples of the virtual-* mappings in the init 
manager includes.

This patch uses the PACKAGE_GLOBAL_RENAMES variable and mechanism from the
previous patch to function but to be clear, this only works at package
creation time, not at build time. As such we have to inject the virtual
namespace into RPROVIDES. Filtering all package variables at parse time
isn't really viable at present (the multilib classes show the work involved).

Known issues:
a) The changes apply at final image build time which means that the original
provider would be built and the alternate only swapped in at do_rootfs.
b) The patch throwns build-rdeps QA warnings (probably as a result of a).
c) As a result of b) there are probably missing build dependencies
d) The tests are unconverted.

As such I suspect this patch won't quite work but I want to share it and
see what people think and if a better solution could rise from this as a
result. Adding "filter" support to variables as JPEW and I once discussed
may be a different way of handling this which would also handle some multilib
issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass                     |  6 +++++
 meta/classes/image.bbclass                    |  3 ++-
 meta/classes/multilib_global.bbclass          |  5 +++++
 meta/classes/package.bbclass                  |  4 +++-
 meta/classes/packagegroup.bbclass             |  4 ++--
 meta/classes/update-alternatives.bbclass      |  5 +----
 .../conf/distro/include/default-providers.inc | 13 +++++------
 .../include/init-manager-mdev-busybox.inc     |  9 ++++----
 .../conf/distro/include/init-manager-none.inc |  7 +++---
 .../distro/include/init-manager-systemd.inc   |  9 ++++----
 .../distro/include/init-manager-sysvinit.inc  |  7 +++---
 meta/conf/layer.conf                          |  2 +-
 meta/lib/oe/rootfs.py                         |  2 +-
 meta/recipes-core/busybox/busybox.inc         |  4 ++--
 meta/recipes-core/busybox/busybox_1.34.1.bb   |  6 ++---
 .../images/core-image-minimal-initramfs.bb    |  2 +-
 .../images/core-image-tiny-initramfs.bb       |  4 +---
 .../initrdscripts/initramfs-framework_1.0.bb  |  4 ++--
 .../initramfs-live-install-efi_1.0.bb         |  4 ++--
 .../initramfs-live-install_1.0.bb             |  4 ++--
 .../initramfs-module-install-efi_1.0.bb       |  4 ++--
 .../initramfs-module-install_1.0.bb           |  4 ++--
 .../packagegroups/packagegroup-base.bb        |  9 +++-----
 .../packagegroups/packagegroup-core-boot.bb   | 22 ++++++++-----------
 meta/recipes-devtools/dpkg/dpkg.inc           |  2 +-
 meta/recipes-devtools/opkg/opkg_0.4.5.bb      |  2 +-
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |  2 +-
 .../packagegroup-core-base-utils.bb           |  4 +---
 .../packagegroup-core-full-cmdline.bb         |  9 ++++----
 .../packagegroups/packagegroup-core-weston.bb |  2 +-
 .../packagegroups/packagegroup-core-x11.bb    |  9 +-------
 meta/recipes-graphics/wayland/weston-init.bb  |  6 ++---
 meta/recipes-graphics/wayland/weston_9.0.0.bb |  2 +-
 .../gstreamer/gstreamer1.0-omx_1.18.5.bb      |  3 +--
 34 files changed, 88 insertions(+), 96 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a65fcc6c1db..1395df4a02c 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -334,6 +334,12 @@ python base_eventhandler() {
                     profprov = d.getVar("PREFERRED_PROVIDER_" + p)
                     if profprov and pn != profprov:
                         raise bb.parse.SkipRecipe("PREFERRED_PROVIDER_%s set to %s, not %s" % (p, profprov, pn))
+
+
+        remaps = d.getVarFlags("PACKAGE_GLOBAL_RENAMES")
+        for m in remaps:
+            if m.startswith("virtual-"):
+                d.setVar("RPROVIDES:" + remaps[m] + ":append", " " + m)
 }
 
 CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b3f5421697d..605dcc9eee2 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -43,7 +43,7 @@ IMAGE_INSTALL_DEBUGFS ?= ""
 
 # These packages will be removed from a read-only rootfs after all other
 # packages have been installed
-ROOTFS_RO_UNNEEDED ??= "update-rc.d base-passwd shadow ${VIRTUAL-RUNTIME_update-alternatives} ${ROOTFS_BOOTSTRAP_INSTALL}"
+ROOTFS_RO_UNNEEDED ??= "update-rc.d base-passwd shadow virtual-update-alternatives ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # packages to install from features
 FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
@@ -240,6 +240,7 @@ fakeroot python do_rootfs () {
     runtime_mapping_rename("PACKAGE_INSTALL", pn, remaps, d)
     runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, remaps, d)
     runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, remaps, d)
+    runtime_mapping_rename("ROOTFS_RO_UNNEEDED", pn, remaps, d)
 
     # Generate the initial manifest
     create_manifest(d)
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index dae015cdaf7..aa32d0aeaed 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -161,6 +161,11 @@ def preferred_ml_updates(d):
             extras.append(translate_provide(p, a1) + "->" + translate_provide(p, a2))
     d.appendVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", " " + " ".join(extras))
 
+    remaps = d.getVarFlags("PACKAGE_GLOBAL_RENAMES")
+    for p in prefixes:
+        for flag in remaps:
+            d.setVarFlag("PACKAGE_GLOBAL_RENAMES", p + flag, p + remaps[flag])
+
 python multilib_virtclass_handler_vendor () {
     if isinstance(e, bb.event.ConfigParsed):
         for v in e.data.getVar("MULTILIB_VARIANTS").split():
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index aad58ead977..f1b4bb04e83 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -655,7 +655,7 @@ def runtime_mapping_rename(varname, pkg, remaps, d):
     new_depends = {}
     deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
     for depend, depversions in deps.items():
-        new_depend = get_package_mapping(depend, pkg, remaps, d, depversions)
+        new_depend = get_package_mapping(depend, pkg, remaps,d, depversions)
         if depend != new_depend:
             bb.note("package name mapping done: %s -> %s" % (depend, new_depend))
         new_depends[new_depend] = deps[depend]
@@ -2519,3 +2519,5 @@ def mapping_rename_hook(d):
     runtime_mapping_rename("RDEPENDS", pkg, remaps, d)
     runtime_mapping_rename("RRECOMMENDS", pkg, remaps, d)
     runtime_mapping_rename("RSUGGESTS", pkg, remaps, d)
+mapping_rename_hook[vardeps] += "PACKAGE_GLOBAL_RENAMES"
+
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 557b1b6382b..de01c5d2cb6 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -53,9 +53,9 @@ INHIBIT_DEFAULT_DEPS = "1"
 python () {
     if bb.data.inherits_class('nativesdk', d):
         return
-    initman = d.getVar("VIRTUAL-RUNTIME_init_manager")
+    initman = d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager')
     if initman and initman in ['sysvinit', 'systemd'] and not bb.utils.contains('DISTRO_FEATURES', initman, True, False, d):
-        bb.fatal("Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (%s) matches the entries enabled in DISTRO_FEATURES" % initman)
+        bb.fatal("Please ensure that your setting of PACKAGE_GLOBAL_RENAME[virtual-init-manager] (currently %s) matches the entries enabled in DISTRO_FEATURES" % initman)
 }
 
 CVE_PRODUCT = ""
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index fc1ffd828cf..c28134f33e2 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -277,10 +277,7 @@ python populate_packages_updatealternatives () {
 
         if alt_setup_links:
             # RDEPENDS setup
-            provider = d.getVar('VIRTUAL-RUNTIME_update-alternatives')
-            if provider:
-                #bb.note('adding runtime requirement for update-alternatives for %s' % pkg)
-                d.appendVar('RDEPENDS:%s' % pkg, ' ' + d.getVar('MLPREFIX', False) + provider)
+            d.appendVar('RDEPENDS:%s' % pkg, ' ' + d.getVar('MLPREFIX', False) + 'virtual-update-alternatives')
 
             bb.note('adding update-alternatives calls to postinst/prerm for %s' % pkg)
             bb.note('%s' % alt_setup_links)
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ea88bd4876a..5afd3ae415e 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -21,13 +21,12 @@ PREFERRED_PROVIDER_virtual/make-native ?= "make-native"
 #
 # Default virtual runtime providers
 #
-VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-opkg"
-VIRTUAL-RUNTIME_apm ?= "apm"
-VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
-VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
-VIRTUAL-RUNTIME_base-utils ?= "busybox"
-VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
-VIRTUAL-RUNTIME_base-utils-syslog ?= "busybox-syslog"
+PACKAGE_GLOBAL_RENAMES[getopt] ?= "util-linux-getopt"
+PACKAGE_GLOBAL_RENAMES[virtual-base-utils] ?= "busybox"
+PACKAGE_GLOBAL_RENAMES[virtual-graphical-init-manager] ?= "xserver-nodm-init"
+PACKAGE_GLOBAL_RENAMES[virtual-hwclock] ?= "busybox-hwclock"
+PACKAGE_GLOBAL_RENAMES[virtual-syslog] ?= "busybox-syslog"
+PACKAGE_GLOBAL_RENAMES[virtual-update-alternatives] ?= "update-alternatives-opkg"
 
 #
 # Default recipe providers
diff --git a/meta/conf/distro/include/init-manager-mdev-busybox.inc b/meta/conf/distro/include/init-manager-mdev-busybox.inc
index 12091cba68c..f9f11b15f82 100644
--- a/meta/conf/distro/include/init-manager-mdev-busybox.inc
+++ b/meta/conf/distro/include/init-manager-mdev-busybox.inc
@@ -1,7 +1,6 @@
 # enable mdev/busybox for init
 DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd sysvinit"
-VIRTUAL-RUNTIME_dev_manager ??= "busybox-mdev"
-VIRTUAL-RUNTIME_init_manager ??= "busybox"
-VIRTUAL-RUNTIME_initscripts ??= "initscripts"
-VIRTUAL-RUNTIME_keymaps ??= "keymaps"
-VIRTUAL-RUNTIME_login_manager ??= "busybox"
+PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= "busybox-mdev"
+PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= "busybox-mdev"
+PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= "busybox"
+PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= "busybox"
diff --git a/meta/conf/distro/include/init-manager-none.inc b/meta/conf/distro/include/init-manager-none.inc
index bbedf898f76..b28c48ee6d1 100644
--- a/meta/conf/distro/include/init-manager-none.inc
+++ b/meta/conf/distro/include/init-manager-none.inc
@@ -1,3 +1,4 @@
-VIRTUAL-RUNTIME_init_manager ??= "sysvinit"
-VIRTUAL-RUNTIME_initscripts ??= "initscripts"
-VIRTUAL-RUNTIME_login_manager ??= "busybox"
+PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= "sysvinit"
+PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= "busybox"
+PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= "udev"
+PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= "busybox-mdev
\ No newline at end of file
diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 7867d900283..49a8c9915d3 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -1,7 +1,8 @@
 # Use systemd for system initialization
 DISTRO_FEATURES:append = " systemd"
 DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " sysvinit"
-VIRTUAL-RUNTIME_init_manager ??= "systemd"
-VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
-VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
-VIRTUAL-RUNTIME_dev_manager ??= "systemd"
+PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= "systemd"
+PACKAGE_GLOBAL_RENAMES[initscripts] ?= "systemd-compat-units"
+PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= "shadow-base"
+PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= "systemd"
+PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= "systemd"
diff --git a/meta/conf/distro/include/init-manager-sysvinit.inc b/meta/conf/distro/include/init-manager-sysvinit.inc
index aa2393944d6..d35c6380c00 100644
--- a/meta/conf/distro/include/init-manager-sysvinit.inc
+++ b/meta/conf/distro/include/init-manager-sysvinit.inc
@@ -1,6 +1,7 @@
 # Use sysvinit for system initialization
 DISTRO_FEATURES:append = " sysvinit"
 DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd"
-VIRTUAL-RUNTIME_init_manager ??= "sysvinit"
-VIRTUAL-RUNTIME_initscripts ??= "initscripts"
-VIRTUAL-RUNTIME_login_manager ??= "busybox"
+PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= "sysvinit"
+PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= "busybox"
+PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= "udev"
+PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= "busybox-mdev"
\ No newline at end of file
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index b3cc8a249e9..fedd21090d2 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -58,7 +58,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   resolvconf->bash \
   docbook-xsl-stylesheets->perl \
   ca-certificates->openssl \
-  initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
+  initramfs-framework->virtual-base-utils \
   initramfs-framework->eudev \
   initramfs-framework->systemd \
   initramfs-module-install-efi->dosfstools \
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index b0dd6255397..5d8506f4a74 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -268,7 +268,7 @@ class Rootfs(object, metaclass=ABCMeta):
             # because its database has to available while uninstalling
             # other packages, allowing alternative symlinks of packages
             # to be uninstalled or to be managed correctly otherwise.
-            provider = self.d.getVar("VIRTUAL-RUNTIME_update-alternatives")
+            provider = self.d.getVarFlag("PACKAGE_GLOBAL_RENAMES", "virtual-update-alternatives")
             pkgs_to_remove = sorted([pkg for pkg in pkgs_installed if pkg in unneeded_pkgs], key=lambda x: x == provider)
 
             # update-alternatives provider is removed in its own remove()
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 622325aabb3..f6bc46254e3 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -50,7 +50,7 @@ CONFFILES:${PN}-mdev = "${sysconfdir}/mdev.conf"
 
 RRECOMMENDS:${PN} = "${PN}-udhcpc"
 
-RDEPENDS:${PN} = "${@["", "busybox-inittab"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]}"
+RDEPENDS:${PN} = "${@["", "busybox-inittab"][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager') == 'busybox')]}"
 
 inherit cml1 systemd update-rc.d ptest
 
@@ -307,7 +307,7 @@ do_install () {
 			install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
 		fi
 	fi
-	if grep -q "CONFIG_INIT=y" ${B}/.config && ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','busybox','true','false',d)}; then
+	if grep -q "CONFIG_INIT=y" ${B}/.config && ${@["false", "true"][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager') == 'busybox')]}; then
 		install -D -m 0755 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
 		install -D -m 0755 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
 		install -D -m 0755 ${WORKDIR}/rcS.default ${D}${sysconfdir}/default/rcS
diff --git a/meta/recipes-core/busybox/busybox_1.34.1.bb b/meta/recipes-core/busybox/busybox_1.34.1.bb
index 6aed0f0476e..3bb7560e2a3 100644
--- a/meta/recipes-core/busybox/busybox_1.34.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.34.1.bb
@@ -33,9 +33,9 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://getopts.cfg \
            file://longopts.cfg \
            file://resize.cfg \
-           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
-           ${@["", "file://rcS.default"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
-           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
+           ${@["", "file://init.cfg"][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager') == 'busybox')]} \
+           ${@["", "file://rcS.default"][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager') == 'busybox')]} \
+           ${@["", "file://mdev.cfg"][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-dev-manager') == 'busybox-mdev')]} \
            file://syslog.cfg \
            file://unicode.cfg \
            file://rev.cfg \
diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 664fe7310e9..9f1a50f04e9 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -11,7 +11,7 @@ INITRAMFS_SCRIPTS ?= "\
                       initramfs-module-install-efi \
                      "
 
-PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
+PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} virtual-base-utils udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 47470849edf..839dc5b4da0 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -5,9 +5,7 @@ first 'init' program more efficiently. core-image-tiny-initramfs doesn't \
 actually generate an image but rather generates boot and rootfs artifacts \
 that can subsequently be picked up by external image generation tools such as wic."
 
-VIRTUAL-RUNTIME_dev_manager ?= "busybox-mdev"
-
-PACKAGE_INSTALL = "initramfs-live-boot-tiny packagegroup-core-boot dropbear ${VIRTUAL-RUNTIME_base-utils} ${VIRTUAL-RUNTIME_dev_manager} base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
+PACKAGE_INSTALL = "initramfs-live-boot-tiny packagegroup-core-boot dropbear virtual-base-utils virtual-mini-dev-manager base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 9e8c1dc3abb..00343b30bb2 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Modular initramfs system"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_base-utils}"
-RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
+RDEPENDS:${PN} += "virtual-base-utils"
+RRECOMMENDS:${PN} = "virtual-syslog"
 
 PR = "r4"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index ecbd567d6ca..a2ee92dee44 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -5,8 +5,8 @@ SRC_URI = "file://init-install-efi.sh"
 
 PR = "r1"
 
-RDEPENDS:${PN} = "parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
-RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
+RDEPENDS:${PN} = "parted e2fsprogs-mke2fs dosfstools util-linux-blkid virtual-base-utils"
+RRECOMMENDS:${PN} = "virtual-syslog"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 674d49ecdf9..d3c24f83859 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -7,8 +7,8 @@ PR = "r9"
 
 S = "${WORKDIR}"
 
-RDEPENDS:${PN} = "grub parted e2fsprogs-mke2fs util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
-RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
+RDEPENDS:${PN} = "grub parted e2fsprogs-mke2fs util-linux-blkid virtual-base-utils"
+RRECOMMENDS:${PN} = "virtual-syslog"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-install.sh ${D}/install.sh
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index fb194845554..2ee1c62d3dc 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "initramfs-framework module for EFI installation option"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-RDEPENDS:${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
-RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
+RDEPENDS:${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid virtual-base-utils"
+RRECOMMENDS:${PN} = "virtual-syslog"
 
 PR = "r4"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
index 4d48d54e9ec..6f8d506ea6d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "initramfs-framework module for installation option"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-RDEPENDS:${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
-RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
+RDEPENDS:${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid virtual-base-utils"
+RRECOMMENDS:${PN} = "virtual-syslog"
 
 # The same restriction as grub
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 7489ef61b03..182b9d399d0 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -41,9 +41,6 @@ PACKAGES = ' \
             \
             '
 
-# Override by distro if needed
-VIRTUAL-RUNTIME_keymaps ?= "keymaps"
-
 #
 # packagegroup-base contain stuff needed for base system (machine related)
 #
@@ -139,7 +136,7 @@ RRECOMMENDS:packagegroup-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"
 
 SUMMARY:packagegroup-base-keyboard = "Keyboard support"
 RDEPENDS:packagegroup-base-keyboard = "\
-    ${VIRTUAL-RUNTIME_keymaps}"
+    keymaps"
 
 SUMMARY:packagegroup-base-pci = "PCI bus support"
 RDEPENDS:packagegroup-base-pci = "\
@@ -151,7 +148,7 @@ RDEPENDS:packagegroup-base-acpi = "\
 
 SUMMARY:packagegroup-base-apm = "APM support"
 RDEPENDS:packagegroup-base-apm = "\
-    ${VIRTUAL-RUNTIME_apm} \
+    apm \
     apmd"
 
 SUMMARY:packagegroup-base-ext2 = "ext2 filesystem support"
@@ -175,7 +172,7 @@ SUMMARY:packagegroup-base-alsa = "ALSA sound support"
 RDEPENDS:packagegroup-base-alsa = "\
     alsa-utils-alsactl \
     alsa-utils-amixer \
-    ${VIRTUAL-RUNTIME_alsa-state}"
+    alsa-state"
 
 RRECOMMENDS:packagegroup-base-alsa = "\
     kernel-module-snd-mixer-oss \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index faf7bc0026d..89e875033ca 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -10,32 +10,28 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-# Distro can override the following VIRTUAL-RUNTIME providers:
-VIRTUAL-RUNTIME_dev_manager ?= "udev"
-VIRTUAL-RUNTIME_keymaps ?= "keymaps"
-
 EFI_PROVIDER ??= "grub-efi"
 
-SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', '${VIRTUAL-RUNTIME_base-utils-hwclock}', '', d)} \
+SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'virtual-hwclock', '', d)} \
                     modutils-initscripts \
                     init-ifupdown \
-                    ${VIRTUAL-RUNTIME_initscripts} \
+                    initscripts \
                    "
 
 RDEPENDS:${PN} = "\
     base-files \
     base-passwd \
-    ${VIRTUAL-RUNTIME_base-utils} \
+    virtual-base-utils \
     ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
-    ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
     ${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER} kernel", "", d)} \
     netbase \
-    ${VIRTUAL-RUNTIME_login_manager} \
-    ${VIRTUAL-RUNTIME_init_manager} \
-    ${VIRTUAL-RUNTIME_dev_manager} \
-    ${VIRTUAL-RUNTIME_update-alternatives} \
+    virtual-login-manager \
+    virtual-init-manager \
+    virtual-dev-manager \
+    virtual-update-alternatives \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
 
 RRECOMMENDS:${PN} = "\
-    ${VIRTUAL-RUNTIME_base-utils-syslog} \
+    virtual-syslog \
     ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 74074cfdd7f..2955e0ba540 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 
 DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS:class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
-RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl"
+RDEPENDS:${PN} = "virtual-update-alternatives perl"
 RDEPENDS:${PN}:class-native = ""
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.5.bb b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
index f5c7d11191a..2760fc58786 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.5.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
@@ -73,7 +73,7 @@ def package_qa_check_openssl_deprecation (package, d, messages):
     return sane
 
 
-RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config libarchive"
+RDEPENDS:${PN} = "virtual-update-alternatives opkg-arch-config libarchive"
 RDEPENDS:${PN}:class-native = ""
 RDEPENDS:${PN}:class-nativesdk = ""
 RDEPENDS:${PN}-ptest += "make binutils python3-core python3-compression"
diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index a3bcaf51c34..fdfb652674f 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://sourceforge.net/projects/lsb/files"
 LICENSE = "GPLv2+"
 
 # lsb_release needs getopt
-RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_getopt}"
+RDEPENDS:${PN} += "getopt"
 
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
index b17cba4a789..d7470d8fe83 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
@@ -9,8 +9,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-VIRTUAL-RUNTIME_vim ?= "vim-tiny"
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 RDEPENDS:${PN} = "\
@@ -54,7 +52,7 @@ RDEPENDS:${PN} = "\
     time \
     unzip \
     util-linux \
-    ${VIRTUAL-RUNTIME_vim} \
+    vim-tiny \
     wget \
     which \
     xz \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index 14a7bded953..a9bb8a91ffe 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -114,13 +114,12 @@ RDEPENDS:packagegroup-core-full-cmdline-dev-utils = "\
     patch \
     "
 
-VIRTUAL-RUNTIME_syslog ?= "sysklogd"
 RDEPENDS:packagegroup-core-full-cmdline-initscripts = "\
-    ${VIRTUAL-RUNTIME_initscripts} \
-    ${VIRTUAL-RUNTIME_init_manager} \
+    initscripts \
+    virtual-init-manager \
     ethtool \
-    ${VIRTUAL-RUNTIME_login_manager} \
-    ${VIRTUAL-RUNTIME_syslog} \
+    virtual-login-manager \
+    virtual-syslog \
     "
 
 RDEPENDS:packagegroup-core-full-cmdline-multiuser = "\
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
index 0ce91ca9403..69d72ffd276 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
@@ -5,7 +5,7 @@ PR = "r1"
 inherit packagegroup features_check
 
 # weston-init requires pam enabled if started via systemd
-REQUIRED_DISTRO_FEATURES = "wayland ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
+REQUIRED_DISTRO_FEATURES = "wayland ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pam', '', d)}"
 
 RDEPENDS:${PN} = "\
     weston \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 9ca058b38bd..5596e18de97 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -9,12 +9,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGES = "${PN} ${PN}-utils"
 
-# backwards compatibility for xserver-common
-VIRTUAL-RUNTIME_xserver_common ?= ""
-
-# elsa, xserver-nodm-init
-VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
-
 SUMMARY = "X11 display server and basic utilities"
 RDEPENDS:${PN} = "\
     ${PN}-xserver \
@@ -23,8 +17,7 @@ RDEPENDS:${PN} = "\
 
 SUMMARY:${PN}-utils = "X11 basic utilities and init"
 RDEPENDS:${PN}-utils = "\
-    ${VIRTUAL-RUNTIME_xserver_common} \
-    ${VIRTUAL-RUNTIME_graphical_init_manager} \
+    virtual-graphical-init-manager \
     xauth \
     xhost \
     xset \
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index e02da0c3589..79b05bd60cd 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -28,7 +28,7 @@ DEFAULTBACKEND:qemux86-64:x86-x32 = "fbdev"
 DEFAULTBACKEND:x86-x32 = "fbdev"
 
 do_install() {
-        if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
+        if [ "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)}" != "systemd" ]; then
 		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
 		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
         fi
@@ -60,7 +60,7 @@ do_install() {
 	install -dm 755 -o weston -g weston ${D}/home/weston
 }
 
-INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
+INHIBIT_UPDATERCD_BBCLASS = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", '1', '', d)}"
 
 inherit update-rc.d features_check systemd useradd
 
@@ -68,7 +68,7 @@ USERADD_PACKAGES = "${PN}"
 
 # rdepends on weston which depends on virtual/egl
 # requires pam enabled if started via systemd
-REQUIRED_DISTRO_FEATURES = "opengl ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
+REQUIRED_DISTRO_FEATURES = "opengl ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pam', '', d)}"
 
 RDEPENDS:${PN} = "weston kbd"
 
diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
index 59ab217a3bd..8e31075e9ed 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -25,7 +25,7 @@ UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 inherit meson pkgconfig useradd features_check
 # depends on virtual/egl
 # weston-init requires pam enabled if started via systemd
-REQUIRED_DISTRO_FEATURES = "opengl ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
+REQUIRED_DISTRO_FEATURES = "opengl ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pam', '', d)}"
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0"
 DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
index b2c1eb3ea06..da4aaa22aea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
@@ -43,5 +43,4 @@ do_install[postfuncs] += " set_omx_core_name "
 FILES:${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES:${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
 
-VIRTUAL-RUNTIME_libomxil ?= "libomxil"
-RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_libomxil}"
+RDEPENDS:${PN} = "libomxil"
-- 
2.32.0


