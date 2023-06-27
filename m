Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407EAEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 16:01:07 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.2174.1687881663202754055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 09:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yx/vyVnH;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.44, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-98e109525d6so583166b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 09:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687881661; x=1690473661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UuTcYPWY5cxlDoO7NCKpPo+OyYe1iy4Y29X6IG/qFc=;
        b=yx/vyVnHZM+2ov8dVD7mFtHztdawukeUgD1wZahqnjYb1k57z1DDe9QSNc+Pg2O7ir
         ADUR4d490Awyl2oi2+Xaoy5jycQhVsDQHkgrjacCCIwjSKFfCdyKvwY7GsdNbbm7VEGX
         egjYsig+Ho3I/dZEy25YIur9GAPXdAF4mA4nF6b0RILYKGDh/Y9i0MidtPi/VgfHn6Qr
         zim1zG4HRqzgdb69FMjz6Pdbxe0BYgNbz1AzTu3gsHKfJYx1LxFDf7tabWb6KM1SIwAh
         x3j+gMBoTarhXxIlgVy0CJ7wbKKH4keLY5EzZyGY9vMW3SP1kJSbsmWd6mJinBytyfCw
         uMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687881661; x=1690473661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UuTcYPWY5cxlDoO7NCKpPo+OyYe1iy4Y29X6IG/qFc=;
        b=ZGsoMMJS4+W5owm2RQWrxtgjMoTWXRnzvzOZHG8cU9oIvRI3mAlSdyzQQguZXfpJwD
         cLNiZyQERMlupz3YAT4DMOyemQX0TpqI6nRPPSrsiPcU7zI2WglfHnGei3wOU7/IxDS8
         7/WeQvNdNbNKfdzPGQkuCGl/U6qlUihCMUFxTp7vRFHDf1cTkjO103YRUYh3ZalEQ7dg
         Kg6vmLK5CqTZEB9mJipGZuPNraEquoPGxxmpt1z/Jny78kJwHqoSkoVaZbtHiX/vRSeU
         iWb6aLEQOO/Cy0CWqlRRs8514rBJalp2UbO+Yd30l77hzZMUmwlavewIJWd+AnBPkRwu
         kIOw==
X-Gm-Message-State: AC+VfDw94LW3CI2LsmTibF0aPjaQF9xWL1PZxfK1ryZkL2foeZTwuwqm
	U2BV8/Bl+94bbDaO6TVqI2npedFEvr8jdSX8jU34Lw==
X-Google-Smtp-Source: ACHHUZ4tuRx1f+yy+BesuH6jJBJCs/cGG08w+bd69w1Qrielh3gbE0dmO0v4PHzEdMDjzUmkHtvteBoFPq+AkBhGfVw=
X-Received: by 2002:a17:907:d11:b0:96f:9cea:a34d with SMTP id
 gn17-20020a1709070d1100b0096f9ceaa34dmr37869318ejc.21.1687881661526; Tue, 27
 Jun 2023 09:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230623162448.3162089-1-rs@ti.com>
In-Reply-To: <20230623162448.3162089-1-rs@ti.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 27 Jun 2023 06:00:50 -1000
Message-ID: <CAOSpxdYUCYHjzu3J4ZbfeXpyx2+DkgaXvA3fWvVOtazUCSnWtA@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCHv2 0/8] Backport all weston-init qol updates
To: rs@ti.com
Cc: richard.purdie@linuxfoundation.org, denis@denix.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183494

Hi Randolph,

Unfortunately this patch series results in oe-selftest failures on the
autobuilder, three examples below:

https://errors.yoctoproject.org/Errors/Details/710122/
https://errors.yoctoproject.org/Errors/Details/710127/
https://errors.yoctoproject.org/Errors/Details/710125/

Note in particular:

AssertionError: 1 !=3D 0 : Log:
/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-1203856/tmp/=
work/qemux86_64-poky-linux/core-image-weston/1.0-r0/target_logs/dmesg_outpu=
t.log
-----------------------
Central error: [    2.392519] weston[373]: segfault at 28 ip
00007fad628102aa sp 00007ffff5bf2410 error 4 in
libwayland-server.so.0.20.0[7fad6280c000+8000]
***********************
[    1.742836]   with environment:
[    1.742837]     HOME=3D/
[    1.742838]     TERM=3Dlinux
[    1.800627] udevd[167]: starting version 3.2.10
[    1.806665] udevd[168]: starting eudev-3.2.10
[    1.964586] EXT4-fs (vda): re-mounted. Opts: (null). Quota mode: disable=
d.
[    2.020081] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[    2.223651] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    2.224563] Bluetooth: BNEP filters: protocol multicast
[    2.225490] Bluetooth: BNEP socket layer initialized
[    2.392519] weston[373]: segfault at 28 ip 00007fad628102aa sp
00007ffff5bf2410 error 4 in
libwayland-server.so.0.20.0[7fad6280c000+8000]
[    2.394037] Code: 48 8b 47 08 48 8d 77 10 48 8b 78 08 e9 1f c3 ff
ff 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 41 54 55 48 89 fd 48
83 ec 08 <8b> 57 28 4c 8b 67 08 85 d2 79 3b 48 8d 05 64 b0 00 00 48 39
07 0f

***********************
1 errors found in logs.

Steve

On Fri, Jun 23, 2023 at 6:24=E2=80=AFAM <rs@ti.com> wrote:
>
> From: Randolph Sapp <rs@ti.com>
>
> Backport all the weston-init QOL updates. Getting closer to the point
> where we can actually drop our distro specific weston-init bbappend. May
> submit a few more QOL patches sooner or later to completely drop it.
>
> Resubmitting this because I forgot to CC Steve and myself on this
> series.
>
> Ming Liu (1):
>   weston-init: introduce xwayland PACKAGECONFIG
>
> Randolph Sapp (6):
>   weston-init: make sure the render group exists
>   weston-init: add weston user to the render group
>   weston-init: add the weston user to the wayland group
>   weston-init: fix the mixed indentation
>   weston-init: guard against systemd configs
>   weston-init: add profile to point users to global socket
>
> ssuesens (1):
>   weston.init: enabled xwayland
>
>  meta/recipes-graphics/wayland/weston-init.bb  | 53 ++++++++++++-------
>  .../wayland/weston-init/weston-socket.sh      | 20 +++++++
>  2 files changed, 53 insertions(+), 20 deletions(-)
>  create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-sock=
et.sh
>
> --
> 2.41.0
>

