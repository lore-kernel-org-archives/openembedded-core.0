Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41B2CD8C85
	for <webhook@archiver.kernel.org>; Sat,  6 Jun 2026 10:49:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13844.1780742936065345484
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Jun 2026 03:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Oz/0IW7g;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490c1915793so13805575e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Jun 2026 03:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780742934; x=1781347734; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Dii2RJP3GgaU3w1HYAQfA7e/RFdm0iW7bjJCIYACv0=;
        b=Oz/0IW7gGMOsBXnTAF4y8pggdCearE0AdxKgCU4PHi1B14yS8+DK+ImTwfjND3cfgf
         Oyr4ktQ4U7F+7enYkEY+SivXf5flVJHMigvoofA36NL1AByPDpZOmruWcBe3C32QiaZ4
         w/FjeKgR0YeoTGQylyRDww2s4WfafzP6dkDHFFdcGPZi4Gwre56slDj6dRSeg9yukDPo
         JkIY1BuasZVgszWeiIH/7ZMRyB+9TOCpQZLYA2BP0xqmPUfk7ONHu9sczXjX1vF7RgyC
         CfODoHKMLfmO99Y3TUAYT/PvEfsR4Ezna5pndeOyxTOqjeXZY54SYYQt3TO4BXjTDxHq
         3Uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780742934; x=1781347734;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Dii2RJP3GgaU3w1HYAQfA7e/RFdm0iW7bjJCIYACv0=;
        b=sjWUKBBlgAx4K0ZXy1AvaOKf1AN1ptgjngedofwd0Ae+GxiWXQTJJwRZ0up7UtEteP
         +TJZyF727EtiJOQS6FoRcNvRKUAZEWd/PMxvOEKlrDlzUP4rgJu+apmpWZ00fBG7hIJ9
         JOVCw9JWfpg/pZUv/0cM+Y/oZKWQNvLdISDLrKbNG+irAXZZ6lMdOlHJ95NEPau14fXb
         w6ePrJlNdFTd4Z0U2iBS+2PyhRDU0x/D881a3RLZhuhT3hgPydAy4lvhIyBhZ/6BUSXv
         s4KbMQH/Rp9tLBobwF490DWbOzFI11MYfYgQJUUZwabmdh40S/4fr1eJjcpggYYh/yxr
         A6Eg==
X-Forwarded-Encrypted: i=1; AFNElJ+937OexDHBtFjHEN+3JUNCoG3zNEH5X/xUzzp9GUcO/VPsxoU6j4+9K4EDZBbmg3PIy+ty+4FBuEO+Yq0OUT0Mpg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9ytzyN7jUUYsMVNLlO/lCJW9DseYCpqWfblLEsxu2INKNzeDp
	XI8mkXRYMr32KHbN9jEHoROUq/nuyIDuJzXcEWVFKCxoJkIC9rRFeWpU
X-Gm-Gg: Acq92OGbelm+UVJEpZgHUYZ9X3G5SboBfA8KfVHTvo8qWswi0VDXIa79uO30DeQdZ2a
	QSNHoA6nyS5UWcAGUHAEOdVzyKk0eQjqKIed9oGVRsylY07uUscokp+4mBIHgdyDT9RramLeg5V
	bIrAK97kF8s+3u+1vtDNoeTLJoq+QQv3h11HnEPGVFcXH2w3rTMMkOxcQ1wfXAUP1idbgiKQgho
	nvgUKLosu09zVhhhtmXry3JVBjrfkRNxoqJD89hCSv+QxwKQai5FGYQUJKAjIDzTb3OhN6x20ME
	MQZVQ0zMBzKnnxuEfEQZ8rgA8sdkN9y/Z1xDBLxjSMZvGty9Jh2+pXKTKEHTX+dsZqBRKY57HA6
	+WjmQKo0CySEHxMiM0kfw+zdM1/5A6S5VTea1U2zkMndJ3wZmHMhizwNdmY5GzgOqCotpcofeMr
	jCgYZ1PKdZDyD1pd11Tp5WjRwOUyfjQULxYKRviEUGKw+loLq333OKxWjHwKt773PI0RumXBBT2
	w2x/XfnPVph52pxkkBXtQ==
X-Received: by 2002:a05:600c:530d:b0:490:b92f:ef5b with SMTP id 5b1f17b1804b1-490c25d4cfcmr136117025e9.13.1780742934022;
        Sat, 06 Jun 2026 03:48:54 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd663sm253509485e9.10.2026.06.06.03.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 03:48:53 -0700 (PDT)
Message-ID: <e6d0ebd23b8c1db1ab5d382ed8bd6f768584f0f9.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-fit-image: skip sstate creation for
 deploy
From: adrian.freihofer@gmail.com
To: tafil@tafhub.de, openembedded-core@lists.openembedded.org
Date: Sat, 06 Jun 2026 12:48:52 +0200
In-Reply-To: <60c5fe270fc9834e2472b01cd80362cd9b0f5189.camel@linuxfoundation.org>
References: <20260603152328.48500-1-tafil@tafhub.de>
	 <60c5fe270fc9834e2472b01cd80362cd9b0f5189.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Jun 2026 10:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238215

On Wed, 2026-06-03 at 17:22 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2026-06-03 at 17:23 +0200, Tafil Avdyli via
> lists.openembedded.org wrote:
> > When building completely from sstate (e.g. in pipeline), the
> > linux-yocto-fitimage recipe deploys from sstate even if the
> > INITRAMFS_IMAGE requires a rebuild.
> >=20
> > Using dm-verity or verity image classes, the initramfs image must
> > be
> > rebuilt after the rootfs. However, linux-yocto-fitimage:do_build
> > was
> > skipped and went straight for do_deploy from sstate and deployed a
> > fitImage with an outdated initramfs with old roothash data while
> > the
> > image and INITRAMFS_IMAGE were being built.
> >=20
> > Skipping the do_deploy task in a sstate only build, successfully
> > triggers linux-yocto-fitimage:do_build after
> > INITRAMFS_IMAGE:do_image_complete.
> > This also follows fitimage.bbclass[1] from meta-oe.
> >=20
> > [1]:
> > https://git.openembedded.org/meta-openembedded/tree/meta-oe/classes/fit=
image.bbclass?h=3Dwrynose#n522
> >=20
> > Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
> > ---
> > =C2=A0meta/classes-recipe/kernel-fit-image.bbclass | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
> > b/meta/classes-recipe/kernel-fit-image.bbclass
> > index ae8f3c6688..03272bab51 100644
> > --- a/meta/classes-recipe/kernel-fit-image.bbclass
> > +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> > @@ -241,3 +241,4 @@ do_deploy() {
> > =C2=A0=C2=A0=C2=A0=C2=A0 fi
> > =C2=A0}
> > =C2=A0addtask deploy after do_compile before do_build
> > +SSTATE_SKIP_CREATION:task-deploy =3D "1"
>=20
> This is a workaround, it sounds like there is a missing dependency
> somewhere to trigger the build needed?

I agree with Richard, this is not the right fix. What are you exactly
doing and what are you then going to change before calling bitbake
again?

Regards,
Adrian


>=20
> Cheers,
>=20
> Richard
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238102):
> https://lists.openembedded.org/g/openembedded-core/message/238102
> Mute This Topic: https://lists.openembedded.org/mt/119630574/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

