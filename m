Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id C6A376AC24
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 10:08:38 +0000 (UTC)
Received: by widdi4 with SMTP id di4so54004599wid.0
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6prl64BGOaxG9YNG5XQjvc2DYNNc8PithvHVoeXvo0w=;
	b=08s+asAfPO9chUbJltALYBwHOWmZ0luU1fP2DBClscDAojtOlKtIOE6NWIrp7xQI7A
	1TL67YvOKZFqYpiimlvTv+rVecZ/W474jfAoO7Vnlrbzxl8IMfKsiGcJNnZ4gYYN6d+u
	fo2hZ1x9KOVL4zBj86QL5UnwSrrBK7pg0jmCCK4huUpWI85BvBs8KxejIvn2VrtwJGY/
	kIrqzZ+KASugjRPq5VZCwZpq6RXf1BVntcz5syfQFqjT9EQ3MIm7KMxMtrtd9O3Aqaoq
	Jw+ySP2Or6utOv090t/TsmWOK6X4j6BxvQj54ejy43KqBQ7hBc+ZFmQNA4wZKq7mEd0Q
	pFFQ==
X-Received: by 10.194.89.7 with SMTP id bk7mr47179619wjb.127.1429092519000;
	Wed, 15 Apr 2015 03:08:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id ch6sm5302856wjc.3.2015.04.15.03.08.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Apr 2015 03:08:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Apr 2015 12:08:50 +0200
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20150415100850.GA2338@jama>
References: <CAJ86T=Uw=yOfYCmEcx5Ro5of7jKksjxq6WSBOaxPOjMHFp8LoA@mail.gmail.com>
	<CA+chaQfLz-OgjHwce6yoeCQXgMwKEJnuo3ZBThSS=yK7hAXc5Q@mail.gmail.com>
	<CAJ86T=VMoW-hX-Y6xPy835Hfn4W3Wqbn_s+TCYWfHZ42Oc368w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VMoW-hX-Y6xPy835Hfn4W3Wqbn_s+TCYWfHZ42Oc368w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core mailing list <Openembedded-core@lists.openembedded.org>
Subject: Re: autom4te segfault in Dumper.so when configuring intltool
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
X-List-Received-Date: Wed, 15 Apr 2015 10:08:39 -0000
X-Groupsio-MsgNum: 64409
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2015 at 07:05:35PM -0700, Andre McCurdy wrote:
> On Tue, Apr 14, 2015 at 4:39 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Yes, I see it very often since this patch almost 3 years ago:
> > http://lists.openembedded.org/pipermail/openembedded-core/2012-August/0=
66282.html
>=20
> The problem seems to be that autom4te is getting executed by the host
> system's perl but loads Dumper.so from OE sysroot. If the host and OE
> versions of perl are sufficiently different then host perl crashes
> when it tries to execute OE sysroot Dumper.so
>=20
> Manually hacking the first line of autom4te to replace "/usr/bin/perl"
> with the full path to the perl-native binary in OE sysroot makes the
> crashes stop.

Based on RP's reply in the old thread I assume you should rather try to
hack it to load Dumper.so from system, so that there is no dependency
between automake-native and perl-native.

> > On Tue, Apr 14, 2015 at 11:34 PM, Andre McCurdy <armccurdy@gmail.com> w=
rote:
> >>
> >> I'm seeing messages such as the following appear in syslog when
> >> building intltool or intltool-native from fido:
> >>
> >>   [1049484.121948] autom4te[16180]: segfault at 1 ip 00007fea41a7e7fe
> >> sp 00007fff3c666080 error 4 in Dumper.so[7fea41a77000+8000]
> >>   [1049567.199028] autom4te[17012]: segfault at 1 ip 00007f34acc007fe
> >> sp 00007fff5ed84db0 error 4 in Dumper.so[7f34acbf9000+8000]
> >>
> >> The segfault happens reproducibly when configuring intltool or
> >> intltool-native (one segfault every time I run or re-run the
> >> run.do_configure script).
> >>
> >> There are no obvious errors in config.log and the intltool build
> >> succeeds over-all.
> >>
> >> If I hack the intltool run.do_configure script so that the host
> >> machine's perl (v5.18.2) is found instead of perl-native from sysroot
> >> then the segfaults stop.
> >>
> >> Is anyone else seeing the same issue?
> >>
> >> Andre
> >> --
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUuOLIACgkQN1Ujt2V2gBz9TgCdGmIzDI6XsfYZ7iihbeszWcVa
fFkAoKH//+tzcxV7wORER6LRB6+Lrx4d
=B3tZ
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
