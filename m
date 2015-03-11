Return-Path: <net147@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id AAFE573AB1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 02:33:41 +0000 (UTC)
Received: by pdjy10 with SMTP id y10so7099465pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 19:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Gz4mgES/C+JbOKNvcvqNW57WDweZHnGH+9wO6aCWcm8=;
	b=V0K+M7ZO/k6PZavgHsa2HpF8Uf0pQjCnwaYyiD4l8jzv2V6oWpTrcUtFFmafkWEmh6
	m75vpE1yo9Ktas70wuTkfAFcR42Hhyiv+LsSt7Kb8AC9m5ys2jj7LmexBI8j2wJfcvKK
	zO5x1CLrePAivV4qkjsGSgcyVtwts/vdcxJUEIM4hkwahQwsyIUwvz0nygLrkdMUbUO/
	DAyMNOn/4UBSYbBZ0Lc3OsXmOK/V7TJ6ULBQdXadXjt+4OOYg89i7Ml+BZYb/mRGInNa
	DDRATcjE0Lk9c0RPHlDmz4NbqU/qBUy3ViNnR8CtBT+aef2KsNX7vvo/NSbQu9n5xEu7
	IJqw==
X-Received: by 10.67.5.130 with SMTP id cm2mr71680961pad.110.1426041222909;
	Tue, 10 Mar 2015 19:33:42 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id x1sm3245476pdr.17.2015.03.10.19.33.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 19:33:42 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2015 13:33:05 +1100
Message-Id: <1426041185-27916-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [dizzy][PATCH] libunwind: backport patch to link against libgcc_s intead of libgcc
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
X-List-Received-Date: Wed, 11 Mar 2015 02:33:41 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...-libunwind-to-libgcc_s-rather-than-libgcc.patch | 42 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch

diff --git a/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch b/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
new file mode 100644
index 0000000..0e55c91
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
@@ -0,0 +1,42 @@
+From 508ca17a7be01d1cc960d9a07d0af4513948fb8d Mon Sep 17 00:00:00 2001
+From: Thierry Reding <treding@nvidia.com>
+Date: Fri, 27 Jun 2014 08:40:33 +0200
+Subject: [PATCH] Link libunwind to libgcc_s rather than libgcc
+
+For some architectures, -lgcc and -lgcc_s are not equivalent. On ARM for
+example, libgcc_s.so.1 contains some symbols needed by libunwind which
+are not present in libgcc.
+
+This causes the following link error when building the X.Org X server
+with libunwind support:
+
+	  CCLD     Xorg
+	/usr/lib/libunwind.so: undefined reference to `__aeabi_unwind_cpp_pr0'
+	/usr/lib/libunwind.so: undefined reference to `__aeabi_unwind_cpp_pr1'
+
+Linking against libgcc_s explicitly solves this problem.
+
+Upstream-Status: Backport
+
+Signed-off-by: Thierry Reding <treding@nvidia.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index cffe19b..3beb5f2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -258,7 +258,7 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[#ifndef __INTEL_COMPILER
+ 
+ if test x$GCC = xyes -a x$intel_compiler != xyes; then
+   CFLAGS="${CFLAGS} -fexceptions -Wall -Wsign-compare"
+-  LIBCRTS="-lgcc"
++  LIBCRTS="-lgcc_s"
+ fi
+ AC_MSG_RESULT([$intel_compiler])
+ 
+-- 
+2.3.2
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
index 20db132..05dba3b 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -2,6 +2,7 @@ require libunwind.inc
 
 SRC_URI += "\
     file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch \
+    file://Link-libunwind-to-libgcc_s-rather-than-libgcc.patch \
 "
 
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
-- 
2.3.1


