Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2713E674AE
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 07:39:43 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.32069.1730446774820543348
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 00:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MLrxCSsO;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e7e73740so1554594e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 00:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730446773; x=1731051573; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QgjmW7jgGolnIwEeKVwNr4wtbaLO4/OaicMle/RjtQ0=;
        b=MLrxCSsOrivjeD3f6HmTZwWUfwiBb0Pc6k4IYRQYFhhRKuvJQ9/Ervk0nWpk3ZVWSi
         v4CIOwMbYJNIPA2lt5t3iLRoJPHdvY4SYLzae6mfVz0mTV8M2IGXF8Vq4MP+wpSrg9iV
         dgJ47NzCWr01NeyAHcw0LYq7SIpc7YLQXgRzSZAVWVNyprVmYwR8VFs6+fmvmTLGf0RK
         PRmoP4ApmSvgyMHcp9EQ3guQI9iB56CvfQMZB78z5L2E7ZHXInIqdWjrnKOEjMC6U6Kx
         Oo7nQSSpsIn055JTMIe8Y34QBo8EWBQLo0GUVuhEiVp5fXhqfWPA/5KNuM02R8R9wdy1
         e8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730446773; x=1731051573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgjmW7jgGolnIwEeKVwNr4wtbaLO4/OaicMle/RjtQ0=;
        b=L4k/BBd+ETClijGMf9KqKrqIaF5/73D03QqMx7WDnRyaUs0n6aaREbeDb2Qr7htIai
         KhZuZJQT9gxbNeueNtsmDn7nuVWa4Qo5IkllMgkDS9r7OmNewYZK85Sw77sspn7S4DKq
         oDkdHbgJtElkZK/kMlbQlsn0/8VIbdB4si2ko/TbyMBHjvTsBQ8mL7Ay+MJ5hXzK+DRZ
         s2D1PmTIfNq1+o+urUyLgQ7Mh1wsWmkIKQLGgrrPxTr3/jTLAqryMDG/IQHJQksE9LFg
         2KYpr0sfsGoARQfrXSTXvjLfquuiCFxwnB+a7n8zrZXlOglMtRSzoD9IVVq2olx4Uczz
         RZaA==
X-Forwarded-Encrypted: i=1; AJvYcCVNZIlAI/AFaTF9UJVENK4j+g3+yEypVxkPSdlB0rxJ7FFkOUDg+5OmoqPD2Gwuf80kK4aMo7hcrEJhdeV3rxzh/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzph0oskR/QxL2qErzVvA6qHaciZ58/X+127Xjk1YXWsqdYXWok
	tKCd8m7CC9lABfx7Ix4omt8Bof6Mzy9lcNQjEj5wMSYq+J6A21aDKC+xg1HclUGLjf0xoOZ6wGZ
	LM8cgD70C1yaZuHdteJdglrMx3tQ=
X-Google-Smtp-Source: AGHT+IFyeA6mCWuxU1skyjA+T1CPs38SEzcbamdtrlLFxrlBoNmHyTYWbk4KEZPIEpOSgHAwQ8y9qxcFJ2CkYLzGkCg=
X-Received: by 2002:a05:6512:39cd:b0:539:eb82:d453 with SMTP id
 2adb3069b0e04-53b7ed18622mr5335212e87.39.1730446772688; Fri, 01 Nov 2024
 00:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
 <CANNYZj_KF41W10duL5u0mDDbv1aFUxdcGAmUtO2fEc0EtZ4ymg@mail.gmail.com>
 <TY0PR06MB5707BE94581CC7F425214A2EE2552@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <CAMKF1srdKcP7HMPkQF+iCqOkCfpGv6oB0M8R7=qbO3C216xgmw@mail.gmail.com>
 <CANNYZj8v9LUJFDXqBms6Yg7F0t=xQZAcCg417x00zJxqeYqtog@mail.gmail.com>
 <TY0PR06MB570732A6C54A787FB10C50B6E2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <TY0PR06MB57070328EF6E490CA8B8C0A8E2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <CANNYZj99sKhO24ehF4ks8cWCJa_kg92vGVML8PqtiQFTwnNEaw@mail.gmail.com> <TY0PR06MB570773E5E2D81502B5B30AAAE2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
