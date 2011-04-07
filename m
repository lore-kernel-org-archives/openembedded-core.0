Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q7rpk-0003ZP-Fq
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 18:13:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p37GAcKl026061
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Apr 2011 09:10:38 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.73]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.01.0255.000;
	Thu, 7 Apr 2011 09:10:38 -0700
From: "Hatle, Mark" <mark.hatle@windriver.com>
To: Colin Walters <walters@verbum.org>
Thread-Topic: [poky] Proposed Multilib Implementation Brainstorming
Thread-Index: AQHL9TmKZrKlv9+FdE6IOU3UGMc605RSkjeQ
Date: Thu, 7 Apr 2011 16:10:38 +0000
Message-ID: <9024C872-9FD7-4016-B40C-89DE43199F66@windriver.com>
References: <1302001365.24596.459.camel@rex>,
	<BANLkTinaGY_6Ks7pTfwYcVaDxs3ANbT2Gg@mail.gmail.com>
In-Reply-To: <BANLkTinaGY_6Ks7pTfwYcVaDxs3ANbT2Gg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: poky <poky@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Thu, 07 Apr 2011 16:13:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable





On Apr 7, 2011, at 8:36 AM, "Colin Walters" <walters@verbum.org> wrote:

> On Tue, Apr 5, 2011 at 7:02 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> One of the items on our post 1.0 schedule is multilib and we need a plan
>> of implementation. I've been thinking about this for a while and at
>> least have some ideas how some of the issues can be handled.
>>=20
>> In case anyone isn't familiar with the idea of multilibs, the most
>> common example are x86 systems which have both 32 bit and 64 bit
>> libraries installed at the same time in /lib/ and /lib64/ directories or
>> similar and hence both types of binaries can be used.
>=20
> I call this "rpm style" multilib.
>=20
>> The number of libs isn't limited to two choices as for example the mips
>> platform has three choices which can be used in parallel. The x32 ABI
>> would mean three possible x86 options too.
>=20
> I don't think there's any precedent in RPM for anything beyond 2 (is ther=
e?)
>=20

RPM uses file 'colors' to handle the multilib conflict and installation pol=
icy.  The colors are defined as a bit field where so far only 3 bit are def=
ined.  Elf 32, elf 64, and MIPS n32.

So we have a way to do more then three, currently MIPS64 n32 is the only ar=
chitecture this is defined on.

> In this discussion we should be sure we're clear on the distinction
> between "multilib" and "multiarch".  Multilib's goal is simply
> parallel-installable libraries mainly; for the use case stated above,
> where you have a 64 bit system and want to run a 32 bit Unix
> application, or vice versa.
>=20

I think definition may be an issue here.  When I speak of multilibs I am ta=
lking primarily about multiliple non-conflicting, ABI incompatible librarie=
s being installed at the same time.  This is the ELF 32 and ELF 64 case whe=
re the items can't be linked together, but can be installed and jrun on the=
 same machine.

The alternative is the case on ARM where we have one single ABI but multipl=
e ways to implement the code.. Thumb, neon, vfp, etc being options.  We wan=
t to do this as well, but while related, I see it as a diffent use case.

> Multiarch is much more ambitious - it includes cross compilation for
> example (something that people keep thinking multilib was designed
> for, but it never was).
>=20
> So are you proposing multilib or multiarch for OE?  It looks like
> multilib, but I want to be sure we're clear on the goal.
>=20

Multilib, install of binaries that will execute natively on the machine.

> In your proposal, it looks like you're suggesting the libdir names are
> up to the image creator?  If we're doing something new *now* without
> any backwards compatibility concerns, we might consider using the
> Debian/Ubuntu scheme for libdirs.  This may come at the expense of
> having to patch RPM, but I'm not sure how hardcoded the lib/lib64
> paths are in the ecosystem; it may be pretty easy.

Lib dir names are already defined within the system configuration, but ther=
e hasn't been a lot of work to prove it's being used and is working properl=
y.  (everyone uses /lib today...)

Rpm really doesn't care or pay attention to the path, it's the elf file typ=
e that matters...

> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky


