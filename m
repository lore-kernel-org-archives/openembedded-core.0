Return-Path: <l.stach@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8319C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 09:56:33 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7609.1783936589580867876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 02:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: l.stach@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1wjDOl-0008Ox-IA; Mon, 13 Jul 2026 11:56:27 +0200
Message-ID: <e11b45c00588e9d1f126a516350fe647823d022c.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH 1/2] readyfd2sd: add recipe
From: Lucas Stach <l.stach@pengutronix.de>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Date: Mon, 13 Jul 2026 11:56:26 +0200
In-Reply-To: <DJQHPR7DZ5DC.7UI26Y5DSKJV@bootlin.com>
References: <20260702182012.2240881-1-l.stach@pengutronix.de>
	 <DJQHPR7DZ5DC.7UI26Y5DSKJV@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 09:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240835

Hi Mathieu,

Am Sonntag, dem 05.07.2026 um 10:21 +0200 schrieb Mathieu Dubois-
Briand:
> On Thu Jul 2, 2026 at 8:20 PM CEST, Lucas Stach wrote:
> > Some services, such as seatd, only implement the s6 init ready notifica=
tions.
> > readyfd2sd translates those notifications to the systemd-notify format,=
 to
> > make them usable with the systemd init system.
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
>=20
> Hi Lucas,
>=20
> Thanks for your patch.
>=20
> It looks like this is failing with non-systemd distro.
>=20
> WARNING: Nothing PROVIDES 'systemd' (but /srv/pokybuild/yocto-worker/qemu=
arm64-armhost/build/layers/openembedded-core/meta/recipes-core/readyfd2sd/r=
eadyfd2sd_git.bb DEPENDS on or otherwise requires it)
> systemd was skipped: using DISTRO 'poky', which is missing required DISTR=
O_FEATURES: 'systemd usrmerge'
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/4108
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4095
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4133
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4314
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/4097
>=20
> Can eadyfd2sd be built without systemd?
>=20
No, that doesn't make sense, as readyfd2sd is an adapter to a systemd
API, so there is a hard dependency there. It's also only added as a
dependency to seatd when systemd support is enabled.

What's the correct way to avoid the build in the autobuild? Will a
check for REQUIRED_DISTRO_FEATURES do the right thing?

> Also, please add the corresponding entry in
> meta/conf/distro/include/maintainers.inc.
>=20
Sure, I can do that.

Regards,
Lucas

