Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QlngD-00050a-UJ
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 21:52:38 +0200
Received: by pzk1 with SMTP id 1so1376814pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 12:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=8zA+rneM4fwq4v+ThzjMFlPdxdSLPpAC4XvvQAjtvoU=;
	b=e9tlYOhT502PwBdBxqVrunW+Tmpbt6v8y6KTfXkhQiMdBk+S5JE7KlKUu6B+K+qqwv
	YGTNdgtVZv7wnAJgleJVKEu87tBh7XpZrRlcMbZJFdHlZk/mW1wfIBpOkBmd6D3XPelU
	x4rrMIo1QYHvuMYj1DP6oMFCmR0ObMwsV21/s=
Received: by 10.68.2.103 with SMTP id 7mr9988386pbt.211.1311709703118; Tue, 26
	Jul 2011 12:48:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Tue, 26 Jul 2011 12:47:53 -0700 (PDT)
In-Reply-To: <b270e42da9fef8715c84054fc968ee7fe2492eab.1311683981.git.richard.purdie@linuxfoundation.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<b270e42da9fef8715c84054fc968ee7fe2492eab.1311683981.git.richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Jul 2011 12:47:53 -0700
Message-ID: <CAMKF1sriM_+PqzS36Cr+1_0vhmzUk7bO-62KsmOg_72YcHAMBg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] Add basic Mips core tune config
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
X-List-Received-Date: Tue, 26 Jul 2011 19:52:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2011 at 5:44 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =C2=A0meta/conf/machine/include/mips/arch-mips.inc | =C2=A0 64 ++++++++++=
+++++++++++++++-
> =C2=A0meta/conf/machine/include/tune-mips32.inc =C2=A0 =C2=A0| =C2=A0 10 =
+++-
> =C2=A02 files changed, 71 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/mac=
hine/include/mips/arch-mips.inc
> index f7f4eed..071e6b5 100644
> --- a/meta/conf/machine/include/mips/arch-mips.inc
> +++ b/meta/conf/machine/include/mips/arch-mips.inc
> @@ -1 +1,63 @@
> -TUNE_ARCH =3D "mips"
> +# MIPS Architecture definition
> +# 12 defined ABIs, all combinations of:
> +# *) Big/Little Endian
> +# *) Hardware/Software Floating Point
> +# *) o32, n32, n64 ABI
> +
> +DEFAULTTUNE ?=3D "mips"
> +
> +# Endianess
> +TUNEVALID[bigendian] =3D "Enable big-endian mode"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-m=
eb", "-mel", d)}"
> +
> +# ABI flags
> +TUNEVALID[o32] =3D "MIPS o32 ABI"
> +TUNECONFLICT[o32] =3D "n32 n64"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "o32", "-mabi=3D=
32", "", d)}"
> +
> +TUNEVALID[n32] =3D "MIPS64 n32 ABI"
> +TUNECONFLICT[n32] =3D "o32 n64"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "n32", "-mabi=3D=
n32", "", d)}"
> +
> +TUNEVALID[n64] =3D "MIPS64 n64 ABI"
> +TUNECONFLICT[n64] =3D "o32 n32"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "n64", "-mabi=3D=
64", "", d)}"
> +
> +# Floating point
> +TUNEVALID[fpu-hard] =3D "Use hardware FPU"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mh=
ard-float", "-msoft-float", d)}"
> +TARGET_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "", "s=
oft", d)}"
> +
> +# Package naming
> +MIPSPKGSFX_ENDIAN =3D "${@bb.utils.contains("TUNE_FEATURES", "bigendian"=
, "", "el", d)}"
> +MIPSPKGSFX_BYTE =3D "${@bb.utils.contains("TUNE_FEATURES", "n64" , "64",=
 "", d)}"
> +
> +TUNE_ARCH =3D "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
> +
> +# Base tunes
> +AVAILTUNES +=3D "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mip=
s-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"

may be nf should be called nofpu to make it a familiar term.

> +TUNE_FEATURES_tune-mips =3D "o32 bigendian fpu-hard"
> +BASE_LIB_tune-mips =3D "lib"
> +TUNE_FEATURES_tune-mips64-n32 =3D "n32 bigendian fpu-hard"
> +BASE_LIB_tune-mips64-n32 =3D "lib32"
> +TUNE_FEATURES_tune-mips64 =3D "n64 bigendian fpu-hard"
> +BASE_LIB_tune-mips64 =3D "lib64"
> +TUNE_FEATURES_tune-mipsel =3D "o32 fpu-hard"
> +BASE_LIB_tune-mipsel =3D "lib"
> +TUNE_FEATURES_tune-mips64el-n32 =3D "n32 fpu-hard"
> +BASE_LIB_tune-mips64el-n32 =3D "lib32"
> +TUNE_FEATURES_tune-mips64el =3D "n64 fpu-hard"
> +BASE_LIB_tune-mips64el =3D "lib64"
> +TUNE_FEATURES_tune-mips-nf =3D "o32 bigendian"
> +BASE_LIB_tune-mips-nf =3D "lib"
> +TUNE_FEATURES_tune-mips64-nf-n32 =3D "n32 bigendian"
> +BASE_LIB_tune-mips64-nf-n32 =3D "lib32"
> +TUNE_FEATURES_tune-mips64-nf =3D "n64 bigendian"
> +BASE_LIB_tune-mips64-nf =3D "lib64"
> +TUNE_FEATURES_tune-mipsel-nf =3D "o32"
> +BASE_LIB_tune-mipsel-nf =3D "lib"
> +TUNE_FEATURES_tune-mips64el-nf-n32 =3D "n32"
> +BASE_LIB_tune-mips64el-nf-n32 =3D "lib32"
> +TUNE_FEATURES_tune-mips64el-nf =3D "n64"
> +BASE_LIB_tune-mips64el-nf =3D "lib64"
> +
> diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machin=
e/include/tune-mips32.inc
> index 28b0047..1f913df 100644
> --- a/meta/conf/machine/include/tune-mips32.inc
> +++ b/meta/conf/machine/include/tune-mips32.inc
> @@ -1,4 +1,10 @@
> +DEFAULTTUNE ?=3D "mips32"
> +
> =C2=A0require conf/machine/include/mips/arch-mips.inc
>
> -TUNE_CCARGS =3D "-march=3Dmips32"
> -TUNE_PKGARCH =3D "mips"
> +TUNEVALID[mips32] =3D "Enable mips32 specific processor optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-marc=
h=3Dmips32", "", d)}"
> +
> +AVAILTUNES +=3D "mips32"
> +TUNE_FEATURES_tune-mips32 =3D "${TUNE_FEATURES_tune-mips} mips32"
> +PACKAGE_EXTRA_ARCHS_tune-mips32 =3D "mips"
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


