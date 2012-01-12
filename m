Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RlOZ9-0006Lf-1U
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 18:36:02 +0100
Received: by obbuo6 with SMTP id uo6so1136919obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 09:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=sPIl01nrnHszRQs1pBBYqDO7U+w6xCk6k5fAlcptEvg=;
	b=eLldRnv6a6xQm9j95M2e/CanF+Y0xj8s4WxBfkx97SVeuFB+Ubo62jkjz67ZTqHT53
	OsbGuJ+e/XXlNyTEH92+vscicCM6K2oICXKmY//RYz841lNroGiDLD4pKE1RvaGq2bLx
	wVc6SxtEVaRTwSwnpivr++4Qa+Z6Qm3wPviJE=
MIME-Version: 1.0
Received: by 10.182.59.13 with SMTP id v13mr3708728obq.74.1326389303373; Thu,
	12 Jan 2012 09:28:23 -0800 (PST)
Received: by 10.60.34.138 with HTTP; Thu, 12 Jan 2012 09:28:23 -0800 (PST)
In-Reply-To: <1326379388-30619-1-git-send-email-koen@dominion.thruhere.net>
References: <1326379388-30619-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 12 Jan 2012 09:28:23 -0800
Message-ID: <CAGDS+n=F0307m3=DDA4bvXH=_QTLUk+ChsrM_SzMDGxcW84yQA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [Patch v2] gconf: enable gtk+ 2.0 support to build gconf-sanity-check-2
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
X-List-Received-Date: Thu, 12 Jan 2012 17:36:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2012 at 6:43 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> This is needed for e.g. gnome-session:
>
> gnome-session[424]: WARNING: Failed to run gconf-sanity-check-2: Failed t=
o execute child process "/usr/libexec/gconf-sanity-check-2" (No such file o=
r directory)
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> =A0meta/recipes-gnome/gnome/gconf_3.2.3.bb | =A0 20 +++++++++++---------
> =A01 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome=
/gnome/gconf_3.2.3.bb
> index f7d3594..11d382d 100644
> --- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> +++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> @@ -3,10 +3,10 @@ SECTION =3D "x11/gnome"
> =A0LICENSE =3D "LGPLv2+"
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9a=
bc605"
>
> -DEPENDS =3D "glib-2.0 dbus dbus-glib libxml2 intltool-native polkit"
> +DEPENDS =3D "glib-2.0 gtk+ dbus dbus-glib libxml2 intltool-native polkit=
"
> =A0DEPENDS_virtclass-native =3D "glib-2.0-native dbus-native dbus-glib-na=
tive libxml2-native intltool-native gnome-common-native"
>
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0inherit gnomebase
>
> @@ -21,8 +21,10 @@ S =3D "${WORKDIR}/GConf-${PV}"
>
> =A0POLKIT_OECONF =3D "--enable-defaults-service"
> =A0POLKIT_OECONF_virtclass-native =3D "--disable-defaults-service"
> -EXTRA_OECONF =3D "--disable-gtk-doc --disable-gtk --enable-shared --disa=
ble-static --enable-debug=3Dyes \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-introspection --disable-orbit =
--with-openldap=3Dno ${POLKIT_OECONF}"
> +GTKOECONF =3D "--with-gtk=3D2.0 --enable-gtk"
> +GTKOECONF_virtclass-native =3D "--disable-gtk"
> +EXTRA_OECONF =3D "--disable-gtk-doc --enable-shared --disable-static --e=
nable-debug=3Dyes \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-introspection --disable-orbit =
--with-openldap=3Dno ${POLKIT_OECONF}i ${GTKOECONF}"

Did you really intend to include the 'i' after ${POLKIT_OECONF} ?

Steve


