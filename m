Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30ECECAAD4
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 08:56:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.9290.1661849771299528931
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 01:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fzXbIhsC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CA3E960006;
	Tue, 30 Aug 2022 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661849769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N31S3Rh/QVzaYt86MSgGyEgs4gtS/E/BvxHSisVE7y0=;
	b=fzXbIhsCbYa9gvzUN22VO8zGNr/ND8AR7dsMijSb9Aif4O1d4LGaeqC0ICJd/1tTC4PhJo
	UQgQ24quC6717knz93d+l6HDnYCQPWyduax3yvZmw7dA7IupxAQlry/SqBske6WtCJA61U
	pRVhC/BWqoxljMHNx9aKeLU/0OMai3ZUWXXfLtO42Byw8AUcz40yYTf1f+CYpu6DcILy2A
	OifLRHvW8y9WznMh2OOwO8sQQ/tZEnaI1rN2uqld9gNEc5duIpkE854WZyBFG1TTuooF+t
	DnEFLloj0hii6vpMiw5EiVMrEstqUOYRtVSRKrUuVT1PFPZVoTGjNIjyaEo2XQ==
Date: Tue, 30 Aug 2022 10:56:08 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] packagegroup-base.bb: add a configure option to
 set the wireless-daemon
Message-ID: <Yw3QqKm8NPRbAPuP@mail.local>
References: <20220830051108.86092-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830051108.86092-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 08:56:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170067

On 30/08/2022 07:11:08+0200, Markus Volk wrote:
> Possible options would be wpa-supplicant or iwd.
> 
> iwd is a wireless daemon written by intel and supported by all major network managers.
> It can be run in standalone mode and configured with 'iwctl' from the terminal, and
> with 'iwgtk' or 'iwdgui' from the gui. It can also work as a wpa_supplicant drop-in
> replacement for network-manager, connman or systemd-networkd.
> 
> iwd makes heavy use of the kernel api, so it is not portable but does not need
> additional external libraries like openssl.
> 
> The PACKAGECONFIG name for wpa-supplicant in the connman recipe is changed accordingly,
> so that it also works there when WIRELESS_DAEMON is set globally.

Doesn't that break existing layers and bbappends?

> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-connectivity/connman/connman.inc        | 4 ++--
>  meta/recipes-core/packagegroups/packagegroup-base.bb | 5 ++++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 9a518cdb2b..ea6cfd34a2 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -31,7 +31,7 @@ EXTRA_OECONF += "\
>  # For smooth operation it would be best to start only one wireless daemon at a time.
>  # If wpa_supplicant is running, connman will use it preferentially.
>  # Select either wpa_supplicant or iwd
> -WIRELESS_DAEMON ??= "wpa_supplicant"
> +WIRELESS_DAEMON ??= "wpa-supplicant"
>  
>  PACKAGECONFIG ??= "wispr iptables client\
>                     ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd', d)} \
> @@ -47,7 +47,7 @@ PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_system_unitdir}/ --wit
>  PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi"
>  PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5, bluez5"
>  PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono, ofono"
> -PACKAGECONFIG[wpa_supplicant] = ",,wpa-supplicant,wpa-supplicant"
> +PACKAGECONFIG[wpa-supplicant] = ",,wpa-supplicant,wpa-supplicant"
>  PACKAGECONFIG[iwd] = "--enable-iwd,--disable-iwd,,iwd"
>  PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
>  PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index 7489ef61b0..d60e177471 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -267,11 +267,14 @@ RRECOMMENDS:packagegroup-base-ipsec = "\
>  # packagegroup-base-wifi contain everything needed to get WiFi working
>  # WEP/WPA connection needs to be supported out-of-box
>  #
> +# Choose either 'wpa-supplicant' or 'iwd' as wireless-daemon
> +WIRELESS_DAEMON ??= "wpa-supplicant"
>  SUMMARY:packagegroup-base-wifi = "WiFi support"
>  RDEPENDS:packagegroup-base-wifi = "\
>      iw \
>      wireless-regdb-static \
> -    wpa-supplicant"
> +    ${WIRELESS_DAEMON} \
> +"
>  
>  RRECOMMENDS:packagegroup-base-wifi = "\
>      ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-zd1211rw', '',d)} \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170064): https://lists.openembedded.org/g/openembedded-core/message/170064
> Mute This Topic: https://lists.openembedded.org/mt/93343323/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

