Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qlo5R-0005iH-PH
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 22:18:42 +0200
Received: by pzk1 with SMTP id 1so1410050pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 13:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=2RqGCcJlkd10ONj4tFEjjMn3oeB4f9LFm4UHGxr/hNg=;
	b=W0MwB37GtTfn9lQRgtJssd1y51Of+d3SLdjEMPQK2R0p6PtQ2jTyBR1Fto4k/XdFd9
	k4TTJTGTxkAIM9LgoKfNrnHr9uRX9DC0lt84LQaMdROygLPP9UIamTrxjnLYEwr9wmdL
	ms0ecjxkbVXd7Ah3stJZzqbGfB5/7cAESqZp8=
Received: by 10.68.29.200 with SMTP id m8mr11161912pbh.278.1311711267098; Tue,
	26 Jul 2011 13:14:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Tue, 26 Jul 2011 13:13:57 -0700 (PDT)
In-Reply-To: <1311698198.2344.279.camel@rex>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<4E2ED5F2.3090306@windriver.com> <1311698198.2344.279.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Jul 2011 13:13:57 -0700
Message-ID: <CAMKF1srQFGGkYfh14WPi93aQC84k2syVA9mTjPamRJR2sBXqCQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Tue, 26 Jul 2011 20:18:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2011 at 9:36 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-07-26 at 09:57 -0500, Mark Hatle wrote:
>> On 7/26/11 7:44 AM, Richard Purdie wrote:
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > ---
>> > =C2=A0meta/conf/machine/include/powerpc/arch-powerpc.inc | =C2=A0 45 +=
++++++++++++++++++-
>> > =C2=A0meta/conf/machine/include/tune-ppc603e.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 12 ++++-
>> > =C2=A0meta/conf/machine/include/tune-ppce300c2.inc =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 12 ++++-
>> > =C2=A0meta/conf/machine/include/tune-ppce500.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 13 ++++--
>> > =C2=A0meta/conf/machine/include/tune-ppce500mc.inc =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 12 ++++-
>> > =C2=A0meta/conf/machine/include/tune-ppce500v2.inc =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 12 ++++-
>> > =C2=A06 files changed, 88 insertions(+), 18 deletions(-)
>> >
>> > diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta=
/conf/machine/include/powerpc/arch-powerpc.inc
>> > index 17ace32..3f7befb 100644
>> > --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> > +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> > @@ -1,3 +1,44 @@
>> > -TUNE_ARCH =3D "powerpc"
>> > +# Power Architecture definition
>> > +# Four defined ABIs, all combinations of:
>> > +# *) Hard/Soft Floating Point
>> > +# *) 32-bit/64-bit
>> > +
>> > +DEFAULTTUNE ?=3D "powerpc"
>> > +
>> > +TUNEVALID[m32] =3D "Power ELF32 standard ABI"
>> > +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32"=
, "", d)}"
>> > +
>> > +TUNEVALID[m32-arch] =3D "Enable powerpc package architecture"
>> > +TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "m32-arch" ],=
 "powerpc", "", d)}"
>> > +
>> > +TUNEVALID[m64] =3D "Power ELF64 standard ABI"
>> > +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "n64", "-m64"=
, "", d)}"
>> > +
>> > +TUNEVALID[m64-arch] =3D "Enable powerpc64 package architecture"
>> > +TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "m64-arch" ],=
 "powerpc64", "", d)}"
