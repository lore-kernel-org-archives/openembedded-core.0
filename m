Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id ED2956ACB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 09:41:45 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id l18so10422605wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 02:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=N8R4vRZyX9Rqn2By8spqZ4HTZo78xmy4NG/GWF5WUH0=;
	b=bmUv6xNw62WEtRAVnhozGGVC6Qf7s0xYav/EFv7amZdb8hwHaxW10tpcnMxpt/yUkI
	CoEuu53VhydYu5+UMTaDX8vPMWEc1mbbKkncFtswEnXYNvWxWYcTJ6VZD6qVYYFfDDKc
	XsSXzdH8S9S6+Vt+8ER/pwCUkdcn9FaTyTCeVZMJYg8QgoMKqIl2kfR0D1+V3+o91AyD
	Mz104JO0SdNul8s627dkSDf/OWSrLcm/Y+JIeLsWn9V9EpA42M6tMNgny4Et15iI1ZGq
	e8hDBOvpCtBqRGxtM++kIgG7gnulcxQp3VndC/Zk3lmuy113ETVtp3IlDBClOpUGlLzS
	4xyg==
X-Received: by 10.194.61.164 with SMTP id q4mr3960380wjr.60.1413279706404;
	Tue, 14 Oct 2014 02:41:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bq8sm9255683wjb.6.2014.10.14.02.41.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 02:41:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Oct 2014 11:43:34 +0200
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20141014094334.GK3000@jama>
References: <543965E7.3040806@pabigot.com> <543AED25.7070201@pabigot.com>
	<2427853.ctRZJaqR28@peggleto-mobl5.ger.corp.intel.com>
	<CANyK_8evAyhrmuyHKmk46sfJoF6fwjnF6h9aJoLn4GPGx_Xe1w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8evAyhrmuyHKmk46sfJoF6fwjnF6h9aJoLn4GPGx_Xe1w@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Oct 2014 09:41:46 -0000
X-Groupsio-MsgNum: 58597
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FX+Db2fp7WJhXKrW"
Content-Disposition: inline

--FX+Db2fp7WJhXKrW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2014 at 07:23:52AM +0100, Paul Barker wrote:
> On 13 October 2014 10:13, Paul Eggleton <paul.eggleton@linux.intel.com> w=
rote:
> > On Sunday 12 October 2014 16:05:41 Peter A. Bigot wrote:
> >> Pilot error.  This ultimately turned out to be a side-effect of the way
> >> I create my image media: I unpacking the rootfs tar file onto a mounted
> >> sdcard outside the pseudo environment and forgot that tar records
> >> user/group by name not uid/gid.
> >
> > I used to use this method previously, and I guess it can still work if =
you're
> > not including certain packages in your image - but I wonder if we shoul=
d note
> > this potential pitfall somewhere in the documentation. I'm not entirely=
 sure
> > where such a note would go, though.
> >
>=20
> It probably does need noting somewhere - I've been doing exactly this
> for the last year or so and never even thought that I might be risking
> bad uid/gid values. It makes sense now I think about it but it never
> crossed my mind.
>=20
> Looking at 'man tar', there is a '--numeric-owner' option to always
> use numbers for user/group names. It might just be that we need to
> recommend using this option when untarring a rootfs onto a mounted
> volume. This option is present in GNU tar, I'm not sure about other
> implementations, and I haven't given it a proper test, but it looks
> like the thing we want.

It's not supported in busybox's tar implementation at least wasn't with
default config last time I've checked couple years ago - we're using it
since then without any issues.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FX+Db2fp7WJhXKrW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ88EYACgkQN1Ujt2V2gBwZ+wCfTCbl0WbvsrrLcQEv9OqFl+ax
Eg0AoLSJdh+ege5GSXEWSE6OLRR7/BBs
=rtzC
-----END PGP SIGNATURE-----

--FX+Db2fp7WJhXKrW--
