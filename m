Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RhmtB-0007gH-8v
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 19:45:41 +0100
Received: by eeit10 with SMTP id t10so10195674eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jan 2012 10:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BIRH73WXxOZgxRm92YSgFY2ZDTobCa/mqjcEmmtaMVg=;
	b=sxvmVuDpVC0BnRJQVJ7dMgTefYQ6t5p5xsH6AGYgiY4qMH3wns6XHson0OANSPZb0O
	g9kYMNfF8uP5OtYPRA8CvLb5ci0+Z4vh34IhqZ337QRsRwBj1m8UApQe47TUvLYqd5MQ
	w0S9B/EHZUNE5Lj0P6mpy8NuNSpmM4BdLytKk=
Received: by 10.213.13.66 with SMTP id b2mr9002484eba.87.1325529501414;
	Mon, 02 Jan 2012 10:38:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm194764310eeb.3.2012.01.02.10.38.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jan 2012 10:38:20 -0800 (PST)
Date: Mon, 2 Jan 2012 19:38:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120102183808.GB3749@jama.jama.net>
References: <cover.1325101673.git.otavio@ossystems.com.br>
	<fde24903e4f56091470e1e7f2fc00a63a8b86f22.1325101673.git.otavio@ossystems.com.br>
	<4F01F60D.4000304@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F01F60D.4000304@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 01/16] qt4-graphics-system: add
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
X-List-Received-Date: Mon, 02 Jan 2012 18:45:41 -0000
X-Groupsio-MsgNum: 15003
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline

--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 02, 2012 at 10:23:09AM -0800, Saul Wold wrote:
> On 12/28/2011 11:55 AM, Otavio Salvador wrote:
> > Allow setting default runtime graphics system engine for Qt4
> > applications per machine.
> >
>=20
>=20
>=20
> > Depending on the GPU and Xorg driver, this can boost and impact
> > significantly the drawing performance. The default setting is to
> > 'raster' as this offer best performance for most machines GPUs.
> >
> > Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> > ---
> >   .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   24 +++++++++++=
+++++++++
> >   1 files changed, 24 insertions(+), 0 deletions(-)
> >   create mode 100644 meta/recipes-qt/qt4-graphics-system/qt4-graphics-s=
ystem_1.0.bb
> >
> > diff --git a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.=
0.bb b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
> > new file mode 100644
> > index 0000000..e3a3a1d
> > --- /dev/null
> > +++ b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
> > @@ -0,0 +1,24 @@
> > +DESCRIPTION =3D "Set default Qt4 Graphics System to ${QT_GRAPHICS_SYST=
EM}"
> > +SECTION =3D "x11/base"
> > +LICENSE =3D "MIT-X"
> > +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cf=
bcb788c80a0384361b4de20420"
> > +
> > +QT_GRAPHICS_SYSTEM ?=3D "raster"
> > +
> > +def _get_extra_rdepends(d):
> > +    gs =3D d.getVar('QT_GRAPHICS_SYSTEM', 1)
> > +    if gs =3D=3D "opengl":
> > +        return "qt4-plugin-graphicssystems-glgraphicssystem"
> > +
> > +    return ""
> > +
> > +do_install () {
> > +	install -d ${D}/${sysconfdir}/X11/Xsession.d/
> > +	cfg_file=3D${D}/${sysconfdir}/X11/Xsession.d/85xqt-graphicssystem
> > +	echo "export QT_GRAPHICSSYSTEM=3D${QT_GRAPHICS_SYSTEM}">  $cfg_file
> > +	chmod +x $cfg_file
> > +}
> > +
> > +RDEPENDS_${PN} =3D "xserver-common ${@_get_extra_rdepends(d)}"
> > +
> We don't have an xserver-common in oe-core, what does it provide?

that's x11-common equivalent in meta-oe, VIRTUAL_RUNTIME should be used
here like in meta/recipes-sato/tasks/task-core-x11.bb

# xserver-common, x11-common
VIRTUAL-RUNTIME_xserver_common ?=3D "x11-common"

> Is this something that we need to merge over?

xserver-common added functionality (like xinput-calibrator) should be merge=
d=20
to x11-common and then xserver-common dropped from meta-oe, but I'm
still busy with other stuff and daywork..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8B+ZAACgkQN1Ujt2V2gBwiygCgolGw6pe0JsYzHfDjhwIzKO2M
oUQAnAvxjGLAgG3mnlIdXel2EzuiZRid
=YQk8
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
