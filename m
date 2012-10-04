Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TJsmG-0005Cm-Jq
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 23:16:16 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so738562eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 14:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=vOTyXxBoJwmQ5YpYxDKo9/7uxPJhb32mXLasORAhMlQ=;
	b=edliXO8DWNXQwOlh21Iu1Jyjfy5VlhRwht+JOtDbbAyAsetUJm9BifjbbYTT1PCbya
	/1CWu+NVtCuMFgK5gqZ8wB7u9TdHYbfbJqNrT991wVP7vS46aVSVRcGaPIJwhQMUcyZR
	lweo9avqcfpAlKZ7JtsmAI9k1PTbyMRk8jAkvtyBBbuC2h36L43uyt6uguup1eQyCIJS
	N3MOs1/CN8CWY9exgejDQ2pyKrGuLiPyGZ+tNNqlcieER8I5UQuZRHrZoPeJ9RXQLjrN
	Ht/bPOgP3VvfFWqLMCgzqLW7VvDZXn4lKCWumcfuGmPll8rsiJ7SPPZdnxdpl3KtNDFS
	qULA==
Received: by 10.14.202.71 with SMTP id c47mr10256353eeo.42.1349384595497; Thu,
	04 Oct 2012 14:03:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Thu, 4 Oct 2012 14:02:45 -0700 (PDT)
In-Reply-To: <506DF8FB.1090606@windriver.com>
References: <506DCF4A.5020101@windriver.com>
	<CAMKF1srKsHp+Zb_eKa-BA53qbJALHvgqtXkHUdiF-fsvJp6vGQ@mail.gmail.com>
	<506DF8FB.1090606@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Oct 2012 14:02:45 -0700
Message-ID: <CAMKF1srw1kriKbnp2O5+o3_4xwB8V7chKUgu3EdqCSvH0_Pvbg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
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
X-List-Received-Date: Thu, 04 Oct 2012 21:16:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 4, 2012 at 2:00 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> On 10/4/12 3:36 PM, Khem Raj wrote:
>>
>> On Thu, Oct 4, 2012 at 11:02 AM, Mark Hatle <mark.hatle@windriver.com>
>> wrote:
>>>
>>> We have an issue where we'd like to have an alternative toolchain
>>> (assembler, linker, compiler) available for our customers to selectivel=
y
>>> use.  However, before we just go off and implement something, I'd like =
at
>>> least some basic consensus on what the best practice is for doing this
>>> work.
>>> Below is my attempt at an early proposal.
>>>
>>> Background
>>> ----------------
>>>
>>> Many companies have commercial / highly optimized toolchains for specif=
ic
>>> purpose, such as ICC from Intel, LLVM, ARM specific toolchain, etc..  F=
or
>>> (potentially) better performance with some applications a mechanism to
>>> both
>>> provide the hooks for the alternative toolchain as well as a way to
>>> active
>>> it per-package is desired.
>>>
>>> This work assumes that the third party toolchain is generally compatibl=
e
>>> with the idea of sysroots, linking to the libc provided by OE, and
>>> generally
>>> compatible with GNU conventions.
>>>
>>> However, as part of the third party toolchain, it may not be GNU
>>> compatible.
>>> This means many Open Source applications simply may not work with this
>>> toolchain.  That means that we need to have a way for a toolchain to
>>> blacklist (or whitelist) specific recipes.  This way only supported
>>> components can be built by the user, avoiding numerous complaints.
>>>
>>> Currently OE has a method to generate an SDK based on the GNU toolchain=
.
>>> We
>>> would like to be able to also export the external toolchain along with
>>> the
>>> SDK, effectively providing both the GNU toolchain and the third party
>>> toolchain using the common sysroot.
>>>
>>> We need a way to active the third party toolchain on a per-package basi=
s.
>>
>>
>> Per package bases is a bit iffy from my POV if you consider the compiler
>> runtime
>> and C library runtime and so forth. Is it intended to just compile and
>> be able to
>> cope with the default runtimes on images or do you also intend to figure
>> out
>> ways for multiple runtimes to live together.
>
>
> This is only one runtime.  You have multiple compilers all capable of
> producing software compatible with the same ABI.  The default (oe) compil=
er
> is used, unless otherwise configured.  The alternative(s) are used for
> optimization of various items.  I mentioned ICC, because it's one that I
> know today people are using and it is capable of replacing gcc in many
> applications.

Thanks that clarifies the scope. I thought you were going for a
general solution where you
could insert any toolchain.

>
> The issue is that I want to enable someone to use an alternative compiler=
,
> but I don't want to do anything beyond enabling it if it doesn't work.
>
>
>>> This activation will need to use the existing sysroot, but be able to
>>> pass
>>> different C, C++, LD, AS and other flags as specified by the third part=
y
>>> toolchain.
>>
>>
>> that sort of answers the above. So we are assuming that toolchain that
>> can interoperate
>> will be using GNU runtime
>>
>> There are cases where you might want something like ELLCC which avoids
>> complete GPL runtime e.g.
>> I think it could be divided into runtime  + tools where runtime lives
>> in a different layer but
>> essentially offering to let people use builtin C library and runtime
>> may not be a bad choice
>
>
> When the runtime changes, I consider that to be a different abi and outsi=
de
> the scope of this.  Thats where the machine/multilib/etc configuration it=
ems
> come into play.  (I.e. some architectures support an alternative compiler
> for bare metal applications -- in those cases the canonical arch is no
> longer -linux[-gnu]... so they would simply be treated as a different
> architecture.)
>
>
>>
>>>
>>> Finally third party toolchains should be implemented as layers that can
>>> easily plug into OE.
>>
>>
>> agreed. I think we need to document the interfaces in OE-Core for this
>> too so that
>> people can rely on the interface. Otherwise it will be constant pain
>> for keeping those
>> layers working together.
>
>
> Exactly.. I don't want people coming to me saying I want XYZ compiler, bu=
t
> it's implemented for my semi-conduction specific Linux and won't work wit=
h
> your OSV based Linux.  That doesn't help anyone (unless they are
> intentionally trying to be incompatible!)  So if we can provide a functio=
nal
> best practice and example of how to do this, then when people want to
> provide (and use) a secondary toolchain -- it's available to them.
>
>
>>>
>>> Implementation
>>> ---------------------
>>>
>>> Add an OVERRIDE to specify the alternative toolchain.  Can this be done
>>> within the layer by doing something like:
>>>
>>> OVERRIDE_append =3D ":toolchain-${TOOLCHAIN}"
>>>
>>> TOOLCHAIN =3D "gnu" (or "icc")
>>>
>>> To activate the toolchain you would use things like:
>>>
>>> TOOLCHAIN_pn-bash =3D 'icc'
>>>
>>> To define the correct behavior for the toolchain, the following would
>>> need
>>> to be defined (with _toolchain-<toolchain>):
>>>
>>> TARGET_CPPFLAGS
>>> TARGET_CFLAGS
>>> TARGET_CXXFLAGS
>>> TARGET_LDFLAGS
>>> CC
>>> CXX
>>> F77
>>> CPP
>>> LD
>>> CCLD
>>> AR
>>> AS
>>> RANLIB
>>> STRIP
>>> OBJCOPY
>>> OBJDUMP
>>> NM
>>> FULL_OPTIMIZATIONS
>>> DEBUG_OPTIMIZATION
>>>
>>> Is anyone aware of any other items that may require additional items?
>>> Will
>>> the above actually work?  Using the override of the TOOLCHAIN_=E2=80=A6=
 will that
>>> actually change the override values or do we get stuck?
>>>
>>> Comments/suggestions appreciated!
>>> --Mark
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


