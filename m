Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 19A3B78688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:23:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAADNBsQ018043
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:23:11 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:23:10 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:20 +0800
Message-ID: <7b22f3a19636663b631aeddb233ff4132d348316.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 20/23] multilib.bbclass: extend allarch recipes
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
X-List-Received-Date: Fri, 10 Nov 2017 13:23:10 -0000
Content-Type: text/plain

This can fix do_rootfs and depends chaos when multilib, for example
ca-certificates is an allarch recipe:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "core2-32"
IMAGE_INSTALL_append = " ca-certificates"
$ bitbake ca-certificates
$ rpm -qpR tmp-glibc/deploy/rpm/noarch/ca-certificates-20170717-r0.noarch.rpm
[snip]
openssl
[snip]

It requires openssl, but lib32-openssl doesn't proivide it:
$ rpm -qp --provides tmp-glibc/deploy/rpm/core2_32/lib32-openssl-1.0.2l-r0.core2_32.rpm
lib32-openssl = 1.0.2l-r0

So openssl-1.0.2l-r0.core2_64.rpm would be installed when install
ca-certificates, e.g.:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "core2-32"
IMAGE_INSTALL_append = " ca-certificates"
$ bitbake lib32-core-image-minimal
The openssl-1.0.2l-r0.core2_64.rpm and other 64 bit packages are installed,
this is incorrect.

We have two solutions on this:
1) Let lib32-openssl provide openssl, but this would cause more problems when
   building since more than one providers for openssl.

Or

2) Extend allarch recipes, there would be ca-certificates-20170717-r0.noarch.rpm
   and lib32-ca-certificates-20170717-r0.noarch.rpm, then ca-certificates
   requires openssl, and lib32-ca-certificates requires lib32-openssl, the
   packages will be installed correctly, this is the best solution that I can
   find.

The problem has existed for years for deb and ipk (rpm did work since it didn't
use lib32-BPN in rpm filename before changed to dnf, for example, there was no
lib32-openssl.core2_32.rpm, but openssl.core2_32.rpm), this patch can fix the
problem for rpm, ipk and deb.

[YOCTO #12288]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/allarch.bbclass         | 3 ---
 meta/classes/multilib.bbclass        | 4 ----
 meta/classes/multilib_global.bbclass | 4 +---
 meta/classes/package.bbclass         | 9 ---------
 4 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 51ba509..b4f694d 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -42,9 +42,6 @@ python () {
         d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
         d.setVar("INHIBIT_PACKAGE_STRIP", "1")
 
-        # These multilib values shouldn't change allarch packages so exclude them
-        d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
-        d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
     elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
         bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
 }
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index dc0868b..770863f 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -46,10 +46,6 @@ python multilib_virtclass_handler () {
     if bb.data.inherits_class('nativesdk', e.data) or bb.data.inherits_class('crosssdk', e.data):
         raise bb.parse.SkipPackage("We can't extend nativesdk recipes")
 
-    if bb.data.inherits_class('allarch', e.data) and not bb.data.inherits_class('packagegroup', e.data):
-        raise bb.parse.SkipPackage("Don't extend allarch recipes which are not packagegroups")
-
-
     # Expand this since this won't work correctly once we set a multilib into place
     e.data.setVar("ALL_MULTILIB_PACKAGE_ARCHS", e.data.getVar("ALL_MULTILIB_PACKAGE_ARCHS"))
  
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 68ef10e..88d3ec1 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -139,9 +139,7 @@ python multilib_virtclass_handler_global () {
         return
 
     if bb.data.inherits_class('kernel', e.data) or \
-            bb.data.inherits_class('module-base', e.data) or \
-            (bb.data.inherits_class('allarch', e.data) and\
-             not bb.data.inherits_class('packagegroup', e.data)):
+            bb.data.inherits_class('module-base', e.data):
             variants = (e.data.getVar("MULTILIB_VARIANTS") or "").split()
 
             import oe.classextend
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2053d46..8221ca4 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -458,9 +458,6 @@ def get_package_mapping (pkg, basepkg, d):
     key = "PKG_%s" % pkg
 
     if key in data:
-        # Have to avoid undoing the write_extra_pkgs(global_variants...)
-        if bb.data.inherits_class('allarch', d) and data[key] == basepkg:
-            return pkg
         return data[key]
 
     return pkg
@@ -1351,9 +1348,6 @@ python emit_pkgdata() {
     if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
         write_extra_pkgs(variants, pn, packages, pkgdatadir)
 
-    if (bb.data.inherits_class('allarch', d) and not bb.data.inherits_class('packagegroup', d)):
-        write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
-
     workdir = d.getVar('WORKDIR')
 
     for pkg in packages.split():
@@ -1438,9 +1432,6 @@ python emit_pkgdata() {
     if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
         write_extra_runtime_pkgs(variants, packages, pkgdatadir)
 
-    if bb.data.inherits_class('allarch', d) and not bb.data.inherits_class('packagegroup', d):
-        write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
-
     bb.utils.unlockfile(lf)
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
-- 
2.7.4


