Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED84CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 07:44:08 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.11811.1757490242361270404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 00:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EenJsg9T;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B455EC6B3AF;
	Wed, 10 Sep 2025 07:43:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78AD5606D4;
	Wed, 10 Sep 2025 07:44:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D5B8102F1D2E;
	Wed, 10 Sep 2025 09:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757490239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RYzrJi7bPAs9b2iBT2xqgMLTI6zs24l8ewAHBTGb1Gk=;
	b=EenJsg9TT0RPhyKHjqbL/WhohlHtSMxdLUU3IKJHKGH8b33PtqQwrpHkA8hvxjPdBsRxsl
	m+N5WhU1nhiwq5yJawsvu2Zd+S0fg7v8xlxD055fyfmkVtK7dGiob/Llus7oa6VPfiWtgo
	PftiRCigxoeBWQgP/0VBAFw9Qa4U3gBlTCKari38uSZ3B/8JxyUz8abNNW8Pu2puAmED9m
	Wbwj/LP7ufgq9eTq6YZ0gK2kIOup/grVdtIDX136+CjufTdiHzK1PBc0gp2QCC6R3wHxX4
	KjgcoAHmuKCgXchH3qaD/Zt/5on3meCcRhvhwYa1OaWKO0hmY5H+sy4LlnaxaA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 09:43:38 +0200
Message-Id: <DCOYACHAEF9A.31YT5ZQTUYPRR@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] wic: Add support for variable sector size
 when creating ESP
Cc: "Bear Wang" <bear.wang@mediatek.com>, "Pablo Sun"
 <pablo.sun@mediatek.com>, "Ramax Lo" <ramax.lo@mediatek.com>, "Macpaul Lin"
 <macpaul@gmail.com>, "MediaTek Chromebook Upstream"
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <macpaul.lin@mediatek.com>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Alexander Kanavin" <alex@linutronix.de>,
 "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Otavio Salvador"
 <otavio@ossystems.com.br>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250910033310.2424072-1-macpaul.lin@mediatek.com>
In-Reply-To: <20250910033310.2424072-1-macpaul.lin@mediatek.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 07:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223149

On Wed Sep 10, 2025 at 5:33 AM CEST, Macpaul Lin via lists.openembedded.org=
 wrote:
> Derive sector_size from the WIC_SECTOR_SIZE BitBake variable.
> Recalculate blocks to align with the chosen sector size.
> While the default sector size of mkdosfs is 512 bytes,
> pass -S <sector_size> to align the setting of WIC_SECTOR_SIZE.
>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---

Hi,

Thanks for your patch.

It looks like this is breaking some builds, as WIC_SECTOR_SIZE might not
be defined.

ERROR: core-image-minimal-1.0-r0 do_image_wic: Execution of '/srv/pokybuild=
/yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky-linux/c=
ore-image-minimal/1.0/temp/run.do_image_wic.1122779' failed with exit code =
1
...
|   File "/srv/pokybuild/yocto-worker/genericx86-64/build/scripts/lib/wic/p=
artition.py", line 199, in prepare
|     plugin.do_prepare_partition(self, srcparams_dict, creator,
|     ~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|                                 cr_workdir, oe_builddir, bootimg_dir,
|                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|                                 kernel_dir, rootfs_dir, native_sysroot)
|                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/genericx86-64/build/scripts/lib/wic/p=
lugins/source/bootimg_efi.py", line 419, in do_prepare_partition
|     sector_size =3D int(get_bitbake_var("WIC_SECTOR_SIZE"))
| TypeError: int() argument must be a string, a bytes-like object or a real=
 number, not 'NoneType'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2367

Can you fix this error, please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


