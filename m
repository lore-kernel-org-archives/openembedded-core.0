Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 49AE56C248
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 22:43:55 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 27B8024E061B;
	Mon, 12 Nov 2018 14:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542062636; bh=KGxx+UzgXBQ4VoeX9WVYyqCWKO0bsEeAaQk3nZa+rOw=;
	h=From:To:Cc:Subject:Date:From;
	b=jSMvN7MKwmN14byQTL1mTeCDzRoQNPLy5NKhvAFPK5KnX3HlJ88E1z9gZVMb+1ovr
	j1kf+thtIPsnVf8yY1zDMFQ9u+69ITuOfr1h2I9dSmskDjI6JbBptCdeGTDN+zqCWJ
	7HX+D6oUMCgvg9WIUatb+on1i7FkYctyvgJnZuRaNsGLLtjKIB9FKBypGUTUKouud/
	55kLZcwH9L9Co+C30bAXGPLM/cYM6AbRftJ01cF6L0AOfUBzGt4NpA2J32miSZlaxZ
	ZRk62tpm1NsIpXW/5tIQhOhtyvbIodG+sceApypbBm4GirdX+130fHn1EgUeW3yE2Q
	QfhI6vMt/toqw==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id B219B5C1A;
	Mon, 12 Nov 2018 14:43:54 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 01:43:51 +0300
Message-Id: <20181112224351.2050-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>
Subject: [PATCH] locale: Allow usage of cross-localedef for ARC
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
X-List-Received-Date: Mon, 12 Nov 2018 22:43:55 -0000

With this it's possible to build locale data for ARC
and not do it instead on the first boot.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/classes/libc-package.bbclass        | 2 ++
 meta/lib/oe/package_manager.py           | 2 ++
 meta/recipes-core/glibc/glibc-locale.inc | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 9d09c7be6a..4c694ab5e2 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -242,6 +242,8 @@ python package_do_split_gconvs () {
         if use_cross_localedef == "1":
             target_arch = d.getVar('TARGET_ARCH')
             locale_arch_options = { \
+                "arc":     " --uint32-align=4 --little-endian ", \
+                "arceb":   " --uint32-align=4 --big-endian ",    \
                 "arm":     " --uint32-align=4 --little-endian ", \
                 "armeb":   " --uint32-align=4 --big-endian ",    \
                 "aarch64": " --uint32-align=4 --little-endian ",    \
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 882e7c429f..aa4de6e7c3 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -94,6 +94,8 @@ def generate_locale_archive(d, rootfs, target_arch, localedir):
     # Pretty sure we don't need this for locale archive generation but
     # keeping it to be safe...
     locale_arch_options = { \
+        "arc": ["--uint32-align=4", "--little-endian"],
+        "arceb": ["--uint32-align=4", "--big-endian"],
         "arm": ["--uint32-align=4", "--little-endian"],
         "armeb": ["--uint32-align=4", "--big-endian"],
         "aarch64": ["--uint32-align=4", "--little-endian"],
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 1b676dc26e..57b465dd5d 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -27,7 +27,7 @@ ENABLE_BINARY_LOCALE_GENERATION_pn-nativesdk-glibc-locale = "1"
 
 #enable locale generation on these arches
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arm.* aarch64 i[3-6]86 x86_64 powerpc mips mips64 riscv32 riscv64"
+BINARY_LOCALE_ARCHES ?= "arc arm.* aarch64 i[3-6]86 x86_64 powerpc mips mips64 riscv32 riscv64"
 
 # set "1" to use cross-localedef for locale generation
 # set "0" for qemu emulation of native localedef for locale generation
-- 
2.16.2


