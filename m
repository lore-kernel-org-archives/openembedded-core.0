Return-Path: <matt@madison.systems>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1A28473173
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 12:22:25 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id 78so241330323pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 04:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=z9Dt7EKqI0P3gypFwihnA6tckj06HBXjHhcEy4eRd9g=;
	b=xKOdGtEKwJzbrCjf4PH7Xs9joDdn7Jqia1Na40BfWMmZLT3QeatrSIIHv92U6XmnoU
	4M6NbqC6b0xj3d1kxcBRWZWIa7/g+Q6fu/Y5vh2ylaKwhPKAGdteqk6hWPpDgxR7nYP0
	meboZzndZ5GZz2xHjkaH9dviFPsRPAX6JptWvrkqGeW9oSbWDwmU03GI3Q96eIl84vCM
	gzBT9rDvZK2pakmADnwdJ8OrzFLCDJFtYH5aRfy7fA8QKVZHUON3xLMdP9bl9GL24fmA
	SHeMnoR662QyS47S131IheMrTQu7dt/ujrGbvMQE0UQXugTUF4eVu2L3U1tGyPDLGhTr
	zK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=z9Dt7EKqI0P3gypFwihnA6tckj06HBXjHhcEy4eRd9g=;
	b=iK+opV3PH7e4wFkZKU8rHcejFVb/J/AvgD/zGpDnS0JmoiEjWJ/29IBUCw5f4IpwMt
	/12ZQ7Zk2Rm1S8+I0P942oRTH+eHJho8FSyTA0DaLTUO2TF/oU9EvbJLm6IlC6j5Js+j
	44/XisKNUGdwvfA9tCqM4pkgCw8gktujfwDlialiQEy5RmTYeUca3tuaF3VuIaSkhm+I
	SrduqDWnyGB6O3dQyyYjXxhcRVYWusL+WxHEKgWPGmFyKBv4LPXlZX3Tknhj46k6rM0N
	kj+G8oOUdP8R5vyVVdUiN5hbsPNi0WoyzRpzdN9XKFLus5PB6nmZQttez3QRc1nRNaDN
	hF1w==
X-Gm-Message-State: ALoCoQk7K4c05TokIIf1hM79mhmqRVemRncnzxBMCFlLzafejQWPL1mlxdNfEYKSWsMs7zU5BRiv2oe6mEv1V313JuJrRdHvfg==
X-Received: by 10.98.15.12 with SMTP id x12mr11838281pfi.125.1452082946541;
	Wed, 06 Jan 2016 04:22:26 -0800 (PST)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93])
	by smtp.gmail.com with ESMTPSA id c5sm1479817pfj.89.2016.01.06.04.22.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jan 2016 04:22:24 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jan 2016 04:21:33 -0800
Message-Id: <1452082896-3261-2-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1452082896-3261-1-git-send-email-matt@madison.systems>
References: <1452082896-3261-1-git-send-email-matt@madison.systems>
MIME-Version: 1.0
Subject: [PATCH v3 1/4] package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping function
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
X-List-Received-Date: Wed, 06 Jan 2016 12:22:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have DPKG_ARCH set by directly invoking a mapping function, rather
than using an anonymous Python function modify the variable under
the hood, so we can have proper handling of overrides.

Also bring in some additional mappings to Debian architecture names
that weren't being handled.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
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


