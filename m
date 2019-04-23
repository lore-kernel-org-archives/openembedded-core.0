Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2D57D2D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:50:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h4so21101519wre.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=auX5jC1GLBgGXxGWKU4O0pmN2ufR90O6yQnIiUG2BVw=;
	b=XdzQo+wdnErwTK8sUw97qI7COuSOrzxdQWNov3hirlWMS3NK5VouIeYll5zEsS+E2/
	VJRXnHu5fqkoc/AvzBVyMN4Pjt+jmB2C4eGdOHIZ8XGGpTNRLGiOgT4Im0MfCqozdkRL
	eK+1Gxe8gKKwXpbD8nUaH+kLrVsKhLT2qByH4te7VSGdaO7VYX1EbqBl2gpo39TCW4S5
	Pj3zgWpKrUwzHYbBZtNPYPmlxfpET6wBzkXVitbZUfLdbafYEFLwcbX2iF+4xL92bAHB
	edo3phv5ec0p4/O+V61/1kcitwdD2XKYHsABwzEO6nJZI2TCKK9GZz2mEKLRj/K+nIFk
	VbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=auX5jC1GLBgGXxGWKU4O0pmN2ufR90O6yQnIiUG2BVw=;
	b=Fc8z/FtniY2bJcVXf162SSGHGixghhMu2wPrpwi3mJccXVxCqIpRjrpCOomJD5nFJB
	l6oPvlCW9jF6xnCVQKiZSkHgEm1o2CMc6KENIuJEd03tquNuSX18VnXrUxMs+DxhMQAx
	0D3h7fxVcjqibyCJGlOEspLdoU0vmUhtHkgjj2ii8RsM8lAItVlzi64XRSEvgy0Izi2s
	1rpt22t0UuwfzaMK9g18tQ8nZ7p2j2J91FMqQBfjfHzrjaAu3NM7Uy2FbX+7bCVUS6ou
	A6DwIzxQRp0NsxOrvXK0UscZw3wP66C4ObJdMbpmLaaC6Fr8ov9i4mzbWjaznIGGc6nH
	/1jA==
X-Gm-Message-State: APjAAAWy2z8p4X/7LwiSZ76jGQJRZQT/NYe2iqUAm2etJsPz/o9eEggK
	hHh+DKIC1FkMxCOsbCtah+jHrwgHa5Q=
X-Google-Smtp-Source: APXvYqwu1Uja585HsWcQQvjcIOxnUzKlMb/iYTju7oypnOFX8BWoUX4lAGvyWC8npKGZ3FxNhKBrWA==
X-Received: by 2002:a5d:6101:: with SMTP id v1mr17786887wrt.222.1556038226968; 
	Tue, 23 Apr 2019 09:50:26 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	s18sm15652308wmc.41.2019.04.23.09.50.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 09:50:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 18:50:17 +0200
Message-Id: <20190423165018.75703-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] acpica: upgrade to 20190215
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
X-List-Received-Date: Tue, 23 Apr 2019 16:50:26 -0000

From: Ross Burton <ross.burton@intel.com>

Drop yy_scan_string patch, this only affects builds with flex 2.6.2.  We
currently have 2.6.0 and when we upgrade it will be to at least 2.6.3, which
fixes the regression.

Drop manipulate_fds_instead-of-FILE.patch, the original problem was fix upstream
in May 2015[1] so the 20170303 upgrade should have dropped this patch instead of
rebasing.

Call the upstream install target with variables set appropriately, instead of
hand-coding an install.

[1] https://github.com/acpica/acpica/commit/ecb91f4c3a151cbb280ee445166e7c6f4dc441a5

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...{acpica_20180508.bb => acpica_20190215.bb} | 25 +++----
 .../manipulate-fds-instead-of-FILE.patch      | 71 -------------------
 .../rename-yy_scan_string-manually.patch      | 64 -----------------
 3 files changed, 11 insertions(+), 149 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20180508.bb => acpica_20190215.bb} (58%)
 delete mode 100644 meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
 delete mode 100644 meta/recipes-extended/acpica/files/rename-yy_scan_string-manually.patch

