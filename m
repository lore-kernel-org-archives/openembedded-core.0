Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569A5C5B572
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 16:20:10 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12158.1786551600536167730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 09:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XKbRANv6;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b159850b16so1140972e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 09:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786551598; cv=none;
        d=google.com; s=arc-20260327;
        b=TKowGn47PSip8vb30QupWJVLtCZPGShUZjy1tLQDh6k2ZWA8rOE+zd1k4EcHi2dvX+
         /gAfjdz/TEZAdSp9dx9XDNnzj7X1fngLGEYjx315iBcj8ApZ2XJnPidxf4KgQGEXwF20
         d/gj/QRtIE3N+y44dmrh4WUVMHbcKtEgekfsGWBYqhLQFTqh1uqRHPiXCOSG8mXj8O1Z
         ma3jaC4eZWR5x3zmu+Bf32mS9dwC+xWJwhewD6BWRWeat8CCWVAM6rotX/zyn766mclP
         BtkfPGdY7nKzO0rtm/m3p3U2GzxeBAmenNOYqJYHJQmAdZsZ0dd8ju91rUB26AIl47jL
         MHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rVN7R0gNINTNivuaZy/4598xzsYnBs7giZb1iOZEjyM=;
        fh=iLxLyOM54FLinVTD4yJZjCAe61vvhDN8mI5G2/rtDKk=;
        b=DG21J9YXSAriu+Nk+u87bGOghlZc29+eqgl5ltN50A7MPBDV95s3lbU8cjlC1teR1u
         ZO8wu3hJOhh7O3yku4jaN56aBtH5bv26ia7RmKZUqUZ9DydZdCWd7XFTCCzz8rLrAYY+
         TgTe9HXxUa5OVzyZ7KH1JDHR4p5N+TZ6fpAHSvMkvt8TkXoGzXiDrbf2uLrBlbJluhLt
         SxxbhRmIdOv9V7Ff0x9BfHrEd8TwR3qLFtOQy+Vx3wjluy1iudqR1/vwjBiRmrMtgknm
         8qtqC0dTuCDu7fFwOqjEMW3FnzJb48fFcQiYxjJrlnFUjxfB8ADV1UWuYMjFkGV2xAkM
         hNeQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786551598; x=1787156398; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVN7R0gNINTNivuaZy/4598xzsYnBs7giZb1iOZEjyM=;
        b=XKbRANv6Vwsiw5QZit/msVHbz9S8ilhJh1l0N+uvVzAs2g73frMqHRGA/aIHoV964E
         NjKvI3/VulSXAfTNsVUSWeaGKWnexH4D3dWKhMy9o8WQf1er/XCNmib4iYxPXGNyoIp4
         3ciKYBUcm2Y2Adf184nS/4UuhrG9xyBBsO4ykKWEhDVmGTqpjjaoflkDcHJFw5ABLbZo
         mksWC06wF5Mwh8NPMJyLfOXgcJsYL8jI4ZZ65DWxdr0oAz6ffxj+Fc+iOoqn57R0Nseu
         4bU//FI38o2SA992uJqIg4e3GNhMCmyb+yf9ocq4Ds+qRe5FCLnh6kb9HeGtmCvqdDJm
         3YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786551598; x=1787156398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVN7R0gNINTNivuaZy/4598xzsYnBs7giZb1iOZEjyM=;
        b=QsNzhadF/L3dgiiwqChBIrK5KQ/E8lspvi7hon/KvdP3LUVKt81eFgt7GHBEbFVvnO
         uB1h9amyC1E+4585YRWsBeJhvxwwHjRL9303JgyQgKu4svgu8mQf8MKEOJ5W7xc+svX8
         2hK9I5u5NcDRFRZyf9TIiNgWbkGZlgLs48Y2AyqQEcR8Q92XFyV3Wfe2LcmRFdcNyg29
         9wmGLVI/aYBFElcrnkpoetiRIQ2obEB/8Zev8wL/oNwkJVCPLmwFvZSIcvAG+yBx9Xiy
         Ve8gZKBRYQ2iWCKZ8VE2kKGEGEeAz6dJUNiVrZP8HT7PU43ZY3z3LA+RdQHOYWQGg9/u
         Tpxg==
