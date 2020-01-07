Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 820227FDE8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 03:13:27 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id p9so22615260plk.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 19:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZyhJnB6POkY8lvZLMl7wNI4JwH25H3WGs9BXtkYmUiw=;
	b=QmbswIwpr6vNxPI53EWPbzFwp8o1NaUF3ZCNt9u0QKx09tHg1MWuI2NpYQgEtxEOh0
	qjy6zCBTJr/SA47v2YWx4YZajI+uaLaXIYiLpYfo0Pt8IFWE1GiN6S+kUwW0Zz/jTuF/
	zemZoR/u6zK2ixnRwJ/8OWWQII1LdgITtNAhWSpQC7CbUVwa19gBx2o8xuIxJ2BkdGnK
	4NYWSXOmCJqzHJ6at7mtbSXWvf41QkWI0mwmR93Qm1NX0KsHmqHeEuzgC3WUjqc2uGzo
	3Cmx6nFFv0DV4LYcGEBRJCbfX7z4aAq2El4+FtmGm+Z0MfONitMnGb0ddQ+9JiNt6VPn
	tHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZyhJnB6POkY8lvZLMl7wNI4JwH25H3WGs9BXtkYmUiw=;
	b=fUq7TEz9XAaTw8U2bLqnkVEaZS925+M2hqOxkG0vHZmURzCA/8xEK6JCimqaV429l3
	gnjmkbID70O48x1QUCcjk1q8T5JfsYtFU8y6e79ptzzSTty+tWraZBEKJ7AffkrJ3D/T
	DC+h4CYzlT6g/hK2HdMd9dsCLbBi2sqs2BJnxUSdVkw81Woy2e/gqQrW6T3oVN3oqGJe
	4MklKBuge6tN4P8d4iHPXTtUwkTZxtKTQD1UrdudJFFK7ZUYTPFKD+BpRIThaWSmeni6
	3VEJWn0syMeuUVbp8NGI1f/dwobRhlYFb0N1GCTpWlVYqj4SSugrV+3t9qm2IXwlK0f3
	vdYQ==
X-Gm-Message-State: APjAAAXHkKZ3phs7jrA/m80Eh/fsA36QHi7D2DdzK7/uSsXeUp31nP+U
	k7aA7QSmxJIBQxFszZyhmbfMn8qs1Sc=
X-Google-Smtp-Source: APXvYqzSCkQ9fVMUWqVMkMJoRmzIJjark0F5a67lkMdUx6nAl7vrehVdhviGkHSmAvil64NXtHUiXQ==
X-Received: by 2002:a17:902:744b:: with SMTP id
	e11mr54433296plt.247.1578366808140; 
	Mon, 06 Jan 2020 19:13:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9bd6])
	by smtp.gmail.com with ESMTPSA id
	e19sm26048839pjr.10.2020.01.06.19.13.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 19:13:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 19:13:23 -0800
Message-Id: <20200107031323.2068045-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107031323.2068045-1-raj.khem@gmail.com>
References: <20200107031323.2068045-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH] opensbi: Use -ffreestanding compiler options
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
X-List-Received-Date: Tue, 07 Jan 2020 03:13:27 -0000
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
index 0000000000..8169cbfd22
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
+Upstream-Status: Submitted [https://lists.infradead.org/pipermail/opensbi/2020-January/000887.html]
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


