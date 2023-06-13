Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2539DEB64D0
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 13:57:57 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.13715.1686664668237920057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 06:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pU0Wt1Ps;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-558b70c715cso2952336eaf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686664667; x=1689256667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fg8elz+3TxvtHm5oIx2h491TcaybUywlrI2kPpgzl3A=;
        b=pU0Wt1PsQby0Z0W+p/VNEMH7VhhtswhIb2sZuZCybYLyWXZFlJTEVGE5mWz5QiXOiZ
         wq+zaM6QQs3A+NNwpGy/xIMtCk1m9gopXJk/Sbl7XhLTGr0lXvs5bUUTkUjy7Lzzue9n
         Lp4ga0WgzB4O8WJTyj3P+d/y9ufGr6riuZQz5D+bg1akCTyjEG+fHFoghVxsEOR3moTY
         x++ICqacEOjHbPOd96rhGPwucs3uoviK70ySWh1yvqfdd+b7ZpqUw+OgowMNKh1x2dx9
         dyGmj0kHVZIraWPc/uYat55pU6dVfTiiInH3wgmzbTPKBNtME6FXh+QSCuLTljyjb1rR
         t2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686664667; x=1689256667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fg8elz+3TxvtHm5oIx2h491TcaybUywlrI2kPpgzl3A=;
        b=RkS3Ui+KJeClS1RjFnKlAfSRGfSJPnT4QYClV0oQmXsQY/duXHYlA3Pc+e7LpKnzNM
         ICj/eXbBWe99g31nap0UAZLkr2MT4F0/0RI/cipNYKd4c/IhsNuDWIibMdYvn7yRYf50
         ZGSiZVdLmoJbpuFHW95MgUA86M+ONhtEu7EeinQkg5rMsxBGijJsiyl272CCXgBnooJI
         4c/TM4cnqrqPWLn4nKUtYKjJCFjqtmEy2+SK0wL5TOhG/kH3uv33JaWCMw4XG2AwrRXN
         91iMgg37CVxcTcnOom6kJQNCej1UEysVfCw0BzmMixCC8TBSV4hlzXM3qygvrodYqXVM
         G8yw==
X-Gm-Message-State: AC+VfDxFHiLBoqjEVdZPUUg56v3ZQcvklpU3XaO2GkuSdxrsaYFzu4R6
	g4Jxwd0IkFUi3rQ8BUt8KFyszkk9WYu7NUOJr8U05YZ5
X-Google-Smtp-Source: ACHHUZ4RyHKPOMiGi3WBlEoyt1RiwFSfuF7q3/cWvr6xirynzOLoQV+29LpCSnkecIXgHF2slNGsxr2DU9dSMJXCg5E=
X-Received: by 2002:a4a:c90b:0:b0:552:4bca:a9df with SMTP id
 v11-20020a4ac90b000000b005524bcaa9dfmr6227465ooq.3.1686664667284; Tue, 13 Jun
 2023 06:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230612094415.2338958-1-deepadeepthi98@gmail.com>
 <14338.1686563912593685566@lists.openembedded.org> <CAMKF1srpWrg5p1Zt-rFV1yMXnT+uc2aiqPFsf-H2GdWungCRDg@mail.gmail.com>
 <PH7PR11MB6449C4E7C9177D38750559EB8D55A@PH7PR11MB6449.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6449C4E7C9177D38750559EB8D55A@PH7PR11MB6449.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jun 2023 06:57:36 -0700
Message-ID: <CAMKF1spAMVNahQvpJrA6n9MoqsUVy1XCjp22N=pOXgPvG-cFHw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch updates.
To: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000594b7005fe033824"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 13:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182716

--000000000000594b7005fe033824
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 12:14 AM Hemraj, Deepthi <
Deepthi.Hemraj@windriver.com> wrote:

> Hello khem,
>
>
>
> There are no new failures, the test nptl/tst-cancel22 which was failed
> before update is passed with after update. I updated the test results
> summary accordingly.
>
> I see. Somehow I read it other way around thanks

