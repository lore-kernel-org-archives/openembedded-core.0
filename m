Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2251.1792709341248369225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=qJiJL2Hl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20261022224859d114baa41d0002075a-docqtj@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261022224859d114baa41d0002075a
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 00:48:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KpSKysK7KxeygRV7lXfTZFocbALq7bK+04Mt/kJkb6w=;
 b=qJiJL2Hl+iD9Lt4Gr4A7j+WjeeZ3pXq8DfxaKJqiHQ44sh9SNnDQWSaifuZdMrepMpFowG
 +nGmEhbNkCjz2zco+q4A8QRNNWEf4F1zI4WUxTHtKoXuMWA49matVhs4JXDrHnoNErLmvxJI
 CbutXZ/pjE9NTqRu0RPM2J0n18PXGIKf4qTwwbQ6Df5HgSq1i/rB/3g0En517f5cGHJnefRl
 56HW6U4xQjv2ccSiPOZRNgcvPoRg3v1FOPp7T1UdQWatGsD1b8wig1VeqJmj4SKiDbY5WkV7
 Ks6ufDeT2KyMBTAiFAFHJ5yNzBNT0uxAgTXEF2y0WK8WfmefbAFquxYg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 14/15] glibc: patch CVE-2026-97399
Date: Fri, 23 Oct 2026 00:47:07 +0200
Message-ID: <20261022224711.3783258-14-peter.marko@siemens.com>
In-Reply-To: <20261022224711.3783258-1-peter.marko@siemens.com>
References: <20261022224711.3783258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248469
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 3.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glibc/glibc/0048-CVE-2026-97399.patch     | 128 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0048-CVE-2026-97399.patch

