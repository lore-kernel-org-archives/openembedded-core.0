Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D8DE94133
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:55:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.6697.1696629336720983535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nXRf0uNK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06D19FF806;
	Fri,  6 Oct 2023 21:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696629334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6OopakdTLTTVSKXc9v5QrVvVADOusf3dwod+eSrl1JU=;
	b=nXRf0uNKVa4dRgY673InKVk6taPfNKaLw0TOI5Wto08MvJaAi0hBXLVSXUqbllQdjecb25
	KeKFkGlHvT7hbs23RR5bS0DWiSSdezSfvV2xN0NhNXAQK4bMP9yjRiocmFvTuRB98ubwnZ
	VURSqJTKZTfqxLHku63Nvv9FAN6kugbB0KK/NRFIiRZiBqs0JjnQ0IBLKfbMgza/BvsIV5
	889SAZ5+SWFlIiun32XMGGuM7I5KGgzVTvQGboYV1PW6/y9fEYhwgxCh9usPRaAB0w1mIR
	yOu7YpE8JhLRm6kdvvG348ROsSX+BRCCHVP/LCtiP5WacvzlRQmAcsa3juRGvQ==
Date: Fri, 6 Oct 2023 23:55:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Louis Rannou <louis.rannou@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org, Qi.Chen@windriver.com,
	Louis Rannou <lrannou@baylibre.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [OE-core] [PATCH v2] systemd: sysusersd: change how the root
 home directory is set
Message-ID: <2023100621553286a996de@mail.local>
References: <20231005-sysusers3-v2-1-938c9cca79b7@syslinbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005-sysusers3-v2-1-938c9cca79b7@syslinbit.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 21:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188793

Hello,

This causes the following warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/6888/steps/11/logs/warnings

On 05/10/2023 22:55:08+0200, Louis Rannou wrote:
> From: Louis Rannou <lrannou@baylibre.com>
> 
> Modifying the sources brings troubles in the devtool command. Therefore it is
> better to patch the source with a custom variable, and later replace it with the
> correct root path.
> 
> Suggestion from :
> <https://lore.kernel.org/all/DB5PR02MB102137939DE6D43E423A9D296EF03A@DB5PR02MB10213.eurprd02.prod.outlook.com/>
> 
> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
> ---
>  ...usersd-Change-the-user-root-s-home-direct.patch | 31 ++++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_254.4.bb         | 11 ++++----
>  2 files changed, 37 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user-root-s-home-direct.patch b/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user-root-s-home-direct.patch
> new file mode 100644
> index 0000000000..dd0d96d11b
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user-root-s-home-direct.patch
> @@ -0,0 +1,31 @@
> +From bf97001978cdefad644f7b4b909f281368e5a4dd Mon Sep 17 00:00:00 2001
> +From: Kas User <kas@example.com>
> +Date: Thu, 27 Jul 2023 08:23:06 +0000
> +Subject: [PATCH] sysusers.d: Change the user root's home directory
> +
> +The default sysusers basic.conf.in file sets the root home directory to `/root`
> +and does not permit its configuration. Change this to `:ROOT_HOME:` which must
> +be set before the installation.
> +
> +The upstream considers the root home directory should not be changed
> +<https://github.com/systemd/systemd/issues/27959>
> +
> +Upstream-Status: Denied
> +Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> +---
> + sysusers.d/basic.conf.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sysusers.d/basic.conf.in b/sysusers.d/basic.conf.in
> +index 0aec080a4c..f26c224341 100644
> +--- a/sysusers.d/basic.conf.in
> ++++ b/sysusers.d/basic.conf.in
> +@@ -7,7 +7,7 @@
> + 
> + # The superuser
> + g root    0       -            -
> +-u root    0:0     "Super User" /root
> ++u root    0:0     "Super User" :ROOT_HOME:
> + 
> + # The nobody user/group for NFS file systems
> + g {{NOBODY_GROUP_NAME}} 65534       -            -
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
> index 77724eb822..3adf62935d 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES += "systemd"
>  SRC_URI += " \
>             file://touchscreen.rules \
>             file://00-create-volatile.conf \
> -           file://basic.conf.in \
>             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
>             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
>             file://init \
> @@ -30,6 +29,7 @@ SRC_URI += " \
>             file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>             file://0008-implment-systemd-sysv-install-for-OE.patch \
>             file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
> +           file://0029-sysusersd-Change-the-user-root-s-home-direct.patch \
>             "
>  
>  # patches needed by musl
> @@ -260,10 +260,6 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
>  # The 60 seconds is watchdog's default vaule.
>  WATCHDOG_TIMEOUT ??= "60"
>  
> -do_configure:prepend() {
> -  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in > ${S}/sysusers.d/basic.conf.in
> -}
> -
>  do_install() {
>  	meson_do_install
>  	install -d ${D}/${base_sbindir}
> @@ -375,6 +371,11 @@ do_install() {
>          sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
>              ${D}/${sysconfdir}/systemd/system.conf
>      fi
> +
> +	# The root home directory specified in sysusers.d/ was patched to
> +	# `:ROOT_HOME:`. Change now to the correct path given by ${ROOT_HOME}.
> +	[ ! -f ${D}${libdir}/sysusers.d/basic.conf ] ||
> +		sed -i s@:ROOT_HOME:@${ROOT_HOME}@g ${D}${libdir}/sysusers.d/basic.conf
>  }
>  
>  python populate_packages:prepend (){
> 
> ---
> base-commit: 095021ac61c1df357e5f1868badd38038004317f
> change-id: 20231005-sysusers3-f448703f294f
> 
> Best regards,
> -- 
> Louis Rannou <louis.rannou@syslinbit.com>
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188739): https://lists.openembedded.org/g/openembedded-core/message/188739
> Mute This Topic: https://lists.openembedded.org/mt/101785446/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

