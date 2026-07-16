Return-Path: <p.zabel@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1691EC4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 11:13:51 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10412.1784200420546319856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 04:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: p.zabel@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2B6E02007C0;
	Thu, 16 Jul 2026 13:13:37 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wkK25-0025lr-0H;
	Thu, 16 Jul 2026 13:13:37 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wkK25-00000000A4J-03nO;
	Thu, 16 Jul 2026 13:13:37 +0200
Message-ID: <490aa6b947a8701f102846683c99f1b226f71e04.camel@pengutronix.de>
Subject: Re: [OE-core] [[PATCHv3] meta: Add pam to the defaults if using
 systemd
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Leon Anavi <leon.anavi@konsulko.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2026 13:13:36 +0200
In-Reply-To: <CAJdd5GaqWhzsOS-5DVxDGyS8ORd-hmDqW3PKYu95H2XcKCyERg@mail.gmail.com>
References: <20260708143704.2643050-1-leon.anavi@konsulko.com>
	 <c068df721aaa08116114fca946a3eaa6936b4f76.camel@pengutronix.de>
	 <CAJdd5GaqWhzsOS-5DVxDGyS8ORd-hmDqW3PKYu95H2XcKCyERg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 11:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241081

On Mo, 2026-07-13 at 14:30 -0600, Joshua Watt wrote:
> On Thu, Jul 9, 2026 at 2:45=E2=80=AFAM Philipp Zabel via lists.openembedd=
ed.org
> <p.zabel=3Dpengutronix.de@lists.openembedded.org> wrote:
>=20
> > On Mi, 2026-07-08 at 17:37 +0300, Leon Anavi wrote:
> > > Add pam to DISTRO_FEATURES_DEFAULTS in init-manager-systemd.inc.
> > > This way pam will available if variable VIRTUAL-RUNTIME_init_manager
> > > has been set to systemd. Otherwise having systemd in conjunction
> > > with wayland but without pam leads to a conflict with the
> > > REQUIRED_DISTRO_FEATURES for weston related recipes.
> >=20
> > I think these requirements are partially incorrect, btw.
> >=20
> > Weston itself only requires PAM for the VNC password, so if
> > PACKAGECONFIG[vnc] is disabled, there is no PAM dependency from
> > weston_15.0.1.bb at all, and if vnc is enabled, the PAM dependency has
> > nothing to do with systemd being enabled or used as init system.
> >=20
> > The PAM dependency in weston-init.bb comes from the PAMName=3Dweston-
> > autologin option in weston.service and the corresponding weston-
> > autologin PAM configuration. Those files are always installed if
> > DISTRO_FEATURES has systemd, even if VIRTUAL-RUNTIME_init_manager is
> > set to something else.
> > Shouldn't either the pam distro feature depend on the systemd distro
> > feature, or should the weston.service/weston-autologin files be
> > installed at all if the systemd distro feature is enabled but
> > init_manager is set to something else?
> > I think it wouldn't be even better to remove the PAM requirement from
> > weston-init if VNC is disabled, as Weston doesn't need the PAM login in
> > that case.
> >=20
>=20
> I believe weston-init needs PAM regardless of VNC being enabled.

Yes. I failed to realize weston-init relies on pam_systemd.so to set
XDG_RUNTIME_DIR (which weston needs to create the wayland socket) in
its current state. The weston.service could just as well pass it via
the environment, though, for example:

RuntimeDirectory=3Dweston
Environment=3DXDG_RUNTIME_DIR=3D/run/weston

We've used this with an explicit socket path and WAYLAND_DISPLAY
exported via the systemd environment:

ExecStart=3D/usr/bin/weston --socket=3D${RUNTIME_DIRECTORY}/wayland-1 ...
ExecStartPost=3D+/usr/bin/systemctl set-environment WAYLAND_DISPLAY=3D${RUN=
TIME_DIRECTORY}/wayland-1


regards
Philipp

