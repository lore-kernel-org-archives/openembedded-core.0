Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C3F5C60685
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 06:11:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,265,1566835200"; d="scan'208";a="76576578"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Oct 2019 14:11:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4D2D94CE042F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 14:11:24 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019 14:11:32 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Oct 2019 14:11:25 +0800
Message-ID: <20191007061125.18317-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 4D2D94CE042F.A8E49
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] fribidi:upgrade 1.0.5 -> 1.0.7
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
X-List-Received-Date: Mon, 07 Oct 2019 06:11:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-fribidi/meson.patch
 Removed since this is included in 1.0.7.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-support/fribidi/fribidi/meson.patch   | 44 ----------------------
 .../fribidi/{fribidi_1.0.5.bb => fribidi_1.0.7.bb} |  6 +--
 2 files changed, 3 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-support/fribidi/fribidi/meson.patch
 rename meta/recipes-support/fribidi/{fribidi_1.0.5.bb => fribidi_1.0.7.bb} (71%)

diff --git a/meta/recipes-support/fribidi/fribidi/meson.patch b/meta/recipes-support/fribidi/fribidi/meson.patch
deleted file mode 100644
index 8b3c4a9..0000000
--- a/meta/recipes-support/fribidi/fribidi/meson.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From f5feb6c599adb52f24656f8589868039b0d14272 Mon Sep 17 00:00:00 2001
-From: Heiko Becker <heirecka@exherbo.org>
-Date: Fri, 7 Sep 2018 20:57:11 +0200
-Subject: [PATCH] Build generator executables natively
-
-They are run during the build and not installed in the end. Without
-this one gets the following error from meson: "ERROR: Can not use
-target gen-unicode-version as a generator because it is cross-built
-and no exe wrapper is defined. You might want to set it to native
-instead."
-
-Closes #87.
-
----
- gen.tab/meson.build | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/gen.tab/meson.build b/gen.tab/meson.build
-index 6006d98..8c21e98 100644
---- a/gen.tab/meson.build
-+++ b/gen.tab/meson.build
-@@ -33,7 +33,8 @@ gen_unicode_version = executable('gen-unicode-version',
-   'gen-unicode-version.c',
-   include_directories: incs,
-   c_args: native_args,
--  install: false)
-+  install: false,
-+  native: true)
- 
- fribidi_unicode_version_h = custom_target('fribidi-unicode-version.h',
-   input: files('unidata/ReadMe.txt', 'unidata/BidiMirroring.txt'),
-@@ -67,7 +68,8 @@ foreach tab : tabs
-     gen_prog_src, 'packtab.c',
-     include_directories: incs,
-     c_args: native_args,
--    install: false)
-+    install: false,
-+    native: true)
- 
-   tab_inc_file = custom_target(gen_prog_name,
-     input: gen_prog_inputs,
diff --git a/meta/recipes-support/fribidi/fribidi_1.0.5.bb b/meta/recipes-support/fribidi/fribidi_1.0.7.bb
similarity index 71%
rename from meta/recipes-support/fribidi/fribidi_1.0.5.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.7.bb
index 63b2da6..6738884 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.5.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.7.bb
@@ -4,9 +4,9 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
-           file://meson.patch"
-SRC_URI[md5sum] = "0f97f65038545340316ec0f4bd53df0b"
-SRC_URI[sha256sum] = "6a64f2a687f5c4f203a46fa659f43dd43d1f8b845df8d723107e8a7e6158e4ce"
+           "
+SRC_URI[md5sum] = "4c020b0f5136dd012ee00f1e1122f6aa"
+SRC_URI[sha256sum] = "5ab5f21e9f2fc57b4b40f8ea8f14dba78a5cc46d9cf94bc5e00a58e6886a935d"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.7.4




