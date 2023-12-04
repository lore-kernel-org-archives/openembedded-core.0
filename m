Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58394C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 12:52:51 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.67795.1701694364660198667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 04:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BoHX7/jV;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c9f166581dso22511141fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 04:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701694363; x=1702299163; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L+K6GDXjEX84giSEmF5vZbu+qA1LE9bDEJWXUyxzJx8=;
        b=BoHX7/jVImp0Ux3QGm3YU8tqhwO4gV9W5odkwrvK1UAprzNBxw3Bhx4/aiHUo3OxUK
         V4kAyeFE8LW+xXdI/WfG6fjotT50pDE7D0E3e/ot+6zV+AR+VE0+e13yzI67R7Uy7NuK
         tvYh6/l/3tvb4BxjDJCmT4S/Zq8HQ1rFUCno6gxwtqzHeRmEPKVly0JGxn3drw94K7I9
         TG0xS9dxRxxOSsjGwcLL/gzjYqa1Jm9neQYM4WaWx7YCSIJQG7cF8+aAVMpsdvZiOKrr
         PERIKrAYchYNflBYVf/ei8LJltHA0N85SKQ3ljcThifCmxu1xfpOn1j9/YQ9tv8GuIK0
         YEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694363; x=1702299163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+K6GDXjEX84giSEmF5vZbu+qA1LE9bDEJWXUyxzJx8=;
        b=fHfl1EW2xN5fn6UFgc8KS7BO5ZonMVJuMiGP4y6FWRR8FoCqu524ZVM92WJKccQDxs
         xI8jVCoC9Z6nmedoMgbL6jf/BXM38CAq6kWAtz+ebu9BUTh4aoY3VgnalTUJNWVVDAA8
         3C2dMOLjHxO1Mi0tnRU/l0Fr3vgsuUMcPTwcGYnO66KyFK8eVVtdK6ry4vfLYQrIFmx6
         R1wbA0US1sit6vyJ7X9HXk4ByPrnXY84+QnceAqDK99Tt793R04XnZ6Xo+vuPO0YL2No
         AolxP8pRUYilSH6oyVsqfY19o7noKyRyPc9L0xfTjtswlQLnKgX1BHkQZVh1BVA1WNhq
         sYYg==
X-Gm-Message-State: AOJu0Ywh06rejVb4LBpBjfPJYyey1Df7OOMa+36Waura85/bRpOtWFWL
	5ek06kL8oeDLAI8aR8tkLvQW9+b5mbzBwue2HZI=
X-Google-Smtp-Source: AGHT+IGfUGi02dFKkLbKD5N7MDxidy+4qZIOHDgSO3TtAnQqwGcEqguvxRqLgVktVKi2Qsq55TS5ukruc+7rKIRsUNE=
X-Received: by 2002:a2e:9782:0:b0:2c9:f1c6:e20d with SMTP id
 y2-20020a2e9782000000b002c9f1c6e20dmr1196736lji.49.1701694358019; Mon, 04 Dec
 2023 04:52:38 -0800 (PST)
MIME-Version: 1.0
References: <20231122140811.1021807-1-lukas.funke-oss@weidmueller.com>
 <e784d0eeb3b0232f0df98b385ace92dfc625c191.camel@linuxfoundation.org>
 <8ca92320-0ab3-4679-9de1-74f38ad0f8a7@weidmueller.com> <CANNYZj_kV6ZEnFa3-dnFQqhSUGUy7ZE6DyGU9fzqZwsKGw=6tg@mail.gmail.com>
 <abf061da-f67e-47ce-80b4-f6cc7879cc2e@weidmueller.com>
In-Reply-To: <abf061da-f67e-47ce-80b4-f6cc7879cc2e@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Dec 2023 13:52:26 +0100
Message-ID: <CANNYZj-qUhW9XaqkgNQCE2FkLwDFHWXQiUheDidu+NLSAoSZHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/2] patch: reduce changes during patch refresh
To: Lukas Funke <lukas.funke-oss@weidmueller.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Lukas Funke <lukas.funke@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 12:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191736

On Mon, 4 Dec 2023 at 13:48, Lukas Funke
<lukas.funke-oss@weidmueller.com> wrote:
> You're probably right. A little context is always helpful.
>
>  From the top: the proposed change is setting the commit-hash in
> exported patches to all-zero.
>
> When devtool is updating the recipes using 'devtool update-recipe
> <somerecipe>' it figures out (in '_get_patchset_revs()') which commits
> were changed during development (in the workspace).
> Now devtool known which commits actually contain changes. Subsequently
> devtool is exporting the patches with all-zero commit hash (in
> '_export_patches()', which contains our all-zero commit hash change).
> '_export_patches()' also compares the now exported commit-hash to the
> expected commit-hash which is an argument to the very same function.
> Since it they didn't match (see the code snippet), devtool thinks there
> is no change. Thus, the patch is ignored.
>
> If we want to export patches with all-zero commits we have to either
> remove this check or have to export the original commit id in the patch.
> The latter would again introduce noise.

I still don't entirely understand what is happening, but the logic of
deciding whether any of the commits were changed should not rely on
what is written into patchfiles, and rather operate directly from the
git history. That should be fixed first.

Alex

