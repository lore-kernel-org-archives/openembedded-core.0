Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359FFC5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 10:03:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13311.1787565783477250816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 03:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aY+zUrI0;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 24AD11A17F1;
	Mon, 24 Aug 2026 10:03:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E25395FFC1;
	Mon, 24 Aug 2026 10:03:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53DCE11C78C66;
	Mon, 24 Aug 2026 12:02:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787565780; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MVQyVy3HZqtarm6A5mYY+oCeIDww0DlKFNqWrw70n0U=;
	b=aY+zUrI0JqOW8hutKIz1FynU91I7K+/Pu/aiFAfBEA8O4BQ1o+8YlVyQk39/nmp2MMQoaN
	8iV2eLeb+It8nd1SAKcZTXSbHeuR0KDmdhEsCTLxaYvou87v4TU52TYpYRIDgTRR4s3sZK
	Jt1ElOWx10wCZuybJozRTwIVmeuoTj7jCgTBTfPtygoGHq5Z9QyoaRGg3VWDljbwG8SQth
	ZdZNmKAh6IEAPozvK8fO83kwqsQTdk743CjTir1VPjIXl7mJzEyRWdnqRmRbh+zt8h1Lbn
	IUaCGmGhqPsuRZQgVRwR+VPVzV+U2ELkvov+Qm5xOdvhR8Vrs3tPDVZaRDaPuA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 12:02:57 +0200
Message-Id: <DKX36LKP5G7W.3D3MAFXU05Z5X@bootlin.com>
To: =?utf-8?q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
Subject: Re: [PATCH v2] bitbake.conf: Extend distro feature usrmerge to
 merge bin+sbin
Cc: <openembedded-core@lists.openembedded.org>,
 <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>, <rs@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de> <aolV39x9UzHwcTrZ@navimatix.de> <DKVGRWKPI3K2.1PBICS35XGJYK@bootlin.com> <aoms3iLkFaLTp8E7@navimatix.de> <DKWYNZVX7C32.11QQ5O5ZO8J68@bootlin.com> <aowSZF6aysT2amaR@navimatix.de>
In-Reply-To: <aowSZF6aysT2amaR@navimatix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 10:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244082

On Mon Aug 24, 2026 at 11:53 AM CEST, J=C3=B6rg Sommer wrote:
> Mathieu Dubois-Briand schrieb am Mo 24. Aug, 08:30 (+0200):
>> On Sat Aug 22, 2026 at 4:09 PM CEST, J=C3=B6rg Sommer wrote:
>> > Mathieu Dubois-Briand schrieb am Sa 22. Aug, 14:16 (+0200):
>> >> On Sat Aug 22, 2026 at 9:56 AM CEST, J=C3=B6rg Sommer wrote:
>> >> > J=C3=B6rg Sommer schrieb am Fr 24. Jul, 11:00 (+0200):
>> >> >> From: Randolph Sapp <rs@ti.com>
>> >> >>=20
>> >> >> The split of bin and sbin became more artificial over time, and it=
 is no
>> >> >> longer clear why programmes goes into the one or the other directo=
ry; e.g.
>> >> >> forever normal users have used sendmail in /usr/sbin, and fdisk an=
d mkfs
>> >> >> learned to operate on files to create images long ago.
>> >> >
>> >> > Gentle ping. What's the state of this?
>> >> >
>> >>=20
>> >> Hi J=C3=B6rg,
>> >>=20
>> >> Previous builds showed some errors. Should it have evolve since that?
>> >
>> > Yes, I think so. The bootchart2 errors were addressed by 2bf18f9908, a=
nd the
>> > tcf-agent by 443f8c62ad.
>>=20
>> Hi J=C3=B6rg,
>>=20
>> It looks like this is still failing, at least with alt distro:
>>=20
>> ERROR: systemd-1_261.2-r0 do_package: QA Issue: systemd: Files/directori=
es were installed but not shipped in any package:
>>   /usr/sbin
>>   /usr/sbin/poweroff
>>   /usr/sbin/mount.ddi
>>   /usr/sbin/init
>>   /usr/sbin/resolvconf
>>   /usr/sbin/mount.storage
>>   /usr/sbin/halt
>>   /usr/sbin/mount.mstack
>>   /usr/sbin/reboot
>>   /usr/sbin/shutdown
>> Please set FILES such that these items are packaged. Alternatively if th=
ey are unneeded, avoid installing them or delete them within do_install.
>> systemd: 10 installed and not shipped files. [installed-vs-shipped]
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/4407
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/4430
>>=20
>> Can you have a look at the issue?
>
> Thank you Mathieu for your testing. I built systemd 261.2 with poky-altcf=
g
> and had no errors. Can I find your branch mathieu/master-next somewhere?
>
>
> Regards, J=C3=B6rg

You can find a tag in there:

https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder.yo=
ctoproject.org/valkyrie/a-full-4555

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


