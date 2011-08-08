Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX183bf6yIcpX4LHf/VkOCcyxID1mG+VjwFc=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqQxc-00071m-1W
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 16:37:44 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p78EWdbe005098;
	Mon, 8 Aug 2011 09:32:40 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312808310.14274.187.camel@rex>
Date: Mon, 8 Aug 2011 09:32:40 -0500
Message-Id: <52EDCE27-1A1D-46F6-884B-168243B0D3D2@kernel.crashing.org>
References: <F5D4B029-50F1-47E1-934C-8918DF2624F5@kernel.crashing.org>
	<1312808310.14274.187.camel@rex>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: multilib theory & practice
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
X-List-Received-Date: Mon, 08 Aug 2011 14:37:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 8, 2011, at 7:58 AM, Richard Purdie wrote:

> On Sat, 2011-08-06 at 15:56 -0500, Kumar Gala wrote:
>> I'm looking at trying to get multilib working for powerpc.  However
>> I'm a bit lost in how this is suppose to work from a few different
>> perspectives:
>>=20
>> 1. from user perspective (I'm starting with a 64-bit build in /lib64 =
and adding 32-bit that would be in /lib):
>>=20
>> (i've added in local/conf):
>> require conf/multilib.conf
>> MULTILIBS =3D "multilib:lib"
>> DEFAULTTUNE_virtclass-multilib-lib =3D "powerpc"
>=20
> Rather than use the identifier "lib", I'd use an identifier like =
"lib32"
> which is unlikely to be found in a recipe name. Therefore something
> like:
>=20
> require conf/multilib.conf
> MULTILIBS =3D "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 =3D "powerpc"

is 'lib32' utilized anywhere else or just to match these things =
together?  Just want to be clear that I'd expect 32-bit libraries to be =
in /lib/

>> What should this end up producing?  Do I get a 32-bit set of libs =
built automatically?  What else do I need to do?
>=20
> This will enable a number of other built targets such as "lib32-bash".
> You can also construct images that are mixtures of the various =
multilibs
> (e.g. install both openssl and lib32-openssl).

What would I expect w/regards to RPM or ipk's that are created?  How =
does one tell the 32-bit vs 64-bit?

>> 2. =46rom a infrastructure point of view:
>>=20
>> * Do have a single compiler that is multi-arch or 2 compilers? (not =
sure how the x86_64 toolchain works today)
>=20
> At this point we've gone for 2 compilers. This was a conscious choice =
to
> avoid additional complexity and allow us to get the core functionality
> working. We can support merged toolchains at a future date with
> appropriate toolchain configuration and ASSUME_PROVIDED declarations.

What would they be called or how are they distinguished?

>> * what areas should I investigate that might need tweaking that are =
arch specific?
>=20
> There should be very little beyond the places you've already changed
> that should need tweaking. The only issues may be due to this being
> very new code.
>=20
>> * should I see different task names for the new multilib builds? (or =
the 32-bit specific builds?)
>=20
> multilib.conf lists the recipes that will become multilib enabled. =
I've
> just merged a patch to extend this list to include the various ones =
that
> have been tested. The ultimate plan is not to require that list and =
its
> just a transition point.

I feel like I tried 'enabling' multilib on ppc and didn't see anything =
new built for the 32-bit libs.

- k=


