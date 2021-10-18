Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1CAC433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:54:20 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.37384.1634568859881547351
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZZaQ4UPH;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id i5so5171148pla.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ZSIASj6R+VM07C2+E3UPIRXcdb8BiYbLFhQioeCTg8=;
        b=ZZaQ4UPHeA7Ol0mpS5Enld0Nmlfw1FpzK52k+37YjtzPO57jSYfnxIdJL7xDDIERcP
         2g4BctLPPj/cLpZ6rHwNnfgiSQrslWBF1K3jcUstMW6FpwlQvRnVqtKI0jBkbCwt7lz+
         Ynkkmdr+bJBscxoNAumIl6MgkC6GD3rSVnidBvstKl2TkVvoRLCbN+lmKT/jlG+WQ8DO
         y/hDKF1DasAdkerLOFK7h8ZohECT9lpaW6mKOvwPW/rJy3HRdbbnwPdscZslXcmUJZgk
         KpyAXPSwW1OdTXnfZ91Iw5m48NwJKT7kCGnh3uD9NRSl7NaFIET9UpI5yvpGuckbmqwJ
         tzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ZSIASj6R+VM07C2+E3UPIRXcdb8BiYbLFhQioeCTg8=;
        b=APUdFlBsXrQSq2IKboCZtTWwXkS4aRyrhkscthZydNhQA2VOoWKOTk5MFopOVFt9LJ
         5Dcv6vwoyGOXZJiSp62VA92V0o2nSKAUxM6AETbaqWqq/F2oVKXSjjmGXXEL1s0ALLfD
         Z39Z8ujJb4APe+dzIZLkXuVFwGOohwrtbaJWSeZKEsa3CVPE2cuWHtBRroKdoEQvT6bd
         P982bchWwVhUvasU3PgjLufjGH/zXBMrwz4UFxhH8GivYSKchRRyJ1WodlItqpl1v6a+
         AmZCluhGgHGzfzQDKzZoBQjt+r8jsRSQMaPF/lKKHa2BLmvXrLr2zDLBHHPjd93CZcru
         youA==
X-Gm-Message-State: AOAM530fIzlC71kj68uO0zXhpi0HhwfZ0QUkld1e/I9STkisW8erXo4J
	i1AWartnDEF+rx2lF3qaaUICVEGC8v8cxyWrGiI=
X-Google-Smtp-Source: 
 ABdhPJyjcTovcgOJLQr8me33gWr/ujm7qg1dTO8woTUlozYFl89ahr30PyYGi4FRjGTPXczotvjke9wFyxquD1n8mkg=
X-Received: by 2002:a17:90b:3e8d:: with SMTP id
 rj13mr34156561pjb.183.1634568859397;
 Mon, 18 Oct 2021 07:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211018135322.246963-1-Martin.Jansa@gmail.com>
 <CANNYZj-A0eNR=GWz+-xdZQSxmWYNuU=0PGNQA-1d0w2tSp+NiA@mail.gmail.com>
 <CA+chaQf06t-OSB-x321YRUcWTTuooP=E4o1a0C+asiJJmQzn4g@mail.gmail.com>
 <CANNYZj_7uKo5qJSqVq0gfc2yjeiEW=oLh3Xvkk+JXb0bkGAQiA@mail.gmail.com>
 <CA+chaQe8qS+GrVA5+hYUH_aSrQKFLssOrg1BzLM-fC4gjXUs+g@mail.gmail.com>
 <CANNYZj_-scmARFF6BmDU-fpG3-me+AfyDyCtrt-0V9f4_-e5vQ@mail.gmail.com>
 <CA+chaQc3Y-yrP45-uYBLNMPigXzGtmZPWThMzRHvsTx2SoU7Fg@mail.gmail.com>
 <CANNYZj8JsSFxV8AyRvYWN7zfLGroW3XSnu3FgxXOHmrmbthqng@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8JsSFxV8AyRvYWN7zfLGroW3XSnu3FgxXOHmrmbthqng@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Oct 2021 16:54:08 +0200
Message-ID: 
 <CA+chaQf9oSGQvpDOS1kTziUoD3Z8MxS81cQ9qAcTZ8pH0OC7tg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add PACKAGECONFIG for opengl-or-es
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000039b14c05cea1b8ee"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:54:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157077

--00000000000039b14c05cea1b8ee
Content-Type: text/plain; charset="UTF-8"

So you're testing your version upgrades by a build which doesn't include
the upgraded recipes?

and that's the proof that "the upgrade works as intended" and then you get
angry, because someone reports an regression and even sends a fix for it..
it's early, but I guess I need more coffee or beer to understand this.

FWIW: I'm not going to continue in this discussion before I calm down.

On Mon, Oct 18, 2021 at 4:45 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Mon, 18 Oct 2021 at 16:38, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>>
>>> I do test all my upgrades on the AB. For major ones like python or
>>> openssl, I run meta-oe builds too.
>>>
>>> If the AB gives a green pass (which it did), then the upgrade works as
>>> intended. If you think AB is not doing enough testing, find the gaps in the
>>> AB matrix and address them.
>>>
>>
>>  nodistro build with default oe-core setup obviously isn't covered by AB.
>>
>
> nodistro core-image-sato build is there, but not world. Sato doesn't
> include webkit:
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json#n234
>
> Alex
>
>

--00000000000039b14c05cea1b8ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So you&#39;re testing your version upgrades by a build whi=
ch doesn&#39;t include the upgraded recipes?<div><br></div><div>and that&#3=
9;s the proof that &quot;the upgrade works as intended&quot; and then you g=
et angry, because someone reports an regression and even sends a fix for it=
.. it&#39;s early, but I guess I need more coffee or beer to understand thi=
s.</div><div><br></div><div>FWIW: I&#39;m not going to continue in this dis=
cussion before I calm down.</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 18, 2021 at 4:45 PM Alexander =
Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Mon, 18 Oct 2021 at 16:38, Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br><div class=3D"gmail_quote">I do=
 test all my upgrades on the AB. For major ones like python or openssl, I r=
un meta-oe builds too.<br></div><div class=3D"gmail_quote"><br></div><div c=
lass=3D"gmail_quote">If the AB gives a green pass (which it did), then the =
upgrade works as intended. If you think AB is not doing enough testing, fin=
d the gaps in the AB matrix and address them.</div></div></div></blockquote=
><div><br></div><div>=C2=A0nodistro build with default oe-core setup obviou=
sly isn&#39;t covered by AB.</div></div></div></blockquote><div><br></div><=
div>nodistro core-image-sato build is there, but not world. Sato doesn&#39;=
t include webkit:<br></div><div><br></div><div><a href=3D"http://git.yoctop=
roject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json#n234" ta=
rget=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder=
-helper/tree/config.json#n234</a></div><div><br></div><div></div><div>Alex<=
br></div><div> <br></div></div></div>
</blockquote></div>

--00000000000039b14c05cea1b8ee--

