Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TJsjq-00059j-Ua
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 23:13:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q94L0iHA022261
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Oct 2012 14:00:44 -0700 (PDT)
Received: from msp-dhcp7.wrs.com (172.25.34.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 4 Oct 2012 14:00:43 -0700
Message-ID: <506DF8FB.1090606@windriver.com>
Date: Thu, 4 Oct 2012 16:00:43 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <506DCF4A.5020101@windriver.com>
	<CAMKF1srKsHp+Zb_eKa-BA53qbJALHvgqtXkHUdiF-fsvJp6vGQ@mail.gmail.com>
In-Reply-To: <CAMKF1srKsHp+Zb_eKa-BA53qbJALHvgqtXkHUdiF-fsvJp6vGQ@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q94L0iHA022261
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Secondary Toolchain
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
X-List-Received-Date: Thu, 04 Oct 2012 21:13:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10/4/12 3:36 PM, Khem Raj wrote:
> On Thu, Oct 4, 2012 at 11:02 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>> We have an issue where we'd like to have an alternative toolchain
>> (assembler, linker, compiler) available for our customers to selective=
ly
>> use.  However, before we just go off and implement something, I'd like=
 at
>> least some basic consensus on what the best practice is for doing this=
 work.
>> Below is my attempt at an early proposal.
>>
>> Background
>> ----------------
>>
>> Many companies have commercial / highly optimized toolchains for speci=
fic
>> purpose, such as ICC from Intel, LLVM, ARM specific toolchain, etc..  =
For
>> (potentially) better performance with some applications a mechanism to=
 both
>> provide the hooks for the alternative toolchain as well as a way to ac=
tive
>> it per-package is desired.
>>
>> This work assumes that the third party toolchain is generally compatib=
le
>> with the idea of sysroots, linking to the libc provided by OE, and gen=
erally
>> compatible with GNU conventions.
>>
>> However, as part of the third party toolchain, it may not be GNU compa=
tible.
>> This means many Open Source applications simply may not work with this
>> toolchain.  That means that we need to have a way for a toolchain to
>> blacklist (or whitelist) specific recipes.  This way only supported
>> components can be built by the user, avoiding numerous complaints.
>>
>> Currently OE has a method to generate an SDK based on the GNU toolchai=
n.  We
>> would like to be able to also export the external toolchain along with=
 the
>> SDK, effectively providing both the GNU toolchain and the third party
>> toolchain using the common sysroot.
>>
>> We need a way to active the third party toolchain on a per-package bas=
is.
>
> Per package bases is a bit iffy from my POV if you consider the compile=
r runtime
> and C library runtime and so forth. Is it intended to just compile and
> be able to
> cope with the default runtimes on images or do you also intend to figur=
e out
> ways for multiple runtimes to live together.

This is only one runtime.  You have multiple compilers all capable of pro=
ducing=20
software compatible with the same ABI.  The default (oe) compiler is used=
,=20
unless otherwise configured.  The alternative(s) are used for optimizatio=
n of=20
various items.  I mentioned ICC, because it's one that I know today peopl=
e are=20
using and it is capable of replacing gcc in many applications.

The issue is that I want to enable someone to use an alternative compiler=
, but I=20
don't want to do anything beyond enabling it if it doesn't work.

>> This activation will need to use the existing sysroot, but be able to =
pass
>> different C, C++, LD, AS and other flags as specified by the third par=
ty
>> toolchain.
>
> that sort of answers the above. So we are assuming that toolchain that
> can interoperate
> will be using GNU runtime
>
> There are cases where you might want something like ELLCC which avoids
> complete GPL runtime e.g.
> I think it could be divided into runtime  + tools where runtime lives
> in a different layer but
> essentially offering to let people use builtin C library and runtime
> may not be a bad choice

When the runtime changes, I consider that to be a different abi and outsi=
de the=20
scope of this.  Thats where the machine/multilib/etc configuration items =
come=20
into play.  (I.e. some architectures support an alternative compiler for =
bare=20
metal applications -- in those cases the canonical arch is no longer=20
-linux[-gnu]... so they would simply be treated as a different architectu=
re.)

>
>>
>> Finally third party toolchains should be implemented as layers that ca=
n
>> easily plug into OE.
>
> agreed. I think we need to document the interfaces in OE-Core for this
> too so that
> people can rely on the interface. Otherwise it will be constant pain
> for keeping those
> layers working together.

Exactly.. I don't want people coming to me saying I want XYZ compiler, bu=
t it's=20
implemented for my semi-conduction specific Linux and won't work with you=
r OSV=20
based Linux.  That doesn't help anyone (unless they are intentionally try=
ing to=20
be incompatible!)  So if we can provide a functional best practice and ex=
ample=20
of how to do this, then when people want to provide (and use) a secondary=
=20
toolchain -- it's available to them.

>>
>> Implementation
>> ---------------------
>>
>> Add an OVERRIDE to specify the alternative toolchain.  Can this be don=
e
>> within the layer by doing something like:
>>
>> OVERRIDE_append =3D ":toolchain-${TOOLCHAIN}"
>>
>> TOOLCHAIN =3D "gnu" (or "icc")
>>
>> To activate the toolchain you would use things like:
>>
>> TOOLCHAIN_pn-bash =3D 'icc'
>>
>> To define the correct behavior for the toolchain, the following would =
need
>> to be defined (with _toolchain-<toolchain>):
>>
>> TARGET_CPPFLAGS
>> TARGET_CFLAGS
>> TARGET_CXXFLAGS
>> TARGET_LDFLAGS
>> CC
>> CXX
>> F77
>> CPP
>> LD
>> CCLD
>> AR
>> AS
>> RANLIB
>> STRIP
>> OBJCOPY
>> OBJDUMP
>> NM
>> FULL_OPTIMIZATIONS
>> DEBUG_OPTIMIZATION
>>
>> Is anyone aware of any other items that may require additional items? =
 Will
>> the above actually work?  Using the override of the TOOLCHAIN_=E2=80=A6=
 will that
>> actually change the override values or do we get stuck?
>>
>> Comments/suggestions appreciated!
>> --Mark
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



