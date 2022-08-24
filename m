Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85988C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:54:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.8762.1661331284961226457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QGui3eSK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 45F284000B;
	Wed, 24 Aug 2022 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661331282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7+xYVByhOu6zaeq7yCUb9jNUVhLUU4VuB6UfbMXVOR8=;
	b=QGui3eSKkbJe3PkFTuA0kE+9bD/0zu79mX3OS/6iZXlO7lbYluuPQuAjKthPKPhcwIKliz
	0nUxabQGZ7xsZfvfZ6mBpvLZYVjKqKpSxUf5rpoWgSbXkJeQ/aajaletLrbi6MinTFDVCz
	t1q5/TfE3kNRyDMyWPqajfbv4b+1y1WJcfr0tHf4w/qVxiBputOJ86c1POHZFcf4YBVrIQ
	/zZ0HBGwFtN5fqihb5YS87iGX0jRKEtAZ56d5nOYwznY8XXNUTTsuahwewhZzEvIBd7Bal
	sKNuAOgfx88LvhiQRk+L61IqVbRxYSmzJYSKt7Bq2RPGXgcmx/fPRmEjLWZkXA==
Date: Wed, 24 Aug 2022 10:54:40 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] connman: add PACKAGECONFIG to support iwd
Message-ID: <20220824105440.1cdf49a7@booty>
In-Reply-To: <20220823163809.17214-1-f_l_k@t-online.de>
References: <20220823163809.17214-1-f_l_k@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:54:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169796

Hello Markus,

On Tue, 23 Aug 2022 18:38:09 +0200
"Markus Volk" <f_l_k@t-online.de> wrote:

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-connectivity/connman/connman.inc | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 5880ecd5d4..d73a2a734f 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -28,10 +28,15 @@ EXTRA_OECONF += "\
>      --enable-tools \
>      --disable-polkit \
>  "
> +# For smooth operation it would be best to start only one wireless daemon at a time.
> +# If wpa_supplicant is running, connman will use it preferentially.
> +# Select either wpa_supplicant or iwd
> +WIRELESS_DAEMON ??= "wpa_supplicant"
>  
>  PACKAGECONFIG ??= "wispr iptables client\
> -                   ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd wifi', d)} \
> +                   ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'wifi ${WIRELESS_DAEMON}', '', d)} \
>  "
>  
>  # If you want ConnMan to support VPN, add following statement into
> @@ -39,9 +44,11 @@ PACKAGECONFIG ??= "wispr iptables client\
>  # PACKAGECONFIG:append:pn-connman = " openvpn vpnc l2tp pptp"
>  
>  PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_system_unitdir}/ --with-tmpfilesdir=${sysconfdir}/tmpfiles.d/,--with-systemdunitdir='' --with-tmpfilesdir=''"
> -PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant, wpa-supplicant"
> +PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi"
>  PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5, bluez5"
>  PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono, ofono"
> +PACKAGECONFIG[wpa_supplicant] = ",,wpa-supplicant,wpa-supplicant"
> +PACKAGECONFIG[iwd] = "--enable-iwd,--disable-iwd,,,iwd"

I would think iwd should be an rdepends, not an rrecommends. Any reson
for that? Or is it just an unintended extra ','?

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

