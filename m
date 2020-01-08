Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id AB0ED7FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 16:43:01 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id k25so1834959pgt.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 08:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9p7EYOpazaSjOy4bai+kYW5HGGanaLS8Bnsgm9aUApI=;
	b=Ad+m0VQhmuacbHhjoTrp2QKGoIEKxOKs2LHEdr8bgx/qTaoUKFU655xcWw7ucwklCX
	ITXpvje5XCXAxsl6JIuKxZFg9kLnt4flO/Zqoe5stPwRaC3MyOA5gdhzSRu4f29GlDdI
	k15PEYUKeCjCZ/KO5vMc+Up32mP2GIdfdsZza2SHU/yvPLI4u0RvQ5XlsN9CcKNpEeiQ
	JKvT9cKgJcH3SVgKgPum5nJ0HQCcJWhxSJDjQ88VXYVJEGJCIuVzU2s4weoTuDzrpEWP
	jONQp4oD3mH3lCeQ1KHp791FjDefx26j/mBEFS9XTxUFiJJkGK6xKmL1En2oKzl+CY+i
	GgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9p7EYOpazaSjOy4bai+kYW5HGGanaLS8Bnsgm9aUApI=;
	b=b7LE3GKSb9tuLpfbBCpmwOa2w3IQp+AWHJGB280C0jTNDZ8dtjYsTEXr/m79HzHlMY
	RpvkDgwQYghcyN+k6UY86IpVW3cc1EZDA3O9DhmD7q8MERnJay3S3FNFZW2HKP0P/ER4
	aBFOx+ShkAeXMYlsBbMnWcR8lcQk4HNkwGiSockzjjZquVDsh8y3FSx4c7ooZE+fThwo
	Tqr5eZzt33Gw89iOFfaOQMhUuZxmYYiDfEBP/30UV2jF+uGhneY20xMwXUbzX1cWfWKp
	YMIC67mxAbdOIpNs7uw+nYhVT2soCw4M+Cuy2VIUYcylFbev8bqj716/JjTuo0LgN9Tj
	aEyA==
X-Gm-Message-State: APjAAAXm9J6ZYt8RoN8z0tWpY6qcuR9lhdXDjHs9uYL5lJVjOreYQVoG
	bmLaI2YUl/mtRYqDt+UBMA3/8QjXJ94=
X-Google-Smtp-Source: APXvYqw3yiCgCs8fX5PaCFqgrrAk4j+RK0sxrtpRyIWlhrwS3+VED4E0w9oXK3pQzkLsUgTZOYSThw==
X-Received: by 2002:a65:4106:: with SMTP id w6mr6219751pgp.347.1578501781886; 
	Wed, 08 Jan 2020 08:43:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9bd6])
	by smtp.gmail.com with ESMTPSA id
	v13sm4535202pgc.54.2020.01.08.08.43.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 08:43:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 08:42:54 -0800
Message-Id: <20200108164254.2694134-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH V2] opensbi: Use -ffreestanding compiler options
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
X-List-Received-Date: Wed, 08 Jan 2020 16:43:01 -0000
Content-Transfer-Encoding: 8bit

This usually helps compiler to not use built-in optimizations
for string functions and mem* functions unnecessarily, since OE's
compiler is hosted for linux cross compile, this also means we instruct
it rightly for building a baremetal application

Refresh the patches to apply without fuzz
Fixes linking errors e.g.

platform/qemu/virt/lib/libplatsbi.a(sbi_string.o): in function `sbi_memset':
| /mnt/b/yoe/build/tmp/work/riscv64-yoe-linux/opensbi/0.5-r0/git/lib/sbi/sbi_string.c:102: undefined reference to `memset'
| collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update Upstream-Status to reflect latest progress

 ...Makefile-Don-t-specify-mabi-or-march.patch |  9 ++----
 .../files/0001-build-Use-ffreestanding.patch  | 28 +++++++++++++++++++
 meta/recipes-bsp/opensbi/opensbi_0.5.bb       |  1 +
 3 files changed, 31 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-bsp/opensbi/files/0001-build-Use-ffreestanding.patch

diff --git a/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch b/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
index 9c2d0eb479..74d93618b2 100644
--- a/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
+++ b/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
@@ -13,11 +13,9 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
  Makefile | 2 --
  1 file changed, 2 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index ae68f55..10851fc 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -145,7 +145,6 @@ GENFLAGS	+=	$(firmware-genflags-y)
+@@ -162,7 +162,6 @@ GENFLAGS	+=	$(firmware-genflags-y)
  CFLAGS		=	-g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
  CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
  CFLAGS		+=	-mno-save-restore -mstrict-align
@@ -25,7 +23,7 @@ index ae68f55..10851fc 100644
  CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
  CFLAGS		+=	$(GENFLAGS)
  CFLAGS		+=	$(platform-cflags-y)
-@@ -158,7 +157,6 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
+@@ -176,7 +175,6 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
  ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
  ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
  ASFLAGS		+=	-mno-save-restore -mstrict-align
@@ -33,6 +31,3 @@ index ae68f55..10851fc 100644
  ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
  ASFLAGS		+=	$(GENFLAGS)
  ASFLAGS		+=	$(platform-asflags-y)
--- 
-2.20.1
-
diff --git a/meta/recipes-bsp/opensbi/files/0001-build-Use-ffreestanding.patch b/meta/recipes-bsp/opensbi/files/0001-build-Use-ffreestanding.patch
new file mode 100644
index 0000000000..4899fad6aa
--- /dev/null
+++ b/meta/recipes-bsp/opensbi/files/0001-build-Use-ffreestanding.patch
@@ -0,0 +1,28 @@
+From efa39afecedf75a1f3154c39507bdde2810bc140 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Jan 2020 18:21:02 -0800
+Subject: [PATCH] build: Use -ffreestanding
+
+this is a stand-alone/baremetal application, therefore demanding
+-ffreestanding would help it compile with hosted toolchains e.g. ( linux
+toolchains ), it also ensures that it won't be using platform
+optimizations like inlining mem* str* functions which gcc might decide
+especially with wrapper string functions in opensbi code
+
+Upstream-Status: Accepted [https://github.com/riscv/opensbi/commit/049ad0b3877352527ab470eba33bc767e9b54961]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/Makefile
++++ b/Makefile
+@@ -159,7 +159,7 @@ GENFLAGS	+=	$(libsbiutils-genflags-y)
+ GENFLAGS	+=	$(platform-genflags-y)
+ GENFLAGS	+=	$(firmware-genflags-y)
+ 
+-CFLAGS		=	-g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
++CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
+ CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
+ CFLAGS		+=	-mno-save-restore -mstrict-align
+ CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.5.bb b/meta/recipes-bsp/opensbi/opensbi_0.5.bb
index 759bbbfdaa..6a9026254c 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.5.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.5.bb
@@ -11,6 +11,7 @@ inherit autotools-brokensep deploy
 SRCREV = "be92da280d87c38a2e0adc5d3f43bab7b5468f09"
 SRC_URI = "git://github.com/riscv/opensbi.git \
            file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
+           file://0001-build-Use-ffreestanding.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.24.1


