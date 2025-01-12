Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDFBE77188
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 14:23:23 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.36430.1736691799235185200
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 06:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ekHXOcfn;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.180, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e39779a268bso5158927276.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 06:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736691798; x=1737296598; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXoGBqAnU2ERshwqRofUrw6IQzRwRTqjqksmD0hcvPg=;
        b=ekHXOcfnJE6iSTsbwli4sK2xUR32bXEgYTbJe4TV+HStjwlNavEPT30WXqIp7MIO8Z
         PIlQ0IM6MGw110xMfuegPt2SM2YGP++ApIKKpBxzfZUWBlzeIhYoPVRtsFFaZskjoGel
         hvQSZKp91YN4vkSP7wOBNPT56cJIiRDgFgON3cZW22HNq8d1gu/XhNYiyLbvc54TSUrt
         fTuH87KgNThUvvQ9Wgt0XpUwpHSv2SIjg+bnWCbgpn45VSDcGZSULruSX5ewfL5SJoEZ
         kdnecpxPW3VWdYXiKdGuS221JhD4ssd0zKK8XN0VIbJczjFF8Os4almlRD/8ikJQ4/zT
         /gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736691798; x=1737296598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXoGBqAnU2ERshwqRofUrw6IQzRwRTqjqksmD0hcvPg=;
        b=Nir/X7m9OwQJ04gd9IjG1enTsQ0+NPwpSyfLh6rLPUXJjJRvU1QRqNFUSr8vZ8bQAZ
         kxjZp86LyKaom6CuqMxzb01RuKtnT24olZRI9y9eX4cYyZTLZozn7Q5ZSGutZpYU3OG2
         tgDsrwBt3obSB/cquZX+2AofVihlrV9fGl+ifcCdRH43OOB4e05gMmbqLAJLuM7+B9aX
         oV2kXk7f6yZ/a+qDEnHH/KvERUnKVhbtsLMFxH3ud4fLqMBlpQxkn8fPvk7BEhFubO8d
         hKV4j1oet0GQO4ThnQ7ZYEtaU1k3DuFn2Xb+cgcQ1t7xvWApr/aDbCgASmEY6WTkjY4r
         bx7A==
X-Gm-Message-State: AOJu0YxwW43uv8O+FAmLGFp8Iz9ZCiT8mYhoKTVGoKIQo4o/d+vw9JeG
	TtJRKJj+/akJasro8N4b3yW3IgdlAB/A8t5+7E7p1zAUT4XYBRCR210dZw+OQZdhXlXh6iaSjLh
	H7Ty6jvs/4PwVI7WycX+IPu8VXcWTlwP4p9ouWQ==
X-Gm-Gg: ASbGncttI7uctiPHpTltxvp7xLtb2hZNUDM4GkF6Zi2Bbook20rc3K/kpwuPdAtYRQH
	ppL6I8G63QSF82FuDyCurBMDd7sSuReENEGSyHA==
X-Google-Smtp-Source: AGHT+IH9BCl97I/RUy7iOmDakBNi5uhSO/a3cGUMMswD9XYLBK1eoaDiWU6IMgl3iUy9UTbvcUbQszpbCpZ0rkWr78I=
X-Received: by 2002:a05:6902:1690:b0:e39:8992:57c8 with SMTP id
 3f1490d57ef6-e573a74f596mr3557064276.18.1736691798348; Sun, 12 Jan 2025
 06:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20250108110844.3849307-1-catalin.popescu@leica-geosystems.com>
In-Reply-To: <20250108110844.3849307-1-catalin.popescu@leica-geosystems.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 12 Jan 2025 06:23:07 -0800
X-Gm-Features: AbW1kvZNCswAfagN8rGmTQH9Bpjg0mZITOBw1zraTZYPZ76SYM6r8nIWnWBv1TQ
Message-ID: <CAOSpxda7RYcaEf-i_=iKuFiEPun6D-xjm7HOc0s+Dc3jdZu-Uw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] bluez5: backport configuration file
 shipping from 5.73 to 5.72
To: catalin.popescu@leica-geosystems.com
Cc: openembedded-core@lists.openembedded.org, 
	bsp-development.geo@leica-geosystems.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 14:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209684

This is causing failures in autobuilder testing:

https://errors.yoctoproject.org/Errors/Details/840027/

In particular:

