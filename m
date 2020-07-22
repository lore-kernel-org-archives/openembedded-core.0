Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.28943.1595451461266982285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 13:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iZFFrO3N;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id t7so1662648qvl.8
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 13:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L4wkwavwoHTRN1QwFKYT4grx1ErEXHVck2AqLAP8aYU=;
        b=iZFFrO3N7/dvOe4By0tGSq66VHegmARmeCPc0uxr83z7cwdw7EZpqKf1YaQ4wywDvL
         DbhEb24mPynZCEjudmy3m91F3Y3cBTsFizCBmGAvKNlIkcLYe6t6xclqwpsboLhciPOT
         mo4JOvg1m4uvM5EczThziQcJjatFQq/6p8TalVPUBsBvYpSu4fNGyvAjq1Z7epXDq5Gp
         PLHymYTlq9g62BD+GYAMmQClxmghUGJawiFu1rHr/EwIq5Me9INsCtqBL7mu47QBIY7F
         vu2UpGWxQTdMoLaxW3HvFJx+LIpd0iugXi8uKwVMzYA5T4Tf68S60hTbWD5SYPSt6Lpt
         i94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L4wkwavwoHTRN1QwFKYT4grx1ErEXHVck2AqLAP8aYU=;
        b=A4sAN+FBOSTz76QCdkPR/mPOYoYQQLasvExkSX742kWmD0kKpCsVj4imQO4UwXPFIp
         HZt+lZrQ5mYxwIbF9VEfRnh9U3vxkaw3/P88J588UcZ56oaFYYaVBa3cXQUUXgCw6jnO
         3Kw+nSgWtHThDrljn0VvFsi5ogRhaMpJVOWMUG0IeV/u9JlSp3DwlR/lFpuvdxNPnF2a
         mYL3B27lXU6mUIHHrV9AnUi42LDPGjA9iv386Y9uBkgC21OwsqE1Ef+h4kI/+HlG1an9
         P6JdWKlGBcPr8oy0C9ydlzD6+n8UIQn7EsGnI+UrKkr5NJxjJNJOR08SALmg+uBRT4nM
         cc/Q==
X-Gm-Message-State: AOAM530K23TZd7lxKpV7x8hIDAGzNvg/w52MzFsBcPxdF9ReayhDQysn
	cOzRHceakKkcb2wTMB5Y7OLdvxu90Gmk2L4dybE=
X-Google-Smtp-Source: ABdhPJwgqNagzu7AkG0iyUc/aZxlNMvlH20kARntOW6d1ARTUGvP1KI9cnOr87S3sorcCH4zn5F6AnBNZVZxrV7U0Cs=
X-Received: by 2002:a0c:f385:: with SMTP id i5mr1927514qvk.4.1595451460280;
 Wed, 22 Jul 2020 13:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200716223635.3349898-1-dbaryshkov@gmail.com> <CAP71Wjxxayo+hMD_EaJPOXVNgSYKyz60N84Rz36=CN-X5Z9d+w@mail.gmail.com>
In-Reply-To: <CAP71Wjxxayo+hMD_EaJPOXVNgSYKyz60N84Rz36=CN-X5Z9d+w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 22 Jul 2020 13:57:14 -0700
Message-ID: <CAMKF1sp7bHOhOxOMbT08_R=u6=rW7qP0S63bKC65xEFfKjWB2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc-10.1: add fix for PR 96130
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

I am fine with this fix backported to master and perhaps dunfell too.