>>
>> Why m32-arch and m64-arch? =C2=A0If m32 or m64 is selected then it shoul=
d mean
>> powerpc or powerpc64.
>
> I've gotten confused here and mixed up TUNE_ARCH and TUNE_PKGARCH but
> there was a reason.
>
> The missing piece is
>
> TUNE_PKGARCH ?=3D "${TUNE_ARCH}"
>
> and the trouble comes when a tune file wants to change this only when
> its tune config is in action.
>
> I'm thinking ahead to trying a mixed ppc 32 and 64 bit build where
> TUNE_PKGARCH needs to take on the values for both configs.
>
>> > +TUNEVALID[fpu-hard] =3D "Use hardware FPU."
>> > +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "=
-mhard-float", "", d)}"
>> > +
>> > +TUNEVALID[fpu-soft] =3D "Use software FPU."
>> > +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "=
-msoft-float", "", d)}"
>> > +TARGET_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "s=
oft", "", d)}"
>>
>> Why specify both fpu-hard and fpu-soft? =C2=A0The "unusual" ABI is fpu-s=
oft. =C2=A0It
>> would simplify it to only have to specify one, and you get the other aut=
omatically.
>
> The trouble is the spe pieces which seemed to imply TARGET_FPU should
> take on a value of other than "soft". Setting it to "soft" if fpu-hard
> isn't in TUNE_FEATURES therefore wasn't enough...
>
>> > +TUNEVALID[spe] =3D "Enable SPE ABI extensions"
>> > +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=
=3Dspe -mspe", "", d)}"
>> > +
>> > +ABIEXTENSION =3D "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc=
-efd', 'ppc-efs']]}"
>>
>> SPE instructions are specific to certain processors and not generic acro=
ss all
>> of PPC. =C2=A0I would move this to each of the tunes where it may be use=
d.
>
> I guess this should be a feature file like thumb on arm?
>
>> Also I see the ABIEXTENSION, but where is it being set?
>
> I'm just migrating the existing code in that regard, I'm also puzzled as
> to where that is getting set currently.
>
>> > +# Basic tune definitions
>> > +AVAILTUNES +=3D "powerpc powerpc-nf"
>> > +TUNE_FEATURES_tune-powerpc ?=3D "m32 m32-arch fpu-hard"
>> > +BASE_LIB_tune-powerpc =3D "lib"
>> > +TUNE_FEATURES_tune-powerpc-nf ?=3D "m32 m32-arch fpu-soft"
>> > +BASE_LIB_tune-powerpc-nf =3D "lib"
>> > +
>> > +AVAILTUNES +=3D "powerpc64 powerpc64-nf"
>> > +TUNE_FEATURES_tune-powerpc64 ?=3D "m64 m64-arch fpu-hard"
>> > +BASE_LIB_tune-powerpc64 =3D "lib64"
>> > +TUNE_FEATURES_tune-powerpc64-nf ?=3D "m64 m64-arch fpu-soft"
>> > +BASE_LIB_tune-powerpc64-nf =3D "lib64"
>> >
>> > -ABIEXTENSION =3D "${@['','spe'][bb.data.getVar('TARGET_FPU',d,1) in [=
'ppc-efd', 'ppc-efs']]}"
>> > diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/ma=
chine/include/tune-ppc603e.inc
>> > index 61c0669..6991ae0 100644
>> > --- a/meta/conf/machine/include/tune-ppc603e.inc
>> > +++ b/meta/conf/machine/include/tune-ppc603e.inc
>> > @@ -1,5 +1,11 @@
>> > +DEFAULTTUNE ?=3D "ppc603e"
>> > +
>> > =C2=A0require conf/machine/include/powerpc/arch-powerpc.inc
>> >
>> > -TUNE_CCARGS =3D "-mcpu=3D603e =C2=A0-mhard-float"
>> > -TUNE_PKGARCH =3D "ppc603e"
>> > -PACKAGE_EXTRA_ARCHS =3D "powerpc ppc603e"
>> > +TUNEVALID[ppc603e] =3D "Enable ppc603e specific processor optimizatio=
ns"
>> > +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-=
mcpu=3D603e", "", d)}"
>> > +TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc=
603e", "", d)}"
>> > +
>> > +AVAILTUNES +=3D "ppc603e"
>> > +TUNE_FEATURES_tune-ppc603e =3D "m32 fpu-hard ppc603e"
>> > +PACKAGE_EXTRA_ARCHS_tune-ppc603e =3D "powerpc ppc603e"
>>
>> Going back to my original comment, the m32-arch is missing... or m32 sho=
uld mean
>> "powerpc" (my suggestion).
>
> No, TUNE_ARCH should be TUNE_PKGARCH above, then this makes more
> sense...
>
>> > diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/=
machine/include/tune-ppce300c2.inc
>> > index a38e97c..652422f 100644
>> > --- a/meta/conf/machine/include/tune-ppce300c2.inc
>> > +++ b/meta/conf/machine/include/tune-ppce300c2.inc
>> > @@ -1,5 +1,11 @@
>> > +DEFAULTTUNE ?=3D "ppce300"
>> > +
>> > =C2=A0require conf/machine/include/powerpc/arch-powerpc.inc
>> >
>> > -TUNE_CCARGS =3D "-mcpu=3De300c2 -msoft-float"
>> > -TUNE_PKGARCH =3D "ppce300"
>> > -PACKAGE_EXTRA_ARCHS =3D "powerpc ppce300"
>> > +TUNEVALID[ppce300] =3D "Enable ppce300 specific processor optimizatio=
ns"
>> > +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300", "-=
mcpu=3De300c2", "", d)}"
>> > +TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300", "ppc=
e300", "", d)}"
>> > +
>> > +AVAILTUNES +=3D "ppce300"
>> > +TUNE_FEATURES_tune-ppce300 =3D "m32 fpu-soft ppce300"
>> > +PACKAGE_EXTRA_ARCHS_tune-ppce300 =3D "powerpc ppce300"
>>
>> There is also a ppce300 as well as the e300c2, so I'd change the option =
to be
>> fully qualified. =C2=A0(One has floating point one doesn't..)
>
> Fair enough.
>
>> > diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/ma=
chine/include/tune-ppce500.inc
>> > index 22208f0..fe62445 100644
>> > --- a/meta/conf/machine/include/tune-ppce500.inc
>> > +++ b/meta/conf/machine/include/tune-ppce500.inc
>> > @@ -1,6 +1,11 @@
>> > +DEFAULTTUNE ?=3D "ppce500"
>> > +
>> > =C2=A0require conf/machine/include/powerpc/arch-powerpc.inc
>> >
>> > -TUNE_CCARGS =3D "-mcpu=3D8540"
>> > -BASE_PACKAGE_ARCH =3D "ppce500"
>> > -TUNE_PKGARCH =3D "ppce500"
>> > -PACKAGE_EXTRA_ARCHS =3D "powerpc ppce500"
>> > +TUNEVALID[ppce500] =3D "Enable ppce500 specific processor optimizatio=
ns"
>> > +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-=
mcpu=3D8540", "", d)}"
>> > +TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "ppc=
e500", "", d)}"
>> > +
>> > +AVAILTUNES +=3D "ppce500"
>> > +TUNE_FEATURES_tune-ppce500 =3D "m32 ppce500"
>> > +PACKAGE_EXTRA_ARCHS_tune-ppce500 =3D "powerpc ppce500"
>>
>> This is the single precision e500 -- it should be specifying it's floati=
ng point
>> type.
>
> which is? :)

