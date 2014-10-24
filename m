Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id EC29960232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 09:10:39 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id q5so716566wiv.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 02:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fWwTu23sSzQy/Kk1VFuP5ZsCHvyIjN4nTiJHaGoBUZo=;
	b=yZPDeK4g3KO/Bm4ix2eAnM9YNHpD3npfCd/W5BK3ZjhxrSqW2yGLMt/EQCLdz4q2OO
	334lX7ySnScIGxHFdVdoW71mwo3HndgUJWKnZDISz+C2RHgZzQwsXfYaOmpI82E+fttY
	/wRvcqtzIEU6qO5HUco4XiSryxVlWebou+iwmb/RHGdzZaCGmyhv1BNWmtp35y2fiCTs
	9PgFa+BOGpr/oasbu9m0st54Gj9s1bqZ2NqZ7S5mIXqC5jekE3qCERKbrtbKcvU4JoYI
	dzywfwZiQDDcV+d9uTE9twxgKZ4ihRnJH/+H9ddN/PgpqdwZVFE6MCTcU3azjaIyJ256
	C/rw==
X-Received: by 10.181.27.135 with SMTP id jg7mr2674341wid.56.1414141455625;
	Fri, 24 Oct 2014 02:04:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f7sm1283284wiz.13.2014.10.24.02.04.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Oct 2014 02:04:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 24 Oct 2014 11:04:16 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20141024090416.GB2430@jama>
References: <1412389675-13389-1-git-send-email-Martin.Jansa@gmail.com>
	<20141004023040.GO25706@jama>
MIME-Version: 1.0
In-Reply-To: <20141004023040.GO25706@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [WIP][PATCH] systemd: don't move libgudev around, it breaks libgudev-1.0.la
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
X-List-Received-Date: Fri, 24 Oct 2014 09:10:42 -0000
X-Groupsio-MsgNum: 58886
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline

--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 04, 2014 at 04:30:40AM +0200, Martin Jansa wrote:
> On Sat, Oct 04, 2014 at 04:27:55AM +0200, Martin Jansa wrote:
> > * libgudev-1.0.la still references /usr/lib and this change was breakin=
g gypsy (detected in navit) and
> >   network-manager-applet
>=20
> sending as WIP mostly because I don't know what "backward compatibility"
> issues required this move to be added when upgrading to 216
>=20
> only issue I've noticed was unpacked libgudev files, so I've added the
> libgudev package manually (instead of expecting split-package to create
> it dynamically).

Should I resend without WIP tag now when ChenQi confirmed that moving
libgudev isn't needed?

> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/systemd/systemd_216.bb | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-co=
re/systemd/systemd_216.bb
> > index ebf9395..2779823 100644
> > --- a/meta/recipes-core/systemd/systemd_216.bb
> > +++ b/meta/recipes-core/systemd/systemd_216.bb
> > @@ -129,9 +129,6 @@ do_install() {
> >  		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysc=
onfdir}/init.d/systemd-udevd
> >  	fi
> > =20
> > -	# Move libgudev back to ${rootlibdir} to keep backward compatibility
> > -	[ ${rootlibdir} !=3D ${libdir} ] && mv -t ${D}${rootlibdir} ${D}${lib=
dir}/libgudev*
> > -
> >          # Delete journal README, as log can be symlinked inside volati=
le.
> >          rm -f ${D}/${localstatedir}/log/README
> > =20
> > @@ -171,10 +168,10 @@ python populate_packages_prepend (){
> >      systemdlibdir =3D d.getVar("rootlibdir", True)
> >      do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'S=
ystemd %s library', extra_depends=3D'', allow_links=3DTrue)
> >  }
> > -PACKAGES_DYNAMIC +=3D "^lib(udev|gudev|systemd).*"
> > +PACKAGES_DYNAMIC +=3D "^lib(udev|systemd).*"
> > =20
> >  PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-an=
alyze ${PN}-kernel-install \
> > -             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh"
> > +             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh libgude=
v"
> > =20
> >  SYSTEMD_PACKAGES =3D "${PN}-binfmt"
> >  SYSTEMD_SERVICE_${PN}-binfmt =3D "systemd-binfmt.service"
> > @@ -188,6 +185,8 @@ FILES_${PN}-analyze =3D "${bindir}/systemd-analyze"
> >  FILES_${PN}-initramfs =3D "/init"
> >  RDEPENDS_${PN}-initramfs =3D "${PN}"
> > =20
> > +FILES_libgudev =3D "${libdir}/libgudev*${SOLIBS}"
> > +
> >  # The test cases need perl and bash to run correctly.
> >  RDEPENDS_${PN}-ptest +=3D "perl bash"
> >  FILES_${PN}-ptest +=3D "${libdir}/udev/rules.d"
> > --=20
> > 2.1.1
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRKFhAACgkQN1Ujt2V2gBxmAACcCGBdOEACi0g2pIwXk43AsovA
5bUAoIejc5nZO+InFJsvBnc1dPHp8S2I
=TXuq
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