diff --git a/meta/recipes-extended/acpica/acpica_20180508.bb b/meta/recipes-extended/acpica/acpica_20190215.bb
similarity index 58%
rename from meta/recipes-extended/acpica/acpica_20180508.bb
rename to meta/recipes-extended/acpica/acpica_20190215.bb
index b5c89fafc59..d4789df9335 100644
--- a/meta/recipes-extended/acpica/acpica_20180508.bb
+++ b/meta/recipes-extended/acpica/acpica_20190215.bb
@@ -16,12 +16,9 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "bison flex bison-native"
 
-SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
-           file://rename-yy_scan_string-manually.patch \
-           file://manipulate-fds-instead-of-FILE.patch \
-           "
-SRC_URI[md5sum] = "31691e2eb82b2064f78536a3423c18d6"
-SRC_URI[sha256sum] = "5d8fc9d9db9e04830d40bec9add04b21c05d466e0187d354815006fdd823cf15"
+SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz"
+SRC_URI[md5sum] = "0ea9047bf15dfdf3583f5266cc6da718"
+SRC_URI[sha256sum] = "8f939ad6130862e05853837496500b3fb93037530e5ea0ca0298458522ffc2c7"
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
@@ -31,16 +28,16 @@ inherit update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "acpixtract"
 
-EXTRA_OEMAKE = "CC='${CC}' 'OPT_CFLAGS=-Wall'"
+EXTRA_OEMAKE = "CC='${CC}' \
+                OPT_CFLAGS=-Wall \
+                DESTDIR=${D} \
+                PREFIX=${prefix} \
+                INSTALLDIR=${bindir} \
+                INSTALLFLAGS= \
+                "
 
 do_install() {
-    install -D -p -m0755 generate/unix/bin*/iasl ${D}${bindir}/iasl
-    install -D -p -m0755 generate/unix/bin*/acpibin ${D}${bindir}/acpibin
-    install -D -p -m0755 generate/unix/bin*/acpiexec ${D}${bindir}/acpiexec
-    install -D -p -m0755 generate/unix/bin*/acpihelp ${D}${bindir}/acpihelp
-    install -D -p -m0755 generate/unix/bin*/acpinames ${D}${bindir}/acpinames
-    install -D -p -m0755 generate/unix/bin*/acpisrc ${D}${bindir}/acpisrc
-    install -D -p -m0755 generate/unix/bin*/acpixtract ${D}${bindir}/acpixtract
+    oe_runmake install
 }
 
 # iasl*.bb is a subset of this recipe, so RREPLACE it
