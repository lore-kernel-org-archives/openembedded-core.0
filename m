Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65B3C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:28:39 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.18189.1658917712729957753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hexbjugU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 01CF4E0005;
	Wed, 27 Jul 2022 10:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658917710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQlh5LKVmBTXOpe5L0H7iHfj7BQZD0pMc9L42eJk280=;
	b=hexbjugUiJtGDK9cijEwMYTPxqHb751MakjZ/baKq1BrABaWFEmR80uj6kbf3z22ckJs6h
	FWOh056M7HND2MyGs7GW8QVIzsqPvYZxCl6swPF2udXerOX6Yx3cu0+LzPdSZDbgkVfu8B
	eby47yXyI1njPz4DjbbQ3rzfB7/Om1eb4Xau/l2a0BvV8el4QkiQcR7w2+KUYcV9l0I9Wa
	gmgXze9hXeBDtSz8Tr1DbW6RZmcEa8HVB/amCP0ZBhm4MsrZDOrAzC5/8TL7gBVitzRMKe
	sM5l762zx0zKzbYKf2msOz+jAi4BfLnkBq1jgdzs5GJDniAMWicNGDMDVvUsdQ==
Date: Wed, 27 Jul 2022 12:28:27 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Johannes Schneider via lists.openembedded.org"
 <johannes.schneider=leica-geosystems.com@lists.openembedded.org>
Cc: johannes.schneider@leica-geosystems.com,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH v3] classes: rootfs-postcommands:
 autologin root on serial-getty
Message-ID: <20220727122828.09c7e1c0@booty>
In-Reply-To: 
 <20220727033739.1752802-1-johannes.schneider@leica-geosystems.com>
References: <20220727033739.1752802-1-johannes.schneider@leica-geosystems.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 10:28:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168550

On Wed, 27 Jul 2022 05:37:39 +0200
"Johannes Schneider via lists.openembedded.org"
<johannes.schneider=leica-geosystems.com@lists.openembedded.org> wrote:

> when empty-root-password AND serial-autologin-root are part of the
> IMAGE_FEATURES, save some of the developers time by not having to type
> the (then still sole) 'root' username on the serial consoleafter each

s/consoleafter/console after/

> and every reboot
> 
> this is done by inserting '--autologin root' into the command line of
> the responsible 'getty' service
> 
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
> ---
>  meta/classes/core-image.bbclass          |  1 +
>  meta/classes/image.bbclass               |  2 +-
>  meta/classes/rootfs-postcommands.bbclass | 15 +++++++++++++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index 84fd3eeb38..6764035729 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -29,6 +29,7 @@
>  #   - allow-empty-password
>  #   - allow-root-login
>  #   - post-install-logging
> +# - serial-autologin-root - with 'empty-root-password': autologin 'root' on the serial console
>  # - dev-pkgs            - development packages (headers, etc.) for all installed packages in the rootfs
>  # - dbg-pkgs            - debug symbol packages for all installed packages in the rootfs
>  # - lic-pkgs            - license packages for all installed pacakges in the rootfs, requires
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 2139a7e576..fe32cdefd5 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -34,7 +34,7 @@ INHIBIT_DEFAULT_DEPS = "1"
>  # IMAGE_FEATURES may contain any available package group
>  IMAGE_FEATURES ?= ""
>  IMAGE_FEATURES[type] = "list"
> -IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs read-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-password allow-root-login post-install-logging overlayfs-etc"
> +IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs read-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-password allow-root-login serial-autologin-root post-install-logging overlayfs-etc"
>  
>  # Generate companion debugfs?
>  IMAGE_GEN_DEBUGFS ?= "0"
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index a8a952f31d..65fe74cc5d 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -8,6 +8,9 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
>  # Allow dropbear/openssh to accept root logins if debug-tweaks or allow-root-login is enabled
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-root-login' ], "ssh_allow_root_login; ", "",d)}'
>  
> +# Autologin the root user on the serial console, if empty-root-password and serial-autologin-root are active
> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", [ 'empty-root-password', 'serial-autologin-root' ], "serial_autologin_root; ", "",d)}'
> +
>  # Enable postinst logging if debug-tweaks or post-install-logging is enabled
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
>  
> @@ -196,6 +199,18 @@ ssh_allow_root_login () {
>  	fi
>  }
>  
> +#
> +# Autologin the 'root' user on the serial terminal,
> +# if empty-root-password' AND 'serial-autologin-root are enabled
> +#
> +serial_autologin_root () {
> +	if [ -e ${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.service ]; then
> +		sed -i '/^\s*ExecStart\b/ s/getty /&--autologin root /' \
> +			"${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.service"
> +	fi
> +}
> +
> +


Extra empty line.

I took you patch for testing with the above fixed, no need to resend
just for those.

Thanks.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