diff --git a/meta/recipes-core/glibc/glibc/0048-CVE-2026-97399.patch b/meta/recipes-core/glibc/glibc/0048-CVE-2026-97399.patch
new file mode 100644
index 00000000000..c5aec0802c9
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0048-CVE-2026-97399.patch
@@ -0,0 +1,128 @@
+From f247c0a2fb5b3e48a771d2d23efc9a45c64e957d Mon Sep 17 00:00:00 2001
+From: Sachin Monga <smonga@linux.ibm.com>
+Date: Thu, 1 Oct 2026 00:51:23 +0530
+Subject: [PATCH] powerpc: Fix one byte overread in strncasecmp (bug 34683,
+ CVE-2026-97399)
+
+The Power8 strncasecmp (strcasecmp.S with USE_AS_STRNCASECMP) touches
+s1[n]/s2[n] in three places when the first n bytes compare equal and
+contain no NUL: L(loop) preloads the next byte before its bdnz;
+L(loop1) increments then loads before its bdnz; and L(bytebybyte) loads
+s1[0]/s2[0] before checking r5. A caller that maps exactly n readable bytes
+can get SIGSEGV if byte n falls on an unmapped page.
+
+The L(bytebybyte) site was identified by Florian Weimer; the
+original AISLE report covered only the two loops.
+
+Fix all three sites: guard L(bytebybyte) with a r5 == 0 check, split the
+bdnz/load pairs in L(loop) and L(loop1) so the load only runs when the
+count is still positive, and preload rCHAR1/rCHAR2 in L(lessthan4) after
+confirming r5 != 0.  strcasecmp is unaffected; its generated code is
+unchanged.
+
+Add string/test-strncasecmp-nonarray.c, built on the test-Xncmp-nonarray.c
+skeleton: maps a PROT_NONE page past both buffers and sweeps all start
+offsets and lengths.  Runs as an xtest.
+
+Reported-by: AISLE in partnership with Red Hat
+Suggested-by: Florian Weimer <fweimer@redhat.com>
+(cherry picked from commit e622f82ea8797704ac8f761f88ed3e429e97fedd)
+
+CVE: CVE-2026-97399
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=f247c0a2fb5b3e48a771d2d23efc9a45c64e957d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ string/Makefile                               |  4 +--
+ string/test-strncasecmp-nonarray.c            |  4 +++
+ sysdeps/powerpc/powerpc64/power8/strcasecmp.S | 25 +++++++++++++++----
+ 3 files changed, 26 insertions(+), 7 deletions(-)
+ create mode 100644 string/test-strncasecmp-nonarray.c
+
+diff --git a/string/Makefile b/string/Makefile
+index c83b195e2e..d7437cd915 100644
+--- a/string/Makefile
++++ b/string/Makefile
+@@ -238,8 +238,8 @@ endif
+ # This test allocates a lot of memory and can run for a long time.
+ xtests += tst-strcoll-overflow
+ 
+-# This test runs for a long time.
+-xtests += test-strncmp-nonarray
++# These tests run for a long time.
++xtests += test-strncasecmp-nonarray test-strncmp-nonarray
+ 
+ # This test needs libdl.
+ ifeq (yes,$(build-shared))
+diff --git a/string/test-strncasecmp-nonarray.c b/string/test-strncasecmp-nonarray.c
+new file mode 100644
+index 0000000000..d68e58d5ec
+--- /dev/null
++++ b/string/test-strncasecmp-nonarray.c
+@@ -0,0 +1,4 @@
++#define TEST_IDENTIFIER strncasecmp
++#define TEST_NAME "strncasecmp"
++typedef char CHAR;
++#include "test-Xncmp-nonarray.c"
+diff --git a/sysdeps/powerpc/powerpc64/power8/strcasecmp.S b/sysdeps/powerpc/powerpc64/power8/strcasecmp.S
+index 7ce53407b8..838b8bf75f 100644
+--- a/sysdeps/powerpc/powerpc64/power8/strcasecmp.S
++++ b/sysdeps/powerpc/powerpc64/power8/strcasecmp.S
+@@ -355,6 +355,14 @@ L(bytebybyte):
+ 	offset and string descriptors are only updated in the end
+ 	of loop unrolling. */
+ 	ld	rLOC, LOCALE_CTYPE_TOLOWER(rLOC)
++#ifdef USE_AS_STRNCASECMP
++	/* This entry point can be reached from the vector loop with
++	   r5 == 0 (the last vector chunk ended exactly at the `n'
++	   boundary).  Do not read s1[0]/s2[0] in that case: those
++	   bytes are s1[n]/s2[n], one past the caller's bound.  */
++	cmpdi	cr7, r5, 0
++	beq	cr7, L(retnull)
++#endif
+ 	lbz	rCHAR1, 0(rSTR1)	/* Load char from s1 */
+ 	lbz	rCHAR2, 0(rSTR2)	/* Load char from s2 */
+ #ifdef USE_AS_STRNCASECMP
+@@ -405,19 +413,23 @@ L(loop):
+ 	cmpw	cr1, rLWR1, rLWR2
+ 	crorc	4*cr1+eq,eq,4*cr1+eq
+ 	beq     cr1, L(done)
++#ifdef USE_AS_STRNCASECMP
++	/* Test the remaining count before touching the next byte. */
++	bdnz	L(loop_load)
++	b	L(lessthan4)
++L(loop_load):
++#endif
+ 	lbz	rCHAR1, 0(rSTR1)	/* Load char from s1 */
+ 	lbz	rCHAR2, 0(rSTR2)	/* Load char from s2 */
+-#ifdef USE_AS_STRNCASECMP
+-	bdnz	L(loop)
+-#else
+ 	b	L(loop)
+-#endif
+ #ifdef USE_AS_STRNCASECMP
+ L(lessthan4):
+ 	clrldi	r5, r5, 62
+ 	cmpdi	cr7, r5, 0
+ 	beq	cr7, L(retnull)
+ 	mtctr	r5
++	lbz	rCHAR1, 0(rSTR1)
++	lbz	rCHAR2, 0(rSTR2)
+ L(loop1):
+ 	cmpdi	rCHAR1, 0
+ 	sldi	rADDR1, rCHAR1, 2
+@@ -427,11 +439,14 @@ L(loop1):
+ 	cmpw	cr1, rLWR1, rLWR2
+ 	crorc	4*cr1+eq,eq,4*cr1+eq
+ 	beq	cr1, L(done)
++	bdnz	L(loop1_load)
++	b	L(retnull)
++L(loop1_load):
+ 	addi	rSTR1, rSTR1, 1
+ 	addi	rSTR2, rSTR2, 1
+ 	lbz	rCHAR1, 0(rSTR1)
+ 	lbz	rCHAR2, 0(rSTR2)
+-	bdnz	L(loop1)
++	b	L(loop1)
+ #endif
+ L(done):
+ 	subf	r0, rLWR2, rLWR1
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 66250fbdb2a..3e377f66875 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -80,6 +80,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0045-CVE-2026-86805-CVE-2026-95818-03.patch \
            file://0046-CVE-2026-86805-CVE-2026-95818-04.patch \
            file://0047-CVE-2026-89092.patch \
+           file://0048-CVE-2026-97399.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
