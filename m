Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08917ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 14:29:52 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.9912.1667226582362367667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 07:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=elUF0oqL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4A31040003;
	Mon, 31 Oct 2022 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667226580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9lf0wOaH89xI4HP60VJY8o5RiW7Y/N+H+GH+y9jDk+Y=;
	b=elUF0oqLoy7fcN/ZdCLJVqhjPHMd7n3MWgl2GoW6dLCqOM6qMbd3SSFeUPWUg2BZz5Gnaw
	McUc0nVPLxZiyJtF5pK32D/FNi1w0xwlc7oXyf+X1sGOnOqiod5kMyxCm2G+5KRL+i7N2O
	qaQtTxpbyGDDHz7krifc+nkIvDoR7iT49f3ugIZcIBOXhmmIgd42O4tlgrXV/cFqPEHmrV
	5GwVaLpdxcq8qTVo2zeZnlWiSurKUJ4dZKYetwnmK/7wXeD8wBqkywV2Io2iKZcMYSHb1j
	FsTmcDTyekcSbYB7S4mRfoL33c6W4kKbZye3EelchPJCmkvQdy3XOAxdKa6YGQ==
Date: Mon, 31 Oct 2022 15:29:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Add nativesdk of systemd-systemctl
Message-ID: <Y1/b04+Xg1vA6zDg@mail.local>
References: <1667204240-3627-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1667204240-3627-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 14:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172318

Hello, this causses the following failure on the AB:

AssertionError: 
The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
nativesdk-systemd-systemctl (/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb)


On 31/10/2022 16:17:20+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../systemd/nativesdk-systemd-systemctl.bb      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
> 
> diff --git a/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb b/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
> new file mode 100644
> index 0000000000..66b5ec5e6e
> --- /dev/null
> +++ b/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Wrapper for enabling systemd services"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +PR = "r0"
> +
> +inherit nativesdk
> +
> +SRC_URI = "file://systemctl"
> +
> +S = "${WORKDIR}"
> +
> +do_install() {
> +	install -d ${D}${bindir}
> +	install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
> +}
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172293): https://lists.openembedded.org/g/openembedded-core/message/172293
> Mute This Topic: https://lists.openembedded.org/mt/94680777/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

