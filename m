Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38CBC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 11:45:30 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.19402.1717501526959869029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 04:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=JIOhEI8F;
 spf=pass (domain: snapchat.com, ip: 209.85.218.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a68f1017170so96338766b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 04:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717501525; x=1718106325; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YXQ1BoiwmJdzW5t/8L4mzD+AnAS1r9+yvVR3Pc+87Qg=;
        b=JIOhEI8F2zZEleyQ+vlF1TxdFzaFMpCkEs7ejHB+uT+8oikmgM7B2HlKvzZahMzlnK
         Xp22CNr5/4ArMycUGWZxWpsXrQQxXCSbQVtq8IuogM7wHgWmNKJ17mkE+vB+B3HO1TwY
         kbwkKjrMYVQqw69y/IROE98FsC+/WCh41BvUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717501525; x=1718106325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXQ1BoiwmJdzW5t/8L4mzD+AnAS1r9+yvVR3Pc+87Qg=;
        b=gx/x21w9ez5X7tcDNp08qOQYDANCqXyJsGdSbanaKpXbTO7wNY1Y8gZH8ucfhDkHKu
         BOUTXxxNa/UhkEdY6skuIAT9oyARh7NFIQVhpqeMvm45yRdPiSfJIn5C6KIek20t+CQp
         s0XplwByYa3DhL3ZwIikWNkZE7GM+nz9IeUkrR2uKIMznmexWH7ND1hafPy1eTejQHOK
         v/orUAXtyIWm4uZ7HfqVC5+KgwyuWMkCtwHaPlKmxHI5rVfBmYhJUfZUnqhyywxzT/6E
         3Ic8eJD7o8/nIPB1QFnV5gcoswabRY4QSQSQPrP4WuKJILcfUF2n7OWKLbFQBSMliXK4
         8svw==
X-Gm-Message-State: AOJu0YyMOSHfYlTdAD5tCD2iX/Nfi/FExpftvt0lb93UoFw9qzNFWxIR
	IeHjvA+3doFnkBt+t6VZsjpMq/03nml6ppAL6qwVd+2U4d2ciIkKdRtKqyTCp2Cebrd1MidX9RW
	ow7bnQS5YHB0LLzxdi6430d9M4oat8rsNOrsITRHD5jMgfBHF
X-Google-Smtp-Source: AGHT+IFrWI2aY9r9g4J6OHo8EVaUVjD9uoX3vYYgFLAK0S59kjy/t+1rh1kqBez6MO3tfd0AcUpfABSdmj/ulMwr9CA=
X-Received: by 2002:a17:906:6046:b0:a64:3518:f904 with SMTP id
 a640c23a62f3a-a681fe4e25emr777971266b.7.1717501525211; Tue, 04 Jun 2024
 04:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240529100853.1162640-1-ecordonnier@snap.com>
 <80be0806edba87cb67f7f5711fb9c83516fb860d.camel@linuxfoundation.org>
 <17D44D900E0F42D1.15404@lists.openembedded.org> <CAHUKmYY53BOSRdFvxwsTeDOXfurLbvJ9yS6by-K4mR1OshvFRg@mail.gmail.com>
 <17D5840BB429ED6B.21428@lists.openembedded.org> <efb2d0c37c60615dd0dc6bb2b71b3d8f8dfa98b7.camel@linuxfoundation.org>
In-Reply-To: <efb2d0c37c60615dd0dc6bb2b71b3d8f8dfa98b7.camel@linuxfoundation.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 4 Jun 2024 13:45:14 +0200
Message-ID: <CAHUKmYa1kyhrJQ8C3o9zyx15FvjzxdBs5D=4GUU-33T7v53NSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: fix regression in minidebuginfo test
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004ff28c061a0efce9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 11:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200327

--0000000000004ff28c061a0efce9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Richard, this is helpful.
This shows that test_systemd_coredump_minidebuginfo is skipped / not
executed, so I'm quite sure the test is still failing in CI as you had
reported in December. I've sent a patch to fix what I think is causing the
CI issue, and another patch to enable the feature in poky-altcfg once the
CI failure is fixed.

=C3=89tienne

On Mon, Jun 3, 2024 at 4:28=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2024-06-03 at 15:13 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Mon, 2024-06-03 at 13:35 +0200, Etienne Cordonnier wrote:
> > > Hi Richard,
> > > thanks for merging the v2 of this patch. Is this test running in CI
> > > currently? I'm thinking I could send a PR to enable minidebuginfo
> > > in
> > > poky-altcfg, but is there a way I can verify that this test works
> > > in
> > > yocto's CI? (it works locally, but as I mentioned it would fail on
> > > a
> > > kernel with CONFIG_USER_NS disabled.)
> >
> > I'd have expected it to be tested in CI, yes.
> >
> > You can see results here for example:
> >
> >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_yocto-2Dtestresults_tree_runtime_poky-2Daltcfg_qemux86-2D64_core-2Dimage=
-2Dsato-2Dsdk_testresults.json&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabg=
GkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DVT5mIgXA=
iw0SxyBc46dQyS_ECUHBzZ6-efmyplXXwC7bFU6wHrv6BRxih0bgXf-O&s=3DfxG471cE71Up_h=
9_5zn5AMCspSvX9vZwR-_3lGUEQxc&e=3D
>
> Being more specific, there are minidebuginfo tests here:
>
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_poky_tree_meta_lib_oeqa_selftest_cases_minidebuginfo.py&d=3DDwIFaQ&c=3Dn=
cDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DU=
LJTKUkSGa66m67E&m=3DVT5mIgXAiw0SxyBc46dQyS_ECUHBzZ6-efmyplXXwC7bFU6wHrv6BRx=
ih0bgXf-O&s=3DrBKJ_kiFzQzdclkgzStD5LO90KUAh_xjZmZzYCmy4Mc&e=3D
>
> with test results here:
>
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_yocto-2Dtestresults_tree_oeselftest_testresults.json&d=3DDwIFaQ&c=3DncDT=
mphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJT=
KUkSGa66m67E&m=3DVT5mIgXAiw0SxyBc46dQyS_ECUHBzZ6-efmyplXXwC7bFU6wHrv6BRxih0=
bgXf-O&s=3DkvjEIBBwJ6pnlJEHyyAg_Fzemajwma8z2SVR_mHja0g&e=3D
>
> but that is a larger json file.
>
> Cheers,
>
> Richard
>
>

