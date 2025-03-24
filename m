Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F15CC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 19:30:55 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.48573.1742844653712238604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 12:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WYu0ZJQu;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-549644ae382so6049545e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 12:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742844652; x=1743449452; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEPbUOAbry3GmBvZHD8+E5HpliyrMLIfzC4TN93TS20=;
        b=WYu0ZJQu2fYJMiDKkcJ/78UUwCzoVIeKRS7vGNBrJzQ2Vo8mKeEI+UZBZL2NyyVDhn
         hX6L5H5FwLoRtpFY8c4OdWOMr28ukEiTOhk3q5jxc5HufdksYCPB6MSHJO82o1vGihdv
         niLMb4/zXolNep06eLQFlHsWBRkKnQLfjC8jtL0H0GrqKRJ6TML1MzjIlw5a9yRWbNzb
         5FMEKPnBk9Pp0Iango9p9BfqFkLsp5Rbq2H6V6Bq3iR7XXIedaa4DeCJtO2gIpbTahKl
         CSSRxEqI5n1f5YJvJBW3DJM1Lpd2eZruPvL3vWiG14s+D1XQiXapQff57i/mzG8jk9NO
         1xEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742844652; x=1743449452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEPbUOAbry3GmBvZHD8+E5HpliyrMLIfzC4TN93TS20=;
        b=v26ZVFEajBLyW9afiuqqLAOPX78U3c0XKPAEqJCODWDA6JB2JE+rxkGix+v475iYw8
         7V2r9yTKxQp51VqFb3YVOZ4ePvtjDFC8vEAFd1PeEEjtr7jZaKiJoTJOWx9oJJXHgc/R
         q1F290VP9x+AIzBi4oCydobou1dTZvwbQTbSPIyGYGCv8Rm5XNOmxBjbLv19TSo540wp
         UUosEaOSvwrGHlmVeamrTrGI/gkUwSbsQwtQT/+ZvTTAQsNXk1thnJ/ncyDyqsDmXss8
         YS3asAFeiABDXy1AYEBo0dfqbGV5OcxaAmhIwMzk3AyeWSC0r25RZn+x6yH+IzXThuJs
         GZgw==
X-Forwarded-Encrypted: i=1; AJvYcCWb2rpHqKffPj0wVRsVVCOs9uLV9xu23fO6UqXNKZM3Z2LI8dvCIJ35k4+Q6V4xcP8aBwJUj7Q1UY1ZHNfxBqZ3TA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YypR7A0ZpNPwIsmNpadyK/LSIAqudIusJvDxR0fjgwKX1DpTb6B
	lRR+RyLqPaf50pombOh7Em+IFzgkouqRDxVXr4lCaHAiHn5Dv/mVCtzrmKdt6OOaLqHi15SlFf2
	fNL90YZ4Iqzj0z2k7FceGYCfZDjc=
X-Gm-Gg: ASbGncuoPtX/P8bzOBWPYdZBHKWiiCl4tayjLtp9bdcyW4LYkOGI1CE3N9Xo6owcBTd
	bvy1W7kxq6gJ6dGDhfsq5JH+O+VNtjFeeJXr3vXqARjN6G/cpR4Wa5Le1+OZ4UQUxEhg40Gmlc2
	R0DU0jSlvFRzrKP0VKNyDDErOjT+ix
X-Google-Smtp-Source: AGHT+IEqwAVM7e/bhUPEcoLKAEry7bbYchiHLUV5u3YUEksCuzIGKefwAUvqxOd9KqiKHJWu6/0bANnJkYlf6gewGzQ=
X-Received: by 2002:a05:6512:3e18:b0:549:883f:665b with SMTP id
 2adb3069b0e04-54ad64ef063mr5780405e87.34.1742844651524; Mon, 24 Mar 2025
 12:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250320165517.129442-1-martin.jansa@gmail.com>
 <182E912DEB60EF95.20788@lists.openembedded.org> <CA+chaQdD7i8xjuz9iPSNMfETo-5BNxsN=LibdZPrgdTYatccfw@mail.gmail.com>
 <182E91CCE4A2B275.19116@lists.openembedded.org> <d3f1a6601b2438007a963b69bf41d647672f78eb.camel@linuxfoundation.org>
 <CA+chaQc4kxzLcbFkZswbftUevsjcO4aYDzNVh6hMxj4miv9m1A@mail.gmail.com>
 <CAAuPjF8oBXzYug4E6HjxicDXbkahs7VXdGubsMi0J0VRho2bNQ@mail.gmail.com> <CANNYZj80f3_vmVSP0sBRVWKix+ZAAYSkT4v-prJHbpO6q8XrpA@mail.gmail.com>
In-Reply-To: <CANNYZj80f3_vmVSP0sBRVWKix+ZAAYSkT4v-prJHbpO6q8XrpA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 24 Mar 2025 20:30:38 +0100
X-Gm-Features: AQ5f1Joy4A2q1FdR2XAWct6BL9G7ayOy42MAolQD5-gLiOJ3Jqk_lRwbQ67wytY
Message-ID: <CA+chaQfsMaBR7NgCKbrw56VSHFNj09r3irFNiCuBeMmZivv37w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cargo.bbclass: allow to avoid appending PACKAGECONFIG_CONFARGS
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: jarsoper@gmail.com, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	DongJoo Kim <dongjoo.kim@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 19:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213571

