Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW6Sw-0006w5-V2
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 14:14:19 +0100
Received: by bkbzv15 with SMTP id zv15so1662629bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 05:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7nndFz389T2++E1TUs7bhQfWNIPTAJwOBZfavqH8zDg=;
	b=taUkdmHmPJmqFISsTaBKGZLw2cJ7AGcLCOm/GLKugIJkGCRrCocOVy+fub/MENtI9H
	QGYl2ezOciAU9GsvyOhE+h9wHll3DeNOTq/q5K8J7TrF51ZajTNLzQby7536JI84f+ZV
	cn1hgjI34Q1Roux1Av/8egmPqJg5K2NVoa9D4=
Received: by 10.204.130.90 with SMTP id r26mr7480369bks.46.1322744857076;
	Thu, 01 Dec 2011 05:07:37 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id jf4sm11245730bkc.5.2011.12.01.05.07.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 05:07:36 -0800 (PST)
Date: Thu, 1 Dec 2011 14:07:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111201130733.GF19917@jama.jama.net>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net>
	<1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Thu, 01 Dec 2011 13:14:19 -0000
X-Groupsio-MsgNum: 13441
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Ow488MNN9B9o/ov"
Content-Disposition: inline

--1Ow488MNN9B9o/ov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2011 at 10:59:03AM -0200, Otavio Salvador wrote:
> On Thu, Dec 1, 2011 at 10:37, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>=20
> > On Thu, 2011-12-01 at 13:24 +0100, Martin Jansa wrote:
> > > A while back I've proposed to make .bbappend without corresponding .bb
> > > only big fat warning, but not fatal to parse. Now you cannot even bui=
ld
> > > eglibc if there is libdrm bbappend you don't care at all about..
> >
> > You can do this by setting:
> >
> > BB_DANGLINGAPPENDS_WARNONLY
> >
>=20
> This is even worse; you end up with a package without the changes done on
> the bbappend and as most bbappend files do not change PR, adding it later
> won't force a package update.

If we find a way to allow PRINC in multiple bbappends for same .bb then
we can say that every .bbappend should use PRINC.

For record I'll include my discussion about PRINC with RP and kergoth:
10:47 < JaMa> RP__: is there any way to improve PRINC concept to allow mult=
iple increments for same recipe while parsing multiple layers?
10:48 < RP__> JaMa: PRINC_append =3D ".1" ?
10:49 < JaMa> RP__: ie when meta-openmoko sets PRINC =3D "1" and meta-shr s=
ets PRINC =3D "2" then if you're unlucky meta-openmoko is parsed later and =
bumping PRINC in meta-shr won't help
10:49 < RP__> JaMa: I wonder if you could do PRINC :=3D "${PRINC + 1}"
10:50 < JaMa> and do we have default PRINC =3D 0 somewhere?
10:50 < RP__> JaMa: you might need to add that
10:50 < JaMa> ok, I'll try this, thanks
10:51 < JaMa> currently I'm moving PRINC only to meta-shr layer.. but that =
breaks stuff if someone is using any BSP layer from meta-smartphone..

14:53 < JaMa> RP__: btw that PRINC trick didn't work (int type didn't like =
expresion :/)
15:13 < RP__> JaMa: ah, try PRINC :=3D "${int(PRINC) + 1}"
15:21 < JaMa> RP__: still ValueError: invalid literal for int() with base 1=
0: '${int(PRINC) + 1}'
15:21 < JaMa> with added PRINC :=3D 0 to bitbake.conf
15:22 < RP__> PRINC :=3D "${int(d.getVar(PRINC)) + 1}" ? :/
15:22 < JaMa> whole log http://paste.pocoo.org/show/514437/
15:22  * RP__ was trying to be too clever I suspect
15:23 < JaMa> ValueError: invalid literal for int() with base 10: '${int(d.=
getVar(PRINC)) + 1}'
15:41 < kergoth> PRINC is unquoted there, so it tries to get a value for a =
key of None
16:24 < RP__> kergoth: right, trying to do too many things at once :/
16:24 < RP__> kergoth: any thoughts on that knotty change to add the footer?
17:05 < JaMa> kergoth: something like this? ValueError: invalid literal for=
 int() with base 10: "${int(d.getVar('PRINC')) + 1}"

Maybe someone else has better idea?

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1Ow488MNN9B9o/ov
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7XfBUACgkQN1Ujt2V2gBwsXgCgrIBVUJ1GYupBAf0C+8pfrwmu
LyIAni7FmSMnu+X0Vf2WCo4Cft7I/03f
=6bFn
-----END PGP SIGNATURE-----

--1Ow488MNN9B9o/ov--
