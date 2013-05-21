Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 91C6B60655
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 22:16:21 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id rp8so1050473pbb.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 15:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1FYz5gfpGZwdz35l2vzVvRvjy87rQD/9Wa4GRLMesCc=;
	b=HwhCF0eSKQfV8PSVscbJGSR7fIiOcBMLTWXdSn8JQLADNcsWUKqD6D7wkX7qVY/kqG
	lUVCzqxhc9KoZiYnT8Xq1wDb12U4CI+dzyORuA+I/onPQMuNcoihxemZSWaA45yuxH6s
	hk+5qwaEci4ByzVtpZ/eOTMbaC5QsisikOvotJu6i4fn2YVbiWWxqmI2P4rN+8FPM2b6
	bQsjs6slVrMFZ5WN7wTWv2n6WVp7oI8nWdMn7BypMK2A6tqDMfB2UWnSU1MJYhqdhg9f
	qvU6maoZvdNKeMiqEWQBlORDHoy8iwA2r0TGXz2A1JRUO16O79PxwlNEyRh4arm+B0O0
	+j/g==
X-Received: by 10.68.180.4 with SMTP id dk4mr4780028pbc.104.1369174581392;
	Tue, 21 May 2013 15:16:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	10sm4235821pbr.45.2013.05.21.15.16.19 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 21 May 2013 15:16:20 -0700 (PDT)
Date: Wed, 22 May 2013 00:16:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20130521221615.GG32431@jama>
References: <1369150787-21878-1-git-send-email-Martin.Jansa@gmail.com>
	<519BE69F.9060606@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <519BE69F.9060606@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: Remove unnecessary cd and rm
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
X-List-Received-Date: Tue, 21 May 2013 22:16:21 -0000
X-Groupsio-MsgNum: 39555
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f5QefDQHtn8hx44O"
Content-Disposition: inline

--f5QefDQHtn8hx44O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2013 at 02:26:55PM -0700, Darren Hart wrote:
> Please include a a comment. The burden is on the submitter to prove
> the cd and the rm are unnecessary, not the reviewer.
>=20
>=20
> On 05/21/2013 08:39 AM, Martin Jansa wrote:
> > ---
> >  meta/classes/kernel.bbclass | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 3320747..47a96c5 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -378,13 +378,10 @@ kernel_do_deploy() {
> >  		ln -sf ${MODULE_TARBALL_BASE_NAME}.bin ${MODULE_TARBALL_SYMLINK_NAME}
> >  	fi
> > =20
> > -	cd ${DEPLOYDIR}
> > -	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
> > -	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
> > -	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
> > +	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGE_SYML=
INK_NAME}.bin
> > +	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
>=20
> So we are now in a different directory (do we know which one?) but the
> source of the ln commands doesn't change. If we are in the same
> directory, then why add DEPLOYDIR to the destination?

yes we know which one - ${B} as defined in deploy.bbclass:
do_deploy[dirs] =3D "${DEPLOYDIR} ${B}", and the same is defined again (may=
be unnecessary) in
kernel.bbclass

DEPLOYDIR is defined in deploy.bbclass as well
DEPLOYDIR =3D "${WORKDIR}/deploy-${PN}"

DEPLOYDIR is used as target for every other file deployed by do_deploy,
this was just unnecessary switching CWD to create relative symlink and I
have no idea why rm -f was used together with ln -sf.

I'll send v2, because
ln -sf ${MODULE_TARBALL_BASE_NAME}.bin ${MODULE_TARBALL_SYMLINK_NAME}
is wrong.

See related
http://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bb=
class?id=3Dfd5d80ab1a405cb4ef94f2cde25f8c251da490f0

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f5QefDQHtn8hx44O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGb8i8ACgkQN1Ujt2V2gBw3xwCgjAVc+QPzV32vhp8e9j0TqiTH
BrYAnjzss4K2CW+4u8Wp9d4qQDV/aVNc
=bUJW
-----END PGP SIGNATURE-----

--f5QefDQHtn8hx44O--