I had to patch Cargo.toml in gst-plugins-webos to define all possible
options in [features] to avoid "error: the package
'gst-plugin-unifiedbin' does not contain these features:
unifieddecodebin, .." and then I was able to change our PACKAGECONFIG
to pass them with --features instead of --cfg feature and use them
with cargo as the previous patch did. I didn't verify it in runtime
yet, but it passed the build.

If that's the recommended option, then I'm fine with that and only 1/2
should be merged and not this 2/2 nor the revert RP sent earlier
today.

Regards,

On Mon, Mar 24, 2025 at 7:55=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I basically agree with Jean-Pierre. Optional features should not be
> set via RUSTFLAGS at all, rather Cargo.toml in the source tree should
> be extended to include them as described here:
>
> https://doc.rust-lang.org/cargo/reference/features.html
>
> So gst-plugins-webos should be fixed, then the recipe for it, then I'd
> say we should reconsider this patch. If a recipe inherits cargo, then
> it is expected to pass configuration settings via cargo, otherwise it
> needs to use its own custom class.
>
> Alex
>
> On Thu, 20 Mar 2025 at 19:11, Jean-Pierre Geslin via
> lists.openembedded.org <jarsoper=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > In my recipe I use it as:
> >
> > CARGO_BUILD_FLAGS:append =3D " ${PACKAGECONFIG_CONFARGS}"
> > The recipe is public here: https://github.com/Jarsop/meta-zenoh/blob/ma=
ster/meta-zenoh/recipes-connectivity/zenoh/zenoh_git.bb
> >
> > Best regards
> >
> > Le jeu. 20 mars 2025 =C3=A0 18:36, Martin Jansa <martin.jansa@gmail.com=
> a =C3=A9crit :
> >>
> >> On Thu, Mar 20, 2025 at 6:16=E2=80=AFPM Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >> >
> >> > On Thu, 2025-03-20 at 17:06 +0000, Richard Purdie via
> >> > lists.openembedded.org wrote:
> >> > > On Thu, 2025-03-20 at 17:59 +0100, Martin Jansa via
> >> > > lists.openembedded.org wrote:
> >> > > > This 2nd one was supposed to be sent only as RFC, but I forgot t=
o
> >> > > > update subject sorry.
> >> > > >
> >> > > > And this version also has a typo "=3D ?=3D", will send v2 if we =
want to
> >> > > > do
> >> > > > something like this (reverting the
> >> > > > https://git.openembedded.org/openembedded-core/commit/?id=3D1674=
5b20452de60ae2474433cc1a2fb1ed9f6a64
> >> > > > is imho better as it doesn't respect the original author from
> >> > > > https://patchwork.yoctoproject.org/project/oe-core/patch/2022060=
6132653.60232-4-brgl@bgdev.pl/
> >> > > > and with CARGO_BUILD_FLAGS_PACKAGECONFIG it's imho more confusin=
g
> >> > > > than
> >> > > > useful as the default)
> >> > >
> >> > > I have a strong preference for not carrying things like this. If
> >> > > there
> >> > > are existing recipes that break, we should just fix them and move =
on
> >> > > rather than letting the past dictate the future IMO.
> >> > >
> >> > > I'm trying really hard to simplify things where we can.
> >> >
> >> > Martin pointed out I was misreading things.
> >> >
> >> > If there are recipes using packageconfig in RUSTFLAGS then this will
> >> > break that. We probably do need to revert as I really don't like the
> >> > alternative variable mess. It does mean recipes will specifically ne=
ed
> >> > to add the flags to the carbo build parameters but that is the lesse=
r
> >> > of several evils IMO.
> >>
> >> Agreed about the revert being lesser evil.
> >>
> >> I know very little about rust/cargo, so it's also possible that we're
> >> using rust/cargo wrong and there is a better way to achieve
> >> conditional compilation with flags passed to cargo not by RUSTFLAGS.
> >>
> >> I've checked the recipe where we're using:
> >> RUSTFLAGS:append =3D " ${PACKAGECONFIG_CONFARGS}"
> >> and it's public as:
> >> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recip=
es-multimedia/gstreamer/gstreamer1.0-plugins-webosrs.bb
> >>
> >> With the RUSTFLAGS then being used as
> >> PACKAGECONFIG[unifieddecodebin] =3D '--cfg feature=3D\"unifieddecodebi=
n\"'
> >> in the recipe and in code e.g.
> >> https://github.com/webosose/gst-plugins-webos/blob/%40rust/gst-rs/unif=
iedbin/src/lib.rs
> >> as:
> >> #[cfg(feature =3D "unifieddecodebin")]
> >> ...
> >>
> >> Will send revert unless Jean-Pierre or Bartosz have better idea how to
> >> deal with this.
> >>
> >> Cheers,
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#213425): https://lists.openembedded.org/g/openembed=
ded-core/message/213425
> > Mute This Topic: https://lists.openembedded.org/mt/111812482/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

