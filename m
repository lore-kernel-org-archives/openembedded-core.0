Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.65780.1629357661777246229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 00:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 516CF240009;
	Thu, 19 Aug 2021 07:20:58 +0000 (UTC)
Date: Thu, 19 Aug 2021 09:20:57 +0200
From: "Quentin Schulz" <foss@0leil.net>
To: openembedded-core@lists.openembedded.org,
 Jose Quaresma <quaresma.jose@gmail.com>
Subject: Re: [OE-core] [PATCH] patch.bbclass: show to the user where the patch is applied
In-Reply-To: <20210818212824.146143-1-quaresma.jose@gmail.com>
References: <20210818212824.146143-1-quaresma.jose@gmail.com>
Message-ID: <CF5F148C-F40D-42CF-84D7-88B293D9E752@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jose,

On August 18, 2021 11:28:24 PM GMT+02:00, Jose Quaresma <quaresma=2Ejose@g=
mail=2Ecom> wrote:
>- There are situration when the user have the 'patchdir' defined
>as a parameter on SRC_URI=2E However he doesn't know with this,
>the patch is applied relatively to the receipe source 'S'=2E
>
>* On the next example, the patch is applied on ${WORKDIR}/contrib=2E
>But if the user specifies a path on 'patchdir' that don't exist,
>the patch will fail and there are no message that indicates the real caus=
e=2E
>So showing the source path where the patch is applied can be useful=2E
>
>S =3D "${WORKDIR}/git"
>SRCREV_FORMAT =3D "opencv_contrib"
>SRC_URI =3D "git://github=2Ecom/opencv/opencv=2Egit;name=3Dopencv \
>           git://github=2Ecom/opencv/opencv_contrib=2Egit;destsuffix=3Dco=
ntrib;name=3Dcontrib \
>           file://0001-sfm-link-with-Glog_LIBS=2Epatch;patchdir=3D=2E=2E/=
contrib \
>           "
>

This shouldn't be done=2E You do not patch files in WORKDIR, you override =
them with SRC_URI and bbappends=2E

This breaks devtool=2E

The patch is fine for me, just complaining about the example :)

Are bb=2Enote printed in the log=2Edo_task files, I don't remember? If not=
 (or maybe whatever the answer since it could be a bring a better user expe=
rience), would it be possible to print this path again when it fails? So th=
at it's clear from the default loglevel output of bitbake that the patch fa=
iled and it was attempted to be applied to "this" path?

Reviewed-by: Quentin Schulz <foss@0leil=2Enet>

Thanks!
Quentin

>Signed-off-by: Jose Quaresma <quaresma=2Ejose@gmail=2Ecom>
>---
> meta/classes/patch=2Ebbclass | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/meta/classes/patch=2Ebbclass b/meta/classes/patch=2Ebbclass
>index 388773a237=2E=2E559c6f45bd 100644
>--- a/meta/classes/patch=2Ebbclass
>+++ b/meta/classes/patch=2Ebbclass
>@@ -142,7 +142,7 @@ python patch_do_patch() {
>         else:
>             patchset, resolver =3D classes[patchdir]
>=20
>-        bb=2Enote("Applying patch '%s' (%s)" % (parm['patchname'], oe=2E=
path=2Eformat_display(local, d)))
>+        bb=2Enote("Applying patch '%s' (%s) on '%s'" % (parm['patchname'=
], oe=2Epath=2Eformat_display(local, d), patchdir))
>         try:
>             patchset=2EImport({"file":local, "strippath": parm['striplev=
el']}, True)
>         except Exception as exc:
