Return-Path: <fede@evolware.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3726C433FE
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 04:43:17 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web12.7541.1633927396696281543
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 21:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: fede.evol@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id r17so3074943uaf.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 21:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kcIuyt9Xrin4i7FMl6Kh2XnMmEQIN4ZwwXokWi3bfe8=;
        b=kHJlmYVXoqJRP1uvye/lfLvwGC9KAaMtAHx48NIt7k3++TAJyeLo85EHgC+KFupcfh
         NSJXcxPQmDpcqSQGg9A48dnuAyNJW5c59cGqvGdV2LOkUsEsVWyvKtZjd328xiJRFgA/
         vwMo1wNyELyOkEPA7QYx2R0l+Mb4Dz8JKekuxw/fCbkrF8c65P5R8/GK9qUbVydvF36x
         6NYOb9KVPGCUWvUkptmovidgSC0ElenhwjquusLtL0PjEebExWm4w1N0HOEPA18Z28t7
         vYBwkrFYG4PEJWVSuksggMN1P+3Z4iHWHvF0Jz353jdnltBXwL4Web+lhdBcCvaWN8hB
         W7nw==
X-Gm-Message-State: AOAM533NPFZgrqbVfX896hoQim03AUWSokpOaiPCNlrbPqXH0XHmdZS8
	CBucHo6G0vm0myiQRczz9L3ob1FmYLbcrGZhpuk=
X-Google-Smtp-Source: 
 ABdhPJxebIsigzbkO74hE90cIDWREkh7nIyBJ4HJUJ5wNiiqJIZukD6VdtjsDavfordexRsHqR444RI85a9tCKbtRWE=
X-Received: by 2002:ab0:3d99:: with SMTP id l25mr13510378uac.52.1633927395790;
 Sun, 10 Oct 2021 21:43:15 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAA=hcWSfqgxOX8UjwW35tD4VMC8c0SHWVo=_=z38NH7+rq6dAg@mail.gmail.com>
In-Reply-To: 
 <CAA=hcWSfqgxOX8UjwW35tD4VMC8c0SHWVo=_=z38NH7+rq6dAg@mail.gmail.com>
From: Federico Pellegrin <fede@evolware.org>
Date: Mon, 11 Oct 2021 06:43:04 +0200
Message-ID: 
 <CAM6O0Zg3qNqZbtkKjTXQdSwD9LAjrKOaumshWk9Swvb7OMT8VA@mail.gmail.com>
Subject: Re: [OE-core] How to trigger Yocto Linux /etc/profile or shell
 scripts in /etc/profile.d without shell logging in?
To: JH <jupiter.hce@gmail.com>
Cc: yocto <yocto@lists.yoctoproject.org>,
	OE <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000003d35305ce0c5e2d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 04:43:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156810

--00000000000003d35305ce0c5e2d
Content-Type: text/plain; charset="UTF-8"

Hi Jupiter,
/etc/profile and similar are interactive shell (/bash) concepts, not really
system startup ones. So indeed: just on a login (be it local, ssh and so
on) they are executed.

If you want to execute something else without the need for logging it, you
should look elsewhere, depending on your system manager: if systemd you
should create a service and enable it, if sysvinit a init.d script.

HTH,
Federico


Il giorno lun 11 ott 2021 alle ore 06:30 JH <jupiter.hce@gmail.com> ha
scritto:

> Hi,
>
> The Yocto uses /etc/profile for root login, but there is no root
> physical login in an embedded device so the /etc/profile is never
> called, I added a shell script to /etc/profile.d, it was not called
> either. Both /etc/profile and scripts in /etc/profile.d can only be
> invoked when I physically log into the debug console, that is
> impractical. Appreciate your advice, how do you resolve that kind of
> problem?
>
> Thank you.
>
> Kind regards,
>
> - jupiter
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156808):
> https://lists.openembedded.org/g/openembedded-core/message/156808
> Mute This Topic: https://lists.openembedded.org/mt/86229953/5117409
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> fede@evolware.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000003d35305ce0c5e2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hi Jupiter,</div><div>/etc/profile and=
 similar are interactive shell (/bash) concepts, not really system startup =
ones. So indeed: just on a login (be it local, ssh and so on) they are exec=
uted.</div><div><br></div><div>If you want to execute something else withou=
t the need for logging it, you should look elsewhere, depending on your sys=
tem manager: if systemd you should create a service and enable it, if sysvi=
nit a init.d script. <br></div><div><br></div><div>HTH,</div><div>Federico<=
/div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Il giorno lun 11 ott 2021 alle ore 06:30 JH &lt;<a href=
=3D"mailto:jupiter.hce@gmail.com">jupiter.hce@gmail.com</a>&gt; ha scritto:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
The Yocto uses /etc/profile for root login, but there is no root<br>
physical login in an embedded device so the /etc/profile is never<br>
called, I added a shell script to /etc/profile.d, it was not called<br>
either. Both /etc/profile and scripts in /etc/profile.d can only be<br>
invoked when I physically log into the debug console, that is<br>
impractical. Appreciate your advice, how do you resolve that kind of<br>
problem?<br>
<br>
Thank you.<br>
<br>
Kind regards,<br>
<br>
- jupiter<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156808): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156808" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156808</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86229953/5117=
409" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86229953/5117409</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:fede@evolware.org" target=
=3D"_blank">fede@evolware.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000003d35305ce0c5e2d--

