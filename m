Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2F8C7115E
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 08:13:23 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.9514.1750320800454662802
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 01:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h38sQ5k3;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d3e7641b76so31313285a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750320799; x=1750925599; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pvx7gBxg42B01ngp7DzsOdHL/Jpn+SdcIqbhI+1O2ZI=;
        b=h38sQ5k3woKLq/6WnXg87KAJfUAsRaEjJ++Por9IdlJBzJdnpf13IV6LFTA7eV5dPG
         hgxkD5h/o339MNpryX/Jh2JVQtXrY/WcZqeeUbXbfzuT4/vYqThwdv/On7KDFt6BkOw7
         AnceA0ZvkDmJiyse6eyvyuXFfGlv9S8x14WsZZZJAg3F1H3G23efDa9/TPlk1LgyzXAj
         LalEXwA0AQUdTAEoKZ/m++JxNiJNXQ+DRvGqLNM90etTswyaqgClk6yVxwuI9EydIn/d
         t6gIrbgb82egCacjbpZ/N675KtBUAmHon6g9webtoBiQvoKDBxOAST9xbMeR5RUQuMNx
         pLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750320799; x=1750925599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pvx7gBxg42B01ngp7DzsOdHL/Jpn+SdcIqbhI+1O2ZI=;
        b=Jpp9LoAeqB0D6/Z5IY+qr6ZxOxbtDzbSlc1bSfxgNGAHm4E3S7MZUmzRgVk8pskEdT
         CInwhHLLoW+oBal5TwtrHChFELmXv6HDiHwk2YnuViiT04p3rcEkCxTpIoZNgnRhufkr
         iyZk7K32NgJlPe6g0alS+p7PBDiXnGCkIH3/Pn7v8d4veTdOCDwoxCBbjtJlsx5OgZIb
         DFuZ0YG5L4r55s394LXzfXAC/RFKg95U7GpNXlVKoquiMNMutjU8Q4lZMan/ODkY5g/7
         t1rvnoOORDCXECM7cAyADK+QhUaQVDDaq/vgDuV1g/VhVQj7GRcKNbMVJiHTGYEiUC6U
         2bNw==
X-Gm-Message-State: AOJu0YzTFJnAG4WiDEAXUz0QsWQtkbAZeAI+dYugLvEnBKbbFGaTQpsh
	pqFD3FDxUKUFdwLl0Rqi+PKxY8+jAcIwYCVWpFM7sc5Ekg4KvWP6Duc7OZgexcUG/BhQ6GIENYq
	MZp2y21dHnVpLYxDnZ4vAwrcK8PqjgaU=
X-Gm-Gg: ASbGnctNZPrpaUrhYw2yZN0CDOu2M64CobDTXhXdjMCAbh8CsA8/vzJoawnC5PYxyAK
	kEZdMvQ127xPoWnbhTUAu1ukDecCIvdfSgmvqYRR9UznRWjZtZUXeMBlNPHvs3tu6kU5zbjMXAg
	pXVSXPPNNsYrlZHW33tTkxS+ngf/WksShBYEDPM48sLd2QYgLVjt/6NJAUthPCdk68q3tPEkffO
	p4E9A==
X-Google-Smtp-Source: AGHT+IG1qFR/3XpME0MPCYX4Q2HpbjOlaY88IAM35HDt4jkJNuDd+Pb2MHKrKywOVO72bUgJNTwBOIen/I06SRVgeF8=
X-Received: by 2002:a05:6214:5703:b0:6eb:1e80:19fa with SMTP id
 6a1803df08f44-6fb47627642mr291391446d6.1.1750320799163; Thu, 19 Jun 2025
 01:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <7dee70c7-d0a8-44ea-94a1-2c4be581208e@skyrain.eu>
 <CANNYZj91bFZAMB0XiLyEewy6t0RnrtNAZGEsiV+znM5xSY7S0Q@mail.gmail.com> <5a82dfcd-f526-4da7-a39b-081d7b689f57@skyrain.eu>
In-Reply-To: <5a82dfcd-f526-4da7-a39b-081d7b689f57@skyrain.eu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Jun 2025 10:13:08 +0200
X-Gm-Features: Ac12FXzoDvKKvgn-24ZYA1q15rKQvWPGI31qQsTRtABKr5Hp6HdE9tn-4mUakrs
Message-ID: <CANNYZj8LHBsahWB6k6SHZygNVh7jcyDLV5H6n77FcTGnmRXdUw@mail.gmail.com>
Subject: Re: [OE-core] perf: nativesdk
To: Andrej Valek <andrej.v@skyrain.eu>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 08:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219058

On Thu, 19 Jun 2025 at 10:07, Andrej Valek <andrej.v@skyrain.eu> wrote:
> maybe I have to do some more tuning, but what I did:
> BBCLASSEXTEND = "native nativesdk"
> DEPENDS:remove:class-native = "virtual/${MLPREFIX}libc"
>
> then I run: "bitbake perf-native" and I have the same issue:
>
> ERROR: perf-native-1.0-r0 do_configure: The sstate manifest for task
> 'linux-libc-headers:populate_sysroot' (multilib variant '') could not be
> found.
> The pkgarchs considered were: machineA, cortexa53, cortexa53,
> armv8a-crc, armv8a, aarch64, allarch, x86_64_x86_64-nativesdk.
> But none of these manifests exists:
>
> /home/build/tmp/sstate-control/manifest-machineA-linux-libc-headers.populate_sysroot
> /home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-headers.populate_sysroot
> /home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-headers.populate_sysroot
> /home/build/tmp/sstate-control/manifest-armv8a-crc-linux-libc-headers.populate_sysroot
> /home/build/tmp/sstate-control/manifest-armv8a-linux-libc-headers.populate_sysroot
> /home/build/tmp/sstate-control/manifest-aarch64-linux-libc-headers.populate_sysroot
> /home/build/tmp/sstate-control/manifest-allarch-linux-libc-headers.populate_sysroot
> /home/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-linux-libc-headers.populate_sysroot
>
> So nope, it's not working.

It seems as though perf recipe depends on the kernel sources too, so
as it stands, you can't build it natively. I'd directly eliminate the
target deps (e.g. actually remove them from the recipe, as an
experiment) and see how far you get with bitbake perf-native.

Alex

