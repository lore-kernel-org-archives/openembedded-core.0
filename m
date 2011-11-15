Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQQ4B-00012C-G7 for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 21:57:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFKorXj029770
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 20:50:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29037-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 20:50:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFKojwH029764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 20:50:46 GMT
Message-ID: <1321390249.26881.227.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2011 20:50:49 +0000
In-Reply-To: <20111115201941.GA3773@rhein.zuhause.netz>
References: <4EC24711.2010805@eukrea.com>
	<20111115201941.GA3773@rhein.zuhause.netz>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pAFKorXj029770
Subject: Re: Reproducible build problem with BB_NUMBER_THREADS=8
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
X-List-Received-Date: Tue, 15 Nov 2011 20:57:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-11-15 at 21:19 +0100, Henning Heinold wrote:
> On Tue, Nov 15, 2011 at 12:03:45PM +0100, Eric B=C3=A9nard wrote:
> > Hi,
> >=20
> > I often meet a problem related to C++ headers which are not found
> > (despite existing)n often when bitbake starts compiling mysql &
> > directfb.
> > I tested on 2 build hosts (both with Core i7, one i686 ubuntu, one
> > x64_64 Fedora) and manage to reproduce the problem easily with
> > BB_NUMBER_THREADS=3D8 in both cases.
> >=20
> > The configuration is quite simple :
> > angstrom setup script + beagleboard machine + bitbake qt4e-demo-image
> > with
> > PARALLEL_MAKE     =3D "-j6"
> > BB_NUMBER_THREADS =3D "8"
>=20
> Hi Eric,
>=20
> I found another problem with the crosscompiler setup and c++,
> while compile llvm with cmake.
>=20
> In recipes-devtools/gcc/gcc-configure-cross.inc we set
>=20
> EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${STAGING_DIR_TARGET}${ta=
rget_exec_prefix} \
>                       --with-gxx-include-dir=3D${target_includedir}/c++=
 \
>                        --with-sysroot=3D${STAGING_DIR_TARGET} \
>                        --with-build-sysroot=3D${STAGING_DIR_TARGET}"
>=20
>=20
> which results in a headersearch path for c++
>=20
>  .../usr/usr/include/c++
>=20
> unfornatly I do not have the time to test it some more. But this little=
 patch plus INC bumping
> sovled it for my setup:
>=20
> -EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${STAGING_DIR_TARGET}${t=
arget_exec_prefix} \
> +EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${STAGING_DIR_TARGET} \

How does that cause something which sometimes works and sometimes does
not? Either it would work or wouldn't if this were the problem but not
"sometimes"?

Cheers,

Richard






