Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id C01D6610E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 00:56:17 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so3854528pbb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 17:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VjKfDOdKAOLVcqx39y8E1kinj+9qE5YQtonaW4DRmNo=;
	b=XbmHSVmDuQMOZ6IOX6cQYya4mWZrfuyaRvDSdNVH1R9ZhGf+t0vId21A44FC+rT+Ir
	Zawk3ofDWnTK/qUzxUZWO/Uopc9eQ/jz3gPgUfFtTo2PDA6teijtNcktwttzRflPDRVf
	2wXi+DQjvG9JRWJcoeD0V8XJ4k+PkDO+X0OvPI77yAQ5hSY68tByUMI2Xqv9LMAV70S4
	+Lg/CjH/6u8lErWeEPfCnLsnsnj2p0KrlMLDsJnAIYZ3rgHyw1PPQFZ37Gnghyc1qUMZ
	/kp1vAqlvIDNJIYmHeMchD6PfQRSvVCuNmxsPKrULNaDcJVZnbJZ9d5I8LIumW+rnP0U
	OkTg==
X-Received: by 10.68.185.68 with SMTP id fa4mr282171pbc.136.1379984179650;
	Mon, 23 Sep 2013 17:56:19 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	os4sm36942180pbb.25.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 17:56:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 17:56:11 -0700
Message-Id: <1379984171-28178-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [dylan][PATCH] elfutils: Fix build with gcc 4.8
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
X-List-Received-Date: Tue, 24 Sep 2013 00:56:18 -0000

Distributions where we have gcc 4.8 we have started to see
elfutils-native fail to build with errors described in patch
below. This patch backports 68f93378f47dee5d0d5bf898a8ec14f29fa28cbd
to dylan

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils/fix-build-gcc-4.8.patch      | 57 ++++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |  3 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch b/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch
new file mode 100644
index 0000000..1532ba2
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch
@@ -0,0 +1,57 @@
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
+Index: elfutils-0.148/src/addr2line.c
+===================================================================
+--- elfutils-0.148.orig/src/addr2line.c
++++ elfutils-0.148/src/addr2line.c
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
+Index: elfutils-0.148/tests/line2addr.c
+===================================================================
+--- elfutils-0.148.orig/tests/line2addr.c
++++ elfutils-0.148/tests/line2addr.c
+@@ -132,7 +132,7 @@ main (int argc, char *argv[])
+     {
+       struct args a = { .arg = argv[cnt] };
+ 
+-      switch (sscanf (a.arg, "%a[^:]:%d", &a.file, &a.line))
++      switch (sscanf (a.arg, "%m[^:]:%d", &a.file, &a.line))
+ 	{
+ 	default:
+ 	case 0:
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 9c0a08e..b85b0f0 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
@@ -33,6 +33,7 @@ SRC_URI += "\
 	file://dso-link-change.patch \
 	file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch \
 	file://elfutils-ar-c-fix-num-passed-to-memset.patch \
+	file://fix-build-gcc-4.8.patch \
 "
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
-- 
1.8.3.2


