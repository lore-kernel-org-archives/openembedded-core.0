Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F23CC28B2B
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 16:24:31 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web09.5082.1660926268963334199
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 09:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mQFR1k0p;
 spf=pass (domain: gmail.com, ip: 209.85.128.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-3246910dac3so133960617b3.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=o4MdPNHOKS+PHEpIPHKJ45fQM3rD+3w/EMPQQVLF3wo=;
        b=mQFR1k0p6EdCWC+lYivc9p6u223tw5HXAQAm87bYnQowRCsDUEsa3HGw4iqbsLW9+Z
         7gczFQaI2G2YpbwcWXKTaB82wuDR79EVgZGJWXDa6TYX//AH0jPJAdeGgNH6Y4eSW6pa
         iu/cptDK03d6mobnSr4TFKl3rLFE/HK+ma793R3rgmOrHM2Fe1FxIRdBGDOPB3vXwGXd
         MwHsAPwDi+jwHwCO53BzWDRjqDjJks4qWvsogStSnu+ki31p64OIDlo0lGjCqNoiDuJO
         kNLuIdZDtlXbWj0pmkH/t1CPsUq9pEamrWAPiWpGSSidfzph4cqCWJiJ3p0zs3CMfJuH
         f6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=o4MdPNHOKS+PHEpIPHKJ45fQM3rD+3w/EMPQQVLF3wo=;
        b=2FfAThkbJ8rPQDu/Hm/w6eauCaMHssiWSIlW9SrhHQo9OOlsNKO0+5zr6Kv4n/tWrQ
         eZ0CPqfDhaw7LAKT0aSwWWCfnsztS7br81EHDrhfZJQyjpz7ghhPTyK5cKE3U8ldzZjx
         K97RuhbSUXgqul+C4abPSWRLO+eBrXxVC2kTZzF5nOeVbgA6io8QHabLDyyvANGc0rKi
         f4UvXAGsbuS3xJeCybDmrero7lUYx2CLWzYLs0IMODrkqLNIzK0yvynW0o6JKnbrbM3I
         /bbVV33n+BEr9yfM9QEThm4ZSAyr39wTn41GJjxvKJS2p9R5aMfzZ6pwGPSFtZjkrB/T
         pV3w==
X-Gm-Message-State: ACgBeo2CrKGMmjUIV1KLW0/9znW8OVT9VrUuAozgUTsj2SNpkv4hT7VT
	WPlqzEOo+Mkxsd1OUcLEjmoPGZvm4lUCwDGIspw=
X-Google-Smtp-Source: 
 AA6agR7pyt4GbS3VMVGIK4FCYZVYlNMdwf5qkKHbN9INwVxaE9HIrCUgxzxz4H6hUfLvQFYZLvd53dBfCON1NJHfmQM=
X-Received: by 2002:a0d:f204:0:b0:333:c23f:d793 with SMTP id
 b4-20020a0df204000000b00333c23fd793mr8470854ywf.71.1660926267984; Fri, 19 Aug
 2022 09:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <f01236ab-4fa1-94b7-e44d-fc43cfeb0fe5@gmail.com>
 <20220815182503.2007534-1-drew@moseleynet.net>
 <6d48f3e4-28c9-848d-9b14-cb5f1950c4ca@denx.de>
 <c018dc5e-f1d6-12cf-3e86-56978e63522f@windriver.com>
 <df0d6b90-d714-0f64-554a-25a9ce3ec427@gmail.com>
 <b33d2d3d-0650-dea5-4f8c-9eebfb425d80@windriver.com>
 <9e4e3fdc-93dc-c2c6-909d-5ab0a3331648@gmail.com>
 <CANNYZj_4qaeiqQNR=-CuOPkOXyxP3Nz24wBWpCXhsLZNwBT5HA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_4qaeiqQNR=-CuOPkOXyxP3Nz24wBWpCXhsLZNwBT5HA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2022 09:24:01 -0700
Message-ID: 
 <CAMKF1srJc15E8H_3KoHX_DgCu8ZC=60ZL-zn79qYxkiXj3sd2w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rng-tools: Change "Requires" to "WantedBy" for
 dev-hwrng.device
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: drew@moseleynet.net, Dragos-Marian Panait <dragos.panait@windriver.com>,
	Claudius Heine <ch@denx.de>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 16:24:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169638

On Fri, Aug 19, 2022 at 8:22 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> So which recent patch? Can you link to it please?
>

https://patchwork.yoctoproject.org/project/oe-core/patch/20220813170156.404=
0589-1-raj.khem@gmail.com/

but this needs to remove sysinit from target, I have meant to send a
v2 but had no time to do so far.

> Alex
>
>
> On Fri, 19 Aug 2022 at 17:13, Drew Moseley <drew.moseley@gmail.com> wrote=
:
> >
> >
> > On 8/19/22 11:07 AM, Dragos-Marian Panait wrote:
> >
> >
> > On 19.08.2022 17:34, Drew Moseley wrote:
> >
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> >
> > On 8/19/22 8:50 AM, Dragos-Marian Panait wrote:
> >
> > Hi Claudius,
> >
> > On 19.08.2022 12:36, Claudius Heine wrote:
> >
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > Hi Dew.
> >
> > On 2022-08-15 20:25, drew.moseley@gmail.com wrote:
> >
> > From: Drew Moseley <drew@moseleynet.net>
> >
> > The previous change to remove the dependency on systemd-udev-settle
> > caused boot delays at least on qemu. It seems that change required
> > a hwrng device but that's not necessarily available on all platforms.
> >
> > This changes the "Requires" to a "WantedBy" as modeled after the
> > version of this file on Ubuntu 20.04.
> >
> > Signed-off-by: Drew Moseley <drew@moseleynet.net>
> > ---
> >   meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service=
 b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> > index 0f50890dcb..b013d95932 100644
> > --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> > +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> > @@ -3,8 +3,6 @@ Description=3DHardware RNG Entropy Gatherer Daemon
> >   DefaultDependencies=3Dno
> >   After=3Dsystemd-udev-settle.service
> >   Before=3Dsysinit.target shutdown.target
> > -Requires=3Ddev-hwrng.device
> > -After=3Ddev-hwrng.device
> >   Conflicts=3Dshutdown.target
> >
> >   [Service]
> > @@ -32,3 +30,4 @@ SystemCallFilter=3D@system-service
> >
> >   [Install]
> >   WantedBy=3Dsysinit.target
> > +WantedBy=3Ddev-hwrng.device
> >
> >
> > This looses the order. Have you tried just replacing `Requires` with
> > `Wants`. So something like this:
> >
> >
> > ```
> >
> > Before=3Dsysinit.target shutdown.target
> > Wants=3Ddev-hwrng.device
> > After=3Ddev-hwrng.device
> > Conflicts=3Dshutdown.target
> >
> > ```
> >
> > If that still would cause the long waiting time on qemu?
> >
> > I haven't investigated the qemu issue, but maybe qemu just doesn't
> > provide a hardware random source? If it doesn't provide a hardware
> > random source, then installing rng-tools on there might also not make s=
ense.
> > Alternatively maybe just adding a start timeout might solve it?
> > regards,
> > Claudius
> >
> >
> > I've tested the patch on a NUC7, results are the same as with qemu:
> > - increased boot time
> > - timeout for rng-tools.service
> > [ TIME ] Timed out waiting for device /dev/hwrng.
> > [DEPEND] Dependency failed for Hard=E2=80=A6e RNG Entropy Gatherer Daem=
on.
> >
> > Regards,
> > Dragos
> >
> >
> > Interesting. I guess this patch should definitely be ignored and the pa=
tch from Khem that removes both the dev-hwrng and systemd-udev-settle depen=
cies is the right approach. That means that the original problem that addin=
g systemd-udev-settle was meant to solve, is no longer solved but it seems =
that the proposed solutions here have adverse effects elsewhere.
> >
> > Simply removing the systemd-udev-settle dependency fixes the issue that=
 my customer has that caused me to start investigating here.
> >
> > Drew
> >
> > --
> > mailto:drew@moseleynet.net
> >
> > Sorry for the confusion, I did not test any additional patches/changes =
that have been suggested in this email thread.
> > My test was performed on current Yocto master sources. No additional pa=
tches.
> > I just wanted to inform that the boot delay is also observed on real hw=
, not just qemu.
> > Again, sorry for the confusion.
> >
> > Dragos
> >
> >
> > Sorry for adding to the confusion. My point was intended to be that I a=
m fairly certain the recent patch submitted by Khem will resolve the boot d=
elay issue you are having as well as the original boot delay caused by syst=
emd-udev-settle.
> >
> > Drew
> >
> > --
> > mailto:drew@moseleynet.net
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169634): https://lists.openembedded.org/g/openembed=
ded-core/message/169634
> > Mute This Topic: https://lists.openembedded.org/mt/93042904/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

