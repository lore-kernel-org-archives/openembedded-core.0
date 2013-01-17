Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tvq2P-0005Jz-G1
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 15:02:06 +0100
Received: by mail-da0-f46.google.com with SMTP id p5so1116052dak.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 05:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=FDGmib+0XwDk/AUi1jG+fXDGGAmsZm3RM1wM1IXJKRY=;
	b=YINhMZfWOv9KILQALG3WD8YOhBuwHsNWVyh3Xz8rEG4bSTNK6NsQ/SMUq/+/tC64zu
	xPds4BD3punZ7mlMMo0/IJzptOm6WmSyXktjbSgQpxPq0gGyavz1K26OuvW5owZXHasI
	v7ui0FS0qDIBvjpQbAozuP5UwMe9sg0U4MQJ0pA+LOaTPgm2cu92YEaPLe6oJo4BTP15
	7RFPaBAHT2Ur1W4TiSHPEejSoLZJOuawIFEHBI5rv6N6nwD0a836WUEgIeK7In6HamJh
	BI/Ch7ld6IC87oDS9eiK6LU8BonUO1Ry5xNs7ESPJEoAaNTFAZBJEwve47qb/IMOTgJO
	0hZg==
X-Received: by 10.68.229.169 with SMTP id sr9mr13413641pbc.120.1358430385662; 
	Thu, 17 Jan 2013 05:46:25 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d8sm1371853pax.23.2013.01.17.05.46.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 05:46:24 -0800 (PST)
Date: Thu, 17 Jan 2013 14:46:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
Message-ID: <20130117134619.GI3067@jama>
References: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>
	<20130116150205.GE3002@jama>
	<CAOHjBZsXebja8FB4GbQNwm5zxBCoEOPh40rE9b71EzXG5fGWdA@mail.gmail.com>
	<20130117124209.GE3067@jama>
	<065b01cdf4b6$e1510160$a3f30420$@st.com>
MIME-Version: 1.0
In-Reply-To: <065b01cdf4b6$e1510160$a3f30420$@st.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: fix as and ld check in libc dir
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
X-List-Received-Date: Thu, 17 Jan 2013 14:02:20 -0000
X-Groupsio-MsgNum: 33961
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YhFoJY/gx7awiIuK"
Content-Disposition: inline

--YhFoJY/gx7awiIuK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2013 at 02:30:55PM +0100, Giuseppe CONDORELLI wrote:
> Hi Martin,
>=20
> Do you mean applying the patch you highlighted in libc/configure?

I was expecting you're trying to fix ld --version detection when ld is
gold. But after few experiments I don't see what you're trying to fix:

martin@jama ~ $ ld.bfd --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*=
\.[0-9.]*\).*$/\1/p'
2.23.1
martin@jama ~ $ ld.gold --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]=
*\.[0-9.]*\).*$/\1/p'
nothing -> ld.gold still unsupported

old:
martin@jama ~ $ echo 2.23.1 | egrep "2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[=
1-9][0-9]*"
2.23.1
martin@jama ~ $ echo 2.19.1 | egrep "2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[=
1-9][0-9]*"
2.19.1
martin@jama ~ $ echo 2.19   | egrep "2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[=
1-9][0-9]*"
2.19
martin@jama ~ $ echo 2.1    | egrep "2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[=
1-9][0-9]*"
2.1

new:
martin@jama ~ $ echo 2.19.1 | egrep "2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][=
0-9]*"
2.19.1
martin@jama ~ $ echo 2.23.1 | egrep "2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][=
0-9]*"
2.23.1
martin@jama ~ $ echo 2.19   | egrep "2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][=
0-9]*"
2.19
martin@jama ~ $ echo 2.1    | egrep "2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][=
0-9]*"
2.1

Can you show some example version your patch is fixing?

Cheers,

> >-----Original Message-----
> >From: Martin Jansa [mailto:martin.jansa@gmail.com]
> >Sent: gioved=EC 17 gennaio 2013 13:42
> >To: Giuseppe Condorelli
> >Cc: Giuseppe CONDORELLI; openembedded-core@lists.openembedded.org
> >Subject: Re: [OE-core] [PATCH] eglibc: fix as and ld check in libc dir
> >
> >On Wed, Jan 16, 2013 at 04:07:39PM +0100, Giuseppe Condorelli wrote:
> >> 2013/1/16 Martin Jansa <martin.jansa@gmail.com>
> >>
> >> > On Wed, Jan 16, 2013 at 03:14:07PM +0100, Giuseppe CONDORELLI wrote:
> >> > > Fix routine to check as and ld version check in the configure, to
> allow
> >> > system
> >> > > to correctly check for version 2.1x.
> >> >
> >> > Does it build with gold now?
> >> >
> >> > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-
> >March/020310.html
> >
> >does it?
> >
> >--
> >Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YhFoJY/gx7awiIuK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD4AKsACgkQN1Ujt2V2gBzAaQCfcpuA/hk047pf2mNaFo9MSDwc
I9sAoKV/nLfjqa7/XBVajacXen8fjBpF
=tgxT
-----END PGP SIGNATURE-----

--YhFoJY/gx7awiIuK--
