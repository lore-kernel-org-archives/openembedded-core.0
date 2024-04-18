Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B92C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 00:42:09 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.1828.1713400922597525929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 17:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tve63ico;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: chuckwolber@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-36a118d3b30so1292655ab.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 17:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713400922; x=1714005722; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t29xY/NanRHMSS+bP7aEK6i9OzzzBYvHd1ExE0XbNAI=;
        b=Tve63icoxF/Gn2fIFybRUFG8y4gy3zHXrj58mLh6gXsK/QD5lafC1XVwv8elbeLbZe
         3/cd8n1VsTlKKfbiQyoTEi/DOenpa98WjyM93PgfjFh3UVZ2f3VjjD/tPU1jYTG7qxde
         OKhRiclu55BIDNm5hvU0r1S7HT/SRPwIZQ9RmT+vGD2zwUn1wQ860nw1d3JVUyGZzwbk
         giaNYvfduPzFth96IEANFS/bGOvM0FenlBvGoAXVMiEd3ceVn7ukQIJUElU3rlckKmAy
         Np0pXLqgGJhsW5kMvVLjtquKtRW8tV6YARqfqhfU+af/vMYxV1WxoGK046MEXLTIsNpH
         gmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713400922; x=1714005722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t29xY/NanRHMSS+bP7aEK6i9OzzzBYvHd1ExE0XbNAI=;
        b=BIrvfI9UYS8D5yMYggydM8rCEehKdCWjPl9k1ycoMrNOQMNQCV/xyEqkNN/XrntRzL
         RXLBkR/jKtEL+7Aukw7SQhYW6EawKVr58vgHy2fL1vvQSgg061DEFYHj1chXtcopLBei
         ftRJpTwDTIuIZQQfyjfqc1u06M82SudT566A4fWgNzL20NIa9aJG1WVsXOoclLoMe15L
         0UcRG3E64j1uYZl6tAbp8gvpItgm3feGaXyOU/3cvYoybA5SPtb7gX6h/j8ElppaOZXK
         ku8ujFL5JK5GCEdc/v05jGeWCTuWWqQLy9aHnq5arFhBl+j6KD+HXjPfknAFWM63jSvY
         Dy/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX88SNdexrNUycz6E8lGDHULa1JXAIHDqTMVgLbpJAmpNozqKkrurDuiCrexhqg0J/3jJ5VvAZujLPSzhvPyhx32wIvSHncZ4JUspAK4vpKYS8NOlGjMvh7
X-Gm-Message-State: AOJu0YzoZs3Uumf47VSEBxAHszmBbQMINYk1ZBrUgoZj0vJxr7jxXhGF
	VA1XZTu8F6QGRvdNUrqzrgIXfjPddMJxo+2bfpiSLr4wWha+ESWsyd4zB70GwzxD8W+9L599cPB
	livCgLMENgnkizAZSI32c6W3SYRc=
X-Google-Smtp-Source: AGHT+IHv1QIFgqrpBNJktfJlM+ncVI4+hYQY97aEB9u6eu6TQ8OvNx4GGEmGiv3KgJgtdDml0T0WEgTVeXr2SQmdrZg=
X-Received: by 2002:a05:6e02:1563:b0:36a:35:2a87 with SMTP id
 k3-20020a056e02156300b0036a00352a87mr1446284ilu.26.1713400921712; Wed, 17 Apr
 2024 17:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240417112444.395440-1-daniel.klauer@gin.de> <CAMKF1sq24dcWjAKkT5C4=bSER7wfvcrbaQb1YfFacVk=f2iv_Q@mail.gmail.com>
In-Reply-To: <CAMKF1sq24dcWjAKkT5C4=bSER7wfvcrbaQb1YfFacVk=f2iv_Q@mail.gmail.com>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Wed, 17 Apr 2024 17:41:50 -0700
Message-ID: <CAB=6tBRCbkap+gwN4qfTvzuAq4HK5jNnqjy2oAL1pVGwEUmuFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake.bbclass: Add ${COREBASE}/scripts to CMAKE_FIND_ROOT_PATH
To: raj.khem@gmail.com
Cc: daniel.klauer@gin.de, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004bf2940616543d21"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 00:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198492

--0000000000004bf2940616543d21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 12:14 Khem Raj via lists.openembedded.org <raj.khem=
=3D
gmail.com@lists.openembedded.org> wrote:

>
>
> On Wed, Apr 17, 2024 at 4:25=E2=80=AFAM Daniel Klauer via lists.openembed=
ded.org
> <daniel.klauer=3Dgin.de@lists.openembedded.org> wrote:
>
>> ${COREBASE}/scripts contains a "git" wrapper disabling fakeroot/pseudo.
>> This patch allows CMake to find ${COREBASE}/scripts/git instead of
>> ${HOSTTOOLS_DIR}/git. This is needed for git invocations during
>> do_install,
>> since do_install is a fakeroot task, and otherwise all git commands fail
>> with "fatal: detected dubious ownership in repository ...".
>>
>> I don't know how common it is for CMake projects to invoke git during th=
e
>> install phase intentionally. It's probably more common to do this during
>> the configure phase. However, the install step may re-run the configure
>> step, if some dependencies changed.
>
>
> If a package build system has such dependencies they should be better
> expressed in recipes and linked using bitbake task level dependency
> mechanism
>
> I wonder why git is needed during install phase
> Can you explain a bit more on that
>
> And since change it in a class it means it has to be a pattern
>

I do not think dependencies will completely solve the problem. Such
patterns break builds when your distro is configured for shallow git
clones. I have run into at least one python library that operates this way
(the names escape me at the moment).

..Ch:W..

--0000000000004bf2940616543d21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Apr 17, 2024 at 12:14 Khem Raj via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div><br><=
/div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Apr 17, 2024 at 4:25=E2=80=AFAM Daniel Klauer via <a href=3D"ht=
tp://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &=
lt;daniel.klauer=3D<a href=3D"mailto:gin.de@lists.openembedded.org" target=
=3D"_blank">gin.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)">${COREBASE}/scripts contains a &quot;git&quot; wrapper disabling fa=
keroot/pseudo.<br>
This patch allows CMake to find ${COREBASE}/scripts/git instead of<br>
${HOSTTOOLS_DIR}/git. This is needed for git invocations during do_install,=
<br>
since do_install is a fakeroot task, and otherwise all git commands fail<br=
>
with &quot;fatal: detected dubious ownership in repository ...&quot;.<br>
<br>
I don&#39;t know how common it is for CMake projects to invoke git during t=
he<br>
install phase intentionally. It&#39;s probably more common to do this durin=
g<br>
the configure phase. However, the install step may re-run the configure<br>
step, if some dependencies changed.</blockquote><div dir=3D"auto"><br></div=
><div dir=3D"auto">If a package build system has such dependencies they sho=
uld be better expressed in recipes and linked using bitbake task level depe=
ndency mechanism=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
 wonder why git is needed during install phase</div><div dir=3D"auto">Can y=
ou explain a bit more on that=C2=A0</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">And since change it in a class it means it has to be a pattern=
=C2=A0</div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">I do not think dependencies will completely solve the problem. Su=
ch patterns break builds when your distro is configured for shallow git clo=
nes. I have run into at least one python library that operates this way (th=
e names escape me at the moment).</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">..Ch:W..</div></div></div>

--0000000000004bf2940616543d21--

