Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3B89477AA7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:37:34 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p9-v6so3626635pgc.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 14:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jg/AutZmpffiO+gko7G8B22KOnaR5OJU4juVzvxet/c=;
	b=TXL65hY1L96spCz5kSSzOP2RUWR6+A4NKI1F6KmIBkYbqUGkrx+n8jqzGSTMf7ifMg
	Fz811uxM91kITDe6HezSOo3NpT/gVeCzBScYADzEVnbRmE182AbDY1rC5BRfyqjDVKPe
	MAzu+Fx/xMgN7cJU6qk2ELmV/oe5kXNzV2xMXFFnSIqVuNCA9JZQdxiQ3sXk/f9SL4fy
	DxaSMaOzSfLafi6nMo1DrwheAhavHPQmEWQKZts5daQL+xLVqI4bEZmAinfgG7JLV+9z
	+agB2zfv0xkbGzAJAkTdjoM9BLjX1SYSwFEyQ43VST7FxgVTYxL2Dqa8pTBK3DwJCIdn
	L/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jg/AutZmpffiO+gko7G8B22KOnaR5OJU4juVzvxet/c=;
	b=q6ylJqDa8BNWTZABegWI8FeEVqcBcPHFOgqi3j0KxxqBML6G6JhstBTxzH83XYawVN
	M+SgSQVzGFlIu1YoCyDHft3fk0W0uoOuQg6/2iOVeqxKxUirfdSkE4qcTRBTTPY3+TOI
	QAdV7B3NptA30SFNmGsXeirpnrSpM6N7cjHc1xV4YjsBesW4Gp0FP72AZSMoWdM1yDR5
	qvTdYkSks9wRhbYVh17+VnydhWI60xn5vcE8YvBKwd8d1mhDUSH8hEiUHV0li5JopNkp
	goUMrATAwBXL3PA5RSgrKWXJHY/MaZGsz0WO30CkWmXYlaozP3fz/0szGZEBkzK/Vsnk
	wL8w==
X-Gm-Message-State: APt69E31I1p7fXLPzFXe3MQxQR0p7g5G+3S+smGI31Ts4EzXo2o50tad
	WKlZrVgFUG6ze5W6Fzph8DoGLQ==
X-Google-Smtp-Source: ADUXVKIulZ6n1V1aR789psogM9Elt/esTiVMdKRSjFL6Nvb3od8Zl/Wcn/SAx99m1qkkD64ZAupBag==
X-Received: by 2002:a63:7c03:: with SMTP id
	x3-v6mr1698129pgc.412.1528321055878; 
	Wed, 06 Jun 2018 14:37:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c191-v6sm30452374pfg.48.2018.06.06.14.37.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 14:37:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:37:25 -0700
Message-Id: <227283c3a4f6736d716c89879aa74b438861bc1d.1528320772.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528320772.git.raj.khem@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
Subject: [PATCH 09/12] linux-yocto: Fix build with gcc8 for ppc
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
X-List-Received-Date: Wed, 06 Jun 2018 21:37:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-attribute-alias-warnings-from-gcc8.patch | 31 +++++++++++++++++++
 ...isable-array-bounds-warning-with-gcc.patch | 28 +++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.15.bb |  4 +++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/0001-powerpc-Disable-attribute-alias-warnings-from-gcc8.patch
 create mode 100644 meta/recipes-kernel/linux/files/0002-powerpc-ptrace-Disable-array-bounds-warning-with-gcc.patch

diff --git a/meta/recipes-kernel/linux/files/0001-powerpc-Disable-attribute-alias-warnings-from-gcc8.patch b/meta/recipes-kernel/linux/files/0001-powerpc-Disable-attribute-alias-warnings-from-gcc8.patch
new file mode 100644
index 0000000000..735e6e62e0
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-powerpc-Disable-attribute-alias-warnings-from-gcc8.patch
@@ -0,0 +1,31 @@
+From a043b9e85af743103e71afcef943b359154727f8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 May 2018 09:46:42 -0700
+Subject: [PATCH 1/2] powerpc: Disable attribute-alias warnings from gcc8
+
+Fixes
+alias between functions of incompatible types warnings
+which are new with gcc8
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch/powerpc/kernel/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
+index 1b6bc7fba996..7fab5ab9edc2 100644
+--- a/arch/powerpc/kernel/Makefile
++++ b/arch/powerpc/kernel/Makefile
+@@ -3,7 +3,8 @@
+ # Makefile for the linux kernel.
+ #
+ 
+-CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
++CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"' $(call cc-disable-warning, attribute-alias)
++CFLAGS_syscalls.o	+= $(call cc-disable-warning, attribute-alias)
+ 
+ subdir-ccflags-$(CONFIG_PPC_WERROR) := -Werror
+ 
+-- 
+2.17.0
+
diff --git a/meta/recipes-kernel/linux/files/0002-powerpc-ptrace-Disable-array-bounds-warning-with-gcc.patch b/meta/recipes-kernel/linux/files/0002-powerpc-ptrace-Disable-array-bounds-warning-with-gcc.patch
new file mode 100644
index 0000000000..7d6e0f20f6
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0002-powerpc-ptrace-Disable-array-bounds-warning-with-gcc.patch
@@ -0,0 +1,28 @@
+From e2704b41efba4a6b94cd12e8d220f70d7a3b5c70 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 May 2018 09:50:05 -0700
+Subject: [PATCH 2/2] powerpc/ptrace: Disable array-bounds warning with gcc8
+
+This masks the new gcc8 warning
+include/linux/regset.h:270:4: error: 'memcpy' offset [-527, -529] is out of the bounds [0, 16] of object 'vrsave' with type 'union <anonymous>'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch/powerpc/kernel/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
+index 7fab5ab9edc2..601118b43545 100644
+--- a/arch/powerpc/kernel/Makefile
++++ b/arch/powerpc/kernel/Makefile
+@@ -4,6 +4,7 @@
+ #
+ 
+ CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"' $(call cc-disable-warning, attribute-alias)
++CFLAGS_ptrace.o		+= $(call cc-disable-warning, array-bounds)
+ CFLAGS_syscalls.o	+= $(call cc-disable-warning, attribute-alias)
+ 
+ subdir-ccflags-$(CONFIG_PPC_WERROR) := -Werror
+-- 
+2.17.0
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 70bd7118bd..31d96ef434 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -24,6 +24,10 @@ SRCREV_meta ?= "939d935b0c992c6f1e51a7a1c9e4fbe6ef3c3174"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
 
+SRC_URI += "file://0001-powerpc-Disable-attribute-alias-warnings-from-gcc8.patch \
+            file://0002-powerpc-ptrace-Disable-array-bounds-warning-with-gcc.patch \
+"
+
 LINUX_VERSION ?= "4.15.13"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-- 
2.17.1


