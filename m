Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476EDC0015E
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 20:07:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.18402.1691352458404602050
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 13:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=e/g5cxSZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CB3D60003;
	Sun,  6 Aug 2023 20:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691352456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hQ95LURYZE/lpY4XEj/qssEdkRIwjT0s+vQJT++qTEs=;
	b=e/g5cxSZPomzE18eDCb/LMZ7TCsWuMkUWlWjZBUbhPgQHkvnIm3VdyFgA8bCMhmR/sqyrI
	dCkO1rmAsK3u+/FQha4iXwMdHHBZIRhfDBUlll7U4UhoDMEfYX7/sb8lNRieGO+hhNxrwR
	RMW7o/NdTEsYDYX1ihVlN2BI7mwShSgmBAQlXBBSMDQricmgtKxXJ/nsJSdjX55yGE9/KN
	eHjpSauGSoXK2Mpkb/nVbERu9/c+bfaRq3CLcDvS5t4wgjTVSR+zYd/Cffhg16Zz1VJp/O
	eGj/IOcI5am1j0WW3p1RPOBSP9d+lDACimTN8rDPZA57j6AT2kNEOXdpMtFUjA==
Date: Sun, 6 Aug 2023 22:07:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Louis Rannou <lrannou@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, Qi.Chen@windriver.com,
	tgamblin@baylibre.com,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [OE-core] [PATCH] systemd: sysusersd: change how the root home
 directory is set
Message-ID: <20230806200735a954242c@mail.local>
References: <20230727-sysusers_root-v1-1-e39b7602d80e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727-sysusers_root-v1-1-e39b7602d80e@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 20:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185573

Hi,

As we now merged the upgrade to v254, can you rebase?

On 27/07/2023 11:28:37+0200, Louis Rannou wrote:
> Modifying the sources brings troubles in the devtool command. Therefore it is
> better to patch the source with a custom variable, and later replace it with the
> correct root path.
> 
> Suggestion from :
> <https://lore.kernel.org/all/DB5PR02MB102137939DE6D43E423A9D296EF03A@DB5PR02MB10213.eurprd02.prod.outlook.com/>
> 
> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  ...usersd-Change-the-user-root-s-home-direct.patch | 32 ++++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_253.3.bb         | 11 ++++----
>  2 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user-root-s-home-direct.patch b/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user-root-s-home-direct.patch
> new file mode 100644
> index 0000000000..738413ec93
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user-root-s-home-direct.patch
> @@ -0,0 +1,32 @@
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
> +
> diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-core/systemd/systemd_253.3.bb
> index cf0e17ff00..0f96140025 100644
> --- a/meta/recipes-core/systemd/systemd_253.3.bb
> +++ b/meta/recipes-core/systemd/systemd_253.3.bb
> @@ -17,7 +17,6 @@ REQUIRED_DISTRO_FEATURES = "systemd"
>  SRC_URI += " \
>             file://touchscreen.rules \
>             file://00-create-volatile.conf \
> -           file://basic.conf.in \
>             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
>             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
>             file://init \
> @@ -28,6 +27,7 @@ SRC_URI += " \
>             file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
>             file://27254.patch \
>             file://27253.patch \
> +           file://0029-sysusersd-Change-the-user-root-s-home-direct.patch \
>             "
>  
>  # patches needed by musl
> @@ -253,10 +253,6 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
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
> @@ -368,6 +364,11 @@ do_install() {
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
> base-commit: 23d9e2e210f18401ac669a930f2328aefacdc925
> change-id: 20230726-sysusers_root-adb4c6b4cd05
> 
> Best regards,
> -- 
> Louis Rannou <lrannou@baylibre.com>
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184925): https://lists.openembedded.org/g/openembedded-core/message/184925
> Mute This Topic: https://lists.openembedded.org/mt/100387322/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

