Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E660C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 17:36:56 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.1002.1678815414631527594
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 10:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h8gZIrSf;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id y14so16828352ljq.4
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678815413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=unoXOrfrQLrYX7tHl/A7F1Q0seasYoV/WHo8MW13koQ=;
        b=h8gZIrSfHowhZW6FXutQOmbVitKi3Vkt2y842YG96ukcH1chqim22FBIniyYwY3hb5
         P9Iwud4/e5ZT3UeCVLkXAq10Q3VtDXt8oxkyQ/hOShyp5H45ov3FKGBQCqf8s0bWB/SK
         QoHX5M2DwFS0IZM/Kuk4jrZNL2T7jSfPM9x6h8wtGKkczEiV5a/g2oTEeXx0q/q4IDNL
         3zRc9Pk99q68+jhC5lSOQbHZuHQPmVw6o8bVnO83ks7BwMwLCCccCB27KRdOt21Q3qzl
         x4SJxnn1ffB1D6dPna/AqVUZfL/CXls8XL+VdV/bRtHJzuyVCU/thhq2ZLvbpv+pYePU
         VMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678815413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unoXOrfrQLrYX7tHl/A7F1Q0seasYoV/WHo8MW13koQ=;
        b=7zjwXqUDIOt50UbAaCZm3AipcOaH2rmvenok0L5v39YQQZaTMOEn7QSKdmRTgdrzX6
         17+wX0APOAx1JYFAxRR2aL2bxROG33ymgP0ZHqaiU3nnIAqcLbjMi02EjCmywhqtWWDH
         Kg/MIInlWQ0A5BcqWutKNuf3NxkFGUAYYZO3VlC6600TxNptYjkLa7ONga41cS/fsUe3
         vYnRdUrIjoKTPjQ7lN8BDuFAq+QH8f3QFq7SGQsIkJOJvUK3g3oQyzx8Rr6UTY32f6He
         7t3+Nfwnus5WMwbHPrYwsWJX91QJVl87uQEO2eE4jxJWGRLRPsrLY2Mc25lZZ/WYipbQ
         EwyQ==
X-Gm-Message-State: AO0yUKUgSdXdnhr8H/SIlRCy6GquKuatM6qdq0cmObFFO027i0hP6DdQ
	yXpPfpfgZ/kopTn7CudlPTHeFOWFji3xE2PbyCo=
X-Google-Smtp-Source: AK7set+aMXVgIRpYe+n50Uxf6QsHBknzLGOUMzZwrcM2/mxg4eZl66dCx6VooDoFb0zkbyKsuXJVsBcV921Xm9vDgkw=
X-Received: by 2002:a2e:b544:0:b0:295:b597:c903 with SMTP id
 a4-20020a2eb544000000b00295b597c903mr11983790ljn.3.1678815412605; Tue, 14 Mar
 2023 10:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
 <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
 <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
 <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com>
 <CAO5Uq5QnyWqi5_CaX7sHTrewVRhvT_SKdXTY7PvKe4dPryCQ6w@mail.gmail.com>
 <CA+cAkeowE7BUYie9rdFPpJ972DHK+d3WGXLKFPAKcYcVYy_AXA@mail.gmail.com>
 <CANNYZj_xAGD8x9=axLxDuEpaJF2K2yLUVH6VO1j0i5tKSvPi=g@mail.gmail.com>
 <CA+cAkeoP7ScYgbRG3eV1RR5R9bqEXm1b3cw7_gASG4uhJw=WfQ@mail.gmail.com>
 <CA+cAkerKf8yyHraJxWOyAQp91tVkgs08LSX4f3Navu1qJ+tV6w@mail.gmail.com>
 <CAO5Uq5RSduyH-4Rhxzn=L3yS+V1ogM5GNoakbP-sHB9w0Www2w@mail.gmail.com> <CAO5Uq5TQ8rpDc=m1UzXM_SwT=WD3Vvb82Afc4BvZ+L0crnvQaQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5TQ8rpDc=m1UzXM_SwT=WD3Vvb82Afc4BvZ+L0crnvQaQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 14 Mar 2023 18:36:40 +0100
Message-ID: <CA+cAkerB5Qe80gun8soE6VG0j=WFD3oY+JDme1iROpkzK7tM+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004fd62c05f6dfacfb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 17:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178514

--0000000000004fd62c05f6dfacfb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think I'll dig into the checksum capability on crate fetcher in the
coming days.

For the offline option and the modication of the patch mentioned above, how
do you want me to proceed?

Submit a dedicated patch for each of these (one for offline option and one
for checksum if I can come up with a suitable patch)?

For the modification of the patch for using a local directory and not
relying on git clone during build time, do you want me to provide something
in particular?

Note that I saw the downloaded crates not being cleaned up from DL_DIR when
I issue a bitbake -c cleanall but I need to confirm this on master branch.

Le mar. 14 mars 2023, 17:49, Alex Kiernan <alex.kiernan@gmail.com> a =C3=A9=
crit :

> On Tue, Mar 14, 2023 at 12:22=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail=
.com>
> wrote:
> >
> > On Tue, Mar 14, 2023 at 10:25=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
> > <frederic.martinsons@gmail.com> wrote:
> > >
> > > Moreover, I think we should add the `--offline` option to cargo build
> > > because the error generated will be more clear:
> > >
> >
> > Let me chuck that across our code base, I was fairly sure I'd seen
> > different problems with it, but it may have been whilst I was
> > debugging this first time around and am mis-remembering.
> >
>
> I'm wrong, seems to be fine.
>
> --
> Alex Kiernan
>

--0000000000004fd62c05f6dfacfb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think I&#39;ll dig into the checksum capability on crat=
e fetcher in the coming days.<div dir=3D"auto"><br></div><div dir=3D"auto">=
For the offline option and the modication of the patch mentioned above, how=
 do you want me to proceed?=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Submit a dedicated patch for each of these (one for offline optio=
n and one for checksum if I can come up with a suitable patch)?</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">For the modification of the patch f=
or using a local directory and not relying on git clone during build time, =
do you want me to provide something in particular?=C2=A0</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Note that I saw the downloaded crates not =
being cleaned up from DL_DIR when I issue a bitbake -c cleanall but I need =
to confirm this on master branch.=C2=A0</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">Le mar. 14 mars 2023, 17:49, A=
lex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmai=
l.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">O=
n Tue, Mar 14, 2023 at 12:22=E2=80=AFPM Alex Kiernan &lt;<a href=3D"mailto:=
alex.kiernan@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kiernan@g=
mail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Mar 14, 2023 at 10:25=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons=
<br>
&gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank"=
 rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Moreover, I think we should add the `--offline` option to cargo b=
uild<br>
&gt; &gt; because the error generated will be more clear:<br>
&gt; &gt;<br>
&gt;<br>
&gt; Let me chuck that across our code base, I was fairly sure I&#39;d seen=
<br>
&gt; different problems with it, but it may have been whilst I was<br>
&gt; debugging this first time around and am mis-remembering.<br>
&gt;<br>
<br>
I&#39;m wrong, seems to be fine.<br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div>

--0000000000004fd62c05f6dfacfb--

