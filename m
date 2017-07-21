Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC7C78093
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 12:10:53 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2017 05:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,389,1496127600"; d="scan'208";a="289700880"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2017 05:10:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 4E615580118;
	Fri, 21 Jul 2017 05:10:39 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 14:48:13 +0300
Message-Id: <1500637693-19366-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] patchelf: fix segfault for binaries linked by gold
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
X-List-Received-Date: Fri, 21 Jul 2017 12:10:54 -0000

Due to a bug in calculating adresses of modified program
headers patchelf breaks executables linked by Gold linker
causing them to segfault, e.g.
$ tmp/sysroots-components/x86_64/m4-native/usr/bin/m4 --help
Segmentation fault

This is reproducible only in some cases and only for executables
of ET_DYN type produced by Gold or by ld linked with pie.

This should be solved by fix-adjusting-startPage.patch that
fixes calculation logic.

[YOCTO #11785]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../patchelf/fix-adjusting-startPage.patch         | 38 ++++++++++++++++++++++
 meta/recipes-devtools/patchelf/patchelf_0.9.bb     |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/fix-adjusting-startPage.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/fix-adjusting-startPage.patch b/meta/recipes-devtools/patchelf/patchelf/fix-adjusting-startPage.patch
new file mode 100644
index 0000000..f64cbed
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/fix-adjusting-startPage.patch
@@ -0,0 +1,38 @@
+commit 1cc234fea5600190d872329aca60e2365cefc39e
+Author: Ed Bartosh <ed.bartosh@linux.intel.com>
+Date:   Fri Jul 21 12:33:53 2017 +0300
+
+fix adjusting startPage
+
+startPage is adjusted unconditionally for all executables.
+This results in incorrect addresses assigned to INTERP and LOAD
+program headers, which breaks patched executable.
+
+Adjusting startPage variable only when startOffset > startPage
+should fix this.
+
+This change is related to the issue NixOS#10
+
+Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
+
+Github PR: https://github.com/NixOS/patchelf/pull/127
+
+Upstream-Status: Submitted
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index cbd36c0..e9d7ea5 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -720,10 +720,8 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
+        since DYN executables tend to start at virtual address 0, so
+        rewriteSectionsExecutable() won't work because it doesn't have
+        any virtual address space to grow downwards into. */
+-    if (isExecutable) {
+-        if (startOffset >= startPage) {
+-            debug("shifting new PT_LOAD segment by %d bytes to work around a Linux kernel bug\n", startOffset - startPage);
+-        }
++    if (isExecutable && startOffset > startPage) {
++        debug("shifting new PT_LOAD segment by %d bytes to work around a Linux kernel bug\n", startOffset - startPage);
+         startPage = startOffset;
+     }
+ 
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.9.bb b/meta/recipes-devtools/patchelf/patchelf_0.9.bb
index 01f0e62..d703039 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.9.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.9.bb
@@ -3,6 +3,7 @@ SRC_URI = "http://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
            file://handle-read-only-files.patch \
            file://Increase-maxSize-to-64MB.patch \
            file://avoidholes.patch \
+           file://fix-adjusting-startPage.patch \
 "
 
 LICENSE = "GPLv3"
-- 
2.1.4


