Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id B97A76ACB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 09:44:04 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so9538242wiv.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 02:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iqAfBf/bkRAYgKsu73nZL2Q+ozUscI1Pxt644eumAKw=;
	b=umKE1eXvAxvjYYKeWISQ0HWO8sWzMvOfeUPUm89nYiQUvr+swOO4TQn9h1LQOmX+uD
	0tfWv4XIfVY7PjKtHPYLX0JwE4c7wXIG6jJ+bKQK83CaZwpApWpy4gv9pT3LqadMpTsX
	Ut+OkX9Lg1PGs3rIVQUtvGareLFTXYllNXPcpdcZtDy9C73yicDiRxQ7SZP7meM0JFFk
	me3hLfqeG2ikD10aBhbF8B+FphBw/1VtxD63nm8VF7i2IjsqXFPCO/QD8AeaY/WV3pok
	Q5WPjUjn6Ear6PdAK/J7mteohdCg/HWz2TWWpaJ48EzU9zf2yk4JXrw/1JNDI+RRD6wt
	trmg==
X-Received: by 10.194.3.101 with SMTP id b5mr4027631wjb.24.1413279845110;
	Tue, 14 Oct 2014 02:44:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ga7sm15092504wic.5.2014.10.14.02.44.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 02:44:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Oct 2014 11:45:53 +0200
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20141014094553.GL3000@jama>
References: <543965E7.3040806@pabigot.com> <543AED25.7070201@pabigot.com>
	<2427853.ctRZJaqR28@peggleto-mobl5.ger.corp.intel.com>
	<CANyK_8evAyhrmuyHKmk46sfJoF6fwjnF6h9aJoLn4GPGx_Xe1w@mail.gmail.com>
	<20141014094334.GK3000@jama>
MIME-Version: 1.0
In-Reply-To: <20141014094334.GK3000@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: dbus build host uid/gid leaking into target home directory
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
X-List-Received-Date: Tue, 14 Oct 2014 09:44:11 -0000
X-Groupsio-MsgNum: 58598
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKtYx2Ppz7d1tORf"
Content-Disposition: inline

--NKtYx2Ppz7d1tORf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2014 at 11:43:34AM +0200, Martin Jansa wrote:
> On Tue, Oct 14, 2014 at 07:23:52AM +0100, Paul Barker wrote:
> > On 13 October 2014 10:13, Paul Eggleton <paul.eggleton@linux.intel.com>=
 wrote:
> > > On Sunday 12 October 2014 16:05:41 Peter A. Bigot wrote:
> > >> Pilot error.  This ultimately turned out to be a side-effect of the =
way
> > >> I create my image media: I unpacking the rootfs tar file onto a moun=
ted
> > >> sdcard outside the pseudo environment and forgot that tar records
> > >> user/group by name not uid/gid.
> > >
> > > I used to use this method previously, and I guess it can still work i=
f you're
> > > not including certain packages in your image - but I wonder if we sho=
uld note
> > > this potential pitfall somewhere in the documentation. I'm not entire=
ly sure
> > > where such a note would go, though.
> > >
> >=20
> > It probably does need noting somewhere - I've been doing exactly this
> > for the last year or so and never even thought that I might be risking
> > bad uid/gid values. It makes sense now I think about it but it never
> > crossed my mind.
> >=20
> > Looking at 'man tar', there is a '--numeric-owner' option to always
> > use numbers for user/group names. It might just be that we need to
> > recommend using this option when untarring a rootfs onto a mounted
> > volume. This option is present in GNU tar, I'm not sure about other
> > implementations, and I haven't given it a proper test, but it looks
> > like the thing we want.
>=20
> It's not supported in busybox's tar implementation at least wasn't with
> default config last time I've checked couple years ago - we're using it
> since then without any issues.

More info
http://lists.openembedded.org/pipermail/openembedded-core/2011-December/053=
866.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NKtYx2Ppz7d1tORf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ88NEACgkQN1Ujt2V2gBxa6QCfTRJffGs+R2ZR6tv2R3XFUQ8b
xWoAn0nOvG97lBp3yOABvxhaRXFlHeIS
=V5Nr
-----END PGP SIGNATURE-----

--NKtYx2Ppz7d1tORf--
