Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Px2KK-0000Zk-NM
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 20:12:12 +0100
Received: by fxm8 with SMTP id 8so5467386fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2011 11:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=5fiuUD3rbxyo2ZlqvWRTxEs9m7PS0TrXJGqV+inXKow=;
	b=XEMV5jDpBnO3j17v0lKsGTR8J2SWrLbWnpVEQCcwv8dnXx4I7lAofRPARyhQlnzbLT
	wH7e1jNrbkm6/glnj4+FpmdS7lzR2HxcuWvyU4UtLlCZNFkDZW0PkOkf+xqP5d6eqSvH
	Pvglt25MiuGeqhdLJmbPQvRFYnIbYJ0NZGIYo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=DOAaLXTTfF5fzZchpIN0cb3JAeVxRRF4KPs+DQ75eGodoM7DxUHIR78kNNP6OJN5Mi
	H1VHJ6rVi1n9tkf6iX59CbTGeZjOTwvH1eaEVZ2BATN9QsX6eLDeg76KoQpTw9ctIUqG
	5mJp4tV/F+AH9wS08alTuBlrwprQO8/0bZIr0=
Received: by 10.223.143.86 with SMTP id t22mr993314fau.74.1299611116291; Tue,
	08 Mar 2011 11:05:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Tue, 8 Mar 2011 11:04:46 -0800 (PST)
In-Reply-To: <1299610396.602.104.camel@rex>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-4-git-send-email-raj.khem@gmail.com>
	<AANLkTiks0VSWcW4_54mQUv17ZQvb8+CsbWcsDkA_9ZA+@mail.gmail.com>
	<1299610396.602.104.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Mar 2011 11:04:46 -0800
Message-ID: <AANLkTim62_Vb=EumqASMY_ARCJkS8M7rTAUtpxnMR6gx@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 3/6] gcc: Statically link in support libraries e.g. libmpfr libgmp etc.
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
X-List-Received-Date: Tue, 08 Mar 2011 19:12:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 8, 2011 at 10:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2011-03-07 at 22:38 -0800, Khem Raj wrote:
>> ping any opinion on this patch ?
>
> This change looks rather hacky and I'd really like to understand more
> about why this is needed and whether there is a better way we could
> ensure the right flags get passed around. Can you provide more details
> about whats going on with this. Obviously this change as it stands isn't
> acceptable to upstream gcc and I'd like to see if we could find one that
> was.

this is because the supporting libraries like mpc mpfr that are needed
by gcc itself to run
we might have different versions of these libraries. So depending upon
shared objects
would mean we need to find same shared objects where say the SDK is install=
ed
so either we ship the whole baggage or we link it in statically. This
patch makes those libs to
linked in statically and cross gcc wont have dependencies on these
libs anymore so
it can run on all hosts pretty much.

Another different way to do it would be to build these libraries as
part of gcc-cross build in unified tree
and then gcc would automatically link in the static versions of these
libraries. As a downside
if the native versions of these libraries are needed elesewhere then
we will build that lib twice.
But it should be cleaner IMO to just build them intree with gcc.

>
> Cheers,
>
> Richard
>
>> On Wed, Mar 2, 2011 at 10:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > * This is helpful to get consistent behaviour with gcc on different
>> > =C2=A0hosts and linking the libraries in for cross gcc recipes should =
not
>> > =C2=A0be increasing the binary size alarmingly
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> > =C2=A0meta/recipes-devtools/gcc/gcc-configure-common.inc | =C2=A0 =C2=
=A07 +++++++
>> > =C2=A0meta/recipes-devtools/gcc/gcc-configure-cross.inc =C2=A0| =C2=A0=
 10 ++++++++++
