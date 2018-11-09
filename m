Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D091A6C1DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 09:02:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wA99286E003317
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 01:02:09 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 9 Nov 2018 01:02:08 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 9 Nov 2018 17:12:21 +0800
Message-ID: <c54208078931ad047bd69fc38f27de2e2d367fbf.1541754618.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1541754618.git.hongxu.jia@windriver.com>
References: <cover.1541754618.git.hongxu.jia@windriver.com>
Subject: [PATCH 1/2] rng-tools: 5 -> 6.6
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
X-List-Received-Date: Fri, 09 Nov 2018 09:02:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

- Update SRC_URI, previously upstream is dead, latest update is 2014

- Drop read_error_msg.patch

- Rework do_configure and do_compile

- Enable jitterentropy

License-Update: Upstream changed, but license is still gplv2

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...1-If-the-libc-is-lacking-argp-use-libargp.patch | 10 +--
 ...rgument-to-control-the-libargp-dependency.patch | 21 +++--
 .../rng-tools/rng-tools/read_error_msg.patch       | 98 ----------------------
 .../rng-tools-5-fix-textrels-on-PIC-x86.patch      | 35 +++++---
 .../rng-tools/rng-tools/underquote.patch           | 27 ++++--
 .../rng-tools/{rng-tools_5.bb => rng-tools_6.6.bb} | 25 ++++--
 6 files changed, 78 insertions(+), 138 deletions(-)
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/read_error_msg.patch
 rename meta/recipes-support/rng-tools/{rng-tools_5.bb => rng-tools_6.6.bb} (72%)

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-is-lacking-argp-use-libargp.patch b/meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-is-lacking-argp-use-libargp.patch
index 4bd9d31..06d1d94 100644
--- a/meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-is-lacking-argp-use-libargp.patch
+++ b/meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-is-lacking-argp-use-libargp.patch
@@ -1,7 +1,7 @@
-From 99679fda405e535a282f04a4decc2381154a749f Mon Sep 17 00:00:00 2001
+From 06ba71887f667d45dd231a782a2751f36e8fe025 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Mon, 15 Feb 2016 15:59:58 -0700
-Subject: [PATCH 1/2] If the libc is lacking argp, use libargp
+Subject: [PATCH 1/4] If the libc is lacking argp, use libargp
 
 Patch pulled from Gentoo:
 
@@ -23,10 +23,10 @@ Signed-off-by: Christopher Larson <chris_larson@mentor.com>
  1 file changed, 22 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 27a2dba..04fcd25 100644
+index 4e799dc..c4a5dd8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -82,6 +82,28 @@ AS_IF(
+@@ -135,6 +135,28 @@ AS_IF(
  	]
  )
  
@@ -56,5 +56,5 @@ index 27a2dba..04fcd25 100644
  dnl Configure options
  dnl -----------------
 -- 
-2.2.1
+2.7.4
 
diff --git a/meta/recipes-support/rng-tools/rng-tools/0002-Add-argument-to-control-the-libargp-dependency.patch b/meta/recipes-support/rng-tools/rng-tools/0002-Add-argument-to-control-the-libargp-dependency.patch
index 1c8a79c..be60fe9 100644
--- a/meta/recipes-support/rng-tools/rng-tools/0002-Add-argument-to-control-the-libargp-dependency.patch
+++ b/meta/recipes-support/rng-tools/rng-tools/0002-Add-argument-to-control-the-libargp-dependency.patch
@@ -1,23 +1,26 @@
-From afc8712a9e6c72fbd03c36f84ecf8703e5d22a8c Mon Sep 17 00:00:00 2001
+From 711e2f76890e3c5b08f64859d9fd913ddbec7d50 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
-Date: Mon, 15 Feb 2016 16:11:32 -0700
-Subject: [PATCH 2/2] Add argument to control the libargp dependency
+Date: Mon, 22 Oct 2018 15:26:47 +0800
+Subject: [PATCH 2/4] Add argument to control the libargp dependency
 
 This ensures that the builds are always deterministic. If the argument isn't
 passed, the default behavior is to use libargp if the libc doesn't have argp.
 
 Upstream-Status: Pending
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
+Rebase to 6.6
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  configure.ac | 55 ++++++++++++++++++++++++++++++++++++-------------------
  1 file changed, 36 insertions(+), 19 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 04fcd25..11a5321 100644
