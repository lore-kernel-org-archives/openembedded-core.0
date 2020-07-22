Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
 by mx.groups.io with SMTP id smtpd.web12.16506.1595416097858759412
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 04:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OpNJHdwg;
 spf=pass (domain: linaro.org, ip: 209.85.219.193, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f193.google.com with SMTP id 134so809933ybd.6
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 04:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bi1f7V8bLEcf8COi8zIVBUaCaW22gER6/wgyiiO1OtQ=;
        b=OpNJHdwg+FOmNppdGG87XZIgX7pqG9hs6YWUvGk88gYv0i843A9EbnHQ0nk8+cww4v
         CzPTjl1Ved4F9NbJ/hmKV89+Wapxp7jPLje8BC3ntTBVNNi3CmlaNxOpILWV/tLbP/J5
         QAq5Bx9Kkz7SHC3L8qGY1BL4VqE7ERzO3hOWHr05uOD7RVs+AxAem2lnVx89Vi9gJNU9
         VFHKGnkPGb/W7NGrNI7oF0LjBCEMZOqCz38KOwZYT0DEG+SpqLUAo8jIEdQzuADPG6jj
         iUWyTezQ9lPy4aIq8v70DIku5pof3ODXfJJtAuGG1/ExBBIn4uOckEnrm5p2DsIudNZB
         v5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bi1f7V8bLEcf8COi8zIVBUaCaW22gER6/wgyiiO1OtQ=;
        b=I6TqlsNfUFgMapQMxkHHWxq73+CQHyU/5z1s5hvebetXJChqlT0WBSsEkA1LKt5k/+
         Pxi8Xd6oIxdwwEyvmlGKrHGnNnogX5/6+v38OiCfOY5uzgNzmeL2b29rIJlBCjCCTWk9
         lyXSILBSJlb/RpdIDdU0k9QEps9SPJRRyKAQvHMNARfV0oQSL9xljb/ge9rtiLR4RTKD
         8e+3rUcGaQJ7A6cDDyTXAJnbcW/uuQyJAXa9ayCJLhRJ2aBIcl9oNSpa4EF3SpWHjmLF
         BeQvdnmBvTiGMzkC9K1AwDdCKwOqHvIqavwOvAQr70cSfLZCwUcBTzSG20hgbeOZCw4n
         BS8g==
X-Gm-Message-State: AOAM531C9dsPieNHX4nQ3HqvzE4w17fCIWEFn6lZXo1a2/upHITVDfdB
	1TWFJHmcDS9kcqDV2e/mVSIsf2pzA61kazUJ37wHjA==
X-Google-Smtp-Source: ABdhPJxJuviaji+q3PZgoJbxU5nnNp5110b4G6ewa4iCLDP7G8JfL0YZlASO1Q+hJ9/iseNAWWUdW1oTr9r7G0ZYuKg=
X-Received: by 2002:a25:da10:: with SMTP id n16mr49446466ybf.373.1595416096829;
 Wed, 22 Jul 2020 04:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200716223635.3349898-1-dbaryshkov@gmail.com>
In-Reply-To: <20200716223635.3349898-1-dbaryshkov@gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 22 Jul 2020 13:08:05 +0200
Message-ID: <CAP71Wjxxayo+hMD_EaJPOXVNgSYKyz60N84Rz36=CN-X5Z9d+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc-10.1: add fix for PR 96130
To: Dmitry Baryshkov <dbaryshkov@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Khem, Richard,

On Fri, Jul 17, 2020 at 12:36 AM Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Fix for https://gcc.gnu.org/bugzilla/show_bug.cgi?id=96130 causing ICE
> (SegFault) when compiling current Mesa git tree.

This fixes the build issue reported when trying to build mesa master
branch, see:
https://github.com/ndechesne/meta-qcom/pull/174

While we aren't using mesa/master in OE core, some BSP layer might be
doing that. If mesa gets released before gcc, we might hit this issue.
The gcc is queued for 10.2 already. If we can't get this patch in OE
core, we will host in our layer..

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta/recipes-devtools/gcc/gcc-10.1.inc        |   1 +
>  .../gcc/gcc-10.1/pr96130.patch                | 106 ++++++++++++++++++
>  2 files changed, 107 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-10.1.inc b/meta/recipes-devtools/gcc/gcc-10.1.inc
> index a3de91a2c6a3..a2dd2ae252a5 100644
> --- a/meta/recipes-devtools/gcc/gcc-10.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-10.1.inc
> @@ -66,6 +66,7 @@ SRC_URI = "\
>             file://0036-Enable-CET-in-cross-compiler-if-possible.patch \
>             file://0037-mingw32-Enable-operation_not_supported.patch \
>             file://0038-libatomic-Do-not-enforce-march-on-aarch64.patch \
> +           file://pr96130.patch \
>  "
>  SRC_URI[sha256sum] = "b6898a23844b656f1b68691c5c012036c2e694ac4b53a8918d4712ad876e7ea2"
>
> diff --git a/meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch b/meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch
> new file mode 100644
> index 000000000000..f0e6f85e22f9
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch
> @@ -0,0 +1,106 @@
> +From 0d03c0ee5213703ec6d9ffa632fa5298d83adaaa Mon Sep 17 00:00:00 2001
> +From: Jakub Jelinek <jakub@redhat.com>
> +Date: Mon, 13 Jul 2020 18:25:53 +0200
> +Subject: [PATCH] ipa-fnsummary: Fix ICE with switch predicates [PR96130]
> +
> +The following testcase ICEs since r10-3199.
> +There is a switch with default label, where the controlling expression has
> +range just 0..7 and there are case labels for all those 8 values, but
> +nothing has yet optimized away the default.
> +Since r10-3199, set_switch_stmt_execution_predicate sets the switch to
> +default label's edge's predicate to a false predicate and then
> +compute_bb_predicates propagates the predicates through the cfg, but false
> +predicates aren't really added.  The caller of compute_bb_predicates
> +in one place handles NULL bb->aux as false predicate:
> +      if (fbi.info)
> +       {
> +         if (bb->aux)
> +           bb_predicate = *(predicate *) bb->aux;
> +         else
> +           bb_predicate = false;
> +       }
> +      else
> +       bb_predicate = true;
> +but then in two further spots that the patch below is changing
> +it assumes bb->aux must be non-NULL.  Those two spots are guarded by a
> +condition that is only true if fbi.info is non-NULL, so I think the right
> +fix is to treat NULL aux as false predicate in those spots too.
> +
> +2020-07-13  Jakub Jelinek  <jakub@redhat.com>
> +
> +       PR ipa/96130
> +       * ipa-fnsummary.c (analyze_function_body): Treat NULL bb->aux
> +       as false predicate.
> +
> +       * gcc.dg/torture/pr96130.c: New test.
> +
> +(cherry picked from commit 776e48e0931db69f158f40e5cb8e15463d879a42)
> +---
> + gcc/ipa-fnsummary.c                    | 10 ++++++++--
> + gcc/testsuite/gcc.dg/torture/pr96130.c | 26 ++++++++++++++++++++++++++
> + 2 files changed, 34 insertions(+), 2 deletions(-)
> + create mode 100644 gcc/testsuite/gcc.dg/torture/pr96130.c
> +
> +diff --git a/gcc/ipa-fnsummary.c b/gcc/ipa-fnsummary.c
> +index 045a0ecf766..55a0b272a96 100644
> +--- a/gcc/ipa-fnsummary.c
> ++++ b/gcc/ipa-fnsummary.c
> +@@ -2766,7 +2766,10 @@ analyze_function_body (struct cgraph_node *node, bool early)
> +         edge ex;
> +         unsigned int j;
> +         class tree_niter_desc niter_desc;
> +-        bb_predicate = *(predicate *) loop->header->aux;
> ++        if (loop->header->aux)
> ++          bb_predicate = *(predicate *) loop->header->aux;
> ++        else
> ++          bb_predicate = false;
> +
> +         exits = get_loop_exit_edges (loop);
> +         FOR_EACH_VEC_ELT (exits, j, ex)
> +@@ -2799,7 +2802,10 @@ analyze_function_body (struct cgraph_node *node, bool early)
> +         for (unsigned i = 0; i < loop->num_nodes; i++)
> +           {
> +             gimple_stmt_iterator gsi;
> +-            bb_predicate = *(predicate *) body[i]->aux;
> ++            if (body[i]->aux)
> ++              bb_predicate = *(predicate *) body[i]->aux;
> ++            else
> ++              bb_predicate = false;
> +             for (gsi = gsi_start_bb (body[i]); !gsi_end_p (gsi);
> +                  gsi_next (&gsi))
> +               {
> +diff --git a/gcc/testsuite/gcc.dg/torture/pr96130.c b/gcc/testsuite/gcc.dg/torture/pr96130.c
> +new file mode 100644
> +index 00000000000..f722b9ad2a9
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.dg/torture/pr96130.c
> +@@ -0,0 +1,26 @@
> ++/* PR ipa/96130 */
> ++/* { dg-do compile } */
> ++
> ++struct S { unsigned j : 3; };
> ++int k, l, m;
> ++
> ++void
> ++foo (struct S x)
> ++{
> ++  while (l != 5)
> ++    switch (x.j)
> ++      {
> ++      case 1:
> ++      case 3:
> ++      case 4:
> ++      case 6:
> ++      case 2:
> ++      case 5:
> ++      l = m;
> ++      case 7:
> ++      case 0:
> ++      k = 0;
> ++      default:
> ++      break;
> ++      }
> ++}
> +--
> +2.18.4
> +
> --
> 2.27.0
>
> 