On Wed, Jul 22, 2020 at 4:08 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> Khem, Richard,
>
> On Fri, Jul 17, 2020 at 12:36 AM Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> >
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Fix for https://gcc.gnu.org/bugzilla/show_bug.cgi?id=96130 causing ICE
> > (SegFault) when compiling current Mesa git tree.
>
> This fixes the build issue reported when trying to build mesa master
> branch, see:
> https://github.com/ndechesne/meta-qcom/pull/174
>
> While we aren't using mesa/master in OE core, some BSP layer might be
> doing that. If mesa gets released before gcc, we might hit this issue.
> The gcc is queued for 10.2 already. If we can't get this patch in OE
> core, we will host in our layer..
>
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  meta/recipes-devtools/gcc/gcc-10.1.inc        |   1 +
> >  .../gcc/gcc-10.1/pr96130.patch                | 106 ++++++++++++++++++
> >  2 files changed, 107 insertions(+)
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-10.1.inc b/meta/recipes-devtools/gcc/gcc-10.1.inc
> > index a3de91a2c6a3..a2dd2ae252a5 100644
> > --- a/meta/recipes-devtools/gcc/gcc-10.1.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-10.1.inc
> > @@ -66,6 +66,7 @@ SRC_URI = "\
> >             file://0036-Enable-CET-in-cross-compiler-if-possible.patch \
> >             file://0037-mingw32-Enable-operation_not_supported.patch \
> >             file://0038-libatomic-Do-not-enforce-march-on-aarch64.patch \
> > +           file://pr96130.patch \
> >  "
> >  SRC_URI[sha256sum] = "b6898a23844b656f1b68691c5c012036c2e694ac4b53a8918d4712ad876e7ea2"
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch b/meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch
> > new file mode 100644
> > index 000000000000..f0e6f85e22f9
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch
> > @@ -0,0 +1,106 @@
> > +From 0d03c0ee5213703ec6d9ffa632fa5298d83adaaa Mon Sep 17 00:00:00 2001
> > +From: Jakub Jelinek <jakub@redhat.com>
> > +Date: Mon, 13 Jul 2020 18:25:53 +0200
> > +Subject: [PATCH] ipa-fnsummary: Fix ICE with switch predicates [PR96130]
> > +
> > +The following testcase ICEs since r10-3199.
> > +There is a switch with default label, where the controlling expression has
> > +range just 0..7 and there are case labels for all those 8 values, but
> > +nothing has yet optimized away the default.
> > +Since r10-3199, set_switch_stmt_execution_predicate sets the switch to
> > +default label's edge's predicate to a false predicate and then
> > +compute_bb_predicates propagates the predicates through the cfg, but false
> > +predicates aren't really added.  The caller of compute_bb_predicates
> > +in one place handles NULL bb->aux as false predicate:
> > +      if (fbi.info)
> > +       {
> > +         if (bb->aux)
> > +           bb_predicate = *(predicate *) bb->aux;
> > +         else
> > +           bb_predicate = false;
> > +       }
> > +      else
> > +       bb_predicate = true;
> > +but then in two further spots that the patch below is changing
> > +it assumes bb->aux must be non-NULL.  Those two spots are guarded by a
> > +condition that is only true if fbi.info is non-NULL, so I think the right
> > +fix is to treat NULL aux as false predicate in those spots too.
> > +
> > +2020-07-13  Jakub Jelinek  <jakub@redhat.com>
> > +
> > +       PR ipa/96130
> > +       * ipa-fnsummary.c (analyze_function_body): Treat NULL bb->aux
> > +       as false predicate.
> > +
> > +       * gcc.dg/torture/pr96130.c: New test.
> > +
> > +(cherry picked from commit 776e48e0931db69f158f40e5cb8e15463d879a42)
> > +---
> > + gcc/ipa-fnsummary.c                    | 10 ++++++++--
> > + gcc/testsuite/gcc.dg/torture/pr96130.c | 26 ++++++++++++++++++++++++++
> > + 2 files changed, 34 insertions(+), 2 deletions(-)
> > + create mode 100644 gcc/testsuite/gcc.dg/torture/pr96130.c
> > +
> > +diff --git a/gcc/ipa-fnsummary.c b/gcc/ipa-fnsummary.c
> > +index 045a0ecf766..55a0b272a96 100644
> > +--- a/gcc/ipa-fnsummary.c
> > ++++ b/gcc/ipa-fnsummary.c
> > +@@ -2766,7 +2766,10 @@ analyze_function_body (struct cgraph_node *node, bool early)
> > +         edge ex;
> > +         unsigned int j;
> > +         class tree_niter_desc niter_desc;
> > +-        bb_predicate = *(predicate *) loop->header->aux;
> > ++        if (loop->header->aux)
> > ++          bb_predicate = *(predicate *) loop->header->aux;
> > ++        else
> > ++          bb_predicate = false;
> > +
> > +         exits = get_loop_exit_edges (loop);
> > +         FOR_EACH_VEC_ELT (exits, j, ex)
> > +@@ -2799,7 +2802,10 @@ analyze_function_body (struct cgraph_node *node, bool early)
> > +         for (unsigned i = 0; i < loop->num_nodes; i++)
> > +           {
> > +             gimple_stmt_iterator gsi;
> > +-            bb_predicate = *(predicate *) body[i]->aux;
> > ++            if (body[i]->aux)
> > ++              bb_predicate = *(predicate *) body[i]->aux;
> > ++            else
> > ++              bb_predicate = false;
> > +             for (gsi = gsi_start_bb (body[i]); !gsi_end_p (gsi);
> > +                  gsi_next (&gsi))
> > +               {
> > +diff --git a/gcc/testsuite/gcc.dg/torture/pr96130.c b/gcc/testsuite/gcc.dg/torture/pr96130.c
> > +new file mode 100644
> > +index 00000000000..f722b9ad2a9
> > +--- /dev/null
> > ++++ b/gcc/testsuite/gcc.dg/torture/pr96130.c
> > +@@ -0,0 +1,26 @@
> > ++/* PR ipa/96130 */
> > ++/* { dg-do compile } */
> > ++
> > ++struct S { unsigned j : 3; };
> > ++int k, l, m;
> > ++
> > ++void
> > ++foo (struct S x)
> > ++{
> > ++  while (l != 5)
> > ++    switch (x.j)
> > ++      {
> > ++      case 1:
> > ++      case 3:
> > ++      case 4:
> > ++      case 6:
> > ++      case 2:
> > ++      case 5:
> > ++      l = m;
> > ++      case 7:
> > ++      case 0:
> > ++      k = 0;
> > ++      default:
> > ++      break;
> > ++      }
> > ++}
> > +--
> > +2.18.4
> > +
> > --
> > 2.27.0
> >
> > 