>> > =C2=A0meta/recipes-devtools/gcc/gcc-configure-sdk.inc =C2=A0 =C2=A0| =
=C2=A0 =C2=A08 ++++++++
>> > =C2=A0.../gcc/gcc-cross-canadian_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> > =C2=A0.../gcc/gcc-cross-canadian_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> > =C2=A0.../gcc/gcc-cross-initial_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
>> > =C2=A0.../gcc/gcc-cross-initial_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
>> > =C2=A0.../gcc/gcc-cross-intermediate_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> > =C2=A0.../gcc/gcc-cross-intermediate_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> > =C2=A0.../gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb =C2=A0 | =C2=A0=
 =C2=A02 +-
>> > =C2=A0meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +-
>> > =C2=A0meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +-
>> > =C2=A0.../gcc/gcc-cross_csl-arm-2008q1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> > =C2=A0.../gcc/gcc-crosssdk-initial_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> > =C2=A0.../gcc/gcc-crosssdk-initial_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> > =C2=A0.../gcc/gcc-crosssdk-intermediate_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A02 +-
>> > =C2=A0.../gcc/gcc-crosssdk-intermediate_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A02 +-
>> > =C2=A0meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb =C2=A0 =C2=A0| =
=C2=A0 =C2=A02 +-
>> > =C2=A0meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb =C2=A0 =C2=A0 | =
=C2=A0 =C2=A02 +-
>> > =C2=A0meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb =C2=A0 =C2=A0 | =
=C2=A0 =C2=A02 +-
>> > =C2=A0meta/recipes-devtools/gcc/gcc_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
>> > =C2=A0meta/recipes-devtools/gcc/gcc_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
>> > =C2=A0meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb =C2=A0 =C2=A0| =
=C2=A0 =C2=A02 +-
>> > =C2=A0meta/recipes-devtools/gcc/libgcc_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> > =C2=A024 files changed, 46 insertions(+), 21 deletions(-)
>> >
>> > diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta=
/recipes-devtools/gcc/gcc-configure-common.inc
>> > index 4393777..cdb69fb 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> > +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> > @@ -85,6 +85,11 @@ do_configure () {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0export CXXFLAGS_FOR_BUILD=3D"${BUILD_CXXFLA=
GS}"
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0export LDFLAGS_FOR_BUILD=3D"${BUILD_LDFLAGS=
}"
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0export ARCH_FLAGS_FOR_TARGET=3D"${ARCH_FLAG=
S_FOR_TARGET}"
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0# Make sure LDFLAGS are honored.
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i 's/^LDFLAGS =3D $/LDFLAGS =3D @LDF=
LAGS@/' ${S}/Makefile.in
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i 's/^LDFLAGS =3D $/LDFLAGS =3D @LDF=
LAGS@/' ${S}/Makefile.tpl
>> > +
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} && gnu-configize) || die "failure =
running gnu-configize"
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0# teach gcc to find correct target included=
ir when checking libc ssp support
>> > @@ -108,5 +113,7 @@ do_configure () {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "#endif /* ! GCC_DEFAULTS_H */" >> ${S=
}/gcc/defaults.h.new
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${S}/gcc/defaults.h.new ${S}/gcc/default=
s.h
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runconf
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0# make sure that no @LDFLAG@ is left in t=
he generated Makefile
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i "s/@LDFLAGS@//g" ${B}/Makefile
>> > =C2=A0}
>> >
>> > diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/=
recipes-devtools/gcc/gcc-configure-cross.inc
>> > index 346d164..200cbe2 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
>> > +++ b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
>> > @@ -16,6 +16,16 @@ do_compile_prepend () {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0export LD_FOR_TARGET=3D"${TARGET_SYS}-ld"
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0export NM_FOR_TARGET=3D"${TARGET_SYS}-nm"
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0export CC_FOR_TARGET=3D"${CCACHE} ${TARGET_=
SYS}-gcc ${TARGET_CC_ARCH}"
>> > + =C2=A0 =C2=A0 =C2=A0 export OBJDUMP_FOR_TARGET=3D"${TARGET_SYS}-objd=
ump"
>> > + =C2=A0 =C2=A0 =C2=A0 export OBJCOPY_FOR_TARGET=3D"${TARGET_SYS}-objc=
opy"
>> > + =C2=A0 =C2=A0 =C2=A0 export STRIP_FOR_TARGET=3D"${TARGET_SYS}-strip"
>> > + =C2=A0 =C2=A0 =C2=A0 # Make sure we use GMP/MPFR statically
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_GMPLIBS =3D\) \(.*\)$/\1 -Wl,=
-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_GMPLIBS =3D\) \(.*\)$/\1 -Wl,=
-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_PPLLIBS =3D\) \(.*\)$/\1 -Wl,=
-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_PPLLIBS =3D\) \(.*\)$/\1 -Wl,=
-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_LIBELFLIBS =3D\) \(.*\)$/\1 -=
Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_LIBELFLIBS =3D\) \(.*\)$/\1 -=
Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
>> > =C2=A0}
>> >
>> > =C2=A0LIBGCCS_VAR =3D "-lgcc_s"
>> > diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-sdk.inc
>> > index 756e74e..3eb8992 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
>> > +++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
>> > @@ -39,6 +39,14 @@ do_configure () {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0export CPPFLAGS_FOR_BUILD=3D"${BUILD_CPPFLA=
GS}"
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0export CXXFLAGS_FOR_BUILD=3D"${BUILD_CXXFLA=
GS}"
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0export LDFLAGS_FOR_BUILD=3D"${BUILD_LDFLAGS=
}"
>> > + =C2=A0 =C2=A0 =C2=A0 export CC_FOR_TARGET=3D"${CCACHE} ${TARGET_SYS}=
-gcc ${TARGET_CC_ARCH}"
>> > + =C2=A0 =C2=A0 =C2=A0 # Make sure we use GMP/MPFR statically
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_GMPLIBS =3D\) \(.*\)$/\1 -Wl,=
-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_GMPLIBS =3D\) \(.*\)$/\1 -Wl,=
-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_PPLLIBS =3D\) \(.*\)$/\1 -Wl,=
-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_PPLLIBS =3D\) \(.*\)$/\1 -Wl,=
-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_LIBELFLIBS =3D\) \(.*\)$/\1 -=
Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
>> > + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_LIBELFLIBS =3D\) \(.*\)$/\1 -=
Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} && gnu-configize) || die "failure =
running gnu-configize"
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runconf
>> > =C2=A0}
>> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.bb b/m=
eta/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.bb
>> > index d420f80..8bf07d7 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.bb
>> > @@ -5,7 +5,7 @@ require gcc-cross-canadian.inc
>> > =C2=A0require gcc-configure-sdk.inc
>> > =C2=A0require gcc-package-sdk.inc
>> >
>> > -PR =3D "r20"
>> > +PR =3D "r21"
>> >
>> > =C2=A0DEPENDS +=3D "gmp-nativesdk mpfr-nativesdk"
>> > =C2=A0RDEPENDS_${PN} +=3D "mpfr-nativesdk"
>> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb b/m=
eta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb
>> > index 3eea4bc..92708d4 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb
>> > @@ -5,7 +5,7 @@ require gcc-cross-canadian.inc
>> > =C2=A0require gcc-configure-sdk.inc
>> > =C2=A0require gcc-package-sdk.inc
>> >
>> > -PR =3D "r3"
>> > +PR =3D "r4"
>> >
>> > =C2=A0DEPENDS +=3D "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfu=
tils-nativesdk"
>> > =C2=A0RDEPENDS_${PN} +=3D "mpfr-nativesdk libmpc-nativesdk elfutils-na=
tivesdk"
>> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb b/me=
ta/recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb
>> > index 28ac1ab..ef52845 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb
>> > @@ -1,5 +1,5 @@
>> > =C2=A0require gcc-cross_${PV}.bb
>> > =C2=A0require gcc-cross-initial.inc
>> >
>> > -PR =3D "r5"
>> > +PR =3D "r6"
>> >
>> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb b/me=
ta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb
>> > index b2c257d..38e0964 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb
>> > @@ -1,5 +1,5 @@
>> > =C2=A0require gcc-cross_${PV}.bb
>> > =C2=A0require gcc-cross-initial.inc
>> >
>> > -PR =3D "r2"
>> > +PR =3D "r3"
>> >
>> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb=
 b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb
