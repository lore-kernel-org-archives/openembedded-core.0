Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAMFS-00083X-Tn for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 15:10:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LE1r0G002307
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:01:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01793-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:01:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LE1ixt002301
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:01:46 GMT
Message-ID: <1332338506.9740.153.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 14:01:46 +0000
In-Reply-To: <20120321135636.16995ebc@eb-e6520>
References: <1332328101-22779-1-git-send-email-eric@eukrea.com>
	<1332332772.9740.146.camel@ted> <20120321135636.16995ebc@eb-e6520>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q2LE1r0G002307
Subject: Re: [PATCH] speex: fix FILES variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2012 14:10:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-03-21 at 13:56 +0100, Eric B=C3=A9nard wrote:
> Le Wed, 21 Mar 2012 12:26:12 +0000,
> Richard Purdie <richard.purdie@linuxfoundation.org> a =C3=A9crit :
>=20
> > On Wed, 2012-03-21 at 12:08 +0100, Eric B=C3=A9nard wrote:
> > > @@ -24,5 +24,4 @@ EXTRA_OECONF =3D " --enable-fixed-point --with-og=
g-libraries=3D${STAGING_LIBDIR} \
> > > =20
> > >  PACKAGES +=3D "${PN}-bin"
> > >  FILES_${PN} =3D "${libdir}/lib*.so.*"
> > > -FILES_${PN}-dev +=3D "${libdir}/lib*.so.*"
> > >  FILES_${PN}-bin =3D "${bindir}"
> >=20
> > Doesn't this mean -dev files are ending up in the main package?
> >=20
> this seems to work fine as this (with no other layer than oe-core).
>=20
> packages-split/speex
> `-- usr
>     `-- lib
>         |-- libspeexdsp.so.1 -> libspeexdsp.so.1.5.0
>         |-- libspeexdsp.so.1.5.0
>         |-- libspeex.so.1 -> libspeex.so.1.5.0
>         `-- libspeex.so.1.5.0
>=20
> 2 directories, 4 files
>=20
> packages-split/speex-dev/
> .../...
>     |-- lib
>     |   |-- libspeexdsp.la
>     |   |-- libspeexdsp.so -> libspeexdsp.so.1.5.0
>     |   |-- libspeex.la
>     |   |-- libspeex.so -> libspeex.so.1.5.0
>     |   `-- pkgconfig
>     |       |-- speexdsp.pc
>     |       `-- speex.pc
> .../...
>=20
> > Shouldn't this be:
> >=20
> > FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
> > FILES_${PN}-dev =3D "${libdir}/lib*${SOLIBSDEV}"
> >=20
> > or better, remove these and add:
> >=20
> > inherit lib_package
> >=20
> > ?
> >=20
> no clear idea on that, you are the boss to tell me which one you
> prefer ;-)

Well, I think "inherit lib_package" is going to be cleanest. Your
original patch is correct in its own right though, this just gives some
better cleanup :)

Cheers,

Richard



