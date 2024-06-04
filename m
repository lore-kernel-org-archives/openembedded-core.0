Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F2FC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 11:59:00 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.19383.1717502338399558762
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 04:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=QZDx41Gy;
 spf=pass (domain: snapchat.com, ip: 209.85.208.170, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eaa80cb4d3so48396291fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 04:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717502336; x=1718107136; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6zXRrbnwUUGcCKuQaVowv5Q2KLLM17OiRsPVLle4s6s=;
        b=QZDx41GysubFIT7cG1flrlZ5NJDQJ/cxx5hdNOu0GdhOV6/lGDgyCKwGDK+33qW5Sj
         TBO3mt8/UdVkBvXfBbVGgwpUn4jtR6L8pVD9XI+DkxbD0h7W319fYeGEvLEUuchtmvaA
         W1wM5NdqlVDRjR6HUn//vDEKlgIzXDnoSRWRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717502336; x=1718107136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6zXRrbnwUUGcCKuQaVowv5Q2KLLM17OiRsPVLle4s6s=;
        b=sTDB3u06b6NlIHCMZA8uiITGpozKWmp2MwWEaYxRN0w7bwkSFXrSsomy1SosAqCFHe
         oL7tU5TQl382PF/2ALlb979w3mhJkPIhYvBLyP4UqmV9dbdKnJbZHTBGfmGaro/nUIpZ
         ilupTGPMFMEpqqg0AM4mD27fsX+3ituBgyEBkVFg9IS5oEBTCkc2hlu5bZb99Ie24OvF
         frMvEc4uQ7nPuPTuFrrekdVJS29MdcG/yUaSgoFIugeyaPrv7kbMZasOhqRyEWyyv9PG
         r7Tczj5cNnvg5Kk7gzEZInsk87HlwLA7VxWyA2N7MdLlY/wB6TSB+vj3GbeK2ausId7r
         J63w==
X-Gm-Message-State: AOJu0YyNsibe4azK/rqjleeV+ORcRfO03jvc6m+jZ829tE8LbsM6U86h
	Bd+nfD2bkGqQAez0S6Ed4/WbnW6sIjB7QmzBRMON+JCDjkQwtt9aIKXJc7GqUANpayoXnccoztM
	r2EYJMlcKKdGssUDPiABl3IJ/QxyTmsTU/o5FhdfoAUhSNRc3SAY=
X-Google-Smtp-Source: AGHT+IEtl04a5EmO7kbbzpcsKtvmt1wnF8Wdz3NOeVqm5A+H0LnmM01ULQXn0XhriWFWDUqzqw0pkZyqJ2woLmzKt/s=
X-Received: by 2002:a2e:9f05:0:b0:2ea:91c1:f3d5 with SMTP id
 38308e7fff4ca-2ea9510e39cmr92178131fa.15.1717502336298; Tue, 04 Jun 2024
 04:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240529100853.1162640-1-ecordonnier@snap.com>
 <80be0806edba87cb67f7f5711fb9c83516fb860d.camel@linuxfoundation.org>
 <17D44D900E0F42D1.15404@lists.openembedded.org> <CAHUKmYY53BOSRdFvxwsTeDOXfurLbvJ9yS6by-K4mR1OshvFRg@mail.gmail.com>
 <17D5840BB429ED6B.21428@lists.openembedded.org> <efb2d0c37c60615dd0dc6bb2b71b3d8f8dfa98b7.camel@linuxfoundation.org>
 <CAHUKmYa1kyhrJQ8C3o9zyx15FvjzxdBs5D=4GUU-33T7v53NSA@mail.gmail.com> <57260bcac841a038fc1e0af5dad1d66f28dd111c.camel@linuxfoundation.org>
In-Reply-To: <57260bcac841a038fc1e0af5dad1d66f28dd111c.camel@linuxfoundation.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 4 Jun 2024 13:58:44 +0200
Message-ID: <CAHUKmYbGNATvoBq2pUFbvOF_HK922onqQctMn444_9Jaz1XxaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: fix regression in minidebuginfo test
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a85264061a0f2c44"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 11:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200329

--000000000000a85264061a0f2c44
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm talking specifically about test_systemd_coredump_minidebuginfo (the
minidebuginfo test which I wrote in meta/lib/oeqa/runtime/cases/systemd.py,
not the tests in meta/lib/oeqa/selftest/cases/minidebuginfo.py).

=C3=89tienne

On Tue, Jun 4, 2024 at 1:56=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2024-06-04 at 13:45 +0200, Etienne Cordonnier wrote:
> > Thanks Richard, this is helpful.
> > This shows that test_systemd_coredump_minidebuginfo is skipped / not
> > executed, so I'm quite sure the test is still failing in CI as you
> > had reported in December. I've sent a patch to fix what I think is
> > causing the CI issue, and another patch to enable the feature in
> > poky-altcfg once the CI failure is fixed.
>
> I think it is being tested. There is this test:
>
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_poky_tree_meta_lib_oeqa_selftest_cases_minidebuginfo.py&d=3DDwIFaQ&c=3Dn=
cDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DU=
LJTKUkSGa66m67E&m=3D3LHd-W_iTYnP8P40BAL8-r4JdqCery51l_QUwjUomCUCwtluWLU6LhJ=
f_b7DoH6Y&s=3Di7GSqs0NbXHgfofD0OVBT7Vn7ofzIzlRvW91KAVDDBI&e=3D
>
> which is run with oe-selftest -r minidebuginfo
>
> which generates results here:
>
>
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_yocto-2Dtestresults_tree_oeselftest_testresults.json&d=3DDwIFaQ&c=3DncDT=
mphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJT=
KUkSGa66m67E&m=3D3LHd-W_iTYnP8P40BAL8-r4JdqCery51l_QUwjUomCUCwtluWLU6LhJf_b=
7DoH6Y&s=3DwGnnzbHed5xpJ4j1BjBdN0lpjhd5E3d1MrDS59kZVT0&e=3D
>
> e.g.:
>
>             "minidebuginfo.Minidebuginfo.test_minidebuginfo": {
>                 "duration": 1073.8962650299072,
>                 "status": "PASSED"
>             },
>
>             "minidebuginfo.Minidebuginfo.test_minidebuginfo": {
>                 "duration": 764.4718866348267,
>                 "status": "PASSED"
>             },
>
> so I think it is being tested in each oe-selftest run (hence the
> multiple results)?
>
> Cheers,
>
> Richard
>
>

--000000000000a85264061a0f2c44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m talking specifically about=C2=A0test_systemd_cored=
ump_minidebuginfo (the minidebuginfo test which I wrote in=C2=A0meta/lib/oe=
qa/runtime/cases/systemd.py, not the tests in=C2=A0meta/lib/oeqa/selftest/c=
ases/minidebuginfo.py).<br><br>=C3=89tienne</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 4, 2024 at 1:56=E2=
=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Tue, 2024-06-04 at 13:45 +0200,=
 Etienne Cordonnier wrote:<br>
&gt; Thanks Richard, this is helpful.<br>
&gt; This shows that=C2=A0test_systemd_coredump_minidebuginfo is skipped / =
not<br>
&gt; executed, so I&#39;m quite sure the test is still failing in CI as you=
<br>
&gt; had reported in December. I&#39;ve sent a patch to fix what I think is=
<br>
&gt; causing the CI issue, and another patch to enable the feature in<br>
&gt; poky-altcfg once the CI failure is fixed.<br>
<br>
I think it is being tested. There is this test:<br>
<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yocto=
project.org_poky_tree_meta_lib_oeqa_selftest_cases_minidebuginfo.py&amp;d=
=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbN=
onVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D3LHd-W_iTYnP8P40BAL8-r4JdqCe=
ry51l_QUwjUomCUCwtluWLU6LhJf_b7DoH6Y&amp;s=3Di7GSqs0NbXHgfofD0OVBT7Vn7ofzIz=
lRvW91KAVDDBI&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldef=
ense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_poky_tree_met=
a_lib_oeqa_selftest_cases_minidebuginfo.py&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJ=
TvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTK=
UkSGa66m67E&amp;m=3D3LHd-W_iTYnP8P40BAL8-r4JdqCery51l_QUwjUomCUCwtluWLU6LhJ=
f_b7DoH6Y&amp;s=3Di7GSqs0NbXHgfofD0OVBT7Vn7ofzIzlRvW91KAVDDBI&amp;e=3D</a> =
<br>
<br>
which is run with oe-selftest -r minidebuginfo<br>
<br>
which generates results here:<br>
<br>
<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yocto=
project.org_yocto-2Dtestresults_tree_oeselftest_testresults.json&amp;d=3DDw=
IFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuM=
IGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D3LHd-W_iTYnP8P40BAL8-r4JdqCery51l=
_QUwjUomCUCwtluWLU6LhJf_b7DoH6Y&amp;s=3DwGnnzbHed5xpJ4j1BjBdN0lpjhd5E3d1MrD=
S59kZVT0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.=
proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_yocto-2Dtestresult=
s_tree_oeselftest_testresults.json&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m=
67E&amp;m=3D3LHd-W_iTYnP8P40BAL8-r4JdqCery51l_QUwjUomCUCwtluWLU6LhJf_b7DoH6=
Y&amp;s=3DwGnnzbHed5xpJ4j1BjBdN0lpjhd5E3d1MrDS59kZVT0&amp;e=3D</a> <br>
<br>
e.g.:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;minidebuginfo.Minidebuginfo=
.test_minidebuginfo&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;duration&quot=
;: 1073.8962650299072,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;status&quot;:=
 &quot;PASSED&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;minidebuginfo.Minidebuginfo=
.test_minidebuginfo&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;duration&quot=
;: 764.4718866348267,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;status&quot;:=
 &quot;PASSED&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
<br>
so I think it is being tested in each oe-selftest run (hence the<br>
multiple results)?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000a85264061a0f2c44--

