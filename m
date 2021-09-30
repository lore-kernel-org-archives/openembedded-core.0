X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [PATCH v3 1/2] kernel, kernel-module-split: Add runtime dependency to subpackages on main package
Date: Thu, 30 Sep 2021 16:14:43 +0200
Message-Id: <20210930141444.698139-2-zboszor@pr.hu>
In-Reply-To: <20210930141444.698139-1-zboszor@pr.hu>
References: <16A93426652F9306.27626@lists.openembedded.org>
 <20210930141444.698139-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>

From: Zoltán Böszörményi <zboszor@gmail.com>

This creates a circular dependency between the main kernel package
and its subpackages. It helps package managers to automatically
remove all kernel packages of the same version when upgrading.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
v2: No changes

v3: Add reverse RDEPENDS to subpackages unconditionally
    Handle KERNEL_SPLIT_MODULES=1 (default) case in
    meta/classes/kernel-module-split.bbclass

 meta/classes/kernel-module-split.bbclass | 5 +++--
 meta/classes/kernel.bbclass              | 7 ++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index a29c294810..2ddcea538c 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -176,8 +176,9 @@ python split_kernel_module_packages () {
     module_pattern = module_pattern_prefix + kernel_package_name + '-module-%s' + module_pattern_suffix
 
     modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
-    if modules:
-        d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
+    for mod in modules:
+        d.appendVar('RDEPENDS:' + metapkg, ' %s (= ${EXTENDPKGV})' % mod)
+        d.appendVar('RDEPENDS:' + mod, ' %s (= ${EXTENDPKGV})' % kernel_package_name)
 
     # If modules-load.d and modprobe.d are empty at this point, remove them to
     # avoid warnings. removedirs only raises an OSError if an empty
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4acec1877e..afd9f8045e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -98,7 +98,9 @@ python __anonymous () {
         typelower = type.lower()
         d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
         d.setVar('FILES:' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
+        d.appendVar('RDEPENDS:%s-image' % kname, ' %s (= ${EXTENDPKGV})' % kname)
         d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s (= ${EXTENDPKGV})' % (kname, typelower))
+        d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s (= ${EXTENDPKGV})' % kname)
         splitmods = d.getVar("KERNEL_SPLIT_MODULES")
         if splitmods != '1':
             d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules (= ${EXTENDPKGV})' % kname)
@@ -627,8 +629,11 @@ RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})
 # Allow machines to override this dependency if kernel image files are
 # not wanted in images as standard
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image (= ${EXTENDPKGV})"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append = " ${KERNEL_PACKAGE_NAME} (= ${EXTENDPKGV})"
 PKG:${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-image += "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (= ${EXTENDPKGV})', '', d)}"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-image:append = "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', ' ${KERNEL_PACKAGE_NAME}-vmlinux (= ${EXTENDPKGV})', '', d)}"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-vmlinux:append = "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', ' ${KERNEL_PACKAGE_NAME} (= ${EXTENDPKGV})', '', d)}"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-modules:append = " ${KERNEL_PACKAGE_NAME} (= ${EXTENDPKGV})"
 PKG:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
 RPROVIDES:${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} = "1"
-- 
2.31.1

