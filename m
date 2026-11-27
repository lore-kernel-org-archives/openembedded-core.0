Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12714.1795768956936529779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 00:42:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.52 with ESMTP; 27 Nov 2026 17:42:33 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.122.207)
	by 156.147.1.126 with ESMTP; 27 Nov 2026 17:42:33 +0900
X-Original-SENDERIP: 10.177.122.207
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH v2] kernel-module-split: fix re-signing of modules built in a subdirectory
Date: Fri, 27 Nov 2026 17:42:31 +0900
Message-ID: <20261127084231.1188128-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 08:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251355
Content-Type: text/plain; charset="utf-8"

From: "mark.yang" <mark.yang@lge.com>

Out-of-tree modules built in a subdirectory of ${S}, such as
lttng-modules, are not signed again after package stripping and end up
in the packages without a signature.

A kernel with CONFIG_MODULE_SIG_FORCE=y then refuses to load them.
modprobe fails with "Key was rejected by service" and the kernel logs:

  Loading of unsigned module is rejected

To reproduce, set CONFIG_MODULE_SIG=y and CONFIG_MODULE_SIG_ALL=y in
linux-yocto and build lttng-modules. In log.do_package, modules_sign
enters ${S}, signs nothing and succeeds:

  NOTE: make ... M=.../lttng-modules-2.16.0 modules_sign
  make[1]: Entering directory '.../lttng-modules-2.16.0'
  make[1]: Leaving directory '.../lttng-modules-2.16.0'

Since 02890c1eff10 ("kernel-module-split: Remove get_ext_mod")
modules_sign always gets M=${S}, but lttng-modules runs Kbuild in
${S}/src and modules.order is only there.

Use MODULES_MODULE_SYMVERS_LOCATION, which module.bbclass already uses
to find Module.symvers in the same directory. modules_sign then signs
the modules:

  NOTE: make ... M=.../lttng-modules-2.16.0/src modules_sign
    SIGN    .../lttng-modules/lttng-ring-buffer-client-discard.ko

Give the variable a default in kernel-module-split.bbclass instead of
module.bbclass, so that it is also set for the kernel recipe and the
call can expand it directly.

M is now based on ${B} instead of ${S}. They are the same for most
module recipes, so nothing changes for them. For a recipe that sets B
to a subdirectory of ${S}, M follows ${B}, which is where
module_do_compile runs make. This is a behaviour change.

Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: mark.yang <mark.yang@lge.com>
---
v2:
- Give MODULES_MODULE_SYMVERS_LOCATION a default in
  kernel-module-split.bbclass and expand it directly at the call site,
  as Bruce suggested.
- Drop the now redundant default from module.bbclass.
- Mention the ${S} -> ${B} change in the commit message.

v1: https://patchwork.yoctoproject.org/project/oe-core/patch/20261125005619.45574-1-mark.yang@lge.com/

 meta/classes-recipe/kernel-module-split.bbclass | 4 +++-
 meta/classes-recipe/module.bbclass              | 1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 9a7f04f37b..b10e9315ba 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -47,6 +47,8 @@ KERNEL_MODULE_PACKAGE_PREFIX ?= ""
 KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
 KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
 
+MODULES_MODULE_SYMVERS_LOCATION ?= ""
+
 # This function supports both in-tree and out-of-tree modules.
 post_strip_kernel_modules_signing(){
     # Read .config values to determine if module auto-signing is enabled
@@ -69,7 +71,7 @@ post_strip_kernel_modules_signing(){
         oe_runmake \
             -C ${KBUILD_OUTPUT}  \
             MODLIB=${PKGD}${KERNEL_MODULE_INSTALL_PREFIX} \
-            ${@'M=%s' % '${S}' if not "virtual/kernel" in d.getVar('PROVIDES') else ''} \
+            ${@'M=${B}/${MODULES_MODULE_SYMVERS_LOCATION}' if not "virtual/kernel" in d.getVar('PROVIDES') else ''} \
             modules_sign
     fi
 }
diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index 985c24bed5..ec6ff91612 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -12,7 +12,6 @@ DEPENDS += "virtual/cross-cc virtual/cross-binutils"
 EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 MODULES_INSTALL_TARGET ?= "modules_install"
-MODULES_MODULE_SYMVERS_LOCATION ?= ""
 
 python __anonymous () {
     depends = d.getVar('DEPENDS')
