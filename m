Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894ACCD6E49
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 17:18:23 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.395.1780075098085158408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 10:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hXS/+kwh;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so24730776d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 10:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780075097; cv=none;
        d=google.com; s=arc-20240605;
        b=EWtpXO9gH3opZV3NT9u26oeGXmzMAyn60VP5G6byNyjVJUSuapVXR2lqjTOpheOKkh
         8g72EmMCARS64fnwYaggUKllB97meo4EBZi9+fv3hE9NODsnqj4ogGI6+Ag5TWXrEEYV
         niVrl39ZlbJA1EEzwYmbdLDhui7myIwAcrURflivYrs/MigIrsbdOrzrWcpuJnhVTmQN
         NXbsVcOPLlGRG/l7WmrD/4hknJe4/AdDLa1OcaRkqx5tPztvKSaxj62ftcBKN9eDzrG6
         9T0F/ibKob5tOrznOlrL8fURUf9PcLFmppt4FCtbU807RjpALj1KlE9PguZZmSv4olOW
         xFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eydpRpYLMtvSwNlHrhyFiVmO6iJevPmhJVNE8WOv2SM=;
        fh=oQFZ52q2xn3roR2NuEDPzJYhiZvFaYrYB2eSWgkibJs=;
        b=aO690WO9JzElX4spvMsMM/JuCAPZdbMVSDWeO6jN+90lPnutlXT9KaZdirNGzW0fSx
         GgZkedodk0hvDfQDsr8YNSnCiC1gYLH/amduO2SH536A0B16IUN+zYEa5rEsl+AwumJD
         aQ4RRsYrinFzfzNB/6rNZoHayet8KT76d6rl0sLU1QST2qEPBBRr60oLhb58alq5zAK/
         0rxqj/vEwKVr9ZbhyAOhzV7uZZBp8dpNME32rbL1uYcvbQExcyOrT8s5AZgd7syIvT91
         Fi6PLtEf/VXMVbcZ1S4lJ5Z0OC32HjRle9J6asZV1wO4YdjdLALN1Sn8zT8mLqzCJnk0
         LLNQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780075097; x=1780679897; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eydpRpYLMtvSwNlHrhyFiVmO6iJevPmhJVNE8WOv2SM=;
        b=hXS/+kwhy/uQzC+Gg5sgULcDX5f/AXtcOXfEC4QhNEN9c3HF8bU6VMYmmPJ2ce/WYL
         umJ72FC+jHShVco9kUimijyt9mmYlb1l3BSa6KJMUavekDibT7z9XWATfcHjkQH/JHa4
         o8MoPev6ivWoZKLo+6SXclfPKX60sGlVvYgN3gOWbtIdHPilSHCM/WWiXO4OWmcbkCzB
         oQCfWYSOTNEFNdFqH3QotCxsaFrciXGOC5uXeufn7MJbI6M0O2RErW5jgNTg6Ee83HZn
         l5Xul0tBOr+XjZcjVlxT6rdyO7+5UF8z3BsFK+Og72FnYA6RLVljP+dkwx1Obnx8NcEv
         PxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780075097; x=1780679897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eydpRpYLMtvSwNlHrhyFiVmO6iJevPmhJVNE8WOv2SM=;
        b=JsybV1UNn2Sa7iM7+SamvphPfn9xGqZb9oq1lFHA8br+SgYDYStxd12a9TrdqK+aqt
         UUNdhn2pF0bc3BoaInlimICFeQJFDLjjos4WeuFimGJn8pP00kIhxYs/xZrz3ki4iNwx
         zKK72Y2U/Ie3ZBrVHTxQR+E+qLZC3Ay3IHX/6D51OFxCybStz4PseDNG7/4BynkkuEMw
         Ysr9MHiiUYAb6ntMDnQcvTRKd9Xx0mP82US4ysdLqed0s4r29LjyeQHj5ZRA7Oa9ZBt/
         PUNefX2r51hsQeisdpY3vEn44UmEAafl3NwKK8KBMSNVf4wS+qJ5Aj5J/4vI4WBtSgUN
         xE2g==
