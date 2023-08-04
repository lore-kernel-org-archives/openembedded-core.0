Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E82C001DB
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 23:54:51 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.2920.1691193283026795941
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 16:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=n+CBfQky;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-56ca1eebcd7so1792491eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 16:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691193282; x=1691798082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkT6T3seTwHNhqgb/rxbALjWDxZIjVXArbOh4M7OmMs=;
        b=n+CBfQky2jr9qa17pDYUg8sfpBVCiDXuxobizIOEOr6bX45cs2NAUL7jBEMTCYwtAR
         FgK3w74kuqbOWL7sanqFFwz3vlnTcmdbYe2gL0SiELooboaeWJvvZW05yYWSUh7zndr9
         OyR3HSVByTGEieBfTPcZhwDXwmf/lt86S5WGcIN6910ncVQhF7XW0xGK+2Pv7s44fsnI
         fsGce0BaFrMf6UC33E59bB3cRMoDewyXHLjTyPkYV8AZtpOPvRsITnofjbBUXQ+5B7Gn
         2XW9y0zhCGEaJ/GljSUpAth3B3WlljBplnDssvjpJBf3fGoHOEwCQ845puzDCqybjZlJ
         GzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691193282; x=1691798082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkT6T3seTwHNhqgb/rxbALjWDxZIjVXArbOh4M7OmMs=;
        b=GcDX0P2TM0MJOOpIlB5wjD4EapohFSL5aFYCUw6kBRhQodXf0S5xfcb0Wz4+pG0kCS
         bHRO3EUK/mg3Pa+VIQD6FhIo+EOR5IZEsdKl0CHOGawIXgOWZ6k5zZOoXQ5Ojj17Y6pO
         lWENtbx30WzEop0YHOpaAc94mRDCb5xwYmMWQHTDVA8di9l6UIktr1m23yH6ZfHQmJxd
         haNBC6MhLJB5vi3JqqJu4mr7IRwrQUJwX55OzK21X6oy9Yi/3Gm7B7YnuDTlXvyqb1ik
         UktanU47Qm/2MJrLotGYFuHO373vzqPvfYvK9hIQjYqw7hqpXPoQze8z/0kc8pglY33T
         Tg1A==
X-Gm-Message-State: AOJu0Yzi9vwdepq5YaLN/IVGzx4qU7T8I+3caRDLZ1L6VUej+gOYhMcl
	qzdDrkNnWBanbaD8WrW17MuwfDdqCKu2gwM/y74=
X-Google-Smtp-Source: AGHT+IGsokm/miue3JGeMI76qjXiQKE3G3GHEGAyzunWOF5L0Wuv2VN4ciyV+HJAU42RfA/AuDk6GDfHAzzbWLfMhJo=
X-Received: by 2002:a4a:2750:0:b0:56c:cc05:c053 with SMTP id
 w16-20020a4a2750000000b0056ccc05c053mr3253721oow.5.1691193282160; Fri, 04 Aug
 2023 16:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230804200438.1651568-1-otavio@ossystems.com.br> <20230804200438.1651568-3-otavio@ossystems.com.br>
In-Reply-To: <20230804200438.1651568-3-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Aug 2023 16:54:15 -0700
Message-ID: <CAMKF1spzbc6GFMxX+21Zn0RZ=f0pauNKKPBbLZjA4XSQ7eNOVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] weston-init: mimic systemd behavior when
 running in sysvinit
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org, 
	Tom Hochstein <tom.hochstein@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 23:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185545

On Fri, Aug 4, 2023 at 1:05=E2=80=AFPM Otavio Salvador <otavio@ossystems.co=
m.br> wrote:
>
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
> Fixes: 2818cbc730 ("weston-init: add profile to point users to global soc=
ket")
> Tested-by: Tom Hochstein <tom.hochstein@nxp.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/recipes-graphics/wayland/weston-init.bb           | 4 +++-
>  meta/recipes-graphics/wayland/weston-init/weston-start | 6 +++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-=
graphics/wayland/weston-init.bb
> index 024e400665..6c8dc36467 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -40,13 +40,15 @@ do_install() {
>         if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false=
',d)}; then
>                 install -D -p -m0644 ${WORKDIR}/weston.service ${D}${syst=
emd_system_unitdir}/weston.service
>                 install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${syste=
md_system_unitdir}/weston.socket
> -               install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sy=
sconfdir}/profile.d/weston-socket.sh
>                 sed -i -e s:/etc:${sysconfdir}:g \
>                         -e s:/usr/bin:${bindir}:g \
>                         -e s:/var:${localstatedir}:g \
>                         ${D}${systemd_system_unitdir}/weston.service
>         fi
>
> +       # Export the WAYLAND_DISPLAY in case it is using the global socke=
t
> +       install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconfdir=
}/profile.d/weston-socket.sh
> +
>         if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
>                 install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sy=
sconfdir}/pam.d/weston-autologin
>         fi
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/met=
a/recipes-graphics/wayland/weston-init/weston-start
> index 01670cd4f5..7b898bb436 100755
> --- a/meta/recipes-graphics/wayland/weston-init/weston-start
> +++ b/meta/recipes-graphics/wayland/weston-init/weston-start
> @@ -68,4 +68,8 @@ if test -z "$XDG_RUNTIME_DIR"; then
>         fi
>  fi
>
> -su -c "XDG_RUNTIME_DIR=3D/run/user/`id -u ${WESTON_USER}` weston $weston=
_args --log=3D/tmp/weston.log" $WESTON_USER
> +if [ -z "$WAYLAND_DISPLAY" ]; then
> +       WAYLAND_DISPLAY=3D/run/wayland-0

This can be set automatically by something like
WAYLAND_DISPLAY=3D`basename /run/user/1000/wayland-[0-9]`

That way it can cover more e.g. my variscite/imx8 SOM I have wayland-1

> +fi

=E2=89=88> +
> +su -c "XDG_RUNTIME_DIR=3D/run/user/`id -u ${WESTON_USER}` weston $weston=
_args --socket=3D$WAYLAND_DISPLAY --log=3D/tmp/weston.log" $WESTON_USER



> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185541): https://lists.openembedded.org/g/openembedde=
d-core/message/185541
> Mute This Topic: https://lists.openembedded.org/mt/100553774/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

