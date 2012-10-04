Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TJsDI-0006QP-9E
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 22:40:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q94KR2fS016797
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Oct 2012 13:27:02 -0700 (PDT)
Received: from msp-dhcp7.wrs.com (172.25.34.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 4 Oct 2012 13:27:02 -0700
Message-ID: <506DF115.7030308@windriver.com>
Date: Thu, 4 Oct 2012 15:27:01 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>
References: <506DCF4A.5020101@windriver.com>
	<70CC66F5C30A414DADDA6973E4CA391A6D910F@039-SN1MPN1-002.039d.mgd.msft.net>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6D910F@039-SN1MPN1-002.039d.mgd.msft.net>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q94KR2fS016797
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
X-List-Received-Date: Thu, 04 Oct 2012 20:40:08 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10/4/12 2:03 PM, McClintock Matthew-B29882 wrote:
> On Thu, Oct 4, 2012 at 1:02 PM, Mark Hatle <mark.hatle@windriver.com> w=
rote:
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
>> This activation will need to use the existing sysroot, but be able to =
pass
>> different C, C++, LD, AS and other flags as specified by the third par=
ty
>> toolchain.
>>
>> Finally third party toolchains should be implemented as layers that ca=
n
>> easily plug into OE.
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
>> the above actually work?  Using the override of the TOOLCHAIN_=85 will=
 that
>> actually change the override values or do we get stuck?
>
> This seems orthogonal to actually implementing the recipe which would
> procide 'icc'?

That is correct.  I'm trying to establish a best practice for the layer=20
configuration, as well as general distribution/recipe configuration.

What I really don't want to see is 5 companies implementing similar=20
functionality and doing it in a completely incompatible way.  If the vari=
ables=20
and override mechanism above is reasonable, then it gives people a roadma=
p to=20
get started.

--Mark

> -M
>
>>
>> Comments/suggestions appreciated!
>> --Mark
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



