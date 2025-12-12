Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC55D59D77
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 17:49:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123.1765561795079194996
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 09:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QEgARBae;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 880B5C19356
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 17:49:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7BCDD606DF;
	Fri, 12 Dec 2025 17:49:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D5BC103C8DED;
	Fri, 12 Dec 2025 18:49:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765561792; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5qX6qNWE0D/TMFrgjXie4zVhCl1jsAa1vf3oj6CZeOY=;
	b=QEgARBaeAv8SWeY+8tpvkuNzSPhEvV0NcR8Pj/a+O/U8EvQ6gM+nrr/HQJyQFcHbGeTACo
	1EQTmXcaGe7rsWO9kLWxdslsUMR/eo65ylcFwa+AjHwOaTFKjTaQZEyn2WO21YWqllifSU
	Q0f8S5uJcM3eB/69zdIwybcfcTiqqSV5lysG1gkKVe2uiJefOuOn0pp3JtqBuVvd2TjcNW
	Ud9OD+2OfuxYxM8Ns7kULYykcj889SjyZhbCKoGX3L9htrelTeAVy6Wfw1++V51jyULRUm
	zTNK8DtVXJoWbH5nzyivCUwAHBPAx9la61jDRogFCZzAnRA0VyfttV6AfTnoZg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Dec 2025 18:49:49 +0100
Message-Id: <DEWFF52P7FUG.1OYVLWLGCCZMD@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 6/6] dnf: Upgrade to 5.3.0.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adam.duskett@amarulasolutions.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251212103312.2077322-1-adam.duskett@amarulasolutions.com>
 <20251212103312.2077322-6-adam.duskett@amarulasolutions.com>
In-Reply-To: <20251212103312.2077322-6-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 17:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227609

On Fri Dec 12, 2025 at 11:33 AM CET, Adam Duskett via lists.openembedded.or=
g wrote:
> Completely rewritten in C++, there are several changes needed
> to facilitate moving from DNF4 to DNF5. Below are some significant
> items to note:
>
>     - The "-v/--verbose" cli option is removed. As such, remove the argum=
ent
>     everywhere it was called.[1]
>
>     - the rpmverbosity cli option is replaced with --setopt=3Drpmverbosit=
y
>
>     - Change gpgcheck to pkg_gpgcheck as this is what the documentation
>     recommends.[2]
>
>     - --nogpgcheck is now --no-gpgchecks
>
>     - --setopt=3Dprotect_running_kernel=3DFalse has to be set or else eve=
ry dnf
>     transaction complains that /boot/vmlinuz-${kernel_version} does not
>     exist in /var/log/dnf5.log. There is an open issue on github[3] to en=
able
>     the currently not-yet implemented `autocheck_running_kernel option`, =
but
>     it has been open for quite some time and the protect_running_kernel
>     option supresses the message.
>
>     - /var/cache/dnf is replaced with /var/cache/libdnf5
>
>     - Add `features +=3D 'PACKAGECONFIG:append:pn-rpm =3D " sequoia"\n'`
>           `features +=3D 'PACKAGECONFIG:append:pn-librepo =3D " sequoia"\=
n'`
>       to test_testimage_dnf as librepo currently does not work
>       with gpgme.
>
> While DNF5 has many config options, unfortunately, the majority
> of them depends on sdbus-c++, which is not included in OE-core.
> However, the package is included in meta-openembedded, so it's
> best to include the PACKAGECONFIG options in the recipe and
> leave them off.
>
> 1: https://github.com/rpm-software-management/dnf5/issues/464
> 2: https://dnf5.readthedocs.io/en/latest/dnf5.conf.5.html
> 3: https://github.com/rpm-software-management/dnf5/issues/1255
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---

Hi Adam,

Thanks for your patch.

It looks like there is also a change with the --skip-broken argument:

ERROR: core-image-sato-1.0-r0 do_populate_sdk: Could not invoke dnf. Comman=
d '...' returned 2:
Unknown argument "--skip-broken" for command "dnf5". Add "--help" for more =
information about the arguments.
The argument is available for commands: module enable, environment install,=
 group install, replay, reinstall, downgrade, debuginfo-install, distro-syn=
c, install, do. (It has to be placed after the command.)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2856
https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/2869
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2824
https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/2848
...

As expected, this is seen on almost all child builds of this a-full:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2851

Can you have a look at the error?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


