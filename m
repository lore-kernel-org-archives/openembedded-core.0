Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6B065C5C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 17:06:14 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id u110so183451911qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 10:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pKpWcPPNNdUJpJ3099zs+JuU5KR/sNOdswkzNzvNu7I=;
	b=Mu3OgkEJVxBfI5rb702HuzwFMHefm8jdpbDuj4KiOKy2yO1O/7uxmHIhH6Ai2MTWAd
	RH5PuMEqdSVQZh31HUm4eGUdy5K5HiKIZEjYYfl8UEIllUnguHVT31MiXkEEa7uABoDP
	YKowcmMTW6GR7IpY3vMvTRS3Q3dncRM8j95QbVWT/vUZVIsWmrEgSTdYioSOFPlxDFSS
	ZrFagYJ/4v0+Dm4hcj1RnI0N+8UnaSH1vIcXpXfOskdK1EqZ4GO/CgbdPEqs9MzKMReI
	t+i3tAwco4WhWR+Mmhace3wWEj9lBoBXl3CEVOsiNF8517CenUK6Dk4UH/wVcXr4Kz5M
	YQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pKpWcPPNNdUJpJ3099zs+JuU5KR/sNOdswkzNzvNu7I=;
	b=Az+Z0SNxy27cBXsQPivO3gv9gWWJ2lZquciI7gJz7uClgFA/CFG1bmpMLqAedk5jiA
	kOjP8wSRLgr930SWqV7fYN3YX/TPvC1YesiO7HtR7l6yuEROR5L+CFvGhW6JGYswCYKu
	/r1ER9Ox6cw49u+qYPkF25elAkOSsy6+qDHLVrJ/kdsyHIKsEcWirtVeh63QJoznWJRu
	mjEIQOXBaERyUC3dUWPDUJClC2eqIjMuTAqQKbEG0D0mUl0uH7pejai3g8HEbL8XdZ8J
	svS0t58zN3ObruVpuW7QymUMeSw1RCHuz+QTotkaYyihm+nN5RTTKGPL7O3HXVhZH10A
	Zt5w==
X-Gm-Message-State: AD7BkJLU38daY8hjGVQcC9qt5Ea9Jb0+OsR6PIgmh6tuUGS8PONFvXdlP6nnDubrHdAuYA==
X-Received: by 10.140.144.132 with SMTP id 126mr51185346qhq.102.1458666375108; 
	Tue, 22 Mar 2016 10:06:15 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	h64sm14986059qgh.39.2016.03.22.10.06.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Mar 2016 10:06:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 17:06:07 +0000
Message-Id: <1458666367-28283-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH V2] libunwind: Fix build with fstack-protector on musl
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
X-List-Received-Date: Tue, 22 Mar 2016 17:06:15 -0000

libunwind makery inserts -nostdlib during linking
which fails the build on musl when security flags are enabled
since it remove ssp from linking, so add them explicitly
to SECURITY_LDFLAGS

disable tests for musl targets, tests use obsolete
posix APIs e.g. getcontext

patchout x86_local_resume() on x86, gets a working
linunwind on x86, it seems that it wont work even
in glibc case but lets leave it as it is for glibc
and apply the patch only for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Change from v1 -> v2:
- Move SRC_URI to bb, helps with devtool workflow

 .../libunwind-1.1/0001-disable-tests.patch         | 31 +++++++++++++
 .../0001-x86-Stub-out-x86_local_resume.patch       | 54 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind.inc       |  4 +-
 meta/recipes-support/libunwind/libunwind_1.1.bb    | 21 +++++----
 4 files changed, 99 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-disable-tests.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-x86-Stub-out-x86_local_resume.patch

