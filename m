Return-Path: <net147@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5B84065DA3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 04:50:28 +0000 (UTC)
Received: by pdjy10 with SMTP id y10so22264865pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Mar 2015 21:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ImCmxPYqNVKydC4mM5y3w9LuMwmavbCDsSJPr+772WE=;
	b=sfuDd6sTBYcnC7TF5sPivCzCkfY8moO1ZF7K3pEhyyXk4mUTv8uF6wjVsyQMAk3pMb
	me1ZCnHjoDO86urwl0j2hgTbvXz72lP6XFbkpo3f0fzV5VtdCGizUOFn4S7QlOwBnzJw
	eV+1X4lsx0rG7ZzBEDG4+KU/17XN4JxxZamXeXgF68FnfQ5E7D56J/dl7KfBmMoVnH4f
	6lDrrf5qqcupuoEA4F3cPBCWtcQl/IEvyBony6U1Oi0ABtwgDsaNNNB4R2Mc/aWHe3RQ
	tIb/8HRQuNfmc2YQnYaN7400/LWWR/SFJH2zgbACRf/TmIiMjtqUtQVPb9dNL6vpVu2h
	oZ3A==
X-Received: by 10.70.41.33 with SMTP id c1mr50297274pdl.22.1425876629922;
	Sun, 08 Mar 2015 21:50:29 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id x1sm16769236pdr.17.2015.03.08.21.50.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Mar 2015 21:50:28 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2015 15:50:18 +1100
Message-Id: <1425876618-23780-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] libunwind: backport patch to link against libgcc_s intead of libgcc
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
X-List-Received-Date: Mon, 09 Mar 2015 04:50:29 -0000

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
index 5b54dcb..ee6f522 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -4,6 +4,7 @@ SRC_URI += "\
     file://Support-building-with-older-compilers.patch \
     file://AArch64-port.patch \
     file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch \
+    file://Link-libunwind-to-libgcc_s-rather-than-libgcc.patch \
 "
 
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
-- 
2.3.1


