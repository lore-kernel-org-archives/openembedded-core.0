Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (unknown [209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 391AD6FC63
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 06:58:29 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id kq14so12444036pab.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 23:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0Oglg4ttWW/FZlAWYXmtdjoqcT57oS9CW0kM0Ol1ZxU=;
	b=zQjKq14MiIuPbfmx2P4rbMpOZxJ0vkht6mdum8af481wD9t9JT6pI1tIUh9AW5QQXF
	eK8hWFsZ2paD4lFbweRQyBrL9TMuNy5V0HxqxgGpjPYgWiR9GnRlHyzfSn0ufGXX1MW0
	/cK1DcEpcMBX9HD7qChOTii6VJr/mtuBtCACOwyGtBxHJvKntPRS1nAGHFN7xplSE/bK
	IwckxdL9enjwl0NmlYp2BBSnbk+Z4Fmwf38JwrMc8VPJzcBNkeLe+lf2uDjJJDWstE6v
	Rq6WeE2NvrdfMOJd84r0teSZiwuQaqfE/4jJBbtFXpazcsZZIy3T0mSsuYEcPCaefwut
	GTnA==
X-Received: by 10.66.136.103 with SMTP id pz7mr6275312pab.140.1401346711259;
	Wed, 28 May 2014 23:58:31 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	sh5sm31748177pbc.21.2014.05.28.23.58.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 23:58:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2014 00:01:06 -0700
Message-Id: <df6f93efd9202da413f57f95e3b096fafcb35c74.1401346650.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <195e0373341bceca90bf6d114a4569756d5a4905.1401346650.git.raj.khem@gmail.com>
References: <195e0373341bceca90bf6d114a4569756d5a4905.1401346650.git.raj.khem@gmail.com>
In-Reply-To: <cover.1401346650.git.raj.khem@gmail.com>
References: <cover.1401346650.git.raj.khem@gmail.com>
Subject: [PATCH 6/7] gnu-config: Let it recognise *-*-musl* triplets
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
X-List-Received-Date: Thu, 29 May 2014 06:58:30 -0000

This will help autotools based packages to recognise
musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnu-config/gnu-config/musl-support.patch       | 25 ++++++++++++++++++++++
 .../gnu-config/gnu-config_20120814.bb              |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/gnu-config/gnu-config/musl-support.patch

diff --git a/meta/recipes-devtools/gnu-config/gnu-config/musl-support.patch b/meta/recipes-devtools/gnu-config/gnu-config/musl-support.patch
new file mode 100644
index 0000000..3147435
--- /dev/null
+++ b/meta/recipes-devtools/gnu-config/gnu-config/musl-support.patch
@@ -0,0 +1,25 @@
+support musl
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gnu-config-20120814/config.sub
+===================================================================
+--- gnu-config-20120814.orig/config.sub	2012-09-18 02:27:45.000000000 -0700
++++ gnu-config-20120814/config.sub	2014-03-26 00:34:19.955996709 -0700
+@@ -123,6 +123,7 @@
+ maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
+ case $maybe_os in
+   nto-qnx* | linux-gnu* | linux-android* | linux-dietlibc | linux-newlib* | \
++  linux-musl* | \
+   linux-uclibc* | uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | \
+   knetbsd*-gnu* | netbsd*-gnu* | \
+   kopensolaris*-gnu* | \
+@@ -1365,6 +1366,7 @@
+ 	      | -cygwin* | -msys* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
+ 	      | -mingw32* | -mingw64* | -linux-gnu* | -linux-android* \
+ 	      | -linux-newlib* | -linux-uclibc* \
++	      | -linux-musl* \
+ 	      | -uxpv* | -beos* | -mpeix* | -udk* \
+ 	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
+ 	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
index 44e1b5d..d67466a 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
@@ -11,6 +11,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-${PV}.tar.bz2 \
 	   file://config-guess-uclibc.patch \
+	   file://musl-support.patch \
            file://gnu-configize.in"
 
 SRC_URI[md5sum] = "bcfca5a2bb39edad4aae5a65efc84094"
-- 
1.9.3


