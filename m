Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE476F173
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 17:46:04 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id fp1so179676pdb.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 09:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/trKYDT3i8iluj7HTfU6ABYnSfKcE6bIzC3lk1aumY8=;
	b=OL6ih+J8ql6T1yOiH/4G2fqMv3MslzO8KUABvh0JcwXX8arcJ3i9Ypnh2YPSS3F3yp
	Drd2ZGXD36lT+20PHO39Tqzqw16inAfCizIFyIV21vbv1IqAkPQod+FvS16CR6xTUvxN
	C7o0gYOonttjCuGe+td54KTqs+K6ruo5dLsK9mdwbnhQhkc29S3XlCCN1FqiVWH79LtM
	UjjmGBa/i+w+aTq5xxY6ea6RuAfPguBFplkd+VHuQx/hctwpIQlj1ytg+07TKC8rfGhT
	UzpapUAsHf99yZE7BA11rC+hA7eVmOyaPQEU2Lr0uVzolHAy4jRJhuDs+hS+ZTEHcmx2
	O6bg==
X-Received: by 10.66.216.129 with SMTP id oq1mr10067027pac.75.1393436765762;
	Wed, 26 Feb 2014 09:46:05 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id kc9sm5344984pbc.25.2014.02.26.09.46.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Feb 2014 09:46:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2014 09:47:33 -0800
Message-Id: <1393436853-23869-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] python3: Fix race condition at high parallelism factor
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
X-List-Received-Date: Wed, 26 Feb 2014 17:46:05 -0000

Backport a patch to fix race condition as reported here

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5884

[YOCTO #5884]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-native_3.3.3.bb                 |  1 +
 .../python/python3/fix-ast.h-dependency.patch      | 26 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.3.3.bb      |  1 +
 3 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/fix-ast.h-dependency.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bb b/meta/recipes-devtools/python/python3-native_3.3.3.bb
index 26b811f..97bf3b5 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.3.3.bb
@@ -22,6 +22,7 @@ file://shutil-follow-symlink-fix.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
 file://sysroot-include-headers.patch \
 file://unixccompiler.patch \
+file://fix-ast.h-dependency.patch \
 ${DISTRO_SRC_URI} \
 "
 SRC_URI[md5sum] = "f3ebe34d4d8695bf889279b54673e10c"
diff --git a/meta/recipes-devtools/python/python3/fix-ast.h-dependency.patch b/meta/recipes-devtools/python/python3/fix-ast.h-dependency.patch
new file mode 100644
index 0000000..77c220a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/fix-ast.h-dependency.patch
@@ -0,0 +1,26 @@
+Fix a missed dependency on ast.h which can result in race condition
+at high parallel build
+
+It fixed here
+
+http://hg.python.org/cpython/rev/cfe0a293551f
+
+[YOCTO #5884]
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: Python-3.3.3/Makefile.pre.in
+===================================================================
+--- Python-3.3.3.orig/Makefile.pre.in	2014-02-26 09:33:13.868288863 -0800
++++ Python-3.3.3/Makefile.pre.in	2014-02-26 09:36:27.348292492 -0800
+@@ -853,7 +853,8 @@
+ 		$(srcdir)/Include/warnings.h \
+ 		$(srcdir)/Include/weakrefobject.h \
+ 		pyconfig.h \
+-		$(PARSER_HEADERS)
++		$(PARSER_HEADERS) \
++		$(AST_H)
+ 
+ $(LIBRARY_OBJS) $(MODOBJS) Modules/python.o: $(PYTHON_HEADERS)
+ 
diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-devtools/python/python3_3.3.3.bb
index d359863..5d1ef5b 100644
--- a/meta/recipes-devtools/python/python3_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3_3.3.3.bb
@@ -17,6 +17,7 @@ file://110-enable-zlib.patch \
 file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
+file://fix-ast.h-dependency.patch \
 ${DISTRO_SRC_URI} \
 "
 
-- 
1.9.0


