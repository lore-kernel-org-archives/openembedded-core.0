Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id A6E8E76FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 21:42:38 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so2573619wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 14:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ojvkVdhKeivNic0LbwHLZ95/kJx2P9Ui0lEL91Fp8v0=;
	b=Pcosa7ZYDHqV+LD9Jx3nwudrPi1GxBUSCniDC5lG4bi6Z9k26VxzVTIOWZyZp5A0b9
	iqRo5NbFpkjfYYTlaiKFz3Y9jQazTea0mypfSrx/98yfDtxIQx9mAQHye3g3KbXUlhID
	L3d7Q+RdQCCKKSA5Iy1MJiWAsQWHQkvfTBdlggBAprD5Rz7DWEGh5OIAnJ185jXilnVV
	Ws0Bin5GEQPgymqfvw+9nXW0vw6UMrrvPI1lEGhlurZPYpZbnboz7WhuR+BDcfVpCxrK
	f2GN53ALS1bavO2M63oit7HsDpgETOmGt6XoNgpjrGG/SY8u1juFWux2cCx1KQpN9YGb
	rwGA==
X-Received: by 10.180.84.72 with SMTP id w8mr590956wiy.71.1441316558686;
	Thu, 03 Sep 2015 14:42:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	sd14sm224159wjb.36.2015.09.03.14.42.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Sep 2015 14:42:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 3 Sep 2015 23:43:04 +0200
To: Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <20150903214304.GA2456@jama>
References: <1441211805-17543-1-git-send-email-alejandro.franco@linux.intel.com>
	<1441216283.24871.78.camel@linuxfoundation.org>
	<20150902182548.GG2470@jama> <55E769B4.4050800@linux.intel.com>
	<CA+chaQddNikh4vveg30U8WVYG5XcpewM9OHrgahzr_qTHSF+pw@mail.gmail.com>
	<55E8A710.6050003@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <55E8A710.6050003@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 03 Sep 2015 21:42:40 -0000
X-Groupsio-MsgNum: 70618
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2015 at 03:01:20PM -0500, Alex Franco wrote:
> Hello Martin, so the error you are seeing is related to the chmodding=20
> being done in sanity.bbclass, not the chmodding taking place in=20
> oe-setup-builddir. I am adding a catch and a warning for that, as I=20
> reproduce your setup so I can also reproduce the OSError.

Thanks.

My point was that even when such setup isn't safe from reasons other
people mentioned, the sanity.bbclass shouldn't fail with OSError
exception.

And as the issue isn't fatal for the build (I was using setup like this
for very long time and haven't noticed host-permissions-contamination
=66rom this yet), then I would prefer just bbwarn instead of bbfatal - in
both cases is should show clear message what's wrong and what user
should do about it instead of OSError and user having to read
sanity.bbclass to see what and why failed.

Regards,

> Alex
>=20
> On 09/02/2015 07:57 PM, Martin Jansa wrote:
> > Warning informing that chmod failed is better than fatal error=20
> > preventing me to build anything in that setup with tmpfs.
> >
> > On Wed, Sep 2, 2015 at 11:27 PM, Alex Franco=20
> > <alejandro.franco@linux.intel.com=20
> > <mailto:alejandro.franco@linux.intel.com>> wrote:
> >
> >     Checking may be the better approach, as warning here would do
> >     little more than what the current failure does (informing that
> >     chmod failed)
> >
> >     Alex Franco
> >
> >
> >     On 09/02/2015 01:25 PM, Martin Jansa wrote:
> >
> >         On Wed, Sep 02, 2015 at 06:51:23PM +0100, Richard Purdie wrote:
> >
> >             On Wed, 2015-09-02 at 11:36 -0500, Alex Franco wrote:
> >
> >                 Removing recursive option from chmod -st on BUILDDIR
> >                 as it would
> >                 take very long on existing build directories
> >
> >                 [YOCTO 7669]
> >
> >                 Signed-off-by: Alex Franco
> >                 <alejandro.franco@linux.intel.com
> >                 <mailto:alejandro.franco@linux.intel.com>>
> >                 ---
> >                   scripts/oe-setup-builddir | 2 +-
> >                   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >                 diff --git a/scripts/oe-setup-builddir
> >                 b/scripts/oe-setup-builddir
> >                 index f5b7e4e..44c7dcc 100755
> >                 --- a/scripts/oe-setup-builddir
> >                 +++ b/scripts/oe-setup-builddir
> >                 @@ -24,7 +24,7 @@ if [ -z "$BUILDDIR" ]; then
> >                   fi
> >                     mkdir -p "$BUILDDIR/conf"
> >                 -chmod -R -st "$BUILDDIR"
> >                 +chmod -st "$BUILDDIR"
> >
> >             I think you did this so that conf/ gets the right
> >             permissions too.
> >             Perhaps the best approach is:
> >
> >             +chmod -st "$BUILDDIR" $BUILDDIR/conf"
> >
> >         Can we add "|| bbwarn foo"
> >
> >         for cases when it doesn't work for whatever reason or check the
> >         permissions of these 2 dirs before calling chmod?
> >
> >             ?
> >
> >             Cheers,
> >
> >             Richard
> >
> >             --=20
> >             _______________________________________________
> >             Openembedded-core mailing list
> >             Openembedded-core@lists.openembedded.org
> >             <mailto:Openembedded-core@lists.openembedded.org>
> >             http://lists.openembedded.org/mailman/listinfo/openembedded=
-core
> >
> >
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXordkACgkQN1Ujt2V2gBxLawCeJZCLV7UT6nVjiX0AQbp93peM
LgEAn0p5wKuu6LHfyJf8bWyeOWqjgdWg
=0MBM
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
