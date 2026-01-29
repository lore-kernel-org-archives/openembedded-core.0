Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0127AD358C4
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 06:17:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9548.1769667466957637091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 22:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XhFfsPGI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A8E404E42311;
	Thu, 29 Jan 2026 06:17:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FEAE60746;
	Thu, 29 Jan 2026 06:17:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2004B119A881F;
	Thu, 29 Jan 2026 07:17:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769667463; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=stPOn6sXYRPAqYLSYceXsMivsm90Qsk+cXj7aAZ9UXI=;
	b=XhFfsPGIe9bCXAYSW3XdOaNZNOPvhpUFUwgV1bpYvBfDgBCSGcTY5vKA2V3ycsmio0ptT2
	TXIaxKa3JpxjHB6lC8i3ns1xzwfjUt5ZPOwHXUVlvXXNXhsUkcJjadLjFyBv6LpIPqn4rZ
	RqHITMawVZk5ufk+kjXBFTu9xtL4pkb/mZay7Mn+HRKIPT/zRG1yeywAmolaZ39sy3E5dx
	1zgKSJoZzncmF54wd9GqKW4CrE5iR85OuxGxJigmvy0ZeK9gnIMwAW6dyCi7OKGaShtELd
	hfktY0ewykQndlnhloMrFLPyjja4PKnww/X2tbvrpi+B5FR6tK1Dbd9aStkroA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 07:17:42 +0100
Message-Id: <DG0URCTB99Y6.27GWCKK8DHC5T@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 5/8] classes/pkgconfig: rationalise variable
 usage
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260123180448.2997378-1-ross.burton@arm.com>
 <20260123180448.2997378-6-ross.burton@arm.com>
 <DG09C8YCPE02.3IOO2264O7DUQ@bootlin.com>
In-Reply-To: <DG09C8YCPE02.3IOO2264O7DUQ@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 06:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230120

On Wed Jan 28, 2026 at 2:30 PM CET, Mathieu Dubois-Briand wrote:
> On Fri Jan 23, 2026 at 7:04 PM CET, Ross Burton via lists.openembedded.or=
g wrote:
>> Our PKG_CONFIG_* variables were a bit of a mess.
>>
>> First, PKG_CONFIG_DIR is not used by either pkg-config or pkgconf.  It's
>> set to (approximately) ${libdir}/pkgconfig but we also want to search
>> ${datadir}/pkgconfig so it isn't actually useful as an intermediate
>> variable.
>>
>> Remove PKG_CONFIG_DIR and replace with the neatest expression for the
>> value we want: ${STAGING_LIBDIR}/pkgconfig.
>>
>> Second, PKG_CONFIG_PATH and PKG_CONFIG_LIBDIR shouldn't be set to the
>> same paths. The semantics of these variables is that PKG_CONFIG_PATH is
>> searched first, followed by either PKG_CONFIG_LIBDIR or the default path=
s
>> compiled into the pkg-config binary.
>>
>> Currently we set PKG_CONFIG_PATH to (approx.) ${libdir}:${datadir} and
>> PKG_CONFIG_LIBDIR to ${libdir}, so we search libdir twice.
>>
>> Also the default paths embedded in the binary will be incorrect as they
>> point to pkgconfig-native's sysroot, so we absolutely need to set
>> PKG_CONFIG_LIBDIR.
>>
>> Instead, set PKG_CONFIG_LIBDIR to ${libdir}:${datadir} so that the
>> default search path is correct. We can then leave PKG_CONFIG_PATH empty,
>> if a recipe has specific needs it can set that but normally it is not
>> needed anymore.
>>
>> Then bubble these changes out to the few places where the variables are
>> used directly:
>>
>> - Kernel/kconfig interaction where 'pkg-config' needs to read the
>> native files, not target.
>>
>> - The class classes (native, etc) which redefine the values.  However,
>> as the values are defined in terms of sysroot variables, we can
>> typically remove assignments from those classes as they are redundant.
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>
> Hi Ross,
>
> This patch is almost fine on the autobuilder, with one little exception:
> it breaks runtime_test.TestImage.test_testimage_virgl_gtk_sdl on some
> hosts. Or to go further, when qemu-system-native is compiled with "gtk+"
> PACKAGECONFIG, the it will have a dependency on host glib version and
> might complain it is too old:
>
> ERROR: qemu-system-native-10.2.0-r0 do_configure: Execution of '/srv/poky=
build/yocto-worker/oe-selftest-debian/build/build-st-2977320/tmp/work/x86_6=
4-linux/qemu-system-native/10.2.0/temp/run.do_configure.845525' failed with=
 exit code 1
> ...
> | ../sources/qemu-10.2.0/meson.build:1951:8: ERROR: Dependency lookup for=
 gtk+-3.0 with method 'pkgconfig' failed: Could not generate cflags for gtk=
+-3.0:
> | Package 'pango' requires 'glib-2.0 >=3D 2.82' but version of glib-2.0 i=
s 2.66.8
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3105
>
> This can be reproduced by either running
> runtime_test.TestImage.test_testimage_virgl_gtk_sdl selftest, or just
> building qemu-system-native with:
> PACKAGECONFIG:append:pn-qemu-system-native =3D " gtk+"
>
> Can you have a look at what is going wrong here?
>
> Thanks,
> Mathieu

Hi Ross,

I note this is also breaking meta-intel builds:

ERROR: libvpl-2.14.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-wo=
rker/meta-intel/build/build/tmp/work/corei7-64-poky-linux/libvpl/2.14.0/tem=
p/run.do_configure.2633134' failed with exit code 1
...
| -- Checking for module 'libva>=3D1.2'
| --   No package 'libva' found
| -- Checking for module 'libva-drm>=3D1.2'
| --   No package 'libva-drm' found
| CMake Error at examples/api2x/hello-vpp/CMakeLists.txt:78 (message):
|   libva not found: set LIBVA_SUPPORT=3DOFF to build hello-vpp without lib=
va
|   support

https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/builds/2937

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


