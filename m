Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RQQJ5-00028P-JO
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:12:40 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 978871100182
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 22:06:18 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id AEF2011000B0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 22:06:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225166078.adsl.alicedsl.de
	[92.225.166.78]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 22:06:17 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 95AD63C49D; Tue, 15 Nov 2011 22:06:16 +0100 (CET)
Date: Tue, 15 Nov 2011 22:06:16 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111115210616.GD3773@mail.adw-basketball.de>
References: <4EC24711.2010805@eukrea.com>
	<20111115201941.GA3773@rhein.zuhause.netz>
	<1321390249.26881.227.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1321390249.26881.227.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
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
X-List-Received-Date: Tue, 15 Nov 2011 21:12:40 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2011 at 08:50:49PM +0000, Richard Purdie wrote:
> On Tue, 2011-11-15 at 21:19 +0100, Henning Heinold wrote:
> > On Tue, Nov 15, 2011 at 12:03:45PM +0100, Eric B=E9nard wrote:
> > > Hi,
> > >=20
> > > I often meet a problem related to C++ headers which are not found
> > > (despite existing)n often when bitbake starts compiling mysql &
> > > directfb.
> > > I tested on 2 build hosts (both with Core i7, one i686 ubuntu, one
> > > x64_64 Fedora) and manage to reproduce the problem easily with
> > > BB_NUMBER_THREADS=3D8 in both cases.
> > >=20
> > > The configuration is quite simple :
> > > angstrom setup script + beagleboard machine + bitbake qt4e-demo-ima=
ge
> > > with
> > > PARALLEL_MAKE     =3D "-j6"
> > > BB_NUMBER_THREADS =3D "8"
> >=20
> > Hi Eric,
> >=20
> > I found another problem with the crosscompiler setup and c++,
> > while compile llvm with cmake.
> >=20
> > In recipes-devtools/gcc/gcc-configure-cross.inc we set
> >=20
> > EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${STAGING_DIR_TARGET}${=
target_exec_prefix} \
> >                       --with-gxx-include-dir=3D${target_includedir}/c=
++ \
> >                        --with-sysroot=3D${STAGING_DIR_TARGET} \
> >                        --with-build-sysroot=3D${STAGING_DIR_TARGET}"
> >=20
> >=20
> > which results in a headersearch path for c++
> >=20
> >  .../usr/usr/include/c++
> >=20
> > unfornatly I do not have the time to test it some more. But this litt=
le patch plus INC bumping
> > sovled it for my setup:
> >=20
> > -EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${STAGING_DIR_TARGET}$=
{target_exec_prefix} \
> > +EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${STAGING_DIR_TARGET} =
\
>=20
> How does that cause something which sometimes works and sometimes does
> not? Either it would work or wouldn't if this were the problem but not
> "sometimes"?
>=20
> Cheers,
>=20
> Richard

Yes,

I hijacked the thread. Sorry.

Bye Henning


