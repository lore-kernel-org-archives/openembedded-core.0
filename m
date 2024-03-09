Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAB3C54E49
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 22:48:28 +0000 (UTC)
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
 by mx.groups.io with SMTP id smtpd.web10.23137.1710024491720532617
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Mar 2024 14:48:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4TsdVK4l8PzMpykD;
	Sat,  9 Mar 2024 23:48:09 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4TsdVK0358zMpnPc;
	Sat,  9 Mar 2024 23:48:08 +0100 (CET)
Date: Sat, 09 Mar 2024 23:48:08 +0100
From: Quentin Schulz <foss+yocto@0leil.net>
To: openembedded-core@lists.openembedded.org,
 "Robert P. J. Day" <rpjday@crashcourse.ca>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: =?US-ASCII?Q?Re=3A_=5BOE-core=5D_more_pedantry=3A_observation_on_?= =?US-ASCII?Q?PACKAGES_ordering_and_bash-completion=2Ebbclass?=
In-Reply-To: <8d17a5b5-4cea-34f0-d0bf-a1e0ff1c9db1@crashcourse.ca>
References: <8d17a5b5-4cea-34f0-d0bf-a1e0ff1c9db1@crashcourse.ca>
Message-ID: <6E887B41-7933-45E5-ADB5-4C6FD33CD1CA@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 22:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196874

Hi,

On March 9, 2024 10:38:18 AM GMT+01:00, "Robert P=2E J=2E Day" <rpjday@cra=
shcourse=2Eca> wrote:
>
>  currently perusing countless recipes to choose really good
>pedagogical examples of "ptest" usage, and i began running across a
>number of recipes that (unrelated to ptest) included snippets toward
>the end of their recipe files that added content to FILES:${PN}=2E
>here's an example from fwupd:
>
>https://github=2Ecom/openembedded/meta-openembedded/blob/master/meta-oe/r=
ecipes-bsp/fwupd/fwupd_1=2E8=2E9=2Ebb#L130
>
>    FILES:${PN} +=3D "${libdir}/fwupd-plugins-* \
>                ${libdir}/fwupd-${PV} \
>                ${systemd_unitdir} \
>                ${datadir}/fish \
>                ${datadir}/metainfo \
>                ${datadir}/icons \
>                ${datadir}/dbus-1 \
>                ${datadir}/polkit-1 \
>                ${nonarch_libdir}/modules-load=2Ed"
>
>  since i knew(?) that the default PACKAGES list is processed left to
>right, and that the PN package is left until the end to gather what
>remains, i couldn't understand why so many recipes insisted on adding

"to gather what remains," is not entirely correct=2E FILES:${PN} is not a =
grab-all variable, it still only takes files matching the globs inside the =
variable, which defaults to:

"""
FILES:${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${=
SOLIBS} \ ${sysconfdir} ${sharedstatedir} ${localstatedir} \ ${base_bindir}=
/* ${base_sbindir}/* \ ${base_libdir}/*${SOLIBS} \ ${base_prefix}/lib/udev =
${prefix}/lib/udev \ ${base_libdir}/udev ${libdir}/udev \ ${datadir}/${BPN}=
 ${libdir}/${BPN}/* \ ${datadir}/pixmaps ${datadir}/applications \ ${datadi=
r}/idl ${datadir}/omf ${datadir}/sounds \ ${libdir}/bonobo/servers"
"""

And you can see that the paths added to fwupd aren't matched by those defa=
ult globs, hence why they are added=2E

>extra content to FILES:${PN} when the default processing would have
>collected it anyway, unless =2E=2E=2E there was something that had been
>appended to PACKAGES that required that=2E
>
>  sure enough, bash-completion=2Ebbclass:
>
>    PACKAGES +=3D "${PN}-bash-completion"
>    FILES:${PN}-bash-completion =3D "${datadir}/bash-completion ${sysconf=
dir}/bash_completion=2Ed"
>
>  my understanding is that the "proper" ordering of PACKAGES is to
>start with the most focused and specific packages, define their
>content, then move on until, at the end, whatever remains goes into
>PN=2E which makes that definition of bash-completion=2Ebbclass a bit
>puzzling -- why was it not *prepended* to the PACKAGES list given its
>specificity? and making all that subsequent addition to FILES:${PN}
>unnecessary?
>

If a file is matched only by one glob, then it doesn't matter much in whic=
h order the packages are listed, which is very likely the case here=2E

One reason could simply be that +=3D is more natural than =3D+ and seeing =
that +=3D worked, the contributor didn't think twice about it=2E

FWIW, one can also do PACKAGE_BEFORE_PN +=3D "${PN}-bash-completion" to ha=
ve bash-completion done right before PN instead of first if using =3D+=2E

Moving bash-completion package somewhere else in the PACKAGES list likely =
wouldn't change anything of the globs in FILES:${PN} though=2E

Cheers,
Quentin

