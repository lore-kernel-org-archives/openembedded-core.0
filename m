Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E159DE81DF8
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 13:16:49 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.12433.1696598208746801817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 06:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=VFNEhYmv;
 spf=pass (domain: baylibre.com, ip: 209.85.208.42, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5363227cc80so3500592a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696598207; x=1697203007; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=em39TqVMOQ+Tq+Jkyd/9TcB3rSmuBzyrPGuCSyzh3Rc=;
        b=VFNEhYmvOw+m2Y8ODOBGqL41pJduok6mZNFal8TGYjP89hKcj61cl6cBsTxFg/7/Fg
         bTqtAl0gsuicUXqC8+Ca7rI7/6KktzAaIXTsT5JLhr5sTpUhaK8f02x/Ko5qkMeke4PA
         gemh9icxSRkK5eymRM/HpLinQt+JgiZO/Axc2+4C2Xe6DWJSIvWjUe+MWK9Tb80ldMGG
         A2zjUKyZkrBQVsw2FYZb+gmrwWvNd/N8hN0OfowxvNUA6B2dDa91KPx1tfrZMyQB20tx
         S1sfoNM3CRIFmySMuKVtMO8QNJj4vI7zLfRZRFJexBQo4zGL1VIDAjOezkbLKC/uRYm3
         T/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696598207; x=1697203007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=em39TqVMOQ+Tq+Jkyd/9TcB3rSmuBzyrPGuCSyzh3Rc=;
        b=hZLLMuvCt4qUNO9fLyLSn1bxUFjjgrVjPeLjBJ9/dPs01r0th2OlEjlSMnDw9MDKOc
         0mEa4lexwTTJZ3DSTHhaFm3qrom1N+Ym15z4+LAYRdlZW/xDazC9tW7YcMpM6anOncEQ
         DzMsn7R1mghTnGjoFrlY3GjrF2DiVsFvCGHSIbPVhdD173XgrL+Oj3CMgNtnP+hnIla0
         fxshtbaSMAN0wLiq0VyycrOb9cuaFHS882qQVj7D9HJZExFTRJUkmts6H2j0LiDTgT19
         /fMo9pOBtN9+UevtpdxDsyANuPPt51ad9/pV0HEl2ZWYkKpeCwPo+Blur4PrQXymq5LY
         o4nw==
X-Gm-Message-State: AOJu0YydmISlr5ShyWlzQcLBAdUN6I5QxGwPe2lOtYXQSmcRpS4/yJHB
	TYMgss231aSVRuP0fY1d9iXkIlrXbzE1kHtVrienJA==
X-Google-Smtp-Source: AGHT+IFdkUshdJo46IHOYuqEYzT2GFr2ITpbtGSMLFhw7CSlJ0dAV+SJ1wijfwDDbD5X2megzE2pMiPHtyvcc3rFH/A=
X-Received: by 2002:aa7:cfda:0:b0:530:c386:b277 with SMTP id
 r26-20020aa7cfda000000b00530c386b277mr7079713edy.7.1696598207114; Fri, 06 Oct
 2023 06:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231005-sysusers3-v2-1-938c9cca79b7@syslinbit.com>
In-Reply-To: <20231005-sysusers3-v2-1-938c9cca79b7@syslinbit.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 6 Oct 2023 15:16:35 +0200
Message-ID: <CAEHHSvZeXCv9HesBsfy4dC2GQ9K2t+aYJRui_3WyqLmqH3GERw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] systemd: sysusersd: change how the root home
 directory is set
To: Louis Rannou <louis.rannou@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com, 
	Qi.Chen@windriver.com, Louis Rannou <lrannou@baylibre.com>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 13:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188766

Le jeu. 5 oct. 2023 =C3=A0 22:55, Louis Rannou <louis.rannou@syslinbit.com>=
 a =C3=A9crit :
>
> From: Louis Rannou <lrannou@baylibre.com>
>
> Modifying the sources brings troubles in the devtool command. Therefore i=
t is
> better to patch the source with a custom variable, and later replace it w=
ith the
> correct root path.
>
> Suggestion from :
> <https://lore.kernel.org/all/DB5PR02MB102137939DE6D43E423A9D296EF03A@DB5P=
R02MB10213.eurprd02.prod.outlook.com/>
>
> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
> ---
>  ...usersd-Change-the-user-root-s-home-direct.patch | 31 ++++++++++++++++=
++++++
>  meta/recipes-core/systemd/systemd_254.4.bb         | 11 ++++----
>  2 files changed, 37 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-=
user-root-s-home-direct.patch b/meta/recipes-core/systemd/systemd/0029-sysu=
sersd-Change-the-user-root-s-home-direct.patch
> new file mode 100644
> index 0000000000..dd0d96d11b
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user-ro=
ot-s-home-direct.patch
> @@ -0,0 +1,31 @@
> +From bf97001978cdefad644f7b4b909f281368e5a4dd Mon Sep 17 00:00:00 2001
> +From: Kas User <kas@example.com>

Hi Louis,

Is this intended to have kas user and email address instead of yours?

> +Date: Thu, 27 Jul 2023 08:23:06 +0000
> +Subject: [PATCH] sysusers.d: Change the user root's home directory
> +
> +The default sysusers basic.conf.in file sets the root home directory to =
`/root`
> +and does not permit its configuration. Change this to `:ROOT_HOME:` whic=
h must
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
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-co=
re/systemd/systemd_254.4.bb
> index 77724eb822..3adf62935d 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES +=3D "systemd"
>  SRC_URI +=3D " \
>             file://touchscreen.rules \
>             file://00-create-volatile.conf \
> -           file://basic.conf.in \

If this file is not needed anymore you should probably delete it with
this commit

Cheers
Julien

>             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallb=
ack', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
>             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallb=
ack', 'file://00-hostnamed-network-user.conf', '', d)} \
>             file://init \
> @@ -30,6 +29,7 @@ SRC_URI +=3D " \
>             file://0002-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
>             file://0008-implment-systemd-sysv-install-for-OE.patch \
>             file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-=
to-.patch \
> +           file://0029-sysusersd-Change-the-user-root-s-home-direct.patc=
h \
>             "
>
>  # patches needed by musl
> @@ -260,10 +260,6 @@ EXTRA_OEMESON +=3D "-Dkexec-path=3D${sbindir}/kexec =
\
>  # The 60 seconds is watchdog's default vaule.
>  WATCHDOG_TIMEOUT ??=3D "60"
>
> -do_configure:prepend() {
> -  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in > ${S}/sysus=
ers.d/basic.conf.in
> -}
> -
>  do_install() {
>         meson_do_install
>         install -d ${D}/${base_sbindir}
> @@ -375,6 +371,11 @@ do_install() {
>          sed -i -e 's/#RebootWatchdogSec=3D10min/RebootWatchdogSec=3D${WA=
TCHDOG_TIMEOUT}/' \
>              ${D}/${sysconfdir}/systemd/system.conf
>      fi
> +
> +       # The root home directory specified in sysusers.d/ was patched to
> +       # `:ROOT_HOME:`. Change now to the correct path given by ${ROOT_H=
OME}.
> +       [ ! -f ${D}${libdir}/sysusers.d/basic.conf ] ||
> +               sed -i s@:ROOT_HOME:@${ROOT_HOME}@g ${D}${libdir}/sysuser=
s.d/basic.conf
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188739): https://lists.openembedded.org/g/openembedde=
d-core/message/188739
> Mute This Topic: https://lists.openembedded.org/mt/101785446/4356723
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [js=
tephan@baylibre.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

