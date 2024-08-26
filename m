Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8E0C5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 10:45:41 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.50304.1724669134288030829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 03:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fn9+5Gft;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-44fea44f725so31743771cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 03:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724669133; x=1725273933; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xu70vUZs2l3P6zJ9ekdbC9NtZcnbZvGhCqC4Qhw5k9k=;
        b=Fn9+5GftveYsFaIKcSf6p0uiD8hMfhQkzGSILb101xSxtRtGZUPN0FXSoqwj7T4AIN
         5H7+ob5JDDgrR3wRXa6JPzW7dv8XWwa+SuOKxnncEsyM2W0dvaubkggk22L3zXdzSpxE
         ybsO/HOjLeRKEzGjEs8UTn26gvT0GdYsWcpFdm+WHlSt9bNPeVgeOM0IHRNmyKm40TBq
         1d8QLf33xElLD0Ke4sm/C4NSF7EA/kjTSUPuA1+uoNmCqZMjB+OoqGlPr0BvafM/E+JE
         UNDz1z81WZVOwo54gAawPgnEYbzagH1gpJPjbDqEOs3pBwt3xBTjh4t6VUauWQby9lLJ
         tK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724669133; x=1725273933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xu70vUZs2l3P6zJ9ekdbC9NtZcnbZvGhCqC4Qhw5k9k=;
        b=xP0SouhQU3arJ53Ro9O71m+fs/UHF1xv55cLp7VETa+X8d0Bxng94bQphM5aI/bsM6
         MBC4tV320MLKfz9cqrTPqU7ZWftXadVXPUQ/SUCCdps7lpawHfbkPQ0fiKVHaFOr5x9b
         7aSsCSbsRnJSvK2kbLBHmZZ0iCYQplkxo9VYjBJFBgDiuBlPbJ1NP5YYNIjnqugG/Se9
         Ql9naLR+u/6StE6N0LPlH7JkD3ynPQvssW/py8JrgGhuWRHxTGItIiwbEFzJ2LKRxYl3
         ttYKbYPswlsFZFp9ebim1j/NSGkUtaPETlI2PhfSY6EfwmX3GpulL9XjsNGQst2LM60t
         nueQ==
X-Gm-Message-State: AOJu0YzDk6Npp7Q08vKU/Lo59hITaHgZNthRnDbL/eZJy4bl9b2xmwRd
	o/8O3G8lFY9/vf1D70oYtFAC2+d4mcloIje8AVlk8sKLG+sUe9bqV2QX9EXECV9nQ2YXGCgeuTP
	9s+iiJp2WoNDzpCOxLTz6z0YMK4g=
X-Google-Smtp-Source: AGHT+IFWrYYVm7tjwXLzSYd/kmxDljLhKepn/1wvhGHY+eg6wbHxMei0Q1Oq++ZQuyHpUohExcVo+RB0x7SdaYj0Jus=
X-Received: by 2002:a05:622a:1c0b:b0:456:45cc:2b5a with SMTP id
 d75a77b69052e-45645cc3016mr107839521cf.25.1724669133190; Mon, 26 Aug 2024
 03:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAHirDJ8tUihjou3-4qirjk1vGVTXVrRg+TjKxmu2qvOtj2EVwQ@mail.gmail.com>
 <CANNYZj-aBjxP_usuhdoMNKvdcEAzw7-N2UiSqCTkoBqRAv9j4w@mail.gmail.com>
 <CAHirDJ_V1Tc4a268w1uUXYrNAd_MJCjuVJOY0YPwzjF3wvS9-Q@mail.gmail.com> <CANNYZj8cVdqCmftivNzBxvp0L6bsgHWwv4V0eAEyDvsAdAh8DA@mail.gmail.com>
In-Reply-To: <CANNYZj8cVdqCmftivNzBxvp0L6bsgHWwv4V0eAEyDvsAdAh8DA@mail.gmail.com>
From: Claus Stovgaard <claus.stovgaard@gmail.com>
Date: Mon, 26 Aug 2024 12:45:22 +0200
Message-ID: <CAHirDJ9ZDZBvtFmjbypBzF6x7O2VTgESRvrpAmhYu0eSvUMrrw@mail.gmail.com>
Subject: Re: [OE-core] SDK in scarthgap after package_manager: Change
 complementary package handling to not include soft dependencies
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>, 
	Andreas Helbech Kleist <andreaskleist@gmail.com>, Ross Burton <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 10:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203745

I will look into the more "direct" sdk - and I can see the idea to
limit the need for generating SDK artifacts.
Though I need to test how it handles breaking changes, and that you
can just "bitbake" the dummy app and it has the needed parts for
building the app itself.
Also if I am going that route at a certain point, it will require
significant infrastructure changes on my part - as we are using the
generated SDK all over in CI.
E.g. docker images with the SDK installed - and I can't see it is easy
to replicate this.

A side note - now that I looked into how this new change was done.

In reality the "NO_RECOMMENDATIONS" variable is now useless. No matter
what you set it to - the behaviour is that it is always set to 1.

<snip>
grep -R no-install-recommends *
meta/lib/oe/package_manager/deb/__init__.py:            extra_args =3D
"--no-install-recommends"
meta/lib/oe/package_manager/ipk/__init__.py:            cmd +=3D "
--no-install-recommends"
meta/classes-global/package_deb.bbclass:APT_ARGS =3D "${@['',
'--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") =3D=3D "1"]}"
meta/classes-global/package_ipk.bbclass:OPKG_ARGS +=3D "${@['',
'--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") =3D=3D "1"]}"
</snip>

I am puzzled that we did not just change the default of
NO_RECOMMENDATIONS to 1, and then kept the option for enabling
installing of soft dependencies, and adding a note that you are on
your own if you disable it.

Would it be better if a patch created a "new" variable with
INCLUDE_RECOMMENDATIONS - default to false, and with notice that
enabling it you are on your own.

What is the future plan for SDK - is it to only support the "direct" eSDK?

PS - It could also be a topic for Yocto Project Developer Day next
month (hope to meet many of you there)

On Mon, Aug 26, 2024 at 11:42=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 26 Aug 2024 at 11:26, Claus Stovgaard <claus.stovgaard@gmail.com>=
 wrote:
> >
> > Will look more into it eSDK, though I would expect other also has the
> > need to generate SDK to support app teams without the specific app
> > itself part of the SDK, but with all the dependencies for the app.
>
> I was referring not to the classic 'esdk' (where you bundle a 'locked'
> yocto build into a tarball and distribute that), but rather the new
> 'direct' sdk, where you run a few bitbake commands to populate
> sysroots etc. (running them doesn't require 'knowing yocto'), and then
> compose a regular SDK environment from that. This cuts out the need to
> generate and distribute clunky SDK artifacts, but you do need well
> functioning sstate infra. Then making changes to 'yocto' (e.g. new
> boost) and fixing the apps becomes far simpler and more direct.
>
> Docker images tend to grow huge without upper bounds, as every team
> wants 'their stuff' in it, and you can never know if anything can be
> trimmed out until someone comes screaming at you for breaking 'their'
> team process.
>
> I wouldn't say it's right for app devs to not care (or want to know
> anything) about how their work is integrated into a complete system.
> Well rounded experts should know the product pipeline.
>
> If you want to stay with the current 'classic SDK tarball' approach,
> I'd tweak TOOLCHAIN_ variables, possibly with a script that looks at
> what apps produced by recipes actually use and need (so unnecessary
> items don't linger in that list forever).
>
> Alex

