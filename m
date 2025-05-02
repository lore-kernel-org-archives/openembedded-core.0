Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050B0C3ABA3
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 10:34:28 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.15827.1746182060777934403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 03:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XUH3lhhX;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: rwmacleod@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso2098866b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 03:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746182060; x=1746786860; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Dia42evnbtGvAzCyHceTbpW8s6PPUX/SfNvZpxnF9w=;
        b=XUH3lhhXV+FTNd93XADuoxJ7wtpdkfixS6RTUUZDN21iOSFPqVy/wKlhCwIA/H3PKO
         Xd2pSGK4ITXV11vrc0tI3GZwDrKcKKneSfNmOYyOWSWXZCWvlBPyqZtkL58dLDjI/f6i
         9IPd9uiTfFOgfaZrWzeOi3gnIIqbzCHwuk+ajoDfM3/TkX2M/3zVJFLfKXMup/oycPf3
         NU1PhwVCFRCTIY2tJrBOg7+HFE8JEwdhy7HP/Zf/fY3L+AM7vDjp7bHJDWrn/JUyq7Ld
         a8iBzG9X8GuFrGFYI+3owS1tA6JThv+g5I85KMj2uQOQhBnFkQ4ifE1ERJCo8ekIcVOY
         FpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746182060; x=1746786860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Dia42evnbtGvAzCyHceTbpW8s6PPUX/SfNvZpxnF9w=;
        b=EpF8SUeL6E72DKfceZGajTiPubRsGXgqxbHyx1/gOHTp1Q9Hy8s6d/83LIrCoS4I/l
         8ebjBB0V+RNIBfgbbTHiwYIywPoPLs4deZXsyKu+rqUNkCPOaXbAHlEHTGGLATwsxrdk
         Z8SZecdpLNiBU6auf2Li0hNo4dH6jU6dM7E8YzpUJJuS7h3qzpvEVzQlyKu7Xe06iR1O
         BTi0zv8ROVFgNrOFunptTkp4mHQ8pJ7yvlwJdzRhpZGlrERq1FrTiY1LsANWuKEf9Fmw
         3KT7UOTKexawIeIG3lQtDx+ruIIKxL0kwaefLqJJi3+7e4ixYc8cjLIMrcTQYtTYkdlw
         /b8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRS/90Zjpq3OTAbalQOgF1PLUcsTrqhMmhrm9W3nxPkxMcpMVI+blcdl/lQ7Vim3QD2OYGXe+9qI/QADdRtBgzzQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxfXfAvwazIOpd5tFGMFQnodNlR/PRekW+5iE6trYQiaOLdVC7f
	XcPE7YRuZMCAP0sSvpYmJKcI8acV9opLcDJFYs9tad89G2bd2OtXUtZuqUYUHRmtDZuKvivC5kQ
	B2azhwD0m65Gj03y1jQAuw7F0SHw=
X-Gm-Gg: ASbGncvlxeD1EFW3+74yzqFvtOQirQjd7xgwU+GFq33LvaEeJ/unSh0XscAqNXI3GAw
	3Yfh6lNVnWsxYrzhIy1/Zkx1+m14aSh7oG+pZShoFd/pNdKwxfUnH041DBxg9DsuXPGeHyErLmR
	18SibsYyULuyQ3B0tKQ4+PVls=
X-Google-Smtp-Source: AGHT+IFMpQuDqtVrdNpbflqRvc6Cw/+H5oujrWy6QPxg6D9gPEQ5pdvg3crCQ2sy+Tq0dqot+XjqpxFNBiWgpYqd8h8=
X-Received: by 2002:a17:90b:2dcc:b0:2ff:7ad4:77b1 with SMTP id
 98e67ed59e1d1-30a4e55f498mr4146027a91.2.1746182059801; Fri, 02 May 2025
 03:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250501030313.638148-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1soiQ=bmtZwHLLZ4OAEHA=8r04mQ0ATyFmcCaZmy27tXVQ@mail.gmail.com>
 <c887b509-4283-4488-8e82-8ba35ca99678@windriver.com> <CAMKF1srKGQAWrGhw-g9ZNtgNvNyUKfT2iSbs30FQQMOAnoD2UQ@mail.gmail.com>
