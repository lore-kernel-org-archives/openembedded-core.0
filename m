Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 7561F7D735
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 06:01:43 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 561B21C0266;
	Tue, 11 Jun 2019 18:01:43 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2019 18:01:42 +1200
Message-Id: <20190611060142.31296-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] json-c: Backport --disable-werror patch to allow compilation under icecc
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
X-List-Received-Date: Tue, 11 Jun 2019 06:01:44 -0000

icecc preprocesses source files locally before shipping them off to be compiled
on remote hosts. This preprocessing removes comments, including /* fallthough */
comments in switch statements that normally prevent an implicit-fallthrough
warning, see https://github.com/icecc/icecream/issues/419

Rather than turning off -Werror, the upstream project has implemented a
configure option, --disable-werror, in response to Ross's
https://github.com/json-c/json-c/issues/489

This patch from
https://github.com/json-c/json-c/commit/21c886534f8927fdc0fb5f8647394f3e0e0874b8

Upstream-Status: Backport [Not yet released]
Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 ...d-disable-werror-option-to-configure.patch | 45 +++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.13.1.bb |  8 +++-
 2 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch

diff --git a/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch b/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
new file mode 100644
index 0000000000..0c20c8458a
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
@@ -0,0 +1,45 @@
+json-c: Backport --disable-werror patch to allow compilation under icecc
+
+icecc preprocesses source files locally before shipping them off to be compiled
+on remote hosts. This preprocessing removes comments, including /* fallthough */
+comments in switch statements that normally prevent an implicit-fallthrough
+warning, see https://github.com/icecc/icecream/issues/419
+
+Rather than turning off -Werror, the upstream project has implemented a
+configure option, --disable-werror, in response to Ross's
+https://github.com/json-c/json-c/issues/489
+
+This patch from
+https://github.com/json-c/json-c/commit/21c886534f8927fdc0fb5f8647394f3e0e0874b8
+
+Upstream-Status: Backport [Not yet released]
+Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
+
+From 21c886534f8927fdc0fb5f8647394f3e0e0874b8 Mon Sep 17 00:00:00 2001
+From: Pierce Lopez <pierce.lopez@gmail.com>
+Date: Sun, 9 Jun 2019 10:52:08 -0400
+Subject: [PATCH] build: add --disable-werror option to configure
+
+to omit -Werror compiler option
+---
+ configure.ac | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 272ea6af9c..798fd5b747 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -165,7 +165,12 @@ AS_IF([test "x$enable_Bsymbolic" = "xcheck"],
+ AS_IF([test "x$enable_Bsymbolic" = "xyes"], [JSON_BSYMBOLIC_LDFLAGS=-Wl[,]-Bsymbolic-functions])
+ AC_SUBST(JSON_BSYMBOLIC_LDFLAGS)
+ 
+-AX_APPEND_COMPILE_FLAGS([-Wall -Werror -Wcast-qual -Wno-error=deprecated-declarations])
++AC_ARG_ENABLE([werror],
++    AS_HELP_STRING([--disable-werror], [avoid treating compiler warnings as fatal errors]))
++
++AS_IF([test "x$enable_werror" != "xno"], [AX_APPEND_COMPILE_FLAGS([-Werror])])
++
++AX_APPEND_COMPILE_FLAGS([-Wall -Wcast-qual -Wno-error=deprecated-declarations])
+ AX_APPEND_COMPILE_FLAGS([-Wextra -Wwrite-string -Wno-unused-parameter])
+ AX_APPEND_COMPILE_FLAGS([-D_GNU_SOURCE])
+ 
diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 5b10e68297..9d8f2e7870 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -4,7 +4,9 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
-SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
+SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+           file://add-disable-werror-option-to-configure.patch \
+           "
 SRC_URI[md5sum] = "04969ad59cc37bddd83741a08b98f350"
 SRC_URI[sha256sum] = "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873"
 
@@ -20,7 +22,9 @@ RPROVIDES_${PN} = "libjson"
 
 inherit autotools
 
-EXTRA_OECONF = "--enable-rdrand"
+EXTRA_OECONF = "--disable-werror \
+                --enable-rdrand \
+                "
 
 do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
-- 
2.17.1


