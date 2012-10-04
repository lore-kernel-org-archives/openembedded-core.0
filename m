Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TJsMm-0002Rr-PZ
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 22:49:56 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so722717eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 13:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=tjCysrg0SoSTaykLtD5svxPHt+tkplpcucHwqlkmwWE=;
	b=CeqneicEzFiM7OvsSLrCPz+W/+kxoEnYfMzx7KmIu9Wt/fpd/vAAjhQrfTHnpf2Sxx
	a/6OpURQ2oo4OAfYtkHTnsWKXGLD2hBrVZrghoV8CbEAsB9RGxyoRrZXD/DEgc1UaSmQ
	Plt4A62hWNRUIiCVIgAF/Sq7tofSIbiChrRQ1TBZApkxcLloHgYoYldHlF2HUQrccehu
	3OganvqZvRtGeB9unoHsaWOrXO8Q9VeXDOhsaZSZYw+TVFUku6SlILlLUpci5ycb4l1q
	aGbRaYV+/zr4Pe6VIyy5ZnbwfI73n+p5Bj9YVNP9vSO3SEGrq7jyhuJMZRw3Wh/8Wk4S
	DHsA==
Received: by 10.14.204.72 with SMTP id g48mr10138205eeo.45.1349383015459; Thu,
	04 Oct 2012 13:36:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Thu, 4 Oct 2012 13:36:25 -0700 (PDT)
In-Reply-To: <506DCF4A.5020101@windriver.com>
References: <506DCF4A.5020101@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Oct 2012 13:36:25 -0700
Message-ID: <CAMKF1srKsHp+Zb_eKa-BA53qbJALHvgqtXkHUdiF-fsvJp6vGQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 04 Oct 2012 20:49:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 4, 2012 at 11:02 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> We have an issue where we'd like to have an alternative toolchain
> (assembler, linker, compiler) available for our customers to selectively
> use.  However, before we just go off and implement something, I'd like at
> least some basic consensus on what the best practice is for doing this wo=
rk.
> Below is my attempt at an early proposal.
>
> Background
> ----------------
>
> Many companies have commercial / highly optimized toolchains for specific
> purpose, such as ICC from Intel, LLVM, ARM specific toolchain, etc..  For
> (potentially) better performance with some applications a mechanism to bo=
th
> provide the hooks for the alternative toolchain as well as a way to activ=
e
> it per-package is desired.
>
> This work assumes that the third party toolchain is generally compatible
> with the idea of sysroots, linking to the libc provided by OE, and genera=
lly
> compatible with GNU conventions.
>
> However, as part of the third party toolchain, it may not be GNU compatib=
le.
> This means many Open Source applications simply may not work with this
> toolchain.  That means that we need to have a way for a toolchain to
> blacklist (or whitelist) specific recipes.  This way only supported
> components can be built by the user, avoiding numerous complaints.
>
> Currently OE has a method to generate an SDK based on the GNU toolchain. =
 We
> would like to be able to also export the external toolchain along with th=
e
> SDK, effectively providing both the GNU toolchain and the third party
> toolchain using the common sysroot.
>
> We need a way to active the third party toolchain on a per-package basis.

Per package bases is a bit iffy from my POV if you consider the compiler ru=
ntime
and C library runtime and so forth. Is it intended to just compile and
be able to
cope with the default runtimes on images or do you also intend to figure ou=
t
ways for multiple runtimes to live together.

> This activation will need to use the existing sysroot, but be able to pas=
s
> different C, C++, LD, AS and other flags as specified by the third party
> toolchain.

that sort of answers the above. So we are assuming that toolchain that
can interoperate
will be using GNU runtime

There are cases where you might want something like ELLCC which avoids
complete GPL runtime e.g.
I think it could be divided into runtime  + tools where runtime lives
in a different layer but
essentially offering to let people use builtin C library and runtime
may not be a bad choice


>
> Finally third party toolchains should be implemented as layers that can
> easily plug into OE.

agreed. I think we need to document the interfaces in OE-Core for this
too so that
people can rely on the interface. Otherwise it will be constant pain
for keeping those
layers working together.

>
> Implementation
> ---------------------
>
> Add an OVERRIDE to specify the alternative toolchain.  Can this be done
> within the layer by doing something like:
>
> OVERRIDE_append =3D ":toolchain-${TOOLCHAIN}"
>
> TOOLCHAIN =3D "gnu" (or "icc")
>
> To activate the toolchain you would use things like:
>
> TOOLCHAIN_pn-bash =3D 'icc'
>
> To define the correct behavior for the toolchain, the following would nee=
d
> to be defined (with _toolchain-<toolchain>):
>
> TARGET_CPPFLAGS
> TARGET_CFLAGS
> TARGET_CXXFLAGS
> TARGET_LDFLAGS
> CC
> CXX
> F77
> CPP
> LD
> CCLD
> AR
> AS
> RANLIB
> STRIP
> OBJCOPY
> OBJDUMP
> NM
> FULL_OPTIMIZATIONS
> DEBUG_OPTIMIZATION
>
> Is anyone aware of any other items that may require additional items?  Wi=
ll
> the above actually work?  Using the override of the TOOLCHAIN_=E2=80=A6 w=
ill that
> actually change the override values or do we get stuck?
>
> Comments/suggestions appreciated!
> --Mark
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


