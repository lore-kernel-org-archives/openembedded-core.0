Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.10734.1613059741252624931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 08:09:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=oIHDFu1q;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id e15so4486812qte.9
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 08:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vn2Kig7ZCtcY0H21tIdGS3dRTP1fQLjjPD/7Tw+JdBA=;
        b=oIHDFu1qO2UDFgny+o2FWWdw5JvRkfp5RwbZlg19m6jA5pFMQlzjzOAEKPHrri1Gn1
         0a+S7tKt5cJ4Bk74jxXs3yjUmakAfk0HK2RN8PF9podu1nq5+6w16PsS6YGpsw3PrGgD
         ELvNfz4JPiTs41Nc5aK5WDn72i4bhNN05/CedfZt9Xo144WjjgLs7iGT6Y3KH+VfMppx
         3hOaq3fcaDVrhnzDs7oLleQmURc8iHbXLD9a2BVv6FmhH6mMJE9jlFB721KItJm4rnOh
         zb8HfDy3qOgiCF/jQ8A8jWrq2HJEQ4y7S8rcDJOWWpcmP24Dgagt9/KJzsz+k7vZayM6
         Ggmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vn2Kig7ZCtcY0H21tIdGS3dRTP1fQLjjPD/7Tw+JdBA=;
        b=qCztaKkWt1kyUu+btpWEZeE7zuRvfamEl5oADPH8Z74O036PX3k0FOY+mB6xkikBlR
         z5lib4o+vlArXnr5en0kTWKuKiFcPEJd/LW+GlFOdTEb6CgI6qQQwn26zj9JizPry77r
         GWojZ34xx0XQum41SWUaZSXgH1ge0I/S1WHs4A//S0vvLkhxNuXr1dr7liw7E94pSV+X
         be1h3wBYgMEsZ/sGD5FjNSdkhkRyPKq9rQ5n0xTcVWLDpAUhLKSYCtfobN52LllA0gKA
         2RP1MwCQa2VtoeyG0VUzFlq2PqI0utTzF5g8Sqp+21DVIcPf1P4hWzhO0QXcMwof2WCq
         xXaw==
X-Gm-Message-State: AOAM530RCZyb0J6YYnhdzBYZErq/Qd3zNMWRLSvAsNjJrOESbC1b9RgQ
	qL41KJYn5cLqZIwG5jd9djSsR4hIE5J/aSaA+jImRA==
X-Google-Smtp-Source: ABdhPJwVtfebExvHruARSMuli3oAfF1J4aNY2EUUrRqT9GL04nkIn3/R9jy2sBUOMvTJhu9YwCWsjbld5huZfkqyGAE=
X-Received: by 2002:a05:622a:306:: with SMTP id q6mr8101059qtw.15.1613059737745;
 Thu, 11 Feb 2021 08:08:57 -0800 (PST)
MIME-Version: 1.0
References: <1662BCABA54EAE5B.31788@lists.openembedded.org>
In-Reply-To: <1662BCABA54EAE5B.31788@lists.openembedded.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Thu, 11 Feb 2021 11:08:46 -0500
Message-ID: <CAPoiz9w2QC3rkKbgXa5N5ZsTTqH7hvHTDa=wMJyy-aqxMBvd6w@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH dunfell] gcc-9.3.inc: Fix potential runtime crash
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Sorry, the subject should have "dunfell" in it

On Thu, Feb 11, 2021 at 10:57 AM Jon Mason via lists.openembedded.org
<jdmason=kudzu.us@lists.openembedded.org> wrote:
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
