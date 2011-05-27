Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQ1mA-0004HE-3e
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 20:28:46 +0200
Received: by wwb17 with SMTP id 17so1805724wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 11:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=KKVTAcAL2zgGD/3oDeIRnv3/AP5puTOz3xKo7hrRhuc=;
	b=v+qPgZ61bcX+pgi3Ki6x5QjTd9PW6WQYL3WaabIFAmQbBQOVL6KbiziJZ3/UkR+fYc
	LGVD8L/dP+OCIKrBP+D+6cfUPcdwlApv9hyc+EvQhuSxdvqX0a1F0l6T7WY9N7AXWyZL
	3nXJXKFjObVXSyNCJ0WeWGwbikPPpB2tOjv3s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=uwNJlbeFINnOq9gB8FlbvUvH3S7bVSb+/thhMTIDBj3skdvEwSH1XEFg6M2fHNMTKk
	SWNb4ul0qBit29r6HnbRYjfw4amCm9rsm+H6ESqgGGO6RiTn0NAmcsIaDw5Bwf5Nd+Id
	nYLNU1lGwFyuD0Y14nWxFN+tDpiqHoSvM9fsU=
Received: by 10.216.27.67 with SMTP id d45mr2374188wea.21.1306520738095; Fri,
	27 May 2011 11:25:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.60.145 with HTTP; Fri, 27 May 2011 11:25:08 -0700 (PDT)
In-Reply-To: <b883a6b6076317ebc3eb64f160c5f2df6996a95e.1306520012.git.nitin.a.kamble@intel.com>
References: <cover.1306520012.git.nitin.a.kamble@intel.com>
	<b883a6b6076317ebc3eb64f160c5f2df6996a95e.1306520012.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 May 2011 11:25:08 -0700
Message-ID: <BANLkTi=nTJ5-uFhtjMh0QhsJHZyRyRwfPA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [bugfix 1/2] gcc-4.6.0: fix ICE with armv7 target
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
X-List-Received-Date: Fri, 27 May 2011 18:28:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2011 at 11:15 AM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> This fixes an internal compiler error for gcc 4.6.0 for armv7
>
> Patch came from: Phil Blundell <pb@pbcl.net>
> Validated by Nitin
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> Signed-Off-by: Phil Blundell <pb@pbcl.net>
> ---
> =C2=A0meta/recipes-devtools/gcc/gcc-4.6.0.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +-
> =C2=A0.../gcc/gcc-4.6.0/ICE_fix_for_arm.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 44 ++++++++++++++++++++
> =C2=A02 files changed, 46 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/ICE_fix_for_=
arm.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0.inc b/meta/recipes-devto=
ols/gcc/gcc-4.6.0.inc
> index fb5c70d..4407eca 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.0.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
> @@ -7,7 +7,7 @@ require gcc-common.inc
>
> =C2=A0require gcc-4_6-branch-backports.inc
>
> -PR =3D "r2"
> +PR =3D "r3"
>
> =C2=A0DEPENDS =3D+ "mpfr gmp libmpc"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native gettext-native libmpc-native=
"
> @@ -53,6 +53,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-poison-parameters.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://GPLUSPLUS_INCLUDE_DIR_with_sysr=
oot.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://COLLECT_GCC_OPTIONS.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ICE_fix_for_arm.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> =C2=A0SRC_URI_append_sh3 =C2=A0=3D " file://sh3-installfix-fixheaders.pat=
ch;patch=3D1 "
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/ICE_fix_for_arm.patch b/=
meta/recipes-devtools/gcc/gcc-4.6.0/ICE_fix_for_arm.patch
> new file mode 100644
> index 0000000..037a180
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.0/ICE_fix_for_arm.patch
> @@ -0,0 +1,44 @@
> +Upstream-Status: Pending
> +
> +Patch came from: Phil Blundell <pb@pbcl.net>
> +Validated by Nitin
> +This fixes the following internal compiler error of gcc 4.6.0 on for arm=
v7-a
> +related gcc bugzilla: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D4771=
9
> +
> +
> +| arm-poky-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon
> +-mfloat-abi=3Dsoftfp -fno-tree-vectorize
> +--sysroot=3D/srv/home/pokybuild/poky-slave/nightly-external/build/build/=
tmp/sysroots/beagleboard
> +-c -I. -I../../../../src/gallium/include -I../../../../src/gallium/auxil=
iary
> +-I../../../../src/gallium/drivers
> +-I../../../../src/gallium/drivers/svga/include -O2 -pipe -g
> +-feliminate-unused-debug-types -Wall -Wmissing-prototypes -std=3Dc99 -ff=
ast-math
> +-fvisibility=3Dhidden -fno-strict-aliasing -fPIC -D_GNU_SOURCE -DPTHREAD=
S
> +-DHAVE_POSIX_MEMALIGN -DUSE_XSHM -std=3Dgnu99 -fvisibility=3Dhidden -DHA=
VE_STDINT_H
> +-DHAVE_SYS_TYPES_H svga_resource_buffer_upload.c -o
> +svga_resource_buffer_upload.o
> +| svga_tgsi_insn.c: In function 'svga_shader_emit_instructions':
> +| svga_tgsi_insn.c:2969:1: internal compiler error: in push_minipool_fix=
, at
> +config/arm/arm.c:12084
> +| Please submit a full bug report,
> +| with preprocessed source if appropriate.
> +| See <http://gcc.gnu.org/bugs.html> for instructions.
> +| make[4]: *** [svga_tgsi_insn.o] Error 1
> +
> +Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/27
> +
> +Index: gcc-4.6.0/gcc/config/arm/arm.md
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.6.0.orig/gcc/config/arm/arm.md
> ++++ gcc-4.6.0/gcc/config/arm/arm.md
> +@@ -4213,7 +4213,9 @@
> + =C2=A0 =C2=A0uxth%?\\t%0, %1
> + =C2=A0 =C2=A0ldr%(h%)\\t%0, %1"
> + =C2=A0 [(set_attr "type" "alu_shift,load_byte")
> +- =C2=A0 (set_attr "predicable" "yes")]
> ++ =C2=A0 (set_attr "predicable" "yes")
> ++ =C2=A0 (set_attr "pool_range" "*,256")
> ++ =C2=A0 (set_attr "neg_pool_range" "*,244")]
> + )
> +

FWIW a patch which is similar to this was rejected here.
http://gcc.gnu.org/ml/gcc-patches/2011-02/msg01731.html


> + (define_insn "*arm_zero_extendhisi2addsi"
> --
> 1.7.3.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


