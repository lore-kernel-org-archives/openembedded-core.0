Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id B30CA7307B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 17:49:02 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id 203so8407355ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mNaanQROyChBrpvtyC7Pi1PU/YRDZ6WsFCIyhq6GbV8=;
	b=wNpPO156fCRbFuVT72hd8PkagTqvZmQ+Evo+DURXH5poFGzrLE1jPxnDWwhzYtNRNk
	KLsaq27GDG9g14e+sbrQZwVJ+VMmmsXYkcawDAdzdrzdO4NUbG8kv2xSxjvJzrcGFos4
	mQ9Ft1HuJnNacSCpBqmfAkJ7olLgBKmPmfrqCO5fDaOE9t9rknnJllr3tCYVhbRALxy1
	oyjF9Ag6fSEyw9zfaDkpN6VK/0up4XcMkodewSmttNCjDMxmaro2sskttESunY+knaCf
	iB/kBNt7NO5W/S4h75BWoIar2RY6XNdRR2fBjDX97f/Mj3tv3i0U0sJ4mZ6QlDu+SdQV
	MZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mNaanQROyChBrpvtyC7Pi1PU/YRDZ6WsFCIyhq6GbV8=;
	b=k1GBmA9ERf9p2l0h7UMnAW5AhH+mkzcRoM73xRBVX4U06Z5fN1iGUqcOSNLCOR/h4u
	7YQCptFjkLs3a+3DtTrxETDDV5q9Y565inc7AdeqgCHIWdobQji92rWlZcrt6y/J3twI
	+bXbBXA+dbRrQh1Hd1MOv+clM15fEnbaIkSaSjXFBmlfxifh0oX5BwQICQJnmFDMWyOt
	ybyW/n6cGrswPALDy2bGqkJkGhrnvSgikzr7c5uzgyvzOPRxJIsutvaFIyp8q9sdkic/
	xeCcqEMnfBHHDCmj3tec2NCrNWsGcujoGbYayVIRmVV5OKHUBT8aKi1IbjoA4M6fz/mf
	Hr1A==
X-Gm-Message-State: AMke39kKHhY+hNVe+yuowHXESk544cz0mWsUh7Neqlxw6XIrGLWMaEbWmmwN6Cv/h4EzEg4I
X-Received: by 10.107.5.137 with SMTP id 131mr32307920iof.87.1487872143677;
	Thu, 23 Feb 2017 09:49:03 -0800 (PST)
Received: from pohly-mobl1.event.rightround.com ([67.23.202.154])
	by smtp.gmail.com with ESMTPSA id 202sm2258437ity.8.2017.02.23.09.49.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 09:49:02 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 18:48:50 +0100
Message-Id: <1487872131-6571-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1487872053.11306.39.camel@intel.com>
References: <1487872053.11306.39.camel@intel.com>
Subject: [PATCH 1/2] acpica: fix compilation with musl
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
X-List-Received-Date: Thu, 23 Feb 2017 17:49:03 -0000

Manipulating stderr after freopen() fails as done by upstream
does not work with musl. The replacement is Unix specific
and uses open()/dup2().

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-extended/acpica/acpica_20150515.bb    |  1 +
 .../files/manipulate-fds-instead-of-FILE.patch     | 71 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch

diff --git a/meta/recipes-extended/acpica/acpica_20150515.bb b/meta/recipes-extended/acpica/acpica_20150515.bb
index c23b491..b55f353 100644
--- a/meta/recipes-extended/acpica/acpica_20150515.bb
+++ b/meta/recipes-extended/acpica/acpica_20150515.bb
@@ -19,6 +19,7 @@ DEPENDS = "bison flex"
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
     file://no-werror.patch \
     file://rename-yy_scan_string-manually.patch \
+    file://manipulate-fds-instead-of-FILE.patch \
     "
 SRC_URI[md5sum] = "2bc4a7ccc82de9df9fa964f784ecb29c"
 SRC_URI[sha256sum] = "61204ec56d71bc9bfa2ee2ade4c66f7e8541772ac72ef8ccc20b3f339cc96374"
diff --git a/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch b/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
new file mode 100644
index 0000000..6944bb7
--- /dev/null
+++ b/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
@@ -0,0 +1,71 @@
+From 33a57979738e5ab13950ec1c0e7298e41ef50929 Mon Sep 17 00:00:00 2001
+From: Patrick Ohly <patrick.ohly@intel.com>
+Date: Thu, 23 Feb 2017 18:10:47 +0100
+Subject: [PATCH] aslfiles.c: manipulate fds instead of FILE
+
+Copying what stdout/stderr point to is not portable and fails with
+musl because FILE is an undefined struct.
+
+Instead, use lower-level Unix functions to modify the file that stderr
+writes into. This works on the platforms that Yocto targets.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+---
+ source/compiler/aslfiles.c | 20 +++++++++++---------
+ 1 file changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/source/compiler/aslfiles.c b/source/compiler/aslfiles.c
+index 947e465..7a352b4 100644
+--- a/source/compiler/aslfiles.c
++++ b/source/compiler/aslfiles.c
+@@ -44,6 +44,11 @@
+ #include "aslcompiler.h"
+ #include "acapps.h"
+ 
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <fcntl.h>
++#include <unistd.h>
++
+ #define _COMPONENT          ACPI_COMPILER
+         ACPI_MODULE_NAME    ("aslfiles")
+ 
+@@ -569,6 +574,8 @@ FlOpenMiscOutputFiles (
+ 
+     if (Gbl_DebugFlag)
+     {
++        int fd;
++
+         Filename = FlGenerateFilename (FilenamePrefix, FILE_SUFFIX_DEBUG);
+         if (!Filename)
+         {
+@@ -582,20 +589,15 @@ FlOpenMiscOutputFiles (
+         /* TBD: hide this behind a FlReopenFile function */
+ 
+         Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Filename = Filename;
+-        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle =
+-            freopen (Filename, "w+t", stderr);
+-
+-        if (!Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle)
++        fd = open(Filename, O_CREAT|O_TRUNC, S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH);
++        if (fd < 0 ||
++            dup2(fd, fileno(stderr)))
+         {
+-            /*
+-             * A problem with freopen is that on error,
+-             * we no longer have stderr.
+-             */
+             Gbl_DebugFlag = FALSE;
+-            memcpy (stderr, stdout, sizeof (FILE));
+             FlFileError (ASL_FILE_DEBUG_OUTPUT, ASL_MSG_DEBUG_FILENAME);
+             AslAbort ();
+         }
++        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle = stderr;
+ 
+         AslCompilerSignon (ASL_FILE_DEBUG_OUTPUT);
+         AslCompilerFileHeader (ASL_FILE_DEBUG_OUTPUT);
+-- 
+2.1.4
+
-- 
2.1.4


