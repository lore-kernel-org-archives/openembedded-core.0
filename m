Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 21B41716CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 09:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3T9ZDBs021780 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:35:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LjIW9sWyKt63
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:35:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3T9Z0R5021748
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:35:11 +0100
Message-ID: <1430300100.19130.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 10:35:00 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH v2] gcc-shared-source: Add PV to PN
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
X-List-Received-Date: Wed, 29 Apr 2015 09:35:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This means you can have one gcc version for some gcc recipes
(e.g. crosssdk/nativesdk) and another gcc version for target code.

Also remove the preferred version entry from the default toolchains
list since the version issue is now handled automatically.

We also need to specifically handle gcc-source in the license handling
code since expanding ${PV} in the base class isn't possible. Since 
gcc-source doesn't generate any packages directly this shouldn't be 
an issue and whitelisting in this way is easiest (and matches the 
rest of the toolchain handling).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a9edeb9..0e4b068 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -466,6 +466,8 @@ python () {
               "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
             if pn.endswith(d.expand(t)):
                 check_license = False
+        if pn.startswith("gcc-source-"):
+            check_license = False
 
         if check_license and bad_licenses:
             bad_licenses = expand_wildcard_licenses(d, bad_licenses)
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index e3df934..096bec9 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -38,7 +38,6 @@ PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_ARCH} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-sanitizers ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-source ?= "${GCCVERSION}"
 PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-gcc-sanitizers ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index cb5d907..9acffb1 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -5,5 +5,5 @@ do_fetch[noexec] = "1"
 deltask do_unpack
 deltask do_patch
 
-do_configure[depends] += "gcc-source:do_preconfigure"
-do_populate_lic[depends] += "gcc-source:do_unpack"
+do_configure[depends] += "gcc-source-${PV}:do_preconfigure"
+do_populate_lic[depends] += "gcc-source-${PV}:do_unpack"
diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 10e9285..a4b27c8 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -11,6 +11,7 @@ deltask do_package_qa
 deltask do_packagedata
 deltask do_rm_work
 
+PN = "gcc-source-${PV}"
 WORKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
 SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
 