+index c4a5dd8..dd1c30f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -32,6 +32,13 @@ AC_ARG_WITH([libgcrypt],
- 	[with_libgcrypt=check]
+@@ -40,6 +40,13 @@ AC_ARG_WITH([nistbeacon],
+ 	[with_nistbeacon=check]
  )
  
 +AC_ARG_WITH([libargp],
@@ -29,8 +32,8 @@ index 04fcd25..11a5321 100644
 +
  dnl Make sure anyone changing configure.ac/Makefile.am has a clue
  AM_MAINTAINER_MODE
- 
-@@ -82,27 +89,37 @@ AS_IF(
+ AM_PROG_AS
+@@ -135,27 +142,37 @@ AS_IF(
  	]
  )
  
@@ -88,5 +91,5 @@ index 04fcd25..11a5321 100644
  dnl -----------------
  dnl Configure options
 -- 
-2.2.1
+2.7.4
 
diff --git a/meta/recipes-support/rng-tools/rng-tools/read_error_msg.patch b/meta/recipes-support/rng-tools/rng-tools/read_error_msg.patch
deleted file mode 100644
index 8aa13bf..0000000
--- a/meta/recipes-support/rng-tools/rng-tools/read_error_msg.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-rng-tools: modify 'read error' message
-
-Make the 'read error' message more descriptive.
-
-Copied from https://bugzilla.redhat.com/attachment.cgi?id=1295857
-and modified in one place to apply successfully.  Error message during
-bootstrap modified to show device name.
-
-Upstream-Status: pending
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
---- a/rngd.c
-+++ b/rngd.c
-@@ -247,8 +247,11 @@ static void do_loop(int random_step)
- 				continue;	/* failed, no work */
- 
- 			retval = iter->xread(buf, sizeof buf, iter);
--			if (retval)
-+			if (retval) {
-+				message(LOG_DAEMON|LOG_ERR,
-+					"Error reading from entropy source\n");
- 				continue;	/* failed, no work */
-+			}
- 
- 			work_done = true;
- 
---- a/rngd_entsource.c
-+++ b/rngd_entsource.c
-@@ -63,10 +63,8 @@ int xread(void *buf, size_t size, struct
- 		size -= r;
- 	}
- 
--	if (size) {
--		message(LOG_DAEMON|LOG_ERR, "read error\n");
-+	if (size)
- 		return -1;
--	}
- 	return 0;
- }
- 
-@@ -152,7 +150,7 @@ error_out:
- }
- 
- /* Initialize entropy source */
--static int discard_initial_data(struct rng *ent_src)
-+static int discard_initial_data(struct rng *ent_src, int *buf)
- {
- 	/* Trash 32 bits of what is probably stale (non-random)
- 	 * initial state from the RNG.  For Intel's, 8 bits would
-@@ -164,10 +162,12 @@ static int discard_initial_data(struct r
- 	xread(tempbuf, sizeof(tempbuf), ent_src);
- 
- 	/* Return 32 bits of bootstrap data */
--	xread(tempbuf, sizeof(tempbuf), ent_src);
-+	if (xread(tempbuf, sizeof(tempbuf), ent_src) != 0)
-+		return -1;
- 
--	return tempbuf[0] | (tempbuf[1] << 8) |
-+	*buf = tempbuf[0] | (tempbuf[1] << 8) |
- 		(tempbuf[2] << 16) | (tempbuf[3] << 24);
-+	return 0;
- }
- 
- /*
-@@ -175,6 +175,8 @@ static int discard_initial_data(struct r
-  */
- int init_entropy_source(struct rng *ent_src)
- {
-+	int bootstrap;
-+
- 	ent_src->rng_fd = open(ent_src->rng_name, O_RDONLY);
- 	if (ent_src->rng_fd == -1) {
- 		return 1;
-@@ -182,7 +184,11 @@ int init_entropy_source(struct rng *ent_
- 	src_list_add(ent_src);
- 	/* Bootstrap FIPS tests */
- 	ent_src->fipsctx = malloc(sizeof(fips_ctx_t));
--	fips_init(ent_src->fipsctx, discard_initial_data(ent_src));
-+	if (discard_initial_data(ent_src, &bootstrap) != 0) {
-+		message(LOG_ERR|LOG_INFO, "Read failure in %s during bootstrap\n",ent_src->rng_name);
-+		return 1;
-+	}
-+	fips_init(ent_src->fipsctx, bootstrap);
- 	return 0;
- }
- 
---- a/rngtest.c
-+++ b/rngtest.c
-@@ -335,6 +335,7 @@ static int discard_initial_data(void)
- 
- 	return tempbuf[0] | (tempbuf[1] << 8) |
- 		(tempbuf[2] << 16) | (tempbuf[3] << 24);
-+
- }
- 
- static void do_rng_fips_test_loop( void )
diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch b/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch
index 93a5864..614adab 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch
+++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch
@@ -1,5 +1,10 @@
-From: Francisco Blas Izquierdo Riera (klondike) <klondike@gentoo.org>
-Subject: [PATCH] Fix assemby textrels on rdrand_asm.S on PIC x86
+From d8b1bb8edd99b2898720b4f10d292a67d532db48 Mon Sep 17 00:00:00 2001
+From: "Francisco Blas Izquierdo Riera (klondike)" <klondike@gentoo.org>
+Date: Mon, 22 Oct 2018 15:29:36 +0800
+Subject: [PATCH 4/4] Fix assemby textrels on rdrand_asm.S on PIC x86
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 This patch updates the fixes in the assembly in rdrand_asm.S in
 sys-apps/rng-tools-5 so it won't generate textrels on PIC systems.
@@ -19,11 +24,14 @@ Reported-by: Manuel Rüger <mrueg@gentoo.org>
 Tested-by: Anthony Basile <blueness@gentoo.org>
 
 Upstream-Status: Pending
+---
+ rdrand_asm.S | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
 
-Index: rng-tools-5/rdrand_asm.S
-===================================================================
---- rng-tools-5.orig/rdrand_asm.S
-+++ rng-tools-5/rdrand_asm.S
+diff --git a/rdrand_asm.S b/rdrand_asm.S
+index b5d260a..7811cf2 100644
+--- a/rdrand_asm.S
++++ b/rdrand_asm.S
 @@ -2,6 +2,7 @@
   * Copyright (c) 2011-2014, Intel Corporation
   * Authors: Fenghua Yu <fenghua.yu@intel.com>,
@@ -32,7 +40,7 @@ Index: rng-tools-5/rdrand_asm.S
   *
   * This program is free software; you can redistribute it and/or modify it
   * under the terms and conditions of the GNU General Public License,
-@@ -174,7 +175,19 @@ ENTRY(x86_rdseed_or_rdrand_bytes)
+@@ -172,7 +173,19 @@ ENTRY(x86_rdseed_or_rdrand_bytes)
  	jmp	4b
  ENDPROC(x86_rdseed_or_rdrand_bytes)
  
@@ -52,7 +60,7 @@ Index: rng-tools-5/rdrand_asm.S
  #define PTR0	%eax
  #define PTR1	%edx
  #define PTR2	%ecx
-@@ -190,6 +203,7 @@ ENTRY(x86_aes_mangle)
+@@ -188,6 +201,7 @@ ENTRY(x86_aes_mangle)
  	movl	8(%ebp), %eax
  	movl	12(%ebp), %edx
  	push	%esi
@@ -60,7 +68,7 @@ Index: rng-tools-5/rdrand_asm.S
  #endif
  	movl	$512, CTR3	/* Number of rounds */
  	
-@@ -280,6 +294,7 @@ offset = offset + 16
+@@ -278,6 +292,7 @@ offset = offset + 16
  	movdqa	%xmm7, (7*16)(PTR1)
  
  #ifdef __i386__
@@ -68,7 +76,7 @@ Index: rng-tools-5/rdrand_asm.S
  	pop	%esi
  	pop	%ebp
  #endif
-@@ -294,6 +309,7 @@ ENTRY(x86_aes_expand_key)
+@@ -292,6 +307,7 @@ ENTRY(x86_aes_expand_key)
  	push	%ebp
  	mov	%esp, %ebp
  	movl	8(%ebp), %eax
@@ -76,7 +84,7 @@ Index: rng-tools-5/rdrand_asm.S
  #endif
  
  	SETPTR(aes_round_keys, PTR1)
-@@ -323,6 +339,7 @@ ENTRY(x86_aes_expand_key)
+@@ -321,6 +337,7 @@ ENTRY(x86_aes_expand_key)
  	call	1f
  
  #ifdef __i386__
@@ -84,7 +92,7 @@ Index: rng-tools-5/rdrand_asm.S
  	pop	%ebp
  #endif
  	ret
-@@ -343,6 +360,16 @@ ENTRY(x86_aes_expand_key)
+@@ -341,6 +358,16 @@ ENTRY(x86_aes_expand_key)
  
  ENDPROC(x86_aes_expand_key)
  
@@ -101,3 +109,6 @@ Index: rng-tools-5/rdrand_asm.S
  	.bss
  	.balign 64
  aes_round_keys:
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/rng-tools/rng-tools/underquote.patch b/meta/recipes-support/rng-tools/rng-tools/underquote.patch
index afd08d5..aa4bbcb 100644
--- a/meta/recipes-support/rng-tools/rng-tools/underquote.patch
+++ b/meta/recipes-support/rng-tools/rng-tools/underquote.patch
@@ -1,4 +1,8 @@
-Fix underquoted m4 entry. This causes a failure if gcrypt isn't present:
+From 03fe7efa1bc04a83fb9b6787998e7baa7ee90646 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Mon, 22 Oct 2018 15:27:41 +0800
+Subject: [PATCH 3/4] Fix underquoted m4 entry. This causes a failure if gcrypt
+ isn't present:
 
 | configure: libgcrypt support disabled
 | ../rng-tools-5/configure: line 4345: ac_fn_c_try_link: command not found
@@ -9,11 +13,17 @@ RP
 
 Upstream-Status: Pending
 
-Index: rng-tools-5/configure.ac
-===================================================================
---- rng-tools-5.orig/configure.ac
-+++ rng-tools-5/configure.ac
-@@ -71,7 +71,7 @@ AS_IF(
+Rebase to 6.6
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index dd1c30f..88d2be3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -124,7 +124,7 @@ AS_IF(
  	[test "x$with_libgcrypt" != "xno"],
  	[
  		AC_CHECK_HEADER([gcrypt.h],
@@ -22,7 +32,7 @@ Index: rng-tools-5/configure.ac
  				[gcrypt],
  				[gcry_check_version], ,
  				[
-@@ -80,7 +80,7 @@ AS_IF(
+@@ -133,7 +133,7 @@ AS_IF(
  						AC_MSG_NOTICE([libgcrypt support disabled])
  					fi
  				]
@@ -31,3 +41,6 @@ Index: rng-tools-5/configure.ac
  			[if test "x$with_libgcrypt" != "xcheck"; then
  				AC_MSG_FAILURE([libgcrypt headers not found]); else
  				AC_MSG_NOTICE([libgcrypt support disabled])
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
similarity index 72%
rename from meta/recipes-support/rng-tools/rng-tools_5.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.6.bb
index 6765667..033af99 100644
--- a/meta/recipes-support/rng-tools/rng-tools_5.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
@@ -1,27 +1,38 @@
 SUMMARY = "Random number generator daemon"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0b6f033afe6db235e559456585dc8cdc"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/gkernel/${BP}.tar.gz \
+SRC_URI = "git://github.com/nhorman/rng-tools.git \
            file://0001-If-the-libc-is-lacking-argp-use-libargp.patch \
            file://0002-Add-argument-to-control-the-libargp-dependency.patch \
            file://underquote.patch \
            file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
-           file://read_error_msg.patch \
            file://init \
            file://default \
            file://rngd.service \
 "
+SRCREV = "4ebc21d6f387bb7b4b3f6badc429e27b21c0a6ee"
+S = "${WORKDIR}/git"
 
-SRC_URI[md5sum] = "6726cdc6fae1f5122463f24ae980dd68"
-SRC_URI[sha256sum] = "60a102b6603bbcce2da341470cad42eeaa9564a16b4490e7867026ca11a3078e"
+inherit autotools update-rc.d systemd pkgconfig
 
-inherit autotools update-rc.d systemd
+DEPENDS = "curl \
+           libxml2 \
+           openssl \
+           sysfsutils \
+           libgcrypt \
+          "
 
-PACKAGECONFIG = "libgcrypt"
+PACKAGECONFIG ??= "libgcrypt libjitterentropy"
 PACKAGECONFIG_libc-musl = "libargp"
 PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
 PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
+PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterntropy,libjitterentropy"
+
+# Refer autogen.sh in rng-tools
+do_configure_prepend() {
+    cp ${S}/README.md ${S}/README
+}
 
 do_install_append() {
     # Only install the init script when 'sysvinit' is in DISTRO_FEATURES.
-- 
2.7.4