rm: cannot remove
'TOPDIR/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testimage-sdk/sy=
sroots/core2-64-poky-linux/etc/bluetooth/input.conf':
Permission denied
rm: cannot remove
'TOPDIR/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testimage-sdk/sy=
sroots/core2-64-poky-linux/etc/bluetooth/network.conf':
Permission denied
rm: cannot remove
'TOPDIR/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testimage-sdk/sy=
sroots/core2-64-poky-linux/etc/bluetooth/main.conf':
Permission denied

Steve

On Wed, Jan 8, 2025 at 3:09=E2=80=AFAM Catalin Popescu via
lists.openembedded.org
<catalin.popescu=3Dleica-geosystems.com@lists.openembedded.org> wrote:
>
> Commit 49391fdcf71b32c5fd3c7b134c1d1c45cc1db388 removed the shipping of
> configuration files from install task too early. The configuration files
> shipping has been added to bluez5 5.73 whereas scarthgap is on older
> version 5.72. To address this issue backport the patch from 5.73 to 5.72
> and add it to the bluez5 recipe.
>
> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  ...l-config-files-with-enable-datafiles.patch | 61 +++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-build-sh=
ip-all-config-files-with-enable-datafiles.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index 3f2f096aac..d7283fba00 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -54,6 +54,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file:=
//0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
>             file://0001-tests-add-a-target-for-building-tests-without-run=
nin.patch \
>             file://0001-test-gatt-Fix-hung-issue.patch \
> +           file://0001-build-ship-all-config-files-with-enable-datafiles=
.patch \
>             "
>  S =3D "${WORKDIR}/bluez-${PV}"
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-build-ship-all-=
config-files-with-enable-datafiles.patch b/meta/recipes-connectivity/bluez5=
/bluez5/0001-build-ship-all-config-files-with-enable-datafiles.patch
> new file mode 100644
> index 0000000000..6e10674bf9
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-build-ship-all-config-=
files-with-enable-datafiles.patch
> @@ -0,0 +1,61 @@
> +From be0e796299b0e7a73bf06c5655b56180588550b0 Mon Sep 17 00:00:00 2001
> +From: Emil Velikov <emil.velikov@collabora.com>
> +Date: Mon, 12 Feb 2024 20:02:44 +0000
> +Subject: [PATCH] build: ship all config files with --enable-datafiles
> +
> +Currently we ship only the dbus/systemd policy files and omit the other
> +four - /etc/bluetooth/{main,mesh-main,input,network}.conf.
> +
> +Outside of those files, there is no documentation what the defaults are
> +and the other possible options. A number of distributions (Arch, Gentoo,
> +Fedora) have opted to manually copy those into the package. Alas this
> +does not scale and leaves other distros at disadvantage, in a sense.
> +
> +Note: we need a custom install target to ensure confdir and statedir
> +have the correct permissions.
> +
> +Upstream-Status: Backport [5.73]
> +Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> +---
> + Makefile.am   | 8 +++++++-
> + Makefile.mesh | 1 +
> + 2 files changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 2b1b9acdf..2cbfed2db 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -31,11 +31,17 @@ AM_LDFLAGS =3D $(MISC_LDFLAGS)
> + confdir =3D $(sysconfdir)/bluetooth
> + statedir =3D $(localstatedir)/lib/bluetooth
> +
> ++install-data-hook:
> ++      install -dm555 $(DESTDIR)$(confdir)
> ++      install -dm700 $(DESTDIR)$(statedir)
> ++
> + if DATAFILES
> + dbusdir =3D $(DBUS_CONFDIR)/dbus-1/system.d
> + dbus_DATA =3D src/bluetooth.conf
> +
> +-conf_DATA =3D
> ++conf_DATA =3D src/main.conf
> ++conf_DATA +=3D profiles/input/input.conf
> ++conf_DATA +=3D profiles/network/network.conf
> + state_DATA =3D
> + endif
> +
> +diff --git a/Makefile.mesh b/Makefile.mesh
> +index ea50383d2..e4c9fa6a3 100644
> +--- a/Makefile.mesh
> ++++ b/Makefile.mesh
> +@@ -3,6 +3,7 @@ if MESH
> +
> + if DATAFILES
> + dbus_DATA +=3D mesh/bluetooth-mesh.conf
> ++conf_DATA +=3D mesh/mesh-main.conf
> + endif
> +
> + if SYSTEMD
> +--
> +2.34.1
> +
>
> base-commit: 01423828248b75e1f5afe2e5959ccd971df875cd
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209552): https://lists.openembedded.org/g/openembedde=
d-core/message/209552
> Mute This Topic: https://lists.openembedded.org/mt/110494576/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

