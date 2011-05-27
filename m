Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPxMB-0006HV-1I
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 15:45:39 +0200
Received: by wye20 with SMTP id 20so1438180wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 06:42:30 -0700 (PDT)
Received: by 10.216.231.89 with SMTP id k67mr2008182weq.113.1306503750738;
	Fri, 27 May 2011 06:42:30 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z66sm978061weq.24.2011.05.27.06.42.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 06:42:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306503625-719-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 27 May 2011 15:42:28 +0200
Message-Id: <1F14091E-80EF-441B-A4B7-ADFD99CB56E6@dominion.thruhere.net>
References: <1306503625-719-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] dbus 1.4.1: create UUIDDIR in postinst
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 May 2011 13:45:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

For the attentive reader, the sysV script still has the check for the =
dir, so it will get created if it fails for some reason in the postinst. =
Cleaning up the sysV cript is a bigger task for another day.

Op 27 mei 2011, om 15:40 heeft Koen Kooi het volgende geschreven:

> This fixes dbus usage in non-sysV init systems.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-core/dbus/dbus.inc      |    4 ++++
> meta/recipes-core/dbus/dbus_1.4.1.bb |    2 +-
> 2 files changed, 5 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/dbus/dbus.inc =
b/meta/recipes-core/dbus/dbus.inc
> index 2a5f8bd..75a4d9d 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -49,13 +49,17 @@ pkg_postinst_dbus() {
>=20
> 	MESSAGEUSER=3Dmessagebus
> 	MESSAGEHOME=3D/var/run/dbus
> +	UUIDDIR=3D/var/lib/dbus
>=20
> 	mkdir -p $MESSAGEHOME || true
> +	mkdir -p $UUIDDIR || true
> 	chgrp "$MESSAGEUSER" "$MESSAGEHOME" 2>/dev/null || addgroup =
"$MESSAGEUSER"
> 	chown "$MESSAGEUSER"."$MESSAGEUSER" "$MESSAGEHOME" 2>/dev/null =
|| \
> 		adduser --system --home "$MESSAGEHOME" --no-create-home =
--disabled-password \
> 			--ingroup "$MESSAGEUSER" "$MESSAGEUSER"
>=20
> +	chown "$MESSAGEUSER"."$MESSAGEUSER" "$UUIDDIR"
> +
> 	grep -q netdev: /etc/group || addgroup netdev
>=20
> 	chown root:"$MESSAGEUSER" /usr/libexec/dbus-daemon-launch-helper
> diff --git a/meta/recipes-core/dbus/dbus_1.4.1.bb =
b/meta/recipes-core/dbus/dbus_1.4.1.bb
> index 1c8aeaa..f65ef35 100644
> --- a/meta/recipes-core/dbus/dbus_1.4.1.bb
> +++ b/meta/recipes-core/dbus/dbus_1.4.1.bb
> @@ -1,6 +1,6 @@
> include dbus.inc
>=20
> -PR =3D "r4"
> +PR =3D "r5"
>=20
> SRC_URI[md5sum] =3D "99cb057700c0455fb68f8d57902f77ac"
> SRC_URI[sha256sum] =3D =
"caa1a0ded2d0f2e95c1d4ec7e3c8bd44834928c5b0ed41a7189963f3593983bd"
> --=20
> 1.6.6.1
>=20



