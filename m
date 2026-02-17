Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8375FE9A026
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 17:41:58 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18048.1771350110914506867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 09:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=GfwTeB/9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202602171741490e6f5f769300020706-cvk_cw@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202602171741490e6f5f769300020706
        for <openembedded-core@lists.openembedded.org>;
        Tue, 17 Feb 2026 18:41:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=fOGPWL29JaEZpGaimv/PSaCVESpXhAuSGYE/Wp5NHrk=;
 b=GfwTeB/9OHZG9FUUTmREheENu6Z+AjxD6S79X2QLHUHx/66+m4FAalx8gIgpdqdVqDNb9z
 W9sA/xM6gBvrPYTCBYpF9eSR5WZNbfd9BwdmD8ctbogOaxk8N7cbWXbxoXUA0ZG67FSuFO8Q
 JuR02mXiHANbn4UIPJdMqD3jRUcJYg6sb0/+tunpLza3qbO+OUiiAnubJvQRMJlYQJqfl4PG
 JniglYJjTuvzuFAQF6xEDS4kWkP9WCuH4dO6gFpOqT4rpqFxw11H5gawrF/xSNVMcYHLHZjJ
 3UOBNriNGoQbZ9H6bXpmXVRhZg7lsAvcBRLsq7TZe4oHZQBOD1mzqF2Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] zlib: upgrade 1.3.1 -> 1.3.2
Date: Tue, 17 Feb 2026 18:41:44 +0100
Message-Id: <20260217174144.2734399-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 17:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231266

From: Peter Marko <peter.marko@siemens.com>

Delete patch included in this version.
Remove CVE_STATUS for CVE resolved in this release.

Release information: [1]
More details on homepage: [2]
Audit details: [3]

Version 1.3.2 has these key updates from 1.3.1:
* Address findings of the 7ASecurity audit of zlib.
  * Check for negative lengths in crc32_combine functions.
  * Copy only the initialized window contents in inflateCopy.
  * Prevent the use of insecure functions without an explicit request.
  * Add compressBound_z and deflateBound_z functions for large values.
  * Use atomics to build inflate fixed tables once.
  * Add --undefined option to ./configure for UBSan checker.
  * Copy only the initialized deflate state in deflateCopy.
  * Zero inflate state on allocation.
  * Add compress_z and uncompress_z functions.
* Complete rewrite of cmake support.
* Remove untgz from contrib.
* Vectorize the CRC-32 calculation on the s390x.
* Remove vstudio projects in lieu of cmake-generated projects.
* Add zipAlreadyThere() to minizip zip.c to help avoid duplicates.
* Add deflateUsed() function to get the used bits in the last byte.
* Fix bug in inflatePrime() for 16-bit ints.
* Add a "G" option to force gzip, disabling transparency in gzread().
* Return all available uncompressed data on error in gzread.c.
* Support non-blocking devices in the gz* routines.

[1] https://github.com/madler/zlib/releases/tag/v1.3.2
[2] https://zlib.net/
[3] https://7asecurity.com/blog/2026/02/zlib-7asecurity-audit/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...configure-Pass-LDFLAGS-to-link-tests.patch | 78 -------------------
 .../zlib/{zlib_1.3.1.bb => zlib_1.3.2.bb}     |  5 +-
 2 files changed, 1 insertion(+), 82 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
 rename meta/recipes-core/zlib/{zlib_1.3.1.bb => zlib_1.3.2.bb} (85%)

diff --git a/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch b/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
deleted file mode 100644
index 07b2cd3879..0000000000
--- a/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-Upstream-Status: Submitted [https://github.com/madler/zlib/pull/599]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ea77f1f003a4d18b23cca703f3c824942863a1b4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 8 Mar 2022 22:38:47 -0800
-Subject: [PATCH] configure: Pass LDFLAGS to link tests
-
-LDFLAGS can contain critical flags without which linking wont succeed
-therefore ensure that all configure tests involving link time checks are
-using LDFLAGS on compiler commandline along with CFLAGS to ensure the
-tests perform correctly. Without this some tests may fail resulting in
-wrong confgure result, ending in miscompiling the package
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- configure | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/configure b/configure
-index c55098a..a7c6d72 100755
---- a/configure
-+++ b/configure
-@@ -443,7 +443,7 @@ if test $shared -eq 1; then
-   echo Checking for shared library support... | tee -a configure.log
-   # we must test in two steps (cc then ld), required at least on SunOS 4.x
-   if try $CC -c $SFLAGS $test.c &&
--     try $LDSHARED $SFLAGS -o $test$shared_ext $test.o; then
-+     try $LDSHARED $SFLAGS $LDFLAGS -o $test$shared_ext $test.o; then
-     echo Building shared library $SHAREDLIBV with $CC. | tee -a configure.log
-   elif test -z "$old_cc" -a -z "$old_cflags"; then
-     echo No shared library support. | tee -a configure.log
-@@ -505,7 +505,7 @@ int main(void) {
- }
- EOF
-   fi
--  if try $CC $CFLAGS -o $test $test.c; then
-+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-     sizet=`./$test`
-     echo "Checking for a pointer-size integer type..." $sizet"." | tee -a configure.log
-     CFLAGS="${CFLAGS} -DNO_SIZE_T=${sizet}"
-@@ -539,7 +539,7 @@ int main(void) {
-   return 0;
- }
- EOF
--  if try $CC $CFLAGS -o $test $test.c; then
-+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-     echo "Checking for fseeko... Yes." | tee -a configure.log
-   else
-     CFLAGS="${CFLAGS} -DNO_FSEEKO"
-@@ -556,7 +556,7 @@ cat > $test.c <<EOF
- #include <errno.h>
- int main() { return strlen(strerror(errno)); }
- EOF
--if try $CC $CFLAGS -o $test $test.c; then
-+if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-   echo "Checking for strerror... Yes." | tee -a configure.log
- else
-   CFLAGS="${CFLAGS} -DNO_STRERROR"
-@@ -663,7 +663,7 @@ int main()
-   return (mytest("Hello%d\n", 1));
- }
- EOF
--  if try $CC $CFLAGS -o $test $test.c; then
-+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-     echo "Checking for vsnprintf() in stdio.h... Yes." | tee -a configure.log
- 
-     echo >> configure.log
-@@ -753,7 +753,7 @@ int main()
- }
- EOF
- 
--  if try $CC $CFLAGS -o $test $test.c; then
-+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-     echo "Checking for snprintf() in stdio.h... Yes." | tee -a configure.log
- 
-     echo >> configure.log
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.2.bb
similarity index 85%
rename from meta/recipes-core/zlib/zlib_1.3.1.bb
rename to meta/recipes-core/zlib/zlib_1.3.2.bb
index ef83142121..8a23d98cd3 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.2.bb
@@ -8,12 +8,11 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 
 # The source tarball needs to be .gz as only the .gz ends up in fossils/
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
-           file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-SRC_URI[sha256sum] = "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23"
+SRC_URI[sha256sum] = "bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2dfa8de64f0119d16"
 
 # When a new release is made the previous release is moved to fossils/, so add this
 # to PREMIRRORS so it is also searched automatically.
@@ -51,5 +50,3 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Adding 'CVE_PRODUCT' to avoid false detection of CVEs
 CVE_PRODUCT = "zlib:zlib gnu:zlib"
-
-CVE_STATUS[CVE-2026-22184] = "not-applicable-config: vulnerable file is not compiled"

