Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgGSF-0006ZT-41
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 16:00:08 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2915041eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 06:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4Ami2BmAg1kRVURonjYY/g2B99tGKo90nkRqA5bLoFA=;
	b=bAKnnnD0ZCCoT5XiBlsW64hYZE3SzwWPhno9E1icC116UGpWnG5kI7Hc8DDATg97A4
	rX39HaySV6a2jQTY8EurqMvjtduFqHMz9qf8cSnoZREbXhboYwAMPhtuK4WeSU65iE0k
	QR0qQdJBmW/GTVgk2/BWJQfNaOXuPmX9fA6ykHV7q8GIZbQAcx6so/8R4OalOGRFKt7q
	kTc+6hJxf03+2SK+09EFtg9b3tXw0Isx804JHnxCPlnSHXighDgkmCBtkY64DJM0l+Sk
	ooOEpRXP31VcPNhfFH6uW5ffDKEj3hwWxAcbUbLdu1xQTzjhuEpNXb9qXGFNMwLSrNXg
	m9yg==
Received: by 10.14.178.196 with SMTP id f44mr61636522eem.14.1354718743013;
	Wed, 05 Dec 2012 06:45:43 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm9584564eeo.8.2012.12.05.06.45.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 06:45:42 -0800 (PST)
Date: Wed, 5 Dec 2012 15:45:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121205144539.GA3396@jama.jama.net>
References: <1354716839.25268.105.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1354716839.25268.105.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Switch to PR server model for PR bumps - 1 week
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
X-List-Received-Date: Wed, 05 Dec 2012 15:00:08 -0000
X-Groupsio-MsgNum: 32258
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2012 at 02:13:59PM +0000, Richard Purdie wrote:
> I've made it clear we want and need to switch to the PR service for
> handling PR bumps. I'd now like to put a deadline in place for doing
> this, namely that I'm going to stop requiring PR bumps in patches as of
> 1 week's time. The TSC did discuss this and our conclusion was that we
> need to switch early in this release cycle to give time for any issues
> to get resolved. Now is a good time to do this as I think we're ready.
>=20
> There were a number of open bugs related to the PR service[1]. We've
> looked through them and they are now resolved with the exception of one
> related to the incremental git PV issue for which we have a plan in
> place and patches ready.
>=20
> We've taken on board feedback about documentation and the following wiki
> page has been setup which details the current situation:
>=20
> https://wiki.yoctoproject.org/wiki/PR_Service
>=20
> I appreciate this is going to be a disruptive change for some but I
> believe it is in the best interests of the project longer term and that
> we will have a better system as an end result of this. If people do run
> into problems, please send email or file bugs. I'm trying to ensure
> there are some people with time available to look into these issues as a
> priority so we can make a smooth transition.

After reading this wiki page I have few questions (I admit I haven't
tried it yet).

1) How do you limit access to shared prserv instance?
   Can you define some group as RO, some RW?
   For RO access it would be great to export state from remote PRSERV=20
   on first connection and then continue to increment locally (with
   PRSERV running on localhost)
2) If you have slightly different builder (e.g. someone with extra BSP
   or different host distro), then he will have different checksums, so
   different AUTOPR values and you cannot share binary feed with such
   builder, right? I know this wasn't possible (or at least safe) to use
   before too. But it should be more clear from documentation.
3) Is it possible to use OEBasic together with PRSERV or should bitbake
   show fatal error when PRSERV is used toghether with OEBasic?
4) Is there plan to import current PR values from recipes, so that
   bitbake can parse all enabled layers, gather checksum-PR values and
   export it for bitbake-prserv-tool to import it as inital state?
5) Is there plan to remove PR from all recipes or are they ignored with
   PRSERV in use and can stay in for some time? If there is functionality=
=20
   for 4) then we should tag all layers just before PR/PRINC are removed,=
=20
   so someone can create own initial export from last known PR state.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC/XhMACgkQN1Ujt2V2gBw/NwCgi8reC5eNISKH/lDblZML/J7g
kTkAn0nfvveCJlKIwAPlQmXSG765NVhb
=syCd
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
