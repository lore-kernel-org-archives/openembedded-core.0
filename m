Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id B2ED46D433
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:37:29 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so733091eak.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 07:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nx+r9JCfyG98HZ5o7/WIqvE7Z7EUDYlDWzTZTW5nmkI=;
	b=jpdRLK0/mx5ZAC9UowCeS0whIf0mQsAPUSVWU3kBvqdsW1JakkKa8X+PjdFWYNr20e
	Iqv92nSPewnv+1kfuhV1BpvdAicC+d7h3a5gYRmDTCKJstj9/ll9HYSAZJN4QzuHH/VQ
	oJK8+uwB67th4e1jJCOijtcAhtVp9OWhUKVCkOhqBtB0gdRcOiBM4nEjxmcMxeMbzIDY
	yaQLOSqN+ZPLNzk+J2wc7DLduJM0hQEmfCOsm2wZqHXahc+i3MYDtMvds+acVHpXbFHC
	qQCOcOJJpPy/RF+6Q+51WwI5ScAqxmXOE/APkngpKPWSWvrZwCwimhqTwxtCjCkCJXFP
	Gi4g==
X-Received: by 10.14.119.136 with SMTP id n8mr2589577eeh.82.1384789050756;
	Mon, 18 Nov 2013 07:37:30 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a51sm38982625eeh.8.2013.11.18.07.37.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 07:37:30 -0800 (PST)
Date: Mon, 18 Nov 2013 16:37:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20131118153730.GD3727@jama>
References: <1384773018.6460.202.camel@ted>
	<CAJTo0LZWNbMFA1ogn2W7dvxtXh31LovO9QbYKcQsGpTR7C6KCg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZWNbMFA1ogn2W7dvxtXh31LovO9QbYKcQsGpTR7C6KCg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: DORA RFC: FILESOVERIDES in dora
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
X-List-Received-Date: Mon, 18 Nov 2013 15:37:30 -0000
X-Groupsio-MsgNum: 47223
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0QFb0wBpEddLcDHQ"
Content-Disposition: inline

--0QFb0wBpEddLcDHQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 11:15:07AM +0000, Burton, Ross wrote:
> On 18 November 2013 11:10, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > a) Revert the change in the branch. Anyone who adapted to the correct
> > behaviour on the branch would need to revert those changes
>=20
> As there hasn't been a .1 of Dora yet this only impacts people who
> have been tracking git, so I think it's probably best to apologise for
> this merge and revert it, on the grounds that it's a serious behaviour
> change.

I agree with Ross, it would be really bad to ask people if they use
dora as 1.5, 1.5.1 or what exact revision between them when debugging
some FILESPATH related issue.

BTW: https://wiki.yoctoproject.org/wiki/Releases still says Dora is in
development, that note should have been dropped when links to 1.6. were
added.

FWIW: I'm not sure if I like reversed for loops, commit says "give the
result the user would expect", maybe I'm just used to old behavior, but
I expect e.g. version specific patches to be preferred over DISTRO specific
patch in "files" directory.

Imagine hypothetical case:

conman_123.bb:file://static-configuration.patch
connman/qemuall/static-configuration.patch  # something qemu specific to ke=
ep NFS root mounted
connman/static-configuration.patch

someone adds new connman with different configuration format
connman_345.bb
connman-345/static-configuration.patch      # new format required for 345 a=
nd we don't need qemuall to override it anymore

With for loops reversed connman_345 will use old connman/qemuall/static-con=
figuration.patch

Someone can show similar case where the reversed order makes sense.

But I think that people will usually notice version change and if needed
update distro/machine specific files to provide their own variant for
new recipe version.

E.g. if connman gets broken between 2 images I'll easily see in
installed-packages.txt that connman was upgraded end quickly find that
our specific .patch file wasn't used anymore. But I won't notice that
someone added new file to qemuall which caused only EXTENDPRAUTO change
and rebuild with different file.

Is it right thing to change behavior people are used to? Especially if
it doesn't fix any real-world issue (Not talking about changed order of
overrides which makes sense to me).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0QFb0wBpEddLcDHQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKKNDoACgkQN1Ujt2V2gBx/TACfeAuzmV7CAf8p5kKGq2EgFrwP
nfMAn20dYTElBt1Z5/5nDadcAO24T/y9
=rNZC
-----END PGP SIGNATURE-----

--0QFb0wBpEddLcDHQ--
