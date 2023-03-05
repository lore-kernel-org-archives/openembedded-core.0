Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9851FC6FA8E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 21:04:19 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.18074.1678050250349553580
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 13:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TczF1dsG;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 14A26240002;
	Sun,  5 Mar 2023 21:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678050248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3ISwz3OwYmTQdnBF3Uz7ob+Mudi18fEQ/oGKOIQP8w=;
	b=TczF1dsGZP644fYL/EZHoNvrFsI3ZTiA6ObtEmzUKqQlHOK86pwyGAd/3TZ9mEtwJNLoFe
	qwFwRR0JazlUyVW4rDu3h4J+rzCY9tlHtZYraMyThfW+64dStBUA32vFaxvmseqOHVgApt
	2uX/sjon9K7zjgPhoM5yvlcqzM34mwpTrvMgUJYAAP5DkfGMb/9IIuQym9JiJoyi4NBc8p
	1W/4spBnphjTVsLMho+kFOZZRGKNlhwZyoIbzh2q0uDKogITWN++nnVm0TRUurL4W4sJm5
	CURgawSBe8QnwpEUYN3st6/VE2+35to65sy8YeYqB5F1oyaYQzx0IeXembKp+w==
Date: Sun, 5 Mar 2023 22:04:07 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Brenda Streiff <brenda.streiff@ni.com>
Subject: Re: [OE-core] [PATCH v2 1/2] qemu: split out qemu-guest-agent, add
 startup scripts
Message-ID: <ZAUDx+BmqijKzdhQ@mail.local>
References: <20230224153157.20305-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224153157.20305-1-peron.clem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 21:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178053

Hello,

This doesn't apply on master, can you rebase?

On 24/02/2023 16:31:56+0100, Cl�ment P�ron wrote:
> Split out the QEMU guest agent into a separate package. The agent is
> intended to be installed within a QEMU VM guest where a user is likely
> to not want to have the rest of the QEMU installation within it.
> 
> Additionally, an initscript, udev rules file, and systemd unit file are
> added to the package so that the guest agent can start automatically;
> the former two come from Debian's packaging for qemu-guest-agent.
> 
> Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
> Signed-off-by: Cl�ment P�ron <peron.clem@gmail.com>
> ---
> 
> This is a resend of the patch from Brenda Streiff where I changed
> the:
> SYSTEMD_SERVICE:${PN}-guest-agent = "${PN}-guest-agent.service"
> in
> SYSTEMD_SERVICE:${PN}-guest-agent = "qemu-guest-agent.service"
> 
>  meta/recipes-devtools/qemu/qemu.inc | 35 ++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 92828e8f2d..cb443769f2 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
>  RDEPENDS:${PN}-ptest = "bash"
>  
>  require qemu-targets.inc
> -inherit pkgconfig ptest
> +inherit pkgconfig ptest update-rc.d systemd
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>                      file://COPYING.LIB;endline=24;md5=8c5efda6cf1e1b03dcfd0e6c0d271c7f"
> @@ -30,6 +30,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch \
>             file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
>             file://0001-configure-Fix-check-tcg-not-executing-any-tests.patch \
> +           file://qemu-guest-agent.init \
> +           file://qemu-guest-agent.udev \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  
> @@ -130,6 +132,20 @@ do_configure[cleandirs] += "${B}"
>  do_install () {
>  	export STRIP=""
>  	oe_runmake 'DESTDIR=${D}' install
> +
> +	# If we built the guest agent, also install startup/udev rules
> +	if [ -e "${D}${bindir}/qemu-ga" ]; then
> +		install -d ${D}${sysconfdir}/init.d/
> +		install -m 0755 ${WORKDIR}/qemu-guest-agent.init ${D}${sysconfdir}/init.d/qemu-guest-agent
> +		sed -i 's:@bindir@:${bindir}:' ${D}${sysconfdir}/init.d/qemu-guest-agent
> +
> +		install -d ${D}${sysconfdir}/udev/rules.d/
> +		install -m 0644 ${WORKDIR}/qemu-guest-agent.udev ${D}${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules
> +
> +		install -d ${D}${systemd_unitdir}/system/
> +		install -m 0644 ${S}/contrib/systemd/qemu-guest-agent.service ${D}${systemd_unitdir}/system
> +		sed -i -e 's,-/usr/bin/,-${bindir}/,g' ${D}${systemd_unitdir}/system/qemu-guest-agent.service
> +	fi
>  }
>  
>  # The following fragment will create a wrapper for qemu-mips user emulation
> @@ -208,3 +224,20 @@ PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
>  INSANE_SKIP:${PN} = "arch"
>  
>  FILES:${PN} += "${datadir}/icons"
> +
> +# Put the guest agent in a separate package
> +PACKAGES =+ "${PN}-guest-agent"
> +SUMMARY:${PN}-guest-agent = "QEMU guest agent"
> +FILES:${PN}-guest-agent += " \
> +    ${bindir}/qemu-ga \
> +    ${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules \
> +    ${sysconfdir}/init.d/qemu-guest-agent \
> +    ${systemd_unitdir}/system/qemu-guest-agent.service \
> +"
> +
> +INITSCRIPT_PACKAGES = "${PN}-guest-agent"
> +INITSCRIPT_NAME:${PN}-guest-agent = "qemu-guest-agent"
> +INITSCRIPT_PARAMS:${PN}-guest-agent = "defaults"
> +
> +SYSTEMD_PACKAGES = "${PN}-guest-agent"
> +SYSTEMD_SERVICE:${PN}-guest-agent = "qemu-guest-agent.service"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178050): https://lists.openembedded.org/g/openembedded-core/message/178050
> Mute This Topic: https://lists.openembedded.org/mt/97410706/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

