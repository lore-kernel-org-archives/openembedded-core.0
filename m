Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web08.7271.1621933804035214024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 02:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.valek@siemens.com)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 14P9A1MP012633
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 11:10:02 +0200
Received: from dev.vm6.ccp.siemens.com ([144.145.220.50])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 14P9A1HY022689;
	Tue, 25 May 2021 11:10:01 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 0CBD8950A87;
	Tue, 25 May 2021 11:10:01 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] expat: upgrade 2.2.10 -> 2.4.1
Date: Tue, 25 May 2021 11:09:10 +0200
Message-Id: <20210525090910.11581-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

Includes lot of security fixes, especially CVE-2013-0340/CWE-776.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../expat/0001-Add-output-of-tests-result.patch    | 83 ----------------------
 .../expat/{expat_2.2.10.bb => expat_2.4.1.bb}      |  3 +-
 2 files changed, 1 insertion(+), 85 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
 rename meta/recipes-core/expat/{expat_2.2.10.bb => expat_2.4.1.bb} (84%)

diff --git a/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch b/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
deleted file mode 100644
index c5c18ead74..0000000000
--- a/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From aa84835a00bfd65e784d58411e76f60658e939dc Mon Sep 17 00:00:00 2001
-From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
-Date: Tue, 18 Feb 2020 19:04:55 +0200
-Subject: [PATCH] Add output of tests result
-
-Added console output of testing results in form 'RESULT: TEST_NAME'.
-
-Changed verbose mode of test application set by '-v' ('--verbose')
-argument to CK_NORMAL.
-Added new supported argument '-vv' ('--extra-verbose') that changes
-verbose mode of test application to CK_VERBOSE. Results of each test
-are shown in output only if this mode is set.
-
-Upstream-Status: Denied
-
-This patch changes potentially deprecated feature that shoud be changed
-in upstream. [https://github.com/libexpat/libexpat/issues/382]
-
-Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
----
- tests/minicheck.c | 10 +++++++++-
- tests/runtests.c  |  4 +++-
- 2 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/expat/tests/minicheck.c b/expat/tests/minicheck.c
-index a5a1efb..94fa412 100644
---- a/tests/minicheck.c
-+++ b/tests/minicheck.c
-@@ -164,6 +164,8 @@ srunner_run_all(SRunner *runner, int verbosity) {
-       if (tc->setup != NULL) {
-         /* setup */
-         if (setjmp(env)) {
-+          if (verbosity >= CK_VERBOSE)
-+            printf("SKIP: %s\n", _check_current_function);
-           add_failure(runner, verbosity);
-           continue;
-         }
-@@ -171,6 +173,8 @@ srunner_run_all(SRunner *runner, int verbosity) {
-       }
-       /* test */
-       if (setjmp(env)) {
-+        if (verbosity >= CK_VERBOSE)
-+          printf("FAIL: %s\n", _check_current_function);
-         add_failure(runner, verbosity);
-         continue;
-       }
-@@ -178,12 +182,16 @@ srunner_run_all(SRunner *runner, int verbosity) {
-
-       /* teardown */
-       if (tc->teardown != NULL) {
--        if (setjmp(env)) {
-+        if (setjmp(env)) {
-+          if (verbosity >= CK_VERBOSE)
-+           printf("PASS: %s\n", _check_current_function);
-           add_failure(runner, verbosity);
-           continue;
-         }
-         tc->teardown();
-       }
-+      if (verbosity >= CK_VERBOSE)
-+        printf("PASS: %s\n", _check_current_function);
-     }
-     tc = tc->next_tcase;
-   }
-diff --git a/tests/runtests.c b/expat/tests/runtests.c
-index 7791fe0..75724e5 100644
---- a/tests/runtests.c
-+++ b/tests/runtests.c
-@@ -11619,9 +11619,11 @@ main(int argc, char *argv[]) {
-   for (i = 1; i < argc; ++i) {
-     char *opt = argv[i];
-     if (strcmp(opt, "-v") == 0 || strcmp(opt, "--verbose") == 0)
--      verbosity = CK_VERBOSE;
-+      verbosity = CK_NORMAL;
-     else if (strcmp(opt, "-q") == 0 || strcmp(opt, "--quiet") == 0)
-       verbosity = CK_SILENT;
-+    else if (strcmp(opt, "-vv") == 0 || strcmp(opt, "--extra-verbose") == 0)
-+	verbosity = CK_VERBOSE;
-     else {
-       fprintf(stderr, "runtests: unknown option '%s'\n", opt);
-       return 2;
---
-2.17.1
diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.4.1.bb
similarity index 84%
rename from meta/recipes-core/expat/expat_2.2.10.bb
rename to meta/recipes-core/expat/expat_2.4.1.bb
index fa263775b3..476c5f8cc7 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.4.1.bb
@@ -9,10 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9e2ce3b3c4c0f2670883a23bbd7c37a9"
 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://libtool-tag.patch \
 	   file://run-ptest \
-	   file://0001-Add-output-of-tests-result.patch \
 	  "
 
-SRC_URI[sha256sum] = "b2c160f1b60e92da69de8e12333096aeb0c3bf692d41c60794de278af72135a5"
+SRC_URI[sha256sum] = "2f9b6a580b94577b150a7d5617ad4643a4301a6616ff459307df3e225bcfbf40"
 
 EXTRA_OECMAKE_class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.11.0

