Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RhrMy-0004nV-Dw
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 00:32:45 +0100
Received: by eeit10 with SMTP id t10so10306285eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jan 2012 15:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6knfomv/thVLWaKIwqut2v3E9R8MEAJSmvhHBD3cB1E=;
	b=Bq/F2GeZ0FyLAj1pXQeDWsSmJEYH6SHA8vVh/TX8i8Ko5kZcQ9twiDAsGz+2gU1OXi
	jANehBBnTlrB+KuAjHr50A9vTrsQSuE4fC0Z7e0pjYHEdBtgNue/ekJniVxxNZXfvaTa
	xXdJ1ddRW44FfZdevTl+dWNGxEu6EJTzB3xEA=
Received: by 10.14.3.203 with SMTP id 51mr12202537eeh.11.1325546724478;
	Mon, 02 Jan 2012 15:25:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q67sm136002674eea.8.2012.01.02.15.25.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jan 2012 15:25:23 -0800 (PST)
Date: Tue, 3 Jan 2012 00:25:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120102232521.GB3958@jama.jama.net>
References: <1325541916-22423-1-git-send-email-msm@freescale.com>
	<20120102232228.GA3958@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120102232228.GA3958@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] libxml2: add shared library version info to libxml shared libraries
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
X-List-Received-Date: Mon, 02 Jan 2012 23:32:45 -0000
X-Groupsio-MsgNum: 15031
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline

--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2012 at 12:22:28AM +0100, Martin Jansa wrote:
> On Mon, Jan 02, 2012 at 04:05:16PM -0600, Matthew McClintock wrote:
> > This fixes an issue with RPM where it checks version imformation for
> > binaries linked against libxml and fails because it's missing info
> >=20
> > | error: Failed dependencies:
> > |              libxml2.so.2(LIBXML2_2.6.0) is needed by fmc-0.9.7+2-r2.=
1.ppce500mc
> > |              libxml2.so.2(LIBXML2_2.4.30) is needed by fmc-0.9.7+2-r2=
=2E1.ppce500mc
> > | ERROR: Function 'do_rootfs' failed (see
> >=20
> > Note: fmc is just an example recipe/name
>=20
> Weird that I haven't noticed this in oe-core before, but probably
> because in oe-core it was always without version. But it looks the same
> as this
> http://git.openembedded.org/openembedded/commit/?id=3D50ed401cdaaefb1f5ac=
33de2838af259a52b1c3a
> so
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

but also double check if all recipes depending on it needs PR bump too,
I've expected that it's needed only for transition from versioned to not
versioned symbols, but according to:
http://git.openembedded.org/openembedded/commit/?id=3D4373bc4d0cde98dfa188d=
9a06266afa06f970bfe
http://git.openembedded.org/openembedded/commit/?id=3D7e673ab79c7d76ffc2b73=
3fb32d0b41514eb0db0
it was needed also other way around

>=20
> >=20
> > Signed-off-by: Matthew McClintock <msm@freescale.com>
> > ---
> >  .../libxml/libxml2/fix_version_info.patch          |   23 ++++++++++++=
++++++++
> >  meta/recipes-core/libxml/libxml2_2.7.8.bb          |    4 ++-
> >  2 files changed, 26 insertions(+), 1 deletions(-)
> >  create mode 100644 meta/recipes-core/libxml/libxml2/fix_version_info.p=
atch
> >=20
> > diff --git a/meta/recipes-core/libxml/libxml2/fix_version_info.patch b/=
meta/recipes-core/libxml/libxml2/fix_version_info.patch
> > new file mode 100644
> > index 0000000..77113ef
> > --- /dev/null
> > +++ b/meta/recipes-core/libxml/libxml2/fix_version_info.patch
> > @@ -0,0 +1,23 @@
> > +Upstream-Status: Already upstream
> > +
> > +From 00819877651b87842ed878898ba17dba489820f0 Mon Sep 17 00:00:00 2001
> > +From: Daniel Veillard <veillard@redhat.com>
> > +Date: Thu, 04 Nov 2010 20:53:14 +0000
> > +Subject: Reactivate the shared library versionning script
> > +
> > +---
> > +diff --git a/configure.in b/configure.in
> > +index 59d0629..a1d2c89 100644
> > +--- a/configure.in
> > ++++ b/configure.in
> > +@@ -84,7 +84,7 @@ else
> > +   esac
> > + fi
> > + AC_SUBST(VERSION_SCRIPT_FLAGS)
> > +-AM_CONDITIONAL([USE_VERSION_SCRIPT], [test -z "$VERSION_SCRIPT_FLAGS"=
])
> > ++AM_CONDITIONAL([USE_VERSION_SCRIPT], [test -n "$VERSION_SCRIPT_FLAGS"=
])
> > +=20
> > + dnl
> > + dnl We process the AC_ARG_WITH first so that later we can modify
> > +--
> > +cgit v0.9.0.2
> > diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-c=
ore/libxml/libxml2_2.7.8.bb
> > index 2fa246e..0b6ce02 100644
> > --- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
> > +++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
> > @@ -1,6 +1,8 @@
> >  require libxml2.inc
> > =20
> > -PR =3D "r4"
> > +PR =3D "r5"
> > +
> > +SRC_URI +=3D "file://fix_version_info.patch"
> > =20
> >  SRC_URI[md5sum] =3D "8127a65e8c3b08856093099b52599c86"
> >  SRC_URI[sha256sum] =3D "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690=
d822e009fdc3c417ec"
> > --=20
> > 1.7.6.1
> >=20
> >=20
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8CPOEACgkQN1Ujt2V2gBwMVwCeIKfg0O9VBJvCFH5OIR6cKLq9
bfoAn34iEKqMOtOw6ptveUsvKfk2Ecl3
=IaWy
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
