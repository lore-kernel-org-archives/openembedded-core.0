Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1E3586B96C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 10:48:00 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so144346eek.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=opTaCYkyX/tfWMbTjE9/qpyfTZOLXaf/Kyy3uVC8PGc=;
	b=rSx42N5RjHzLA3CJRpJ/86Hkskby5vVjdn5xWS8Xd4QZsTIVwRZQRx4tC10oO1Oxss
	1oV9S8WPoJADlbNEfSqBMtkMhw8i4azCxAZDyJp86siigj6bL98CG9Ch87xnPHDXStwy
	KSJaN0cpLqbBJU0Wx+MEIAdAmvp7yu7AQ+ozy+TVm5AWPVZnRnf5houOLn6Wy4SHTs78
	jHS8muHp7E5Ww/c8V+aku8kRU5ViSc2VcrzUmQygvi+T1AijaecSXNc/2rTc9CHJ2fnO
	ijzyTSmbqtQcMa9thkRbU0bwZ4ULn8iJOY8K3X8klwBDP0Of3svORUvfELTmXb+QhrQ+
	m82w==
X-Received: by 10.15.54.72 with SMTP id s48mr3691014eew.58.1377773281174;
	Thu, 29 Aug 2013 03:48:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm45033167eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 03:48:00 -0700 (PDT)
Date: Thu, 29 Aug 2013 12:49:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130829104913.GM3544@jama>
References: <alpine.DEB.2.02.1308290628130.4283@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1308290628130.4283@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: appears to be inconsistency re: base-files between oe-core and meta-angstrom
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
X-List-Received-Date: Thu, 29 Aug 2013 10:48:02 -0000
X-Groupsio-MsgNum: 44234
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m8OSOHsVCl6s45tG"
Content-Disposition: inline

--m8OSOHsVCl6s45tG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2013 at 06:29:17AM -0400, Robert P. J. Day wrote:
>=20
>   trying to build a "hardware-bringup-image" defined in angstrom layer
> and running into:
>=20
> ERROR: QA Issue: Fixup Perms: Unable to correct directory link, target al=
ready exists: /var/log -> /var/volatile/log
> ERROR: QA Issue: Fixup Perms: Unable to correct directory link, target al=
ready exists: /var/run -> /run
> ERROR: QA Issue: Fixup Perms: Unable to correct directory link, target al=
ready exists: /var/tmp -> /var/volatile/tmp
>=20
> this would *appear* to be because oe-core defines, in
> base-files_3.0.14.bb:
>=20
> volatiles =3D "log tmp"
> ... snip ...
>         for d in ${volatiles}; do
>                 ln -sf volatile/$d ${D}${localstatedir}/$d
>         done
>         ln -snf ../run ${D}${localstatedir}/run
>         ln -snf ../run/lock ${D}${localstatedir}/lock
>=20
> which seems to want to create /var/{run,log,tmp} as symlinks, but over
> in meta-angstrom, we have base-files_3.0.14.bbappend which seems to
> want to create them as actual directories instead:

Expectations from base-files .bbappend and FILESYSTEM_PERMS_TABLES need
to be consistent, is it possible that you're using .bbappend from
angstrom and not FILESYSTEM_PERMS_TABLES set by angstrom config?

conf/distro/include/angstrom-core-tweaks.inc:FILESYSTEM_PERMS_TABLES =3D "f=
s-perms-angstrom.txt"

>=20
> dirs755 +=3D "${localstatedir}/cache \
>             ${localstatedir}/run \
>             ${localstatedir}/log \
>             ${localstatedir}/lock \
>             ${localstatedir}/lock/subsys \
>             ${localstatedir}/tmp \
>             ${localstatedir}/volatile/tmp \
>             /run \
>            "
>=20
> or am i misreading something?
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--m8OSOHsVCl6s45tG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIfJykACgkQN1Ujt2V2gBxxLgCfUM9t7GxSk3Yas/sktfS+M5wx
Y38AnRT7B16+GOsYKfcT8iUhMg1kQ6mA
=UTn5
-----END PGP SIGNATURE-----

--m8OSOHsVCl6s45tG--
