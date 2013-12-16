Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 27D586E4AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 15:41:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.95,495,1384297200"; d="scan'208";a="38183710"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 16 Dec 2013 16:41:20 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Mon, 16 Dec 2013 16:41:20 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.128]) by
	COSNADEXC12.usr.ingenico.loc ([10.31.4.212]) with mapi id
	14.02.0328.009; Mon, 16 Dec 2013 16:41:20 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] gstreamer1.0-plugins-base: fix missing rprovides
Thread-Index: AQHO9/HOcqVB0wDJoUCmpiKCiDVQ75pW+lbA
Date: Mon, 16 Dec 2013 15:41:20 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B4D569AD6@COSNADEXC13.usr.ingenico.loc>
References: <1386931817-28233-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1386931817-28233-1-git-send-email-Matthieu.Crapet@ingenico.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [PATCH] gstreamer1.0-plugins-base: fix missing rprovides
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Dec 2013 15:41:23 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

My previous patch is wrong.

I've seen libgst* packages in gstreamer1.0-plugins-base & gstreamer1.0-plug=
ins-bad.
I'm using directly libgst* packages from a third party plugin.

I've thought changing gstreamer1.0-plugins.inc (instead of gstreamer1.0-plu=
gins-base.inc):
-PACKAGES_DYNAMIC =3D "^${PN}-.*"
+PACKAGES_DYNAMIC =3D "^${PN}-.* ^libgst.*"

But unfortunately this introduces a nasty (but not fatal) warning message. =
For examples:

NOTE: multiple providers are available for runtime libgstaudio-1.0 (gstream=
er1.0-plugins-bad, gstreamer1.0-plugins-base, gstreamer1.0-plugins-good)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libgstaudio-1.0

> libgstaudio-1.0 is only provided by gstreamer1.0-plugins-base

NOTE: multiple providers are available for runtime libgstmpegts-1.0 (gstrea=
mer1.0-plugins-bad, gstreamer1.0-plugins-base, gstreamer1.0-plugins-good)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libgstmpegts-1.=
0

> libgstmpegts-1.0 is only provided by gstreamer1.0-plugins-bad

Is this a side effect of PACKAGES_DYNAMIC with empty package?

Regards,
M


-----Message d'origine-----
De=A0: Matthieu Crapet [mailto:Matthieu.Crapet@ingenico.com]=20
Envoy=E9=A0: vendredi 13 d=E9cembre 2013 11:50
=C0=A0: openembedded-core@lists.openembedded.org
Cc=A0: Matthieu CRAPET
Objet=A0: [PATCH] gstreamer1.0-plugins-base: fix missing rprovides

split_gstreamer10_packages creates libgst* packages which are missing in PA=
CKAGES list.
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.in=
c b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index ebfa7cd..697b5bd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -7,6 +7,7 @@ DEPENDS +=3D "freetype liboil util-linux"
=20
 inherit gettext
=20
+PACKAGES_DYNAMIC =3D+ "^libgst.*"
=20
 PACKAGECONFIG ??=3D " \
     ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
--=20
1.8.2.1