In-Reply-To: <TY0PR06MB570773E5E2D81502B5B30AAAE2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Nov 2024 08:39:21 +0100
Message-ID: <CANNYZj_UPeg38M5A04J+3_Joumd5DX+48k3LD_nhK53M5imrtQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/2] wic support different sector size
To: Vince Chang <vince_chang@aspeedtech.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000305feb0625d5096e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 07:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206604

--000000000000305feb0625d5096e
Content-Type: text/plain; charset="UTF-8"

Thanks! But you should still fix the original fail I think?

Alex

On Fri 1. Nov 2024 at 8.37, Vince Chang <vince_chang@aspeedtech.com> wrote:

> Hi Alex,
>
> On Fri, 1 Nov 2024 at 12:32 PM, Alexander Kanavin wrote:
> > Anyway, implementation runCmd() indeed defaults to stderr being
> > redirected and appended to stdout, so the standard stream and the
> > error stream are mashed together.
> >
> > To avoid that, you should also set stderr=subprocess.PIPE when calling
> > runCmd(). Check meta/lib/oeqa/selftest/cases/runcmd.py for examples:
> >
> >     def test_output(self):
> >         result = runCmd("echo stdout; echo stderr >&2", shell=True,
> > sync=False)
> >         self.assertEqual("stdout\nstderr", result.output)
> >         self.assertEqual("", result.error)
> >
> >     def test_output_split(self):
> >         result = runCmd("echo stdout; echo stderr >&2", shell=True,
> > stderr=subprocess.PIPE, sync=False)
> >         self.assertEqual("stdout", result.output)
> >         self.assertEqual("stderr", result.error)
>
> I didn't realize that stderr=subprocess.PIPE could be used. I've submitted
> a separate commit.
> https://lists.openembedded.org/g/openembedded-core/message/206602
>
> Thanks,
> Vince
>

--000000000000305feb0625d5096e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks! But you should still fix the original fail I thin=
k?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 1. No=
v 2024 at 8.37, Vince Chang &lt;<a href=3D"mailto:vince_chang@aspeedtech.co=
m">vince_chang@aspeedtech.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Hi A=
lex,<br>
<br>
On Fri, 1 Nov 2024 at 12:32 PM, Alexander Kanavin wrote:<br>
&gt; Anyway, implementation runCmd() indeed defaults to stderr being<br>
&gt; redirected and appended to stdout, so the standard stream and the<br>
&gt; error stream are mashed together.<br>
&gt; <br>
&gt; To avoid that, you should also set stderr=3Dsubprocess.PIPE when calli=
ng<br>
&gt; runCmd(). Check meta/lib/oeqa/selftest/cases/runcmd.py for examples:<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0def test_output(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D runCmd(&quot;echo stdout; =
echo stderr &gt;&amp;2&quot;, shell=3DTrue,<br>
&gt; sync=3DFalse)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(&quot;stdout\nstderr=
&quot;, result.output)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(&quot;&quot;, result=
.error)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0def test_output_split(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D runCmd(&quot;echo stdout; =
echo stderr &gt;&amp;2&quot;, shell=3DTrue,<br>
&gt; stderr=3Dsubprocess.PIPE, sync=3DFalse)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(&quot;stdout&quot;, =
result.output)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(&quot;stderr&quot;, =
result.error)<br>
<br>
I didn&#39;t realize that stderr=3Dsubprocess.PIPE could be used. I&#39;ve =
submitted a separate commit.<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/20660=
2" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/206602</a><br>
<br>
Thanks,<br>
Vince<br>
</blockquote></div></div>

--000000000000305feb0625d5096e--