In-Reply-To: <CAMKF1srKGQAWrGhw-g9ZNtgNvNyUKfT2iSbs30FQQMOAnoD2UQ@mail.gmail.com>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Fri, 2 May 2025 06:34:09 -0400
X-Gm-Features: ATxdqUGmU_GKREbkploMYiVxzCdu0ukeD_BcWSjy6IdwKaFy38BrnANzlz4F1O4
Message-ID: <CAK6=ix6W7BiMLD=nGQTRTXSPn4pi_jAYRRFFVADOsf_MYoDMNg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
To: raj.khem@gmail.com
Cc: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>, 
	openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="000000000000633fb7063424b134"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 10:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215906

--000000000000633fb7063424b134
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Deepesh, please fix the labeling error and send a v2.

Randy

On Thu, May 1, 2025, 23:26 Khem Raj via lists.openembedded.org <raj.khem=3D
gmail.com@lists.openembedded.org> wrote:

> On Thu, May 1, 2025 at 8:15=E2=80=AFPM Deepesh Varatharajan
> <deepesh.varatharajan@windriver.com> wrote:
> >
> >
> > On 01-05-2025 11:24, Khem Raj wrote:
> > > CAUTION: This email comes from a non Wind River email account!
> > > Do not click links or open attachments unless you recognize the sende=
r
> and know the content is safe.
> > >
> > > On Wed, Apr 30, 2025 at 8:03=E2=80=AFPM Varatharajan, Deepesh via
> > > lists.openembedded.org
> > > <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
> > >> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> > >>
> > >> 3463100f2d x86: Detect Intel Diamond Rapids
> > >> e09436c2cb x86: Handle unknown Intel processor with default tuning
> > >> 7620d98186 x86: Add ARL/PTL/CWF model detection support
> > >> 765ff3d0d4 x86: Optimize xstate size calculation
> > >> 65ae73be01 x86: Use `Avoid_Non_Temporal_Memset` to control
> non-temporal path
> > >> 2be36448c4 x86: Tunables may incorrectly set
> Prefer_PMINUB_for_stringop (bug 32047)
> > >> bde201e92c x86: Disable non-temporal memset on Skylake Server
> > >> 38a7632f2d x86: Fix value for `x86_memset_non_temporal_threshold`
> when it is undesirable
> > >> cc59fa5dbc x86: Enable non-temporal memset tunable for AMD
> > >> 0da58e8be0 x86: Add seperate non-temporal tunable for memset
> > >> 837a36c371 x86: Link tst-gnu2-tls2-x86-noxsave{,c,xsavec} with
> libpthread
> > >> 87ab0c7f7f x86: Use separate variable for TLSDESC XSAVE/XSAVEC state
> size (bug 32810)
> > >> 60cd7123a6 x86: Skip XSAVE state size reset if ISA level requires
> XSAVE
> > >> 4cf3f9df54 x86_64: Add atanh with FMA
> > >> 01ed435e2e x86_64: Add sinh with FMA
> > >> 0edcc77fe7 x86_64: Add tanh with FMA
> > >> 7ecf0d3bde x86-64: Exclude FMA4 IFUNC functions for -mapxf
> > >> e1fe22368e nptl: clear the whole rseq area before registration
> > >> dd8c0c3bbd math: Improve layout of exp/exp10 data
> > >> a1b09e59e2 AArch64: Use prefer_sve_ifuncs for SVE memset
> > >> d0e2133470 AArch64: Add SVE memset
> > >> 0cc12d9c47 math: Improve layout of expf data
> > >> 0cd10047bf AArch64: Remove zva_128 from memset
> > >> dd1e63ab58 AArch64: Optimize memset
> > >> 65a96a6f2b AArch64: Improve generic strlen
> > >> 4073e4ee2c AArch64: Improve codegen for SVE logs
> > >> 78abd3ef6e AArch64: Improve codegen in SVE tans
> > >> a10183b633 AArch64: Improve codegen of AdvSIMD atan(2)(f)
> > >> dcd1229e5b AArch64: Improve codegen of AdvSIMD logf function family
> > >> 72156cb90b AArch64: Improve codegen in AdvSIMD logs
> > >> 5e354bf4e2 AArch64: Simplify rounding-multiply pattern in several
> AdvSIMD routines
> > >> 80df456112 aarch64: Avoid redundant MOVs in AdvSIMD F32 logs
> > >> d591876303 aarch64: Fix AdvSIMD libmvec routines for big-endian
> > >> f6d48470ae assert: Add test for CVE-2025-0395
> > >>
> > >> Testresults:
> > >> After update    |Before update   |Difference
> > >> PASS: 5068      |PASS: 5072      |PASS: +4
> > > +4 should mean more passes after update but the table shows otherwise=
.
> > > Can you list the 4 tests which are passing now ?
> > Hi Khem,
> >
> > Apologies for the confusion, there was a typo. I mistakenly listed the
> > 'after update'
> > passing test cases under 'before update' and vice versa. The following
> four
> > additional test cases passed after the update:
> >
> > PASS: assert/tst-assert-sa-2025-0001
> > PASS: elf/tst-gnu2-tls2-x86-noxsave
> > PASS: elf/tst-gnu2-tls2-x86-noxsavec
> > PASS: elf/tst-gnu2-tls2-x86-noxsavexsavec
>
> That looks good. Thanks
>
> >
> > Regards,
> > Deepesh
> > >> FAIL: 120       |FAIL: 120       |FAIL: 0
> > >> XPASS: 4        |XPASS: 4        |XPASS: 0
> > >> XFAIL: 16       |XFAIL: 16       |XFAIL: 0
> > >> UNSUPPORTED: 157|UNSUPPORTED: 157|UNSUPPORTED: 0
> > >>
> > >> Signed-off-by: Deepesh Varatharajan <
> Deepesh.Varatharajan@windriver.com>
> > >> ---
> > >>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/meta/recipes-core/glibc/glibc-version.inc
> b/meta/recipes-core/glibc/glibc-version.inc
> > >> index da9227ccca..040fc793b1 100644
> > >> --- a/meta/recipes-core/glibc/glibc-version.inc
> > >> +++ b/meta/recipes-core/glibc/glibc-version.inc
> > >> @@ -1,6 +1,6 @@
> > >>   SRCBRANCH ?=3D "release/2.39/master"
> > >>   PV =3D "2.39+git"
> > >> -SRCREV_glibc ?=3D "662516aca8b6bf6aa6555f471055d5eb512b1ddc"
> > >> +SRCREV_glibc ?=3D "3463100f2d47f2897a24ba8023a5c7aaf2d26550"
> > >>   SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
> > >>
> > >>   GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3D=
https
> "
> > >> --
> > >> 2.43.0
> > >>
> > >>
> > >>
> > >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215905):
> https://lists.openembedded.org/g/openembedded-core/message/215905
> Mute This Topic: https://lists.openembedded.org/mt/112554022/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000633fb7063424b134
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Deepesh, please fix the labeling error and send a v2.</p>
<p dir=3D"ltr">Randy<br>
</p>
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, May 1, 2025, 23:26 Khem Raj via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D=
"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, May 1, 2025 =
at 8:15=E2=80=AFPM Deepesh Varatharajan<br>
&lt;<a href=3D"mailto:deepesh.varatharajan@windriver.com" target=3D"_blank"=
 rel=3D"noreferrer">deepesh.varatharajan@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 01-05-2025 11:24, Khem Raj wrote:<br>
