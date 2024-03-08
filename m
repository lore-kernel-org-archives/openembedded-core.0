Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5CBC54E5D
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 15:10:27 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.24203.1709910620529997620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 07:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dfgXBoaO;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.177, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so3097676276.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 07:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709910620; x=1710515420; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1l2mZlS8HtsBGHpBCI+MnPwh91btFei0Ua9hL0+dYs=;
        b=dfgXBoaOQwLlfk3Iee+gFQsAHIyd8Mv+lO5hJ7/RiRTK/+zDciiTBF+CknCZjS0IDM
         +dFfayzgoRqHGa+tffvsL14gnKy1fH1NofyEs2xrrawndOkA1DaqTHl1C9fUZYLE/AYS
         7ZEDjDVVCcNak3pCVRgCfQFjv9gO9VEbHNDaCZTW5O+mrK00Hwu1HE5VrPOq5Xu9TwuE
         qE3zrt5pTKsmNU0pPlmICzDEt7KJgW6+byHd/VxIRNKqNU5B26h7YkMhZDoblAyisiGT
         venyY2/LjqASlvEDFIEYgUTFwyRjy+KqtJIuw3MUgF2tad4rWKOhu8ValU0SVdQXEVL/
         Kdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709910620; x=1710515420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1l2mZlS8HtsBGHpBCI+MnPwh91btFei0Ua9hL0+dYs=;
        b=oneqI31N8KJ1Oy5Vu4wbha7/vfEDOWM8lW4oR5Q/AFARyAIBLWPJElx6WVdgzI9+5+
         9aXjHiEu4kuI7v3PInRrb0kABSjZ1Ae80Bkm8FUpUwv1cqQpsDlqt2+FCbt1s3Q4phtT
         J5ln+Bkn8yZavgPDK16sXAbZuTU5BeMqKKnyucjTZKlYRreqqfYAm5u0AD4oWGxYXwcJ
         1y13+/6TkGiuBGpvSCubev/22OjCApKNdLxYx9LdaanKhmPNhii7v0uhS62HPYILVlSM
         32QT6QYwo9Ql3JBF6QLYPeAZ4V+/nrCkLKkU4Xo5QDhcveIr+agmbqjmqrJDRREY7UFf
         4swg==
X-Forwarded-Encrypted: i=1; AJvYcCXGJ5SeclsYWJbTjw9hq72oti8fVsIYWI4FINBac14jm8HFXyqwx9iFuFEyC3W1VUEnDaz2nPHuBeuBxMJV6ny5E91wyh7G2j/n/q5n+C1hkxMxj7/dDSTz
X-Gm-Message-State: AOJu0YxEkOAVJNFtkfwR2smd/2RKPadw8Om00PhFwZbYpRRrlq+4mGoo
	LYqvHJUGjKak6rz52KYuPtrrxhWP+OMoSJFedl4512qIB3mYI0jmkYjYUDRNeOTShnq0/Mnf9gP
	rEWVIWd/2uPenU47sUyrCVS07EwmuktXAHk9vQg==
X-Google-Smtp-Source: AGHT+IFG1qmTS8BfU4FDCBDQkCawWlK51oYFvs6yKzSti8nXRX7BZTLcu/wPTT50ViItBNrI5dQZkNEHZNply3ITLro=
X-Received: by 2002:a25:c781:0:b0:dcf:eb30:c580 with SMTP id
 w123-20020a25c781000000b00dcfeb30c580mr518390ybe.3.1709910619729; Fri, 08 Mar
 2024 07:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20240307193409.987235-1-bruce.ashfield@gmail.com>
 <CAOSpxdaskMSouQhV_FmfS==CnfQ5zikQQ4QwwA3RzqtM6dzrLg@mail.gmail.com>
 <CADkTA4NM7zk6kpWe3BENz2a4Fjqwkx+ECqbu6tvsoktHWC45RA@mail.gmail.com>
 <ZesUK4JntnaikkPb@pek-khao-d3> <CAOSpxdbcpwpcwk+e-46FRKaPMip1mD+f4gE8ZP+jfNnef3S-UQ@mail.gmail.com>
 <CADkTA4O4jJcjhCMOXe0jhLygpvjWww+bzw8c1RnNTm65V3xKCg@mail.gmail.com>
 <ZesnuCYO3_s90qYE@pek-khao-d3> <CADkTA4MzMQFtEXyTcS8Hc4b8bcfPQ5-q=f4bUBUx3FcqkchPXw@mail.gmail.com>
In-Reply-To: <CADkTA4MzMQFtEXyTcS8Hc4b8bcfPQ5-q=f4bUBUx3FcqkchPXw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 8 Mar 2024 05:10:08 -1000
Message-ID: <CAOSpxdZDTQTU7ip-VFuSSO1jboKgJzC19kDG4DfQ2CNWDYbrYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted ptest
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Kevin Hao <haokexin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 15:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196855

On Fri, Mar 8, 2024 at 5:05=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
>
> On Fri, Mar 8, 2024 at 9:59=E2=80=AFAM Kevin Hao <haokexin@gmail.com> wro=
te:
> >
> > On Fri, Mar 08, 2024 at 09:41:14AM -0500, Bruce Ashfield wrote:
> > > > Hmmm . . . Bruce said that the ubuntu patch didn't apply for him, s=
o I
> > > > haven't tried that.
> > > >
> > > > Do you have a kirkstone patch that I can try on the autobuilder?
> > > >
> > >
> > > I'd still rather not go the ubuntu patch route. It is my last choice =
in the
> > > options.
> > >
> > > If this is caused by upstream commits, there should also be upstream
> > > commits that fix the issues. I need to identify those commits and
> > > document why they aren't appropriate for our 5.15 kernel before I pic=
k
> > > up someone's else patch .. since at that point, I have no idea about =
their
> > > logic and other issues it may introduce.
> >
> > Agreed. But that patch is indeed a backport of upstream commit b9684a71=
fca7 and
> > the tweak in order to port to v5.15 also seems pretty reasonable. I gen=
erated
> > a patch based on the latest kirkstone branch. Steve, could you give the=
 attachment
> > a try?
>
> You can give it a try, but I won't merge it as-is.
>
> I'll just go ahead and do it myself, since I won't be ignored on the form=
at
> that I'm looking for in this change.

We wouldn't even think of ignoring you!!

I did fire up a test of Kevin's patch:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6373

Let's see what happens.

Steve

> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196854): https://lists.openembedded.org/g/openembedde=
d-core/message/196854
> Mute This Topic: https://lists.openembedded.org/mt/104794844/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

