Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BF2C54E71
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 18:39:01 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.23896.1710873537165352279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 11:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U9DNKNYH;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33e17342ea7so3013812f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 11:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710873535; x=1711478335; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhVdZylaOHlm8pFqHY+yXv5ZEJKCdNg4Ksv0alT716o=;
        b=U9DNKNYHQZXz3K4sd3CK+Ch2VOzS3/TGVMunrouRIjeUfkxGYqRbwD31l3Eshlb59v
         vQKvy2yXlSDJOllcpIMrySqq6oh4oSlFOokEKbYNCYRyX29gncxocW2gwEikJnhiAjK5
         28oQqZEhw/KTEm23f6Zf95JlcDty9oAg6noH69+0G7CYsGXy8z/ytR3HcNweaMQA2Dw1
         S3nyk+1uuOuJWTZbXwUl8OdoDXoTwxxp0ioHQCk3QajWCnXnMRr3dmvqn1EIlFHcSLiu
         PGUd3pfdN4ae8IN2U1ZCgKfwUj8k3J/MU/uaCwJHGk1QlzRsBtL7UddYcR0JgFHJyzIr
         /Sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710873535; x=1711478335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhVdZylaOHlm8pFqHY+yXv5ZEJKCdNg4Ksv0alT716o=;
        b=bur5pjHpCi/7O0nXzBzK90mWxOzPPP7F4UwOmx0MuVuTJDaI3aIgVXZveKZxT4DT4o
         djodPXnhTzN/EqgDy9sFcVLsGUcjdQwK2dkEjjZLNA5il1FkBbaI0AogAlscb6qyRCmU
         wS7d95Gt/Lgpof9XH2kt38B7RMFWZKXnEON8Qoa4bIFrKldoMF4OJt30IvUB+UjlloNJ
         Sm2J8HXwNsRwDb7A1rKpcq9QsriemPSpumj4VMZvAlecAkG7ofgY8jARAm86xRlWwX5t
         QH0ZBd/AD2Kvt/cXZWuiqjFwEFCfJyPKUYEzkjcInopkJ0/DXWeBmukvej/en7b8RmyQ
         5GnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4cpK9BEekC5f5BQHhKqG65nbNhPRdy2fnGkArSrGcqiXCrehYC0NlwjS4Ogw4KImexxl5DbTnGF2BlqXs4n+2D02QJE4zbxABGZXKj8dyggSfm1mvJ3LM
X-Gm-Message-State: AOJu0YwaQdApoPcCyHgXwgR2DJ4Pu3jeHPpQs8EmzRfkTsyZIyVDKRWq
	OQSZ7r0j3/urJU59i4N1F8GinExkcESncWvUsmd+UaO6wzDKVtv4Um0WU1fRfBluHr8ScSZsloG
	GhQEzKtc54xT8RPYHwC07+shr714=
X-Google-Smtp-Source: AGHT+IFRostKWt9gYvjRPcZ6GdU/hN2nxYFLpErkGTj26+59kHAoZ79201Ic7uwiwaE19SXdqwHcUaTBBoM68rMsZLE=
X-Received: by 2002:adf:e94a:0:b0:33e:38f1:77f6 with SMTP id
 m10-20020adfe94a000000b0033e38f177f6mr9969246wrn.39.1710873534976; Tue, 19
 Mar 2024 11:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240319161026.2900153-1-daniel.ottiger@schindler.com>
 <CANNYZj-yPRWBUL8tOoUudWEV0w+067Eb6vJKBV1e1nZmVzaHWQ@mail.gmail.com>
 <AM0PR01MB6514572B842524D5F2C7DE73862C2@AM0PR01MB6514.eurprd01.prod.exchangelabs.com>
 <CANNYZj_MC05-jd5=3jB5DUxzx=XkupN05mbZ6P1PE43LJf44+A@mail.gmail.com> <AM0PR01MB65148EFD114484DC62231CFF862C2@AM0PR01MB6514.eurprd01.prod.exchangelabs.com>
In-Reply-To: <AM0PR01MB65148EFD114484DC62231CFF862C2@AM0PR01MB6514.eurprd01.prod.exchangelabs.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Mar 2024 19:38:43 +0100
Message-ID: <CA+chaQdvWO-_DQH1ce=fZZFOPu+fbBzNGr6L3g0ii7VvEAms3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pulseaudio: replace "pulseaudio-" with "${PN}-"
To: daniel.ottiger@schindler.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 18:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197329

