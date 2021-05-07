Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.16143.1620419933441925943
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 13:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=eNLqKgfh;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1620419933;
  x=1651955933;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j6FXYXnQff6BVpnFvLm8dcAUGqa/PgSr+thHyq5552U=;
  b=eNLqKgfhVCaCQuDfhqPd6pCwggpFU1la7X2QYXKLPqvs9MZZvgXBIeRw
   DsgSTp3dA1RRnb3brQr7rdERRzTTo+Z6/qUzIoqgxdC2kcyXMI6EfvZHA
   9LCAUZhi0qbXxA3ecEJTrIXiVy6sw/w4iiV0aBNOqjIrhcVfiRKjKKwdE
   q5R7qkNkmoDTv3FdpAjc7WKS1qG7EmXhJEt2SfVIfL9K6WniDwFPcfpjd
   53TW+nuSqTbFQtQugzHyfWoNKDnBVL/8UIxSODnr273r0CSC2jNunXyrJ
   jP2IxE5raF169BVtZhdpnmdKn5JBwfn1gXoa3araJ9E0GQmvjHlaOmDBF
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libcap: Configure Make variables correctly without a horrible hack
Date: Fri, 7 May 2021 22:38:30 +0200
Message-ID: <20210507203830.10710-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Occasionally, the build would fail with:

  make[2]: execvp: mkdir: Argument list too long

This turned out to be due to a hacky solution used in the recipe to
modify the Makefile, which resulted in one more $(BUILD_CFLAGS) being
added to the immediately expanded BUILD_CFLAGS Make variable each time
do_configure was executed. After a couple of times, this lead to an
environment with a 140 kB BUILD_CFLAGS when mkdir should execute, which
resulted in the E2BIG.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/libcap/libcap_2.49.bb | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap_2.49.bb b/meta/recipes-support/libcap/libcap_2.49.bb
index 3f4a9256cf..eb9fc5b4b3 100644
--- a/meta/recipes-support/libcap/libcap_2.49.bb
+++ b/meta/recipes-support/libcap/libcap_2.49.bb
@@ -20,15 +20,6 @@ UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs
 
 inherit lib_package
 
-# do NOT pass target cflags to host compilations
-#
-do_configure() {
-	# libcap uses := for compilers, fortunately, it gives us a hint
-	# on what should be replaced with ?=
-	sed -e 's,:=,?=,g' -i Make.Rules
-	sed -e 's,^BUILD_CFLAGS ?= ,BUILD_CFLAGS := $(BUILD_CFLAGS) ,' -i Make.Rules
-}
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG_class-native ??= ""
 
@@ -44,11 +35,15 @@ EXTRA_OEMAKE = " \
 
 EXTRA_OEMAKE_append_class-target = " SYSTEM_HEADERS=${STAGING_INCDIR}"
 
-# these are present in the libcap defaults, so include in our CFLAGS too
-CFLAGS += "-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-
 do_compile() {
-	oe_runmake ${PACKAGECONFIG_CONFARGS}
+	unset CFLAGS BUILD_CFLAGS
+	oe_runmake \
+		${PACKAGECONFIG_CONFARGS} \
+		AR="${AR}" \
+		CC="${CC}" \
+		RANLIB="${RANLIB}" \
+		COPTS="${CFLAGS}" \
+		BUILD_COPTS="${BUILD_CFLAGS}"
 }
 
 do_install() {
