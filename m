Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACFFD25B78
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 13:30:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12894.1769607041601212459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 05:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zOOK7BcJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C9661A2AC0;
	Wed, 28 Jan 2026 13:30:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4AAED6071F;
	Wed, 28 Jan 2026 13:30:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB944119A8801;
	Wed, 28 Jan 2026 14:30:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769607038; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UpwFZC/CufKNB8UuXIvruuaxQDPzn2U1hXaL3Bo2LBg=;
	b=zOOK7BcJQhY6JbTyPHInkqW8MvtH7R2AI/K7FsEUbAe0YkDvP1yIik3won+UiZ/dMFF/hr
	lHrCawVZlC1GuVqpqlhIKxdCKCgVMyOCPtYDEIiMQZThm3LOp2/3orh5m9ymePTJuCNGZx
	vBIBMZpJIqsT63VGkjZyW9LDPciHg9EEWR68yu8OjdXELjx+YuDIjY5i3YtzBannzqH80I
	6W5HbjNGNN1gWM96vF57T7GjvwkS3PnZmHrO2LIc5VHB+v6vMRUXLRBqTwiYceHnRYuynX
	b5jiJC94I2RbEXW1FIP0lulTkyZ6bdwosWhyPx6ypIfxprfieo67364QpZFacQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 14:30:34 +0100
Message-Id: <DG09C8YCPE02.3IOO2264O7DUQ@bootlin.com>
Subject: Re: [OE-core] [PATCH 5/8] classes/pkgconfig: rationalise variable
 usage
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260123180448.2997378-1-ross.burton@arm.com>
 <20260123180448.2997378-6-ross.burton@arm.com>
In-Reply-To: <20260123180448.2997378-6-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 13:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230094

On Fri Jan 23, 2026 at 7:04 PM CET, Ross Burton via lists.openembedded.org =
wrote:
> Our PKG_CONFIG_* variables were a bit of a mess.
>
> First, PKG_CONFIG_DIR is not used by either pkg-config or pkgconf.  It's
> set to (approximately) ${libdir}/pkgconfig but we also want to search
> ${datadir}/pkgconfig so it isn't actually useful as an intermediate
> variable.
>
> Remove PKG_CONFIG_DIR and replace with the neatest expression for the
> value we want: ${STAGING_LIBDIR}/pkgconfig.
>
> Second, PKG_CONFIG_PATH and PKG_CONFIG_LIBDIR shouldn't be set to the
> same paths. The semantics of these variables is that PKG_CONFIG_PATH is
> searched first, followed by either PKG_CONFIG_LIBDIR or the default paths
> compiled into the pkg-config binary.
>
> Currently we set PKG_CONFIG_PATH to (approx.) ${libdir}:${datadir} and
> PKG_CONFIG_LIBDIR to ${libdir}, so we search libdir twice.
>
> Also the default paths embedded in the binary will be incorrect as they
> point to pkgconfig-native's sysroot, so we absolutely need to set
> PKG_CONFIG_LIBDIR.
>
> Instead, set PKG_CONFIG_LIBDIR to ${libdir}:${datadir} so that the
> default search path is correct. We can then leave PKG_CONFIG_PATH empty,
> if a recipe has specific needs it can set that but normally it is not
> needed anymore.
>
> Then bubble these changes out to the few places where the variables are
> used directly:
>
> - Kernel/kconfig interaction where 'pkg-config' needs to read the
> native files, not target.
>
> - The class classes (native, etc) which redefine the values.  However,
> as the values are defined in terms of sysroot variables, we can
> typically remove assignments from those classes as they are redundant.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

This patch is almost fine on the autobuilder, with one little exception:
it breaks runtime_test.TestImage.test_testimage_virgl_gtk_sdl on some
hosts. Or to go further, when qemu-system-native is compiled with "gtk+"
PACKAGECONFIG, the it will have a dependency on host glib version and
might complain it is too old:

ERROR: qemu-system-native-10.2.0-r0 do_configure: Execution of '/srv/pokybu=
ild/yocto-worker/oe-selftest-debian/build/build-st-2977320/tmp/work/x86_64-=
linux/qemu-system-native/10.2.0/temp/run.do_configure.845525' failed with e=
xit code 1
...
| ../sources/qemu-10.2.0/meson.build:1951:8: ERROR: Dependency lookup for g=
tk+-3.0 with method 'pkgconfig' failed: Could not generate cflags for gtk+-=
3.0:
| Package 'pango' requires 'glib-2.0 >=3D 2.82' but version of glib-2.0 is =
2.66.8

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3105

This can be reproduced by either running
runtime_test.TestImage.test_testimage_virgl_gtk_sdl selftest, or just
building qemu-system-native with:
PACKAGECONFIG:append:pn-qemu-system-native =3D " gtk+"

Can you have a look at what is going wrong here?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


