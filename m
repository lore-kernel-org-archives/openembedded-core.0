Received: from mail-yh0-f43.google.com ([209.85.213.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFm6I-0001y4-8n
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 14:52:42 +0100
Received: by mail-yh0-f43.google.com with SMTP id z6so159416yhz.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=gxY95/CNLvZjjrNDirzQ2TOgW20Epu1zBZmPV+DEgVU=;
	b=tSzRRAhymDqyePoGObsGWle0tAV+49Ql2nGC6MB3TgxI11+/Se19sje2pNMXcTcc+Y
	cRwF+EAp7uzDmLnRq8rSBl/sDGPLEqHwjMUiyBvnUrYCNTKq5LExs2iULsRpwUNlrr+r
	hRLAAEQsiFTGi+09BRR4O0pdwNodKb2MAQLstx9IFSXNSVJQEMvWzixLWcIj/I8Gz3Xa
	mz8aSRZs3fcxKYDiHlD/6eB0kZWN2S1UT7+skAc1BMghk3spd//yY+N6c2COYq5gMYTE
	HJFvuXK6zSiwViQBOphNalPcj+h+XMjMNO5z+NiFDd+cwtjnTZQdWrho0IT21hCLd9xN
	PNZQ==
X-Received: by 10.236.128.42 with SMTP id e30mr15551433yhi.7.1363181733123;
	Wed, 13 Mar 2013 06:35:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id j23sm22891322yha.3.2013.03.13.06.35.30
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 06:35:31 -0700 (PDT)
Date: Wed, 13 Mar 2013 14:35:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20130313133524.GH3260@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: update-alternatives automatic rename happens too late
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
X-List-Received-Date: Wed, 13 Mar 2013 13:52:44 -0000
X-Groupsio-MsgNum: 36568
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgApRN/oydYDdnYz"
Content-Disposition: inline

--OgApRN/oydYDdnYz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

When using update-alternatives feature to rename targets to
target.${BPN} it happens in perform_packagecopy, but for recipes where
that target is also staged to sysroot it's too late, both recipes will
try to install the same target file to sysroot.

One way to resolve this is to rename target to target.${BPN} directly in
recipe's do_install, but can we move this automatic renaming to
do_install? More importantly do we have some examples where we need to
run u-a for files in sysroot (e.g. when unpacking archive from
sstate-cache)?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OgApRN/oydYDdnYz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAgJwACgkQN1Ujt2V2gBxx8ACaAzpVmPc5G30Bn892bltyDZdZ
6jQAnjiqFQ2QGj2c4MZeIQj/IFHxGiXg
=PDka
-----END PGP SIGNATURE-----

--OgApRN/oydYDdnYz--
