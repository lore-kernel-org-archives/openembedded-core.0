Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01AFEB64DD
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 08:56:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.29963.1691398589371190466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 01:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f03jP12P;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77B1FC0006;
	Mon,  7 Aug 2023 08:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691398586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BzPw0RxMPA7YJja19G6Ee6tqDD8DKSu1XO6HjRt1ORE=;
	b=f03jP12PsUzBRkUDtqpHKaSdxALgCMD3WxvQ8DjbJZAtHoZaQ5Q2H2G7v5FVTqtO/i6OCd
	9oJFAAljyf9p41QWfyEjyXwKBzFtUoHqbDhItOEuhhM9V2c7RWSJP5T/iLXDLiC3MLwQmx
	HUXJzRWdrDr55cXf/qh7yzt3KvrIsiMAeCijfRqw0NKS7G9F3GxLxFz1PqQ9TtvHqGLLs8
	Ag9zZIyVJ1LuOop7GY0mCXAIk7ECR1Dc5HA1O3CFS+vPmiTmitsP/jmHbBvBf8CMbvqdJw
	/OjZWSL7j2A4nE099U+LwSLIKOSeOD5HngD6M/uG2wNT/iMlfSaBRvkxYBWTwg==
Date: Mon, 7 Aug 2023 10:56:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org,
	Tom Hochstein <tom.hochstein@nxp.com>
Subject: Re: [OE-core] [PATCH 3/3] weston-init: mimic systemd behavior when
 running in sysvinit
Message-ID: <2023080708562589664a88@mail.local>
References: <20230804200438.1651568-1-otavio@ossystems.com.br>
 <20230804200438.1651568-3-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804200438.1651568-3-otavio@ossystems.com.br>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 08:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185590

Hello,

I believe this change causes this QA failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7576/steps/12/logs/stdio

On 04/08/2023 17:04:11-0300, Otavio Salvador wrote:
> The systemd uses /run/wayland-0 as global socket and it is important to
> align the behavior so it avoids diverging when using sysvinit. Another
> change is installing the ${sysconfdir}/profile.d/weston-socket.sh script
> also aligning the behaviors.
> 
> The commit modifies the behavior of the weston-init script when running
> in sysvinit. It mimics the behavior of systemd by exporting the
> WAYLAND_DISPLAY variable and using it as the socket for the weston
> command.
> 
> The changes include:
> 
> - The installation of the weston-socket.sh script in the /etc/profile.d
> directory, which sets the WAYLAND_DISPLAY variable to /run/wayland-0 if
> it is not already set.
> 
> - Modifying the weston-start script to check if the WAYLAND_DISPLAY
> variable is set. If not, it sets it to /run/wayland-0.
> 
> These changes ensure that the weston command uses the same socket
> defined in the WAYLAND_DISPLAY variable, allowing compatibility with
> systems using sysvinit and systemd.
> 
> Fixes: 2818cbc730 ("weston-init: add profile to point users to global socket")
> Tested-by: Tom Hochstein <tom.hochstein@nxp.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  meta/recipes-graphics/wayland/weston-init.bb           | 4 +++-
>  meta/recipes-graphics/wayland/weston-init/weston-start | 6 +++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
> index 024e400665..6c8dc36467 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -40,13 +40,15 @@ do_install() {
>  	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>  		install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
>  		install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
> -		install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
>  		sed -i -e s:/etc:${sysconfdir}:g \
>  			-e s:/usr/bin:${bindir}:g \
>  			-e s:/var:${localstatedir}:g \
>  			${D}${systemd_system_unitdir}/weston.service
>  	fi
>  
> +	# Export the WAYLAND_DISPLAY in case it is using the global socket
> +	install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
> +
>  	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
>  		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
>  	fi
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
> index 01670cd4f5..7b898bb436 100755
> --- a/meta/recipes-graphics/wayland/weston-init/weston-start
> +++ b/meta/recipes-graphics/wayland/weston-init/weston-start
> @@ -68,4 +68,8 @@ if test -z "$XDG_RUNTIME_DIR"; then
>  	fi
>  fi
>  
> -su -c "XDG_RUNTIME_DIR=/run/user/`id -u ${WESTON_USER}` weston $weston_args --log=/tmp/weston.log" $WESTON_USER
> +if [ -z "$WAYLAND_DISPLAY" ]; then
> +	WAYLAND_DISPLAY=/run/wayland-0
> +fi
> +
> +su -c "XDG_RUNTIME_DIR=/run/user/`id -u ${WESTON_USER}` weston $weston_args --socket=$WAYLAND_DISPLAY --log=/tmp/weston.log" $WESTON_USER
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185541): https://lists.openembedded.org/g/openembedded-core/message/185541
> Mute This Topic: https://lists.openembedded.org/mt/100553774/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