diff --git a/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch b/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
deleted file mode 100644
index d8b5f9aa8a1..00000000000
--- a/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 540d80469e6a7dce6baf7214df90e86daffc5175 Mon Sep 17 00:00:00 2001
-From: Fan Xin <fan.xin@jp.fujitsu.com>
-Date: Mon, 5 Jun 2017 13:26:38 +0900
-Subject: [PATCH] aslfiles.c: manipulate fds instead of FILE
-
-Copying what stdout/stderr point to is not portable and fails with
-musl because FILE is an undefined struct.
-
-Instead, use lower-level Unix functions to modify the file that stderr
-writes into. This works on the platforms that Yocto targets.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
-
-Rebase on acpica 20170303
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
-
----
- source/compiler/aslfiles.c | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/source/compiler/aslfiles.c b/source/compiler/aslfiles.c
-index 82865db..cc072dc 100644
---- a/source/compiler/aslfiles.c
-+++ b/source/compiler/aslfiles.c
-@@ -43,6 +43,11 @@
- 
- #include "aslcompiler.h"
- #include "acapps.h"
-+#include "dtcompiler.h"
-+#include <sys/types.h>
-+#include <sys/stat.h>
-+#include <fcntl.h>
-+#include <unistd.h>
- 
- #define _COMPONENT          ACPI_COMPILER
-         ACPI_MODULE_NAME    ("aslfiles")
-@@ -606,6 +611,8 @@ FlOpenMiscOutputFiles (
- 
-     if (Gbl_DebugFlag)
-     {
-+	int fd;
-+
-         Filename = FlGenerateFilename (FilenamePrefix, FILE_SUFFIX_DEBUG);
-         if (!Filename)
-         {
-@@ -617,10 +624,10 @@ FlOpenMiscOutputFiles (
-         /* Open the debug file as STDERR, text mode */
- 
-         Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Filename = Filename;
--        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle =
--            freopen (Filename, "w+t", stderr);
- 
--        if (!Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle)
-+        fd = open(Filename, O_CREAT|O_TRUNC, S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH);
-+        if (fd < 0 ||
-+            dup2(fd, fileno(stderr)))
-         {
-             /*
-              * A problem with freopen is that on error, we no longer
-@@ -634,6 +641,8 @@ FlOpenMiscOutputFiles (
-             exit (1);
-         }
- 
-+        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle = stderr;
-+
-         AslCompilerSignon (ASL_FILE_DEBUG_OUTPUT);
-         AslCompilerFileHeader (ASL_FILE_DEBUG_OUTPUT);
-     }
diff --git a/meta/recipes-extended/acpica/files/rename-yy_scan_string-manually.patch b/meta/recipes-extended/acpica/files/rename-yy_scan_string-manually.patch
deleted file mode 100644
index b62ca25ba21..00000000000
--- a/meta/recipes-extended/acpica/files/rename-yy_scan_string-manually.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 2ab61e6ad5a9cfcde838379bc36babfaaa61afb8 Mon Sep 17 00:00:00 2001
-From: Patrick Ohly <patrick.ohly@intel.com>
-Date: Fri, 20 Jan 2017 13:50:17 +0100
-Subject: [PATCH] rename yy_scan_string manually
-
-flex 2.6.0 used to generate code where yy_scan_string was mapped
-to <custom prefix>_scan_string directly in the generated .c code.
-
-For example, generate/unix/iasl/obj/prparserlex.c:
-
-int
-PrInitLexer (
-    char                    *String)
-{
-
-    LexBuffer = PrParser_scan_string (String);
-    return (LexBuffer == NULL);
-}
-
-flex 2.6.3 no longer does that, leading to a compiler warning
-and link error about yy_scan_string().
-
-Both versions generate a preamble in the beginning of prparserlex.c
-that maps several yy_* names, but yy_scan_string is not among those:
-
-...
-...
-
-Upstream-Status: Inappropriate [workaround for https://github.com/westes/flex/issues/164]
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
----
- source/compiler/dtparser.l | 2 +-
- source/compiler/prparser.l | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/source/compiler/dtparser.l b/source/compiler/dtparser.l
-index 3f4c2f3..eaa43ff 100644
---- a/source/compiler/dtparser.l
-+++ b/source/compiler/dtparser.l
-@@ -120,7 +120,7 @@ DtInitLexer (
-     char                    *String)
- {
- 
--    LexBuffer = yy_scan_string (String);
-+    LexBuffer = DtParser_scan_string (String);
-     return (LexBuffer == NULL);
- }
- 
-diff --git a/source/compiler/prparser.l b/source/compiler/prparser.l
-index 10bd130..9cb3573 100644
---- a/source/compiler/prparser.l
-+++ b/source/compiler/prparser.l
-@@ -127,7 +127,7 @@ PrInitLexer (
-     char                    *String)
- {
- 
--    LexBuffer = yy_scan_string (String);
-+    LexBuffer = PrParser_scan_string (String);
-     return (LexBuffer == NULL);
- }
- 
--- 
-2.11.0
-
-- 
2.17.1


