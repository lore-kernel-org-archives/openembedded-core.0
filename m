Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.1470.1626403376126661608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494684"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494684"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:07 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075564"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:06 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 24/28] dwarfsrcfiles: Avoid races over debug-link files
Date: Fri, 16 Jul 2021 10:42:22 +0800
Message-Id: <52382a03c10a6985ecb6ada24523cb9daf9c6201.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We use dwarfsrcfiles in package.bbclass to list the source files used by a binary.
This is done before they're stripped and linked to debug symbols in separate files.

It is possible a binary may already have a link to separate debug symbols, e.g.
some of the test binaries in lttng-tools ptest. In those cases, the linked binary
may be changed by package.bbclass code whilst dwarfsrcfiles is reading it. That
would result in a rare SIGBUS race causing the binary to fail.

To avoid this, break the debug file search path so no other binaries are found.

Also fix a segfault if no binary is specified while here.

[YOCTO #14400]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit efef732859e265533acf16f2f4da3b29d50e0df4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../dwarfsrcfiles/files/dwarfsrcfiles.c             | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c b/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c
index af7af524eb..9eb5ca807a 100644
--- a/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c
+++ b/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c
@@ -9,6 +9,7 @@
 
 #include <argp.h>
 #include <stdio.h>
+#include <stdlib.h>
 
 #include <dwarf.h>
 #include <elfutils/libdw.h>
@@ -83,13 +84,15 @@ process_cu (Dwarf_Die *cu_die)
 int
 main (int argc, char **argv)
 {
-  char* args[3];
+  char* args[5];
   int res = 0;
   Dwfl *dwfl;
   Dwarf_Addr bias;
   
-  if (argc != 2)
+  if (argc != 2) {
     fprintf(stderr, "Usage %s <file>", argv[0]);
+    exit(EXIT_FAILURE);
+  }
   
   // Pretend "dwarfsrcfiles -e <file>" was given, so we can use standard
   // dwfl argp parser to open the file for us and get our Dwfl. Useful
@@ -98,8 +101,12 @@ main (int argc, char **argv)
   args[0] = argv[0];
   args[1] = "-e";
   args[2] = argv[1];
+  // We don't want to follow debug linked files due to the way OE processes
+  // files, could race against changes in the linked binary (e.g. objcopy on it)
+  args[3] = "--debuginfo-path";
+  args[4] = "/not/exist";
   
-  argp_parse (dwfl_standard_argp (), 3, args, 0, NULL, &dwfl);
+  argp_parse (dwfl_standard_argp (), 5, args, 0, NULL, &dwfl);
   
   Dwarf_Die *cu = NULL;
   while ((cu = dwfl_nextcu (dwfl, cu, &bias)) != NULL)
-- 
2.31.1