> Test summary files are attached.
>
>
>
> Thanks,
>
> Deepthi H
>
>
>
> Sent from Mail <https://go.microsoft.com/fwlink/?LinkId=3D550986> for
> Windows
>
>
>
> *From: *Khem Raj <raj.khem@gmail.com>
> *Sent: *Monday, June 12, 2023 8:38 PM
> *To: *Hemraj, Deepthi <Deepthi.Hemraj@windriver.com>
> *Cc: *openembedded-core@lists.openembedded.org
> *Subject: *Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch
> updates.
>
>
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
>
>
> Can you share details of the 1 new failure
>
> On Mon, Jun 12, 2023 at 2:58=E2=80=AFAM <Deepthi.Hemraj@eng.windriver.com=
> wrote:
> >
> > Regression tests are performed and below is test summary.
> > Test summary after glibc updates:
> >
> >     153 FAIL
> >
> >    4408 PASS
> >
> >      41 UNSUPPORTED
> >
> >      12 XFAIL
> >
> >       6 XPASS
> >
> > Test summary after glibc updates:
> >
> >     154 FAIL
> >
> >    4405 PASS
> >
> >      41 UNSUPPORTED
> >
> >      12 XFAIL
> >
> >       6 XPASS
> >
> > Diff:
> >     1 FAIL
> >     3 PASS
> >
> >     0 UNSUPPORTED
> >     0 XFAIL
> >     0 XPASS
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#182661):
> https://lists.openembedded.org/g/openembedded-core/message/182661
> > Mute This Topic: https://lists.openembedded.org/mt/99479400/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
>

--000000000000594b7005fe033824
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 13, 2023 at 12:14 AM Hemraj, Deepthi &lt;<a hre=
f=3D"mailto:Deepthi.Hemraj@windriver.com">Deepthi.Hemraj@windriver.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:brea=
k-word">
<div class=3D"m_-4109849214351009808WordSection1">
<p class=3D"MsoNormal">Hello khem,</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">There are no new failures, the test nptl/tst-cancel2=
2 which was failed before update is passed with after update. I updated the=
 test results summary accordingly.</p>
<p class=3D"MsoNormal"></p></div></div></blockquote><div dir=3D"auto">I see=
. Somehow I read it other way around thanks=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"wor=
d-wrap:break-word"><div class=3D"m_-4109849214351009808WordSection1"><p cla=
ss=3D"MsoNormal" dir=3D"auto">Test summary files are attached.</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,</p>
<p class=3D"MsoNormal">Deepthi H</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986" target=3D"_blank">
Mail</a> for Windows</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:raj.khem@gmail.com" target=3D"_blank">Khem Raj</a><br>
<b>Sent: </b>Monday, June 12, 2023 8:38 PM<br>
<b>To: </b><a href=3D"mailto:Deepthi.Hemraj@windriver.com" target=3D"_blank=
">Hemraj, Deepthi</a><br>
<b>Cc: </b><a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject: </b>Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch =
updates.</p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">CAUTION: This email comes from a non Wind River emai=
l account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.</p></div></div><div lang=3D"EN-US" link=3D"blue" =
vlink=3D"#954F72" style=3D"word-wrap:break-word"><div class=3D"m_-410984921=
4351009808WordSection1"><p class=3D"MsoNormal"><br>
<br>
Can you share details of the 1 new failure<br>
<br>
On Mon, Jun 12, 2023 at 2:58=E2=80=AFAM &lt;<a href=3D"mailto:Deepthi.Hemra=
j@eng.windriver.com" target=3D"_blank">Deepthi.Hemraj@eng.windriver.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; Regression tests are performed and below is test summary.<br>
&gt; Test summary after glibc updates:<br>
&gt;<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 153 FAIL<br>
&gt;<br>
&gt;=C2=A0=C2=A0=C2=A0 4408 PASS<br>
&gt;<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41 UNSUPPORTED<br>
&gt;<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12 XFAIL<br>
&gt;<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6 XPASS<br>
&gt;<br>
&gt; Test summary after glibc updates:<br>
&gt;<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 154 FAIL<br>
&gt;<br>
&gt;=C2=A0=C2=A0=C2=A0 4405 PASS<br>
&gt;<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41 UNSUPPORTED<br>
&gt;<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12 XFAIL<br>
&gt;<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6 XPASS<br>
&gt;<br>
&gt; Diff:<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 1 FAIL<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 3 PASS<br>
&gt;<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 0 UNSUPPORTED<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 0 XFAIL<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 0 XPASS<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#182661): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/182661" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/182661</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99479400=
/1997914" target=3D"_blank">https://lists.openembedded.org/mt/99479400/1997=
914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

</blockquote></div></div>

--000000000000594b7005fe033824--

