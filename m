Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.11014.1613060994644223364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 08:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=gs7KpoJC;
 spf=pass (domain: burtonini.com, ip: 209.85.167.53, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f53.google.com with SMTP id f1so8962964lfu.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 08:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xFdmN9fQShZ4E3x0Pl3NK769ZNodK37bzHbD29zxJf8=;
        b=gs7KpoJCOJLDtzUw5aAo3tMEOw2Z9l43uluv/vi3O03gOLEXf+wh4d8b/6hh0t5zX1
         OLLwXLPfEJM5fV00AKy6f9dVaaMfu9p2uoa29tXmyJ/rumOBsFddElz/fDbztNH73ffY
         zmgsZtT77JgtPB/kFtDRe5E7QkHDcPKqePV2mcn8BNpdFk5Hx45yrS7HA7/5w5jsJveI
         iwP9FGyBNdSGK6J308npPfcBvpIxgSZLwn9Pf8Htzugc08ntorQ7uBHGbQl0DwePLzNb
         thq4Ddl8zEMeQrSjOF0MTGPzKKAlG1Da6Pc9HLV4/8iyCMCIy0skcZm0Fv2h9m74e30u
         3wQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xFdmN9fQShZ4E3x0Pl3NK769ZNodK37bzHbD29zxJf8=;
        b=Jf+tyrDLWHW0/nw64X/JqcZrhrB0NgHo7n1XUpaKtTHaFTQqDdTodbx0i1lsf25q5y
         tXvpZgAZxGfUhg6Ke3kG8jb4biC8Qgr1F8xy4Khue/CTbkoee9PSYAAHtdubGGEFTLn5
         j0FdDvx8s8l2lgbTFwDLkr1vSW5g7ZJeSDN26aFgUd8ZBlHokr31UYfqe15SYBgVOyQc
         +x2YdVfPotr6Y8mdO9vWJPYP0i233l290wL3JRlKVqmEedQKEGbxqN36QOzks6nEJBCc
         0Br1zeTgBa4PglwxY7xZukBpcw0qAxG/0IMt+NJ1CF+weLcv8xYM7fUW3T1rfoYM6oGW
         BUvQ==
X-Gm-Message-State: AOAM533Wy6WsE/N0iT2A2lrR+v7kfKLx6L2Csr7ndLQi9ILoIvhLgKEY
	bXoypBtJFOFugEkMcqo7DxGUBdPXX4oPRn9AGgIgjQ==
X-Google-Smtp-Source: ABdhPJwzFilCcVeNUI7S2UcLkLVlOFQ5x3ze2Iqh5DBxDKHIDc6o9cUlG9xSQ0mW8UpRCc5m7eMq4HzTRqHWmM5AgkA=
X-Received: by 2002:ac2:4545:: with SMTP id j5mr4689277lfm.136.1613060992546;
 Thu, 11 Feb 2021 08:29:52 -0800 (PST)
MIME-Version: 1.0
References: <20210211155739.17067-1-jon.mason@arm.com>
In-Reply-To: <20210211155739.17067-1-jon.mason@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 11 Feb 2021 16:29:41 +0000
Message-ID: <CAAnfSTuAh4OVp54SuFMFNV+cKzWdmcRSk9nn+ee1drXpCq+2-Q@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] gcc-9.3.inc: Fix potential runtime crash
To: Jon Mason <jdmason@kudzu.us>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Missing patch headers.

