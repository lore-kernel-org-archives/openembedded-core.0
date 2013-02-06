Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U313d-0007Qt-Pa
	for Openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 10:12:46 +0100
Received: by mail-da0-f46.google.com with SMTP id p5so526500dak.19
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2013 00:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=6pF9qX0pxOHolBlZG+spO/GzJqWZ0uMvXXRFFVuhgHM=;
	b=DkBO08CgVBUAUzc3ZaeGQTtWKIS/O52yr6APIRW7bQT3k+jdViBxrum7DejBQbSnq6
	MDTGBxJEkGkeEa8jdVY6dY2qpM+98VsBm9ridPhJ+EAB6bOKUZ509niBpjv9lOzUwBu+
	8hUOV31+WS30I27URhOlUbVbh1enjZ3rBwdN+C27jUjXBZTo/rPreMhhhdCdj0IdkJac
	0E6S32QsTV5y9c2jKIBbVPE6Q9jJnxR/qz+440oW1VzaV+ih4tO7UV8ed5I07HjgVAMn
	j4qX9DLJQAYYT/ZXPq9Sw5D8IuqXHmgXyxLjaob10cl983tzWhCHjxFD9+HeFjPNofzT
	dhyw==
X-Received: by 10.66.83.136 with SMTP id q8mr73446063pay.83.1360141013850;
	Wed, 06 Feb 2013 00:56:53 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d1sm36117525pav.6.2013.02.06.00.56.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 00:56:52 -0800 (PST)
Date: Wed, 6 Feb 2013 09:56:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130206085644.GR3271@jama>
References: <8F29D6B095ED194EA1980491A5E029710C38764C@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C38764C@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Multiple MACHINE building is broken in OE-core?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 09:12:48 -0000
X-Groupsio-MsgNum: 35088
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GYaKytDE8aa4+VVK"
Content-Disposition: inline

--GYaKytDE8aa4+VVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 08:02:31AM +0000, Cooper Jr., Franklin wrote:
> Hi Everyone,
>=20
> While performing denzil to danny work I ran into this same issue that Mik=
e mentioned. I have 4 machines that are armv7a based and previously in denz=
il only very specific recipes that I deliberately made machine specific wer=
e being rebuilt. Now a significant amount of recipes are being unnecessaril=
y rebuilt. I first noticed this when building Qt but this also occurs with =
something even simpler such as tslib. If I look at tslib's temp directory I=
 end up seeing multiple logs for the majority of the tasks. For example I w=
ill see 4 log.do_compile logs.
>=20
> I ran the sstate-diff-machines.sh script that Martin mentioned for machin=
es defined in meta-ti and I got the below output when using tslib as the -t=
argets:
>=20
> list.M am3517-evm
>=20
> http://pastebin.com/zMH8PkmP
>=20
> list.M am335x-evm
> http://pastebin.com/6jbP6guA
>=20
> The checksums differs for non-native recipes such as gettext, tslib and z=
lib.
>=20
> If it matters I am using the 1.17.0 branch of bitbake since the master br=
anch throws parsing errors.
>=20
> Any suggestions on what could be the issue?

Please pick something like tslib or gettext. Find first different
checksum (do_configure is usually good for that).

# Then to compare sigdata use something like:
# $ ls sstate-diff/134934*/*/*/tslib/*do_configure*sigdata*
# it should return 2 different sigdata with 2 different sstate
# checksums, otherwise change ls expression

# $ bitbake-diffsigs sstate-diff/134934*/*/*/tslib/*do_configure*sigdata*

It will probably show some other recipe causing the difference, so just
repeat ls, bitbake-diffsigs until you find the root cause.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GYaKytDE8aa4+VVK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlESGswACgkQN1Ujt2V2gBzobACfcMcr2bjnpem0+a2Tao0xKpCn
DVsAoJMD18KRDDGIkNzpW3L247q2rQfG
=VeOA
-----END PGP SIGNATURE-----

--GYaKytDE8aa4+VVK--
