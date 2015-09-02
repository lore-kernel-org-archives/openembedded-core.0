Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7558577026
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 18:25:28 +0000 (UTC)
Received: by wibz8 with SMTP id z8so75018626wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 11:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xh5lM6xqpIT2gApNhz4dAwHFfF8wdoapx1xiavDDzOM=;
	b=uTRA1c/rVvenerI3MAqhjLf4HGexIv8NsMHw4a1wqjjCj5aO4J4A1vd0tw7+vQH7vK
	nUmUx1H3gB+VYPZafFuo7W/CYutE5Xq2HywlcSmyJZL2bkAwBqUdo2HphnfUdrBxhSuI
	b5xCHZ7/7N3pb+DHhWb5iBD8IAUtTMof/UfTFoYaAv1NbAAXRkZU3Iq2G2AO4nV9NRCC
	pOVQPkXQSan2Jh5g/RebG8pFFscyy83nDv30YIz20ScMDKdj6RbqQ5FMA8qhfwJA2CQ6
	mwGsb/7MJDtqQmNeaPmtrIVI/6EKamJPtNqNWOyvixpdn8vsVCK460z0kd7JNmeqgSYe
	TT/w==
X-Received: by 10.194.10.165 with SMTP id j5mr44930182wjb.147.1441218327994;
	Wed, 02 Sep 2015 11:25:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lk16sm4855649wic.6.2015.09.02.11.25.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 11:25:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Sep 2015 20:25:48 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150902182548.GG2470@jama>
References: <1441211805-17543-1-git-send-email-alejandro.franco@linux.intel.com>
	<1441216283.24871.78.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1441216283.24871.78.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fix recursive mode -st on BUILDDIR setup
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
X-List-Received-Date: Wed, 02 Sep 2015 18:25:30 -0000
X-Groupsio-MsgNum: 70518
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MrRUTeZlqqNo1jQ9"
Content-Disposition: inline

--MrRUTeZlqqNo1jQ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2015 at 06:51:23PM +0100, Richard Purdie wrote:
> On Wed, 2015-09-02 at 11:36 -0500, Alex Franco wrote:
> > Removing recursive option from chmod -st on BUILDDIR as it would
> > take very long on existing build directories
> >=20
> > [YOCTO 7669]
> >=20
> > Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> > ---
> >  scripts/oe-setup-builddir | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> > index f5b7e4e..44c7dcc 100755
> > --- a/scripts/oe-setup-builddir
> > +++ b/scripts/oe-setup-builddir
> > @@ -24,7 +24,7 @@ if [ -z "$BUILDDIR" ]; then
> >  fi
> > =20
> >  mkdir -p "$BUILDDIR/conf"
> > -chmod -R -st "$BUILDDIR"=20
> > +chmod -st "$BUILDDIR"
>=20
> I think you did this so that conf/ gets the right permissions too.
> Perhaps the best approach is:
>=20
> +chmod -st "$BUILDDIR" $BUILDDIR/conf"

Can we add "|| bbwarn foo"

for cases when it doesn't work for whatever reason or check the
permissions of these 2 dirs before calling chmod?

>=20
> ?
>=20
> Cheers,
>=20
> Richard
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MrRUTeZlqqNo1jQ9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXnPywACgkQN1Ujt2V2gByS/QCeN77bPNtLyV+oX6Wz8i5j7DgX
UrIAnjoE+B97mN73VpOwpjSwd0eHCdxO
=FlfD
-----END PGP SIGNATURE-----

--MrRUTeZlqqNo1jQ9--
