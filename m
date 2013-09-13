Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id CBF7560F91
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 05:25:56 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bj1so2065954pad.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 22:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1WFnDTuHJh1yhHAYGdCHPDmlnc3PtHh0Kk0NLPZZnMg=;
	b=pQoceNz+BCsM3Z7yo5OxTVVagUJX+TLn5EPlrGyE1+CEDbbv01kR2nx127W2sGlTLr
	PpyGEvNNQx2NdppX7h+/G5jts/53Vwu7RehkUCOd+hWqREJC5jZjDe3FHKpe255AztfW
	fW+s2LvX6+bClMoXeKM64XHWGtebgFv6TqMkC3melZ01vFLtOcNGk8ZNxZ3rO7/0OH4a
	K+etfgfc6iIKxGWd6ldIIbGiLZMVT+DuBV189pi7vesBCS2Q81OwKTyC5iECe1P1GiEA
	5gxVumGe2QbWHa28de9w9gTNyTSZ/PCHi7gC5fW9GDBF2tKLziyyZ7sey6xA+TJd+ZUC
	t56Q==
X-Received: by 10.68.189.39 with SMTP id gf7mr74311pbc.184.1379049958526;
	Thu, 12 Sep 2013 22:25:58 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id go4sm9076706pbb.15.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 22:25:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2013 22:25:50 -0700
Message-Id: <1379049950-21734-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] elfutils-native: Fix build on distros with gcc 4.8
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
X-List-Received-Date: Fri, 13 Sep 2013 05:25:58 -0000

The patch redhat-portability.diff causes this issue
so lets revert the portion which was using %a instead of %m
thats recommended anyway, redhat patch seems to be targetting
old compilers.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils/fix-build-gcc-4.8.patch      | 44 ++++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.155.bb   |  3 +-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch b/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch
new file mode 100644
index 0000000..a7c3519
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch
@@ -0,0 +1,44 @@
+This patch fixes a warning seen with gcc 4.8 (especially on ubuntu 13.10)
+
+| addr2line.c: In function 'handle_address':
+| addr2line.c:450:7: error: format '%a' expects argument of type 'float *', but argument 3 has type 'char **' [-Werror=format=]
+|        if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
+|        ^
+| addr2line.c:453:7: error: format '%a' expects argument of type 'float *', but argument 3 has type 'char **' [-Werror=format=]
+|        switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
+|        ^
+| cc1: all warnings being treated as errors
+
+
+%a is old GNU style and should be abandoned in favor of %m
+
+Also see
+
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=54361
+
+to support this assertion
+
+This patch is added via redhat-compatibility patch so lets revert this part
+here.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [Caused by an earlier patch]
+
+Index: elfutils-0.155/src/addr2line.c
+===================================================================
+--- elfutils-0.155.orig/src/addr2line.c
++++ elfutils-0.155/src/addr2line.c
+@@ -447,10 +447,10 @@ handle_address (const char *string, Dwfl
+       bool parsed = false;
+       int i, j;
+       char *name = NULL;
+-      if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
++      if (sscanf (string, "(%m[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
+ 	  && string[i] == '\0')
+ 	parsed = adjust_to_section (name, &addr, dwfl);
+-      switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
++      switch (sscanf (string, "%m[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
+ 	{
+ 	default:
+ 	  break;
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.155.bb b/meta/recipes-devtools/elfutils/elfutils_0.155.bb
index c5a2f0e..1a8c3c7 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.155.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.155.bb
@@ -5,8 +5,6 @@ LICENSE = "(GPLv3 & Elfutils-Exception)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
-PR = "r0"
-
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/elfutils-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "163a5712b86f6bdfebdf233cc6e2192d"
@@ -24,6 +22,7 @@ SRC_URI += "\
 	file://dso-link-change.patch \
 	file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch \
 	file://elfutils-ar-c-fix-num-passed-to-memset.patch \
+	file://fix-build-gcc-4.8.patch \
 "
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
-- 
1.8.3.2


