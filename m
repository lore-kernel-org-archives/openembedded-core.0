Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82EF8C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 13:00:06 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.11182.1717160401968980678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 06:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hu6fqho3;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-6c11c18871cso1178611a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 06:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717160401; x=1717765201; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAnEhouO7gYdjO1J/ZtSoMhmXLnD+30v5wZWzP5qdig=;
        b=Hu6fqho3hWINg4f0JxCdhBeOdyujajxpjUXSTBx0MS7zEaznt9ROr3fe2w5VwnI7gH
         N+BwXesVRyPhNrrK92/aTd3yD/IxH/WLyTt7jjZ7/zdhpz+gt2PM/NhgpaLLvSWcMd6M
         7NI2zyQMycHfDZJvrI+/Rh3FNX71zrin98sVmpu7z4dl94k71z0xcRjTcKHcySD2eW92
         cbWoGK8JBUFETXlaVVZVRD3XQhiAUB8WazShgCT7vjX9wOAHN+8B7UuFq+XkjCUr/1n6
         rrqDz3DEW0yJAIzPs9hzOsOQ7bso2z3Ammztmd01NgO45c+FzBaTzm1vBrgWGVksaXya
         5mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717160401; x=1717765201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAnEhouO7gYdjO1J/ZtSoMhmXLnD+30v5wZWzP5qdig=;
        b=ESnGbEfVXFFXChatNbTRDgL8hwJkuSaSxuJW7zaaYlTRtP7Q7oUF4gf6cyrmlUw4QF
         Uipt5UHOzPmw4mAp7Qk+08g4gvKAFdPdzi9gDpSqq2DSDYijiLlvQzQlUGIUj+TcNwh8
         Tcj3y4U/G/UGU/+IcrpBLzjyO5MnK8jAvMEDojMzeuI8S4NgdqzBk/GnFVo5EMa6MYXd
         NMCyRmkMtxsewFoY5HIoNzMrJx6mT9Mt8ekAZXBtFuTLcIr4rPHAKL+lwRIDKwmwMXkD
         dfDU3jN10LN0BOCW7fgS7cRKCV6U28n0Yj+eiMUIVr1ddYafsxLfE65kOHxEibcbN7e7
         UmRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXjTnSh9b/3gbzA4K8vLNxJvMyglIuAq0UlzyYTImr6JOKXkGM1lJCx55ThGO1c34IVw6W4yNxlNyC03DTusv48NN/mUFoGZ+HcDlK8jSY3aanjJPq9O1i
X-Gm-Message-State: AOJu0Yz4gZIUcu+fll2Wu6q3KVEoiq24O8/6XfN7uTnkmKdoWe2yDeOg
	OUiex4frnT9s2G6TwLmSx/td6dle3wjYICVi2eGnDYer8NlVOdI2Pz5bviruQ7ySCc2/PtkTmpa
	u3pPhtwlDXuTdxCeQrSjumlvfysBvz/Gt
X-Google-Smtp-Source: AGHT+IG5H9sYim2TS0+2tTpPexRBXeWLFiH1xzI2yy+Exuh1CmTqIB/nac7qflWMchDbG+2am+Jqguufhb5QHWlhaBA=
X-Received: by 2002:a17:90a:fc87:b0:2bd:f242:51c5 with SMTP id
 98e67ed59e1d1-2c1dc58fd62mr1794481a91.25.1717160401157; Fri, 31 May 2024
 06:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717105222.git.bruce.ashfield@gmail.com>
 <c44b4254b0cbc679d548171abbc415a29e4e2b96.1717105222.git.bruce.ashfield@gmail.com>
 <17D485A451D95A5E.21428@lists.openembedded.org> <fff284602f93b1babb2da087c114eab1c23b80d2.camel@linuxfoundation.org>
 <17D493DFBE920C26.14802@lists.openembedded.org>
In-Reply-To: <17D493DFBE920C26.14802@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 May 2024 08:59:49 -0400
Message-ID: <CADkTA4MRYE6RuVLLv+CoGMYLQ3V4y0Ek2EJhuB3m-qQt8x0v4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] linux-libc-headers: bump to v6.9
To: bruce.ashfield@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 13:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200073

On Fri, May 31, 2024 at 8:52=E2=80=AFAM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Fri, May 31, 2024 at 4:58=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2024-05-31 at 09:31 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Thu, 2024-05-30 at 17:44 -0400, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > ---
> > > >  meta/conf/distro/include/tcmode-default.inc                     |
> > > > 2 +-
> > > >  .../{linux-libc-headers_6.6.bb =3D> linux-libc-headers_6.9.bb}    =
|
> > > > 2 +-
> > > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > >  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-
> > > > headers_6.6.bb =3D> linux-libc-headers_6.9.bb} (83%)
> > >
> > > I think this is causing a musl/busybox compile issue:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/938=
4
> > >
> > > but I haven't 100% confirmed that it is this change specifically yet.
> > >
> > > Copying Khem.
> >
> > It is gated by CONFIG_TC, which is disabled in our standard builds but
> > set in poky-tiny. I'll try unsetting it there.
> >
> > There is a patch on the busybox list to fix the compile issue but if we
> > don't need it...
>
> Aha. I didn't build poky-tiny, I built poky and core-image-minimal to
> test, which is why I didn't see it.
>
> This probably explains your comment I saw earlier about busybox
> being a bit concerning due to lack of updates.
>
> What's the preference here ? I can always track down the patch.
>

Nevermind, I see the busybox patch you sent earlier!

Bruce

> Bruce
>
> >
> > Cheers,
> >
> > Richard
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200072): https://lists.openembedded.org/g/openembedde=
d-core/message/200072
> Mute This Topic: https://lists.openembedded.org/mt/106397393/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

