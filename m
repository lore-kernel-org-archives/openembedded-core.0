Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id E9BCD6012C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 17:56:52 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id x64so22861629qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 10:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bc5uZRWUHe3w/f48SA4HtfoowGQWhAIX/fYnFSutlxs=;
	b=X1pJtij3sbaoxoJ71utPFwHi9HveyevqVqlaTFDa73+hx9OB+NzvgCPUGr/jRl9L0U
	WsHfOtWIVR3YA834aYJH/3GN0aiZC1SUfMFtCEWColQZvpQyBCjcBsqUY0xZciGSW90M
	aD+fL+oxWumNl+TjFIcgJeXKNYu4cmsIxchVFinOs4rPfvhQ27VHG6vnOqokjYe0VAuR
	6n/nRrSA5TkZ+DozX5dgDrA80O8sS7PcfSY5qXwZPMasKzaRQDwdd1F/lEayGSC6FMxs
	3bLPycoszX+m632jIp52B7qgux3EzmAaSksIEad4hdfmaxGB7zaTI8KrpVpDVheylcDN
	3T3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bc5uZRWUHe3w/f48SA4HtfoowGQWhAIX/fYnFSutlxs=;
	b=UcDALHn3zIh0MzFPHKzinUmbyjYkW5zn4hH4E4/7fDx41Tct414IuANIAiwwB9+++d
	OCxhGSnchIYaoL5dOv0ZjOHd7xU/dFgYksEc7ysuxU3scY75d49KGL71iQ4yutaknodU
	oEe9Y+bPG5DLdu5PTQtl/5Fv2qWtzgAE9S+rSSJogev4vrhXHiu/2HprKHbMWTRTg8gl
	TyatsJ3T89Ju7OAo34ksKslZ5K47AODeoB7mkYAWxq4R400K/NGqHWaMgCxiJnODqb/L
	RdbDLAzyixUmCOH01uGtR/FVCLspCcFQ8FklmnqtX9pv/RpJA++DP7GuCzuoh/N6PoWL
	Ybkw==
X-Gm-Message-State: AD7BkJI7mnZ2Pqfb3NTQZBpr95FQbn0R4gXJiyu/rdE3MEuSQwaWBbwq+IbmV7hr05ln9g==
X-Received: by 10.55.215.208 with SMTP id t77mr11595344qkt.23.1459360612994;
	Wed, 30 Mar 2016 10:56:52 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	u202sm2253144qka.43.2016.03.30.10.56.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Mar 2016 10:56:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 17:56:47 +0000
Message-Id: <1459360607-25880-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH V2] psmisc: Remove including sys/user.h and __WORDSIZE
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
X-List-Received-Date: Wed, 30 Mar 2016 17:56:55 -0000

We can replace __WORDSIZE with UINTPTR_MAX
sys/user.h is in conflict with asm/ptrace.h on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Change from v1 to v2:
- Fix build regression on arches which do require user_regs_struct from glibc

 ...001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch | 51 ++++++++++++++++++++++
 meta/recipes-extended/psmisc/psmisc_22.21.bb       |  8 ++--
 2 files changed, 56 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch

diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
new file mode 100644
index 0000000..b57a006
--- /dev/null
+++ b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
@@ -0,0 +1,51 @@
+From 5dc872bb2fba6421cb8e1ee578f7bd4aaed55f61 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 24 Mar 2016 15:46:14 +0000
+Subject: [PATCH] Use UINTPTR_MAX instead of __WORDSIZE
+
+Do not include sys/user.h since it conflicts with
+pt_regs struct from kernel APIs in asm/ptrace.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/peekfd.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/src/peekfd.c b/src/peekfd.c
+index cba2130..0d39878 100644
+--- a/src/peekfd.c
++++ b/src/peekfd.c
+@@ -30,8 +30,11 @@
+ #include <asm/ptrace.h>
+ #include <byteswap.h>
+ #include <endian.h>
++#ifdef __GLIBC__
+ #include <sys/user.h>
++#endif
+ #include <stdlib.h>
++#include <stdint.h>
+ #include <getopt.h>
+ #include <ctype.h>
+ 
+@@ -228,11 +231,11 @@ int main(int argc, char **argv)
+ 		if (WIFSTOPPED(status)) {
+ #ifdef PPC
+ 			struct pt_regs regs;
+-			regs.gpr[0] = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_R0, 0);
+-			regs.gpr[3] = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_R3, 0);
+-			regs.gpr[4] = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_R4, 0);
+-			regs.gpr[5] = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_R5, 0);
+-			regs.orig_gpr3 = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_ORIG_R3, 0);
++			regs.gpr[0] = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_R0, 0);
++			regs.gpr[3] = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_R3, 0);
++			regs.gpr[4] = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_R4, 0);
++			regs.gpr[5] = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_R5, 0);
++			regs.orig_gpr3 = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_ORIG_R3, 0);
+ #elif defined(ARM)
+ 			struct pt_regs regs;
+ 			ptrace(PTRACE_GETREGS, pid, 0, &regs);
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/psmisc/psmisc_22.21.bb b/meta/recipes-extended/psmisc/psmisc_22.21.bb
index 66aba9e..1c6473e 100644
--- a/meta/recipes-extended/psmisc/psmisc_22.21.bb
+++ b/meta/recipes-extended/psmisc/psmisc_22.21.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI[md5sum] = "935c0fd6eb208288262b385fa656f1bf"
 SRC_URI[sha256sum] = "97323cad619210845b696d7d722c383852b2acb5c49b5b0852c4f29c77a8145a"
 
-SRC_URI += "file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
-            file://0002-Include-limits.h-for-PATH_MAX.patch \
-            "
+SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz \
+           file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
+           file://0002-Include-limits.h-for-PATH_MAX.patch \
+           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
+           "
-- 
1.9.1