--0000000000004ff28c061a0efce9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Richard, this is helpful.<br>This shows that=C2=A0t=
est_systemd_coredump_minidebuginfo is skipped / not executed, so I&#39;m qu=
ite sure the test is still failing in CI as you had reported in December. I=
&#39;ve sent a patch to fix what I think is causing the CI issue, and anoth=
er patch to enable the feature in poky-altcfg once the CI failure is fixed.=
<br><br>=C3=89tienne=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Jun 3, 2024 at 4:28=E2=80=AFPM Richard Pu=
rdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Mon, 2024-06-03 at 15:13 +0100, =
Richard Purdie via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Mon, 2024-06-03 at 13:35 +0200, Etienne Cordonnier wrote:<br>
&gt; &gt; Hi Richard,<br>
&gt; &gt; thanks for merging the v2 of this patch. Is this test running in =
CI<br>
&gt; &gt; currently? I&#39;m thinking I could send a PR to enable minidebug=
info<br>
&gt; &gt; in<br>
&gt; &gt; poky-altcfg, but is there a way I can verify that this test works=
<br>
&gt; &gt; in<br>
&gt; &gt; yocto&#39;s=C2=A0CI? (it works locally, but as I mentioned it wou=
ld fail on<br>
&gt; &gt; a<br>
&gt; &gt; kernel with CONFIG_USER_NS disabled.)<br>
&gt; <br>
&gt; I&#39;d have expected it to be tested in CI, yes.<br>
&gt; <br>
&gt; You can see results here for example:<br>
&gt; <br>
&gt; <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.=
yoctoproject.org_yocto-2Dtestresults_tree_runtime_poky-2Daltcfg_qemux86-2D6=
4_core-2Dimage-2Dsato-2Dsdk_testresults.json&amp;d=3DDwIFaQ&amp;c=3DncDTmph=
kJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJ=
TKUkSGa66m67E&amp;m=3DVT5mIgXAiw0SxyBc46dQyS_ECUHBzZ6-efmyplXXwC7bFU6wHrv6B=
Rxih0bgXf-O&amp;s=3DfxG471cE71Up_h9_5zn5AMCspSvX9vZwR-_3lGUEQxc&amp;e=3D" r=
el=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/ur=
l?u=3Dhttps-3A__git.yoctoproject.org_yocto-2Dtestresults_tree_runtime_poky-=
2Daltcfg_qemux86-2D64_core-2Dimage-2Dsato-2Dsdk_testresults.json&amp;d=3DDw=
IFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuM=
IGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVT5mIgXAiw0SxyBc46dQyS_ECUHBzZ6-e=
fmyplXXwC7bFU6wHrv6BRxih0bgXf-O&amp;s=3DfxG471cE71Up_h9_5zn5AMCspSvX9vZwR-_=
3lGUEQxc&amp;e=3D</a> <br>
<br>
Being more specific, there are minidebuginfo tests here:<br>
<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yocto=
project.org_poky_tree_meta_lib_oeqa_selftest_cases_minidebuginfo.py&amp;d=
=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbN=
onVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVT5mIgXAiw0SxyBc46dQyS_ECUHB=
zZ6-efmyplXXwC7bFU6wHrv6BRxih0bgXf-O&amp;s=3DrBKJ_kiFzQzdclkgzStD5LO90KUAh_=
xjZmZzYCmy4Mc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldef=
ense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_poky_tree_met=
a_lib_oeqa_selftest_cases_minidebuginfo.py&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJ=
TvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTK=
UkSGa66m67E&amp;m=3DVT5mIgXAiw0SxyBc46dQyS_ECUHBzZ6-efmyplXXwC7bFU6wHrv6BRx=
ih0bgXf-O&amp;s=3DrBKJ_kiFzQzdclkgzStD5LO90KUAh_xjZmZzYCmy4Mc&amp;e=3D</a> =
<br>
<br>
with test results here:<br>
<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yocto=
project.org_yocto-2Dtestresults_tree_oeselftest_testresults.json&amp;d=3DDw=
IFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuM=
IGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVT5mIgXAiw0SxyBc46dQyS_ECUHBzZ6-e=
fmyplXXwC7bFU6wHrv6BRxih0bgXf-O&amp;s=3DkvjEIBBwJ6pnlJEHyyAg_Fzemajwma8z2SV=
R_mHja0g&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.=
proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_yocto-2Dtestresult=
s_tree_oeselftest_testresults.json&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m=
67E&amp;m=3DVT5mIgXAiw0SxyBc46dQyS_ECUHBzZ6-efmyplXXwC7bFU6wHrv6BRxih0bgXf-=
O&amp;s=3DkvjEIBBwJ6pnlJEHyyAg_Fzemajwma8z2SVR_mHja0g&amp;e=3D</a> <br>
<br>
but that is a larger json file.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--0000000000004ff28c061a0efce9--

