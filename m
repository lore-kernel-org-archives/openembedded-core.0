Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396C8C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 15:22:11 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.4348.1660922526795174105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 08:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n61yOIns;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id l1so6022170lfk.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=1mqqCOgDyMYssGCHv5mt6u5m7gOARclcLtpD/RgWkjA=;
        b=n61yOInsDOcMbT3VBhDKQ3j073TCuaUzUCkynWSP88OXvMwjhRDsfv3Tne+wM1nLOn
         jGzWybjDKDc2FectCHLG+WlLtlh5zbZnrG5AxJLg7+KkZkfKZop0ncvf2yH2OEQ8M049
         8CWGTlx8Wn9sva09EUD5qm7Jv58uFJifIcyC6QEcEmriuU4XDbvRM46tiyVYJA08ic1+
         w0KHYsaz+NSEkegSKGHFzBgT2Fsb1eXHHMvwmtaX76JRhmI7l69JuCMmjkLsCVy+FhJo
         CKFHY8B/hMN1/Wp0Q5X8qhEpdVZUKKtq7DoD3JzOf7zNMbISZLxt1IRfdI7HX0X+Fg5e
         NbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=1mqqCOgDyMYssGCHv5mt6u5m7gOARclcLtpD/RgWkjA=;
        b=VFzH3pOjGLkwGAsm6HSNYrywzdilW0ctJ5KVJS5gn2sICMO1cDBB3ov/LGnIh2W/L+
         gRbyxmVCQiz+LqR7CBA++JWukZei7kDBu5reWCowU/gmCYwRbGfg6VChA5cnofY2sxNV
         1aTyLhVyVN8voCMHsuMq5mT29fXRhImDVWvOtXEMIBSExuB7+NXoCfQlXHMJV7dlJ7JB
         pFRmCnMAm0d5lgJoTvWEDGrSp+9SYTzeRz864EhDjQZxoIyxqhDQIMljaiVHsdXDAiLP
         f+VtJ5IETR41c/qgRAJz7okJZHX4hJSVUTeVK5TkpNHlngJ8ys1olg2+53f9xNi3Z5f7
         ET8Q==
X-Gm-Message-State: ACgBeo3t5LEJpJr1RJdk/LTdhe5iWucuu3oDCWBFXqdnF8gqnY87rhfO
	gmI4nGOULe1SD3DmQjbOznY1zjyFAOa+pJV3uEI=
X-Google-Smtp-Source: 
 AA6agR4TGsm0wiOaFgtJqg5a+dEHUxnK3LPA1ziby+I2WUf7Un+AqtgXJRb8RiU+6Lyj34/2KNgZWgVmiyAVvtB0cc0=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr2553139lfa.380.1660922524960; Fri, 19
 Aug 2022 08:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <f01236ab-4fa1-94b7-e44d-fc43cfeb0fe5@gmail.com>
 <20220815182503.2007534-1-drew@moseleynet.net>
 <6d48f3e4-28c9-848d-9b14-cb5f1950c4ca@denx.de>
 <c018dc5e-f1d6-12cf-3e86-56978e63522f@windriver.com>
 <df0d6b90-d714-0f64-554a-25a9ce3ec427@gmail.com>
 <b33d2d3d-0650-dea5-4f8c-9eebfb425d80@windriver.com>
 <9e4e3fdc-93dc-c2c6-909d-5ab0a3331648@gmail.com>
In-Reply-To: <9e4e3fdc-93dc-c2c6-909d-5ab0a3331648@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Aug 2022 17:21:53 +0200
Message-ID: 
 <CANNYZj_4qaeiqQNR=-CuOPkOXyxP3Nz24wBWpCXhsLZNwBT5HA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rng-tools: Change "Requires" to "WantedBy" for
 dev-hwrng.device
To: drew@moseleynet.net
Cc: Dragos-Marian Panait <dragos.panait@windriver.com>,
 Claudius Heine <ch@denx.de>,
	OE-core <openembedded-core@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 15:22:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169636

So which recent patch? Can you link to it please?

