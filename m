Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7E3DF73D3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 02:00:39 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so71226615pab.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 19:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Nk805gTFdol9/LRhPUh3g6KJlGaVEbRoAHa5v3kndaU=;
	b=AiNalPEbFzGL4VL34w32ksayq/NTWgz5oggma/2F7Z0au7AuLQKgfLtiMy0N402ae4
	omBsyRkCq/QsXzLxhOyl0srrCUGmZFLaDZc5gRodFcEWCFPUVv6ABV/Fx0uoWpJMohUN
	ALflDmolBCRsYDqM1St/Y1rZTskqNlBHd25KuYTZL36ptMS+kqySivw/FUrdGL5awTVF
	UJxFO3gTZWo2t+d6Fp0ijiuUXP624yXOwQedqreytpqCXsMEhL0icMlII6Rm7TTbwaP5
	kpHh4uv2VBKu/NMfcQgw7K+QBmRuJ5mWFUCsrGE5KJpKiFC97NOlHRBcl3AQtmfp7qUe
	pxBg==
X-Received: by 10.70.103.74 with SMTP id fu10mr51055822pdb.2.1429149640790;
	Wed, 15 Apr 2015 19:00:40 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by mx.google.com with ESMTPSA id
	nt15sm5371563pdb.14.2015.04.15.19.00.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Apr 2015 19:00:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2015 19:00:23 -0700
Message-Id: <20976fc37662bea36f1f3298e782ce6f7efd8efa.1429149397.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
References: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429149397.git.raj.khem@gmail.com>
References: <cover.1429149397.git.raj.khem@gmail.com>
Subject: [PATCH 06/10] parted: Add patches to fix build on musl
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
X-List-Received-Date: Thu, 16 Apr 2015 02:00:41 -0000

Theese patches are actually generic but expose issues
when compiling on musl

Change-Id: Ib5312af280d2c399334c5645fbea215737933ae5
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Include-fcntl.h-in-platform_defs.h.patch  | 29 +++++++++++++++++++
 ...need_charset_alias-when-building-for-musl.patch | 33 ++++++++++++++++++++++
 meta/recipes-extended/parted/parted_3.2.bb         |  2 ++
 3 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-extended/parted/files/0001-Include-fcntl.h-in-platform_defs.h.patch
 create mode 100644 meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-when-building-for-musl.patch

diff --git a/meta/recipes-extended/parted/files/0001-Include-fcntl.h-in-platform_defs.h.patch b/meta/recipes-extended/parted/files/0001-Include-fcntl.h-in-platform_defs.h.patch
new file mode 100644
index 0000000..b0376ce
--- /dev/null
+++ b/meta/recipes-extended/parted/files/0001-Include-fcntl.h-in-platform_defs.h.patch
@@ -0,0 +1,29 @@
+From d78dd087c4ec4715aab5fe115668e726046ecd76 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 18:16:05 -0700
+Subject: [PATCH] Include fcntl.h in /platform_defs.h
+
+exposed when compiling using musl
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libparted/fs/xfs/platform_defs.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libparted/fs/xfs/platform_defs.h b/libparted/fs/xfs/platform_defs.h
+index 2b55752..32bd3d3 100644
+--- a/libparted/fs/xfs/platform_defs.h
++++ b/libparted/fs/xfs/platform_defs.h
+@@ -42,6 +42,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
++#include <fcntl.h>
+ #include <sys/param.h>
+ #include <sys/types.h>
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..abdfa2a
--- /dev/null
+++ b/meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,33 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gnulib.mk b/lib/gnulib.mk
+index e1d74db..c0e92dd 100644
+--- a/lib/gnulib.mk
++++ b/lib/gnulib.mk
+@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index e225769..5d34749 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -11,6 +11,8 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://syscalls.patch \
            file://fix-doc-mandir.patch \
            file://fix-compile-failure-while-dis.patch \
+           file://0001-Include-fcntl.h-in-platform_defs.h.patch \
+           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://run-ptest \
            file://Makefile \
 "
-- 
2.1.4


