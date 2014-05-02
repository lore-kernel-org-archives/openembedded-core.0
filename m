Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id BBE9E6017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 20:11:45 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id 10so3681642lbg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 May 2014 13:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S5BWL4+mybnnmytN7e4Z0Rtn+w/ydFE33POhqjp8uyQ=;
	b=tJ26OdgG4VRFf2YL3E/UnjPisbOT52NSQUHTTlxxgLrNvTP/0n3xE1qNnnnPh0R9xy
	sBWvq4g0FOIqDcD0lYeyNVXtfwj/5EaPdMXBDlY5xkcjDxneEYX/5j2bqtWyOdc1rKsb
	ziJVbZKjAgk5h62zNk2pVziUTWxnkOnCCfdDmoKrenn4pU+0fm82RbPBGAApB+30Cjvv
	VU+Tva5hY9N++CbbsR7EtmVAVR/0vRY8PZExzo2oA7HmKik7oEYPmbl4wnoH47tb+U1u
	8AaZ4TjlrnhlhvzGTJNKj1U/E4S/09xa/H/bShChPjcFmpdkNN0JMOMvnjFJfzcU3v1i
	62sQ==
X-Received: by 10.112.126.7 with SMTP id mu7mr13602225lbb.17.1399061505475;
	Fri, 02 May 2014 13:11:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id x5sm7896lbk.5.2014.05.02.13.11.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 May 2014 13:11:44 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 2 May 2014 22:11:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140502201155.GX2486@jama>
References: <1398963761.12731.1.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1398963761.12731.1.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: My thoughts on the future of OE?
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
X-List-Received-Date: Fri, 02 May 2014 20:11:51 -0000
X-Groupsio-MsgNum: 52761
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4vWhYg7uLB0gjWmL"
Content-Disposition: inline

--4vWhYg7uLB0gjWmL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 01, 2014 at 06:02:41PM +0100, Richard Purdie wrote:
> I was asked what I thought were things that needed discussion at OEDAM.
> Sadly I won't be there but I thought it might help to write down my
> thoughts in a few areas.
>=20
> Developer Workflow
> ------------------
>=20
> Firstly, I think the big piece we need to address as a project is
> "developer workflow" as this is where people are struggling using it.
>=20
> Unfortunately "developer workflow" means different things to different
> people? Which one do I mean then? I actually mean all of them. As some
> examples:
>=20
> -----------------------------------------------------------------------
>=20
> * A kernel developer wanting to rebuild a kernel=20
>   [on/off target, with the ADT/SDK or a recipe]
> * A kernel developer wanting to build a kernel module
>   [on/off target, with the ADT/SDK or a recipe]
> * An application developer wanting to build a single App
>   [on/off target, with the ADT/SDK or a recipe]
> * An application developer wanting to (re)build a library, linking an=20
>   App to it
>   [on/off target, with the ADT/SDK or a recipe]
> * A user wanting to rebuild an image with a package added
>   [on and off target - feeds or a build]
> * A user wanting to rebuild an image with more advanced changes

One more workflow I see quite often and really isn't supported well is:

* An application developer wanting to (re)build just one library and one
  test application, verify on target, iterate as long sa needed and then
  do "clean" build which will rebuild everything depending on it (not
  just the test app)

Real world example is newer eglibc breaking audio from qtmultimedia, so
the test app is depending on all qt* crap which takes forever to build
and every developer change to eglibc will basically trigger rebuild of
everything.

We need an easy way to do such "simplified" builds where you don't care
much about reproducibility. Currently most developers I know will do
devshell/source run.do_foo  for eglibc and the test-app + rsync/scp of thes=
e 2 changed
binaries to your target device to verify if the fix works.

The bitbake -S improvements help to find "why" the build rebuilt so many
components, but doesn't help with preventing it (see=20
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5970


--4vWhYg7uLB0gjWmL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNj/AsACgkQN1Ujt2V2gBxGogCdGRG0XfqZ9s92ZFKWwkHM/1qe
jTcAn0YF2rYcVDoPCoc2qK1kXb8UZ6zq
=BX/i
-----END PGP SIGNATURE-----

--4vWhYg7uLB0gjWmL--
