Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC46C36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 18:55:55 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.47724.1742842554827926552
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 11:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gmwZ5q5N;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c0e135e953so494144985a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 11:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742842554; x=1743447354; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rInyFQVrdlgb78AMJR/HMtmJxjYeNcGzig9ebEqIYuo=;
        b=gmwZ5q5NHJFPHfIu110D061+1YzFQlbnOeF0Zd68P0Z4b+36jmnAXAbk59PBIlqkXK
         GmLvK1NJfTFDkP2LbwrfSECZmm8bxZZPEHlb3XCbf+I3P6YPdW+YTc+mBLmquJnOzEUH
         XeHvHIP2nPOoqVu3EShwd0MqmCQtScy2ywdmhZRdDgrACnSDsdc1DHru3luyEeOz9oF2
         V8xIwikDPf7i7kfxymyuIrV4nSxRB+UEQQ/wtZqLIEn3R74LA/73wH+tCI05iY+EB9aB
         LHR//bm1YYTo05Qs0ao+Licy+5Y4eYUr7nQZUICNdb6EW/ECe57mtGxQWmQ7PqjCis1o
         74Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742842554; x=1743447354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rInyFQVrdlgb78AMJR/HMtmJxjYeNcGzig9ebEqIYuo=;
        b=IEe4YHWZyKk3/kdsilR3N0/U/MNvHxJZ2HRdPihodCn2YgpT01p3NrAzfDWlH3OkEt
         jnwPP16uZo1Xx4siXfQtuHI73MeHcMaj6+zkLq3fSbF9wgOIYPkXOv8vt/sOD5j97bhw
         2TRHWygALCQXwtpdlQVCCo2eLIobZsJVAG1g9EaHGCgwJiwVVxHhDhVJwEWBPjvhGJx3
         ywGt/MYECyVvZ4NxFvpbQHVY+JIR+iVJL10C07qE3kPCEWq0dZemetVCBDkrV7hPhnxC
         4T3LeNzdEZLfGWvZJM/qr1qDs7PAqA71BISpORiembqCGCXcFKORUt77FLBGqjlmx3qp
         m8nA==
X-Forwarded-Encrypted: i=1; AJvYcCXNLQU4ptr3fkpaDgZZ6EmsGlgPf3sDYzq+enpiMlUMcvMi1jVk8AKeJsmlJwcHC2nR7R1v2cPmenZQkAHj856bIg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxroOZ27GNbFZn4fYDmuH4tB1DXJZeymv9b8FtRTPMvT1loX/nJ
	wKEQ8w3TnzVWpaj+x7JmGmKgpGF1/j6cXkhU87GumWJeGir2rZRhqqMpERHwHwQsYkvkbDBYEpT
	sBNI+yVt+GleX4x4PY2DtQlNjda0=
X-Gm-Gg: ASbGncs4iCP+9lBXaAcbY3icihvuyGL8CI9eoi6KEZcV5LDlRmioeCAGaWzc9SgdDq/
	JbhoC6M4pCeq3wXLiNnzPXU7GsAgiaKAsZDM4Czza8gmXwnrfD07ubJZe81V205rZeRwhj36nGo
	DQ5vzzNa4D1iHm9hvZPGCnfM2sRNYSUGx2nRCVnb3cy7sZE2kmIc8OA4faHb6f
X-Google-Smtp-Source: AGHT+IFvLPA5juu8+dgWet7ZfeC7TEkiM4OjIMx80xTtKG3K2IQEtFGWXZ3zJT5rgvafj9iIaY71GOQHHK5RXDshYpI=
X-Received: by 2002:a05:6214:d64:b0:6ea:d629:f48b with SMTP id
 6a1803df08f44-6eb3f2e48dbmr267368126d6.19.1742842553535; Mon, 24 Mar 2025
 11:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250320165517.129442-1-martin.jansa@gmail.com>
 <182E912DEB60EF95.20788@lists.openembedded.org> <CA+chaQdD7i8xjuz9iPSNMfETo-5BNxsN=LibdZPrgdTYatccfw@mail.gmail.com>
 <182E91CCE4A2B275.19116@lists.openembedded.org> <d3f1a6601b2438007a963b69bf41d647672f78eb.camel@linuxfoundation.org>
 <CA+chaQc4kxzLcbFkZswbftUevsjcO4aYDzNVh6hMxj4miv9m1A@mail.gmail.com> <CAAuPjF8oBXzYug4E6HjxicDXbkahs7VXdGubsMi0J0VRho2bNQ@mail.gmail.com>
