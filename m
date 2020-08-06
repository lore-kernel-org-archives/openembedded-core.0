Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.14725.1596743991668747155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 12:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GstIR+d4;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id x69so46189656qkb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2020 12:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7mY6vQ4kUtM1NvgBrGDKppZJzD529GUsXI//4QOg/C4=;
        b=GstIR+d4gXLuMwNqu0XOXf+WNx/friKTap3hkAAHpjpL4lbH5faBM4zoZIVpBoUSdh
         SNayRXE0r7kdGT1M7GAymk13TrQyrseNKB8U58N8HFaXOCV+h6IVgaPAAabzSWiIEuq7
         3uC49jRRZj8+BhwbyhH7GJV/QWzjpVFsTHUvTxIxvDvQa4Ibpe9529cVZMGaaWT+Z3Bq
         JeEVutf0QWON7osmSiWI1w6hLUzvDDft7W3bIrrX37izUQ8JXOhDNAHac35Bi1HqzwDZ
         mnSZJrQfk7WpRHCY2w8t3mBJpjcCqUTw8jxxr4wmx2tqS2WnEeWHbi+oxFEcvWqEnAIB
         ZCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7mY6vQ4kUtM1NvgBrGDKppZJzD529GUsXI//4QOg/C4=;
        b=J3MONoAhj1iFV+TabiFqAkDGzVAqNT2hNoPPzVWH2xzw3GBCJCjti0ZuzUAxo3TZVn
         E6Y/VkAYoRtzpeqDFrt8FDnr7VQNS6QKuNrMdPmaLHFCS2EEcIZiqyLDLez3AMNuEEsD
         Q4rCgNfU4ruVqvRZ1hwhOkJaJMreSBK+t3dV6qcjARVQMFtLltJNNbBPnIru8BbS5adu
         d4S5qfEO4Ajs7e748tuB0MPA2LN/LGVQ7aB1qN279CFdw8Wus5h8xhIBOCGE+mHJYFnF
         mqkKk4Tj26jlrjkuYaVrW+7e8TP7kX91d4yWL8tm6YdX296j3tFwIwnxskp0pfsnEhMO
         /qUQ==
X-Gm-Message-State: AOAM531Uqqj5B84O+8wREN16vI/li9/9HTWvHFyFgHRCxqI872kqcGko
	+R9h43eeztBDsEGzXULjdp8=
X-Google-Smtp-Source: ABdhPJxkOKZaSigarS19/m0ME7MZTffMwveiDDaEhcQS/H81qjF4uO4ue4pjCdHCJpS9I9HrQmp2Mg==
X-Received: by 2002:a37:97c5:: with SMTP id z188mr10049699qkd.185.1596743990639;
        Thu, 06 Aug 2020 12:59:50 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 65sm4549434qkn.103.2020.08.06.12.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 12:59:49 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] strace: fix build against v5.8 uapi headers
Date: Thu,  6 Aug 2020 15:59:48 -0400
Message-Id: <20200806195948.30040-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 5.8 kernel introduced changes to io uring that require adjustments
in strace for it to build against the new headers. See kernel commits
v5.8-rc1~190^2~22 and v5.8-rc1~190^2~21 for details.

There are two patches in the upstream strace that deal with the new
flags, so we port them to the v5.7 release until a new one is
available upstream.

We also have a third patch that is oe specific, which is the addition
of a newly generated flags file and removal of some static checks.
We need this change to build, since released versions of strace don't
run the bootstrap step and hence won't generate the flags or fixup
any static checks.

Tested against the v5.4 and v5.8 kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Note: also tested against both the 5.8 and 5.4 libc-headers.

Bruce

 ...-io_uring-Add-io_cqring_offset-flags.patch | 154 ++++++++++++++++++
 ...struct-io_cqring_offsets-compile-tim.patch |  46 ++++++
 ...g-fix-build-against-5.8-libc-headers.patch |  98 +++++++++++
 meta/recipes-devtools/strace/strace_5.7.bb    |   3 +
 4 files changed, 301 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-io_uring-Add-io_cqring_offset-flags.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-io_uring-Remove-struct-io_cqring_offsets-compile-tim.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-uring-fix-build-against-5.8-libc-headers.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-io_uring-Add-io_cqring_offset-flags.patch b/meta/recipes-devtools/strace/strace/0001-io_uring-Add-io_cqring_offset-flags.patch
