Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id C52566FF30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 16:46:08 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id y89so183739168qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bO60HVEegc62Plj/KawrmihVnoTvjVpT/+bhCQ/8f4E=;
	b=zc7ixJ/X/tctp4yy+HHVr/1b+9Q7gEfFVQ77UC72pHcX1HGu01TFVRa+jWcCAs7OWY
	mHJOP/kXG3PgSxBCqAhAXzg4o1wXD+j+a7V3b89eVVQ9FQFEtp/WW5uf3VpRwQlkMHOb
	H5+wIm7JeH/WOE5RiwRPVCtiWNAN9uNDSijhNb8XOHKR040k7BagkoXhDn5KyyLLdFZN
	vRkQSlJ7Zr376mC9rMZOBaSLeFQSt9PnjltNbZRxuhfKM9rcT3jd0LsJ/8/YnRo+gqU9
	QiaKZRKiv8njZRHbIi/a35pPfGHbTA/t5M2PKmX3BVsIdA/4G5w3pWDguqmFafT8vYyH
	VsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bO60HVEegc62Plj/KawrmihVnoTvjVpT/+bhCQ/8f4E=;
	b=hx8fT5PdSaQscSzTVq5MeVCwH63CFFLufPqFLksMaKOxjhlEtJAVgkhXrpzA+dBDeb
	W8vIOOdOCHsRTNGP1d3eNxHPiXtokLNz7nxXubOCONZzg9jDPjXzKDkYGu0dT0D29i6S
	CnJ49fbeOIPZjbLOywfiC3seUlIKoHqbHiAMfvzZUt1Fjv7e5vxwaZwHqi0K5z+oX13r
	uMhLppmxFw1sf3r8GfVdgJlpEbXsSVGmqvkGp4Mu3f4yZu7yTkJ994O6IV7Alt5MHF1h
	a2V2lvwdBFcKyLhtTCrDTmRhlmVSbzaucUYqfGPvaQV5s/vXtlhgzqE4yKqiKlaHlqVn
	Knfw==
X-Gm-Message-State: AD7BkJJm0VNicVXzgZX/e9BMaBw8IPbSl0lbwG12bLsBlGr2/rJY7RMTIQmLdPhIYsse9A==
X-Received: by 10.140.145.151 with SMTP id 145mr51140926qhr.95.1458665168753; 
	Tue, 22 Mar 2016 09:46:08 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	g184sm15026172qkb.7.2016.03.22.09.46.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Mar 2016 09:46:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 16:46:01 +0000
Message-Id: <1458665161-14132-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] libunwind: Fix build with fstack-protector on musl
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
X-List-Received-Date: Tue, 22 Mar 2016 16:46:09 -0000

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
 .../libunwind-1.1/0001-disable-tests.patch         | 31 +++++++++++++
 .../0001-x86-Stub-out-x86_local_resume.patch       | 54 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind.inc       |  2 +
 meta/recipes-support/libunwind/libunwind_1.1.bb    | 21 +++++----
 4 files changed, 99 insertions(+), 9 deletions(-)
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
index f83614b..848a50a 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -29,4 +29,6 @@ LDFLAGS_append_aarch64 = " -fuse-ld=gold"
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
1.8.3.1