On Tue, Mar 19, 2024 at 6:11=E2=80=AFPM Daniel Ottiger via
lists.openembedded.org
<daniel.ottiger=3Dschindler.com@lists.openembedded.org> wrote:
>
> Sure I try as good as I can:
>
> pulseaudio is part of my DISTRO_FEATURES, therefore "libao" depends on pu=
lseaudio.
>
> As far as I understand that is because in
> meta-openembedded/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
> I find this lines:
>
> PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudi=
o', d)}"
> PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> PACKAGECONFIG[pulseaudio] =3D "--enable-pulse,--disable-pulse,pulseaudio"
>
> In addition vorbis-tools depends on libao, because in
> meta-openembedded/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-=
tools_1.4.2.bb
> I find this lines:
>
> PACKAGECONFIG ??=3D "flac ogg123"
> PACKAGECONFIG[flac] =3D ",--without-flac,flac,libflac"
> PACKAGECONFIG[speex] =3D ",--without-speex,speex,speex"
> PACKAGECONFIG[ogg123] =3D "--enable-ogg123,--disable-ogg123,libao curl"
>
> Therefore if I would like to build
> vorbis-tools-native it requires libao-native which then requires pulseaud=
io-native, at least in my case.
>
> Since I do not know those projects (vorbis-tools, libao) well enough, I c=
annot tell if this dependencies are really required or not.

See:
https://github.com/xiph/libao/blob/master/configure.ac#L448
it's possible to build libao without the output plugin for pulseaudio.

> Of course I would be happy if I can work without pulseaudio for this.
> One solution might be to remove it from my DISTRO_FEATURES, but I cannot =
see how I can do this when I need it on my target.
>
> This is based on this commit of meta-openembedded repository:
>
> commit a8310f7f31acdf273a3f51a75c74cc957375426e (HEAD -> scarthgap, yocto=
project/scarthgap, yoctoproject/master)
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Sat Mar 16 19:52:58 2024 -0700
>
>     layer.conf: Prepare for release, drop nanbield LAYERSERIES
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Thanks a lot for looking into this.
> Daniel
>
>
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: 19 March 2024 17:38
> To: Daniel Ottiger <daniel.ottiger@schindler.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: Re: [EXTERNAL] Re: [OE-core] [PATCH] pulseaudio: replace "pulsea=
udio-" with "${PN}-"
>
> Please dig a little deeper, and inspect the recipes for vorbis tools and =
libao and their respective source trees. I=E2=80=99m just saying that conve=
rting compressed audio files shouldn=E2=80=99t be requiring a sound server =
and it would be good to understand why it does.
>
> Alex
>
> On Tue 19. Mar 2024 at 17.30, Daniel Ottiger <daniel.ottiger@schindler.co=
m> wrote:
>
> If I remove my bbappend file for enabling native compilation, and I try t=
o build "vorbis-tools-native" I get the following error:
>
> bitbake vorbis-tools-native
> Parsing recipes: 100% |##################################################=
###########################################################################=
################################################| Time: 0:00:05
> Parsing of 3691 .bb files complete (0 cached, 3691 parsed). 5918 targets,=
 1137 skipped, 0 masked, 0 errors.
