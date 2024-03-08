Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66ACC5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 18:43:04 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.1070.1709923375927383058
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 10:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JcshKsjS;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.181, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dbed179f0faso2616446276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 10:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709923375; x=1710528175; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fvv5B4WnX1c6cnfFQuO/nKLG4NsWUY3TAi/didfOOEM=;
        b=JcshKsjSGabDw+b3SEU9BzSZLPmpoPw+WudmggFXW2Tcd/BFbGn3Emm0z7F/7pPaB4
         Xc637kFo+9gF+YTkdJ2rtc+D2niLuS0IQfiHyNYtKnyKk4YqzG/yFy0XXuFP/JwIIvg6
         OuaM/Fi8MzJ36wXUtNHFsB6VqR7kuPJcW9uHEvgOFIaG0tSr2ZQi626OYbgsCc5sfptT
         7RqOOjgNXlEkKmYCKxotjTk1lUaWTyFldxv4MlQRLFeG2jjtTiO7PqqzrdFPTj5lOiT2
         198ybG132Iw5+3Nzmnozcnsiedj/g77VSFhKjPHnxc0KzGPMNj025uIsiXU75wLNkP02
         Ao1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709923375; x=1710528175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fvv5B4WnX1c6cnfFQuO/nKLG4NsWUY3TAi/didfOOEM=;
        b=DBa7jQjsc13mxuq9KR/PSWVN1Mez4hgBZxZf+cYV15YmAIkK9MkP/+q3jAHu5fnOdb
         Tk0rFBi+8YK/7GecC7Kh7qzt3uKtC2O5Waelcqc7O90Oej7r1BGPMZXQh6c6UHi+Ovvl
         ShKxrtDXb8bfiangP1h6ytbKFlhRs6RtcYj35o8fFmziRhBCBM7iuKPg33eW6D9GBXAs
         YlHxNiSCOY7OgYJYN1EX4ek7LJw7dZ3rtnuJDYWY3Apm8OvWuEuTsVw7qYgh1j+qbz45
         DEJStTUboInQmSgsyvcz4zG123LzAzfQRLCKM5QpleoS1Kt+4GGm+fWQYOXl99oM06V/
         1eKA==
X-Forwarded-Encrypted: i=1; AJvYcCV3hHg07alwGvbxyTeeIPN1YlH25WsiSGR4Hwaq4C1yg2jubLTBvVEANJx0oWaHr64wjwIH9LGObPFUHj5H2Q4HE4vfYRP8oIbhCRuSKrfURVXYt0b7Q5Ca
X-Gm-Message-State: AOJu0Ywfv4TmxroawWSWamke4V0Ih2x1tVt0cTYNC2ne5UPmlD/hj2t+
	KT5LAi2vUB4ZEJ5wnakxAzv24UxN7p9VXo6hLwwY4MmzYJdNhLVp1ymW0yjv7gXs6Prh/ff+TGX
	LGdQ95CvrP9Lh7e9Tt3kYl0vAfWlG09NpOD0V1w==
X-Google-Smtp-Source: AGHT+IGifsKmhMTg4Ypix7MEeDvpwFDDpjUFPYawWcqg3sJDEd+mD5Ch062e1Hvahl2fi6/EARi8LvP2u3VB4EpKVMQ=
X-Received: by 2002:a25:a290:0:b0:dc6:cf8e:8f97 with SMTP id
 c16-20020a25a290000000b00dc6cf8e8f97mr1080949ybi.27.1709923374651; Fri, 08
 Mar 2024 10:42:54 -0800 (PST)
MIME-Version: 1.0
References: <20240307193409.987235-1-bruce.ashfield@gmail.com>
 <CAOSpxdaskMSouQhV_FmfS==CnfQ5zikQQ4QwwA3RzqtM6dzrLg@mail.gmail.com>
 <CADkTA4NM7zk6kpWe3BENz2a4Fjqwkx+ECqbu6tvsoktHWC45RA@mail.gmail.com>
 <ZesUK4JntnaikkPb@pek-khao-d3> <CAOSpxdbcpwpcwk+e-46FRKaPMip1mD+f4gE8ZP+jfNnef3S-UQ@mail.gmail.com>
 <CADkTA4O4jJcjhCMOXe0jhLygpvjWww+bzw8c1RnNTm65V3xKCg@mail.gmail.com>
 <ZesnuCYO3_s90qYE@pek-khao-d3> <CADkTA4MzMQFtEXyTcS8Hc4b8bcfPQ5-q=f4bUBUx3FcqkchPXw@mail.gmail.com>
 <17BAD2A66EE04CAD.2608@lists.openembedded.org>
In-Reply-To: <17BAD2A66EE04CAD.2608@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 8 Mar 2024 08:42:43 -1000
Message-ID: <CAOSpxdbZaDdip_yn6X8x80MWXhLLVPz+_SCWGO-TTKU7nDdKSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted ptest
To: steve@sakoman.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Kevin Hao <haokexin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 18:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196860

On Fri, Mar 8, 2024 at 5:10=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> On Fri, Mar 8, 2024 at 5:05=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gma=
il.com> wrote:
> >
> > On Fri, Mar 8, 2024 at 9:59=E2=80=AFAM Kevin Hao <haokexin@gmail.com> w=
rote:
> > >
> > > On Fri, Mar 08, 2024 at 09:41:14AM -0500, Bruce Ashfield wrote:
> > > > > Hmmm . . . Bruce said that the ubuntu patch didn't apply for him,=
 so I
> > > > > haven't tried that.
> > > > >
> > > > > Do you have a kirkstone patch that I can try on the autobuilder?
> > > > >
> > > >
> > > > I'd still rather not go the ubuntu patch route. It is my last choic=
e in the
> > > > options.
> > > >
> > > > If this is caused by upstream commits, there should also be upstrea=
m
> > > > commits that fix the issues. I need to identify those commits and
> > > > document why they aren't appropriate for our 5.15 kernel before I p=
ick
> > > > up someone's else patch .. since at that point, I have no idea abou=
t their
> > > > logic and other issues it may introduce.
> > >
> > > Agreed. But that patch is indeed a backport of upstream commit b9684a=
71fca7 and
> > > the tweak in order to port to v5.15 also seems pretty reasonable. I g=
enerated
> > > a patch based on the latest kirkstone branch. Steve, could you give t=
he attachment
> > > a try?
> >
> > You can give it a try, but I won't merge it as-is.
> >
> > I'll just go ahead and do it myself, since I won't be ignored on the fo=
rmat
> > that I'm looking for in this change.
>
> We wouldn't even think of ignoring you!!
>
> I did fire up a test of Kevin's patch:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6373
>
> Let's see what happens.

I can confirm that this patch fixes the parted ptest issues and does
not trigger any other ptest issues.

However since there is a kirkstone release build scheduled for next
Tuesday, the current plan of record is to revert the previous
linux-yocto 5.15 version bump series for the release build.

I will then wait for a patch from Bruce that fixes the problem before
reapplying it post release.

I apologize to all for not catching this prior to merging the version
bump series :-(

Steve

> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196855): https://lists.openembedded.org/g/openembedde=
d-core/message/196855
> Mute This Topic: https://lists.openembedded.org/mt/104794844/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