>> > index a8473b0..deeee37 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb
>> > @@ -1,4 +1,4 @@
>> > =C2=A0require gcc-cross_${PV}.bb
>> > =C2=A0require gcc-cross-intermediate.inc
>> > -PR =3D "r5"
>> > +PR =3D "r6"
>> >
>> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb=
 b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb
>> > index e65d5df..9a30cb5 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb
>> > @@ -1,4 +1,4 @@
>> > =C2=A0require gcc-cross_${PV}.bb
>> > =C2=A0require gcc-cross-intermediate.inc
>> > -PR =3D "r3"
>> > +PR =3D "r4"
>> >
>> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-=
2005q3.bb b/meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3=
.bb
>> > index 88e3842..462104f 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.=
bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.=
bb
>> > @@ -9,7 +9,7 @@ require gcc-cross-kernel.inc
>> >
>> > =C2=A0DEFAULT_PREFERENCE =3D "-1"
>> >
>> > -PR =3D "r4"
>> > +PR =3D "r5"
>> >
>> > =C2=A0SRC_URI +=3D "file://gcc-3.4.4-makefile-fix.patch;patch=3D1"
>> >
>> > diff --git a/meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb b/meta/recip=
es-devtools/gcc/gcc-cross_4.3.3.bb
>> > index 5eaac5f..1a982f5 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb
>> > @@ -1,4 +1,4 @@
>> > -PR =3D "r17"
>> > +PR =3D "r18"
>> >
>> > =C2=A0require gcc-${PV}.inc
>> > =C2=A0require gcc-cross4.inc
>> > diff --git a/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb b/meta/recip=
es-devtools/gcc/gcc-cross_4.5.1.bb
>> > index 399cdf9..78bb05a 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb
>> > @@ -1,4 +1,4 @@
>> > -PR =3D "r2"
>> > +PR =3D "r3"
>> >
>> > =C2=A0require gcc-${PV}.inc
>> > =C2=A0require gcc-cross4.inc
>> > diff --git a/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb b/m=
eta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
>> > index 89534f1..0e7a1ee 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
>> > @@ -1,4 +1,4 @@
>> > -PR =3D "r5"
>> > +PR =3D "r6"
>> >
>> > =C2=A0require gcc-csl-arm-2008q1.inc
>> > =C2=A0require gcc-cross4.inc
>> > diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb b=
/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb
>> > index b42de47..d3ddcb1 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb
>> > @@ -1,3 +1,3 @@
>> > =C2=A0require gcc-cross-initial_${PV}.bb
>> > =C2=A0require gcc-crosssdk-initial.inc
>> > -PR =3D "r6"
>> > +PR =3D "r7"
>> > diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb b=
/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb
>> > index 240caf5..fec53b9 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb
>> > @@ -1,4 +1,4 @@
>> > =C2=A0require gcc-cross-initial_${PV}.bb
>> > =C2=A0require gcc-crosssdk-initial.inc
>> >
>> > -PR =3D "r2"
>> > +PR =3D "r3"
>> > diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3=
.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3.bb
>> > index cd1f966..2be05f1 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3.bb
>> > @@ -1,3 +1,3 @@
>> > =C2=A0require gcc-cross-intermediate_${PV}.bb
>> > =C2=A0require gcc-crosssdk-intermediate.inc
>> > -PR =3D "r8"
>> > +PR =3D "r9"
>> > diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1=
.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb
>> > index a6653dd..161d870 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb
>> > @@ -1,4 +1,4 @@
>> > =C2=A0require gcc-cross-intermediate_${PV}.bb
>> > =C2=A0require gcc-crosssdk-intermediate.inc
>> >
>> > -PR =3D "r2"
>> > +PR =3D "r3"
>> > diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb b/meta/re=
cipes-devtools/gcc/gcc-crosssdk_4.5.1.bb
>> > index 129e8d3..7069088 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb
>> > @@ -1,4 +1,4 @@
>> > =C2=A0require gcc-cross_${PV}.bb
>> > =C2=A0require gcc-crosssdk.inc
>> >
>> > -PR =3D "r2"
>> > +PR =3D "r3"
>> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb b/meta/rec=
ipes-devtools/gcc/gcc-runtime_4.3.3.bb
>> > index 99f927a..2f5cfb5 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb
>> > @@ -1,4 +1,4 @@
>> > -PR =3D "r18"
>> > +PR =3D "r19"
>> >
>> > =C2=A0require gcc-${PV}.inc
>> > =C2=A0require gcc-configure-runtime.inc
>> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb b/meta/rec=
ipes-devtools/gcc/gcc-runtime_4.5.1.bb
>> > index 093f9bf..c1e680d 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
>> > @@ -1,4 +1,4 @@
>> > -PR =3D "r2"
>> > +PR =3D "r3"
>> >
>> > =C2=A0require gcc-${PV}.inc
>> > =C2=A0require gcc-configure-runtime.inc
>> > diff --git a/meta/recipes-devtools/gcc/gcc_4.3.3.bb b/meta/recipes-dev=
tools/gcc/gcc_4.3.3.bb
>> > index f0471d4..ba6e7b2 100644
>> > --- a/meta/recipes-devtools/gcc/gcc_4.3.3.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc_4.3.3.bb
>> > @@ -1,4 +1,4 @@
>> > -PR =3D "r11"
>> > +PR =3D "r12"
>> >
>> > =C2=A0require gcc-${PV}.inc
>> > =C2=A0require gcc-configure-target.inc
>> > diff --git a/meta/recipes-devtools/gcc/gcc_4.5.1.bb b/meta/recipes-dev=
tools/gcc/gcc_4.5.1.bb
>> > index 919d4b0..25e455c 100644
>> > --- a/meta/recipes-devtools/gcc/gcc_4.5.1.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
>> > @@ -1,4 +1,4 @@
>> > -PR =3D "r2"
>> > +PR =3D "r3"
>> > =C2=A0require gcc-${PV}.inc
>> > =C2=A0require gcc-configure-target.inc
>> > =C2=A0require gcc-package-target.inc
>> > diff --git a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb b/meta/re=
cipes-devtools/gcc/gcc_csl-arm-2008q1.bb
>> > index cc7540a..2df12ef 100644
>> > --- a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
>> > +++ b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
>> > @@ -1,4 +1,4 @@
>> > -PR =3D "r3"
>> > +PR =3D "r4"
>> >
>> > =C2=A0require gcc-${PV}.inc
>> > =C2=A0require gcc-configure-target.inc
>> > diff --git a/meta/recipes-devtools/gcc/libgcc_4.5.1.bb b/meta/recipes-=
devtools/gcc/libgcc_4.5.1.bb
>> > index b6cf268..3f7ce0a 100644
>> > --- a/meta/recipes-devtools/gcc/libgcc_4.5.1.bb
>> > +++ b/meta/recipes-devtools/gcc/libgcc_4.5.1.bb
>> > @@ -1,6 +1,6 @@
>> > =C2=A0require gcc-${PV}.inc
>> >
>> > -PR =3D "r0"
>> > +PR =3D "r1"
>> >
>> > =C2=A0INHIBIT_DEFAULT_DEPS =3D "1"
>> > =C2=A0DEPENDS =3D "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX=
}g++"
>> > --
>> > 1.7.4.1
>> >
>> >
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


