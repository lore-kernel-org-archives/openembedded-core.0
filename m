Return-Path: <p.zabel@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DB8C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 08:45:34 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4560.1783586728577650068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 01:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: p.zabel@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B8F76202777;
	Thu, 09 Jul 2026 10:45:26 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1whkNq-000tAu-2B;
	Thu, 09 Jul 2026 10:45:26 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1whkNq-000000004zZ-2ZVG;
	Thu, 09 Jul 2026 10:45:26 +0200
Message-ID: <c068df721aaa08116114fca946a3eaa6936b4f76.camel@pengutronix.de>
Subject: Re: [[PATCHv3] meta: Add pam to the defaults if using systemd
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Leon Anavi <leon.anavi@konsulko.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Jul 2026 10:45:26 +0200
In-Reply-To: <20260708143704.2643050-1-leon.anavi@konsulko.com>
References: <20260708143704.2643050-1-leon.anavi@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 08:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240546

On Mi, 2026-07-08 at 17:37 +0300, Leon Anavi wrote:
> Add pam to DISTRO_FEATURES_DEFAULTS in init-manager-systemd.inc.
> This way pam will available if variable VIRTUAL-RUNTIME_init_manager
> has been set to systemd. Otherwise having systemd in conjunction
> with wayland but without pam leads to a conflict with the
> REQUIRED_DISTRO_FEATURES for weston related recipes.

I think these requirements are partially incorrect, btw.

Weston itself only requires PAM for the VNC password, so if
PACKAGECONFIG[vnc] is disabled, there is no PAM dependency from
weston_15.0.1.bb at all, and if vnc is enabled, the PAM dependency has
nothing to do with systemd being enabled or used as init system.

The PAM dependency in weston-init.bb comes from the PAMName=3Dweston-
autologin option in weston.service and the corresponding weston-
autologin PAM configuration. Those files are always installed if
DISTRO_FEATURES has systemd, even if VIRTUAL-RUNTIME_init_manager is
set to something else.
Shouldn't either the pam distro feature depend on the systemd distro
feature, or should the weston.service/weston-autologin files be
installed at all if the systemd distro feature is enabled but
init_manager is set to something else?
I think it wouldn't be even better to remove the PAM requirement from
weston-init if VNC is disabled, as Weston doesn't need the PAM login in
that case.

regards
Philipp

