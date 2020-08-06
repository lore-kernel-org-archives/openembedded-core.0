Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.14908.1596744154987869455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 13:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qFwZb4fY;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id m19so11123012ejd.8
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2020 13:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zjTaTc0wD/fhXrizIzppyae/BCBHt+QJEGLfu6rJkbs=;
        b=qFwZb4fYS691UK5gus/ED9HrmqgOjTM6z0a/oZqkfjRbxbOOk/gMx0KtcqAtbLUCob
         pHgcY2YJ/jnQYKx6FV47ZVEozcK3lPVfOx4lyYcn49j3qCzqv9PouyyyGYblf6sJtXOE
         iQwtV0/3wHTZNE9rwe5GhCk9I5U9V1/B19Te2pszyeDvhgaKPkYde0YPMsYhEHSvUOCV
         w5JIY0RQxL8dPcXXNAGMLjdUrjDDz8QE05+iR0Z0E/3IM0oFcy7vNCBGyLJ4AT/wsbNl
         AgbkcM+gZLfParmK554FcH5LbtY6bT5Zzim6ads4OK9LAPMXZhG4Mg+4A9+KQpsz6093
         6YUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zjTaTc0wD/fhXrizIzppyae/BCBHt+QJEGLfu6rJkbs=;
        b=U0V/nuSDJSFKArc3w2zCE/2dPMXubcPqf/lTE9HkAMGS8xzyTZUba81i7pw27Xf/ua
         9oCbxBr9sk0OXNn+05AviTxi0Xtw9e96oxWs7Jm1ThA6JLCR7yt/yNDLhW2BjH7/e5UJ
         3LC1LdyNcappyyy4RE6oA8DMJd3acQXqIgpCkRLrcr0ALA5brK7TF8DqL9HQ+o8UIY43
         sKq37bH3Pg8pkbVXibeCbQt6bEvCzHueI8xvistVyH+QPC9xQCVnhpLm7oj6vZ4JQSEE
         1sEcmYdFDnRgMvURn9JGViQFrb1jkHwtYljC3kf7zX1GI3PTFq1KQgvspw9FE4qBe+3f
         BnpQ==
X-Gm-Message-State: AOAM5316grsWkHNDT+lXq4HZENRwQZqcVkLgycMwU8UABXRaZDlJsjPl
	Ct3NLd1O2FIQY6ptq+NYCj7RrKB+3dr0Gr8CGR0=
X-Google-Smtp-Source: ABdhPJx4YVQWcTut3ia4XiqJ5XS02mcSVaVhRgZZZAcI4XU1LSf145XIT18oBDznSSjbaaVXq3SgEiibGwEFxj1mXMk=
X-Received: by 2002:a17:907:2662:: with SMTP id ci2mr5979635ejc.334.1596744153507;
 Thu, 06 Aug 2020 13:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200806195948.30040-1-bruce.ashfield@gmail.com>
In-Reply-To: <20200806195948.30040-1-bruce.ashfield@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 6 Aug 2020 16:02:22 -0400
Message-ID: <CADkTA4PiDSqJcFDxPkc2S=fmSYYj6=EgG4aJSB5dPdUgEcgKnQ@mail.gmail.com>
Subject: Re: [PATCH] strace: fix build against v5.8 uapi headers
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000112cd905ac3af8ba"

--000000000000112cd905ac3af8ba
Content-Type: text/plain; charset="UTF-8"

Actually, disregard this patch for now.

Less than 24 hours ago, strace 5.8 released. I'll test it against the 5.8
headers and update to that instead if it works.

Bruce

