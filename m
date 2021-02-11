Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web09.11185.1613061035715487631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 08:30:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l/YE2PXP;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 133so6143160ybd.5
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 08:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8LZ8HhaMkPMhpPRmX6LiYut/adR52uhiE3NErJUCa48=;
        b=l/YE2PXPWf3z6lgM1yP6ntwP15oX1GKVi3FFvHyOJo1Vsk3aC2HPxFCHzbqG2Fb3DJ
         3IKqmxxchjn86xFsgdmMqNe+5nY0fmJOhexhwFFqNBBlJiH7zv4NPkfu7+cJAS26NJxk
         qH+ZgGCYcnCRalHTpc0LLsgql80sy3N4JDlnkYmxPeVyWfP7H8VLjB2di8zLJuIO5Vts
         uWNIbMZ5PTtx4XjjBtVAs24kXJwmT9zuPun4OqVtXIugTB7esI/j+Ddv/oDddz5KkRXY
         0cZPEmhVR4PWuCsVf5vSK+5hptjPYAzZvvaqM7RIXXCuAm713xOGgpH+x7LASejYg7PB
         US4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8LZ8HhaMkPMhpPRmX6LiYut/adR52uhiE3NErJUCa48=;
        b=Aay87zfqmfcW+saSU4qMd7XGkdAVpNlG9kltwMk9e9SGL1cCxWZbe9QomAoz153Wpd
         8kK+wb6jy13B/IcSCvc6GW331u8awVdD46qg/xdthRuP7dhiuPZ5m6KJWoDB5gVJymYX
         HjGVghpm7EBVJsSpFcd+aFyJ90tFDb0qH3D5w5qIzXN6d0nnyDedtKqDQwDIGB65KyMO
         2pT7+n3E8QFy7e5HVpZ2pAANDeOx80glrWg/bXV71cmCXr6rKltYafGWcPjfbjxXGX6l
         AotVXxeOonTRzXu6ktchRoLGXZrHyMEunBv9ylN/W1Sw5wyypptKopA54ojqxEcylYhg
         P6aw==
X-Gm-Message-State: AOAM532FjTX7oQzFaQGiFO/6dttWynkiDIT5NAerMuTb0xxiy+UuEr46
	G4fLZ2eyEpTRV3f8viMBYFS0RFjRqWU8S79nG6s=
X-Google-Smtp-Source: ABdhPJwJWUBG5UPZnylnqWAr4V2vkZ42YoplaeBQOKVRmzaZW0WXlOacrXeELcHVFbIWfyyocMcjB/LSvU8zwxDYQh4=
X-Received: by 2002:a25:cb41:: with SMTP id b62mr12183282ybg.284.1613061034787;
 Thu, 11 Feb 2021 08:30:34 -0800 (PST)
MIME-Version: 1.0
References: <1662BCABA54EAE5B.31788@lists.openembedded.org> <CAPoiz9w2QC3rkKbgXa5N5ZsTTqH7hvHTDa=wMJyy-aqxMBvd6w@mail.gmail.com>
In-Reply-To: <CAPoiz9w2QC3rkKbgXa5N5ZsTTqH7hvHTDa=wMJyy-aqxMBvd6w@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Thu, 11 Feb 2021 06:30:23 -1000
Message-ID: <CAGDS+nmVLo0-39v-WPszKFQwVKxkoyd=4QrsmuOuLMCvCZwYHg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH dunfell] gcc-9.3.inc: Fix potential runtime crash
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 11, 2021 at 6:09 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> Sorry, the subject should have "dunfell" in it

No worries, I got it!

Steve