X-Gm-Message-State: AOJu0Yzhe+mim/iKF/Ia5G3cIPLKCgcEqbA+CPF8MrLh1Bo+a6tqEce1
	rBNX8EK9C0IZmsReqpBjlLopcTl3e/oQabWGUjpMNWptjhg/XisCWJ+2T0nOBX+b7rTnYu4z4OO
	L4GUZBkXGZ2ebrMbz+awZhuGRFdVy8Co=
X-Gm-Gg: AR+sD11xIsV/018ig1Fb1Skh12J+vdFLJFkqj9NNftq9r6/kct/sFgOehUrryTdzxjn
	kohb1BrXvc7ZIQeJimZ/gja6nfIN6yivj4tHmyqLWXRjbv8ZAp1IFzk2y7BWV8YsoA1E8/YTdGh
	bYP3kaJFHW4khS8/JH5rMK1zeIn4KeYl1/rdOOIs7mDJ9GaXkoRDezUCzPVLHjOK2SSOg9srJ8m
	DQaBnC190c6Ku2twGxIsywYNMqVMAek8AeSpFrya1p8S/X3u3UI/WEJOxE/i7HtQKzkEqtk1pRF
	uch+qRRyXTg/sQSFuCpuyc5ecKDKbsDcsscFynHIgyGSaPBpuCVI7cODd9EskLZXEfh8JjMq/9x
	1AWPjYJ0+2evQGg==
X-Received: by 2002:a05:6512:1090:b0:5b1:5ccf:5268 with SMTP id
 2adb3069b0e04-5b44e2dad0emr895988e87.1.1786551598255; Wed, 12 Aug 2026
 09:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260810-tune-a32-v2-0-52045fd54937@gmail.com>
 <20260810-tune-a32-v2-2-52045fd54937@gmail.com> <214ED404-A4E7-4F85-89B3-C1C78006DE76@arm.com>
In-Reply-To: <214ED404-A4E7-4F85-89B3-C1C78006DE76@arm.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 12 Aug 2026 17:19:46 +0100
X-Gm-Features: AUfX_myfoxbdpEVmlBq6CuBSHW3g5xKdS4Uhf0NQStIGbC2naH9JXg3_rfYNr7Y
Message-ID: <CAO5Uq5RzOr+oMNFOqRMdPHoRW4ghmcHD5xuH9HMKgtESok9iow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] qemuarmv8a32: add QEMU machine for
 AArch32 ARMv8-A
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alex Kiernan <alexk@a-squared-projects.uk>, Jon Mason <jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 16:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243299

On Wed, Aug 12, 2026 at 2:25=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 10 Aug 2026, at 06:11, Alex Kiernan via lists.openembedded.org <alex.k=
iernan=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Add a QEMU machine for exercising an AArch32-only ARMv8-A target
> > (Cortex-A32) under emulation, defaulting to the cortexa32-crypto tune.
> > QEMU has no Cortex-A32 model, so it runs on the 'virt' machine with
> > qemu-system-aarch64 using the Cortex-A32's AArch64-capable sibling, the
> > Cortex-A35, with 'aarch64=3Doff' so the guest is AArch32-only. This
> > provides the ARMv8-A AArch32 feature set including the crypto extension=
s
> > needed by the crypto tune, and the same binary supports KVM on AArch64
> > hosts whose CPUs implement AArch32 at EL1 via '-cpu host,aarch64=3Doff'=
.
> > The kernel is built as a zImage and u-boot uses qemu_arm_defconfig,
> > matching the other 32-bit ARM QEMU machines.
>
> Whilst this is an interesting machine, I=E2=80=99m not sure I see a lot o=
f value in adding it to oe-core.  You could easily maintain a tiny BSP laye=
r to do this, for example.
>
> If we=E2=80=99re adding this to core then we either need to support it (w=
hich means someone needs to confirm that they=E2=80=99ll be maintaining it,=
 we need to build it on the autobuilder which means more resources are used=
 on every build, and build release artefacts for it), or explicitly say tha=
t it=E2=80=99s in the same tier as qemuppc etc where someone commits to mai=
ntaining the BSP but it=E2=80=99s not tested automatically and may well be =
broken.
>
> Personally, I feel that qemuppc/qemumips are in that second tier for hist=
orical reasons, and if they were being added to core now I'd say to put the=
m in a separate layer.
>

That's fair. Mostly it was having done the work to get the tune right
(which is already in), it was having a way to demonstrate it without
an actual board. But I agree without it hitting the AB matrix, it'll
likely rot.

Happy for it to be dropped.

--=20
Alex Kiernan

