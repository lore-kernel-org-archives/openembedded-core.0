Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 201887E08D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Sep 2019 23:23:38 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x127so7983451pfb.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Sep 2019 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4/Q9dDwZdr2/MAVVDxToMfAQ8KOpv+pr7eqF/HQl5O8=;
	b=smMzfQ8bHCIM8NPMmtdvhIrdXHCk/O/HIyJdUKtirFn2sqAU2QnbWgnoNsgZZyKAgS
	ACMEaMv8F960/JzeqpPli8NK4k5KkjODVCU5KKGu/k//SBUfyFAtoX3vHO+apwpV4qrB
	raMh5TAgGWba2etFtJrEtKfPFxUd9Y7jMPXDcTx9Lne3MnqFR+fVrxiPCVRYNxfdYyxy
	dAlr/dutdGOYQ5hdKQOAPGCi8rwNNA7Qby4m30dhch3NZ0hGZKGmAlX5C0DOvxmSaqEy
	wskYi5Q1t02g3uPGT0FE7+FmCb1BJ5Wy4Gp0ay2Vh1a8TTLGQxjzbCQzmYuwxxO05gS8
	dy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4/Q9dDwZdr2/MAVVDxToMfAQ8KOpv+pr7eqF/HQl5O8=;
	b=f2OMQABY+vNyY/qc4UoSMDbDuxqBHTwdoVK3rKz1Z1FFgyEOweHpMZ+ZZSq4sGDCsd
	Q4bX9r9/+2piJV5SrEaWJyRHkzoJFSGdtkGeJqGWwcHYfPky6iKnA8F4lKPr8yeIR79O
	tOF6yOb5y1QM4KNb6BZBCFInU2V4wQVxPsRNpa6QQedp7+IOR+41gkDyZiS8u102umow
	tN1hWCRpeqJM/IXXEZ336VME8KTrrfUeCYmylcTnH343rQtAp+FY6+R8wFhJC0ybfAeo
	0Yu+ubndXUynFu9+67F/2EfzcQWCYGLnrDw/f5ALJklbvcVDqJi3490mFNO9+x5h8c7g
	a3VA==
X-Gm-Message-State: APjAAAUyLKPV0bxQ95RcpEfIx1Omwn7x6ZzAJExWss8jiibQNmKzOI0t
	YaABezBtu44nevRZvkQM7Q3FHnB70X4=
X-Google-Smtp-Source: APXvYqzf3bgsKzDVYjL8ua7Icrm/lOnqx2A2endfNq6xPzEmo77UuKvsDGxYlBdcryF7K0df+voCLw==
X-Received: by 2002:a63:4042:: with SMTP id n63mr18346306pga.75.1567985019481; 
	Sun, 08 Sep 2019 16:23:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	d10sm14414153pfh.8.2019.09.08.16.23.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Sep 2019 16:23:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Sep 2019 16:23:31 -0700
Message-Id: <20190908232331.2295-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] elfutils: Fix build on ppc/musl
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
X-List-Received-Date: Sun, 08 Sep 2019 23:23:39 -0000
Content-Transfer-Encoding: 8bit

musl relies on the pt_regs definitions from kernel ptrace headers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils_0.176.bb                |  1 +
 ...cliude-asm-ptrace.h-for-pt_regs-defi.patch | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
index d98457e3f9..fe810282bc 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://debian/disable_werror.patch \
            file://debian/testsuite-ignore-elflint.diff \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
+           file://0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch \
            file://run-ptest \
            file://ptest.patch \
            "
diff --git a/meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch b/meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch
new file mode 100644
index 0000000000..3303333c45
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch
@@ -0,0 +1,32 @@
+From 2e2232d0935bf8ef6e66ebffba3be68a73b5b3e5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 8 Sep 2019 15:57:59 -0700
+Subject: [PATCH] ppc_initreg.c: Incliude asm/ptrace.h for pt_regs definition
+
+Fixes
+| ../../elfutils-0.176/backends/ppc_initreg.c:79:22: error: field 'r' has incomplete type
+|       struct pt_regs r;
+|                      ^
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ backends/ppc_initreg.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/backends/ppc_initreg.c b/backends/ppc_initreg.c
+index 0e0d359..e5cca7e 100644
+--- a/backends/ppc_initreg.c
++++ b/backends/ppc_initreg.c
+@@ -33,6 +33,7 @@
+ #include <stdlib.h>
+ #if defined(__powerpc__) && defined(__linux__)
+ # include <sys/ptrace.h>
++# include <asm/ptrace.h>
+ # include <sys/user.h>
+ #endif
+ 
+-- 
+2.23.0
+
-- 
2.23.0


