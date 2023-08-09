Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A8EC04A6A
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 15:05:17 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.90531.1691593510450923182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 08:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bNb2Rxpc;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6bd0a0a6766so1411929a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 08:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691593510; x=1692198310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sm6Yb4DC2dztN7k5DNEMzDP2oZzGZy6smpurjay31Ak=;
        b=bNb2RxpcGN6TM99vmYwcRVdH0wnYpIK/wlzQlAjDNn2ye8DJH9z7FedzvLTPK6CewF
         EwOLb97fcuslkA1GJqTBcikwfpJHd2BobkA9n8fCwFA9EO9RPhTCmvCHOK/KWA4lEGPK
         em6l7INMvy82YHwMPHE1xwr28HueSJcCyZTP+yI8TVIdhRlrqLBxCZM3kWp30dnImHMk
         fQ27aITK//QOnoEKPMYJyB1UitD3DM0JGSFpmZuiFEITbdV/AFQZTislQ2ohI8dVi48v
         4aGax0xBm6xx2hb7TbBBUONCkVbGDJNaVQWCM982i7MkZMcxEnwBQSLh0dpZzhiBjX9B
         tsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691593510; x=1692198310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sm6Yb4DC2dztN7k5DNEMzDP2oZzGZy6smpurjay31Ak=;
        b=L1X+jbQ99oOMm64oxwdtd2GkxKuxNYX+fLg3J1Md3249S44Vvj8pZ+lXZHXW86eYB+
         rzO1ZYxsZOr61bMDVxyzUecTsV8oMAbqGjkE5yrZ1rZPpscJXkdQXERHdDVSDN6e3+XM
         IvIaASft/B2p9EDbP+2ROkS1rvFZ1DUDIQxIh1HbKricznMN2UEj84dWuca/ItM/JK+7
         7fdosCjg8b8VN5Ls8VPre7wygWg6hI/gcVJ1e5cpU75ZaZET5lQNUfSpu2JaMUl7y7G/
         Cmc5jT9dpQC166/EU8fh7Fyikkkrv0/2PwSeYPo6tIkkeMINTzfdUlMMt3WSzlNHI6fK
         QsTg==
X-Gm-Message-State: AOJu0Yzi1hUcq2njR+ddzdF0c4qxaHYXvNo+daBt8z7j1L8LXRM/DFOh
	v2A1nCNRirDBmf6PqyIz/k9N68GhXwLWMOIR/Vg=
X-Google-Smtp-Source: AGHT+IFosGQwoAKxr3Fjz8Jwc6bthctT+b6JB+IHPyWKMkkVEBYQ07wFK338qJ6lUlYsVbKhl6cAVTEC4KfG88Mk32M=
X-Received: by 2002:a05:6358:2786:b0:135:92f0:fa6a with SMTP id
 l6-20020a056358278600b0013592f0fa6amr3061422rwb.1.1691593509553; Wed, 09 Aug
 2023 08:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230808160828.3045524-1-jose.quaresma@foundries.io>
 <CAMKF1sr4azY=E9XUz4946qWByrMFHbVM-jCACFtgF93_ry4DpQ@mail.gmail.com>
 <CANPvuRny9BbNDpGtz6y2omz2fzsezKHij_pff_bMNRZsW_iyTg@mail.gmail.com>
 <CAMKF1so0DFL3CZqtPKzi1QBV2cQ=6FD=J=TsaFS8ME8KXyPsYg@mail.gmail.com>
 <CANNYZj-DtpOfOye1kOvwCcxzLuAJ6gc3FyE__VMStLiNirrViA@mail.gmail.com> <99E1E475-401D-4C4E-8857-FE94A07FC349@arm.com>
In-Reply-To: <99E1E475-401D-4C4E-8857-FE94A07FC349@arm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 9 Aug 2023 16:04:58 +0100
Message-ID: <CANPvuR=i4FwSPx3kexcRFu128CTaUH_54zjxKz-LKon59UjkKw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] systemd-boot: enable verbose compilation
To: Ross Burton <Ross.Burton@arm.com>
Cc: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003dca3906027ece5d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 15:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185712

--0000000000003dca3906027ece5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ross Burton <Ross.Burton@arm.com> escreveu no dia quarta, 9/08/2023 =C3=A0(=
s)
15:49:

> On 9 Aug 2023, at 07:47, Alexander Kanavin via lists.openembedded.org
> <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> >> Ideally we only want the verbosity when something goes wrong and meson
> ninja etc are good at that with their defaults perhaps that -v should be
> turned off by default as well
> >
> > Absolutely not. As someone who spends a lot of time fixing build and
> > runtime failures across all of oe-core I beg to differ. I want
> > verbosity all the time, everywhere. I also do not want to spend a
> > second figuring out how to switch it on (it's different everywhere
> > too), or to run another build just to get the verbose logs out of it.
>
> Agreed with Alex.
>
> Unless Ninja is clever enough to emit the full log for _every_ build step
> that was involved in the failure, I definitely always want verbose logs.
>
> For what it=E2=80=99s worth this made me look at the recipe to see why it=
 has to
> define do_compile, and I ended up extending meson.bbclass making this pat=
ch
> redundant.
>
> Ross


I also prefer to have the verbose enabled everywhere so the bitbake logs
have more details when debug is needed.
The Ross patch includes everything we need, thanks for looking at that.
Please drop this one.

Jose

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000003dca3906027ece5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Ross Burton &lt;<a href=3D"mailto:Ros=
s.Burton@arm.com">Ross.Burton@arm.com</a>&gt; escreveu no dia quarta, 9/08/=
2023 =C3=A0(s) 15:49:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 9 Aug 2023, at 07:47, Alexander Kanavin via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.=
org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt; Ideally we only want the verbosity when something goes wrong and m=
eson ninja etc are good at that with their defaults perhaps that -v should =
be turned off by default as well<br>
&gt; <br>
&gt; Absolutely not. As someone who spends a lot of time fixing build and<b=
r>
&gt; runtime failures across all of oe-core I beg to differ. I want<br>
&gt; verbosity all the time, everywhere. I also do not want to spend a<br>
&gt; second figuring out how to switch it on (it&#39;s different everywhere=
<br>
&gt; too), or to run another build just to get the verbose logs out of it.<=
br>
<br>
Agreed with Alex.<br>
<br>
Unless Ninja is clever enough to emit the full log for _every_ build step t=
hat was involved in the failure, I definitely always want verbose logs.<br>
<br>
For what it=E2=80=99s worth this made me look at the recipe to see why it h=
as to define do_compile, and I ended up extending meson.bbclass making this=
 patch redundant.<br>
<br>
Ross</blockquote></div><br>I also prefer to have the verbose enabled everyw=
here so the bitbake logs have more details when debug is needed.<div>The Ro=
ss patch includes everything we need, thanks for looking=C2=A0at that.<br>P=
lease drop this one.<br><br>Jose<br clear=3D"all"><div><br></div><span clas=
s=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_=
signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div><=
/div></div></div></div>

--0000000000003dca3906027ece5d--

