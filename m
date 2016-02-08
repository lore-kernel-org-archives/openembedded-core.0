Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 746CA7327E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 19:35:50 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id y7so172978paa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 11:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/rcrgunk5fWzQpIbTTxI0nviVOXtlJ2m0hgTqZYdjhc=;
	b=YTh+hhuYsfaCKhSp6atwd/U0Oiq+7t7ZILHHETNsKg7ZtagQLC4c7/isctwAqPNdT6
	ylIB+vhkn77k8+XmVxmRtxKxl454UPT6dJ+aFGr+ZBEhyPdjuwohF+wYTOzYj8lyB2bS
	iPDw6YIC5Fprv96Uby/9YcqU5Kmqwvl936it+fYv3D+3PNjMmMhpgaKELB5UAP2YGKZK
	oAMABNroMc/mhWfwUFG6ixNNuaQbrofbda4a59QdHdm35cmo5wIkETgYBaVBQ7xWyyZq
	exhqEEkjdHVm/c57w7URuGFbHJn3KZTuMyQAwiQgeWTDeFN8O36Cs+/cqkRIkRNh9owa
	iARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/rcrgunk5fWzQpIbTTxI0nviVOXtlJ2m0hgTqZYdjhc=;
	b=lfF53owKV+BF0nyAvdfZ8s5ni3610t0ZPF04h0FVcLfzs2HtdUF8ruhBqYSF+oFvKJ
	xo0JyHiHt05Kj96bUnEI/RnUF7Kvb2P58meNy9MkqfWYgfUhR9UhICvAIrTPTtuOd4zi
	QH1JtZX4fwMo7CZBfFgUApDy30Rm6GtvFiNeCV3HJO+dlUV/c3gxQJBBDyGrpBOrtp4v
	hP/UGAmYorJpDJqQ2btKVGoF0xqi+HJt6OjA0v0AXMFwLohoWwjetSb+i7WNm1vS1dwg
	vHxr+h3YzCettui17q1clrXOssBTEOl6ncNVFQuZtK4dgEMnre9+TtS5yvRwYRrSudPk
	+Wwg==
X-Gm-Message-State: AG10YOTJ8zoNSnZAygi/hmqf3zkG5LCrpto3eDAO+AAKghlvoYE3KZMaxODtrCu81oRG/w==
X-Received: by 10.66.232.202 with SMTP id tq10mr44718102pac.14.1454960151510; 
	Mon, 08 Feb 2016 11:35:51 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	70sm32085872pfs.78.2016.02.08.11.35.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 11:35:49 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 11:35:40 -0800
Message-Id: <1454960141-18350-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454960141-18350-1-git-send-email-armccurdy@gmail.com>
References: <1454960141-18350-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2] gdb: build fix for MIPS + musl libc
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
X-List-Received-Date: Mon, 08 Feb 2016 19:35:51 -0000

The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
but not by musl. Regardless of the libc, the kernel headers provide
<asm/sgidefs.h> which provides the same definitions, so use that
instead.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gdb/gdb.inc                  |  1 +
 .../gdb/gdb/0001-use-asm-sgidefs.h.patch           | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 4ea14c1..1dd6551 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -6,6 +6,7 @@ SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
             file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch \
             file://0001-Use-exported-definitions-of-SIGRTMIN.patch \
             file://0001-include-sys-types.h-for-mode_t.patch \
+            file://0001-use-asm-sgidefs.h.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000..eaec390
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch
@@ -0,0 +1,35 @@
+From 677b5b56135141c0d259e370aacd0e11c810aa15 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Fri, 5 Feb 2016 14:00:00 -0800
+Subject: [PATCH] use <asm/sgidefs.h>
+
+Build fix for MIPS with musl libc
+
+The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
+but not by musl. Regardless of the libc, the kernel headers provide
+<asm/sgidefs.h> which provides the same definitions, so use that
+instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ gdb/mips-linux-nat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
+index a36bb63..fd5c705 100644
+--- a/gdb/mips-linux-nat.c
++++ b/gdb/mips-linux-nat.c
+@@ -31,7 +31,7 @@
+ #include "gdb_proc_service.h"
+ #include "gregset.h"
+ 
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ #include <sys/ptrace.h>
+ #include <asm/ptrace.h>
+ 
+-- 
+1.9.1
+
-- 
1.9.1