On Thu, Aug 6, 2020 at 3:59 PM <bruce.ashfield@gmail.com> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> The 5.8 kernel introduced changes to io uring that require adjustments
> in strace for it to build against the new headers. See kernel commits
> v5.8-rc1~190^2~22 and v5.8-rc1~190^2~21 for details.
>
> There are two patches in the upstream strace that deal with the new
> flags, so we port them to the v5.7 release until a new one is
> available upstream.
>
> We also have a third patch that is oe specific, which is the addition
> of a newly generated flags file and removal of some static checks.
> We need this change to build, since released versions of strace don't
> run the bootstrap step and hence won't generate the flags or fixup
> any static checks.
>
> Tested against the v5.4 and v5.8 kernels.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>
> Note: also tested against both the 5.8 and 5.4 libc-headers.
>
> Bruce
>
>  ...-io_uring-Add-io_cqring_offset-flags.patch | 154 ++++++++++++++++++
>  ...struct-io_cqring_offsets-compile-tim.patch |  46 ++++++
>  ...g-fix-build-against-5.8-libc-headers.patch |  98 +++++++++++
>  meta/recipes-devtools/strace/strace_5.7.bb    |   3 +
>  4 files changed, 301 insertions(+)
>  create mode 100644
> meta/recipes-devtools/strace/strace/0001-io_uring-Add-io_cqring_offset-flags.patch
>  create mode 100644
> meta/recipes-devtools/strace/strace/0001-io_uring-Remove-struct-io_cqring_offsets-compile-tim.patch
>  create mode 100644
> meta/recipes-devtools/strace/strace/0001-uring-fix-build-against-5.8-libc-headers.patch
>
> diff --git
> a/meta/recipes-devtools/strace/strace/0001-io_uring-Add-io_cqring_offset-flags.patch
> b/meta/recipes-devtools/strace/strace/0001-io_uring-Add-io_cqring_offset-flags.patch
> new file mode 100644
> index 0000000000..dceeff7c7e
> --- /dev/null
> +++
> b/meta/recipes-devtools/strace/strace/0001-io_uring-Add-io_cqring_offset-flags.patch
> @@ -0,0 +1,154 @@
> +From 592b915033de37322e19f3e6413de33317d272fe Mon Sep 17 00:00:00 2001
> +From: Chris Packham <chris.packham@alliedtelesis.co.nz>
> +Date: Mon, 15 Jun 2020 22:01:26 +1200
> +Subject: [PATCH] io_uring: Add io_cqring_offset flags
> +
> +Add support for displaying struct io_cqring_offsets.flags introduced
> +by Linux kernel commits v5.8-rc1~190^2~22 and v5.8-rc1~190^2~21.
> +
> +* types/io_uring.h (struct_io_cqring_offsets): Replace resv array
> +with flags, resv1, and resv2 fields.
> +* xlat/uring_cqring_flags.in: New file.
> +* configure.ac (AC_CHECK_MEMBERS): Check struct io_cqring_offsets.flags.
> +* io_uring.c: Include "xlat/uring_cqring_flags.h".
> +(SYS_FUNC(io_uring_setup)): Replace printing of the resv array
> +of struct io_cqring_offsets with flags, resv1, and resv2 fields.
> +* tests/io_uring_setup.c: Check it.
> +
> +Upstream-status: backport of commit
> 592b915033de37322e19f3e6413de33317d272fe
> +
> +Co-authored-by: Dmitry V. Levin <ldv@altlinux.org>
> +Resolves: https://github.com/strace/strace/issues/138
> +---
> + configure.ac               |  1 +
> + io_uring.c                 | 11 +++++++----
> + tests/io_uring_setup.c     | 31 ++++++++++++++++++++++++++-----
> + types/io_uring.h           |  4 +++-
> + xlat/uring_cqring_flags.in |  1 +
> + 5 files changed, 38 insertions(+), 10 deletions(-)
> + create mode 100644 xlat/uring_cqring_flags.in
> +
> +diff --git a/configure.ac b/configure.ac
> +index d0fd51ff..91c2249e 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -481,6 +481,7 @@ AC_CHECK_HEADERS([linux/bpf.h], [
> +
> + AC_CHECK_HEADERS([linux/io_uring.h], [
> +       AC_CHECK_MEMBERS(m4_normalize([
> ++              struct io_cqring_offsets.flags,
> +               struct io_uring_params.features,
> +               struct io_uring_params.wq_fd,
> +               struct io_uring_params.resv
> +diff --git a/io_uring.c b/io_uring.c
> +index cfeea82b..2ffe163e 100644
> +--- a/io_uring.c
> ++++ b/io_uring.c
> +@@ -17,6 +17,7 @@
> + #include "xlat/uring_setup_flags.h"
> + #include "xlat/uring_enter_flags.h"
> + #include "xlat/uring_register_opcodes.h"
> ++#include "xlat/uring_cqring_flags.h"
> +
> + #ifdef HAVE_STRUCT_IO_URING_PARAMS
> + # ifdef HAVE_STRUCT_IO_URING_PARAMS_RESV
> +@@ -88,10 +89,12 @@ SYS_FUNC(io_uring_setup)
> +               PRINT_FIELD_U(", ", params.cq_off, ring_entries);
> +               PRINT_FIELD_U(", ", params.cq_off, overflow);
> +               PRINT_FIELD_U(", ", params.cq_off, cqes);
> +-              if (!IS_ARRAY_ZERO(params.cq_off.resv)) {
> +-                      PRINT_FIELD_ARRAY(", ", params.cq_off, resv, tcp,
> +-                                        print_xint64_array_member);
> +-              }
> ++              PRINT_FIELD_FLAGS(", ", params.cq_off, flags,
> ++                                uring_cqring_flags, "IORING_CQ_???");
> ++              if (params.cq_off.resv1)
> ++                      PRINT_FIELD_X(", ", params.cq_off, resv1);
> ++              if (params.cq_off.resv2)
> ++                      PRINT_FIELD_X(", ", params.cq_off, resv2);
> +               tprints("}");
> +       }
> +       tprints("}");
> +diff --git a/tests/io_uring_setup.c b/tests/io_uring_setup.c
> +index 317b0d7a..a59e4a1a 100644
> +--- a/tests/io_uring_setup.c
> ++++ b/tests/io_uring_setup.c
> +@@ -27,6 +27,7 @@
> + # include "xlat.h"
> +
> + # include "xlat/uring_setup_features.h"
> ++# include "xlat/uring_cqring_flags.h"
> +
> + # ifdef HAVE_STRUCT_IO_URING_PARAMS_FEATURES
> + #  ifdef HAVE_STRUCT_IO_URING_PARAMS_WQ_FD
> +@@ -144,20 +145,40 @@ main(void)
> +                                               params->sq_off.resv2);
> +
> +                       printf("}, cq_off={head=%u, tail=%u, ring_mask=%u"
> +-                             ", ring_entries=%u, overflow=%u, cqes=%u",
> ++                             ", ring_entries=%u, overflow=%u, cqes=%u,
> flags=",
> +                              params->cq_off.head,
> +                              params->cq_off.tail,
> +                              params->cq_off.ring_mask,
> +                              params->cq_off.ring_entries,
> +                              params->cq_off.overflow,
> +                              params->cq_off.cqes);
> +-                      if (params->cq_off.resv[0] ||
> params->cq_off.resv[1]) {
> +-                              printf(", resv=[%#llx, %#llx]",
> ++#ifdef HAVE_STRUCT_IO_CQRING_OFFSETS_FLAGS
> ++                      printflags(uring_cqring_flags,
> ++                             params->cq_off.flags,
> ++                             "IORING_CQ_???");
> ++                      if (params->cq_off.resv1)
> ++                              printf(", resv1=%#x",
> params->cq_off.resv1);
> ++                      if (params->cq_off.resv2)
> ++                              printf(", resv2=%#llx",
> +                                      (unsigned long long)
> +-                                              params->cq_off.resv[0],
> ++                                              params->cq_off.resv2);
> ++#else
> ++                      union {
> ++                              struct {
> ++                                      uint32_t flags;
> ++                                      uint32_t resv1;
> ++                              } s;
> ++                              uint64_t v;
> ++                      } u = { .v = params->cq_off.resv[0] };
> ++                      printflags(uring_cqring_flags, u.s.flags,
> ++                                 "IORING_CQ_???");
> ++                      if (u.s.resv1)
> ++                              printf(", resv1=%#x", u.s.resv1);
> ++                      if (params->cq_off.resv[1])
> ++                              printf(", resv2=%#llx",
> +                                      (unsigned long long)
> +                                               params->cq_off.resv[1]);
> +-                      }
> ++#endif
> +
> +                       printf("}}) = %ld<anon_inode:[io_uring]>\n", rc);
> +               }
> +diff --git a/types/io_uring.h b/types/io_uring.h
> +index 76f432c3..2fe1c13a 100644
> +--- a/types/io_uring.h
> ++++ b/types/io_uring.h
> +@@ -31,7 +31,9 @@ typedef struct {
> +       uint32_t ring_entries;
> +       uint32_t overflow;
> +       uint32_t cqes;
> +-      uint64_t resv[2];
> ++      /** Added by v5.8-rc1~190^2~22 */       uint32_t flags;
> ++      /** Added by v5.8-rc1~190^2~22 */       uint32_t resv1;
> ++      /** Added by v5.8-rc1~190^2~22 */       uint64_t resv2;
> + } struct_io_cqring_offsets;
> +
> + typedef struct {
> +diff --git a/xlat/uring_cqring_flags.in b/xlat/uring_cqring_flags.in
> +new file mode 100644
> +index 00000000..c81fbc20
> +--- /dev/null
> ++++ b/xlat/uring_cqring_flags.in
> +@@ -0,0 +1 @@
> ++IORING_CQ_EVENTFD_DISABLED    1U
> +--
> +2.19.1
> +
> diff --git
> a/meta/recipes-devtools/strace/strace/0001-io_uring-Remove-struct-io_cqring_offsets-compile-tim.patch
> b/meta/recipes-devtools/strace/strace/0001-io_uring-Remove-struct-io_cqring_offsets-compile-tim.patch
> new file mode 100644
> index 0000000000..774b520a06
> --- /dev/null
> +++
> b/meta/recipes-devtools/strace/strace/0001-io_uring-Remove-struct-io_cqring_offsets-compile-tim.patch
> @@ -0,0 +1,46 @@
> +From fded17c15bca4150165f899cc47f67bab963d9a7 Mon Sep 17 00:00:00 2001
> +From: Chris Packham <chris.packham@alliedtelesis.co.nz>
> +Date: Mon, 15 Jun 2020 22:01:25 +1200
> +Subject: [PATCH] io_uring: Remove struct io_cqring_offsets compile time
> + asserts
> +
> +The generated types/check-io_uring.c already checks the kernel's struct
> +io_cqring_offsets for compatibility with the strace definition so
> +there's no need for manual checks.
> +
> +Upstream-status: backport of commit
> fded17c15bca4150165f899cc47f67bab963d9a7
> +
> +* io_uring.c [HAVE_STRUCT_IO_CQRING_OFFSETS]: Remove static_asserts.
> +---
> + io_uring.c | 15 ---------------
> + 1 file changed, 15 deletions(-)
> +
> +diff --git a/io_uring.c b/io_uring.c
> +index cd183457..cfeea82b 100644
> +--- a/io_uring.c
> ++++ b/io_uring.c
> +@@ -18,21 +18,6 @@
> + #include "xlat/uring_enter_flags.h"
> + #include "xlat/uring_register_opcodes.h"
> +
> +-#ifdef HAVE_STRUCT_IO_CQRING_OFFSETS
> +-# ifdef HAVE_STRUCT_IO_CQRING_OFFSETS_RESV
> +-static_assert(offsetof(struct_io_cqring_offsets, resv)
> +-             >= offsetof(struct io_cqring_offsets, resv),
> +-             "struct io_cqring_offsets.resv offset mismatch"
> +-             ", please update the decoder");
> +-static_assert(sizeof_field(struct_io_cqring_offsets, resv)
> +-             <= sizeof_field(struct io_cqring_offsets, resv),
> +-             "struct io_cqring_offsets.resv size mismatch"
> +-             ", please update the decoder");
> +-# else /* !HAVE_STRUCT_IO_CQRING_OFFSETS_RESV */
> +-static_assert(0, "struct io_cqring_offsets.resv is missing"
> +-               ", please update the decoder");
> +-# endif
> +-#endif /* HAVE_STRUCT_IO_CQRING_OFFSETS */
> + #ifdef HAVE_STRUCT_IO_URING_PARAMS
> + # ifdef HAVE_STRUCT_IO_URING_PARAMS_RESV
> + static_assert(offsetof(struct_io_uring_params, resv)
> +--
> +2.19.1
> +
> diff --git
> a/meta/recipes-devtools/strace/strace/0001-uring-fix-build-against-5.8-libc-headers.patch
> b/meta/recipes-devtools/strace/strace/0001-uring-fix-build-against-5.8-libc-headers.patch
> new file mode 100644
> index 0000000000..cfce3eca51
> --- /dev/null
> +++
> b/meta/recipes-devtools/strace/strace/0001-uring-fix-build-against-5.8-libc-headers.patch
> @@ -0,0 +1,98 @@
> +From 8dda6b8ddbe18b6bb83cf1fa6bc71ebdc82e1b72 Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Date: Mon, 3 Aug 2020 23:00:39 -0400
> +Subject: [PATCH] uring: fix build against 5.8 libc-headers
> +
> +To get strace building against v5.8 headers before the next
> +version of strace is released, we need to copy in a bootstrapped
> +file from the latest git (xlat/uring_cqring_flags.h) and remove
> +remove unnecessary asserts for v5.8+ (in a similar manner to the
> +main strace repository).
> +
> +Upstream-status: inappropriate. oe specific (upstream builds bootstrap)
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +---
> + types/check-io_uring.c    | 10 --------
> + xlat/uring_cqring_flags.h | 48 +++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 48 insertions(+), 10 deletions(-)
> + create mode 100644 xlat/uring_cqring_flags.h
> +
> +diff --git a/types/check-io_uring.c b/types/check-io_uring.c
> +index dc21569..d5bd4b1 100644
> +--- a/types/check-io_uring.c
> ++++ b/types/check-io_uring.c
> +@@ -13,16 +13,6 @@ static_assert(sizeof(struct io_sqring_offsets) <=
> offsetof(struct_io_sqring_offs
> + # endif /* HAVE_STRUCT_IO_SQRING_OFFSETS_RESV2 */
> + #endif /* HAVE_STRUCT_IO_SQRING_OFFSETS */
> +
> +-#ifdef HAVE_STRUCT_IO_CQRING_OFFSETS
> +-# ifdef HAVE_STRUCT_IO_CQRING_OFFSETS_RESV
> +-static_assert(sizeof(struct io_cqring_offsets) ==
> sizeof(struct_io_cqring_offsets),
> +-      "struct io_cqring_offsets size mismatch, please update the decoder
> or fix the kernel");
> +-# else
> +-static_assert(sizeof(struct io_cqring_offsets) <=
> offsetof(struct_io_cqring_offsets, resv),
> +-"struct io_cqring_offsets size mismatch, please update the decoder or
> fix the kernel");
> +-# endif /* HAVE_STRUCT_IO_CQRING_OFFSETS_RESV */
> +-#endif /* HAVE_STRUCT_IO_CQRING_OFFSETS */
> +-
> + #ifdef HAVE_STRUCT_IO_URING_PARAMS
> + # ifdef HAVE_STRUCT_IO_URING_PARAMS_CQ_OFF
> + static_assert(sizeof(struct io_uring_params) ==
> sizeof(struct_io_uring_params),
> +diff --git a/xlat/uring_cqring_flags.h b/xlat/uring_cqring_flags.h
> +new file mode 100644
> +index 0000000..0352749
> +--- /dev/null
> ++++ b/xlat/uring_cqring_flags.h
> +@@ -0,0 +1,48 @@
> ++/* Generated by ./xlat/gen.sh from ./xlat/uring_cqring_flags.in; do not
> edit. */
> ++
> ++#include "gcc_compat.h"
> ++#include "static_assert.h"
> ++
> ++#if defined(IORING_CQ_EVENTFD_DISABLED) ||
> (defined(HAVE_DECL_IORING_CQ_EVENTFD_DISABLED) &&
> HAVE_DECL_IORING_CQ_EVENTFD_DISABLED)
> ++DIAG_PUSH_IGNORE_TAUTOLOGICAL_COMPARE
> ++static_assert((IORING_CQ_EVENTFD_DISABLED) == (1U),
> "IORING_CQ_EVENTFD_DISABLED != 1U");
> ++DIAG_POP_IGNORE_TAUTOLOGICAL_COMPARE
> ++#else
> ++# define IORING_CQ_EVENTFD_DISABLED 1U
> ++#endif
> ++
> ++#ifndef XLAT_MACROS_ONLY
> ++
> ++# ifdef IN_MPERS
> ++
> ++#  error static const struct xlat uring_cqring_flags in mpers mode
> ++
> ++# else
> ++
> ++static const struct xlat_data uring_cqring_flags_xdata[] = {
> ++ XLAT(IORING_CQ_EVENTFD_DISABLED),
> ++ #define XLAT_VAL_0 ((unsigned) (IORING_CQ_EVENTFD_DISABLED))
> ++ #define XLAT_STR_0 STRINGIFY(IORING_CQ_EVENTFD_DISABLED)
> ++};
> ++static
> ++const struct xlat uring_cqring_flags[1] = { {
> ++ .data = uring_cqring_flags_xdata,
> ++ .size = ARRAY_SIZE(uring_cqring_flags_xdata),
> ++ .type = XT_NORMAL,
> ++ .flags_mask = 0
> ++#  ifdef XLAT_VAL_0
> ++  | XLAT_VAL_0
> ++#  endif
> ++  ,
> ++ .flags_strsz = 0
> ++#  ifdef XLAT_STR_0
> ++  + sizeof(XLAT_STR_0)
> ++#  endif
> ++  ,
> ++} };
> ++
> ++#  undef XLAT_STR_0
> ++#  undef XLAT_VAL_0
> ++# endif /* !IN_MPERS */
> ++
> ++#endif /* !XLAT_MACROS_ONLY */
> +--
> +2.19.1
> +
> diff --git a/meta/recipes-devtools/strace/strace_5.7.bb
> b/meta/recipes-devtools/strace/strace_5.7.bb
> index c184d035aa..bc6aea54d3 100644
> --- a/meta/recipes-devtools/strace/strace_5.7.bb
> +++ b/meta/recipes-devtools/strace/strace_5.7.bb
> @@ -14,6 +14,9 @@ SRC_URI = "
> https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>             file://ptest-spacesave.patch \
>             file://uintptr_t.patch \
>             file://0001-strace-fix-reproducibilty-issues.patch \
> +
>  file://0001-io_uring-Remove-struct-io_cqring_offsets-compile-tim.patch \
> +           file://0001-io_uring-Add-io_cqring_offset-flags.patch \
> +           file://0001-uring-fix-build-against-5.8-libc-headers.patch \
>             "
>  SRC_URI[sha256sum] =
> "b284b59f9bcd95b9728cea5bd5c0edc5ebe360af73dc76fbf6334f11c777ccd8"
>
> --
> 2.19.1
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000112cd905ac3af8ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Act=
ually, disregard this patch for now.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Less than 24 hours ago, strace 5.8 released. I&#39;ll test=C2=
=A0it against the 5.8 headers and update to that instead if it works.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 6, 2020=
 at 3:59 PM &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.=
com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
The 5.8 kernel introduced changes to io uring that require adjustments<br>
in strace for it to build against the new headers. See kernel commits<br>
v5.8-rc1~190^2~22 and v5.8-rc1~190^2~21 for details.<br>
<br>
There are two patches in the upstream strace that deal with the new<br>
flags, so we port them to the v5.7 release until a new one is<br>
available upstream.<br>
<br>
We also have a third patch that is oe specific, which is the addition<br>
of a newly generated flags file and removal of some static checks.<br>
We need this change to build, since released versions of strace don&#39;t<b=
r>
run the bootstrap step and hence won&#39;t generate the flags or fixup<br>
any static checks.<br>
<br>
Tested against the v5.4 and v5.8 kernels.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
<br>
Note: also tested against both the 5.8 and 5.4 libc-headers.<br>
<br>
Bruce<br>
<br>
=C2=A0...-io_uring-Add-io_cqring_offset-flags.patch | 154 +++++++++++++++++=
+<br>
=C2=A0...struct-io_cqring_offsets-compile-tim.patch |=C2=A0 46 ++++++<br>
=C2=A0...g-fix-build-against-5.8-libc-headers.patch |=C2=A0 98 +++++++++++<=
br>
=C2=A0meta/recipes-devtools/strace/<a href=3D"http://strace_5.7.bb" rel=3D"=
noreferrer" target=3D"_blank">strace_5.7.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
3 +<br>
=C2=A04 files changed, 301 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/strace/strace/0001-io_uring-=
Add-io_cqring_offset-flags.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/strace/strace/0001-io_uring-=
Remove-struct-io_cqring_offsets-compile-tim.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/strace/strace/0001-uring-fix=
-build-against-5.8-libc-headers.patch<br>
<br>
diff --git a/meta/recipes-devtools/strace/strace/0001-io_uring-Add-io_cqrin=
g_offset-flags.patch b/meta/recipes-devtools/strace/strace/0001-io_uring-Ad=
d-io_cqring_offset-flags.patch<br>
new file mode 100644<br>
index 0000000000..dceeff7c7e<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/strace/strace/0001-io_uring-Add-io_cqring_offse=
t-flags.patch<br>
@@ -0,0 +1,154 @@<br>
+From 592b915033de37322e19f3e6413de33317d272fe Mon Sep 17 00:00:00 2001<br>
+From: Chris Packham &lt;<a href=3D"mailto:chris.packham@alliedtelesis.co.n=
z" target=3D"_blank">chris.packham@alliedtelesis.co.nz</a>&gt;<br>
+Date: Mon, 15 Jun 2020 22:01:26 +1200<br>
+Subject: [PATCH] io_uring: Add io_cqring_offset flags<br>
+<br>
+Add support for displaying struct io_cqring_offsets.flags introduced<br>
+by Linux kernel commits v5.8-rc1~190^2~22 and v5.8-rc1~190^2~21.<br>
+<br>
+* types/io_uring.h (struct_io_cqring_offsets): Replace resv array<br>
+with flags, resv1, and resv2 fields.<br>
+* xlat/<a href=3D"http://uring_cqring_flags.in" rel=3D"noreferrer" target=
=3D"_blank">uring_cqring_flags.in</a>: New file.<br>
+* <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">con=
figure.ac</a> (AC_CHECK_MEMBERS): Check struct io_cqring_offsets.flags.<br>
+* io_uring.c: Include &quot;xlat/uring_cqring_flags.h&quot;.<br>
+(SYS_FUNC(io_uring_setup)): Replace printing of the resv array<br>
+of struct io_cqring_offsets with flags, resv1, and resv2 fields.<br>
+* tests/io_uring_setup.c: Check it.<br>
+<br>
+Upstream-status: backport of commit 592b915033de37322e19f3e6413de33317d272=
fe<br>
+<br>
+Co-authored-by: Dmitry V. Levin &lt;<a href=3D"mailto:ldv@altlinux.org" ta=
rget=3D"_blank">ldv@altlinux.org</a>&gt;<br>
+Resolves: <a href=3D"https://github.com/strace/strace/issues/138" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/strace/strace/issues/138</a=
><br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
+ io_uring.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 11 +++++++----<br>
+ tests/io_uring_setup.c=C2=A0 =C2=A0 =C2=A0| 31 ++++++++++++++++++++++++++=
-----<br>
+ types/io_uring.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +++-<b=
r>
+ xlat/<a href=3D"http://uring_cqring_flags.in" rel=3D"noreferrer" target=
=3D"_blank">uring_cqring_flags.in</a> |=C2=A0 1 +<br>
+ 5 files changed, 38 insertions(+), 10 deletions(-)<br>
+ create mode 100644 xlat/<a href=3D"http://uring_cqring_flags.in" rel=3D"n=
oreferrer" target=3D"_blank">uring_cqring_flags.in</a><br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index d0fd51ff..91c2249e 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -481,6 +481,7 @@ AC_CHECK_HEADERS([linux/bpf.h], [<br>
+ <br>
+ AC_CHECK_HEADERS([linux/io_uring.h], [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_MEMBERS(m4_normalize([<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct io_cqring_offsets=
.flags,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct io_uring_par=
ams.features,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct io_uring_par=
ams.wq_fd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct io_uring_par=
ams.resv<br>
+diff --git a/io_uring.c b/io_uring.c<br>
+index cfeea82b..2ffe163e 100644<br>
+--- a/io_uring.c<br>
++++ b/io_uring.c<br>
+@@ -17,6 +17,7 @@<br>
+ #include &quot;xlat/uring_setup_flags.h&quot;<br>
+ #include &quot;xlat/uring_enter_flags.h&quot;<br>
+ #include &quot;xlat/uring_register_opcodes.h&quot;<br>
++#include &quot;xlat/uring_cqring_flags.h&quot;<br>
+ <br>
+ #ifdef HAVE_STRUCT_IO_URING_PARAMS<br>
+ # ifdef HAVE_STRUCT_IO_URING_PARAMS_RESV<br>
+@@ -88,10 +89,12 @@ SYS_FUNC(io_uring_setup)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PRINT_FIELD_U(&quot=
;, &quot;, params.cq_off, ring_entries);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PRINT_FIELD_U(&quot=
;, &quot;, params.cq_off, overflow);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PRINT_FIELD_U(&quot=
;, &quot;, params.cq_off, cqes);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!IS_ARRAY_ZERO(param=
s.cq_off.resv)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PRINT_FIELD_ARRAY(&quot;, &quot;, params.cq_off, resv, tcp,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_xi=
nt64_array_member);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PRINT_FIELD_FLAGS(&quot;=
, &quot;, params.cq_off, flags,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uring_cqring_flags, &quot;IORING_CQ_=
???&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (params.cq_off.resv1)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PRINT_FIELD_X(&quot;, &quot;, params.cq_off, resv1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (params.cq_off.resv2)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PRINT_FIELD_X(&quot;, &quot;, params.cq_off, resv2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tprints(&quot;}&quo=
t;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tprints(&quot;}&quot;);<br>
+diff --git a/tests/io_uring_setup.c b/tests/io_uring_setup.c<br>
+index 317b0d7a..a59e4a1a 100644<br>
+--- a/tests/io_uring_setup.c<br>
++++ b/tests/io_uring_setup.c<br>
+@@ -27,6 +27,7 @@<br>
+ # include &quot;xlat.h&quot;<br>
+ <br>
+ # include &quot;xlat/uring_setup_features.h&quot;<br>
++# include &quot;xlat/uring_cqring_flags.h&quot;<br>
+ <br>
+ # ifdef HAVE_STRUCT_IO_URING_PARAMS_FEATURES<br>
+ #=C2=A0 ifdef HAVE_STRUCT_IO_URING_PARAMS_WQ_FD<br>
+@@ -144,20 +145,40 @@ main(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0params-&gt;sq_off.resv2);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printf(&quot;}, cq_off=3D{head=3D%u, tail=3D%u, ring_mask=3D%u&qu=
ot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;, ring_entries=3D%u, overflow=3D%u, cq=
es=3D%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;, ring_entries=3D%u, overflow=3D%u, cq=
es=3D%u, flags=3D&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params-&gt;cq_off.head,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params-&gt;cq_off.tail,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params-&gt;cq_off.ring_mask,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params-&gt;cq_off.ring_entries,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params-&gt;cq_off.overflow,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params-&gt;cq_off.cqes);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (params-&gt;cq_off.resv[0] || params-&gt;cq_off.resv[1]) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;, resv=3D[%#llx, %#llx]&quot;,=
<br>
++#ifdef HAVE_STRUCT_IO_CQRING_OFFSETS_FLAGS<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printflags(uring_cqring_flags,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params-&gt;cq_off.flags,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;IORING_CQ_???&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (params-&gt;cq_off.resv1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;, resv1=3D%#x&quot;, params-&g=
t;cq_off.resv1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (params-&gt;cq_off.resv2)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;, resv2=3D%#llx&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned long =
long)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 params-&gt;cq_off.resv[0],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 params-&gt;cq_off.resv2);<br>
++#else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 union {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t flags;=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t resv1;=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } s;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t v;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } u =3D { .v =3D params-&gt;cq_off.resv[0] };<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printflags(uring_cqring_flags, u.s.flags,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;IORING_CQ_???&quot;);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (u.s.resv1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;, resv1=3D%#x&quot;, u.s.resv1=
);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (params-&gt;cq_off.resv[1])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;, resv2=3D%#llx&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned long =
long)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0params-&gt;cq_off.resv[1]);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++#endif<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printf(&quot;}}) =3D %ld&lt;anon_inode:[io_uring]&gt;\n&quot;, rc=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/types/io_uring.h b/types/io_uring.h<br>
+index 76f432c3..2fe1c13a 100644<br>
+--- a/types/io_uring.h<br>
++++ b/types/io_uring.h<br>
+@@ -31,7 +31,9 @@ typedef struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ring_entries;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t overflow;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t cqes;<br>
+-=C2=A0 =C2=A0 =C2=A0 uint64_t resv[2];<br>
++=C2=A0 =C2=A0 =C2=A0 /** Added by v5.8-rc1~190^2~22 */=C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint32_t flags;<br>
++=C2=A0 =C2=A0 =C2=A0 /** Added by v5.8-rc1~190^2~22 */=C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint32_t resv1;<br>
++=C2=A0 =C2=A0 =C2=A0 /** Added by v5.8-rc1~190^2~22 */=C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint64_t resv2;<br>
+ } struct_io_cqring_offsets;<br>
+ <br>
+ typedef struct {<br>
+diff --git a/xlat/<a href=3D"http://uring_cqring_flags.in" rel=3D"noreferr=
er" target=3D"_blank">uring_cqring_flags.in</a> b/xlat/<a href=3D"http://ur=
ing_cqring_flags.in" rel=3D"noreferrer" target=3D"_blank">uring_cqring_flag=
s.in</a><br>
+new file mode 100644<br>
+index 00000000..c81fbc20<br>
+--- /dev/null<br>
++++ b/xlat/<a href=3D"http://uring_cqring_flags.in" rel=3D"noreferrer" tar=
get=3D"_blank">uring_cqring_flags.in</a><br>
+@@ -0,0 +1 @@<br>
++IORING_CQ_EVENTFD_DISABLED=C2=A0 =C2=A0 1U<br>
+-- <br>
+2.19.1<br>
+<br>
diff --git a/meta/recipes-devtools/strace/strace/0001-io_uring-Remove-struc=
t-io_cqring_offsets-compile-tim.patch b/meta/recipes-devtools/strace/strace=
/0001-io_uring-Remove-struct-io_cqring_offsets-compile-tim.patch<br>
new file mode 100644<br>
index 0000000000..774b520a06<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/strace/strace/0001-io_uring-Remove-struct-io_cq=
ring_offsets-compile-tim.patch<br>
@@ -0,0 +1,46 @@<br>
+From fded17c15bca4150165f899cc47f67bab963d9a7 Mon Sep 17 00:00:00 2001<br>
+From: Chris Packham &lt;<a href=3D"mailto:chris.packham@alliedtelesis.co.n=
z" target=3D"_blank">chris.packham@alliedtelesis.co.nz</a>&gt;<br>
+Date: Mon, 15 Jun 2020 22:01:25 +1200<br>
+Subject: [PATCH] io_uring: Remove struct io_cqring_offsets compile time<br=
>
+ asserts<br>
+<br>
+The generated types/check-io_uring.c already checks the kernel&#39;s struc=
t<br>
+io_cqring_offsets for compatibility with the strace definition so<br>
+there&#39;s no need for manual checks.<br>
+<br>
+Upstream-status: backport of commit fded17c15bca4150165f899cc47f67bab963d9=
a7<br>
+<br>
+* io_uring.c [HAVE_STRUCT_IO_CQRING_OFFSETS]: Remove static_asserts.<br>
+---<br>
+ io_uring.c | 15 ---------------<br>
+ 1 file changed, 15 deletions(-)<br>
+<br>
+diff --git a/io_uring.c b/io_uring.c<br>
+index cd183457..cfeea82b 100644<br>
+--- a/io_uring.c<br>
++++ b/io_uring.c<br>
+@@ -18,21 +18,6 @@<br>
+ #include &quot;xlat/uring_enter_flags.h&quot;<br>
+ #include &quot;xlat/uring_register_opcodes.h&quot;<br>
+ <br>
+-#ifdef HAVE_STRUCT_IO_CQRING_OFFSETS<br>
+-# ifdef HAVE_STRUCT_IO_CQRING_OFFSETS_RESV<br>
+-static_assert(offsetof(struct_io_cqring_offsets, resv)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=3D offsetof(struct i=
o_cqring_offsets, resv),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;struct io_cqring_of=
fsets.resv offset mismatch&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;, please update the=
 decoder&quot;);<br>
+-static_assert(sizeof_field(struct_io_cqring_offsets, resv)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;=3D sizeof_field(stru=
ct io_cqring_offsets, resv),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;struct io_cqring_of=
fsets.resv size mismatch&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;, please update the=
 decoder&quot;);<br>
+-# else /* !HAVE_STRUCT_IO_CQRING_OFFSETS_RESV */<br>
+-static_assert(0, &quot;struct io_cqring_offsets.resv is missing&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;, please upd=
ate the decoder&quot;);<br>
+-# endif<br>
+-#endif /* HAVE_STRUCT_IO_CQRING_OFFSETS */<br>
+ #ifdef HAVE_STRUCT_IO_URING_PARAMS<br>
+ # ifdef HAVE_STRUCT_IO_URING_PARAMS_RESV<br>
+ static_assert(offsetof(struct_io_uring_params, resv)<br>
+-- <br>
+2.19.1<br>
+<br>
diff --git a/meta/recipes-devtools/strace/strace/0001-uring-fix-build-again=
st-5.8-libc-headers.patch b/meta/recipes-devtools/strace/strace/0001-uring-=
fix-build-against-5.8-libc-headers.patch<br>
new file mode 100644<br>
index 0000000000..cfce3eca51<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/strace/strace/0001-uring-fix-build-against-5.8-=
libc-headers.patch<br>
@@ -0,0 +1,98 @@<br>
+From 8dda6b8ddbe18b6bb83cf1fa6bc71ebdc82e1b72 Mon Sep 17 00:00:00 2001<br>
+From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" targe=
t=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
+Date: Mon, 3 Aug 2020 23:00:39 -0400<br>
+Subject: [PATCH] uring: fix build against 5.8 libc-headers<br>
+<br>
+To get strace building against v5.8 headers before the next<br>
+version of strace is released, we need to copy in a bootstrapped<br>
+file from the latest git (xlat/uring_cqring_flags.h) and remove<br>
+remove unnecessary asserts for v5.8+ (in a similar manner to the<br>
+main strace repository).<br>
+<br>
+Upstream-status: inappropriate. oe specific (upstream builds bootstrap)<br=
>
+<br>
+Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
+---<br>
+ types/check-io_uring.c=C2=A0 =C2=A0 | 10 --------<br>
+ xlat/uring_cqring_flags.h | 48 +++++++++++++++++++++++++++++++++++++++<br=
>
+ 2 files changed, 48 insertions(+), 10 deletions(-)<br>
+ create mode 100644 xlat/uring_cqring_flags.h<br>
+<br>
+diff --git a/types/check-io_uring.c b/types/check-io_uring.c<br>
+index dc21569..d5bd4b1 100644<br>
+--- a/types/check-io_uring.c<br>
++++ b/types/check-io_uring.c<br>
+@@ -13,16 +13,6 @@ static_assert(sizeof(struct io_sqring_offsets) &lt;=3D =
offsetof(struct_io_sqring_offs<br>
+ # endif /* HAVE_STRUCT_IO_SQRING_OFFSETS_RESV2 */<br>
+ #endif /* HAVE_STRUCT_IO_SQRING_OFFSETS */<br>
+ <br>
+-#ifdef HAVE_STRUCT_IO_CQRING_OFFSETS<br>
+-# ifdef HAVE_STRUCT_IO_CQRING_OFFSETS_RESV<br>
+-static_assert(sizeof(struct io_cqring_offsets) =3D=3D sizeof(struct_io_cq=
ring_offsets),<br>
+-=C2=A0 =C2=A0 =C2=A0 &quot;struct io_cqring_offsets size mismatch, please=
 update the decoder or fix the kernel&quot;);<br>
+-# else<br>
+-static_assert(sizeof(struct io_cqring_offsets) &lt;=3D offsetof(struct_io=
_cqring_offsets, resv),<br>
+-&quot;struct io_cqring_offsets size mismatch, please update the decoder o=
r fix the kernel&quot;);<br>
+-# endif /* HAVE_STRUCT_IO_CQRING_OFFSETS_RESV */<br>
+-#endif /* HAVE_STRUCT_IO_CQRING_OFFSETS */<br>
+-<br>
+ #ifdef HAVE_STRUCT_IO_URING_PARAMS<br>
+ # ifdef HAVE_STRUCT_IO_URING_PARAMS_CQ_OFF<br>
+ static_assert(sizeof(struct io_uring_params) =3D=3D sizeof(struct_io_urin=
g_params),<br>
+diff --git a/xlat/uring_cqring_flags.h b/xlat/uring_cqring_flags.h<br>
+new file mode 100644<br>
+index 0000000..0352749<br>
+--- /dev/null<br>
++++ b/xlat/uring_cqring_flags.h<br>
+@@ -0,0 +1,48 @@<br>
++/* Generated by ./xlat/gen.sh from ./xlat/<a href=3D"http://uring_cqring_=
flags.in" rel=3D"noreferrer" target=3D"_blank">uring_cqring_flags.in</a>; d=
o not edit. */<br>
++<br>
++#include &quot;gcc_compat.h&quot;<br>
++#include &quot;static_assert.h&quot;<br>
++<br>
++#if defined(IORING_CQ_EVENTFD_DISABLED) || (defined(HAVE_DECL_IORING_CQ_E=
VENTFD_DISABLED) &amp;&amp; HAVE_DECL_IORING_CQ_EVENTFD_DISABLED)<br>
++DIAG_PUSH_IGNORE_TAUTOLOGICAL_COMPARE<br>
++static_assert((IORING_CQ_EVENTFD_DISABLED) =3D=3D (1U), &quot;IORING_CQ_E=
VENTFD_DISABLED !=3D 1U&quot;);<br>
++DIAG_POP_IGNORE_TAUTOLOGICAL_COMPARE<br>
++#else<br>
++# define IORING_CQ_EVENTFD_DISABLED 1U<br>
++#endif<br>
++<br>
++#ifndef XLAT_MACROS_ONLY<br>
++<br>
++# ifdef IN_MPERS<br>
++<br>
++#=C2=A0 error static const struct xlat uring_cqring_flags in mpers mode<b=
r>
++<br>
++# else<br>
++<br>
++static const struct xlat_data uring_cqring_flags_xdata[] =3D {<br>
++ XLAT(IORING_CQ_EVENTFD_DISABLED),<br>
++ #define XLAT_VAL_0 ((unsigned) (IORING_CQ_EVENTFD_DISABLED))<br>
++ #define XLAT_STR_0 STRINGIFY(IORING_CQ_EVENTFD_DISABLED)<br>
++};<br>
++static<br>
++const struct xlat uring_cqring_flags[1] =3D { {<br>
++ .data =3D uring_cqring_flags_xdata,<br>
++ .size =3D ARRAY_SIZE(uring_cqring_flags_xdata),<br>
++ .type =3D XT_NORMAL,<br>
++ .flags_mask =3D 0<br>
++#=C2=A0 ifdef XLAT_VAL_0<br>
++=C2=A0 | XLAT_VAL_0<br>
++#=C2=A0 endif<br>
++=C2=A0 ,<br>
++ .flags_strsz =3D 0<br>
++#=C2=A0 ifdef XLAT_STR_0<br>
++=C2=A0 + sizeof(XLAT_STR_0)<br>
++#=C2=A0 endif<br>
++=C2=A0 ,<br>
++} };<br>
++<br>
++#=C2=A0 undef XLAT_STR_0<br>
++#=C2=A0 undef XLAT_VAL_0<br>
++# endif /* !IN_MPERS */<br>
++<br>
++#endif /* !XLAT_MACROS_ONLY */<br>
+-- <br>
+2.19.1<br>
+<br>
diff --git a/meta/recipes-devtools/strace/<a href=3D"http://strace_5.7.bb" =
rel=3D"noreferrer" target=3D"_blank">strace_5.7.bb</a> b/meta/recipes-devto=
ols/strace/<a href=3D"http://strace_5.7.bb" rel=3D"noreferrer" target=3D"_b=
lank">strace_5.7.bb</a><br>
index c184d035aa..bc6aea54d3 100644<br>
--- a/meta/recipes-devtools/strace/<a href=3D"http://strace_5.7.bb" rel=3D"=
noreferrer" target=3D"_blank">strace_5.7.bb</a><br>
+++ b/meta/recipes-devtools/strace/<a href=3D"http://strace_5.7.bb" rel=3D"=
noreferrer" target=3D"_blank">strace_5.7.bb</a><br>
@@ -14,6 +14,9 @@ SRC_URI =3D &quot;<a href=3D"https://strace.io/files/$%7B=
PV%7D/strace-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:/=
/strace.io/files/${PV}/strace-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ptest-spacesave.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://uintptr_t.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-strace-fix-reproducib=
ilty-issues.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-io_uring-Remove-struc=
t-io_cqring_offsets-compile-tim.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-io_uring-Add-io_cqrin=
g_offset-flags.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-uring-fix-build-again=
st-5.8-libc-headers.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b284b59f9bcd95b9728cea5bd5c0edc5ebe360af=
73dc76fbf6334f11c777ccd8&quot;<br>
<br>
-- <br>
2.19.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--000000000000112cd905ac3af8ba--
