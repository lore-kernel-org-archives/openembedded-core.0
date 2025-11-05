Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C6BCCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 18:03:38 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16185.1762365808343009966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 10:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CjmIoF1M;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-376466f1280so1717611fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 10:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762365806; x=1762970606; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSyjGHAyVW3WapB/1EYVqXjWGS4wZx7V5pxTQDTgac0=;
        b=CjmIoF1MML9Mbq6PjuidOztS8dKd4q6RtzlDUkG3QA1/BdTMq3UZoZAWOjVV16IuuM
         GV3wzNqrVTdUz4q90oNEk/Ygfbgsworvor0+3eoSP5ruA7Qwg+D5buAchZlqs34mDLiK
         rZiPxyHWlO2rh0Ysc3ewZgOBS1qfDBrblsYfgzeKK3zGmQxj4vKw67z9U5Lukof9Y4QS
         gN/DRpN1pbByFOOJqQ9xY5e83k73N/gc5pSyNlwy4eOop3jL2RZdqQPkZlyKA8vcxNcH
         cSIaKrnWfZXkCgYHRiXwq9yrEvkpp0bT4ZKJjfj4ngnARBlmU7A2XACVTFz4GzN4fmPp
         7Fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762365806; x=1762970606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSyjGHAyVW3WapB/1EYVqXjWGS4wZx7V5pxTQDTgac0=;
        b=JMPyMf1eNuomIr0dVgzv8A1LyC0qTzS+l8ElRYPU1W+GLNmBFmQpH2ZIP6h4WRcOU2
         arMw0x41R3IqlyCAuWLhmrR+81fhOz3BQbo4sZXa1Pc/svHvQChl7RHrXa+s9sJlyh91
         nZvzye1cirChN4fIUIBdxUDDx28A2ViUbEh4h9se6vaYnQt+GQHipRlVeIEHNZieFdAW
         vto0cPfuZsE5tiKQd/8Vfu3KMI4KkC3YdT2k2oK0DYkBiK+9IGrz0V+zVA73xWv8aKYL
         aaevx2D3rkO0YttMY06D7DzP5oCk6MZ7jh0tiKnhrpLvngyhO+4hVNnoEH28oyOfvFQY
         lHlg==
X-Gm-Message-State: AOJu0YyTMMnbwgGHEL9gGADeoG7uu2xeQ84gHWUiYQcl1hM/7jK9zJ4y
	sE/bXjRtDmkR9JNiDNd/pxXMw/1EKSfBNN2picG7P3CziIVfqbePcXIIR0b0KcQFd6hGsimqEMq
	GmqXs7inm/fE0z1LiQy28eBJUOBU9Guc=
X-Gm-Gg: ASbGncukrAj4HeM9l+a9VvLqxvES0daUy+UVUO0RuVP/yjfsfy/xB7/kGclqtzQR69f
	eQVmoFowKZJWeu4+PJ4grsTmS7jY8xCCqJ0sYmqL64qg0bYsyJueuRoynGGEjaqBl1q9bZCO9RM
	7SD1ykdJ4+QMkuQ56n9gC75wYj3S+xs7YRGvgY+IPLl8koYxJDfAsF3Tk0+8mh09jXxYwI/JJKi
	yZl3n4dRuOoY7L1Y5aCW3XMdJs0RQjWGq6bBCKOX7rIlC+IOATuZh7zoEl+WmY=
X-Google-Smtp-Source: AGHT+IHYn96i/mHMuLLWCc7vCRnDwvldl8n8DHu4VYuEP+WLp630Yl3Bc/SjaG/HTwpJvbWHQ5hc6pWc1rgrr3lNeEo=
X-Received: by 2002:a05:651c:4401:10b0:37a:4592:7ef9 with SMTP id
 38308e7fff4ca-37a5140d7b7mr10547821fa.22.1762365806169; Wed, 05 Nov 2025
 10:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20251105115723.560713-1-alex.kanavin@gmail.com>
In-Reply-To: <20251105115723.560713-1-alex.kanavin@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Nov 2025 19:03:13 +0100
X-Gm-Features: AWmQ_bkl1jeDApn0sl7EPqspv300qtLOnQyQeOMGF2CtglBKVm5ErkI47sg1HCA
Message-ID: <CA+chaQfuen4jf_Gv7qMqjauGVuBchXPjaT1g5dWgM6c-xog-Dg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libnput: correct upstream version check
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 18:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225778

There is a small typo in recipe name in the subject.

On Wed, Nov 5, 2025 at 12:57=E2=80=AFPM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> It wasn't updated when the recipe was switched to git.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-graphics/wayland/libinput_1.29.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/wayland/libinput_1.29.1.bb b/meta/reci=
pes-graphics/wayland/libinput_1.29.1.bb
> index 79df97ac068..809c291e233 100644
> --- a/meta/recipes-graphics/wayland/libinput_1.29.1.bb
> +++ b/meta/recipes-graphics/wayland/libinput_1.29.1.bb
> @@ -17,7 +17,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libi=
nput.git;protocol=3Dhttps;bra
>             "
>  SRCREV =3D "dc2c1ad181be88e1487468f7ca6f9d320981f133"
>
> -UPSTREAM_CHECK_REGEX =3D "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> +UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
>
>  inherit meson pkgconfig lib_package ptest
>
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225751): https://lists.openembedded.org/g/openembedde=
d-core/message/225751
> Mute This Topic: https://lists.openembedded.org/mt/116132958/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

