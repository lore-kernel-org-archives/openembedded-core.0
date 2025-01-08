Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB8DE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 10:53:00 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.16152.1736333578217268384
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 02:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UYuzaOLb;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d8e773ad77so128190896d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 02:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736333577; x=1736938377; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1fibGdQrcVQL49czgbgt6qIkqhMaFThno+kk/B/9bWQ=;
        b=UYuzaOLbtvui4aCxnrKTFV8QbUURKB3j/HIQQ5LLqSIGlow8wFelJ9GjvSQ6YpQ1AT
         ZlUHUB/WLbw+TVLBZpkHDQwLvH6usxbJLbEfsVALcbwV6gNvXGUDzP7UFkh8pboyocwi
         E2o/bQKUXXA5nuSM85a9K/GZXO3v7rRySd4Bq7FsMlycnFewAa3tDGw6asmg7WaXKc9n
         s0iUVUm40ppBdl5x1aaUusyubTOtdg+zUsW6MLRlPFkdYXihpqIz4h9EblCw4FmpS/px
         lYTgy/4/2bcrLg6au78A2+1codKZQtuNnt/gRHWDqklNsGfvmH4RsWGHJrDW3gHzqE4S
         2M9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736333577; x=1736938377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fibGdQrcVQL49czgbgt6qIkqhMaFThno+kk/B/9bWQ=;
        b=i0s1HcB0DNJB1PC6tL/NaVwk5I05b3uQUUW6iRVbzOjZVSMW1tZmFD82HYhIDEjRy6
         twxZPbbtFtTpF/6xFTo29aBaC4Qrc1/40XROlQmu15vFrdybVeNL2B2F4whtY4IZcww5
         a8LhQMcJX4IQOZaFatXtsihQh08YMj5JN9QpF7hL44IOCrN1fGVi4w7pK9U+N2pSCDpc
         Wlkg8ayIwY3/9CwzypSCbpqnC094zhGaOBdr7LbwQ8wBlDxJtJHXTTcBkmxdxYJrdc1m
         /NLbrGRmVnx6O8awUUTbxzmCViiGZ/3/wG7vG629HEpZTfK3tNnAkxFwlOsS2Ns0sAN0
         85kw==
X-Gm-Message-State: AOJu0Yz5oo8NsT6grIHT/482Zi/yAyV1adC2Ebd8j0EuRHZMSETjm7FQ
	DL2/YZENCYgpFmQ1N3l4hKXmX52viXM8AQj1bon+OkVj5sk0kRUEuwzuahJXGEMlYRF3cHQ0ZJX
	pAJAYfOIEdaF04IDI8Wx/NvqdxQ0=
X-Gm-Gg: ASbGnctr/vSlzj3SUAx4KH8DTtHeXlo25l/eoJM2sWTZpu7i2PgxT/BlxG+VcABkoKP
	nJbmykAsv6cCo0JFvPKpmfpFCaWPKESg/P5fhKFC9xOwxyQAZJSg18palH2xf0DghkMDHUJLw
X-Google-Smtp-Source: AGHT+IHolFPMYGkDP5KfbLg9NbPaWeS+ha5ljjXJUFx+ivRuGiktPA04bM/3G8tV6uVIApyKACOcMEHF+xUNm7wAHEQ=
X-Received: by 2002:a05:6214:21eb:b0:6d8:850a:4d69 with SMTP id
 6a1803df08f44-6df9b1c9d3emr36385426d6.1.1736333577151; Wed, 08 Jan 2025
 02:52:57 -0800 (PST)
MIME-Version: 1.0
References: <20250108104529.3701964-1-catalin.popescu@leica-geosystems.com>
In-Reply-To: <20250108104529.3701964-1-catalin.popescu@leica-geosystems.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Jan 2025 11:52:46 +0100
X-Gm-Features: AbW1kvYMGGsJgoS0Dq2VGRV-3YNV3uUTNukjFBd75Oj4_eync0lhUwaDe5X0Lu4
Message-ID: <CANNYZj8Pnt6Bh3Ec0GcdgCfc-3UDJTjiw=pLqdUMOepttNZCnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bluez5: backport configuration file shipping
 from 5.73 to 5.72
To: catalin.popescu@leica-geosystems.com
Cc: openembedded-core@lists.openembedded.org, 
	bsp-development.geo@leica-geosystems.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 10:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209547

If this is for scarthgap, you need to add [scarthgap] to the subject.

Alex

On Wed, 8 Jan 2025 at 11:47, Catalin Popescu via
lists.openembedded.org
<catalin.popescu=leica-geosystems.com@lists.openembedded.org> wrote:
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
>  ...l-config-files-with-enable-datafiles.patch | 60 +++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-build-ship-all-config-files-with-enable-datafiles.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index 3f2f096aac..d7283fba00 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -54,6 +54,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
>             file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
>             file://0001-test-gatt-Fix-hung-issue.patch \
> +           file://0001-build-ship-all-config-files-with-enable-datafiles.patch \
>             "
>  S = "${WORKDIR}/bluez-${PV}"
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-build-ship-all-config-files-with-enable-datafiles.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-build-ship-all-config-files-with-enable-datafiles.patch
> new file mode 100644
> index 0000000000..275ca9f493
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-build-ship-all-config-files-with-enable-datafiles.patch
> @@ -0,0 +1,60 @@
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
> +---
> + Makefile.am   | 8 +++++++-
> + Makefile.mesh | 1 +
> + 2 files changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 2b1b9acdf..2cbfed2db 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -31,11 +31,17 @@ AM_LDFLAGS = $(MISC_LDFLAGS)
> + confdir = $(sysconfdir)/bluetooth
> + statedir = $(localstatedir)/lib/bluetooth
> +
> ++install-data-hook:
> ++      install -dm555 $(DESTDIR)$(confdir)
> ++      install -dm700 $(DESTDIR)$(statedir)
> ++
> + if DATAFILES
> + dbusdir = $(DBUS_CONFDIR)/dbus-1/system.d
> + dbus_DATA = src/bluetooth.conf
> +
> +-conf_DATA =
> ++conf_DATA = src/main.conf
> ++conf_DATA += profiles/input/input.conf
> ++conf_DATA += profiles/network/network.conf
> + state_DATA =
> + endif
> +
> +diff --git a/Makefile.mesh b/Makefile.mesh
> +index ea50383d2..e4c9fa6a3 100644
> +--- a/Makefile.mesh
> ++++ b/Makefile.mesh
> +@@ -3,6 +3,7 @@ if MESH
> +
> + if DATAFILES
> + dbus_DATA += mesh/bluetooth-mesh.conf
> ++conf_DATA += mesh/mesh-main.conf
> + endif
> +
> + if SYSTEMD
> +--
> +2.34.1
> +
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209546): https://lists.openembedded.org/g/openembedded-core/message/209546
> Mute This Topic: https://lists.openembedded.org/mt/110494379/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

