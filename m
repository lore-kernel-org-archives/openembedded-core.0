Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UVk7n-0008K6-Qd
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 17:00:00 +0200
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2C5954B01BD;
	Fri, 26 Apr 2013 16:41:58 +0200 (CEST)
Date: Fri, 26 Apr 2013 16:41:57 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130426164157.42a0226b@e6520eb>
In-Reply-To: <517A867E.3030708@windriver.com>
References: <20130426092655.1d0ffdb2@e6520eb> <517A867E.3030708@windriver.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: dylan: meta-toolchain and u-boot : "cannot find -lgcc"
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
X-List-Received-Date: Fri, 26 Apr 2013 15:00:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Le Fri, 26 Apr 2013 08:51:58 -0500,
Mark Hatle <mark.hatle@windriver.com> a =C3=A9crit :
> On 4/26/13 2:26 AM, Eric B=C3=A9nard wrote:
> > this can be fixed by installing the sdk to it's standard path
> > (/usr/local/oecore-x86_64/ in the present case).
> >
> > Is that an expected behaviour (as the sdk is primarly designed to build
> > applications) or can that be fixed during the sdk relocation ?
>=20
> When you use the SDK, you need to be sure to source the SDK environment s=
etup.=20
> Once you do that, pass to the compiler/linker the included CFLAGS and LDF=
LAGS as=20
> specified in that environment file.

of course I did source it (and forget to put it in the email as that
was obvious to me, sorry).

> They should end up passing at some point a --sysroot=3D... and that will =
tell gcc=20
> where the libraries and headers are for linking.  Without the --sysroot=
=3D option,=20
> the compiler has no choice but to look for it's original compilation dire=
ctory.
>=20
true, that's why I provided the step to reproduce and said "as the
sdk is primarly designed to build applications" and that's certainly
why we get this problem : for linux & u-boot we can't use the LDFLAGS
as set by the environment script else we get :

for u-boot :
arm-oe-linux-gnueabi-ld.bfd: unrecognized option '-Wl,-O1'
so we need to pass LDFLAGS=3D"" which then leads to :
arm-oe-linux-gnueabi-ld.bfd: cannot find -lgcc
if and only if the sdk was relocated.
(and I also get the error even if I add LDFLAGS=3D"
--sysroot=3D/path_to/oecore-x86_64/sysroots/armv5te-oe-linux-gnueabi"
so this seems specific to -lgcc)

for linux :
arm-oe-linux-gnueabi-ld: unrecognized option '-Wl,-O1'
so here again we need to pass LDFLAGS=3D"" which leads to a successful
build as the build is not using lgcc.

Eric


