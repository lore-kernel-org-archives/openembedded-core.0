Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UVka0-0002dk-0A
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 17:28:58 +0200
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1E2964B0207;
	Fri, 26 Apr 2013 17:11:04 +0200 (CEST)
Date: Fri, 26 Apr 2013 17:11:03 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20130426171103.2412f8c5@e6520eb>
In-Reply-To: <517A933C.4020507@windriver.com>
References: <20130426092655.1d0ffdb2@e6520eb> <517A867E.3030708@windriver.com>
	<20130426164157.42a0226b@e6520eb> <517A933C.4020507@windriver.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 26 Apr 2013 15:29:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Le Fri, 26 Apr 2013 09:46:20 -0500,
Mark Hatle <mark.hatle@windriver.com> a =C3=A9crit :
> I see, it's using ld instead of gcc for linking.  AFAIK though, you reall=
y=20
> shouldn't be using -lgcc in either uboot or linux for any platform.  That=
 seems=20
> suspicious to me.
>=20
u-boot is using libgcc in its makefile (Linux doesn't).

I've found the problem root cause in the u-boot's Makefile :
PLATFORM_LIBGCC :=3D -L $(shell dirname `$(CC) $(CFLAGS) -print-libgcc-file=
-name`) -lgcc
(but CC and CFLAGS are set in the Makefiles thus the ones of the
environment are not used

$ arm-oe-linux-gnueabi-gcc  -print-libgcc-file-name
libgcc.a
but :
$ arm-oe-linux-gnueabi-gcc --sysroot=3D/path_to/oecore-x86_64/sysroots/armv=
5te-oe-linux-gnueabi -print-libgcc-file-name=20
returns :
/path_to/oecore-x86_64/sysroots/armv5te-oe-linux-gnueabi/usr/lib/arm-oe-lin=
ux-gnueabi/4.7.2/libgcc.a

so if I manage to pass
--sysroot=3D/path_to/oecore-x86_64/sysroots/armv5te-oe-linux-gnueabi
when PLATFORM_LIBGCC is computed, I get a working build.

so that's not a problem in the SDK : thanks for driving me
to the right track to investigate on this issue ;-)

Eric


