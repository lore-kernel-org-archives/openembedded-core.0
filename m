Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TPARy-0002YE-Ve
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 13:09:11 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so156303wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 03:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KcEdpedFyhmKWdlL8ytUCYYOhQ4V/JJv2lYH5QoBdj0=;
	b=FDPrRL55H2veizfc7Tml46YWT/Armftanmp7bzikDZ8Af9Mc0JYmIcnBpRfKVjRE8R
	DiqdZr4Uo0ojtlpG9pbSA1HDy9LMFppeoSDzRBfpVU3M474gw4G6knRjgXCjb4iCKodh
	o1zXbMRyKgQ56y74fgdGbwrw2ohX1R7nq7ckiqA6XTzr3Usg0Uu5/FY7+wW1kbepGS3Z
	/F/u4pSJbIrLGjBH+5txHxxalWtNto6HdVvYnHJ09h876S1PEIXtPbJbg7ZwPxc6EGg7
	TPCiMxZ7J7WEG5QqfC0M8FWd15BlB5e3vH+JJ3GpH+Zwpq2hK1TjqUUKAIDNCT9h5MMD
	0ugg==
Received: by 10.180.96.129 with SMTP id ds1mr2300561wib.17.1350644150382;
	Fri, 19 Oct 2012 03:55:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm34201577wiz.3.2012.10.19.03.55.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 03:55:48 -0700 (PDT)
Date: Fri, 19 Oct 2012 12:55:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20121019105559.GJ3087@jama.jama.net>
References: <1350588305-16854-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1350588305-16854-1-git-send-email-sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate: add manifest info for shared file matches
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
X-List-Received-Date: Fri, 19 Oct 2012 11:09:11 -0000
X-Groupsio-MsgNum: 30725
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8jNwmpfkpox/fiJK"
Content-Disposition: inline

--8jNwmpfkpox/fiJK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 12:25:05PM -0700, Saul Wold wrote:
> Present the manifest file that contains the matches for
> files being installed to a location that already contains
> that file. This will help to determine which is the correct
> recipe to fix when this occurs.
>=20
> [YOCTO #3191]

Can we do the same when removing files from sysroot?

To catch errors like this:
http://git.openembedded.org/openembedded-core/commit/?id=3D6b12d4cd39bacb08=
7654b59e25f5052a4e839b26

12:40:15 < JaMa> it depends on order of tasks
12:41:27 < JaMa> gettext-native depends on gettext-minimal-native, so gette=
xt-minimal-native installs own config.rpath to sysroot (when gettext-native=
 "owns"
                 it too)
12:41:55 < JaMa> then gettext-native is built and before populting sysroot =
it removes own files there (including config.rpath)
12:43:45 < JaMa> and because sstate assumes that every file in sysroot is p=
rovided by exactly one recipe, gettext-minimal-native looses his config.rpa=
th
12:44:49 < JaMa> now there is at least warning when 2 recipes are installin=
g the same file to sysroot, but that doesn't resolve this issues when some =
file is
                 "moved" between recipes
12:47:30 < JaMa> because gettext-minimal-native is only recipe installing it
12:47:39 < JaMa> and gettext-native is only removing it

If we check manifests from other recipes before removing files we can show =
warning that
gettext-native is trying to remove config.rpath now provided by gettext-min=
imal-native
and keep config.rpath in sysroot.

Now everybody doing incremental builds needs to call
bitbake -c cleansstate gettext-minimal-native

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8jNwmpfkpox/fiJK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCBMb8ACgkQN1Ujt2V2gBxj2ACfTC9KyOQkgqK3Xe024NZ1Jb1V
gMoAniqoqUMrQ9usmsfuznv+r4damOi0
=jA4I
-----END PGP SIGNATURE-----

--8jNwmpfkpox/fiJK--