diff --git a/meta/recipes-support/libunwind/libunwind-1.1/0001-disable-tests.patch b/meta/recipes-support/libunwind/libunwind-1.1/0001-disable-tests.patch
new file mode 100644
index 0000000..7309ffd
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind-1.1/0001-disable-tests.patch
@@ -0,0 +1,31 @@
+From b07435a90bd636ee718e2238fb46c74a6dd5e069 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Mar 2016 16:41:13 +0000
+Subject: [PATCH] disable tests
+
+Tests use getcontext() API which is
+not there on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Inappropriate [MUSL-only]
+
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e24fe1e..15380e4 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -39,7 +39,7 @@ endif
+ 
+ nodist_include_HEADERS = include/libunwind-common.h
+ 
+-SUBDIRS = src tests doc
++SUBDIRS = src doc
+ 
+ noinst_HEADERS = include/dwarf.h include/dwarf_i.h include/dwarf-eh.h	\
+ 	include/compiler.h include/libunwind_i.h include/mempool.h	\
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/libunwind/libunwind-1.1/0001-x86-Stub-out-x86_local_resume.patch b/meta/recipes-support/libunwind/libunwind-1.1/0001-x86-Stub-out-x86_local_resume.patch
new file mode 100644
index 0000000..371013a
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind-1.1/0001-x86-Stub-out-x86_local_resume.patch
@@ -0,0 +1,54 @@
+From f5df01655a4b76d4fe415747de581d94ac593e6a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Mar 2016 16:19:29 +0000
+Subject: [PATCH] x86: Stub out x86_local_resume()
+
+its purpose seems
+to be unwinding across signal handler boundaries, which cannot happen
+in correct programs anyway. Replacing the whole function with
+something like *(volatile char *)0=0; (i.e. crash), gets a working
+libunwind
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/x86/Gos-linux.c | 22 +---------------------
+ 1 file changed, 1 insertion(+), 21 deletions(-)
+
+diff --git a/src/x86/Gos-linux.c b/src/x86/Gos-linux.c
+index 31f83ba..3aaa34e 100644
+--- a/src/x86/Gos-linux.c
++++ b/src/x86/Gos-linux.c
+@@ -281,27 +281,7 @@ x86_r_uc_addr (ucontext_t *uc, int reg)
+ HIDDEN int
+ x86_local_resume (unw_addr_space_t as, unw_cursor_t *cursor, void *arg)
+ {
+-  struct cursor *c = (struct cursor *) cursor;
+-  ucontext_t *uc = c->uc;
+-
+-  /* Ensure c->pi is up-to-date.  On x86, it's relatively common to be
+-     missing DWARF unwind info.  We don't want to fail in that case,
+-     because the frame-chain still would let us do a backtrace at
+-     least.  */
+-  dwarf_make_proc_info (&c->dwarf);
+-
+-  if (unlikely (c->sigcontext_format != X86_SCF_NONE))
+-    {
+-      struct sigcontext *sc = (struct sigcontext *) c->sigcontext_addr;
+-
+-      Debug (8, "resuming at ip=%x via sigreturn(%p)\n", c->dwarf.ip, sc);
+-      sigreturn (sc);
+-    }
+-  else
+-    {
+-      Debug (8, "resuming at ip=%x via setcontext()\n", c->dwarf.ip);
+-      setcontext (uc);
+-    }
++  *(volatile char *)0=0;
+   return -UNW_EINVAL;
+ }
+ #endif
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index f83614b..1c342d3 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -5,8 +5,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
 DEPENDS += "libatomic-ops"
 
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
-
 inherit autotools
 
 PACKAGECONFIG ??= ""
@@ -29,4 +27,6 @@ LDFLAGS_append_aarch64 = " -fuse-ld=gold"
 LDFLAGS_append_powerpc = " -fuse-ld=gold -mbss-plt"
 LDFLAGS_append_powerpc64 = " -fuse-ld=gold -mbss-plt"
 
+SECURITY_LDFLAGS_append_libc-musl = " -lssp_nonshared -lssp"
+
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
index 7df9f5e..1ed525f 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -1,15 +1,18 @@
 require libunwind.inc
 
-SRC_URI += "\
-    file://Support-building-with-older-compilers.patch \
-    file://AArch64-port.patch \
-    file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch \
-    file://Link-libunwind-to-libgcc_s-rather-than-libgcc.patch \
-    file://0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch \
-    file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
-    file://0001-backtrace-Use-only-with-glibc-and-uclibc.patch \
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+           file://Support-building-with-older-compilers.patch \
+           file://AArch64-port.patch \
+           file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch \
+           file://Link-libunwind-to-libgcc_s-rather-than-libgcc.patch \
+           file://0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch \
+           file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
+           file://0001-backtrace-Use-only-with-glibc-and-uclibc.patch \
+"
+SRC_URI_append_libc-musl = "\
+           file://0001-x86-Stub-out-x86_local_resume.patch \
+           file://0001-disable-tests.patch \
 "
-
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
 SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
 
-- 
1.9.1


