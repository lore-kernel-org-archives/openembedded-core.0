Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775CDC8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 07:02:46 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web11.54017.1751871761934851539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 00:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AOE4ShJ/;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5344894a85aso881471e0c.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 00:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751871761; x=1752476561; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WqXwZHV4o49joztUD0ULXVCcLoNUFZvAYQLiSwlu1o8=;
        b=AOE4ShJ/YS5/7/gTeHnqrRN50c4dxAsowaQCKYgzHvnYk/GZ18llWMqUocSev0Q0za
         eJClCdEZHjN6DCyD0VcVaVsfqwW2AE9NmjkoFcWB2rP3lP4xEaFnKW8pd4xrihUTZMLy
         8KUEVR6SLiqc9kIMOH5ghejEh0VqaKAmlnNUbXN/cDy3ECrtGTfyh07BpIqQgq3KaTTZ
         kocuAi5/EmLg+TMHh60/PisG2sRHSr0gWDVaRfcUegyTrrzX95q7MOIz7BUYdz6Df6rG
         dBmFsmeQ9qhXYpS9a/y19iRsSf4FpPBaRcjVjiFp2RadprqdYZl8hDrp1H2Lqut04Kw4
         D22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751871761; x=1752476561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqXwZHV4o49joztUD0ULXVCcLoNUFZvAYQLiSwlu1o8=;
        b=aOBg9ULD1C0yjfd9/Iyg7cAj5nr8nDQI8iBzXN/SgN4eBOeLvZC3GSRzyzUNo2jpZa
         c5AspVr7evjYStl/NZLSqxnHjNKSIt8D5oym6N6H6CFd7g7TjH26gX8731yiPn5W1P5l
         H9Wnwmk/LWNgH3QGdyhmiz0cj4qcwFppAq9pZcL0dc4yqaUOLAHuRjGpMYPq4iYDQTLk
         BlL/P0QLjFOn3HuonG0Bm/ZMq+HPXoUVFadCsDoAemXDx9b1k0F4d35y6ZdaHNDR8LLq
         vsMq4K+aAwWZvg6WNQ/25++JdQG/ij0JDd08tS/D8y1u+RFdEjgNtO1lruXovklOLv17
         mOoA==
X-Gm-Message-State: AOJu0YwHX+eOjAjXmHhQqmXAGRSaKo5lv8lJgx+QC5JeLDU0FZ45dzLm
	y//V/FQm9HS+8W09zQbrrUgg9i+0oE/03f+6LMmdZBJlz11r+h7pXcAnxfL2qfbxMf0jSNln0zv
	O7jeqSuEm66dkOu8rTOJRuEkw9PoLF2c=
X-Gm-Gg: ASbGncuMBV7HPnILTtOD7FS5ywSLPFUvOElAQzK38eUmDiTWHEUOplyMOsfYT5SqF2T
	f7rRt67B67FC6SKMBm6H4UT0mBhwsKuZ1O8Ludc11Uh6WItvhxx7PPk3fiaqL9zdqJ7eeAS09Zv
	2UlioZAivvoSvwJfnuTd0xb6jOGxy8s40Rr31EQG7F+5p2p/856o4+a2wlRg==
X-Google-Smtp-Source: AGHT+IEzzMpruHj91WcHF9LrYcpOaJ1FWMTh1hRYSw31SB1nsJIlP0NsZ35VMAlbUwqbsTjSlM3p3YZ7fnHUWafBKOw=
X-Received: by 2002:a05:6102:1609:b0:4e7:3efd:ac76 with SMTP id
 ada2fe7eead31-4f3059f6095mr3908567137.8.1751871760826; Mon, 07 Jul 2025
 00:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb_mX+D24LjOozpm=m_Y=5AhHSX=5OtNdbNHWg99mcuFNw@mail.gmail.com>
In-Reply-To: <CAK5yBb_mX+D24LjOozpm=m_Y=5AhHSX=5OtNdbNHWg99mcuFNw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Jul 2025 09:02:29 +0200
X-Gm-Features: Ac12FXxPGDXl86yn9pk3D72Gs7YK2WNO5lubdc7V6dvI1yAIp5ESWGGc5aK7HCY
Message-ID: <CANNYZj9R79Um9BvKmZmOrCZLnVaDk3cfO1KHM8bu54mu3F-68Q@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 1 July. 2025 (WW26)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 07:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219977

On Tue, 1 Jul 2025 at 16:44, Stephen Jolley via lists.openembedded.org
<sjolley.yp.pm=gmail.com@lists.openembedded.org> wrote:
> For M2, the following changes have been mentioned as possibilities:
>
> bitbake-setup

This was discussed on the call; the next step would be to start using
it on the autobuilder. That would significantly boost the credibility
of the project, and validate it in a real, mission-critical setting :)

Before that can happen, the tool still needs additional functionality:

- nested bitbake configurations, that would be an equivalent of
'templates' in autobuilder's config.json. E.g. a top level base config
that sets autobuilder-specific fragments for all builds, then an
intemediate config that sets what images and other targets get build,
then final configs that set target machines.

- ability to override git repo locations/revisions from the command
line. E.g. the config file sets master branches for all repos, but one
wants to build master-next.

- ability to select a subset of bitbake configurations for
initialization/update. An autobuilder config would specify dozens of
configurations, but any particular worker machine would only work on
one of them. There is no need to initialize every bitbake config, and
it would only add delays and clutter.

Once all of this in place, config.json could be gradually transitioned
to defer to bitbake-setup:

       "qemux86-64" : {
            "BBSETUP" : "qemux86-64",
        },

and the code would run that with appropriate build-specific
parameters. Config.json also has custom local.conf tweaks all over the
place which would need to be reviewed and converted to fragments.
There's also nomenclature for targets
(BBTARGETS/SANITYTARGETS/EXTRACMDS), multi-step builds, and possibly
other things I haven't yet stumbled into, and that all needs to be
carried over to bitbake-setup without loss of functionality.

I'll get to it after the holiday, e.g. at the end of July or so.

Thanks,
Alex

