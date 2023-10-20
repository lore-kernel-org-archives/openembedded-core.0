Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A67CCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 16:30:50 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.58993.1697819439985730846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 09:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l6V4kA/h;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9a6190af24aso171174966b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 09:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697819438; x=1698424238; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gR2RuLpW2kihGwn3fnD1FNcJxfdlXsAQOcbf8hG8l48=;
        b=l6V4kA/hKrEoPwb83taosjVsltVtLkgZFH6HtCbpGZQ/sml28gXz19y14KAkOFqVaK
         oP3fVnkvyP6F2i1NMG+xqpNwIhlmmys+9gk4yYcLfA2Qheutp/Jpa6j7pyB+wrbGIzK2
         vL9gIgoiy/eO70Hf6MTxns3wKg/9LLHFoWSD7ZgY69O1YFGbQJJjJuy6GKcSnBChbGZ4
         sSgQ7txSHU9VQBvMIHavzEBpAAzeBXEIPUm0i4Z1JifsvRKD2vH4BUJuvTvzR8U6LllF
         ncjdkRsJ8UpI0KqLKyI+t9kUiyeuk9dJoj2ddF4H3BRvFsC8xMFfJrnjf88RewBFZ22m
         KKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819438; x=1698424238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gR2RuLpW2kihGwn3fnD1FNcJxfdlXsAQOcbf8hG8l48=;
        b=TwDEm/fW2afoeRoZwf+GHZ40NjDRXz+ImElaNulQx9678zkJDT3+7bocu2eWWfwkuK
         cpkphj0pDLNtXGwcnuw+ghEkUL7GvW+uO3x2F3DoaFnCa2h53jsIkvQLm4GVWYdY17Ws
         KczeSFyF+e5WB32nnGhlYmt3LrKw6C7Jwt033FQjD6Uyr5qVXVibcd8d7LoTJQkAkzLY
         hJWbwG9ngirSKRp5ksBj4XnNU34HGiL871ryxSZc65MWHpOkZ3EvsU1SzHxA0JSSQiAe
         WxmBVeECmNHMtz61sv65wWu3JT0NCFcdAf5J3L564hpwLoV2WnQMLVo0fDZbY9Fs/k8R
         e84A==
X-Gm-Message-State: AOJu0YxexUwpTOx1YQPPqMgrmnyosvdL3O7PvjoE0P3G5TKNCWZldsuE
	KoJnXqOUAFretzn2NEDtfDHzmUEVIj3hacNw1QhbCA==
X-Google-Smtp-Source: AGHT+IH6dj0Q3F2dJ7xJwjst6XqMTWYr/4w5XvbwNC+VCplr6Ca3MzPPzU2ap0JgzIPNEbLt5/7f0OITYDzvYo/qQwo=
X-Received: by 2002:a17:907:268b:b0:9c7:69d4:b264 with SMTP id
 bn11-20020a170907268b00b009c769d4b264mr1500922ejc.77.1697819438355; Fri, 20
 Oct 2023 09:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231019132843.2623456-1-sean@geanix.com>
In-Reply-To: <20231019132843.2623456-1-sean@geanix.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 20 Oct 2023 06:30:27 -1000
Message-ID: <CAOSpxdbvouz+syXkw7aOwCiui4qz6YUZiNPC0bJaZn2bn4xq_A@mail.gmail.com>
Subject: Re: [OE-core][mickledore][PATCH] weston: default to launcher-seatd
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org, kasper@krinvent.dk, 
	alex@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 16:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189572

On Thu, Oct 19, 2023 at 3:28=E2=80=AFAM Sean Nyekjaer <sean@geanix.com> wro=
te:
>
> Lets use the launcher-seatd as default, launcher-logind is "sometimes"
> failing to provide input events. Further more is the launcher-logind
> depricated in newer versions of weston.

Changing behaviour is typically not allowed in stable branches.

In any event, this change would need to go into the master branch
before it could be backported to stable branches. So please submit
this for the master branch!

Steve

>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  meta/recipes-graphics/wayland/weston_11.0.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston_11.0.1.bb b/meta/recipe=
s-graphics/wayland/weston_11.0.1.bb
> index 0838791a6b..09753e7c51 100644
> --- a/meta/recipes-graphics/wayland/weston_11.0.1.bb
> +++ b/meta/recipes-graphics/wayland/weston_11.0.1.bb
> @@ -37,7 +37,7 @@ PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'wayland', 'kms wayla
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland'=
, 'xwayland', '', d)} \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', =
d)} \
>                     ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland =
x11', '', 'headless', d)} \
> -                   ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager=
', 'sysvinit', 'launcher-libseat', '', d)} \
> +                   launcher-libseat \
>                     image-jpeg \
>                     screenshare \
>                     shell-desktop \
> @@ -71,7 +71,7 @@ PACKAGECONFIG[lcms] =3D "-Dcolor-management-lcms=3Dtrue=
,-Dcolor-management-lcms=3Dfals
>  # Weston with webp support
>  PACKAGECONFIG[webp] =3D "-Dimage-webp=3Dtrue,-Dimage-webp=3Dfalse,libweb=
p"
>  # Weston with systemd-login support
> -PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dlauncher-logind=3Dtrue,-D=
systemd=3Dfalse -Dlauncher-logind=3Dfalse,systemd dbus"
> +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd d=
bus"
>  # Weston with Xwayland support (requires X11 and Wayland)
>  PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse,libxcb=
 libxcursor xwayland"
>  # colord CMS support
> --
> 2.42.0
>

