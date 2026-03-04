Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F53EFCE24
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:41:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24269.1772646095587333596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cPxCT4l9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 65C8B1A2CB5;
	Wed,  4 Mar 2026 17:41:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B1DD5FF5C;
	Wed,  4 Mar 2026 17:41:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64B68103685C7;
	Wed,  4 Mar 2026 18:41:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772646092; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LOnO6oU/7eWda3A8dqXAuLVYfRMR2D2MxMV85fJ2cGY=;
	b=cPxCT4l90QW8ZuKIzsRUp0d3KBJw0DCNx7bNJAKJweS9/KvVbUegsiSI9ZOonn9pKiE5UT
	YdMZH9xOsAzRiuwptS67EFTcGid/se5aXfLg4/dz0R/RP88qYEPE1fj1ch1UVVVp7np3J7
	RGEGHxHhAZC5ny6495++s+G1j8aN49aN9T1Zk3VxnsNi9vb5AZsQW4cgGS+/tdlshLGAYP
	QpIueSKwfA6WwFTIUOqEHrxFfY3tB7Dbm6dkSM23jK1UJ/ARUq87uNCWFq+dbHPhQeQ7Yp
	w0QixLZb/vffx7jHtgfImuccspe6c/yK+diSSyKWEViSEcO0Fy6rCgZ/oyYC6g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 18:41:31 +0100
Message-Id: <DGU6LGIXFAH7.3NWXCBMVFRKMC@bootlin.com>
Subject: Re: [OE-core] [PATCH 01/10] gst-devtools: upgrade 1.26.9 -> 1.28.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260304103203.1649-1-wangmy@fujitsu.com>
In-Reply-To: <20260304103203.1649-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232415

On Wed Mar 4, 2026 at 11:31 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for the upgrade.

It looks like we have some build issues with the new version:

ERROR: lib32-gstreamer1.0-vaapi-1.26.9-r0 do_compile: Execution of '/srv/po=
kybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-lin=
ux/lib32-gstreamer1.0-vaapi/1.26.9/temp/run.do_compile.2061462' failed with=
 exit code 1
...
| /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokyml=
lib32-linux/lib32-gstreamer1.0-vaapi/1.26.9/lib32-recipe-sysroot/usr/includ=
e/gstreamer-1.0/gst/video/gstvideodmabufpool.h:53:24: error: unknown type n=
ame 'GstVideoBufferPoolClass'; did you mean 'GstBufferPoolClass'?
error: unknown type name 'GstVideoBufferPoolClass'; did you mean 'GstBuffer=
PoolClass'?
|    53 |     VIDEO_DMABUF_POOL, GstVideoBufferPool)
|       |
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3295

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


