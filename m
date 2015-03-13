Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id C84C96013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 18:39:04 +0000 (UTC)
Received: by widem10 with SMTP id em10so8237120wid.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 11:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=V7yFe0ofSvqmYDA5WnTbZQU8rtE4m+kOy3xwA2OVQqI=;
	b=pG8tv3LnCpV4+zSi0Xrx26d4swuK6EoheDkInkJNpt9Ntj1osirLgv+XojGPFMIcMH
	k6dAcLTCHCv0cI4twr/Klunb7G6ca7Hg466lZ5hWa67EQM7FIknTMvKlbyKJIZYhlnse
	unlgI6D9Wxfm17VtzJNBc/iAij3tZlQphFQPGIRdXXihQpl2J995rWVxwNjHQLHIUXnK
	B1M89Yxw0ZADvX9afTUYncW1IYk1nXDx+ZegfGQ/gKpsM6s/yyYABav96X6X/7J5koWx
	wYuxw2O+cJFxS2Wb6qZ/4priKPJu9/8QHkB/3eBtpxcAvHbSxTi8lJh+BOMjRfHGeNRQ
	6V6w==
X-Received: by 10.180.21.206 with SMTP id x14mr44818062wie.65.1426271945818;
	Fri, 13 Mar 2015 11:39:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dj5sm3914710wjb.28.2015.03.13.11.39.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Mar 2015 11:39:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2015 19:39:58 +0100
Message-Id: <1426271998-12451-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
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
X-List-Received-Date: Fri, 13 Mar 2015 18:39:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../valgrind/enable.building.on.4.x.kernel.patch   | 36 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |  1 +
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
2.3.1


