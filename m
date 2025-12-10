Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC37AD3C928
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 16:10:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.745.1765383010344217999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 08:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pT9gSv3D;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 334EB1A204E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 16:10:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA7AA60714;
	Wed, 10 Dec 2025 16:10:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCD9C11931A4E;
	Wed, 10 Dec 2025 17:10:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765383007; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mbu9TwNU7rkQK2V6nQ7Rfnqi7tLB5FbdF3O4zg45Ln8=;
	b=pT9gSv3DXZe9BlFUlhpr3yMLYSbudLo5yu96CEIajcfEcsW9ktpHafZpKLtMWKjqw7pCXq
	hhUmg1DvtWjJw+foEVSjbleR1JDm1T2MsCApFwYYFnUj9pKbXTdEnXo3hruC+/06pbM+e+
	zN6RE8RhDvHTcdVIdn29pmKbOS2QWGtM0vkn6IkYbum1iqBqpzPenWD9Kwm21Dwc1CrI2f
	m2IFXvc2OxPB7DxgN3GSKPP8THdaWmkbSlWwljte44p19RMjaD1VAyKXaKBu6izcprqfiN
	BSDhB278CofM8UWArdSQBhfHwG/5n1OFj9qy56NV5DaUlXPj5+Ul81tUzi7/DQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 17:10:05 +0100
Message-Id: <DEUO1OQO7N35.1HMYKQAHAWR3A@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 4/4] mesa: upgrade 25.2.5 -> 25.3.1
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251210043728.847548-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251210043728.847548-4-dmitry.baryshkov@oss.qualcomm.com>
 <DEUJN3MKRQKB.3HDWIDZ835RP7@bootlin.com>
In-Reply-To: <DEUJN3MKRQKB.3HDWIDZ835RP7@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 16:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227486

On Wed Dec 10, 2025 at 1:42 PM CET, Mathieu Dubois-Briand wrote:
> On Wed Dec 10, 2025 at 5:37 AM CET, Dmitry Baryshkov via lists.openembedd=
ed.org wrote:
>> Upgrade Mesa to the latest release. Drop VDPAU tracker (dropped
>> upstream). Add support for ethosu and rocket Gallium drivers.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>
> Hi Dmitry,
>
> Thanks for your patches.
>
> It looks like the new version is not building correctly for armv5:
>
> ERROR: mesa-2_25.3.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-wo=
rker/qemuarmv5/build/build/tmp/work/armv5e-poky-linux-gnueabi/mesa/25.3.1/t=
emp/run.do_compile.92740' failed with exit code 1
> ...
> | In file included from ../sources/mesa-25.3.1/src/virtio/venus-protocol/=
vn_protocol_driver_cs.h:11,
> |                  from ../sources/mesa-25.3.1/src/virtio/venus-protocol/=
vn_protocol_driver_types.h:11,
> |                  from ../sources/mesa-25.3.1/src/virtio/venus-protocol/=
vn_protocol_driver_handles.h:11,
> |                  from ../sources/mesa-25.3.1/src/virtio/venus-protocol/=
vn_protocol_driver_structs.h:11,
> |                  from ../sources/mesa-25.3.1/src/virtio/venus-protocol/=
vn_protocol_driver_transport.h:12,
> |                  from ../sources/mesa-25.3.1/src/virtio/vulkan/vn_ring.=
c:10:
> | ../sources/mesa-25.3.1/src/virtio/vulkan/vn_ring.c:18:1: error: static =
assertion failed: "vn_ring_shared requires lock-free 32-bit atomic_uint"
> |    18 | static_assert(ATOMIC_INT_LOCK_FREE =3D=3D 2 && sizeof(atomic_ui=
nt) =3D=3D 4,
> |       | ^~~~~~~~~~~~~
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2673
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu

Just a quick follow-up: it looks like the issue does not come from the
update but probably from another commit in this series. I dropped just
the last commit and still got the error:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2675

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


