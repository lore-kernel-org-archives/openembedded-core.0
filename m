Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F398C4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 21:50:34 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.26686.1706997027509295743
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 13:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yg2albh0;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc6e08fde11so2774724276.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 13:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706997026; x=1707601826; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=056tgxaJXeCCv9zoCxvZSIUnkXkMI6pXXBG3tpC6MCs=;
        b=Yg2albh0Cn4vhvh6xExjcItX5+CzL59Z4gdIM9vfkUhx5VmJmgjOddtkPE6m8rW0Lz
         2SHBNEIW0DAsRYGs6tQ/z9WbWZltb8dqsCfeZyBPoEug/YjN6mkNrPtgJDqDbfBX6huz
         A/F2fcqhHicpPCAsaFwY302zkWn5EgZfbb1aDBiZwc6eiAKt5UuBOyGRuvx/QUA58F89
         EqR/Ee5/g4LDmolkanhPjWRCHch6N4lZ3/rBUsdrq8ELblsvOAf+el191VwL/JxmvFdX
         V1ozRezxSZL18Fyg1Hgh0bsBN91Jecjfj9zZvv1MaOOaNCPLBnNbxP2qW/BeyodpuhXa
         G3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706997026; x=1707601826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=056tgxaJXeCCv9zoCxvZSIUnkXkMI6pXXBG3tpC6MCs=;
        b=WioWbvwOKn/lLstzj9wYz3s0zZq1ykncUruLvDMSHezt7gD0CbAvR27oKWDyp5wdms
         ZX/7T8NptJqhzijwv9vOUvFK1tV3iUGrWK7w1/LjvBfUuPCBu8fIGJFGsPZqZvo70hfR
         mMLxP5k+Yqo5kk6YbK2G8tTrAC8BgkHMl4tSXnKkSCYazJc1/R/h6Wtz4aO0Ew+vklED
         MEtJhwD81kEPlT26El+NX5CdQ2BVwnEL8u4hYkcpDnJtWPOGOCEJkoPYl7s7PeTbPGmZ
         AL725mWh0RfpFmQkgkJw5rkEiP7/OmBjYUhASHDVTD6ryBAkgXQzOm4gOCRfqJrtwhI6
         MJIA==
X-Gm-Message-State: AOJu0Yw3a+Jzro9N80M4MD3Y657nm/sCFuQDKGD/wSwmcxDIumWJWD24
	15bzNnT8XPrGDmeXMUo3Ijh2M0Eg7Wc0i2JWLnd9GJhG2cDFk5dXTLYY+KBdCqLTtS3alVQwJ9w
	u/9n3dRXdbznJjVFAzy3GEnXVTuw=
X-Google-Smtp-Source: AGHT+IEdFt971zKWzzcjle4nn1otBzwEZQjtGdoGYbvy+yfcaGR0SA//EWsPM5/04STTYrePnUAavA1SZpj437vlgSI=
X-Received: by 2002:a25:8391:0:b0:dc6:cc63:7fff with SMTP id
 t17-20020a258391000000b00dc6cc637fffmr10023145ybk.49.1706997026669; Sat, 03
 Feb 2024 13:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20240202045933.3427847-1-tim.orling@konsulko.com>
 <CAMKF1srGgwi-SHJq3vsOXCJPn_qBSZBidCdTM0VTJNVWsgNsSA@mail.gmail.com>
 <CANx9H-AGYVB4as6J+2hWfHfC4b_tbbidBdBZbrYQ3Z+RAK0ySA@mail.gmail.com> <3aee3f56b14fc76c2b7a1cac64e21fbd664e665f.camel@linuxfoundation.org>
In-Reply-To: <3aee3f56b14fc76c2b7a1cac64e21fbd664e665f.camel@linuxfoundation.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 3 Feb 2024 13:50:15 -0800
Message-ID: <CANx9H-Dm0gu-kkVLkwgRY=c-HKf8=VW7s2_NA+mmNKNww6_WNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: upgrade 41.0.7 to 42.0.2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="0000000000006848e9061081374e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 21:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194865

