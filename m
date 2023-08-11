Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD08EB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 07:25:11 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.37874.1691738709792202824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 00:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hmB0XAr0;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-76571dae5feso121318185a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 00:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691738709; x=1692343509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7fu0SrdQqKV6tOSd/b8cZ4ZtpZbC9IwknDMUsE3Iqv4=;
        b=hmB0XAr0CJYGfzTRLv4CP2ywXF+l8alJGSk0AB7N0tqRj7gEZ62UxQo4A6vYeejOZM
         +/TZptTD+dV+s54J+SxzQCTIZjLMrXlb4/QxbHhawsDyTnwk/Rt41ULN1h4EWoC2lBdd
         vX9Tn+mGhZHmWLCskQaocvelB9m7LSwxOnpL7GDjRQ6nplNQ4G2WkmCTCvXT/q6Ydln6
         MAhpfLiUHIhGg070/Y5pGbRNF//FXcubVMQ3Zictpb1isDPNW8UUfWSWz5hjBNAv+UMZ
         w/qgKfOZurs5Gxd9qg6m8pf/5yrlNCmPSkddfXVsiwfX7JG/J4eS44thyd8rWzKkp+kS
         Uhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691738709; x=1692343509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fu0SrdQqKV6tOSd/b8cZ4ZtpZbC9IwknDMUsE3Iqv4=;
        b=ECHIrZHP6lKmHdimokCsov0nJpBx5PL+Ec3uTX82ywyDr4SBKtpBkSVju6G+FK6WRH
         NmrW3V11g8ahcGv+mIu5mDH/TBmwpvw1N8iWTBB/cF7qdT5y4I3M+4cdGasqi8nis+hu
         /Lmkxu13ZRBedmLHl4PIiLDeIX0M6df4/fdhZDdZQjpGUF9JJTjB6kB1mpOPYDhiP/JS
         HfSbNAicRPyOnm623xwBDegBMf4ghRr0P0LJcBa2svgXJYdmpMJAdBZNXsbKs54Jt1g6
         PGni51GPj0cjQPkDG4UGE70Bl0qPG89GZPsXzwIPqH5S3HGoRyodnwSRVPFmt7GZ4Yfj
         wssg==
X-Gm-Message-State: AOJu0YzlXxxdh3e5YVKVAPfNDsP+LYTmKQNA+AZJdWTCVSGRSrtUhSiN
	havfjSTaxTVz196Xm2Oaqwp9N8cxCwEogl003a8=
X-Google-Smtp-Source: AGHT+IH4ihuwhJG752wLfEW2M/38nVgUS7QXM/LraQP4Zm6Wsef9+UBw9UKWxhsyYhfZOt8yd8RKb+O9dAnyUjw6lQg=
X-Received: by 2002:a05:620a:28c1:b0:767:f49c:1d67 with SMTP id
 l1-20020a05620a28c100b00767f49c1d67mr1357425qkp.1.1691738708620; Fri, 11 Aug
 2023 00:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAker4rvPcdjxN7faE5jzGTKVC-1K--ezXXmkOdWbJ_f_bkA@mail.gmail.com>
 <3f31bf9f-a3dd-1be1-8320-5aa2abd67351@bootlin.com> <445f02dd08a50e8bbb616ee34560db554af6911a.camel@linuxfoundation.org>
In-Reply-To: <445f02dd08a50e8bbb616ee34560db554af6911a.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 11 Aug 2023 09:24:57 +0200
Message-ID: <CA+cAkeqemTqKL8n3dA+08ghYzuWymB7HZOw_2wVyM=Ywzxu-VA@mail.gmail.com>
Subject: Re: [OE-core] Status of patchtest tool
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c7baa70602a09c78"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 07:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185830

