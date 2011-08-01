Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/TJqMr31ARrMixYWD/XSp9o+RQWY2Rwqc=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qnth2-0004GT-B8
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 16:42:08 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p71EbgcA032124;
	Mon, 1 Aug 2011 09:37:45 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312209045.30326.515.camel@phil-desktop>
Date: Mon, 1 Aug 2011 09:37:43 -0500
Message-Id: <4727DFCB-0AA2-43D1-A0CA-58717D815FE8@kernel.crashing.org>
References: <1312208500-13381-1-git-send-email-galak@kernel.crashing.org>
	<1312209045.30326.515.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Phil Blundell <philb@gnu.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] gcc: Add ability for tune files to pass in configure options to gcc
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
X-List-Received-Date: Mon, 01 Aug 2011 14:42:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 1, 2011, at 9:30 AM, Phil Blundell wrote:

> On Mon, 2011-08-01 at 09:21 -0500, Kumar Gala wrote:
>> Added a ${GCC_EXTRA_OECONF} to the the building up of gcc's
>> ${EXTRA_OECONF}.  This is similar to what we have in the glibc recipe
>> files.
>>=20
>> This allows for a tune file to add something like:
>>=20
>> GCC_EXTRA_OECONF +=3D "--with-cpu=3De5500"
>>=20
>> If needed.
>>=20
>> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
>=20
> Why is that desirable?  =46rom the looks of that patch it will affect
> gcc-cross as well as target gcc and, if you're going to do this, I =
think
> you need to find some way to disambiguate the resulting compilers.
> Otherwise there is going to be no way to predict what options ${CC} =
was
> built with.

Its desirable to get a consistent set of tools.  For example it means =
the cross toolchain in an ADT will target the given processor it was =
built with w/o having to explicit set flags to gcc.

Additionally, it might be useful for building multilib gcc on powerpc =
that seems to need --with-cpu-32 --with-cpu-64.

Not sure I understand the statement about disambiguate the resulting =
compilers, on PPC where I intend to utilize this we'd have the =
toolchains already named something like:

ppc64e5500-poky-linux-gcc

> Even for the on-target gcc case, if you are going to start putting
> MACHINE-specific variables into the configure commandline then you =
need
> to make sure that the output packages have an appropriate =
Architecture.
> I don't think that's going to be the case at the moment.

I'm open to solutions to my problem, but need to find someway to pass =
'--with-cpu=3D' to configure.

- k=