--0000000000006848e9061081374e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 3, 2024 at 1:34=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2024-02-03 at 13:27 -0800, Tim Orling wrote:
> >
> >
> > On Sat, Feb 3, 2024 at 1:07=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
> > > This is failing ptests on musl/qemux86-64
> > >
> > >     Failed ptests:
> > >     {'python3-cryptography': 'START: ptest-runner\n'
> > >                              '2024-02-03T18:58\n'
> > >                              'Free memory: 3.899 GB\n'
> > >
> > >
> >
> > This means it is passing the check-memfree.py test, so that rules out
> OOM (unless we need more than this...
> > one test case did fail for me and then passed when I used -smp 4 -m 819=
2
> >
> > >
> '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n'
> > >                              'Testsuite summary\n'
> > >                              '# TOTAL: 0\n'
> > >                              '# PASS: 0\n'
> > >                              '# SKIP: 0\n'
> > >                              '# XFAIL: 0\n'
> > >                              '# FAIL: 0\n'
> > >                              '# XPASS: 0\n'
> > >                              '# ERROR: 0\n'
> > >                              '\n'
> > >                              'ERROR: Exit status is 2\n'
> > >                              'DURATION: 6\n'}
> > >
> > >     ptests which had no test results:
> > >     ['python3-cryptography']
> > >
> > >
> >
> > This makes it look like no ptests are even being detected? Is there any
> other log info?
> >
> >
>
> It isn't just musl failing:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6048
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6233
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6234
>
>
> http://autobuilder.yocto.io/pub/non-release/20240203-17/testresults/qemux=
86-64-ptest/python3-cryptography.log
>
> which also doesn't show any tests running.
>
>
Ok. Maybe it is an OOM problem then for that one test or something. Time to
dig in.
Thank you for pointing to the builds.


> Cheers,
>
> Richard
>

--0000000000006848e9061081374e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 3, 2024 at 1:34=E2=80=AFP=
M Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Sat, 2024-02-03 at 13:27 -0800, Tim Or=
ling wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Sat, Feb 3, 2024 at 1:07=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; This is failing ptests on musl/qemux86-64<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0 =C2=A0 Failed ptests:<br>
&gt; &gt; =C2=A0 =C2=A0 {&#39;python3-cryptography&#39;: &#39;START: ptest-=
runner\n&#39;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;2024-02-03T18:58\n&#39;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Free memory: 3.899 GB\n&#39;<=
br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
&gt; This means it is passing the=C2=A0check-memfree.py test, so that rules=
 out OOM (unless we need more than this...<br>
&gt; one test case did fail for me and then passed when I used -smp 4 -m 81=
92<br>
&gt; =C2=A0<br>
&gt; &gt; &#39;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D\n&#39;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Testsuite summary\n&#39;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# TOTAL: 0\n&#39;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# PASS: 0\n&#39;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# SKIP: 0\n&#39;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# XFAIL: 0\n&#39;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# FAIL: 0\n&#39;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# XPASS: 0\n&#39;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# ERROR: 0\n&#39;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\n&#39;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ERROR: Exit status is 2\n&#39=
;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;DURATION: 6\n&#39;}<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0 =C2=A0 ptests which had no test results:<br>
&gt; &gt; =C2=A0 =C2=A0 [&#39;python3-cryptography&#39;]<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
&gt; This makes it look like no ptests are even being detected? Is there an=
y other log info?<br>
&gt; <br>
&gt; <br>
<br>
It isn&#39;t just musl failing:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/6048" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/82/builds/6048</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/6233" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/81/builds/6233</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/6234" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/81/builds/6234</a><br>
<br>
<a href=3D"http://autobuilder.yocto.io/pub/non-release/20240203-17/testresu=
lts/qemux86-64-ptest/python3-cryptography.log" rel=3D"noreferrer" target=3D=
"_blank">http://autobuilder.yocto.io/pub/non-release/20240203-17/testresult=
s/qemux86-64-ptest/python3-cryptography.log</a><br>
<br>
which also doesn&#39;t show any tests running.<br>
<br></blockquote><div><br></div><div>Ok. Maybe it is an OOM problem then fo=
r that one test or something. Time to dig in.</div><div>Thank you for point=
ing to the builds.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000006848e9061081374e--

