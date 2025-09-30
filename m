Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF417CCA468
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 10:25:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.22148.1759227916910487599
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 03:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=004cFYmO;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C47261A1045;
	Tue, 30 Sep 2025 10:25:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99ECD606E4;
	Tue, 30 Sep 2025 10:25:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FC75102F1731;
	Tue, 30 Sep 2025 12:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759227914; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BEsLFkeE8ytAyhiKI08O6ZJAatyAYB5MRAKaL34Agjo=;
	b=004cFYmOaWUHzj9Snd5t0gjAXPIyaYG99jSxkkty7G2FLBGOVb6l8uGOfS1wPtVEAn6F9q
	ChuKXk8gr9jqgWoh7JEIBbUyRtB+eO9JxdbCXifwQWnyYUoloqGI3TXkcF3xPNb2Q5vIf0
	Q+mDVjAe8jzA4Ysq1JEQdLV/0fsCci0vgP6mUC2wvKDvEmzBOEJgSfDH+S5CYv5BJjF10p
	L+a2et0x3YgM9delPBuwz9yaSCKcxT68CPpS8wsYZsE2zxGRALBfpewxr7m18dDOSMNS+K
	kGRjIm3Srvb9Gl1KNLp7pVORRPDXiGDcNeRKuQ1TnahsGLp8xWrtPx3KZHgRww==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Sep 2025 12:25:12 +0200
Message-Id: <DD628XZDM8VH.11V78L41VKXH8@bootlin.com>
Subject: Re: [OE-core][PATCH] ghostscript: upgrade 10.05.1 -> 10.06.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250929104731.19684-1-vanusuri@mvista.com>
In-Reply-To: <20250929104731.19684-1-vanusuri@mvista.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 10:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224182

On Mon Sep 29, 2025 at 12:47 PM CEST, Vijay Anusuri via lists.openembedded.=
org wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Dropped 0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
>
> Added fPIC flag needed to prevent a linker error during the build process=
.
>
> This upgrade addresses CVEs:
> CVE-2025-59798, CVE-2025-59799, CVE-2025-59800, CVE-2025-59801
>
> Changelog:
> https://ghostscript.readthedocs.io/en/gs10.06.0/News.html
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---

Hi Vijay,

Thanks for your patch.

We got some build issues on the autobuilder:

ERROR: ghostscript-10.06.0-r0 do_compile: Execution of '/srv/pokybuild/yoct=
o-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/ghostsc=
ript/10.06.0/temp/run.do_compile.9882' failed with exit code 1
...
| ./base/gdevmpla.c: In function 'mem_planar_strip_copy_rop2':
| ./base/gdevmpla.c:1962:58: error: passing argument 3 of 'check_64bit_mult=
iply' from incompatible pointer type [-Wincompatible-pointer-types]
|  1962 |         if (check_64bit_multiply(height, chunky_sraster, (size_t =
*)&nbytes) !=3D 0)
|       |                                                          ^~~~~~~~=
~~~~~~~~~
|       |                                                          |
|       |                                                          size_t *=
 {aka unsigned int *}
| In file included from ./base/gdevmpla.c:21:
| ./base/gxdevice.h:694:71: note: expected 'int64_t *' {aka 'long long int =
*'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   694 | static inline int check_64bit_multiply(int64_t x, int64_t y, int6=
4_t *result)
|       |                                                              ~~~~=
~~~~~^~~~~~
| ./base/gdevmpla.c:2022:68: error: passing argument 3 of 'check_64bit_mult=
iply' from incompatible pointer type [-Wincompatible-pointer-types]
|  2022 |         if (check_64bit_multiply(chunky_t_height, chunky_t_raster=
, &nbytes) !=3D 0)
|       |                                                                  =
  ^~~~~~~
|       |                                                                  =
  |
|       |                                                                  =
  intptr_t * {aka int *}
| ./base/gxdevice.h:694:71: note: expected 'int64_t *' {aka 'long long int =
*'} but argument is of type 'intptr_t *' {aka 'int *'}
|   694 | static inline int check_64bit_multiply(int64_t x, int64_t y, int6=
4_t *result)
|       |                                                              ~~~~=
~~~~~^~~~~~
| make: *** [base/lib.mak:1207: obj/gdevmpla.o] Error 1

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2498
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2316
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2476

Can you look into these, please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


