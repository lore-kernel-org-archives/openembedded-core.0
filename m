Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0DA6ED4C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9h3Mm004524
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:43:03 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:42:41 +0800
Message-ID: <2aa6dadd006aadc9569472592783cdb0b4b8373d.1395996041.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395996041.git.hongxu.jia@windriver.com>
References: <cover.1395996041.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/6] kmod: fix O_CLOEXEC not supported on old kernel
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:03 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

O_CLOEXEC is introduced from Linux 2.6.23, so old kernel doesn't have
it, we need check before use.

This patch is much more like a workaround, since it may need fcntl() use
FD_CLOEXEC to replace.

Signed-off-by: Ting Liu <b28495@freescale.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/kmod/kmod.inc                 |  1 +
 meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch | 38 +++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index b7e176c..47445eb 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -25,6 +25,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://run-ptest \
            file://ptest.patch \
            file://avoid_parallel_tests.patch \
+           file://fix-O_CLOEXEC.patch \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch b/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch
new file mode 100644
index 0000000..8161d61
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch
@@ -0,0 +1,38 @@
+From bd43367eee868059770188fd9e9db38520dc6fff Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 22 Jan 2014 01:06:40 -0500
+Subject: [PATCH] libkmod/libkmod-internal.h: check whether O_CLOEXEC is
+ defined or not
+
+O_CLOEXEC is introduced from Linux 2.6.23, so old kernel doesn't have
+it, we need check before use.
+
+This patch is much more like a workaround, since it may need fcntl() use
+FD_CLOEXEC to replace.
+
+This problem was reported by "Ting Liu <b28495@freescale.com>"
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Pending
+---
+ libkmod/libkmod-internal.h |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libkmod/libkmod-internal.h b/libkmod/libkmod-internal.h
+index 0180124..100b40f 100644
+--- a/libkmod/libkmod-internal.h
++++ b/libkmod/libkmod-internal.h
+@@ -9,6 +9,10 @@
+ #include "macro.h"
+ #include "libkmod.h"
+ 
++#ifndef O_CLOEXEC
++#define O_CLOEXEC 0
++#endif
++
+ static _always_inline_ _printf_format_(2, 3) void
+ 	kmod_log_null(struct kmod_ctx *ctx, const char *format, ...) {}
+ 
+-- 
+1.7.10.4
+
-- 
1.8.1.2


