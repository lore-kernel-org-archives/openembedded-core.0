Return-Path: <matt@madison.systems>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 749C7601A5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Dec 2015 17:25:36 +0000 (UTC)
Received: by pacwq6 with SMTP id wq6so34827668pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Dec 2015 09:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ham7DYGVoiiO1ZlovSMud2h9hl/jTaVlkFKgMWXRbIQ=;
	b=eMJRPk63tXGSi4Oce/T/xzkNzSA6Jc29++wapSw+wwbcSqhwAO/bTD/pPs+l0uZ06V
	7yGETA4aTobgDzSxeufVcnhrVOhMpndaLXgTIl7a/0ieh0fthN5f+/5/3FaGCr/53uoM
	llIG/mLLz+RkCYZudxdr1YBIqFZq3hmML6U8i7VEvtJL5s0+CaIW3pWUynTec20imU7F
	60FaciWzD+NRaP5Rb3pS3Zs8MEAbIh6sdutDbueMC2SiAsDfnjcqt/3bzzNlPz1zVQwW
	b5TXIkxsljnthPP9z2/BGT4AIGx1NcqRUaEWDUEtooh7Klz70Xbgu459HygiUJXrzSWz
	8RQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ham7DYGVoiiO1ZlovSMud2h9hl/jTaVlkFKgMWXRbIQ=;
	b=jLI78pIs5zUgi7cDcItfz3ErSEuJkbr9OwvGhgULZxUm51+wmmO3cbHQTEZQ5B2YKg
	XAWa4zgWEP66VBbF4zlFHg+0VrNn/MN/wXX22ZQuGLvCJJ4/ZQaBhZIy+VvgF7ghQW35
	z/E+oR6s8pJ+fCrso8WbC33Kl1Jf5LWNQ6Q/2exig+hVnlgK8Zd3vlh+rZlSDK4mfHpq
	xIdaCliiyvL2TE9A6FEvzsUYFdT8R5HcyYQQhqF9MOipie/Xuwrj98lMI6YCZd0UmNtU
	Iyk9QYPzmWHx//tESW5nJQ4Vj4abjuo688UqXS8mxTyGpJ0ZFTOqe5EDTt5mJF9Qffog
	uliQ==
X-Gm-Message-State: ALoCoQk/cqb7CXsBZ2ps2OrRsmgINTu9xY/+zMypyZV5mXQUNovf5E/Lx2TE3xPa4AVzgwfSYYKS
X-Received: by 10.66.235.100 with SMTP id ul4mr36834886pac.142.1449422737841; 
	Sun, 06 Dec 2015 09:25:37 -0800 (PST)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by smtp.gmail.com with ESMTPSA id
	134sm29280465pfa.30.2015.12.06.09.25.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Dec 2015 09:25:37 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Dec 2015 09:25:31 -0800
Message-Id: <1449422732-12975-2-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449422732-12975-1-git-send-email-matt@madison.systems>
References: <1449422732-12975-1-git-send-email-matt@madison.systems>
Subject: [PATCH 1/2] package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping function
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
X-List-Received-Date: Sun, 06 Dec 2015 17:25:37 -0000

Have DPKG_ARCH set by directly invoking a mapping function, rather
than using an anonymous Python function modify the variable under
the hood, so we can have proper handling of overrides.

Also bring in some additional mappings to Debian architecture names
that weren't being handled.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/cross-canadian.bbclass |  2 +-
 meta/classes/package_deb.bbclass    | 35 +++++++++++++++++++++++++----------
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index ea17f09..c32aaff 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -103,7 +103,7 @@ HOST_LD_ARCH = "${SDK_LD_ARCH}"
 HOST_AS_ARCH = "${SDK_AS_ARCH}"
 
 #assign DPKG_ARCH
-DPKG_ARCH = "${SDK_ARCH}"
+DPKG_ARCH = "${@debian_arch_map(d.getVar('SDK_ARCH', True), '')}"
 
 CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
 CFLAGS = "${BUILDSDK_CFLAGS}"
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 5feeeb0..8d27adf 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -6,7 +6,7 @@ inherit package
 
 IMAGE_PKGTYPE ?= "deb"
 
-DPKG_ARCH ?= "${TARGET_ARCH}" 
+DPKG_ARCH ?= "${@debian_arch_map(d.getVar('TARGET_ARCH', True), d.getVar('TUNE_FEATURES', True))}"
 
 PKGWRITEDIRDEB = "${WORKDIR}/deploy-debs"
 
@@ -14,6 +14,28 @@ APTCONF_TARGET = "${WORKDIR}"
 
 APT_ARGS = "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS", True) == "1"]}"
 
+def debian_arch_map(arch, tune):
+    tune_features = tune.split()
+    if arch in ["i586", "i686"]:
+        return "i386"
+    if arch == "x86_64":
+        if "mx32" in tune_features:
+            return "x32"
+        return "amd64"
+    if arch.startswith("mips"):
+        endian = ["el", ""]["bigendian" in tune_features]
+        if "n64" in tune_features:
+            return "mips64" + endian
+        if "n32" in tune_features:
+            return "mipsn32" + endian
+        return "mips" + endian
+    if arch == "powerpc":
+        return arch + ["", "spe"]["spe" in tune_features]
+    if arch == "aarch64":
+        return "arm64"
+    if arch == "arm":
+        return arch + ["el", "hf"]["callconvention-hard" in tune_features]
+    return arch
 #
 # install a bunch of packages using apt
 # the following shell variables needs to be set before calling this func:
@@ -288,6 +310,8 @@ python do_package_deb () {
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
 }
+# Indirect references to these vars
+do_package_write_deb[vardeps] += "PKGV PKGR PKGV DESCRIPTION SECTION PRIORITY MAINTAINER DPKG_ARCH PN HOMEPAGE"
 # Otherwise allarch packages may change depending on override configuration
 do_package_deb[vardepsexclude] = "OVERRIDES"
 
@@ -311,15 +335,6 @@ python () {
         deps = ' dpkg-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_deb', 'depends', deps)
         d.setVarFlag('do_package_write_deb', 'fakeroot', "1")
-
-    # Map TARGET_ARCH to Debian's ideas about architectures
-    darch = d.getVar('DPKG_ARCH', True)
-    if darch in ["x86", "i486", "i586", "i686", "pentium"]:
-         d.setVar('DPKG_ARCH', 'i386')
-    elif darch == "x86_64":
-         d.setVar('DPKG_ARCH', 'amd64')
-    elif darch == "arm":
-         d.setVar('DPKG_ARCH', 'armel')
 }
 
 python do_package_write_deb () {
-- 
2.5.0


