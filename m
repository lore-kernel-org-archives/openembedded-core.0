Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E69C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 17:43:18 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.11433.1644169396306264893
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 09:43:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J7Jip81U;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id b37so19367749uad.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 09:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Zv7ck0PCxe6dm2bW4m90EIJ3zHPWFoFUXSjPGnRRFo=;
        b=J7Jip81Ug4TMC8GsWN/u6ZLLfPyyDtHXx7JVM/dZVQZ7qTKkl5dDY82wLK4WxCj8kY
         8YfK+4mk+4Fpqg7zb/b+HrsapFClxXUsCDKUfa5q2uYs0J516f52t+nMDM2oT8FGeRpS
         DXhkW2oqOva4bSq0wSIXLHBACIWFpTfJBnlZ7gi9CHgeB6BabtiuxLCeeRWkpgFcQmV3
         FDP1leJtoi2/BPBtKedy7TplbZIsQQ5IdxSKbYXe8YZE9zEF04X9mlOCejbtxIsHaaSD
         WfX5+Ot9ZBoEqsmEALGXUdKuR4iqCWkrmCgEhxnVc5cVMwSu689BJZM40KUVT8EEXN8Z
         9Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Zv7ck0PCxe6dm2bW4m90EIJ3zHPWFoFUXSjPGnRRFo=;
        b=X39N2nNx+W8y7mWXiw8X4Z5s2bVW+Grqg/Ojs31TF1Sm8w6Mwlwjj35s769kqO0ChT
         30cqJyp7mm7zO0AI+3hsTVBPT5wMcUP4sc/PpQvB5JvBxs9j6IAM48AjK1e1JCDG3nJs
         vknxXaEuP8JdZPyGZqGUqyAL8Frwu7UqCKlBbzli8ct03R6M388dUS+DFKcW+dri9UJB
         8pL2P80HDxQFudkqXlpBf+Owg7zXuhuD8LRZLfsWtoCbBcOgl/3o11fqpIEIJojgrlgf
         AAx5zkjXr/wQ1ZjXWf3eggtdOqc1e6lFgIKbkc0u10ew5g0Ff+Jb4JV6PJy9wzDKXqyw
         pBuA==
X-Gm-Message-State: AOAM5325QeBHjctnXjWqqVjrMA9vESwj0N6pFtl26xC07ZFSjNnTgB7v
	PiGEPDCnANrvVru3Wb8jvK1r7/XJHFgcJ09sHIM=
X-Google-Smtp-Source: 
 ABdhPJyTosPqyeJZkWTS68QF9ysPE9dIHiRr8/CO4rxqbKecGdmQUfjITjAA3wOPI7DDvEntuNq1vL8kubXJUfEo6+Y=
X-Received: by 2002:ab0:2705:: with SMTP id s5mr2314612uao.22.1644169395471;
 Sun, 06 Feb 2022 09:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <4cd9f1953e5a5a3287325f4cbec5c2a9e9aa84fb.camel@linuxfoundation.org>
 <fde77e2c-28ad-3f94-127b-e02fe9d6c5c7@herbrechtsmeier.net>
 <d59a9eeb-4d7a-3050-bcdf-9cbdb284bdb6@kernel.crashing.org>
 <CANNYZj_sSHo29iDkJTndnyuXu57z=V976WGH6ii_T9OEAmKGxg@mail.gmail.com>
 <a5d6e75cafe701420bb355392870ffd412ac7f1f.camel@linuxfoundation.org>
In-Reply-To: 
 <a5d6e75cafe701420bb355392870ffd412ac7f1f.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 6 Feb 2022 18:43:04 +0100
Message-ID: 
 <CANNYZj-VtPqwA7-viNb4TmKFxzcC5N2dpGbXV2FUxDU=neJ9ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>,
	Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000c4863705d75d044e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 17:43:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161409

--000000000000c4863705d75d044e
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Feb 2022 at 18:35, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > Selection of init manager is a distro setting, it can be used by
> component
> > recipes to make decisions, and overriding it from images is neither
> tested nor
> > supported.
>
> There is a hybrid where you can enable sysvinit and systemd at the same
> time and
> use them in different situations. We do test that and it is that test which
> showed issues on the autobuilder with this patch.
>
> It isn't as easy as pick and chose either in a given image but handy for
> initramfs and some other uses.
>

I believe what we test is this:
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n1034

It only enables both systemd and sysvinit distro features, but does not
redefine init managers on the image level - it remains systemd everywhere
as explicitly set in the test (with ability to load legacy sysvinit scripts
added to it).

Hybrid initramfs case should be helped by the recent multiconfig patch:

    kernel.bbclass: Allow initramfs to be built from a separate multiconfig

Alex

--000000000000c4863705d75d044e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 6 Feb 2022 at 18:35, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; Se=
lection of init manager is a distro setting, it can be used by component<br=
>
&gt; recipes to make decisions, and overriding it from images is neither te=
sted nor<br>
&gt; supported.<br>
<br>
There is a hybrid where you can enable sysvinit and systemd at the same tim=
e and<br>
use them in different situations. We do test that and it is that test which=
<br>
showed issues on the autobuilder with this patch.<br>
<br>
It isn&#39;t as easy as pick and chose either in a given image but handy fo=
r<br>
initramfs and some other uses.<br></blockquote></div><div class=3D"gmail_qu=
ote"><br></div><div class=3D"gmail_quote">I believe what we test is this:</=
div><div class=3D"gmail_quote"><a href=3D"https://git.yoctoproject.org/yoct=
o-autobuilder-helper/tree/config.json#n1034">https://git.yoctoproject.org/y=
octo-autobuilder-helper/tree/config.json#n1034</a></div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">It only enables both systemd a=
nd sysvinit distro features, but does not redefine init managers on the ima=
ge level - it remains systemd everywhere as explicitly set in the test (wit=
h ability to load legacy sysvinit scripts added to it).<br></div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Hybrid initramfs case=
 should be helped by the recent multiconfig patch:</div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">=C2=A0 =C2=A0 kernel.bbclass: =
Allow initramfs to be built from a separate multiconfig<br></div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000c4863705d75d044e--

