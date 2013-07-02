Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 224366103B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 16:50:26 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z7so2888915eaf.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 09:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FaEKYFP+BQY5iO8E7nvrBbp/QEAiYZ4pzKmcDOwDVeQ=;
	b=Bck/1qnSKt1dwCBj01mb0sEms7QoVYvJHCAdm0wIzB+44wiD30UC5jBna5Ppc3S/2Q
	mhaG5tIK+kvcTa+xv4xe/yOubPsL0yV1FyQbN3tAzqdyKb3wfrEkFEat14Jau6RA2Izn
	JbKV/hEHKWkurMIwtA8gVUMORBLETgAkJQGBpTGTn8E/LNhYezYvo58cghVZhGv+Ta6K
	q4uuazmrHrV4NYoPVnAxEIhVlTXp+Hn9cSSmSwDkpsC6BUHqVg60q+fXc9eLlVmuj5ez
	XEf/A6ZjSH/I8YgEBJIABwL9QGVNlVtkxdJscMjL9EPNTezH2GRXFYPeZ3Z8LG4pAiNG
	D/Xw==
X-Received: by 10.14.7.133 with SMTP id 5mr27259570eep.115.1372783827791;
	Tue, 02 Jul 2013 09:50:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y1sm37643879eew.3.2013.07.02.09.50.26 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 09:50:27 -0700 (PDT)
Date: Tue, 2 Jul 2013 18:50:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130702165027.GB3285@jama>
References: <cover.1372686507.git.laurentiu.palcu@intel.com>
	<b2b193d7632393d1a1ac091ce01eb9d93d44886b.1372686507.git.laurentiu.palcu@intel.com>
	<CAJTo0LZ=m=no=aiTcBqgGM_J0b5t429xkztCO1gkf-z2hC7UPg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ=m=no=aiTcBqgGM_J0b5t429xkztCO1gkf-z2hC7UPg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] xinput-calibrator: move it from meta-oe to oe-core
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
X-List-Received-Date: Tue, 02 Jul 2013 16:50:27 -0000
X-Groupsio-MsgNum: 41316
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline

--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2013 at 04:25:19PM +0100, Burton, Ross wrote:
> On 1 July 2013 14:57, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> > +do_install() {
> > +    # Only install file if it has a contents
> > +    if [ -s ${S}/pointercal.xinput ]; then
> > +        install -d ${D}${sysconfdir}/
> > +        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
> > +    fi
> > +}
>=20
> The file always has content because the file in the main recipe has a
> comment in.  Personally I think not installing a useless file is the
> right thing to do, so we should change the default pointercal.xinput
> to be empty.
>=20
> Relatedly, interestingly Weston has a different approach and attaches
> the calibration to the device using udev properties, which means
> systems where touch devices can be hotplugged actually work.  I'm
> incredibly tempted to extend xinput-calibrator to write out udev
> fragments and make Xi respect them if they exist...
>=20
> > +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> > +inherit autotools systemd
>=20
> systemd?
>=20
> > +RPROVIDES_${PN} +=3D "${PN}-systemd"
> > +RREPLACES_${PN} +=3D "${PN}-systemd"
> > +RCONFLICTS_${PN} +=3D "${PN}-systemd"
>=20
> It doesn't anymore, so these can be dropped.

That means that xinput-calibrator-systemd will stay installed on devices
which already have it.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHTBNMACgkQN1Ujt2V2gBzpbQCgo4D+9mpr/6bUXh8hhTvD0c2x
PPUAmwXkxcsBNlRR3i9On0wcRlBiLXgT
=/6Kd
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
