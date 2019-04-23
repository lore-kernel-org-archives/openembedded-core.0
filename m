Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id AEF887CFF8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:33:59 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id h18so863994wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=r3vLQWLDXghDGH/X/VjqjjZGTg9DvaBOZCYtuPqsqKI=;
	b=mczRqHDlMZ0i9CvzYMkeeKanpF+v+yKHMGYCyYmQ7OPbJlI3AaIFcasF/1KC24uX92
	X0qjpb5iorsdA6mC8+r5ggFSU6JAWKm/Ux5GO2n0GyXRbdqU3tkt9nZdfeb4/f6IvY/O
	/k/jh+SEw2pCb/pq6Wecgc46JBHUr2vScdMnvNL5Din8ull2cI7uoRuy+93UIfw9EGsv
	GA4l1NnSS5DDwTh93s8CfHocZ+eArNbdORuN0MElEHwfHiYLL8eqmWqTPDk8drjxe9kb
	TpL9wEELtRQR97WFs3wrDE7rPlv4Lkuuho/2lkh60tBcYqYWhKeMJdIoFNXsBiXAqr/k
	ol2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=r3vLQWLDXghDGH/X/VjqjjZGTg9DvaBOZCYtuPqsqKI=;
	b=Q0MSEHq+DWhZQmDGQ5KYbcP4zbCEzC5OL/E5U5Pu8hR97FUTyRXKKEQiimpm+rr/ot
	yb9vya1tVOouiOdOSXqDgQromY+fSl+lZTDre1RaJd8hLLP7E61dgAbtZsDMDquTJDa1
	Rjf17FDpDoLyBX437xKF8vVIPHhhKwjCKDkxwxC0C8SZkyVT44pgccD/tD87f1M0LCUP
	68xUS335dE+4M5yy86/nzFAi2+ZtwL0ZbfQ/6x2+szoB99Y8KmzLQJhZyVtzR3OZI3/O
	TV2+xgkSWLgJowPMdQYKd+ufKvDQRJZS6EzdX1jNHT2lKhQcNFBvp+AX0CfmM06eTXsO
	v7bA==
X-Gm-Message-State: APjAAAVMeUZkr1VCZyBSxZHyCqFJmTyHYEezbvd4zDl17noYzy0d7tqb
	f3qY5ub75iultqKRhdDB4HGRL+Bt+Fs=
X-Google-Smtp-Source: APXvYqzthqHc1jRiDiAsdhJczuIP8/umOxdUiXyXZz5oQ/1/5/zS32Cu0TN8LUPKd2fu3flZElA54Q==
X-Received: by 2002:a1c:e1c5:: with SMTP id y188mr3023034wmg.39.1556037239903; 
	Tue, 23 Apr 2019 09:33:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l21sm14237873wme.4.2019.04.23.09.33.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 09:33:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 17:33:56 +0100
Message-Id: <20190423163356.27421-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] acpica: upgrade to 20190215
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
X-List-Received-Date: Tue, 23 Apr 2019 16:34:00 -0000

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
 .../{acpica_20180508.bb => acpica_20190215.bb}     | 25 ++++----
 .../files/manipulate-fds-instead-of-FILE.patch     | 71 ----------------------
 .../files/rename-yy_scan_string-manually.patch     | 64 -------------------
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
2.11.0


