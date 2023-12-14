Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B614C4167B
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:02:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.17249.1702540933188361540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QpyXks3G;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AF7FFF80D;
	Thu, 14 Dec 2023 08:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702540930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XigIwJn/UrPVRUGE0EmbPNjLYjZ0gu5/M6vMd0y9o/0=;
	b=QpyXks3GoI2L/ehHL1wN5IZ68Hy5w4OJNwKzzcTcXe9XpWnmOQ4X1J2UbWY28ShXhxO5Fs
	RmNNQr7w0YzqMDvotG6v730TLGPFgZ60t83zDoTA9q4tf96Gx3/rfKHbHC/JfkCH/hiL3l
	obmvt3TVzcLWBlLod9FPaD0fWzeLbfXALxxTh6NlsG85UPyetjPugblzIO2D6+GFBlQlvh
	pDpTiVISojJ/dYg78g912ftkNjHMDqGGk+9piOgr6ARoO+DVK+BZqJCP6ij/GTThxjQXNP
	ZaD+u5Mkhdv5JiNnKMeeB+81gKTu1il0qrCoOmT/CiDdfpx/PV4PU5MmJWTmxQ==
Date: Thu, 14 Dec 2023 09:02:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 1/2] systemd-boot: Add recipe to compile
 native
Message-ID: <20231214080209d1f89221@mail.local>
References: <20231213115748.487216-1-quic_vkraleti@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213115748.487216-1-quic_vkraleti@quicinc.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 08:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192337

Hello, this causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/8617/steps/11/logs/warnings

WARNING: Nothing RPROVIDES 'python3-pefile-native' (but /home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-core/systemd/systemd-boot-native_254.4.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'systemd-boot-native-dev' (but /home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-core/systemd/systemd-boot-native_254.4.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'systemd-boot-native' (but /home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-core/systemd/systemd-boot-native_254.4.bb RDEPENDS on or otherwise requires it)

and:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6133/steps/14/logs/stdio

The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
systemd-boot-native (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-core/systemd/systemd-boot-native_254.4.bb)

On 13/12/2023 17:27:47+0530, Viswanath Kraleti wrote:
> systemd-boot native recipe provides ukify tool to build
> UKI images for systemd-boot
> 
> Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
> ---
>  .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> 
> diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> new file mode 100644
> index 0000000000..0cdd7e7045
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> @@ -0,0 +1,15 @@
> +require systemd.inc
> +
> +inherit native
> +
> +RRECOMMENDS:${PN} += "python3-pefile-native"
> +
> +COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
> +
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +do_install () {
> +       install -d ${D}${bindir}
> +       install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
> +}
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192289): https://lists.openembedded.org/g/openembedded-core/message/192289
> Mute This Topic: https://lists.openembedded.org/mt/103147679/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