Alex


On Fri, 19 Aug 2022 at 17:13, Drew Moseley <drew.moseley@gmail.com> wrote:
>
>
> On 8/19/22 11:07 AM, Dragos-Marian Panait wrote:
>
>
> On 19.08.2022 17:34, Drew Moseley wrote:
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
>
> On 8/19/22 8:50 AM, Dragos-Marian Panait wrote:
>
> Hi Claudius,
>
> On 19.08.2022 12:36, Claudius Heine wrote:
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Hi Dew.
>
> On 2022-08-15 20:25, drew.moseley@gmail.com wrote:
>
> From: Drew Moseley <drew@moseleynet.net>
>
> The previous change to remove the dependency on systemd-udev-settle
> caused boot delays at least on qemu. It seems that change required
> a hwrng device but that's not necessarily available on all platforms.
>
> This changes the "Requires" to a "WantedBy" as modeled after the
> version of this file on Ubuntu 20.04.
>
> Signed-off-by: Drew Moseley <drew@moseleynet.net>
> ---
>   meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b=
/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> index 0f50890dcb..b013d95932 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> @@ -3,8 +3,6 @@ Description=3DHardware RNG Entropy Gatherer Daemon
>   DefaultDependencies=3Dno
>   After=3Dsystemd-udev-settle.service
>   Before=3Dsysinit.target shutdown.target
> -Requires=3Ddev-hwrng.device
> -After=3Ddev-hwrng.device
>   Conflicts=3Dshutdown.target
>
>   [Service]
> @@ -32,3 +30,4 @@ SystemCallFilter=3D@system-service
>
>   [Install]
>   WantedBy=3Dsysinit.target
> +WantedBy=3Ddev-hwrng.device
>
>
> This looses the order. Have you tried just replacing `Requires` with
> `Wants`. So something like this:
>
>
> ```
>
> Before=3Dsysinit.target shutdown.target
> Wants=3Ddev-hwrng.device
> After=3Ddev-hwrng.device
> Conflicts=3Dshutdown.target
>
> ```
>
> If that still would cause the long waiting time on qemu?
>
> I haven't investigated the qemu issue, but maybe qemu just doesn't
> provide a hardware random source? If it doesn't provide a hardware
> random source, then installing rng-tools on there might also not make sen=
se.
> Alternatively maybe just adding a start timeout might solve it?
> regards,
> Claudius
>
>
> I've tested the patch on a NUC7, results are the same as with qemu:
> - increased boot time
> - timeout for rng-tools.service
> [ TIME ] Timed out waiting for device /dev/hwrng.
> [DEPEND] Dependency failed for Hard=E2=80=A6e RNG Entropy Gatherer Daemon=
.
>
> Regards,
> Dragos
>
>
> Interesting. I guess this patch should definitely be ignored and the patc=
h from Khem that removes both the dev-hwrng and systemd-udev-settle depenci=
es is the right approach. That means that the original problem that adding =
systemd-udev-settle was meant to solve, is no longer solved but it seems th=
at the proposed solutions here have adverse effects elsewhere.
>
> Simply removing the systemd-udev-settle dependency fixes the issue that m=
y customer has that caused me to start investigating here.
>
> Drew
>
> --
> mailto:drew@moseleynet.net
>
> Sorry for the confusion, I did not test any additional patches/changes th=
at have been suggested in this email thread.
> My test was performed on current Yocto master sources. No additional patc=
hes.
> I just wanted to inform that the boot delay is also observed on real hw, =
not just qemu.
> Again, sorry for the confusion.
>
> Dragos
>
>
> Sorry for adding to the confusion. My point was intended to be that I am =
fairly certain the recent patch submitted by Khem will resolve the boot del=
ay issue you are having as well as the original boot delay caused by system=
d-udev-settle.
>
> Drew
>
> --
> mailto:drew@moseleynet.net
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169634): https://lists.openembedded.org/g/openembedde=
d-core/message/169634
> Mute This Topic: https://lists.openembedded.org/mt/93042904/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