In-Reply-To: <CAAuPjF8oBXzYug4E6HjxicDXbkahs7VXdGubsMi0J0VRho2bNQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Mar 2025 19:55:41 +0100
X-Gm-Features: AQ5f1Jou6SNY6F6u6wSt37_zCKfmEbuDffm2DLEpm_wA-PvYjzxR8ZEAxmeP71o
Message-ID: <CANNYZj80f3_vmVSP0sBRVWKix+ZAAYSkT4v-prJHbpO6q8XrpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cargo.bbclass: allow to avoid appending PACKAGECONFIG_CONFARGS
To: jarsoper@gmail.com
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	DongJoo Kim <dongjoo.kim@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 18:55:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213570

I basically agree with Jean-Pierre. Optional features should not be
set via RUSTFLAGS at all, rather Cargo.toml in the source tree should
be extended to include them as described here:

https://doc.rust-lang.org/cargo/reference/features.html

So gst-plugins-webos should be fixed, then the recipe for it, then I'd
say we should reconsider this patch. If a recipe inherits cargo, then
it is expected to pass configuration settings via cargo, otherwise it
needs to use its own custom class.

Alex

On Thu, 20 Mar 2025 at 19:11, Jean-Pierre Geslin via
lists.openembedded.org <jarsoper=3Dgmail.com@lists.openembedded.org>
wrote:
>
> In my recipe I use it as:
>
> CARGO_BUILD_FLAGS:append =3D " ${PACKAGECONFIG_CONFARGS}"
> The recipe is public here: https://github.com/Jarsop/meta-zenoh/blob/mast=
er/meta-zenoh/recipes-connectivity/zenoh/zenoh_git.bb
>
> Best regards
>
> Le jeu. 20 mars 2025 =C3=A0 18:36, Martin Jansa <martin.jansa@gmail.com> =
a =C3=A9crit :
>>
>> On Thu, Mar 20, 2025 at 6:16=E2=80=AFPM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Thu, 2025-03-20 at 17:06 +0000, Richard Purdie via
>> > lists.openembedded.org wrote:
>> > > On Thu, 2025-03-20 at 17:59 +0100, Martin Jansa via
>> > > lists.openembedded.org wrote:
>> > > > This 2nd one was supposed to be sent only as RFC, but I forgot to
>> > > > update subject sorry.
>> > > >
>> > > > And this version also has a typo "=3D ?=3D", will send v2 if we wa=
nt to
>> > > > do
>> > > > something like this (reverting the
>> > > > https://git.openembedded.org/openembedded-core/commit/?id=3D16745b=
20452de60ae2474433cc1a2fb1ed9f6a64
>> > > > is imho better as it doesn't respect the original author from
>> > > > https://patchwork.yoctoproject.org/project/oe-core/patch/202206061=
32653.60232-4-brgl@bgdev.pl/
>> > > > and with CARGO_BUILD_FLAGS_PACKAGECONFIG it's imho more confusing
>> > > > than
>> > > > useful as the default)
>> > >
>> > > I have a strong preference for not carrying things like this. If
>> > > there
>> > > are existing recipes that break, we should just fix them and move on
>> > > rather than letting the past dictate the future IMO.
>> > >
>> > > I'm trying really hard to simplify things where we can.
>> >
>> > Martin pointed out I was misreading things.
>> >
>> > If there are recipes using packageconfig in RUSTFLAGS then this will
>> > break that. We probably do need to revert as I really don't like the
>> > alternative variable mess. It does mean recipes will specifically need
>> > to add the flags to the carbo build parameters but that is the lesser
>> > of several evils IMO.
>>
>> Agreed about the revert being lesser evil.
>>
>> I know very little about rust/cargo, so it's also possible that we're
>> using rust/cargo wrong and there is a better way to achieve
>> conditional compilation with flags passed to cargo not by RUSTFLAGS.
>>
>> I've checked the recipe where we're using:
>> RUSTFLAGS:append =3D " ${PACKAGECONFIG_CONFARGS}"
>> and it's public as:
>> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-webosrs.bb
>>
>> With the RUSTFLAGS then being used as
>> PACKAGECONFIG[unifieddecodebin] =3D '--cfg feature=3D\"unifieddecodebin\=
"'
>> in the recipe and in code e.g.
>> https://github.com/webosose/gst-plugins-webos/blob/%40rust/gst-rs/unifie=
dbin/src/lib.rs
>> as:
>> #[cfg(feature =3D "unifieddecodebin")]
>> ...
>>
>> Will send revert unless Jean-Pierre or Bartosz have better idea how to
>> deal with this.
>>
>> Cheers,
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213425): https://lists.openembedded.org/g/openembedde=
d-core/message/213425
> Mute This Topic: https://lists.openembedded.org/mt/111812482/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

