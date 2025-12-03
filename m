Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CDED1BDD7
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 19:37:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24676.1764790651586904198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 11:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CVD253yl;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 652951A1F12
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Dec 2025 19:37:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AC8460706;
	Wed,  3 Dec 2025 19:37:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D138C119216BC;
	Wed,  3 Dec 2025 20:37:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764790648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8DfwkVFIr/S3XkksTJCIUGtKw5DwjHt3AVD3lOxVP6s=;
	b=CVD253yluwfZMBn/fz+ubTlMEqArxm0wD5oeM2OeOFgvolRhQzCLQDR6OshHjNXEa306UQ
	7nc/peuZ5NvJ7FdGJxRGRMygVjMq22FftzL2+rQApoErWqcTOrIsEy4kMfAIkLS86TgjzI
	M5O66lbZNyelSR/Z6QD8frdpmq4lvsXIZVsggW08otbbj7AE2wihVzMOzz11d209dAC+G7
	pJiPqkYB+qN6ursCTvKhvZ5Edx6WtfUmlX/KfF5aKxZzyHAq5yzgeGyMB94hBGAcmXQB/5
	/GYpPkjyhJOSkuWA4GFEx9eRW1Od4IQtPFryyLozDZqfsqEpnDIKLivJ8HexKQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 20:37:26 +0100
Message-Id: <DEOU2MMC87XK.2WWY757LXHRIT@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH V4 2/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
Cc: <alex@linutronix.de>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251201052523.1222217-1-Qi.Chen@windriver.com>
 <20251201052523.1222217-2-Qi.Chen@windriver.com>
In-Reply-To: <20251201052523.1222217-2-Qi.Chen@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 19:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227236

On Mon Dec 1, 2025 at 6:25 AM CET, Chen Qi via lists.openembedded.org wrote=
:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> It's possible that users use EXTRA_USERS_PARAMS to set password
> for root or explicitly expire root password. So we need to check
> these two cases to ensure the 'no password' banner is not misleading.
>
> As an example, below are configurations to make an image requiring
> setting a root password on first boot, but without having to first enter
> a static initial password:
>
>   In conf/toolcfg.cfg:
>   OE_FRAGMENTS +=3D "distro/poky core/yocto/root-login-with-empty-passwor=
d
>   In local.conf:
>   INHERIT +=3D "extrausers"
>   EXTRA_USERS_PARAMS +=3D " passwd-expire root;"
>
> Checking and adding such a banner is ensured to run as last steps of
> ROOTFS_POSTPROCESS_COMMAND, regardless of IMAGE_FEATURES. In particualr,
> we want to ensure that the function runs after set_user_group function
> from extrausers.bbclass. So unlike other commands in this bbclass using
> the '+=3D', this function uses ':append'.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---

Hi Chen,

Thanks for your patch.

It looks like this is breaking the
containerimage.ContainerImageTests.test_expected_files selftest:

2025-12-03 13:55:47,169 - oe-selftest - INFO - containerimage.ContainerImag=
eTests.test_expected_files (subunit.RemotedTestCase)
2025-12-03 13:55:47,176 - oe-selftest - INFO -  ... FAIL
...
AssertionError: Lists differ: ['./'[14 chars]/etc/issue', './etc/ld.so.cach=
e', './etc/times[112 chars]ib/'] !=3D ['./'[14 chars]/etc/ld.so.cache', './=
etc/timestamp', './etc/v[97 chars]ib/']

First differing element 2:
'./etc/issue'
'./etc/ld.so.cache'

First list contains 1 additional elements.
First extra element 12:
'./var/lib/'

  ['./',
   './etc/',
-  './etc/issue',
   './etc/ld.so.cache',
   './etc/timestamp',
   './etc/version',
   './run/',
   './usr/',
   './usr/bin/',
   './usr/bin/theapp',
   './var/',
   './var/cache/',
   './var/lib/']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2787
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2682
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2926

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