new file mode 100644
index 0000000000..dceeff7c7e
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-io_uring-Add-io_cqring_offset-flags.patch
@@ -0,0 +1,154 @@
+From 592b915033de37322e19f3e6413de33317d272fe Mon Sep 17 00:00:00 2001
+From: Chris Packham <chris.packham@alliedtelesis.co.nz>
+Date: Mon, 15 Jun 2020 22:01:26 +1200
+Subject: [PATCH] io_uring: Add io_cqring_offset flags
+
+Add support for displaying struct io_cqring_offsets.flags introduced
+by Linux kernel commits v5.8-rc1~190^2~22 and v5.8-rc1~190^2~21.
+
+* types/io_uring.h (struct_io_cqring_offsets): Replace resv array
+with flags, resv1, and resv2 fields.
+* xlat/uring_cqring_flags.in: New file.
+* configure.ac (AC_CHECK_MEMBERS): Check struct io_cqring_offsets.flags.
+* io_uring.c: Include "xlat/uring_cqring_flags.h".
+(SYS_FUNC(io_uring_setup)): Replace printing of the resv array
+of struct io_cqring_offsets with flags, resv1, and resv2 fields.
+* tests/io_uring_setup.c: Check it.
+
+Upstream-status: backport of commit 592b915033de37322e19f3e6413de33317d272fe
+
+Co-authored-by: Dmitry V. Levin <ldv@altlinux.org>
+Resolves: https://github.com/strace/strace/issues/138
+---
+ configure.ac               |  1 +
+ io_uring.c                 | 11 +++++++----
+ tests/io_uring_setup.c     | 31 ++++++++++++++++++++++++++-----
+ types/io_uring.h           |  4 +++-
+ xlat/uring_cqring_flags.in |  1 +
+ 5 files changed, 38 insertions(+), 10 deletions(-)
+ create mode 100644 xlat/uring_cqring_flags.in
+
+diff --git a/configure.ac b/configure.ac
+index d0fd51ff..91c2249e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -481,6 +481,7 @@ AC_CHECK_HEADERS([linux/bpf.h], [
+ 
+ AC_CHECK_HEADERS([linux/io_uring.h], [
+ 	AC_CHECK_MEMBERS(m4_normalize([
++		struct io_cqring_offsets.flags,
+ 		struct io_uring_params.features,
+ 		struct io_uring_params.wq_fd,
+ 		struct io_uring_params.resv
+diff --git a/io_uring.c b/io_uring.c
+index cfeea82b..2ffe163e 100644
+--- a/io_uring.c
++++ b/io_uring.c
+@@ -17,6 +17,7 @@
+ #include "xlat/uring_setup_flags.h"
+ #include "xlat/uring_enter_flags.h"
+ #include "xlat/uring_register_opcodes.h"
++#include "xlat/uring_cqring_flags.h"
+ 
+ #ifdef HAVE_STRUCT_IO_URING_PARAMS
+ # ifdef HAVE_STRUCT_IO_URING_PARAMS_RESV
+@@ -88,10 +89,12 @@ SYS_FUNC(io_uring_setup)
+ 		PRINT_FIELD_U(", ", params.cq_off, ring_entries);
+ 		PRINT_FIELD_U(", ", params.cq_off, overflow);
+ 		PRINT_FIELD_U(", ", params.cq_off, cqes);
+-		if (!IS_ARRAY_ZERO(params.cq_off.resv)) {
+-			PRINT_FIELD_ARRAY(", ", params.cq_off, resv, tcp,
+-					  print_xint64_array_member);
+-		}
++		PRINT_FIELD_FLAGS(", ", params.cq_off, flags,
++				  uring_cqring_flags, "IORING_CQ_???");
++		if (params.cq_off.resv1)
++			PRINT_FIELD_X(", ", params.cq_off, resv1);
++		if (params.cq_off.resv2)
++			PRINT_FIELD_X(", ", params.cq_off, resv2);
+ 		tprints("}");
+ 	}
+ 	tprints("}");
+diff --git a/tests/io_uring_setup.c b/tests/io_uring_setup.c
+index 317b0d7a..a59e4a1a 100644
+--- a/tests/io_uring_setup.c
++++ b/tests/io_uring_setup.c
+@@ -27,6 +27,7 @@
+ # include "xlat.h"
+ 
+ # include "xlat/uring_setup_features.h"
++# include "xlat/uring_cqring_flags.h"
+ 
+ # ifdef HAVE_STRUCT_IO_URING_PARAMS_FEATURES
+ #  ifdef HAVE_STRUCT_IO_URING_PARAMS_WQ_FD
+@@ -144,20 +145,40 @@ main(void)
+ 						params->sq_off.resv2);
+ 
+ 			printf("}, cq_off={head=%u, tail=%u, ring_mask=%u"
+-			       ", ring_entries=%u, overflow=%u, cqes=%u",
++			       ", ring_entries=%u, overflow=%u, cqes=%u, flags=",
+ 			       params->cq_off.head,
+ 			       params->cq_off.tail,
+ 			       params->cq_off.ring_mask,
+ 			       params->cq_off.ring_entries,
+ 			       params->cq_off.overflow,
+ 			       params->cq_off.cqes);
+-			if (params->cq_off.resv[0] || params->cq_off.resv[1]) {
+-				printf(", resv=[%#llx, %#llx]",
++#ifdef HAVE_STRUCT_IO_CQRING_OFFSETS_FLAGS
++			printflags(uring_cqring_flags,
++			       params->cq_off.flags,
++			       "IORING_CQ_???");
++			if (params->cq_off.resv1)
++				printf(", resv1=%#x", params->cq_off.resv1);
++			if (params->cq_off.resv2)
++				printf(", resv2=%#llx",
+ 				       (unsigned long long)
+-						params->cq_off.resv[0],
++						params->cq_off.resv2);
++#else
++			union {
++				struct {
++					uint32_t flags;
++					uint32_t resv1;
++				} s;
++				uint64_t v;
++			} u = { .v = params->cq_off.resv[0] };
++			printflags(uring_cqring_flags, u.s.flags,
++				   "IORING_CQ_???");
++			if (u.s.resv1)
++				printf(", resv1=%#x", u.s.resv1);
++			if (params->cq_off.resv[1])
++				printf(", resv2=%#llx",
+ 				       (unsigned long long)
+ 						params->cq_off.resv[1]);
+-			}
++#endif
+ 
+ 			printf("}}) = %ld<anon_inode:[io_uring]>\n", rc);
+ 		}
+diff --git a/types/io_uring.h b/types/io_uring.h
+index 76f432c3..2fe1c13a 100644
+--- a/types/io_uring.h
++++ b/types/io_uring.h
+@@ -31,7 +31,9 @@ typedef struct {
+ 	uint32_t ring_entries;
+ 	uint32_t overflow;
+ 	uint32_t cqes;
+-	uint64_t resv[2];
++	/** Added by v5.8-rc1~190^2~22 */	uint32_t flags;
++	/** Added by v5.8-rc1~190^2~22 */	uint32_t resv1;
++	/** Added by v5.8-rc1~190^2~22 */	uint64_t resv2;
+ } struct_io_cqring_offsets;
+ 
+ typedef struct {
+diff --git a/xlat/uring_cqring_flags.in b/xlat/uring_cqring_flags.in
+new file mode 100644
+index 00000000..c81fbc20
+--- /dev/null
++++ b/xlat/uring_cqring_flags.in
+@@ -0,0 +1 @@
++IORING_CQ_EVENTFD_DISABLED	1U
+-- 
+2.19.1
+
diff --git a/meta/recipes-devtools/strace/strace/0001-io_uring-Remove-struct-io_cqring_offsets-compile-tim.patch b/meta/recipes-devtools/strace/strace/0001-io_uring-Remove-struct-io_cqring_offsets-compile-tim.patch
new file mode 100644
index 0000000000..774b520a06
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-io_uring-Remove-struct-io_cqring_offsets-compile-tim.patch
@@ -0,0 +1,46 @@
+From fded17c15bca4150165f899cc47f67bab963d9a7 Mon Sep 17 00:00:00 2001
+From: Chris Packham <chris.packham@alliedtelesis.co.nz>
+Date: Mon, 15 Jun 2020 22:01:25 +1200
+Subject: [PATCH] io_uring: Remove struct io_cqring_offsets compile time
+ asserts
+
+The generated types/check-io_uring.c already checks the kernel's struct
+io_cqring_offsets for compatibility with the strace definition so
+there's no need for manual checks.
+
+Upstream-status: backport of commit fded17c15bca4150165f899cc47f67bab963d9a7
+
+* io_uring.c [HAVE_STRUCT_IO_CQRING_OFFSETS]: Remove static_asserts.
+---
+ io_uring.c | 15 ---------------
+ 1 file changed, 15 deletions(-)
+
+diff --git a/io_uring.c b/io_uring.c
+index cd183457..cfeea82b 100644
+--- a/io_uring.c
++++ b/io_uring.c
+@@ -18,21 +18,6 @@
+ #include "xlat/uring_enter_flags.h"
+ #include "xlat/uring_register_opcodes.h"
+ 
+-#ifdef HAVE_STRUCT_IO_CQRING_OFFSETS
+-# ifdef HAVE_STRUCT_IO_CQRING_OFFSETS_RESV
+-static_assert(offsetof(struct_io_cqring_offsets, resv)
+-             >= offsetof(struct io_cqring_offsets, resv),
+-             "struct io_cqring_offsets.resv offset mismatch"
+-             ", please update the decoder");
+-static_assert(sizeof_field(struct_io_cqring_offsets, resv)
+-             <= sizeof_field(struct io_cqring_offsets, resv),
+-             "struct io_cqring_offsets.resv size mismatch"
+-             ", please update the decoder");
+-# else /* !HAVE_STRUCT_IO_CQRING_OFFSETS_RESV */
+-static_assert(0, "struct io_cqring_offsets.resv is missing"
+-		 ", please update the decoder");
+-# endif
+-#endif /* HAVE_STRUCT_IO_CQRING_OFFSETS */
+ #ifdef HAVE_STRUCT_IO_URING_PARAMS
+ # ifdef HAVE_STRUCT_IO_URING_PARAMS_RESV
+ static_assert(offsetof(struct_io_uring_params, resv)
+-- 
+2.19.1
+
diff --git a/meta/recipes-devtools/strace/strace/0001-uring-fix-build-against-5.8-libc-headers.patch b/meta/recipes-devtools/strace/strace/0001-uring-fix-build-against-5.8-libc-headers.patch
new file mode 100644
index 0000000000..cfce3eca51
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-uring-fix-build-against-5.8-libc-headers.patch
@@ -0,0 +1,98 @@
+From 8dda6b8ddbe18b6bb83cf1fa6bc71ebdc82e1b72 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Mon, 3 Aug 2020 23:00:39 -0400
+Subject: [PATCH] uring: fix build against 5.8 libc-headers
+
+To get strace building against v5.8 headers before the next
+version of strace is released, we need to copy in a bootstrapped
+file from the latest git (xlat/uring_cqring_flags.h) and remove
+remove unnecessary asserts for v5.8+ (in a similar manner to the
+main strace repository).
+
+Upstream-status: inappropriate. oe specific (upstream builds bootstrap)
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ types/check-io_uring.c    | 10 --------
+ xlat/uring_cqring_flags.h | 48 +++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 48 insertions(+), 10 deletions(-)
+ create mode 100644 xlat/uring_cqring_flags.h
+
+diff --git a/types/check-io_uring.c b/types/check-io_uring.c
+index dc21569..d5bd4b1 100644
+--- a/types/check-io_uring.c
++++ b/types/check-io_uring.c
+@@ -13,16 +13,6 @@ static_assert(sizeof(struct io_sqring_offsets) <= offsetof(struct_io_sqring_offs
+ # endif /* HAVE_STRUCT_IO_SQRING_OFFSETS_RESV2 */
+ #endif /* HAVE_STRUCT_IO_SQRING_OFFSETS */
+ 
+-#ifdef HAVE_STRUCT_IO_CQRING_OFFSETS
+-# ifdef HAVE_STRUCT_IO_CQRING_OFFSETS_RESV
+-static_assert(sizeof(struct io_cqring_offsets) == sizeof(struct_io_cqring_offsets),
+-      "struct io_cqring_offsets size mismatch, please update the decoder or fix the kernel");
+-# else
+-static_assert(sizeof(struct io_cqring_offsets) <= offsetof(struct_io_cqring_offsets, resv),
+-"struct io_cqring_offsets size mismatch, please update the decoder or fix the kernel");
+-# endif /* HAVE_STRUCT_IO_CQRING_OFFSETS_RESV */
+-#endif /* HAVE_STRUCT_IO_CQRING_OFFSETS */
+-
+ #ifdef HAVE_STRUCT_IO_URING_PARAMS
+ # ifdef HAVE_STRUCT_IO_URING_PARAMS_CQ_OFF
+ static_assert(sizeof(struct io_uring_params) == sizeof(struct_io_uring_params),
+diff --git a/xlat/uring_cqring_flags.h b/xlat/uring_cqring_flags.h
+new file mode 100644
+index 0000000..0352749
+--- /dev/null
++++ b/xlat/uring_cqring_flags.h
+@@ -0,0 +1,48 @@
++/* Generated by ./xlat/gen.sh from ./xlat/uring_cqring_flags.in; do not edit. */
++
++#include "gcc_compat.h"
++#include "static_assert.h"
++
++#if defined(IORING_CQ_EVENTFD_DISABLED) || (defined(HAVE_DECL_IORING_CQ_EVENTFD_DISABLED) && HAVE_DECL_IORING_CQ_EVENTFD_DISABLED)
++DIAG_PUSH_IGNORE_TAUTOLOGICAL_COMPARE
++static_assert((IORING_CQ_EVENTFD_DISABLED) == (1U), "IORING_CQ_EVENTFD_DISABLED != 1U");
++DIAG_POP_IGNORE_TAUTOLOGICAL_COMPARE
++#else
++# define IORING_CQ_EVENTFD_DISABLED 1U
++#endif
++
++#ifndef XLAT_MACROS_ONLY
++
++# ifdef IN_MPERS
++
++#  error static const struct xlat uring_cqring_flags in mpers mode
++
++# else
++
++static const struct xlat_data uring_cqring_flags_xdata[] = {
++ XLAT(IORING_CQ_EVENTFD_DISABLED),
++ #define XLAT_VAL_0 ((unsigned) (IORING_CQ_EVENTFD_DISABLED))
++ #define XLAT_STR_0 STRINGIFY(IORING_CQ_EVENTFD_DISABLED)
++};
++static
++const struct xlat uring_cqring_flags[1] = { {
++ .data = uring_cqring_flags_xdata,
++ .size = ARRAY_SIZE(uring_cqring_flags_xdata),
++ .type = XT_NORMAL,
++ .flags_mask = 0
++#  ifdef XLAT_VAL_0
++  | XLAT_VAL_0
++#  endif
++  ,
++ .flags_strsz = 0
++#  ifdef XLAT_STR_0
++  + sizeof(XLAT_STR_0)
++#  endif
++  ,
++} };
++
++#  undef XLAT_STR_0
++#  undef XLAT_VAL_0
++# endif /* !IN_MPERS */
++
++#endif /* !XLAT_MACROS_ONLY */
+-- 
+2.19.1
+
diff --git a/meta/recipes-devtools/strace/strace_5.7.bb b/meta/recipes-devtools/strace/strace_5.7.bb
index c184d035aa..bc6aea54d3 100644
--- a/meta/recipes-devtools/strace/strace_5.7.bb
+++ b/meta/recipes-devtools/strace/strace_5.7.bb
@@ -14,6 +14,9 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://ptest-spacesave.patch \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
+           file://0001-io_uring-Remove-struct-io_cqring_offsets-compile-tim.patch \
+           file://0001-io_uring-Add-io_cqring_offset-flags.patch \
+           file://0001-uring-fix-build-against-5.8-libc-headers.patch \
            "
 SRC_URI[sha256sum] = "b284b59f9bcd95b9728cea5bd5c0edc5ebe360af73dc76fbf6334f11c777ccd8"
 
-- 
2.19.1