ppc-efs in oe terms

>
>> > diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/=
machine/include/tune-ppce500mc.inc
>> > index 182d019..0d3640f 100644
>> > --- a/meta/conf/machine/include/tune-ppce500mc.inc
>> > +++ b/meta/conf/machine/include/tune-ppce500mc.inc
>> > @@ -1,5 +1,11 @@
>> > +DEFAULTTUNE ?=3D "ppce500mc"
>> > +
>> > =C2=A0require conf/machine/include/powerpc/arch-powerpc.inc
>> >
>> > -TUNE_CCARGS =3D "-mcpu=3De500mc"
>> > -TUNE_PKGARCH =3D "ppce500mc"
>> > -PACKAGE_EXTRA_ARCHS =3D "powerpc ppce500mc"
>> > +TUNEVALID[ppce500mc] =3D "Enable ppce500mc specific processor optimiz=
ations"
>> > +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", =
"-mcpu=3De500mc", "", d)}"
>> > +TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "p=
pce500mc", "", d)}"
>> > +
>> > +AVAILTUNES +=3D "ppce500mc"
>> > +TUNE_FEATURES_tune-ppce500mc =3D "m32 ppce500mc"
>> > +PACKAGE_EXTRA_ARCHS_tune-ppce500mc =3D "powerpc ppce500mc"
>>
>> e500mc using the classic "hard-float" floating point unit.
>
> ok, so its hard-fpu...
>
>> > diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/=
machine/include/tune-ppce500v2.inc
>> > index daf2d58..e6b48a2 100644
>> > --- a/meta/conf/machine/include/tune-ppce500v2.inc
>> > +++ b/meta/conf/machine/include/tune-ppce500v2.inc
>> > @@ -1,5 +1,11 @@
>> > +DEFAULTTUNE ?=3D "ppce500v2"
>> > +
>> > =C2=A0require conf/machine/include/powerpc/arch-powerpc.inc
>> >
>> > -TUNE_CCARGS =3D "-mcpu=3D8548 -mabi=3Dspe -mspe"
>> > -TUNE_PKGARCH =3D "ppce500v2"
>> > -PACKAGE_EXTRA_ARCHS =3D "powerpc ppce500v2"
>> > +TUNEVALID[ppce500mc] =3D "Enable ppce500mc specific processor optimiz=
ations"
>> > +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", =
"-mcpu=3D8548", "", d)}"
>> > +TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "p=
pce500v2", "", d)}"
>> > +
>> > +AVAILTUNES +=3D "ppce500v2"
>> > +TUNE_FEATURES_tune-ppce500v2 =3D "m32 spe ppce500v2"
>> > +PACKAGE_EXTRA_ARCHS_tune-ppce500v2 =3D "powerpc ppce500v2"
>>
>> This one is double precision.
>
> so hard-fpu?

no its spe with double precision which is ppc-efd

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


