Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5D28F6FE84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 21:02:40 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id t60so3418483wes.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 14:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=crHAyCCmIUupRtjC+twAt39ZO9xvz+dDLnIzAtt6uVk=;
	b=SUTPcMkCJYL29qum6lKGmXkABb1NieHyaefu3FvPBpjXcdEoJNLBEwF8fLXTceW/kO
	sa7ILJaVw8axlZetg3j09sN4bpOTn0x9RRcJi4kXsSQUmV0Cd4o8EuqreBHFIykQfXqD
	5qHzZNJoUrcIO0Z/AJT1XhsvhJ+h8rOaaXpZ3IVpnzv49CgqTzpWSVs5D3JXZfnTQnux
	6AFh3vtst38exnhMSDewsf6eF7PGhN8ktr9+k27sogIISz8MCv1P/CCTEsi6gK9zW267
	h+65zf0Ucyryp2/574EkGVBLbhysOIgnxxhhCaDS+VwVQahHoxPNe2MxTBXiJpcmQWvq
	W24w==
X-Received: by 10.180.102.10 with SMTP id fk10mr8018754wib.42.1402693361757;
	Fri, 13 Jun 2014 14:02:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	4sm14240586eeu.16.2014.06.13.14.02.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jun 2014 14:02:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 Jun 2014 23:03:02 +0200
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20140613210302.GK2428@jama>
References: <1402674385.29913.6.camel@ted>
	<CADkTA4MtGT145NMXzwfL9z6HDnrLzbvcDdeGeCjC5AJuN-Ad+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4MtGT145NMXzwfL9z6HDnrLzbvcDdeGeCjC5AJuN-Ad+g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-module-split: Add support for KERNEL_MODULE_AUTOLOAD and KERNEL_MODULE_PROBECONF
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
X-List-Received-Date: Fri, 13 Jun 2014 21:02:50 -0000
X-Groupsio-MsgNum: 54107
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+RZeZVNR8VILNfK"
Content-Disposition: inline

--x+RZeZVNR8VILNfK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2014 at 03:02:05PM -0400, Bruce Ashfield wrote:
> On Fri, Jun 13, 2014 at 11:46 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The current module_autoload_* and module_conf_* variables are error
> > both ugly and error prone. They aren't registered in the task checksums

Looks good, there is extra "error" in first sentence.

> > so changes to them aren't reflected in the build. This turns out to
> > be near impossible to fix with the current variable format in any
> > sensible way :(.
> >
> > This patch replace module_autoload with the list of variables in
> > KERNEL_MODULE_AUTOLOAD which is a much simpler and usable API. An
> > error is printed if an old style variable is encountered. It should
> > be simple to convert to this.
> >
> > module_conf_* are harder to deal with since there is data associated
> > with it, it isn't simply a flag. We need a list of variables that are s=
et
> > in order to be able to correctly handle the task checksum so we add
> > KERNEL_MODULE_PROBECONF for this purpose and error if the user hasn't
> > added a module to it when they should have.
>=20
> Looks reasonable to me. In my experience, there aren't a lot of users of
> the module_* variables, so the transition to the new names and semantics
> shouldn't be a big issue.
>=20
> Cheers,
>=20
> Bruce
>=20
> >
> > [YOCTO #5786]
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/ke=
rnel-module-split.bbclass
> > index d43f743..e38a6f6 100644
> > --- a/meta/classes/kernel-module-split.bbclass
> > +++ b/meta/classes/kernel-module-split.bbclass
> > @@ -130,8 +130,11 @@ python split_kernel_module_packages () {
> >
> >          # If autoloading is requested, output /etc/modules-load.d/<nam=
e>.conf and append
> >          # appropriate modprobe commands to the postinst
> > +        autoloadlist =3D (d.getVar("KERNEL_MODULE_AUTOLOAD", True) or =
"").split()
> >          autoload =3D d.getVar('module_autoload_%s' % basename, True)
> >          if autoload:
> > +            bb.error("KERNEL_MODULE_AUTOLOAD has replaced module_autol=
oad_%s, please replace it!" % basename)
> > +        if basename in autoloadlist:
> >              name =3D '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
> >              f =3D open(name, 'w')
> >              for m in autoload.split():
> > @@ -144,12 +147,15 @@ python split_kernel_module_packages () {
> >              d.setVar('pkg_postinst_%s' % pkg, postinst)
> >
> >          # Write out any modconf fragment
> > +        modconflist =3D (d.getVar("KERNEL_MODULE_PROBECONF", True) or =
"").split()
> >          modconf =3D d.getVar('module_conf_%s' % basename, True)
> > -        if modconf:
> > +        if modconf and basename in modconflist:
> >              name =3D '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
> >              f =3D open(name, 'w')
> >              f.write("%s\n" % modconf)
> >              f.close()
> > +        elif modconf:
> > +            bb.error("Please ensure module %s is listed in KERNEL_MODU=
LE_PROBECONF since module_conf_%s is set" % (basename, basename))
> >
> >          files =3D d.getVar('FILES_%s' % pkg, True)
> >          files =3D "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.c=
onf" % (files, basename, basename)
> > @@ -185,3 +191,5 @@ python split_kernel_module_packages () {
> >          if len(os.listdir(dir)) =3D=3D 0:
> >              os.rmdir(dir)
> >  }
> > +
> > +do_package[vardeps] +=3D '${@" ".join(map(lambda s: "module_conf_" + s=
, (d.getVar("KERNEL_MODULE_PROBECONF", True) or "").split()))}'
> >
> >
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--x+RZeZVNR8VILNfK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlObZwYACgkQN1Ujt2V2gByMMQCff+PM/0QurCKj+xyZWKEn3cYk
37YAnjF7Eq9/HmGdIi2A3V75n0CV94PA
=u4Mu
-----END PGP SIGNATURE-----

--x+RZeZVNR8VILNfK--
