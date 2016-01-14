Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 056F2731AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:24:22 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u188so45938724wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zaOIdC0P3SHb47FXYmzYPERIfs9ElQlpFOlLMC/DYvk=;
	b=1KKW6C6RZnIHqPjwjgu51bK/A6ycDvWtFaWY8+CO63Y7E1PK1TpX6dxocyKkVF/ANr
	FIoOq+wVNV9RnQpBVEcKva1eyuL+6d41411aHmHetbu84d8NExlGzCEcjfHJBVcx2tlh
	SfwRIAVx47xRWhmfwlk5EzvK6o8tucSvzYXrfHbDqGZTJK37z5C/40OePsg+QYKzEL2n
	nbviKZEUSJuCmhsTV9hrLQ/9DKlnPZ1iRJufaaohytGGdB4BkRlqrncCBaPHW7SDshZT
	ZdCZ2AoXy/jcKiEXP7+1VBsm2Ts/Ta5GDsAWflIpxh/DsYP7m2YsV8r6mZkQFit41dGL
	JdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=zaOIdC0P3SHb47FXYmzYPERIfs9ElQlpFOlLMC/DYvk=;
	b=V1/vSEXcIZtC+5H8CYyZU8eyI1vB4E0bRNnnk+RwELSZjBFum7AVFkL4mhm8fi5S1I
	6FSQN4WItlIayUSymmvZlmmy8rBnqZeyZomU7RT1vn2Sope7Skltj4jtzsJiKte0hqgG
	AqLcXEtBCgvXHiUxKlo6TRuHdKg+d5ChYEcu7/7t0W7M7i50a//7ar7xu1HrO5PqJMja
	8Ym3PogutlmfyS3qV1boQriEmeypLDuScassxCXVUovkYccq27bplzKiJMNqg8TVbzJR
	rxMfI+XgnSNgMTWY0ex+bQPjcWNPazh61XcGNelCLi64QTBbNbGQPpPjjAFFkLg7DBDP
	6unQ==
X-Gm-Message-State: ALoCoQlAP8/ArxRVDDDdwtI/txWyPcQOqfYAvRn8+tF+aM+EKOL5Nd3M7Tnu0SgpFiqWlSFj+Of75taSa8udVlMboQUalvGs5Q==
MIME-Version: 1.0
X-Received: by 10.194.203.99 with SMTP id kp3mr6292852wjc.3.1452806662951;
	Thu, 14 Jan 2016 13:24:22 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 14 Jan 2016 13:24:22 -0800 (PST)
In-Reply-To: <f6baa71e96dbb72af5d9a48fcea142544bc47795.1452805356.git.peter.seebach@windriver.com>
References: <cover.1452805356.git.peter.seebach@windriver.com>
	<f6baa71e96dbb72af5d9a48fcea142544bc47795.1452805356.git.peter.seebach@windriver.com>
Date: Thu, 14 Jan 2016 13:24:22 -0800
Message-ID: <CAJ86T=USrxx9LmAHpZXC9wnMDCZ1s-NT+Fq+H=ovLApjU8ks1A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Use TUNE_CCARGS for target compilation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jan 2016 21:24:23 -0000
Content-Type: text/plain; charset=UTF-8

Hi Peter,

On Thu, Jan 14, 2016 at 1:04 PM, Peter Seebach
<peter.seebach@windriver.com> wrote:
> The initial gcc configuration is using TARGET_CFLAGS, but this is
> probably not what is intended, because TARGET_CFLAGS doesn't include
> any architecture-specific flags.

I think the current behaviour is deliberate, in order to try to make
it possible to reuse gcc binaries across builds for machines with
different CPU tuning flags.

See the comments associated with this commit from 2014, which
effectively makes all ARM toolchains default to soft float (instead of
defaulting to fpu calling convention of the target machine).

  http://git.openembedded.org/openembedded-core/commit/?id=ce1f3fd20d81545d6d5dfc68f86f9fddf8ac9bbf

> For PPC64, it's possible to end up with gcc configured to pass -a64 to
> the assembler, but be itself getting invoked without -m64, which can result
> in alignment problems in generated code. Solution: Instead of setting
> CFLAGS_FOR_TARGET to TARGET_CFLAGS, set it to TARGET_CFLAGS + TUNE_CCARGS.

Could that PPC64 issue be solved in the same way that the default arch
is set in gcc-configure-common.inc for the various MIPS targets?

  EXTRA_OECONF_append_mips64 = " --with-abi=64 --with-arch-64=mips64
--with-tune-64=mips64"
  EXTRA_OECONF_append_mips64el = " --with-abi=64 --with-arch-64=mips64
--with-tune-64=mips64"
  EXTRA_OECONF_append_mips64n32 = " --with-abi=64
--with-arch-64=mips64 --with-tune-64=mips64"
  EXTRA_OECONF_append_mips64eln32 = " --with-abi=64
--with-arch-64=mips64 --with-tune-64=mips64"


> However, for crosssdk cases, we need to prevent that from having any
> effect; this can be done by emptying out the TUNE_*ARGS flags in the
> crosssdk bbclass, because there is no "target tune" in crosssdk cases.
>
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> ---
>  meta/classes/crosssdk.bbclass                      | 4 ++++
>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 2 +-
>  meta/recipes-devtools/gcc/gcc-cross.inc            | 2 +-
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
> index 7315c38..ccff3ce 100644
> --- a/meta/classes/crosssdk.bbclass
> +++ b/meta/classes/crosssdk.bbclass
> @@ -6,6 +6,10 @@ PACKAGE_ARCH = "${SDK_ARCH}"
>  python () {
>         # set TUNE_PKGARCH to SDK_ARCH
>         d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH', True))
> +       # We're not running a 'target', so clear these...
> +       d.setVar('TUNE_CCARGS', '')
> +       d.setVar('TUNE_LDARGS', '')
> +       d.setVar('TUNE_ASARGS', '')
>  }
>
>  STAGING_DIR_TARGET = "${STAGING_DIR}/${SDK_ARCH}-${SDKPKGSUFFIX}${SDK_VENDOR}-${SDK_OS}"
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index 45b3f15..4b4d91d 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -120,7 +120,7 @@ do_configure () {
>         export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
>         export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
>         export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
> -       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
> +       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS} ${TUNE_CCARGS}"
>         export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
>         export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
>         export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> index aa10633..b6020a4 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -43,7 +43,7 @@ do_compile () {
>         export LD_FOR_TARGET="${TARGET_SYS}-ld"
>         export NM_FOR_TARGET="${TARGET_SYS}-nm"
>         export CC_FOR_TARGET="${CCACHE} ${TARGET_SYS}-gcc"
> -       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
> +       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS} ${TUNE_CCARGS}"
>         export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
>         export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
>         export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
> --
> 2.3.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