> Removing 1 recipes from the x86_64 sysroot: 100% |#######################=
###########################################################################=
################################################| Time: 0:00:00
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'pulseaudio-native' (but virtual:native:/home/ott=
igeda/workspace/yocto-builder-scarthgap/meta-openembedded/meta-multimedia/r=
ecipes-multimedia/libao/libao_1.2.0.bb DEPENDS on or otherwise requires it)=
. Close matches:
>   pseudo-native
>   pulseaudio
>   usbredir-native
>
> In case this is important, I also have meta-openembedded layer (https://g=
ithub.com/openembedded/meta-openembedded) added.
> Maybe the dependency is from there ?
>
> Daniel
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: 19 March 2024 17:14
> To: Daniel Ottiger <daniel.ottiger@schindler.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: [EXTERNAL] Re: [OE-core] [PATCH] pulseaudio: replace "pulseaudio=
-" with "${PN}-"
>
> Wait, what do vorbis tools need pulseaudio for? It=E2=80=99s an odd depen=
dency, can you check?
>
> Alex
>
> On Tue 19. Mar 2024 at 17.10, Daniel Ottiger via lists.openembedded.org <=
daniel.ottiger=3Dschindler.com@lists.openembedded.org> wrote:
>
> avoid preferred provider warnings when compiling pulseaudio natively.
>
> Enabling native compilation was done in a separate bbappend file for puls=
eadio:
> ----
> BBCLASSEXTEND +=3D "native"
> ----
>
> pulseaudio is a dependency of vorbis-tools,
> from which we like to use the native version of oggenc
> in order to convert wav to ogg files as part of the yocto build.
>
> Signed-off-by: Daniel Ottiger <daniel.ottiger@schindler.com>
> ---
>  .../pulseaudio/pulseaudio.inc                 | 78 +++++++++----------
>  1 file changed, 39 insertions(+), 39 deletions(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
> index ae16056d243..85515b3581f 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -145,9 +145,9 @@ do_install:append() {
>         install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/=
default/volatiles/04_pulse
>  }
>
> -USERADD_PACKAGES =3D "pulseaudio-server"
> -GROUPADD_PARAM:pulseaudio-server =3D "--system pulse"
> -USERADD_PARAM:pulseaudio-server =3D "--system --home /var/run/pulse \
> +USERADD_PACKAGES =3D "${PN}-server"
> +GROUPADD_PARAM:${PN}-server =3D "--system pulse"
> +USERADD_PARAM:${PN}-server =3D "--system --home /var/run/pulse \
>                                --no-create-home --shell /bin/false \
>                                --groups audio,pulse --gid pulse pulse"
>
> @@ -166,12 +166,12 @@ PACKAGES =3D+ "\
>  # RDEPENDS we define for it in this recipe, and thereby ensure that when
>  # adding the console-kit module to an image, we also get the necessary
>  # consolekit package produced.
> -PACKAGES =3D+ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'pulseaudio=
-module-console-kit', '', d)}"
> +PACKAGES =3D+ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN}-modu=
le-console-kit', '', d)}"
>
>  #upgrade path:
> -RREPLACES:pulseaudio-server =3D "libpulse-bin libpulse-conf"
> +RREPLACES:${PN}-server =3D "libpulse-bin libpulse-conf"
>
> -PACKAGES_DYNAMIC +=3D "^pulseaudio-lib-.* ^pulseaudio-module-.*"
> +PACKAGES_DYNAMIC +=3D "^${PN}-lib-.* ^${PN}-module-.*"
>
>  FILES:libpulsecore =3D "${libdir}/pulseaudio/libpulsecore*.so"
>  FILES:libpulsecommon =3D "${libdir}/pulseaudio/libpulsecommon*.so"
> @@ -200,7 +200,7 @@ ALLOW_EMPTY:${PN} =3D "1"
>
>  CONFFILES:libpulse =3D "${sysconfdir}/pulse/client.conf"
>
> -CONFFILES:pulseaudio-server =3D "\
> +CONFFILES:${PN}-server =3D "\
>    ${sysconfdir}/pulse/default.pa \
>    ${sysconfdir}/pulse/daemon.conf \
>    ${sysconfdir}/pulse/system.pa \
> @@ -228,38 +228,38 @@ RDEPENDS:${PN}-pa-info =3D "\
>                            ${PN}-server \
>                            "
>
> -RDEPENDS:pulseaudio-server =3D " \
> -    pulseaudio-module-filter-apply \
> -    pulseaudio-module-filter-heuristics \
> -    pulseaudio-module-udev-detect \
> -    pulseaudio-module-null-sink \
> -    pulseaudio-module-device-restore \
> -    pulseaudio-module-stream-restore \
> -    pulseaudio-module-card-restore \
> -    pulseaudio-module-augment-properties \
> -    pulseaudio-module-detect \
> -    pulseaudio-module-alsa-sink \
> -    pulseaudio-module-alsa-source \
> -    pulseaudio-module-alsa-card \
> -    pulseaudio-module-native-protocol-unix \
> -    pulseaudio-module-default-device-restore \
> -    pulseaudio-module-intended-roles \
> -    pulseaudio-module-rescue-streams \
> -    pulseaudio-module-always-sink \
> -    pulseaudio-module-suspend-on-idle \
> -    pulseaudio-module-position-event-sounds \
> -    pulseaudio-module-role-cork \
> -    pulseaudio-module-switch-on-port-available"
> +RDEPENDS:${PN}-server =3D " \
> +    ${PN}-module-filter-apply \
> +    ${PN}-module-filter-heuristics \
> +    ${PN}-module-udev-detect \
> +    ${PN}-module-null-sink \
> +    ${PN}-module-device-restore \
> +    ${PN}-module-stream-restore \
> +    ${PN}-module-card-restore \
> +    ${PN}-module-augment-properties \
> +    ${PN}-module-detect \
> +    ${PN}-module-alsa-sink \
> +    ${PN}-module-alsa-source \
> +    ${PN}-module-alsa-card \
> +    ${PN}-module-native-protocol-unix \
> +    ${PN}-module-default-device-restore \
> +    ${PN}-module-intended-roles \
> +    ${PN}-module-rescue-streams \
> +    ${PN}-module-always-sink \
> +    ${PN}-module-suspend-on-idle \
> +    ${PN}-module-position-event-sounds \
> +    ${PN}-module-role-cork \
> +    ${PN}-module-switch-on-port-available"
>
>  # If the server is installed, it's usually desirable to make ALSA applic=
ations
>  # use PulseAudio. alsa-plugins-pulseaudio-conf will install the configur=
ation
>  # that makes the PulseAudio plugin the default ALSA device.
> -RDEPENDS:pulseaudio-server +=3D "${@bb.utils.contains('DISTRO_FEATURES',=
 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
