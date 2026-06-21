Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3729CDB466
	for <webhook@archiver.kernel.org>; Sun, 21 Jun 2026 05:38:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18878.1782020325317424592
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 22:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xSrIvDuO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 73839C63447
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2026 05:38:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0474601B9;
	Sun, 21 Jun 2026 05:38:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88352106C8926;
	Sun, 21 Jun 2026 07:38:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782020322; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6XJiUwuVd8IQqxfypd/OycLxUl2Osm6Fa7z95nog2QI=;
	b=xSrIvDuO2HW5Ufutu16HIolHbYdKy6rqg9dsgCSMTi5kUe9emcatTuvek26vVMDl4DR7ho
	Rpui5w6uV34dRpz6gqTPiP+z0cktxtqCpv4DrhZIRnUIHNa77MkSoQbAUR1X5e2hZbXE/s
	FztKYtq+/jZ4WvUtc4LgxU/Ns+s7OWXAdA1b1BAA5KwbdqGdmTw5gR0CINKV2No9NOIXy+
	GjDlCFU+ZouUePDzC7AN1vNDFL+aQB4ywFxYBEpfHzwfGnXzVYgqRz+Btde5pkzQ39cFF4
	+fPoDVAR3mjlpAxX6RsOre6qEY4mkQwc66ND5Cglzh1USdtbZywKIwMDdDWjoQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Jun 2026 07:38:39 +0200
Message-Id: <DJEHHCZ78WJJ.33OK0GL0F70NI@bootlin.com>
Cc: "Gerbrand De Laender" <gdelaende@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <jan.vermaete@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] u-dma-buf: new recipe at version 5.5.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260620111501.8465-1-jan.vermaete@gmail.com>
In-Reply-To: <20260620111501.8465-1-jan.vermaete@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2026 05:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239255

On Sat Jun 20, 2026 at 1:15 PM CEST, Jan Vermaete via lists.openembedded.or=
g wrote:
> Add a Yocto recipe for u-dma-buf, an out-of-tree driver that
> provides userspace-mappable contiguous DMA buffers for FPGA
> and other DMA-capable devices.
>
> Signed-off-by: Gerbrand De Laender <gdelaende@gmail.com>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../u-dma-buf/u-dma-buf_5.5.0.bb              | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta/recipes-kernel/u-dma-buf/u-dma-buf_5.5.0.bb
>
> diff --git a/meta/recipes-kernel/u-dma-buf/u-dma-buf_5.5.0.bb b/meta/reci=
pes-kernel/u-dma-buf/u-dma-buf_5.5.0.bb
> new file mode 100644
> index 0000000000..6dea825b31
> --- /dev/null
> +++ b/meta/recipes-kernel/u-dma-buf/u-dma-buf_5.5.0.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "u-dma-buf: User-space mappable DMA buffer (CMA-backed)"
> +DESCRIPTION =3D "\
> +    u-dma-buf is a Linux device driver that allocates contiguous memory =
blocks in the kernel space as DMA buffers \
> +    and makes them available from the user space. It is intended that th=
ese memory blocks are used as DMA buffers \
> +    when a user application implements device driver in user space using=
 UIO (User space I/O). \
> +    \
> +    A DMA buffer allocated by u-dma-buf can be accessed from the user sp=
ace by opening the device file (e.g. /dev/udmabuf0) \
> +    and mapping to the user memory space, or using the read()/write() fu=
nctions. \
> +"
> +
> +HOMEPAGE =3D "https://github.com/ikwzm/udmabuf"
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbebf0492502927bef0741aa04d1f3=
5f5"
> +
> +PV =3D "5.5.0"
> +
> +SRC_URI =3D "git://github.com/ikwzm/udmabuf.git;protocol=3Dhttps;branch=
=3Dmaster"
> +
> +SRCREV =3D "15bcde3cb960321e99983e227aeacc5807888333"
> +
> +COMPATIBLE_HOST =3D '(arm|aarch64).*-linux'
> +
> +inherit module
> +
> +RPROVIDES:${PN} +=3D "kernel-module-u-dma-buf"

Hi,

In addition to Alex message, please add a maintainer entry in
meta/conf/distro/include/maintainers.inc if this recipe is indeed added.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


