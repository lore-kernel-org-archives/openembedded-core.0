Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9E476EBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 20:19:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 16 May 2016 13:19:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,627,1459839600"; d="scan'208";a="704007370"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.59])
	by FMSMGA003.fm.intel.com with ESMTP; 16 May 2016 13:19:45 -0700
From: edwin.plauchu.camacho@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 15:19:56 -0500
Message-Id: <1463429996-24056-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] meta:recipes-extended: stat fix security gaps
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
X-List-Received-Date: Mon, 16 May 2016 20:19:45 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

This patch avoids stat fails to compile with compiler flags which elevate common string formatting issues into an error (-Wformat -Wformat-security -Werror=format-security).

[YOCTO #9550]

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 meta/conf/distro/include/security_flags.inc        |  1 -
 .../stat/stat-3.3/fix-security-format.patch        | 77 ++++++++++++++++++++++
 meta/recipes-extended/stat/stat_3.3.bb             |  1 +
 3 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/stat/stat-3.3/fix-security-format.patch

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 7a91cec..5ae6dd8 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -105,7 +105,6 @@ SECURITY_STRINGFORMAT_pn-gettext = ""
 SECURITY_STRINGFORMAT_pn-kexec-tools = ""
 SECURITY_STRINGFORMAT_pn-makedevs = ""
 SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
-SECURITY_STRINGFORMAT_pn-stat = ""
 SECURITY_STRINGFORMAT_pn-unzip = ""
 SECURITY_STRINGFORMAT_pn-zip = ""
 
diff --git a/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch b/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
new file mode 100644
index 0000000..7d9f8df
--- /dev/null
+++ b/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
@@ -0,0 +1,77 @@
+meta: recipes-extended: Fixing security formatting issues on stat
+
+Fix security formatting issues related to printf without NULL argument 
+
+stat.c: In function 'print_human_access':
+stat.c:292:13: error: format not a string literal and no format arguments [-Werror=format-security]
+     printf (access);
+             ^
+stat.c: In function 'print_human_time':
+stat.c:299:57: error: format not a string literal and no format arguments [-Werror=format-security]
+   if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
+                                                         ^
+stat.c: In function 'print_it':
+stat.c:613:6: error: format not a string literal and no format arguments [-Werror=format-security]
+      printf(b);
+      ^
+stat.c:642:6: error: format not a string literal and no format arguments [-Werror=format-security]
+      printf(b);
+      ^
+
+[YOCTO #9550]
+[https://bugzilla.yoctoproject.org/show_bug.cgi?id=9550]
+
+Upstream-Status: Pending
+
+Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
+
+diff --git a/stat.c b/stat.c
+index 1ed07a9..351ab54 100644
+--- a/stat.c
++++ b/stat.c
+@@ -21,6 +21,8 @@
+ 
+ #include "fs.h"
+ 
++#define __PRINT(STR) printf (STR,NULL)
++
+ void print_human_type(unsigned short mode)
+ {
+   switch (mode & S_IFMT)
+@@ -289,15 +291,15 @@ void print_human_access(struct stat *statbuf)
+     default:
+       access[0] = '?';
+     }
+-    printf (access);
++    __PRINT(access);
+ }
+ 
+ void print_human_time(time_t *t)
+ {
+   char str[40];
+   
+-  if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
+-  else printf("Cannot calculate human readable time, sorry");
++  if (strftime(str, 40, "%c", localtime(t)) > 0) __PRINT(str);
++  else __PRINT("Cannot calculate human readable time, sorry");
+ }
+ 
+ /* print statfs info */
+@@ -610,7 +612,7 @@ void print_it(char *masterformat, char *filename,
+ 	{
+ 	    strcpy (pformat, "%");
+ 	    *m++ = '\0';
+-	    printf(b);
++	    __PRINT(b);
+ 
+ 	    /* copy all format specifiers to our format string */
+ 	    while (isdigit(*m) || strchr("#0-+. I", *m))
+@@ -639,7 +641,7 @@ void print_it(char *masterformat, char *filename,
+ 	}
+ 	else
+ 	{
+-	    printf(b);
++	    __PRINT(b);
+ 	    b = NULL;
+ 	}
+     }
diff --git a/meta/recipes-extended/stat/stat_3.3.bb b/meta/recipes-extended/stat/stat_3.3.bb
index a5ece07..0697c73 100644
--- a/meta/recipes-extended/stat/stat_3.3.bb
+++ b/meta/recipes-extended/stat/stat_3.3.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39886b077fd072e876e5c4c16310b631 \
                     file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://www.ibiblio.org/pub/Linux/utils/file/${BP}.tar.gz \
+           file://fix-security-format.patch \
            file://fix-error-return.patch"
 
 SRC_URI[md5sum] = "37e247e8e400ad9205f1b0500b728fd3"
-- 
1.9.1


