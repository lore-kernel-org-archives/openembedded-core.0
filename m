Return-Path: <matt@madison.systems>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4AED76FFEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 14:35:16 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id o64so50031374pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 06:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IheReUZfaj6SlKIhpodQL5agnbRRPft9lMbJMrxFTyg=;
	b=rAsWqPHV+XzbjylPXEmDpR3ajLg33WXFF4bRxbhbp6a2HSfU5sOM3zQbbPuTTssYU/
	eIyds/jSt/NyexFNgEmaKE0OUVGURbQ6ug6Z6zO75w1+NALA5HA/bHsZlqbPO2WcsOhi
	8ILVVawOB+enoD3ltoa0Jf6T2YIroLzuCNhIpPfNw6RHJHIrt6dvRkXhIBJo29vDV50i
	3F5zB5tpGQwf2GIV5J4Vp3SO82nC9X0KvakdCqM0c68YrlUrlXIc9n0ZrUBiHLKGYnuf
	zxOa+pYAWGdhK2OUroyfJH8W6xxF0tANcF1A5ntTFXZlf8kqwnAdxDsHA650S9yutZ3o
	/Pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IheReUZfaj6SlKIhpodQL5agnbRRPft9lMbJMrxFTyg=;
	b=Y6OOoSX1OJ4WSF5b2KIj76FM1kb3k+gjk3ds4BFIHHFzuuo4opuCUlyQ1YjuhqTkB5
	6YpMT43/Hi/VqmKzdPMzUUQiNJWICyrz5NxBMYRJ+shO0cY4SMp7gi74iqIgJL59GbPV
	8+9nKAL3v9Eef8xc3qns5KIDgmNOMPP5eB5T+wjCUHEQLp9hLEGGbi70uz0zpg0amftx
	Sc3cy/y8xzbSpTxQGMj/8ZdY5SYAX6VCUuJP/71WV1LCfNXmjv5BpEiTeYbx9k9yd+Lr
	zUjjjmgNqMWQlu6Tqncx/iihe8nbujqTDuO5aJBj/CivYF04jecycr2ejzncfhR0GcXr
	vu0A==
X-Gm-Message-State: ALoCoQmjvx5Qd0O6T+3OIGUP0y6vDZP/tSUSmjF+/14Id82BiNDpzZfvUnvLlInPr1ZW+CBQh7COuH4kDIi4kZ71KYMyBs1g5A==
X-Received: by 10.98.66.209 with SMTP id h78mr5544062pfd.29.1450449317664;
	Fri, 18 Dec 2015 06:35:17 -0800 (PST)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by smtp.gmail.com with ESMTPSA id
	l66sm18429653pfj.71.2015.12.18.06.35.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Dec 2015 06:35:16 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 06:34:29 -0800
Message-Id: <1450449271-28582-2-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1450449271-28582-1-git-send-email-matt@madison.systems>
References: <1450449271-28582-1-git-send-email-matt@madison.systems>
Subject: [PATCH v2 1/3] package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping function
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
X-List-Received-Date: Fri, 18 Dec 2015 14:35:17 -0000

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
index 7b26ed6..e07b1bd 100644
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


