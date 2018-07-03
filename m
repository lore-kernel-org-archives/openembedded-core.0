Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id ECA2A7889F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 13:04:19 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id w16-v6so2262049wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Tvimj9c2h3ghRXeh8Oqtv+6VJsSZ6/qyEA9I/fj9ieg=;
	b=LBmP0MHaJ9KVgC9BLEhy3QECgqLMG+7bMs7duNwRN9j3K17CYLOt7PvNDlNzZvlemz
	gMoHNRjh3Zi6aiZNx2hBhgSbMD1wPbIz6RDTnHJnfjAw0olAANFE1i4BDTyPcLmTpKtl
	gn94sOQFkGA3ryEmx4sWI4BEQ+lp46sHS+wXbvExbbIRrCmKymDM3FRwK1CUpeeEONym
	jSU1SDFkOmwT1LBgcQpq7nif6GtrTcCxaqQBtggyAwF9xe/527rnfx+axNxXhP4EAU3n
	gOXNLSfDkwZHusTpWX8/Vij+gi9rInbzsQ6qJFLqZlpVynd6G2MC6Y45Sfu6/AS3Rzjj
	veRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Tvimj9c2h3ghRXeh8Oqtv+6VJsSZ6/qyEA9I/fj9ieg=;
	b=S7dpamozeMPAGidAQZXCxk+FpuyGQ1tUB8urJbpONNP4WFZyULoyun2MT8ByjaKEeJ
	Ji8RmUI190EWdFTT13Fu/eellD9bROoI8/jABdWE9Cu05SBb5mf0vve9BR6U7ZD9bILV
	/ZYmjUCdMcD6LKc32+rg6sJ8QnYCSMEsoTpHw0gY0Hi7ScNaEFNdKW6W5S8bUY675+A5
	5G2SalcBLqvDaVAraVcZqNQXE6LVGltA+hj50chNYZF1jyaY1MoY4AUAFOEnHO0qTa9Q
	ejypDiU0k/1/8sHnGRTkoyi1CyF5vAab9D9uPCGvgvC5EwyNdjeElSTUZTn71u55ZZep
	QWfw==
X-Gm-Message-State: APt69E0KZaatwPosQ7JPEesq1Fp2zBoV8ouOVV2nVAua5SalHQR/n6JF
	3nRDEurgdydZ1l3nEMsGar8Dy4zt
X-Google-Smtp-Source: AAOMgpfxjTdPbslu4/gjb4e2aW+Vw1MP/OmvuMv30drvPcLqOj908YUuFyxlSwzLZT20izwNZJdzLA==
X-Received: by 2002:a1c:cf81:: with SMTP id
	f123-v6mr10545585wmg.83.1530623060239; 
	Tue, 03 Jul 2018 06:04:20 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j9-v6sm1863006wrr.52.2018.07.03.06.04.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 06:04:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 14:04:11 +0100
Message-Id: <20180703130412.26102-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180703130412.26102-1-ross.burton@intel.com>
References: <20180703130412.26102-1-ross.burton@intel.com>
Subject: [PATCH 3/4] meson: validate cpu_family
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
X-List-Received-Date: Tue, 03 Jul 2018 13:04:20 -0000

Meson has a defined list of known CPU families but these are not currently
validated, so mistakes in cross files or new architectures are not noticed.

Backport a patch from upstream which warns on unknown architectures, but tweak
it to fatally error instead.  When we upgrade to Meson 0.47 the first half of
this patch can be dropped.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/meson.inc              |   1 +
 .../meson/meson/validate-cpu.patch                 | 118 +++++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/validate-cpu.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 4c113dcaf73..b278d33b72e 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -11,6 +11,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0003-native_bindir.patch \
            file://0004-Prettifying-some-output-with-pathlib.patch \
            file://0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch \
+           file://validate-cpu.patch \
            "
 
 SRC_URI[md5sum] = "1698f6526574839de5dcdc45e3f7d582"
diff --git a/meta/recipes-devtools/meson/meson/validate-cpu.patch b/meta/recipes-devtools/meson/meson/validate-cpu.patch
new file mode 100644
index 00000000000..8bdb204ab04
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/validate-cpu.patch
@@ -0,0 +1,118 @@
+Validate the passed CPU family (US: backport) and turn the upstream warning to
+an error (US: inappropriate).
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 456f7ea48503731d50a2b7287a0f198b73b4fe61 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross@burtonini.com>
+Date: Wed, 20 Jun 2018 13:45:44 +0100
+Subject: [PATCH 1/2] Validate cpu_family (#3753)
+
+* environment: validate cpu_family in cross file
+
+* run_unittests: add unittest to ensure CPU family list in docs and environment matches
+
+* run_unittests: skip compiler options test if not in a git repository
+
+* environment: validate the detected cpu_family
+
+* docs: add 32-bit PowerPC and 32/64-bit MIPS to CPU Families table
+
+Names gathered by booting Linux in Qemu and running:
+
+$ python3
+import platform; platform.machine()
+
+Partial fix for #3751
+---
+ mesonbuild/environment.py | 24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index 6920b8d6..091d92dc 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -72,6 +72,22 @@ from .compilers import (
+ 
+ build_filename = 'meson.build'
+ 
++known_cpu_families = (
++    'aarch64',
++    'arm',
++    'e2k',
++    'ia64',
++    'mips',
++    'mips64',
++    'parisc',
++    'ppc',
++    'ppc64',
++    'ppc64le',
++    'sparc64',
++    'x86',
++    'x86_64'
++)
++
+ # Environment variables that each lang uses.
+ cflags_mapping = {'c': 'CFLAGS',
+                   'cpp': 'CXXFLAGS',
+@@ -210,6 +226,10 @@ def detect_cpu_family(compilers):
+                 pass
+         return 'x86_64'
+     # Add fixes here as bugs are reported.
++
++    if trial not in known_cpu_families:
++        mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
++
+     return trial
+ 
+ def detect_cpu(compilers):
+@@ -1021,6 +1041,10 @@ class CrossBuildInfo:
+                     res = eval(value, {'__builtins__': None}, {'true': True, 'false': False})
+                 except Exception:
+                     raise EnvironmentException('Malformed value in cross file variable %s.' % entry)
++
++                if entry == 'cpu_family' and res not in known_cpu_families:
++                    mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % value)
++
+                 if self.ok_type(res):
+                     self.config[s][entry] = res
+                 elif isinstance(res, list):
+-- 
+2.11.0
+
+
+From 202e0199d3ffd2637f4dbee08f8351520f7dde3b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 3 Jul 2018 13:59:09 +0100
+Subject: [PATCH 2/2] Make CPU family warnings fatal
+
+---
+ mesonbuild/environment.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index 091d92dc..67177c1f 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -228,7 +228,7 @@ def detect_cpu_family(compilers):
+     # Add fixes here as bugs are reported.
+ 
+     if trial not in known_cpu_families:
+-        mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
++        raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
+ 
+     return trial
+ 
+@@ -1043,7 +1043,7 @@ class CrossBuildInfo:
+                     raise EnvironmentException('Malformed value in cross file variable %s.' % entry)
+ 
+                 if entry == 'cpu_family' and res not in known_cpu_families:
+-                    mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % value)
++                    raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % value)
+ 
+                 if self.ok_type(res):
+                     self.config[s][entry] = res
+-- 
+2.11.0
+
-- 
2.11.0