--000000000000c7baa70602a09c78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 11 ao=C3=BBt 2023, 09:05, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Fri, 2023-08-11 at 08:00 +0200, Michael Opdenacker via
> lists.openembedded.org wrote:
> > Hi Frederic,
> >
> > On 11.08.23 at 07:28, Frederic Martinsons wrote:
> > > Hello list
> > >
> > > Michael recently made a change on contirubing guide talking about
> > > patchtest as a tool (quoting him) "to test user contributions before
> > > they hit the mailing lists; and looking in my older emails, Alexander
> > > also mentioned this tool as a (quoting him) "special bot called
> > > patchtest that used to check mailing list submissions for common
> > > problems".
> > >
> > > Can you tell me more about it ? Are we talking about the script
> > > patchtest.sh in scripts/contrib of oe-core ?
> > > Can you please describe the expectations of this tool .
> > > I'm willing to improve it and am ready to work on it if you give me
> > > some directions.
> >
> >
> > Actually, Richard wrote the initial text, and I actually wondered... Is
> > the intent to have a tool that contributors can run before sending thei=
r
> > patches, and that a bot can run on mailing list submissions too?
>
> Yes, that is the intent. The docs are written with the view from where
> I believe we'll be in a couple of months. I wrote it that way to prompt
> us to fill in the missing pieces as this is developed and because I
> wasn't thinking the text would have merged quite so quickly.
>
> Patchtest is mentioned here:
>
>
> https://www.yoctoproject.org/community/yocto-project-engineering-request-=
for-quotation/
>
> Even before that we've talked about patchtest a lot and our desire to
> bring back the code/tests we have and get them working again. There are
> several mailing list posts where I've talked about it and various open
> bugs in bugzilla.
>
> We're in the process of getting some help to work on some of the things
> in the RFQ and patchtest should hopefully be getting some attention
> very soon.
>
> https://git.yoctoproject.org/patchtest/
> https://git.yoctoproject.org/patchtest-oe/


Thank you Richard for the links, if I understand correctly, there are
already plan to work on it so I may not step in (since I do not have all
the backgrounds).
Nevertheless, I'll take a look at the Bugzilla to see if I can bring some
help on already open bug.


>
> Cheers,
>
> Richard
>
>
>

--000000000000c7baa70602a09c78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le ven. 11 ao=C3=BBt 2023, 09:05, Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfo=
undation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">On Fri, 2023-08-11 at 08:00 +0200, Michael Opdenacker via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Hi Frederic,<br>
&gt; <br>
&gt; On 11.08.23 at 07:28, Frederic Martinsons wrote:<br>
&gt; &gt; Hello list<br>
&gt; &gt; <br>
&gt; &gt; Michael recently made a change on contirubing guide talking about=
 <br>
&gt; &gt; patchtest as a tool (quoting him) &quot;to test user contribution=
s before <br>
&gt; &gt; they hit the mailing lists; and looking in my older emails, Alexa=
nder <br>
&gt; &gt; also mentioned this tool as a (quoting him) &quot;special bot cal=
led <br>
&gt; &gt; patchtest that used to check mailing list submissions for common =
<br>
&gt; &gt; problems&quot;.<br>
&gt; &gt; <br>
&gt; &gt; Can you tell me more about it ? Are we talking about the script <=
br>
&gt; &gt; patchtest.sh in=C2=A0scripts/contrib of oe-core ?<br>
&gt; &gt; Can you please describe the expectations of this tool .<br>
&gt; &gt; I&#39;m willing to improve it and am ready to work on it if you g=
ive me <br>
&gt; &gt; some directions.<br>
&gt; <br>
&gt; <br>
&gt; Actually, Richard wrote the initial text, and I actually wondered... I=
s <br>
&gt; the intent to have a tool that contributors can run before sending the=
ir <br>
&gt; patches, and that a bot can run on mailing list submissions too?<br>
<br>
Yes, that is the intent. The docs are written with the view from where<br>
I believe we&#39;ll be in a couple of months. I wrote it that way to prompt=
<br>
us to fill in the missing pieces as this is developed and because I<br>
wasn&#39;t thinking the text would have merged quite so quickly.<br>
<br>
Patchtest is mentioned here:<br>
<br>
<a href=3D"https://www.yoctoproject.org/community/yocto-project-engineering=
-request-for-quotation/" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://www.yoctoproject.org/community/yocto-project-engineering-request-for-=
quotation/</a><br>
<br>
Even before that we&#39;ve talked about patchtest a lot and our desire to<b=
r>
bring back the code/tests we have and get them working again. There are<br>
several mailing list posts where I&#39;ve talked about it and various open<=
br>
bugs in bugzilla.<br>
<br>
We&#39;re in the process of getting some help to work on some of the things=
<br>
in the RFQ and patchtest should hopefully be getting some attention<br>
very soon.<br>
<br>
<a href=3D"https://git.yoctoproject.org/patchtest/" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://git.yoctoproject.org/patchtest/</a><br>
<a href=3D"https://git.yoctoproject.org/patchtest-oe/" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://git.yoctoproject.org/patchtest-oe/</a><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thank=
 you Richard for the links, if I understand correctly, there are already pl=
an to work on it so I may not step in (since I do not have all the backgrou=
nds).=C2=A0</div><div dir=3D"auto">Nevertheless, I&#39;ll take a look at th=
e Bugzilla to see if I can bring some help on already open bug.=C2=A0</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br><br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000c7baa70602a09c78--

