Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id A93A46E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 12:37:31 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so177526205wgy.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QvTJyye0RdZ4fsrknQIIL3xcJii98x4QawzOMYjjqs0=;
	b=fr6NWJiPAQ6U/N+u7cK/cQfvUt1rRoBK1g6QYIuqSQ1389APaJlWHQCNdDuaW+5i2o
	cPQn3OGZvx9V7uAZO/jb8TgC6uo+rSRO0yyrf4l9URRhx8FmkOA0d/L9e/2hkwc5ighA
	Tjt8p9dwzUOJHXYN/bVm5UsFwbrI88jOsbxF9eaK+2xuN1YZ9Oi3G+tZDXx0Pb7xon70
	0f817+mYD/fnZozN7sNli8j1mqHSdZQsdIGz7raVfZPiwbGSZJ1dL8xE1sH1if7BenDO
	B4HKCV4qRfE0p0hPKACZDUtv73p0Su+bpPMIMbvE+Z/Wu6jmPw51r5tli2f4gMaFV4NO
	XJsw==
X-Received: by 10.194.90.15 with SMTP id bs15mr31224952wjb.22.1429533452647;
	Mon, 20 Apr 2015 05:37:32 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	z13sm27102640wjr.44.2015.04.20.05.37.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Apr 2015 05:37:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 14:37:34 +0200
Message-Id: <1429533454-1705-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [dizzy][PATCH] valgrind: enable building on 4.x kernel
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
X-List-Received-Date: Mon, 20 Apr 2015 12:37:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../valgrind/enable.building.on.4.x.kernel.patch   | 36 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch b/meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch
new file mode 100644
index 0000000..a90fcc5
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch
@@ -0,0 +1,36 @@
+Enable building valgrind on host with 4.x kernel.
+
+For OpenEmbedded builds we should be checking something like
+OLDEST_KERNEL instead of `uname -r`, but this is good enough for now.
+
+Building on 4.x* currently fails with:
+  configure:5556: checking for the kernel version
+  configure:5579: result: unsupported (4.0.0-rc3-00111-gaffb817)
+  configure:5581: error: Valgrind works on kernels 2.4, 2.6
+
+Upstream-Status: Pending
+
+--- valgrind-3.9.0/configure.ac.orig	2015-03-13 19:17:01.247310868 +0100
++++ valgrind-3.9.0/configure.ac	2015-03-13 19:19:27.388316108 +0100
+@@ -276,9 +276,9 @@
+         kernel=`uname -r`
+ 
+         case "${kernel}" in
+-             2.6.*|3.*) 
+-        	    AC_MSG_RESULT([2.6.x/3.x family (${kernel})])
+-        	    AC_DEFINE([KERNEL_2_6], 1, [Define to 1 if you're using Linux 2.6.x or Linux 3.x])
++             2.6.*|3.*|4.*) 
++        	    AC_MSG_RESULT([2.6.x/3.x/4.x family (${kernel})])
++        	    AC_DEFINE([KERNEL_2_6], 1, [Define to 1 if you're using Linux 2.6.x or Linux 3.x or Linux 4.x])
+         	    ;;
+ 
+              2.4.*) 
+@@ -288,7 +288,7 @@
+ 
+              *) 
+         	    AC_MSG_RESULT([unsupported (${kernel})])
+-        	    AC_MSG_ERROR([Valgrind works on kernels 2.4, 2.6])
++        	    AC_MSG_ERROR([Valgrind works on kernels 2.4, 2.6, 3.x, 4.x])
+         	    ;;
+         esac
+ 
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
index eea81a2..9e1ab5f 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://force-nostabs.patch \
            file://remove-arm-variant-specific.patch \
            file://remove-ppc-tests-failing-build.patch \
+           file://enable.building.on.4.x.kernel.patch \
            file://add-ptest.patch \
            file://pass-maltivec-only-if-it-supported.patch \
            file://run-ptest \
-- 
2.3.5


