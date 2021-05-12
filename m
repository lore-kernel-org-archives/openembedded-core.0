Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.4879.1620814995077060010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 03:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=b+J5rOS4;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1620814995;
  x=1652350995;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UXQN61ZXH5FlovxOTg5I4RuLjvxJ9QjMpHOfHr/vAsg=;
  b=b+J5rOS4r18uRGbN2BhhJ8lQeOp8k1XXS/tvWErm8adsXfd4SbnkqyR4
   sb5HZkpe+zCZqVqc+CPKEzOs7wo29sQG5oEtj7CcvAoJOhnmJ2KLOA3bL
   wWv+fjF8N3tinWL1xRD5P1rpPbO2HtQWakQVnAP2kDrHdUdqKzbdZo8qp
   an8oxIPf9QFyZFazoFnFXNFwRozwSef32HhvKOZoyn10IYmzWDO6KCcS8
   J4DBNPwuf3j4ldVIJrubuvpU1L2IGnv3nk87C1t0EC4KYBkHnF/ZNBg1r
   RDG8DRgmlW+ejVQrOtNSoEKTXgtiltibt1rI4UceudMlinQS1aLxb82JP
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] ccache: add packageconfig docs option
Date: Wed, 12 May 2021 12:22:39 +0200
Message-ID: <20210512102239.23663-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Bastian Krause <bst@pengutronix.de>

Before, ccache's configure stage built HTML documentation and man pages
depending on if asciidoc is installed. This patch makes it configurable.

Pass the new cmake option ENABLE_DOCUMENTATION along and add the
asciidoc dependency if necessary.

This fixes an issue when ccache's configure stage found asciidoc/a2x on
the system outside of the sysroot (e.g. installed via 'apt install
asciidoc'). ccache would then decide to build docs and manual pages, but
would fail during compilation: the system's a2x could not find the
system's asciidoc because it did not reside in the set PATH.

By enabling/disabling docs/man page generation explicitly and adding
asciidoc to DEPENDS as necessary, this is no longer an issue.

[ This corresponds to commit b0aedd74 and parts of commit 1eedc5f8,
  with the patch replaced by the upstream version. ]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...-build-of-documentation-optional-842.patch | 36 +++++++++++++++++++
 meta/recipes-devtools/ccache/ccache_4.2.bb    |  4 +++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/ccache/ccache/0001-CMake-make-build-of-documentation-optional-842.patch

diff --git a/meta/recipes-devtools/ccache/ccache/0001-CMake-make-build-of-documentation-optional-842.patch b/meta/recipes-devtools/ccache/ccache/0001-CMake-make-build-of-documentation-optional-842.patch
new file mode 100644
index 0000000000..9f6bb1780b
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache/0001-CMake-make-build-of-documentation-optional-842.patch
@@ -0,0 +1,36 @@
+From 857d74f2c5fff79589e9b35cd405bf8ffffafb54 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
+Date: Mon, 3 May 2021 18:44:53 +0200
+Subject: [PATCH] CMake: make build of documentation optional (#842)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+So we don't need to support corner cases as for example one fixed in
+commit f6202db308e3 ("doc/MANUAL.adoc: Don't use non-ASCII quotes
+(#761)") when the documentation is actually not needed at all as ccache
+is used as a build tool only.
+
+Signed-off-by: Petr Štetiar <ynezz@true.cz>
+Upstream-Status: Backport [b96ca763c453a602b5516b4b9ca5e2829528e318]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ CMakeLists.txt | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 40e21a57..151cc5f7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -131,7 +131,10 @@ target_link_libraries(ccache PRIVATE standard_settings standard_warnings ccache_
+ #
+ # Documentation
+ #
+-add_subdirectory(doc)
++option(ENABLE_DOCUMENTATION "Enable documentation" ON)
++if(ENABLE_DOCUMENTATION)
++  add_subdirectory(doc)
++endif()
+ 
+ #
+ # Installation
diff --git a/meta/recipes-devtools/ccache/ccache_4.2.bb b/meta/recipes-devtools/ccache/ccache_4.2.bb
index 9957bc7e65..b76bf043f0 100644
--- a/meta/recipes-devtools/ccache/ccache_4.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.2.bb
@@ -12,10 +12,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=28afb89f649f309e7ac1aab554564637"
 DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI += "file://0001-CMake-make-build-of-documentation-optional-842.patch"
+
 SRC_URI[sha256sum] = "dbf139ff32031b54cb47f2d7983269f328df14b5a427882f89f7721e5c411b7e"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
+PACKAGECONFIG[docs] = "-DENABLE_DOCUMENTATION=ON,-DENABLE_DOCUMENTATION=OFF,asciidoc"
+
 inherit cmake
 
 PATCHTOOL = "patch"