X-Forwarded-Encrypted: i=1; AFNElJ8CXPnLOOnThWyzaLVxfoofJPAbYFHkisAKCDDe9Abxkgwolngk51N+1daR+Urin/kMecDnIzIUFKR/QqL3XCvrkw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyyQeAkaYBBqSB/dVxfWWrglDTMq2GIPajM9kr5FZBzK1etZVX6
	Rf/eja9FKXbwguXMV+M6OhwDLSe3uWHTgFgfIqBZgRXzPpULEw4MfnHDcz5RXk+b3JRoPxNjzgH
	6Oj5BCgkvCwP/s+4lYgUznH/VFTUC+s0=
X-Gm-Gg: Acq92OGz8q2xQNN8d3ONBo4TVTImjq4+ClWlKkCxMDNDAy/QDzFzPabnw9802y56aAk
	ki/7Wt/m0DE48LYzQpFHWbchhFqCc62RdAyTHdxni6oU7QdrRmE7+7fCu7qEStXRnAHSh9o7R1K
	76GwD8vBDWMu01EVWJCHN+HP0sJVGM6HKGKBhvLef3aMUV/yy1G/WUG2OGTxMSKKRDr/vre81rv
	n8589lPufAYqE0SdqrwPa5Hg/YOTycC7LCysjfQpdnuO/Qc7jkj0zJKNTWq4g5MmgZTxPKcLD/x
	Kj4l67pHD3Yx7MCXJZwdpPyB0PabFP1SyP/iOageukzEGQXjbEBx
X-Received: by 2002:a05:6214:20a3:b0:8cc:dfce:513a with SMTP id
 6a1803df08f44-8ccefd4bc9cmr7669966d6.17.1780075096966; Fri, 29 May 2026
 10:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com> <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
 <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
 <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com> <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
 <f43b9715-1735-4e16-96b7-963daa162c90@windriver.com>
In-Reply-To: <f43b9715-1735-4e16-96b7-963daa162c90@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 May 2026 19:18:05 +0200
X-Gm-Features: AVHnY4JwLOPgrjc4o1LHyJaglm_c3d6L8CMDLR9WWbVTJJkfVW6yOhy2VEa5eWA
Message-ID: <CANNYZj-tR_2rPGBpkX_UymmaqpDpBvMs0dr1xBbn6vyJm5f2zA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Quan.Sun@windriver.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 17:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237771

On Fri, 29 May 2026 at 18:47, Quan Sun via lists.openembedded.org
<Quan.Sun=3Dwindriver.com@lists.openembedded.org> wrote:
> The QEMU 11.0 changed its GL display initialization sequence. On
> headless build hosts (no  Wayland, no proper GPU), QEMU 10.x would
> silently fall through and start, while QEMU 11.0 now probes more
> aggressively:
>
> 1. Tries GLX/DRI3 =E2=86=92 fails (glx: failed to create dri3 screen, fai=
led to
> load driver: vgem)
> 2. Tries Wayland/EGL =E2=86=92 crashes (the segfault in eglInitialize =E2=
=86=92
> wl_proxy_create_wrapper)
>
> It's not a race =E2=80=94 it's a deterministic crash because QEMU 11.0's =
new
> init path tries
> to call into Wayland client code on a host where Wayland isn't running,
> and that code
> path hits a NULL pointer or invalid state in wl_proxy_create_wrapper.
>
> Still, the upgrade itself may be fine =E2=80=94 all actual QEMU
> functionality works (685/686 tests pass). The single failure is in
> test_testimage_virgl_gtk_sdl, which tests hardware-accelerated GL
> rendering into a GTK
> /SDL window =E2=80=94 something that doesn't work on headless CI hosts
> regardless, and QEMU
> 11.0 just crashes harder than 10.x did when it fails. The test itself
> may be a candidate
> for removal/rework.

qemu 10.x does not crash, or silently fail, and it is able to open sdl
and gtk windows even on headless hosts without GPU. Yocto CI is
specifically set up to support it: it's runing Tiger VNC server that X
clients (such as qemu) can connect to, and qemu is using mesa's
llvmpipe renderer which does not require a physical GPU.

Are you using AI to write out argumentation here as well, or are these
your own thoughts? Please be clear about this. I'd be happy to correct
you, but I would not want to spend too much time time correcting AI,
because I don't think it is going to provide sudden helpful insights.
To get to the bottom of it, someone needs to set up a gdb session and
step through the code of 11.x and 10.x initializations, finding out
why one falls through to the crashing wayland step, and the other does
not. AI is not capable of doing that kind of reproducing the issue,
and then debugging it, not yet at least.

Alex