> +RDEPENDS:${PN}-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pul=
seaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
>
>  # pulseaudio-module-console-kit is built whenever dbus is enabled by PAC=
KAGECONFIG
>  # but consolekit depends on libx11 and is available only for DISTRO with=
 x11 in DISTRO_FEATURES
> -RDEPENDS:pulseaudio-module-console-kit =3D+ "${@bb.utils.contains('DISTR=
O_FEATURES', 'sysvinit x11', 'consolekit', '', d)}"
> -RDEPENDS:pulseaudio-misc +=3D "pulseaudio-module-cli-protocol-unix"
> +RDEPENDS:${PN}-module-console-kit =3D+ "${@bb.utils.contains('DISTRO_FEA=
TURES', 'sysvinit x11', 'consolekit', '', d)}"
> +RDEPENDS:${PN}-misc +=3D "${PN}-module-cli-protocol-unix"
>
>  FILES:${PN}-module-alsa-card +=3D "${datadir}/pulseaudio/alsa-mixer"
>
> @@ -270,14 +270,14 @@ FILES:${PN}-module-gsettings +=3D "${libexecdir}/pu=
lse/gsettings-helper ${datadir}
>  # running for the duration of the user login session). The device-manage=
r and
>  # x11-* modules are referenced from the start-pulseaudio-x11 script, so =
those
>  # modules must be installed when X11 is enabled.
> -RDEPENDS:pulseaudio-server +=3D "\
> +RDEPENDS:${PN}-server +=3D "\
>          ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '\
> -                pulseaudio-module-device-manager \
> -                pulseaudio-module-x11-cork-request \
> -                pulseaudio-module-x11-publish \
> -                pulseaudio-module-x11-xsmp \
> +                ${PN}-module-device-manager \
> +                ${PN}-module-x11-cork-request \
> +                ${PN}-module-x11-publish \
> +                ${PN}-module-x11-xsmp \
>          ', '', d)}"
>
> -RDEPENDS:pulseaudio-server +=3D "${@bb.utils.contains('DISTRO_FEATURES',=
 'x11', \
> -                                  bb.utils.contains('DISTRO_FEATURES', '=
systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit=
', d), \
> +RDEPENDS:${PN}-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11=
', \
> +                                  bb.utils.contains('DISTRO_FEATURES', '=
systemd', '${PN}-module-systemd-login', '${PN}-module-console-kit', d), \
>                                    '', d)}"
> --
> 2.39.2
>
>
> *****************************************************************
> The information contained in this message is intended only for use of the=
 individual(s) named above and may contain confidential, proprietary or leg=
ally privileged information. No confidentiality or privilege is waived or l=
ost by any mistransmission. If you are not the intended recipient of this m=
essage you are hereby notified that you must not use, disseminate, copy it =
in any form or take any action in reliance of it. If you have received this=
 message in error please delete it and any copies of it and notify the send=
er immediately.
> *****************************************************************
>
>
>
>
> *****************************************************************
> The information contained in this message is intended only for use of the=
 individual(s) named above and may contain confidential, proprietary or leg=
ally privileged information. No confidentiality or privilege is waived or l=
ost by any mistransmission. If you are not the intended recipient of this m=
essage you are hereby notified that you must not use, disseminate, copy it =
in any form or take any action in reliance of it. If you have received this=
 message in error please delete it and any copies of it and notify the send=
er immediately.
> *****************************************************************
>
>
> *****************************************************************
> The information contained in this message is intended only for use of the=
 individual(s) named above and may contain confidential, proprietary or leg=
ally privileged information. No confidentiality or privilege is waived or l=
ost by any mistransmission. If you are not the intended recipient of this m=
essage you are hereby notified that you must not use, disseminate, copy it =
in any form or take any action in reliance of it. If you have received this=
 message in error please delete it and any copies of it and notify the send=
er immediately.
> *****************************************************************
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197328): https://lists.openembedded.org/g/openembedde=
d-core/message/197328
> Mute This Topic: https://lists.openembedded.org/mt/105026949/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

