Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 772C665CD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 12:13:30 +0000 (UTC)
Received: by webcq43 with SMTP id cq43so6064077web.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 05:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d5FzREgjDhs47x44hldfQrys+ZaXMuKTzrWqVS1JyO0=;
	b=bFp3Va0DWYwlFn9yhde+DoNY1aWkSce3hwJPyNsCDBBK/ZFBmokfkCBMU0ZsLLKhrt
	dclCb+l9QH1edMzN0cpeoPSdO0aNXfd1zchyop1FDdohLHUWFoHlXOOXmtCWmRsCUREm
	lECm3BJCTx66AX3HxbShcjfYd6O/UWQz+bt5dbGyIHcJU0FdolV0HUDu6N9oa0O8rQJY
	qUkqqNnmWLp/i/6tmYP5hTttpQk3WLIkIMIEUcN7FB3kr7Wb/jiG6oaaffBeRJQ0Cudy
	XSNoZL/FYoia1QKJ7Wqb9jwj87N0IQ5CV4EDaS7MJB0FSPJqLUbaeE+tEkw9bHrMC+tX
	90hg==
X-Received: by 10.194.61.51 with SMTP id m19mr133304913wjr.39.1426594410853;
	Tue, 17 Mar 2015 05:13:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id j7sm2454767wix.4.2015.03.17.05.13.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Mar 2015 05:13:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2015 13:13:34 +0100
Message-Id: <1426594414-14636-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.3
In-Reply-To: <CAJTo0LaKV5iUOzOPU-nnm1Yqd0C84aT+B3iMHo7OB8osQpj-ew@mail.gmail.com>
References: <CAJTo0LaKV5iUOzOPU-nnm1Yqd0C84aT+B3iMHo7OB8osQpj-ew@mail.gmail.com>
Subject: [PATCH] valgrind: enable building on 4.x kernel
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
X-List-Received-Date: Tue, 17 Mar 2015 12:13:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../valgrind/enable.building.on.4.x.kernel.patch   | 37 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch b/meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch
new file mode 100644
index 0000000..300f2f1
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch
@@ -0,0 +1,37 @@
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
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
index 1c2ac61..365e968 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://remove-arm-variant-specific.patch \
            file://remove-ppc-tests-failing-build.patch \
            file://valgrind-remove-rpath.patch \
+           file://enable.building.on.4.x.kernel.patch \
            file://add-ptest.patch \
            file://run-ptest \
           "
-- 
2.3.3


