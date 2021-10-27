Return-Path: <martyn.welch@collabora.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB800C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 16:51:51 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by mx.groups.io with SMTP id smtpd.web11.14684.1635353510542627213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 09:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: collabora.com, ip: 46.235.227.227, mailfrom: martyn.welch@collabora.com)
Received: from [IPv6:2a00:23c6:c31a:b300:7353:f37b:e749:b5d9] (unknown
 [IPv6:2a00:23c6:c31a:b300:7353:f37b:e749:b5d9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: martyn)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 43BC81F44721;
	Wed, 27 Oct 2021 17:51:48 +0100 (BST)
Message-ID: <9cd8bef0db61dd83d67b43fc686852f96cf028d5.camel@collabora.com>
Subject: Re: [OE-core] [PATCH 1/2] systemd: Do not install anything in
 /var/log
From: Martyn Welch <martyn.welch@collabora.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Oct 2021 17:51:45 +0100
In-Reply-To: <20211027163713.17300-1-pkj@axis.com>
References: <20211027163713.17300-1-pkj@axis.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0-2 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 16:51:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157559

On Wed, 2021-10-27 at 18:37 +0200, Peter Kjellerstedt wrote:
> /var/log is typically a symbolic link to inside /var/volatile, which
> is expected to be empty.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> =C2=A0meta/recipes-core/systemd/systemd_249.5.bb | 11 ++++-------
> =C2=A01 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_249.5.bb
> b/meta/recipes-core/systemd/systemd_249.5.bb
> index d87f54bf16..f2e6a79d6c 100644
> --- a/meta/recipes-core/systemd/systemd_249.5.bb
> +++ b/meta/recipes-core/systemd/systemd_249.5.bb
> @@ -270,13 +270,10 @@ do_install() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0install -Dm 0755 ${S}/src/systemctl/systemd-sysv-
> install.SKELETON ${D}${systemd_system_unitdir}d-sysv-install
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fi
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0chown root:systemd-journal $=
{D}/${localstatedir}/log/journal

Having /var/log/journal exist (on systems that don't symbolically link
/var/log inside /var/volatile) by default will cause systemd to
persistently log data. I suspect removing this is going to negatively
impact some users.

> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# Delete journal README, as =
log can be symlinked inside
> volatile.
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm -f ${D}/${localstatedir}/=
log/README
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# journal-remote creates thi=
s at start
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm -rf ${D}/${localstatedir}=
/log/journal/remote
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# /var/log is typically a sy=
mbolic link to inside
> /var/volatile, which
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# is expected to be empty. T=
his remove /var/log/README and
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# /var/log/journal/.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm -rf ${D}${localstatedir}/=
log
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0install -d
> ${D}${systemd_system_unitdir}/graphical.target.wants
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0install -d ${D}${system=
d_system_unitdir}/multi-
> user.target.wants
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157555):
> https://lists.openembedded.org/g/openembedded-core/message/157555
> Mute This Topic: https://lists.openembedded.org/mt/86632211/6512429
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> martyn.welch@collabora.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


