Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id D4089725D6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 16:50:53 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so7141316wgh.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 08:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vKPIGeApAdXmlwtsWxASD4u0jU3ajnTKq54lcgke5Ds=;
	b=Zh8jxcow4YkPGo8e3RV6idqsF9suRMJAZF9PFjYSewmvd8zmfaTfOldtLSDWkvJ1QN
	uB7cdQbF5COvWb/MnPSS9t8as+IPH70DUQgJnpPtui3UYJPI4yQQ9BrnA5A5Lc9BcyU5
	Pc+ia6XPXuyDUCQB2ZaUPbSQ7P5iOer4fJkMAQdhhohPCoI+v2OZ9AXm3c773BtCIWBn
	eH5b1y6peBDjLawdt0ldxvdq9j6fclxFAm8HmCXQkUS8IZPDlcLzbGmrl4JrqLoIzz7z
	+bp+/O6bC7g+QqXtMkylJseAMm/V41Z1+uAepm4VC+kiIXDTMFAAfmxPxY1lpMI7O+Fd
	A3qg==
X-Received: by 10.194.58.37 with SMTP id n5mr44433890wjq.14.1419267054030;
	Mon, 22 Dec 2014 08:50:54 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n5sm13966780wic.6.2014.12.22.08.50.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Dec 2014 08:50:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Dec 2014 17:50:54 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20141222165054.GE2465@jama>
References: <1418984914.13316.6.camel@linuxfoundation.org>
	<1418992908.13316.14.camel@linuxfoundation.org>
	<54942326.8080806@windriver.com>
	<1418994949.13316.16.camel@linuxfoundation.org>
	<1419074109.13316.31.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1419074109.13316.31.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Merging problems
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
X-List-Received-Date: Mon, 22 Dec 2014 16:51:03 -0000
X-Groupsio-MsgNum: 60769
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+jhVVhN62yS6hEJ8"
Content-Disposition: inline

--+jhVVhN62yS6hEJ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 20, 2014 at 11:15:09AM +0000, Richard Purdie wrote:
> So where are we at?
>=20
> Thanks to some great help from Ross, we have a number of patches merged
> and many of the issues in my last email have been addressed. I'm
> continuing to struggle with the kernel series. The last build on the
> autobuilder highlighted that:
>=20
> * there are problems in boot-directdisk.bbclass (have a fix)
> * there is a do_rootfs/do_package_qa race (have a fix)
> * the report-error.bbclass tasks could crash (have a fix)
> * the kernelmodule sanity tests were failing (have a fix)
> * qemumips gdb is failing to compile, probably due to new kernel=20
>   headers (no fix as yet)
> * systemd sanity QA tests continue to fail on xorg and systemd-login
>   (no fix as yet)
> * there are continuing problems with linux-imx from meta-fsl-arm, I=20
>   thought these were addressed but clearly not :(
>=20
> Ideally I'd like to take some time off over the holidays but I can't see
> that happening until the patch queues are under some kind of control :(.

One of kernel patches merged last weekend seems to be causing all /usr/src/=
kernel
files to be installed in sysroot without sstate knowledge (and possibly
missing when kernel is reused from sstate)

sstate-find-cruft.sh from last world build now reports:

ERROR: 52961 issues were found.
ERROR: Following files are installed in sysroot, but not tracked by
sstate:
qemuarm/usr/src/kernel/.git
qemuarm/usr/src/kernel/.git/HEAD
=2E..
qemuarm/usr/src/kernel/.meta
qemuarm/usr/src/kernel/.meta/cfg
qemuarm/usr/src/kernel/.meta/cfg/kernel-cache
qemuarm/usr/src/kernel/.meta/cfg/kernel-cache/00-README\
=2E..
qemuarm/usr/src/kernel/.scmversion
qemuarm/usr/src/kernel/COPYING
qemuarm/usr/src/kernel/CREDITS
qemuarm/usr/src/kernel/Documentation
=2E..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+jhVVhN62yS6hEJ8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSYS+4ACgkQN1Ujt2V2gBxJMQCbBLykSeWNxA9/bO3NupLemFRk
nQsAnROTv2OzhfmldkgHXLXbKvMVcMm6
=XcHp
-----END PGP SIGNATURE-----

--+jhVVhN62yS6hEJ8--