> On Thu, Feb 11, 2021 at 10:57 AM Jon Mason via lists.openembedded.org
> <jdmason=kudzu.us@lists.openembedded.org> wrote:
> >
> > GCCv9 tree vectorization code is faulty and can cause random crashes at
> > runtime (when using -O3).  Add the backported patch to address this
> > issue.
> >
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-9.3.inc         |   1 +
> >  ...-PR-tree-optimization-97236-fix-bad-.patch | 116 ++++++++++++++++++
> >  2 files changed, 117 insertions(+)
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
> > index 4c54ba250aba..1c8e3df51d91 100644
> > --- a/meta/recipes-devtools/gcc/gcc-9.3.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
> > @@ -72,6 +72,7 @@ SRC_URI = "\
> >             file://0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch \
> >             file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
> >             file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
> > +           file://0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch \
> >  "
> >  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> >  SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch b/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> > new file mode 100644
> > index 000000000000..9020aa6c3a1e
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> > @@ -0,0 +1,116 @@
> > +From 97b668f9a8c6ec565c278a60e7d1492a6932e409 Mon Sep 17 00:00:00 2001
> > +From: Matthias Klose <doko@ubuntu.com>
> > +Date: Tue, 6 Oct 2020 13:41:37 +0200
> > +Subject: [PATCH] Backport fix for PR/tree-optimization/97236 - fix bad use of
> > + VMAT_CONTIGUOUS
> > +
> > +This avoids using VMAT_CONTIGUOUS with single-element interleaving
> > +when using V1mode vectors.  Instead keep VMAT_ELEMENTWISE but
> > +continue to avoid load-lanes and gathers.
> > +
> > +2020-10-01  Richard Biener  <rguenther@suse.de>
> > +
> > +       PR tree-optimization/97236
> > +       * tree-vect-stmts.c (get_group_load_store_type): Keep
> > +       VMAT_ELEMENTWISE for single-element vectors.
> > +
> > +       * gcc.dg/vect/pr97236.c: New testcase.
> > +
> > +(cherry picked from commit 1ab88985631dd2c5a5e3b5c0dce47cf8b6ed2f82)
> > +---
> > + gcc/testsuite/gcc.dg/vect/pr97236.c | 43 +++++++++++++++++++++++++++++
> > + gcc/tree-vect-stmts.c               | 20 ++++++--------
> > + 2 files changed, 52 insertions(+), 11 deletions(-)
> > + create mode 100644 gcc/testsuite/gcc.dg/vect/pr97236.c
> > +
> > +diff --git a/gcc/testsuite/gcc.dg/vect/pr97236.c b/gcc/testsuite/gcc.dg/vect/pr97236.c
> > +new file mode 100644
> > +index 000000000000..9d3dc20d953d
> > +--- /dev/null
> > ++++ b/gcc/testsuite/gcc.dg/vect/pr97236.c
> > +@@ -0,0 +1,43 @@
> > ++typedef unsigned char __uint8_t;
> > ++typedef __uint8_t uint8_t;
> > ++typedef struct plane_t {
> > ++  uint8_t *p_pixels;
> > ++  int i_lines;
> > ++  int i_pitch;
> > ++} plane_t;
> > ++
> > ++typedef struct {
> > ++  plane_t p[5];
> > ++} picture_t;
> > ++
> > ++#define N 4
> > ++
> > ++void __attribute__((noipa))
> > ++picture_Clone(picture_t *picture, picture_t *res)
> > ++{
> > ++  for (int i = 0; i < N; i++) {
> > ++    res->p[i].p_pixels = picture->p[i].p_pixels;
> > ++    res->p[i].i_lines = picture->p[i].i_lines;
> > ++    res->p[i].i_pitch = picture->p[i].i_pitch;
> > ++  }
> > ++}
> > ++
> > ++int
> > ++main()
> > ++{
> > ++  picture_t aaa, bbb;
> > ++  uint8_t pixels[10] = {1, 1, 1, 1, 1, 1, 1, 1};
> > ++
> > ++  for (unsigned i = 0; i < N; i++)
> > ++    aaa.p[i].p_pixels = pixels;
> > ++
> > ++  picture_Clone (&aaa, &bbb);
> > ++
> > ++  uint8_t c = 0;
> > ++  for (unsigned i = 0; i < N; i++)
> > ++    c += bbb.p[i].p_pixels[0];
> > ++
> > ++  if (c != N)
> > ++    __builtin_abort ();
> > ++  return 0;
> > ++}
> > +diff --git a/gcc/tree-vect-stmts.c b/gcc/tree-vect-stmts.c
> > +index 507f81b0a0e8..ffbba3441de2 100644
> > +--- a/gcc/tree-vect-stmts.c
> > ++++ b/gcc/tree-vect-stmts.c
> > +@@ -2355,25 +2355,23 @@ get_group_load_store_type (stmt_vec_info stmt_info, tree vectype, bool slp,
> > +         /* First cope with the degenerate case of a single-element
> > +            vector.  */
> > +         if (known_eq (TYPE_VECTOR_SUBPARTS (vectype), 1U))
> > +-          *memory_access_type = VMAT_CONTIGUOUS;
> > ++          ;
> > +
> > +         /* Otherwise try using LOAD/STORE_LANES.  */
> > +-        if (*memory_access_type == VMAT_ELEMENTWISE
> > +-            && (vls_type == VLS_LOAD
> > +-                ? vect_load_lanes_supported (vectype, group_size, masked_p)
> > +-                : vect_store_lanes_supported (vectype, group_size,
> > +-                                              masked_p)))
> > ++        else if (vls_type == VLS_LOAD
> > ++                 ? vect_load_lanes_supported (vectype, group_size, masked_p)
> > ++                 : vect_store_lanes_supported (vectype, group_size,
> > ++                                               masked_p))
> > +           {
> > +             *memory_access_type = VMAT_LOAD_STORE_LANES;
> > +             overrun_p = would_overrun_p;
> > +           }
> > +
> > +         /* If that fails, try using permuting loads.  */
> > +-        if (*memory_access_type == VMAT_ELEMENTWISE
> > +-            && (vls_type == VLS_LOAD
> > +-                ? vect_grouped_load_supported (vectype, single_element_p,
> > +-                                               group_size)
> > +-                : vect_grouped_store_supported (vectype, group_size)))
> > ++        else if (vls_type == VLS_LOAD
> > ++                 ? vect_grouped_load_supported (vectype, single_element_p,
> > ++                                                group_size)
> > ++                 : vect_grouped_store_supported (vectype, group_size))
> > +           {
> > +             *memory_access_type = VMAT_CONTIGUOUS_PERMUTE;
> > +             overrun_p = would_overrun_p;
> > +--
> > +2.20.1
> > +
> > --
> > 2.20.1
> >
> >
> >
> >
>
> 
>
