Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qb8nA-00056L-DZ
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 12:11:44 +0200
Received: by wyg30 with SMTP id 30so1137990wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 03:08:04 -0700 (PDT)
Received: by 10.217.6.200 with SMTP id y50mr4985942wes.69.1309169284458;
	Mon, 27 Jun 2011 03:08:04 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id l5sm2670653weq.33.2011.06.27.03.08.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 03:08:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309167774.21613.264.camel@phil-desktop>
Date: Mon, 27 Jun 2011 12:07:57 +0200
Message-Id: <8815E10D-6790-48AD-811D-5BE977A17380@dominion.thruhere.net>
References: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
	<4E0699D1.9090308@gmail.com> <4E074ABB.80405@gmail.com>
	<48356C52-61A1-42BE-92AA-704FB136D8A3@dominion.thruhere.net>
	<1309167774.21613.264.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: gcc-cross-kernel problems
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
X-List-Received-Date: Mon, 27 Jun 2011 10:11:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jun 2011, om 11:42 heeft Phil Blundell het volgende geschreven:

> On Mon, 2011-06-27 at 11:32 +0200, Koen Kooi wrote:
>> Op 26 jun 2011, om 17:05 heeft Khem Raj het volgende geschreven:
>>=20
>>> On 06/25/2011 07:30 PM, Khem Raj wrote:
>>>> so in you kernel recipe somewhere patch the below code
>>>>=20
>>>> PATH_prepend =3D "${STAGING_BINDIR_TOOLCHAIN}.gcc-cross-kernel:"
>>>=20
>>> I guess it has 4.2.1 in the path for you as I see so you might need
>>>=20
>>> PATH_prepend =3D =
"${STAGING_BINDIR_TOOLCHAIN}.gcc-cross-kernel-4.2.1:"
>>=20
>> I did it a bit differently and symlinked it into the regular =
toolchain bin and I not get an 'as' error about '-EL' not being a valid =
option.It looks like gcc is calling an unprefixed 'as'. Is this due to =
gcc-cross-kernel being bitrotted, the recipe missing patches or =
something else?
>=20
> That usually means that the cross as hasn't been installed/symlinked
> into the place where gcc expects to find it.  The way the gcc driver
> locates the assembler is by searching for "as" in various different
> directories.  In particular, despite what you might expect it doesn't
> ever look for $TARGET_SYS-as in $bindir or anywhere else.
>=20
> Usually it will expect to find as in
> $libexecdir/gcc/$TARGET_SYS/4.2.1/as or some such path.  The symlinks =
in
> that directory are created as part of the gcc installation process.  =
You
> can strace gcc to find out where it's actually looking.

It seems to be looking at these directories:

=
stat("/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/=
usr/libexec/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel/gcc/arm-angstro=
m-linux-gnueabi/4.2.1/as", 0x7fff13f2f110) =3D -1 ENOENT (No such file =
or directory)
=
stat("/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/=
usr/libexec/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel/gcc/arm-angstro=
m-linux-gnueabi/4.2.1/as", 0x7fff13f2f110) =3D -1 ENOENT (No such file =
or directory)
=
stat("/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/=
usr/libexec/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel/gcc/arm-angstro=
m-linux-gnueabi/as", 0x7fff13f2f110) =3D -1 ENOENT (No such file or =
directory)
=
stat("/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/=
usr/lib/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel/gcc/arm-angstrom-li=
nux-gnueabi/4.2.1/as", 0x7fff13f2f110) =3D -1 ENOENT (No such file or =
directory)
=
stat("/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/=
usr/lib/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel/gcc/arm-angstrom-li=
nux-gnueabi/as", 0x7fff13f2f110) =3D -1 ENOENT (No such file or =
directory)
=
stat("/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/=
usr/lib/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel/gcc/arm-angstrom-li=
nux-gnueabi/4.2.1/../../../../../arm-angstrom-linux-gnueabi/bin/arm-angstr=
om-linux-gnueabi/4.2.1/as", 0x7fff13f2f110) =3D -1 ENOENT (No such file =
or directory)
=
stat("/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/=
usr/lib/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel/gcc/arm-angstrom-li=
nux-gnueabi/4.2.1/../../../../../arm-angstrom-linux-gnueabi/bin/as", =
0x7fff13f2f110) =3D -1 ENOENT (No such file or directory)

In the first one only cc1 and collect are present. What would be the =
best way to fix this?




