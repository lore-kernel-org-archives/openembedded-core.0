Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9gwR-0007f9-Ni
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:32:07 +0200
Received: by fxi1 with SMTP id 1so3315154fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 10:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CEAVuktPyBfxQgM1G0L5Ky0hO8sNIwM+aHq0lNhLnPQ=;
	b=Pd6F+S5FgHtIESLlx2PiMqvyZiYTf/Rf6bDhbxVfBFaxMKU9XSPp23pWq6p1+a90pr
	uSfRAs4Gu+2VAeSw25sno2bm2eJqWn7zvDsIbFhofW1TxW8Kyo5eVG+5N1LcQL/tcbDP
	DsM/phUUBoRUgG9QBynDiTfLXhn5Uvpw4AIqs=
Received: by 10.223.44.89 with SMTP id z25mr6810852fae.42.1317403595479;
	Fri, 30 Sep 2011 10:26:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n12sm7542358fan.9.2011.09.30.10.26.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 10:26:34 -0700 (PDT)
Date: Fri, 30 Sep 2011 19:26:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110930172628.GE7364@jama.jama.net>
References: <1317403283-17471-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1317403283-17471-1-git-send-email-msm@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v3 01/16] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Fri, 30 Sep 2011 17:32:07 -0000
X-Groupsio-MsgNum: 10335
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZRyEpB+iJ+qUx0kp"
Content-Disposition: inline

--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 12:21:23PM -0500, Matthew McClintock wrote:
> From: Tom Rini <tom_rini@mentor.com>
>=20
> At issue is that route/pktloc.c (not generated) depends on
> route/pktloc_syntax.h (generated).

On Fri, Sep 30, 2011 at 9:13 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:

and when you're at it, please also add packaging changes from meta-oe,
so we can remove libnl from meta-oe and keep only libnl1 there.

Thanks

>=20
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  .../libnl/fix-pktloc_syntax_h-race.patch           |   26 ++++++++++++++=
++++++
>  meta/recipes-support/libnl/libnl_2.0.bb            |    3 +-
>  2 files changed, 28 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-support/libnl/fix-pktloc_syntax_h-race.p=
atch
>=20
> diff --git a/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch b/=
meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
> new file mode 100644
> index 0000000..05d75db
> --- /dev/null
> +++ b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
> @@ -0,0 +1,26 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +libnl has progressed to 0.3.2 and there does not appear to be any
> +"make -j" issues with this build after my limited testing on that
> +newer version so we can assume this issue is fixed upstream
> +
> +Index: libnl-2.0/lib/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libnl-2.0.orig/lib/Makefile.am
> ++++ libnl-2.0/lib/Makefile.am
> +@@ -27,11 +27,15 @@ CLEANFILES =3D \
> + 	route/pktloc_grammar.c route/pktloc_grammar.h \
> + 	route/pktloc_syntax.c route/pktloc_syntax.h
> +=20
> ++BUILT_SOURCES =3D route/pktloc_syntax.h route/pktloc_grammar.h
> ++
> + # Hack to avoid using ylwrap. It does not function correctly in combina=
tion
> + # with --header-file=3D
> ++route/pktloc_grammar.h: route/pktloc_grammar.c
> + route/pktloc_grammar.c: route/pktloc_grammar.l
> + 	$(LEX) --header-file=3Droute/pktloc_grammar.h $(LFLAGS) -o $@ $^
> +=20
> ++route/pktloc_syntax.h: route/pktloc_syntax.c
> + route/pktloc_syntax.c: route/pktloc_syntax.y
> + 	$(YACC) -d $(YFLAGS) -o $@ $^
> +=20
> diff --git a/meta/recipes-support/libnl/libnl_2.0.bb b/meta/recipes-suppo=
rt/libnl/libnl_2.0.bb
> index 0dfcaf6..5339846 100644
> --- a/meta/recipes-support/libnl/libnl_2.0.bb
> +++ b/meta/recipes-support/libnl/libnl_2.0.bb
> @@ -6,10 +6,11 @@ LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2b41e13261a330ee784153ecbb6a8=
2bc"
> =20
>  DEPENDS =3D "flex-native bison-native"
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  SRC_URI=3D "http://www.infradead.org/~tgr/libnl/files/${BPN}-${PV}.tar.g=
z \
>            file://fix-makefile.patch \
> +	  file://fix-pktloc_syntax_h-race.patch \
>           "
> =20
>  SRC_URI[md5sum] =3D "6aaf1e9802a17a7d702bb0638044ffa7"
> --=20
> 1.7.6.1
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZRyEpB+iJ+qUx0kp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6F+8QACgkQN1Ujt2V2gBx2dQCfajOC7lHXI2jGFusz2wWxkeuS
PQkAn1qDdXR8cAY2fag2nmf0P0OxfXDO
=h/tn
-----END PGP SIGNATURE-----

--ZRyEpB+iJ+qUx0kp--
