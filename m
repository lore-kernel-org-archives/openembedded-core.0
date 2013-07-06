Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id DAAD76AF03
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 23:08:33 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id j14so2153103eak.22
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 16:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vb7qeuYGv/+ZyFMSofe70HSjbkjHDneLVJVRM4hSGOo=;
	b=okf3iCHI40f0P8vnMz9CibmeI/9O0ALCZUZfqTRPjmtwKcr7P+Vii2gsc4rEYTz0j2
	N2EXp2m5sziIvhZwBlhV8Cfz8XFQcz13D1N+RTyai7SH0w6BIaGKcL8v118q6HkFtsfK
	myCvOquKFd6Hpxr7lzhtWZJxcqOvY2aBzRwEuu4k3sORdUsHJu4CM5NwSGn6ehIwKXwj
	rKTwCWwlR+x6Bl2Z/eLrau1O3iRuemV0kqJcbJZiEgkMRhUD9HOv0LlNx7Qo/eW6mRkY
	qiegrU8xCuVl/blJ19/vlsMi85eNSB+xWdmsjp6/Wv9dDUJK3Wf2FFFYcmcJW48iME8P
	J8cQ==
X-Received: by 10.14.6.198 with SMTP id 46mr6935824een.121.1373152113708;
	Sat, 06 Jul 2013 16:08:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i2sm27818603eeu.4.2013.07.06.16.08.32 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 16:08:33 -0700 (PDT)
Date: Sun, 7 Jul 2013 01:08:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20130706230840.GE3288@jama>
References: <20130705224311.GA3288@jama>
	<1373099962-19854-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZANmrjid3veZXwq_jh24qDaXBjhf3MvNV5yY+6eCg+Gr5Aw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANmrjid3veZXwq_jh24qDaXBjhf3MvNV5yY+6eCg+Gr5Aw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] eglibc-locale: add missing dependency on virtual/${TARGET_PREFIX}binutils
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
X-List-Received-Date: Sat, 06 Jul 2013 23:08:34 -0000
X-Groupsio-MsgNum: 41555
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X3gaHHMYHkYqP6yf"
Content-Disposition: inline

--X3gaHHMYHkYqP6yf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2013 at 03:56:59PM -0700, Chris Larson wrote:
> On Sat, Jul 6, 2013 at 1:39 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>=20
> > * eglibc-collateral.inc inhibits all default deps, but do_package needs
> >   objcopy:
> >   ERROR: objcopy failed with exit code 127 (cmd was
> >   'i586-webos-linux-objcopy' --only-keep-debug
> >   'eglibc-locale/2.17-r0/package/usr/lib/gconv/IBM1166.so'
> >   'eglibc-locale/2.17-r0/package/usr/lib/gconv/.debug/IBM1166.so')
> >   ERROR: Function failed: split_and_strip_files
> >
>=20
> Wouldn't it be better to add the necessary dep to the do_package[depends]
> in package.bbclass?

In this case yes, but what about allarch recipes, creating
binutils-cross dependency in their do_package task would probably make
their stamps depending on architecture.

I have similar patch adding virtual/${TARGET_PREFIX}binutils in
BASEDEPENDS, that won't fix this eglibc-locale (because it has
INHIBIT_DEFAULT_DEPS), but it's needed in cases where
gcc-cross.do_configure -> binutils-cross.do_populate_sysroot is skipped
when gcc-cross is reused from sstate.

I'll send RFC for that one now (I was trying to debug why it also brings
dependency on do_package_setscene)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X3gaHHMYHkYqP6yf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHYo3gACgkQN1Ujt2V2gBwASQCfSGKTjM3pxLhVbg0h6PjXHFIR
jw8AnjRUCZxJJWf++q8TgCUbuT9ycZeZ
=XFCs
-----END PGP SIGNATURE-----

--X3gaHHMYHkYqP6yf--
