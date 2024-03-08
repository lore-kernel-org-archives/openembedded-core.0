Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B37C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 15:05:07 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.24066.1709910301913642224
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 07:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aLJ8u0uC;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso1810097a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 07:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709910301; x=1710515101; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZBiFNi/m3ZXhAaaq9qPkVfw8S8oApHbW6eE9qbhHN4=;
        b=aLJ8u0uCO1nsoXuD4jEKmilRYwy9s2ZVjDpA/Asj6RvPRggVd6Zaz+T0I0aG5PErgV
         aJ1NO8got1Gs1hBvMPEtiL+0IUcVF4q9ZG5DQLhUn17b93kNKR0Y8JadpcxUC1WNGPMk
         Rt07se6BVoy9Je5Sc0DWp2JQtYyKgu0JOdayVLnLcSgnY370/OJAsXnXqSNxpbPV3zwN
         FYWq87XcA1JdgG9hoA+/Y56dirt9hmXwDEtB/beB6MKiYgywVkjxkBKmOQS3i9lWidZy
         0YtKd3pR549rHZnwlHudKY6rL3J9ljG1TWncuz6VmB/Rm3cAIFN7tHLNce4nOkwozrkZ
         /1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709910301; x=1710515101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZBiFNi/m3ZXhAaaq9qPkVfw8S8oApHbW6eE9qbhHN4=;
        b=D54D4Y68anKSkON/Prn2y0Rr6f8bif5nstSAytuvpbJ5tvbhv0hjuNvam5wAREh4Va
         ZLNA9gxZC6pI+82U5aaRKWdTRg4+kLOHNIQ88zy9At8FppqSPR9uJyX2wPEd7XDjvS33
         C3pL+NZkfTwtT4JeIU6XiiESZC8KztAXNDfoP/rdMFusjqbsLTNG0ZQhJ5WMfHYW0Flr
         LFABqeZ3F0udKg1dqh4LlnabAY1Ld0neOvZCqUpcjgPkx8HLuEw0WTSSNMZVDYNt+ORB
         RzxOxuNvAFCFQToP/S+Md/K2AMYCmZPrHBgl6wo63o7bmDT5Ss4c/WOGOLqSkAzG4ig5
         oR2A==
X-Forwarded-Encrypted: i=1; AJvYcCU5UXWv0HY2yyYm9NI5bD02/xy1rZhFqY/ePpqk9qPEOJgsgwyo8lwir2YWxFSB7wGV7QDKpCnyqVaJHgkkiuTSaJjagyf6qqX/oFmSTcuzRUu72+BIk7Uk
X-Gm-Message-State: AOJu0YwsOgT+4hS0Bv0Ry/lmGYmyMKqGnizEuQVZmuvuOex3OrXLEC5W
	bnenitR0oO0JOx1zhcncHUciQbv+UrlirL3LttuwV2YSptKoB/u9AiM6mDlFPP7RN65WVcav7Hs
	rAE8Z0afxkaEndvFn3p1oB7p9bpSevLG8e28=
X-Google-Smtp-Source: AGHT+IHWSsmfmd47CJ3CpmG2onowCCoGlwnsevqJVAPyYNbbL3pAldLSO3bqUEm5YJb6Dlg5Kev+lt6czfp0RTr29o0=
X-Received: by 2002:a17:90b:50c4:b0:29b:9c92:a287 with SMTP id
 sb4-20020a17090b50c400b0029b9c92a287mr265830pjb.36.1709910301188; Fri, 08 Mar
 2024 07:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20240307193409.987235-1-bruce.ashfield@gmail.com>
 <CAOSpxdaskMSouQhV_FmfS==CnfQ5zikQQ4QwwA3RzqtM6dzrLg@mail.gmail.com>
 <CADkTA4NM7zk6kpWe3BENz2a4Fjqwkx+ECqbu6tvsoktHWC45RA@mail.gmail.com>
 <ZesUK4JntnaikkPb@pek-khao-d3> <CAOSpxdbcpwpcwk+e-46FRKaPMip1mD+f4gE8ZP+jfNnef3S-UQ@mail.gmail.com>
 <CADkTA4O4jJcjhCMOXe0jhLygpvjWww+bzw8c1RnNTm65V3xKCg@mail.gmail.com> <ZesnuCYO3_s90qYE@pek-khao-d3>
In-Reply-To: <ZesnuCYO3_s90qYE@pek-khao-d3>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Mar 2024 10:04:49 -0500
Message-ID: <CADkTA4MzMQFtEXyTcS8Hc4b8bcfPQ5-q=f4bUBUx3FcqkchPXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted ptest
To: Kevin Hao <haokexin@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 15:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196854

On Fri, Mar 8, 2024 at 9:59=E2=80=AFAM Kevin Hao <haokexin@gmail.com> wrote=
:
>
> On Fri, Mar 08, 2024 at 09:41:14AM -0500, Bruce Ashfield wrote:
> > > Hmmm . . . Bruce said that the ubuntu patch didn't apply for him, so =
I
> > > haven't tried that.
> > >
> > > Do you have a kirkstone patch that I can try on the autobuilder?
> > >
> >
> > I'd still rather not go the ubuntu patch route. It is my last choice in=
 the
> > options.
> >
> > If this is caused by upstream commits, there should also be upstream
> > commits that fix the issues. I need to identify those commits and
> > document why they aren't appropriate for our 5.15 kernel before I pick
> > up someone's else patch .. since at that point, I have no idea about th=
eir
> > logic and other issues it may introduce.
>
> Agreed. But that patch is indeed a backport of upstream commit b9684a71fc=
a7 and
> the tweak in order to port to v5.15 also seems pretty reasonable. I gener=
ated
> a patch based on the latest kirkstone branch. Steve, could you give the a=
ttachment
> a try?

You can give it a try, but I won't merge it as-is.

I'll just go ahead and do it myself, since I won't be ignored on the format
that I'm looking for in this change.

Cheers,

Bruce

>
> Thanks,
> Kevin



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