On Thu, 11 Feb 2021 at 15:57, Jon Mason <jdmason@kudzu.us> wrote:
>
> GCCv9 tree vectorization code is faulty and can cause random crashes at
> runtime (when using -O3).  Add the backported patch to address this
> issue.
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta/recipes-devtools/gcc/gcc-9.3.inc         |   1 +
>  ...-PR-tree-optimization-97236-fix-bad-.patch | 116 ++++++++++++++++++
>  2 files changed, 117 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
> index 4c54ba250aba..1c8e3df51d91 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
> @@ -72,6 +72,7 @@ SRC_URI = "\
>             file://0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch \
>             file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
>             file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
> +           file://0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch \
>  "
>  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>  SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch b/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> new file mode 100644
> index 000000000000..9020aa6c3a1e
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> @@ -0,0 +1,116 @@
> +From 97b668f9a8c6ec565c278a60e7d1492a6932e409 Mon Sep 17 00:00:00 2001
> +From: Matthias Klose <doko@ubuntu.com>
> +Date: Tue, 6 Oct 2020 13:41:37 +0200
> +Subject: [PATCH] Backport fix for PR/tree-optimization/97236 - fix bad use of
> + VMAT_CONTIGUOUS
> +
> +This avoids using VMAT_CONTIGUOUS with single-element interleaving
> +when using V1mode vectors.  Instead keep VMAT_ELEMENTWISE but
> +continue to avoid load-lanes and gathers.
> +
> +2020-10-01  Richard Biener  <rguenther@suse.de>
> +
> +       PR tree-optimization/97236
> +       * tree-vect-stmts.c (get_group_load_store_type): Keep
> +       VMAT_ELEMENTWISE for single-element vectors.
> +
> +       * gcc.dg/vect/pr97236.c: New testcase.
> +
> +(cherry picked from commit 1ab88985631dd2c5a5e3b5c0dce47cf8b6ed2f82)
> +---
> + gcc/testsuite/gcc.dg/vect/pr97236.c | 43 +++++++++++++++++++++++++++++
> + gcc/tree-vect-stmts.c               | 20 ++++++--------
> + 2 files changed, 52 insertions(+), 11 deletions(-)
> + create mode 100644 gcc/testsuite/gcc.dg/vect/pr97236.c
> +
> +diff --git a/gcc/testsuite/gcc.dg/vect/pr97236.c b/gcc/testsuite/gcc.dg/vect/pr97236.c
> +new file mode 100644
> +index 000000000000..9d3dc20d953d
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.dg/vect/pr97236.c
> +@@ -0,0 +1,43 @@
> ++typedef unsigned char __uint8_t;
> ++typedef __uint8_t uint8_t;
> ++typedef struct plane_t {
> ++  uint8_t *p_pixels;
> ++  int i_lines;
> ++  int i_pitch;
> ++} plane_t;
> ++
> ++typedef struct {
> ++  plane_t p[5];
> ++} picture_t;
> ++
> ++#define N 4
> ++
> ++void __attribute__((noipa))
> ++picture_Clone(picture_t *picture, picture_t *res)
> ++{
> ++  for (int i = 0; i < N; i++) {
> ++    res->p[i].p_pixels = picture->p[i].p_pixels;
> ++    res->p[i].i_lines = picture->p[i].i_lines;
> ++    res->p[i].i_pitch = picture->p[i].i_pitch;
> ++  }
> ++}
> ++
> ++int
> ++main()
> ++{
> ++  picture_t aaa, bbb;
> ++  uint8_t pixels[10] = {1, 1, 1, 1, 1, 1, 1, 1};
> ++
> ++  for (unsigned i = 0; i < N; i++)
> ++    aaa.p[i].p_pixels = pixels;
> ++
> ++  picture_Clone (&aaa, &bbb);
> ++
> ++  uint8_t c = 0;
> ++  for (unsigned i = 0; i < N; i++)
> ++    c += bbb.p[i].p_pixels[0];
> ++
> ++  if (c != N)
> ++    __builtin_abort ();
> ++  return 0;
> ++}
> +diff --git a/gcc/tree-vect-stmts.c b/gcc/tree-vect-stmts.c
> +index 507f81b0a0e8..ffbba3441de2 100644
> +--- a/gcc/tree-vect-stmts.c
> ++++ b/gcc/tree-vect-stmts.c
> +@@ -2355,25 +2355,23 @@ get_group_load_store_type (stmt_vec_info stmt_info, tree vectype, bool slp,
> +         /* First cope with the degenerate case of a single-element
> +            vector.  */
> +         if (known_eq (TYPE_VECTOR_SUBPARTS (vectype), 1U))
> +-          *memory_access_type = VMAT_CONTIGUOUS;
> ++          ;
> +
> +         /* Otherwise try using LOAD/STORE_LANES.  */
> +-        if (*memory_access_type == VMAT_ELEMENTWISE
> +-            && (vls_type == VLS_LOAD
> +-                ? vect_load_lanes_supported (vectype, group_size, masked_p)
> +-                : vect_store_lanes_supported (vectype, group_size,
> +-                                              masked_p)))
> ++        else if (vls_type == VLS_LOAD
> ++                 ? vect_load_lanes_supported (vectype, group_size, masked_p)
> ++                 : vect_store_lanes_supported (vectype, group_size,
> ++                                               masked_p))
> +           {
> +             *memory_access_type = VMAT_LOAD_STORE_LANES;
> +             overrun_p = would_overrun_p;
> +           }
> +
> +         /* If that fails, try using permuting loads.  */
> +-        if (*memory_access_type == VMAT_ELEMENTWISE
> +-            && (vls_type == VLS_LOAD
> +-                ? vect_grouped_load_supported (vectype, single_element_p,
> +-                                               group_size)
> +-                : vect_grouped_store_supported (vectype, group_size)))
> ++        else if (vls_type == VLS_LOAD
> ++                 ? vect_grouped_load_supported (vectype, single_element_p,
> ++                                                group_size)
> ++                 : vect_grouped_store_supported (vectype, group_size))
> +           {
> +             *memory_access_type = VMAT_CONTIGUOUS_PERMUTE;
> +             overrun_p = would_overrun_p;
> +--
> +2.20.1
> +
> --
> 2.20.1
>
>
> 
>