&gt; &gt; CAUTION: This email comes from a non Wind River email account!<br=
>
&gt; &gt; Do not click links or open attachments unless you recognize the s=
ender and know the content is safe.<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Apr 30, 2025 at 8:03=E2=80=AFPM Varatharajan, Deepesh via=
<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noref=
errer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &lt;deepesh.varatharajan=3D<a href=3D"mailto:windriver.com@lists.=
openembedded.org" target=3D"_blank" rel=3D"noreferrer">windriver.com@lists.=
openembedded.org</a>&gt; wrote:<br>
&gt; &gt;&gt; From: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Vara=
tharajan@windriver.com" target=3D"_blank" rel=3D"noreferrer">Deepesh.Varath=
arajan@windriver.com</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 3463100f2d x86: Detect Intel Diamond Rapids<br>
&gt; &gt;&gt; e09436c2cb x86: Handle unknown Intel processor with default t=
uning<br>
&gt; &gt;&gt; 7620d98186 x86: Add ARL/PTL/CWF model detection support<br>
&gt; &gt;&gt; 765ff3d0d4 x86: Optimize xstate size calculation<br>
&gt; &gt;&gt; 65ae73be01 x86: Use `Avoid_Non_Temporal_Memset` to control no=
n-temporal path<br>
&gt; &gt;&gt; 2be36448c4 x86: Tunables may incorrectly set Prefer_PMINUB_fo=
r_stringop (bug 32047)<br>
&gt; &gt;&gt; bde201e92c x86: Disable non-temporal memset on Skylake Server=
<br>
&gt; &gt;&gt; 38a7632f2d x86: Fix value for `x86_memset_non_temporal_thresh=
old` when it is undesirable<br>
&gt; &gt;&gt; cc59fa5dbc x86: Enable non-temporal memset tunable for AMD<br=
>
&gt; &gt;&gt; 0da58e8be0 x86: Add seperate non-temporal tunable for memset<=
br>
&gt; &gt;&gt; 837a36c371 x86: Link tst-gnu2-tls2-x86-noxsave{,c,xsavec} wit=
h libpthread<br>
&gt; &gt;&gt; 87ab0c7f7f x86: Use separate variable for TLSDESC XSAVE/XSAVE=
C state size (bug 32810)<br>
&gt; &gt;&gt; 60cd7123a6 x86: Skip XSAVE state size reset if ISA level requ=
ires XSAVE<br>
&gt; &gt;&gt; 4cf3f9df54 x86_64: Add atanh with FMA<br>
&gt; &gt;&gt; 01ed435e2e x86_64: Add sinh with FMA<br>
&gt; &gt;&gt; 0edcc77fe7 x86_64: Add tanh with FMA<br>
&gt; &gt;&gt; 7ecf0d3bde x86-64: Exclude FMA4 IFUNC functions for -mapxf<br=
>
&gt; &gt;&gt; e1fe22368e nptl: clear the whole rseq area before registratio=
n<br>
&gt; &gt;&gt; dd8c0c3bbd math: Improve layout of exp/exp10 data<br>
&gt; &gt;&gt; a1b09e59e2 AArch64: Use prefer_sve_ifuncs for SVE memset<br>
&gt; &gt;&gt; d0e2133470 AArch64: Add SVE memset<br>
&gt; &gt;&gt; 0cc12d9c47 math: Improve layout of expf data<br>
&gt; &gt;&gt; 0cd10047bf AArch64: Remove zva_128 from memset<br>
&gt; &gt;&gt; dd1e63ab58 AArch64: Optimize memset<br>
&gt; &gt;&gt; 65a96a6f2b AArch64: Improve generic strlen<br>
&gt; &gt;&gt; 4073e4ee2c AArch64: Improve codegen for SVE logs<br>
&gt; &gt;&gt; 78abd3ef6e AArch64: Improve codegen in SVE tans<br>
&gt; &gt;&gt; a10183b633 AArch64: Improve codegen of AdvSIMD atan(2)(f)<br>
&gt; &gt;&gt; dcd1229e5b AArch64: Improve codegen of AdvSIMD logf function =
family<br>
&gt; &gt;&gt; 72156cb90b AArch64: Improve codegen in AdvSIMD logs<br>
&gt; &gt;&gt; 5e354bf4e2 AArch64: Simplify rounding-multiply pattern in sev=
eral AdvSIMD routines<br>
&gt; &gt;&gt; 80df456112 aarch64: Avoid redundant MOVs in AdvSIMD F32 logs<=
br>
&gt; &gt;&gt; d591876303 aarch64: Fix AdvSIMD libmvec routines for big-endi=
an<br>
&gt; &gt;&gt; f6d48470ae assert: Add test for CVE-2025-0395<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Testresults:<br>
&gt; &gt;&gt; After update=C2=A0 =C2=A0 |Before update=C2=A0 =C2=A0|Differe=
nce<br>
&gt; &gt;&gt; PASS: 5068=C2=A0 =C2=A0 =C2=A0 |PASS: 5072=C2=A0 =C2=A0 =C2=
=A0 |PASS: +4<br>
&gt; &gt; +4 should mean more passes after update but the table shows other=
wise.<br>
&gt; &gt; Can you list the 4 tests which are passing now ?<br>
&gt; Hi Khem,<br>
&gt;<br>
&gt; Apologies for the confusion, there was a typo. I mistakenly listed the=
<br>
&gt; &#39;after update&#39;<br>
&gt; passing test cases under &#39;before update&#39; and vice versa. The f=
ollowing four<br>
&gt; additional test cases passed after the update:<br>
&gt;<br>
&gt; PASS: assert/tst-assert-sa-2025-0001<br>
&gt; PASS: elf/tst-gnu2-tls2-x86-noxsave<br>
&gt; PASS: elf/tst-gnu2-tls2-x86-noxsavec<br>
&gt; PASS: elf/tst-gnu2-tls2-x86-noxsavexsavec<br>
<br>
That looks good. Thanks<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Deepesh<br>
&gt; &gt;&gt; FAIL: 120=C2=A0 =C2=A0 =C2=A0 =C2=A0|FAIL: 120=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|FAIL: 0<br>
&gt; &gt;&gt; XPASS: 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 |XPASS: 4=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |XPASS: 0<br>
&gt; &gt;&gt; XFAIL: 16=C2=A0 =C2=A0 =C2=A0 =C2=A0|XFAIL: 16=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|XFAIL: 0<br>
&gt; &gt;&gt; UNSUPPORTED: 157|UNSUPPORTED: 157|UNSUPPORTED: 0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Dee=
pesh.Varatharajan@windriver.com" target=3D"_blank" rel=3D"noreferrer">Deepe=
sh.Varatharajan@windriver.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 =C2=A0meta/recipes-core/glibc/glibc-version.inc | 2 +-<=
br>
&gt; &gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta=
/recipes-core/glibc/glibc-version.inc<br>
&gt; &gt;&gt; index da9227ccca..040fc793b1 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-core/glibc/glibc-version.inc<br>
&gt; &gt;&gt; +++ b/meta/recipes-core/glibc/glibc-version.inc<br>
&gt; &gt;&gt; @@ -1,6 +1,6 @@<br>
&gt; &gt;&gt;=C2=A0 =C2=A0SRCBRANCH ?=3D &quot;release/2.39/master&quot;<br=
>
&gt; &gt;&gt;=C2=A0 =C2=A0PV =3D &quot;2.39+git&quot;<br>
&gt; &gt;&gt; -SRCREV_glibc ?=3D &quot;662516aca8b6bf6aa6555f471055d5eb512b=
1ddc&quot;<br>
&gt; &gt;&gt; +SRCREV_glibc ?=3D &quot;3463100f2d47f2897a24ba8023a5c7aaf2d2=
6550&quot;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0SRCREV_localedef ?=3D &quot;fab74f31b3811df543e24=
b6de47efdf45b538abc&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://=
sourceware.org/git/glibc.git;protocol=3Dhttps" rel=3D"noreferrer noreferrer=
" target=3D"_blank">sourceware.org/git/glibc.git;protocol=3Dhttps</a>&quot;=
<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.43.0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#215905): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/215905" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/215905</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112554022/953=
399" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/112554022/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000633fb7063424b134--

