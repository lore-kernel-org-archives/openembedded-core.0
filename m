Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.10258.1624882104929651672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 05:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hE7zi07b;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id m14so25550931edp.9
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ODdczkhEQY+2XZi6i3QTYkgT5OeY2utpy6HfaT7Mukg=;
        b=hE7zi07bwRHKzchlo8vkgJiD3t4yGlygJdXaaWSYM2zSzlWmHHrCCtuHu241adxq5V
         sE8l8FwfJb2kS7a5v/6EGb2zlEhHOHPlW8UjFrinlXxr4hJxPpqCrhnbYHbeJ+Nb3b05
         qsdUQRBavCiMrcwk+3I+pz9lNE75obxKi9XW7cWjgkSIAXouX+Sarh75fxylx951AJAb
         LhLMMfCgW23Oqzm1YYj24gmPttu8J+pa4qTQ9g4+Tm26IZwYXrJpaOdE1FlKG33XOLBf
         iCyeDMvc2dBUPllq1FsCC9dwgN83Rf2aQRo0csWy7t2QQq/6nyW1TWrfCe94hTjnG3xa
         TMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ODdczkhEQY+2XZi6i3QTYkgT5OeY2utpy6HfaT7Mukg=;
        b=ShiVVTZSyp8nQQounDSzJeAdhltQGVU7e6tW9gXA5DRcmn/p8K67WJgWqjCfBbL1UV
         iuBQD3qy467sWycQt7E41aWl6lZp2m0S5Vj5cfzrEtwGaIICRI/9RQi+O7fU52AL4g1W
         6okNyiOE6bUxjrwjfiwVXvZW60uPGjp98llSEvck2I3U4Hq7x3AIK55eokuA+iU00/x8
         njSwPkD0Sbu4+qmAx2i5e91AduQ0TatGUQW8Wd8IsEpTRiMfp1AzsjDVwbMiswp+Y/PM
         TetTwLVvHZAgSp3YEsnFewQcmD6Rf1HOKiRGZxuiN5oM65jIxespsamMUYGHh7gT/toA
         oBAQ==
X-Gm-Message-State: AOAM531vEyNmGVsyqX53Q7vRrKjNgH7MSEy9Q7u1F4Ke3z81eGWsMcL5
	yGBGtcFcljyd9qNAgk5TlyOwSYarf6mz96Z3oCE=
X-Google-Smtp-Source: ABdhPJwSaEv0XYPlUr7U97kkoCkaPTT8bDs5zS0Z/9KCENEHVbHd0ZowhMSSW9DP5WpwyWSnu4MP1HWbIcalAcRqFzk=
X-Received: by 2002:aa7:c04e:: with SMTP id k14mr31701594edo.157.1624882103363;
 Mon, 28 Jun 2021 05:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
 <CANNYZj_yZHkpbGKPaec_x4AQDQ8jR_rLk1mroBZxn6JCpQ9WbQ@mail.gmail.com>
In-Reply-To: <CANNYZj_yZHkpbGKPaec_x4AQDQ8jR_rLk1mroBZxn6JCpQ9WbQ@mail.gmail.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Mon, 28 Jun 2021 14:08:12 +0200
Message-ID: <CAAQYJAspv72aL7J_fYri+vk_OfL=PDNCvGk9C6O=CisB3dEPeg@mail.gmail.com>
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 1:00 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Seems like an upstream problem rather than a Yocto one?

Indeed,

from
https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/14.0/
"
One difference from Autotools is that the --disable-neon-opt option
for disabling NEON optimizations doesn't have a counterpart in Meson
due to how Meson's NEON detection works. NEON will always be enabled
if the compiler supports it, but even if the target machine doesn't
support NEON, that shouldn't be a problem, because PulseAudio disables
NEON at run-time if the processor doesn't support it.
"
Upstream *thinks* this is not an issue because all will be fine at runtime :)

Cheers
A.A:

>
> Alex
>
> On Mon, 28 Jun 2021 at 12:02, Andrea Adami <andrea.adami@gmail.com> wrote:
>>
>> Hello,
>>
>> during a core-image-sato build for armv4 I got one single build
>> failure with pulseaudio.
>>
>> This happens after commit 80bbea0 pulseaudio: switch build system from
>> Autotools to Meson. In the commit text it is evidenced:
>>
>> "
>> With Meson there's no option for disabling Neon optimizations if the
>> compiler supports Neon. If -mfpu is set in CC or CFLAGS, it's ignored,
>> because the build system adds -mfpu=neon at the end of the compiler
>> command line, overriding any earlier -mfpu options. This shouldn't be
>> a problem, because PulseAudio detects at runtime whether the CPU
>> supports Neon instructions.
>> "
>>
>> At the moment to build pulseaudio for armv4/5 I have reverted to using
>> autotools.
>>
>>
>> There was around a patch but has not been merged.
>> https://lists.openembedded.org/g/openembedded-core/message/146375
>>
>> Maybe a v2 will be accepted?
>>
>> Cheers
>> A.A.
>>
>> 
>>
