Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D340FA1FF0
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 20:26:45 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92082.1776889598803699730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 13:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jVQmRD8o;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b886fc047d5so1058425766b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 13:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776889597; cv=none;
        d=google.com; s=arc-20240605;
        b=T6p5FNNMPKyScjmfL6gBndGeopxIW1soKyeySSt0+3tzPc9FsIgpLeeAOVtXOJ3T24
         6WuV/OyBVQhYjdBvj82JQAy5c3kU4tL4aH2wLzsUGzoG41m3ZXUtD9Cx9sKMfviJ4P1o
         G6iiq8KUarRqGpPdxZT90CVNHDW5XWHUidFTqdFPKzyUVENblmnad5Zuc6wOrkYGa23w
         hVxj3aHxs+4mp1xJ2RkoIYLF3pIFv4TIWBDggzPbopf4xdpFvQTIGqkSV8YhWyO1CNd4
         eM1lPWM7TLq8xGK1pL7il/SGfV1/LLTs5JdM2fMi/DhNEcf8H262ZCd0zcJq2oF8lQun
         f3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=35XNlF4gjjbPRrdIRrgKk+jZErlnp5rf/Ij1fcO6Zj4=;
        fh=KVqLDFeniA1qVY9UE5vQWhpS22CW0oBJEQbbjtExiQA=;
        b=fMD4pWXtZvSsurNgSjAuFtXDudmIxqq8hc1Xr2wmhm0+a5zdRfDyrBbf56zQIx70iD
         waFMF8+tWU1ujWKyhaqHYQii6uSQNZjHTANkmPfBH4g5cwsPYJKoRt6eXka5uXWaQrPF
         rzVpcIXDRIQOFbDE1xBhRlS54aD2TBSnXn2SM9d3mWsBNgttYN1Wtu35gm557MubwBcL
         ArEoUx8stiHgGvCXBcxJ853lHPQRWvuwJURXF4FloWnFZw0KFoOwkbUqXoGTd9mHkuEn
         b+VZjX4LH2mDlpy77F5gvI5ACRlA1EoXbku6NmOGc4LFf6NC8J3k3QqI8xJc4Sil6zeb
         zrow==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776889597; x=1777494397; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=35XNlF4gjjbPRrdIRrgKk+jZErlnp5rf/Ij1fcO6Zj4=;
        b=jVQmRD8oNmulrraYXSvbTa98Ywa98UOmKZf7y9YbKucCEVOOBoCsCxWcVPZEbPNyVF
         BjQFglanRcnDyAng0jloJMgRB404c51slB47+RwpyLcGUarNWpRp7Vo/08nUrNJKuGL0
         A1KspHKkVuTFqEYUAkkvDetIH9okL12iC6BHm+raLm/9tpCVG87WsEV26MqwbwCTDviu
         M+IN4R4qeS3ynA808gt6ZrtajNsuVCjlGyBkKkANAxSVy9WkjzPdz8l6yFr2YVGy0JK5
         1Nd6+gfsy+Mq3qHf9b7yeRNfYoMYfiSLr5/94WaXn/s123+j8vHnhNOqKVBHZ9SHn9kG
         N2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776889597; x=1777494397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35XNlF4gjjbPRrdIRrgKk+jZErlnp5rf/Ij1fcO6Zj4=;
        b=FgTZHCqGod0emSP5qa7YCFexrJaJ307c+NUvM5neralJmisPoTiI/vF3GyNr0tnHHU
         h4+Y+LVQjGj06aw+lc0B+1bcYo4PSWEwBDXnHsJskASGoWrFMy9p3IZoUtX/cIYXbg78
         vEa9aKEDILLm4C8rUONWYGlsCdsubLbqW/TKzzQB9Xg29HvL2PC6Zsc6iH5QsY4b/rQj
         gi9SpxY99RNIdIHLaEd2Awf3CEe+vixA/TTUQBqIZpgjxakO2PhqTMTjqRuhdfM4URrX
         hDzXMmeUkIjMQKhN3jJBm4oYmh1q/MPqsFIha2Zk5v7omeYopVS3BPzSIUCzyAaQqcC3
         ZilQ==
X-Forwarded-Encrypted: i=1; AFNElJ/AcgbOIsT4N+QbF/CenTVIYmBO0dtzrDaK3oT75gj1FkFJAY1SoL2kikGwll6tvmF0vZcl7z+cEJI8EVFPTezn3g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxf3OSJUyoELPGMCDUy0Kzrl2G4Zfpe8C0HTKPgjEdP2ZjLJEn2
	g2E01eukKB3ixaf4j02UTilyNhHILi8LVYR+/9GYQEgNjVH5BkpgfPj0M8Q22d2IdxodZRh+Gki
	d7hVfmpWOrKyhB1tcEEL3yIGhTFFXc3M=
X-Gm-Gg: AeBDiesRmjMfUiZsQ6/LSC72GXUkEL6mxTdt0usq6ntja6DA0ua+ctVpmtKxZEEvoQV
	PG91PPxa7JFQoMY+LtGqZPIIyJxUvmFzbgiDo32a8RTGE61PZ8t6c7NDg4tZYyrsxlieo2DAVAL
	jTU0SSZFpxqjX4xsjq1I4bpijCQeDCHSHQ08XacQjMooLWI75HO/1/rG+wr2frS3X2sSDaBj1EB
	RT8pSdvF2q6Mgc4bCwpblFKqqJ9fsJVW7heLbEqA+O4Ni7uOGXBdw1CSfWqwJW7JxisKvsjrViV
	qj7oLZ/83DJY9NWZpE024AWq1T0Veoexdf3ZEe854oRJofdKdW8Arevaf5ywain14U1D61HMhth
	V/+En2Q==
X-Received: by 2002:a17:907:3f1c:b0:ba7:670b:f076 with SMTP id
 a640c23a62f3a-ba7670bf31dmr831599566b.2.1776889596473; Wed, 22 Apr 2026
 13:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260401-default-features-v3-0-8f4b40401ab7@pbarker.dev>
 <20260401-default-features-v3-2-8f4b40401ab7@pbarker.dev> <18A8B511426C8EDA.1516946@lists.openembedded.org>
In-Reply-To: <18A8B511426C8EDA.1516946@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 22 Apr 2026 21:26:25 +0100
X-Gm-Features: AQROBzASqnamHpPh5px1FL-b_JzHuP2au5kI9159nwCFUhzdYTWIaVrfMeGkGhw
Message-ID: <CANPvuRmjv0YyiPqACX6JuhUfxSTYsiCQfstHxA+kFmE0sny+bg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/4] meta: Support opting out of any distro features
To: quaresma.jose@gmail.com
Cc: paul@pbarker.dev, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000033f8f806501259ba"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 20:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235737

--00000000000033f8f806501259ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (quarta, 22/04/2026 =C3=A0(s) 15=
:45):

> Hi Paul,
>
> I think I found a bug that is somehow related to DISTRO_FEATURES_DEFAULTS=
.
> I don't understand why, but the variables in
> DISTRO_FEATURES_DEFAULTS cannot
> be used in inherit or inherit_defer.
>
> Let's use the following recipe as an example:
>
> -------------------------------------------------------------------------=
------------------------------------------
> mkdir -p recipes-test/inherit
> cat <<'EOF' >recipes-test/inherit/inherit.bb
>
> LICENSE =3D "MIT"
>
> # FAIL
> PACKAGECONFIG ??=3D " \
>         ${@bb.utils.contains('DISTRO_FEATURES',
> 'gobject-introspection-data', 'ccache', '', d)} \
>         ${@bb.utils.contains('DISTRO_FEATURES',
> 'gobject-introspection-data', 'vala', '', d)} \
> "
>
> # OK
> #PACKAGECONFIG ??=3D " \
> #        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'ccache', '',
> d)} \
> #        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'vala', '',
> d)} \
> #"
>
> # get PACKAGECONFIG
> # bitbake-getvar -r inherit PACKAGECONFIG
>
> # get CCACHE_TOP_DIR
> # bitbake-getvar -r inherit CCACHE_TOP_DIR
> inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'ccache', d)}
>
> # get VALADEPENDS
> # bitbake-getvar -r inherit VALADEPENDS
> inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'vala', d)}
> EOF
>
> -------------------------------------------------------------------------=
------------------------------------------
>

A clearer way to replicate the problem:

#
---------------------------------------------------------------------------=
----------------------------------------
mkdir -p recipes-test/inherit
cat <<'EOF' >recipes-test/inherit/inherit.bb
LICENSE =3D "MIT"

DISTRO_FEATURES_DEFAULTS +=3D "aaa"
DISTRO_FEATURES +=3D "bbb"

PACKAGECONFIG =3D " \
        ${@bb.utils.contains('DISTRO_FEATURES', 'aaa', 'ccache', '', d)} \
        ${@bb.utils.contains('DISTRO_FEATURES', 'bbb', 'vala', '', d)} \
"

inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'ccache', d)}

inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'vala', d)}
EOF
#
---------------------------------------------------------------------------=
----------------------------------------
bitbake-getvar --value -r inherit PACKAGECONFIG
bitbake-getvar --value -r inherit CCACHE_TOP_DIR
bitbake-getvar --value -r inherit VALADEPENDS
#
---------------------------------------------------------------------------=
----------------------------------------


The DISTRO_FEATURES is mapped to inherit/inherit_defer as follows:
 'aaa' maps to  'ccache'
 'bbb' maps to  'vala'

I chose these two classes, but it could be any others. The idea is to see
if they were inherited by looking at the class variables.
The ccache.bbclass was not inherit and so the variable 'CCACHE_TOP_DIR' is
not defined.


Hence my conclusion that DISTRO_FEATURES_DEFAULTS doesn't work for these
cases, which in my opinion is not expected.

I encountered this problem while debugging the patch
https://lists.openembedded.org/g/openembedded-devel/topic/118939974.

Best regards,
Jose


>
> We can see that inherit is not working by running the following command:
>
> bitbake-getvar -r inherit PACKAGECONFIG
> bitbake-getvar -r inherit CCACHE_TOP_DIR
> bitbake-getvar -r inherit VALADEPENDS
>
>
> By commenting out the block that uses 'gobject-introspection-data' and
> uncommenting the 'systemd', the inherit will then work.
> One difference I see is that 'gobject-introspection-data' belongs to
> DISTRO_FEATURES_DEFAULTS and 'systemd' does not.
>
> Am I doing something wrong? Could you give me your opinion?
>
> Thanks for your attention.
>
> Jose
>
> Paul Barker via lists.openembedded.org <paul=3D
> pbarker.dev@lists.openembedded.org> escreveu (quarta, 1/04/2026 =C3=A0(s)
> 18:42):
>
>> Add default values to DISTRO_FEATURES using the new
>> filter_default_features() function.
>>
>> This change obsoletes the variables DISTRO_FEATURES_BACKFILL and
>> DISTRO_FEATURES_BACKFILL_CONSIDERED. Instead, all defaults are added via
>> DISTRO_FEATURES_DEFAULTS and users can opt out of any of these using
>> DISTRO_FEATURES_OPTED_OUT. Hopefully the variable naming here is easier
>> for people to understand and remember.
>>
>> Migration notes:
>>
>> - If you have previously assigned DISTRO_FEATURES without using
>>   DISTRO_FEATURES_DEFAULT, you will now get the default features added
>>   automatically. You will need to review these and add any features you
>>   do not want to use to DISTRO_FEATURES_OPTED_OUT.
>>
>> - DISTRO_FEATURES_DEFAULT is now unused, the new variable name is
>>   slighlty different to ensure that it is not accidentally used if a
>>   layer hasn't been modified to adapt to the new naming.
>>
>> - If you previously set DISTRO_FEATURES_BACKFILL_CONSIDERED, use the new
>>   variable DISTRO_FEATURES_OPTED_OUT instead.
>>
>> - If you previously modified DISTRO_FEATURES_BACKFILL, don't do that.
>>
>> Signed-off-by: Paul Barker <paul@pbarker.dev>
>> ---
>>  meta/classes-global/base.bbclass                |  5 ++++-
>>  meta/classes-recipe/crosssdk.bbclass            |  8 ++++----
>>  meta/classes-recipe/native.bbclass              |  8 ++++----
>>  meta/classes-recipe/nativesdk.bbclass           |  8 ++++----
>>  meta/conf/bitbake.conf                          |  1 -
>>  meta/conf/distro/include/default-distrovars.inc | 15 +++++++++------
>>  meta/conf/distro/include/tclibc-musl.inc        |  2 +-
>>  meta/conf/distro/include/tclibc-newlib.inc      |  2 +-
>>  meta/conf/distro/include/tclibc-picolibc.inc    |  2 +-
>>  meta/conf/documentation.conf                    |  4 ++--
>>  10 files changed, 30 insertions(+), 25 deletions(-)
>>
>> diff --git a/meta/classes-global/base.bbclass
>> b/meta/classes-global/base.bbclass
>> index 22b427a5211b..0a4cfd594c72 100644
>> --- a/meta/classes-global/base.bbclass
>> +++ b/meta/classes-global/base.bbclass
>> @@ -454,8 +454,11 @@ def set_packagetriplet(d):
>>  python () {
>>      import string, re
>>
>> +    # Filter default features to allow users to opt out of features the=
y
>> don't
>> +    # want.
>> +    oe.utils.filter_default_features("DISTRO_FEATURES", d)
>> +
>>      # Handle backfilling
>> -    oe.utils.features_backfill("DISTRO_FEATURES", d)
>>      oe.utils.features_backfill("MACHINE_FEATURES", d)
>>
>>      # To add a recipe to the skip list , set:
>> diff --git a/meta/classes-recipe/crosssdk.bbclass
>> b/meta/classes-recipe/crosssdk.bbclass
>> index a2853e6a9201..dac18b39edb2 100644
>> --- a/meta/classes-recipe/crosssdk.bbclass
>> +++ b/meta/classes-recipe/crosssdk.bbclass
>> @@ -16,13 +16,13 @@ PACKAGE_ARCH =3D "${SDK_ARCH}"
>>  python () {
>>      # set TUNE_PKGARCH to SDK_ARCH
>>      d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH'))
>> -    # Set features here to prevent appends and distro features backfill
>> -    # from modifying nativesdk distro features
>> +    # Set features here to prevent DISTRO_FEATURES modifications from
>> affecting
>> +    # crosssdk distro features
>>      features =3D set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
>> -    oe.utils.features_backfill("DISTRO_FEATURES", d)
>> +    oe.utils.filter_default_features("DISTRO_FEATURES", d)
>>      filtered =3D set(bb.utils.filter("DISTRO_FEATURES",
>> d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
>>      d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
>> -    d.setVar("DISTRO_FEATURES_BACKFILL", "")
>> +    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
>>  }
>>
>>  STAGING_BINDIR_TOOLCHAIN =3D
>> "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${=
TARGET_OS}"
>> diff --git a/meta/classes-recipe/native.bbclass
>> b/meta/classes-recipe/native.bbclass
>> index 5aa9c8e4145e..9f4ca170f762 100644
>> --- a/meta/classes-recipe/native.bbclass
>> +++ b/meta/classes-recipe/native.bbclass
>> @@ -126,13 +126,13 @@ python native_virtclass_handler () {
>>          return
>>      bpn =3D d.getVar("BPN")
>>
>> -    # Set features here to prevent appends and distro features backfill
>> -    # from modifying native distro features
>> +    # Set features here to prevent DISTRO_FEATURES modifications from
>> affecting
>> +    # native distro features
>>      features =3D set(d.getVar("DISTRO_FEATURES_NATIVE").split())
>> -    oe.utils.features_backfill("DISTRO_FEATURES", d)
>> +    oe.utils.filter_default_features("DISTRO_FEATURES", d)
>>      filtered =3D set(bb.utils.filter("DISTRO_FEATURES",
>> d.getVar("DISTRO_FEATURES_FILTER_NATIVE"), d).split())
>>      d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
>> -    d.setVar("DISTRO_FEATURES_BACKFILL", "")
>> +    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
>>
>>      classextend =3D d.getVar('BBCLASSEXTEND') or ""
>>      if "native" not in classextend:
>> diff --git a/meta/classes-recipe/nativesdk.bbclass
>> b/meta/classes-recipe/nativesdk.bbclass
>> index 5adb7515bf14..a4801c48b2de 100644
>> --- a/meta/classes-recipe/nativesdk.bbclass
>> +++ b/meta/classes-recipe/nativesdk.bbclass
>> @@ -78,13 +78,13 @@ python nativesdk_virtclass_handler () {
>>      if not (pn.endswith("-nativesdk") or pn.startswith("nativesdk-")):
>>          return
>>
>> -    # Set features here to prevent appends and distro features backfill
>> -    # from modifying nativesdk distro features
>> +    # Set features here to prevent DISTRO_FEATURES modifications from
>> affecting
>> +    # nativesdk distro features
>>      features =3D set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
>> -    oe.utils.features_backfill("DISTRO_FEATURES", d)
>> +    oe.utils.filter_default_features("DISTRO_FEATURES", d)
>>      filtered =3D set(bb.utils.filter("DISTRO_FEATURES",
>> d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
>>      d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
>> -    d.setVar("DISTRO_FEATURES_BACKFILL", "")
>> +    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
>>
>>      e.data.setVar("MLPREFIX", "nativesdk-")
>>      e.data.setVar("PN", "nativesdk-" +
>> e.data.getVar("PN").replace("-nativesdk", "").replace("nativesdk-", ""))
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 6b3443695a04..f851e2adc9f7 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -912,7 +912,6 @@ DISTRO_FEATURES_NATIVESDK:mingw32 =3D "x11 ipv6"
>>  DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod opencl
>> opengl wayland"
>>  DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod ope=
ncl
>> opengl wayland"
>>
>> -DISTRO_FEATURES_BACKFILL =3D "pulseaudio gobject-introspection-data
>> ldconfig opengl ptest multiarch wayland vulkan"
>>  MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"
>>
>>  COMBINED_FEATURES =3D "${@oe.utils.set_intersect('DISTRO_FEATURES',
>> 'MACHINE_FEATURES', d)}"
>> diff --git a/meta/conf/distro/include/default-distrovars.inc
>> b/meta/conf/distro/include/default-distrovars.inc
>> index 7adcdfad4ff4..daa4d2a74dda 100644
>> --- a/meta/conf/distro/include/default-distrovars.inc
>> +++ b/meta/conf/distro/include/default-distrovars.inc
>> @@ -14,19 +14,22 @@ LOCALE_UTF8_IS_DEFAULT ?=3D "1"
>>  LOCALE_UTF8_IS_DEFAULT:class-nativesdk =3D "0"
>>
>>  # seccomp is not yet ported to rv32
>> -DISTRO_FEATURES_DEFAULT:remove:riscv32 =3D "seccomp"
>> +DISTRO_FEATURES_OPTED_OUT:append:riscv32 =3D "seccomp"
>>
>>  # seccomp is not yet ported to ARC
>> -DISTRO_FEATURES_DEFAULT:remove:arc =3D "seccomp"
>> +DISTRO_FEATURES_OPTED_OUT:append:arc =3D "seccomp"
>>
>>  # seccomp is not yet ported to microblaze
>> -DISTRO_FEATURES_DEFAULT:remove:microblaze =3D "seccomp"
>> +DISTRO_FEATURES_OPTED_OUT:append:microblaze =3D "seccomp"
>>
>>  # seccomp is not yet ported to loongarch64
>> -DISTRO_FEATURES_DEFAULT:remove:loongarch64 =3D "seccomp"
>> +DISTRO_FEATURES_OPTED_OUT:append:loongarch64 =3D "seccomp"
>>
>> -DISTRO_FEATURES_DEFAULT ?=3D "acl alsa bluetooth debuginfod ext2 ipv4 i=
pv6
>> pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat
>> seccomp"
>> -DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"
>> +DISTRO_FEATURES_DEFAULTS ?=3D " \
>> +    acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget
>> usbhost \
>> +    wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
>> +    gobject-introspection-data ldconfig opengl ptest multiarch wayland
>> vulkan \
>> +    "
>>  IMAGE_FEATURES ?=3D ""
>>
>>  COMMERCIAL_AUDIO_PLUGINS ?=3D ""
>> diff --git a/meta/conf/distro/include/tclibc-musl.inc
>> b/meta/conf/distro/include/tclibc-musl.inc
>> index 98d7a801ac84..a61a6ced0dd2 100644
>> --- a/meta/conf/distro/include/tclibc-musl.inc
>> +++ b/meta/conf/distro/include/tclibc-musl.inc
>> @@ -14,7 +14,7 @@ PREFERRED_PROVIDER_virtual/libc-locale ?=3D "musl-loca=
les"
>>  PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
>>  PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
>>
>> -DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"
>> +DISTRO_FEATURES_OPTED_OUT +=3D "ldconfig"
>>
>>  #USE_NLS ?=3D "no"
>>
>> diff --git a/meta/conf/distro/include/tclibc-newlib.inc
>> b/meta/conf/distro/include/tclibc-newlib.inc
>> index 34318b24549c..fff9b9f066fb 100644
>> --- a/meta/conf/distro/include/tclibc-newlib.inc
>> +++ b/meta/conf/distro/include/tclibc-newlib.inc
>> @@ -11,7 +11,7 @@ PREFERRED_PROVIDER_virtual/libintl ?=3D "newlib"
>>  PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
>>  PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
>>
>> -DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"
>> +DISTRO_FEATURES_OPTED_OUT +=3D "ldconfig"
>>
>>  #USE_NLS ?=3D "no"
>>
>> diff --git a/meta/conf/distro/include/tclibc-picolibc.inc
>> b/meta/conf/distro/include/tclibc-picolibc.inc
>> index 2cd26cfd7dcd..6134b0d97d6a 100644
>> --- a/meta/conf/distro/include/tclibc-picolibc.inc
>> +++ b/meta/conf/distro/include/tclibc-picolibc.inc
>> @@ -11,7 +11,7 @@ PREFERRED_PROVIDER_virtual/libintl ?=3D "picolibc"
>>  PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
>>  PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
>>
>> -DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"
>> +DISTRO_FEATURES_OPTED_OUT +=3D "ldconfig"
>>
>>  IMAGE_LINGUAS =3D ""
>>
>> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
>> index 1853676fa060..5c93d0e47970 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -141,8 +141,8 @@ DISTRO[doc] =3D "The short name of the distribution.=
 If
>> the variable is blank, met
>>  DISTRO_EXTRA_RDEPENDS[doc] =3D "Specifies a list of distro-specific
>> packages to add to all images. The variable only applies to the images t=
hat
>> include packagegroup-base."
>>  DISTRO_EXTRA_RRECOMMENDS[doc] =3D "Specifies a list of distro-specific
>> packages to add to all images if the packages exist. The list of package=
s
>> are automatically installed but you can remove them."
>>  DISTRO_FEATURES[doc] =3D "The features enabled for the distribution."
>> -DISTRO_FEATURES_BACKFILL[doc] =3D "Features to be added to DISTRO_FEATU=
RES
>> if not also present in DISTRO_FEATURES_BACKFILL_CONSIDERED. This variabl=
e
>> is set in the meta/conf/bitbake.conf file and it is not intended to be
>> user-configurable."
>> -DISTRO_FEATURES_BACKFILL_CONSIDERED[doc] =3D "Features from
>> DISTRO_FEATURES_BACKFILL that should not be backfilled (i.e. added to
>> DISTRO_FEATURES) during the build."
>> +DISTRO_FEATURES_DEFAULTS[doc] =3D "The default set of distribution
>> features, prior to any filtering. Usually you should leave this alone an=
d
>> modify DISTRO_FEATURES and/or DISTRO_FEATURES_OPTED_OUT."
>> +DISTRO_FEATURES_OPTED_OUT[doc] =3D "The set of default distribtion
>> features to disable. Prefer opting out of features using this variable
>> instead of using DISTRO_FEATURES:remove."
>>  DISTRO_NAME[doc] =3D "The long name of the distribution."
>>  DISTRO_PN_ALIAS[doc] =3D "Alias names used for the recipe in various Li=
nux
>> distributions."
>>  DISTRO_VERSION[doc] =3D "The version of the distribution."
>>
>> --
>> 2.43.0
>>
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235727):
> https://lists.openembedded.org/g/openembedded-core/message/235727
> Mute This Topic: https://lists.openembedded.org/mt/118620443/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000033f8f806501259ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.=
com@lists.openembedded.org</a>&gt; escreveu (quarta, 22/04/2026 =C3=A0(s) 1=
5:45):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>Hi Paul,</div><br>I think I found a bug that is somehow relat=
ed to DISTRO_FEATURES_DEFAULTS.<br>I don&#39;t understand why, but the vari=
ables in DISTRO_FEATURES_DEFAULTS=C2=A0cannot<div>be used in inherit or inh=
erit_defer.<div><br>Let&#39;s use the following recipe as an example:<div>-=
---------------------------------------------------------------------------=
---------------------------------------</div><div>mkdir -p recipes-test/inh=
erit<br>cat &lt;&lt;&#39;EOF&#39; &gt;recipes-test/inherit/<a href=3D"http:=
//inherit.bb" target=3D"_blank">inherit.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <br>LICENSE =3D &quot;MIT&quot;<br><br># FAIL<br>PACKAGECONFIG ??=3D &q=
uot; \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;gobject-introspection-data&#39;, &#39;ccache&#39;, &#39;&#3=
9;, d)} \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;, &#39;gobject-introspection-data&#39;, &#39;vala&#39;, &#39;&#=
39;, d)} \<br>&quot;</div><div><br># OK<br>#PACKAGECONFIG ??=3D &quot; \<br=
># =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;systemd&#39;, &#39;ccache&#39;, &#39;&#39;, d)} \<br># =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;syste=
md&#39;, &#39;vala&#39;, &#39;&#39;, d)} \<br>#&quot;<br><br># get PACKAGEC=
ONFIG<br># bitbake-getvar -r inherit PACKAGECONFIG<br><br># get CCACHE_TOP_=
DIR<br># bitbake-getvar -r inherit CCACHE_TOP_DIR<br>inherit_defer ${@bb.ut=
ils.filter(&#39;PACKAGECONFIG&#39;, &#39;ccache&#39;, d)}<br><br># get VALA=
DEPENDS<br># bitbake-getvar -r inherit VALADEPENDS<br>inherit_defer ${@bb.u=
tils.filter(&#39;PACKAGECONFIG&#39;, &#39;vala&#39;, d)}<br>EOF</div><div><=
div>-----------------------------------------------------------------------=
--------------------------------------------</div></div></div></div></div><=
/blockquote><div><br></div><div>A clearer way to replicate the problem:</di=
v><div><br></div><div># ---------------------------------------------------=
----------------------------------------------------------------</div><div>=
mkdir -p recipes-test/inherit</div><div>cat &lt;&lt;&#39;EOF&#39; &gt;recip=
es-test/inherit/<a href=3D"http://inherit.bb">inherit.bb</a><br>LICENSE =3D=
 &quot;MIT&quot;<br><br>DISTRO_FEATURES_DEFAULTS +=3D &quot;aaa&quot;<br>DI=
STRO_FEATURES +=3D &quot;bbb&quot;<br><br>PACKAGECONFIG =3D &quot; \<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;aaa&#39;, &#39;ccache&#39;, &#39;&#39;, d)} \<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bbb&#39;, &#39;=
vala&#39;, &#39;&#39;, d)} \<br>&quot;<br><br>inherit_defer ${@bb.utils.fil=
ter(&#39;PACKAGECONFIG&#39;, &#39;ccache&#39;, d)}<br><br>inherit_defer ${@=
bb.utils.filter(&#39;PACKAGECONFIG&#39;, &#39;vala&#39;, d)}<br>EOF<br><div=
># ------------------------------------------------------------------------=
-------------------------------------------</div>bitbake-getvar --value -r =
inherit PACKAGECONFIG<br>bitbake-getvar --value -r inherit CCACHE_TOP_DIR<b=
r>bitbake-getvar --value -r inherit VALADEPENDS<br></div><div><div># ------=
---------------------------------------------------------------------------=
----------------------------------</div><br class=3D"gmail-Apple-interchang=
e-newline"></div><div><br></div><div>The DISTRO_FEATURES is mapped to inher=
it/inherit_defer=C2=A0as follows:</div><div><div>=C2=A0&#39;aaa&#39; maps t=
o=C2=A0=C2=A0&#39;ccache&#39;</div>=C2=A0&#39;bbb&#39; maps to=C2=A0=C2=A0&=
#39;vala&#39;<br class=3D"gmail-Apple-interchange-newline"></div><div><br><=
/div><div>I chose these two classes, but it could be any others. The idea i=
s to see if they were inherited by looking at the class variables.<br>The c=
cache.bbclass was not inherit=C2=A0and so the variable &#39;CCACHE_TOP_DIR&=
#39; is not defined.</div><div><br></div><div><br></div><div>Hence my concl=
usion that DISTRO_FEATURES_DEFAULTS=C2=A0doesn&#39;t work for these cases, =
which in my opinion is not expected.</div><div><br></div><div>I encountered=
 this problem while debugging the patch <a href=3D"https://lists.openembedd=
ed.org/g/openembedded-devel/topic/118939974">https://lists.openembedded.org=
/g/openembedded-devel/topic/118939974</a>.</div><div><br></div><div>Best re=
gards,<br>Jose</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div><div><div><br></div><div><br></div><div>We=
 can see that inherit is not working by running the following command:</div=
><div><br></div><div>bitbake-getvar -r inherit PACKAGECONFIG<br>bitbake-get=
var -r inherit CCACHE_TOP_DIR</div><div>bitbake-getvar -r inherit VALADEPEN=
DS</div><div><br></div><div><br></div><div>By commenting out the block that=
 uses &#39;gobject-introspection-data&#39;=C2=A0and uncommenting the &#39;s=
ystemd&#39;, the inherit=C2=A0will then work.</div><div>One difference I se=
e is that &#39;gobject-introspection-data&#39; belongs to DISTRO_FEATURES_D=
EFAULTS=C2=A0and &#39;systemd&#39; does not.</div><div><br></div><div>Am I =
doing something wrong? Could you give me your opinion?</div><div><br></div>=
<div>Thanks for your attention.</div><div>=C2=A0</div><div>Jose<br><br><div=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Paul Bark=
er via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.op=
enembedded.org</a> &lt;paul=3D<a href=3D"mailto:pbarker.dev@lists.openembed=
ded.org" target=3D"_blank">pbarker.dev@lists.openembedded.org</a>&gt; escre=
veu (quarta, 1/04/2026 =C3=A0(s) 18:42):<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Add default values to DISTRO_FEATURES using the ne=
w<br>
filter_default_features() function.<br>
<br>
This change obsoletes the variables DISTRO_FEATURES_BACKFILL and<br>
DISTRO_FEATURES_BACKFILL_CONSIDERED. Instead, all defaults are added via<br=
>
DISTRO_FEATURES_DEFAULTS and users can opt out of any of these using<br>
DISTRO_FEATURES_OPTED_OUT. Hopefully the variable naming here is easier<br>
for people to understand and remember.<br>
<br>
Migration notes:<br>
<br>
- If you have previously assigned DISTRO_FEATURES without using<br>
=C2=A0 DISTRO_FEATURES_DEFAULT, you will now get the default features added=
<br>
=C2=A0 automatically. You will need to review these and add any features yo=
u<br>
=C2=A0 do not want to use to DISTRO_FEATURES_OPTED_OUT.<br>
<br>
- DISTRO_FEATURES_DEFAULT is now unused, the new variable name is<br>
=C2=A0 slighlty different to ensure that it is not accidentally used if a<b=
r>
=C2=A0 layer hasn&#39;t been modified to adapt to the new naming.<br>
<br>
- If you previously set DISTRO_FEATURES_BACKFILL_CONSIDERED, use the new<br=
>
=C2=A0 variable DISTRO_FEATURES_OPTED_OUT instead.<br>
<br>
- If you previously modified DISTRO_FEATURES_BACKFILL, don&#39;t do that.<b=
r>
<br>
Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev" target=
=3D"_blank">paul@pbarker.dev</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/base.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++-<br>
=C2=A0meta/classes-recipe/crosssdk.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0meta/classes-recipe/native.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0meta/classes-recipe/nativesdk.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 8 ++++----<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0meta/conf/distro/include/default-distrovars.inc | 15 +++++++++------<=
br>
=C2=A0meta/conf/distro/include/tclibc-musl.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
=C2=A0meta/conf/distro/include/tclibc-newlib.inc=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0meta/conf/distro/include/tclibc-picolibc.inc=C2=A0 =C2=A0 |=C2=A0 2 +=
-<br>
=C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A010 files changed, 30 insertions(+), 25 deletions(-)<br>
<br>
diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bb=
class<br>
index 22b427a5211b..0a4cfd594c72 100644<br>
--- a/meta/classes-global/base.bbclass<br>
+++ b/meta/classes-global/base.bbclass<br>
@@ -454,8 +454,11 @@ def set_packagetriplet(d):<br>
=C2=A0python () {<br>
=C2=A0 =C2=A0 =C2=A0import string, re<br>
<br>
+=C2=A0 =C2=A0 # Filter default features to allow users to opt out of featu=
res they don&#39;t<br>
+=C2=A0 =C2=A0 # want.<br>
+=C2=A0 =C2=A0 oe.utils.filter_default_features(&quot;DISTRO_FEATURES&quot;=
, d)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# Handle backfilling<br>
-=C2=A0 =C2=A0 oe.utils.features_backfill(&quot;DISTRO_FEATURES&quot;, d)<b=
r>
=C2=A0 =C2=A0 =C2=A0oe.utils.features_backfill(&quot;MACHINE_FEATURES&quot;=
, d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# To add a recipe to the skip list , set:<br>
diff --git a/meta/classes-recipe/crosssdk.bbclass b/meta/classes-recipe/cro=
sssdk.bbclass<br>
index a2853e6a9201..dac18b39edb2 100644<br>
--- a/meta/classes-recipe/crosssdk.bbclass<br>
+++ b/meta/classes-recipe/crosssdk.bbclass<br>
@@ -16,13 +16,13 @@ PACKAGE_ARCH =3D &quot;${SDK_ARCH}&quot;<br>
=C2=A0python () {<br>
=C2=A0 =C2=A0 =C2=A0# set TUNE_PKGARCH to SDK_ARCH<br>
=C2=A0 =C2=A0 =C2=A0d.setVar(&#39;TUNE_PKGARCH&#39;, d.getVar(&#39;SDK_ARCH=
&#39;))<br>
-=C2=A0 =C2=A0 # Set features here to prevent appends and distro features b=
ackfill<br>
-=C2=A0 =C2=A0 # from modifying nativesdk distro features<br>
+=C2=A0 =C2=A0 # Set features here to prevent DISTRO_FEATURES modifications=
 from affecting<br>
+=C2=A0 =C2=A0 # crosssdk distro features<br>
=C2=A0 =C2=A0 =C2=A0features =3D set(d.getVar(&quot;DISTRO_FEATURES_NATIVES=
DK&quot;).split())<br>
-=C2=A0 =C2=A0 oe.utils.features_backfill(&quot;DISTRO_FEATURES&quot;, d)<b=
r>
+=C2=A0 =C2=A0 oe.utils.filter_default_features(&quot;DISTRO_FEATURES&quot;=
, d)<br>
=C2=A0 =C2=A0 =C2=A0filtered =3D set(bb.utils.filter(&quot;DISTRO_FEATURES&=
quot;, d.getVar(&quot;DISTRO_FEATURES_FILTER_NATIVESDK&quot;), d).split())<=
br>
=C2=A0 =C2=A0 =C2=A0d.setVar(&quot;DISTRO_FEATURES&quot;, &quot; &quot;.joi=
n(sorted(features | filtered)))<br>
-=C2=A0 =C2=A0 d.setVar(&quot;DISTRO_FEATURES_BACKFILL&quot;, &quot;&quot;)=
<br>
+=C2=A0 =C2=A0 d.setVar(&quot;DISTRO_FEATURES_DEFAULTS&quot;, &quot;&quot;)=
<br>
=C2=A0}<br>
<br>
=C2=A0STAGING_BINDIR_TOOLCHAIN =3D &quot;${STAGING_DIR_NATIVE}${bindir_nati=
ve}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}&quot;<br>
diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/nativ=
e.bbclass<br>
index 5aa9c8e4145e..9f4ca170f762 100644<br>
--- a/meta/classes-recipe/native.bbclass<br>
+++ b/meta/classes-recipe/native.bbclass<br>
@@ -126,13 +126,13 @@ python native_virtclass_handler () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
=C2=A0 =C2=A0 =C2=A0bpn =3D d.getVar(&quot;BPN&quot;)<br>
<br>
-=C2=A0 =C2=A0 # Set features here to prevent appends and distro features b=
ackfill<br>
-=C2=A0 =C2=A0 # from modifying native distro features<br>
+=C2=A0 =C2=A0 # Set features here to prevent DISTRO_FEATURES modifications=
 from affecting<br>
+=C2=A0 =C2=A0 # native distro features<br>
=C2=A0 =C2=A0 =C2=A0features =3D set(d.getVar(&quot;DISTRO_FEATURES_NATIVE&=
quot;).split())<br>
-=C2=A0 =C2=A0 oe.utils.features_backfill(&quot;DISTRO_FEATURES&quot;, d)<b=
r>
+=C2=A0 =C2=A0 oe.utils.filter_default_features(&quot;DISTRO_FEATURES&quot;=
, d)<br>
=C2=A0 =C2=A0 =C2=A0filtered =3D set(bb.utils.filter(&quot;DISTRO_FEATURES&=
quot;, d.getVar(&quot;DISTRO_FEATURES_FILTER_NATIVE&quot;), d).split())<br>
=C2=A0 =C2=A0 =C2=A0d.setVar(&quot;DISTRO_FEATURES&quot;, &quot; &quot;.joi=
n(sorted(features | filtered)))<br>
-=C2=A0 =C2=A0 d.setVar(&quot;DISTRO_FEATURES_BACKFILL&quot;, &quot;&quot;)=
<br>
+=C2=A0 =C2=A0 d.setVar(&quot;DISTRO_FEATURES_DEFAULTS&quot;, &quot;&quot;)=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0classextend =3D d.getVar(&#39;BBCLASSEXTEND&#39;) or &q=
uot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0if &quot;native&quot; not in classextend:<br>
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/na=
tivesdk.bbclass<br>
index 5adb7515bf14..a4801c48b2de 100644<br>
--- a/meta/classes-recipe/nativesdk.bbclass<br>
+++ b/meta/classes-recipe/nativesdk.bbclass<br>
@@ -78,13 +78,13 @@ python nativesdk_virtclass_handler () {<br>
=C2=A0 =C2=A0 =C2=A0if not (pn.endswith(&quot;-nativesdk&quot;) or pn.start=
swith(&quot;nativesdk-&quot;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
-=C2=A0 =C2=A0 # Set features here to prevent appends and distro features b=
ackfill<br>
-=C2=A0 =C2=A0 # from modifying nativesdk distro features<br>
+=C2=A0 =C2=A0 # Set features here to prevent DISTRO_FEATURES modifications=
 from affecting<br>
+=C2=A0 =C2=A0 # nativesdk distro features<br>
=C2=A0 =C2=A0 =C2=A0features =3D set(d.getVar(&quot;DISTRO_FEATURES_NATIVES=
DK&quot;).split())<br>
-=C2=A0 =C2=A0 oe.utils.features_backfill(&quot;DISTRO_FEATURES&quot;, d)<b=
r>
+=C2=A0 =C2=A0 oe.utils.filter_default_features(&quot;DISTRO_FEATURES&quot;=
, d)<br>
=C2=A0 =C2=A0 =C2=A0filtered =3D set(bb.utils.filter(&quot;DISTRO_FEATURES&=
quot;, d.getVar(&quot;DISTRO_FEATURES_FILTER_NATIVESDK&quot;), d).split())<=
br>
=C2=A0 =C2=A0 =C2=A0d.setVar(&quot;DISTRO_FEATURES&quot;, &quot; &quot;.joi=
n(sorted(features | filtered)))<br>
-=C2=A0 =C2=A0 d.setVar(&quot;DISTRO_FEATURES_BACKFILL&quot;, &quot;&quot;)=
<br>
+=C2=A0 =C2=A0 d.setVar(&quot;DISTRO_FEATURES_DEFAULTS&quot;, &quot;&quot;)=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0e.data.setVar(&quot;MLPREFIX&quot;, &quot;nativesdk-&qu=
ot;)<br>
=C2=A0 =C2=A0 =C2=A0e.data.setVar(&quot;PN&quot;, &quot;nativesdk-&quot; + =
e.data.getVar(&quot;PN&quot;).replace(&quot;-nativesdk&quot;, &quot;&quot;)=
.replace(&quot;nativesdk-&quot;, &quot;&quot;))<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 6b3443695a04..f851e2adc9f7 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -912,7 +912,6 @@ DISTRO_FEATURES_NATIVESDK:mingw32 =3D &quot;x11 ipv6&qu=
ot;<br>
=C2=A0DISTRO_FEATURES_FILTER_NATIVE ?=3D &quot;api-documentation debuginfod=
 opencl opengl wayland&quot;<br>
=C2=A0DISTRO_FEATURES_FILTER_NATIVESDK ?=3D &quot;api-documentation debugin=
fod opencl opengl wayland&quot;<br>
<br>
-DISTRO_FEATURES_BACKFILL =3D &quot;pulseaudio gobject-introspection-data l=
dconfig opengl ptest multiarch wayland vulkan&quot;<br>
=C2=A0MACHINE_FEATURES_BACKFILL =3D &quot;rtc qemu-usermode&quot;<br>
<br>
=C2=A0COMBINED_FEATURES =3D &quot;${@oe.utils.set_intersect(&#39;DISTRO_FEA=
TURES&#39;, &#39;MACHINE_FEATURES&#39;, d)}&quot;<br>
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/di=
stro/include/default-distrovars.inc<br>
index 7adcdfad4ff4..daa4d2a74dda 100644<br>
--- a/meta/conf/distro/include/default-distrovars.inc<br>
+++ b/meta/conf/distro/include/default-distrovars.inc<br>
@@ -14,19 +14,22 @@ LOCALE_UTF8_IS_DEFAULT ?=3D &quot;1&quot;<br>
=C2=A0LOCALE_UTF8_IS_DEFAULT:class-nativesdk =3D &quot;0&quot;<br>
<br>
=C2=A0# seccomp is not yet ported to rv32<br>
-DISTRO_FEATURES_DEFAULT:remove:riscv32 =3D &quot;seccomp&quot;<br>
+DISTRO_FEATURES_OPTED_OUT:append:riscv32 =3D &quot;seccomp&quot;<br>
<br>
=C2=A0# seccomp is not yet ported to ARC<br>
-DISTRO_FEATURES_DEFAULT:remove:arc =3D &quot;seccomp&quot;<br>
+DISTRO_FEATURES_OPTED_OUT:append:arc =3D &quot;seccomp&quot;<br>
<br>
=C2=A0# seccomp is not yet ported to microblaze<br>
-DISTRO_FEATURES_DEFAULT:remove:microblaze =3D &quot;seccomp&quot;<br>
+DISTRO_FEATURES_OPTED_OUT:append:microblaze =3D &quot;seccomp&quot;<br>
<br>
=C2=A0# seccomp is not yet ported to loongarch64<br>
-DISTRO_FEATURES_DEFAULT:remove:loongarch64 =3D &quot;seccomp&quot;<br>
+DISTRO_FEATURES_OPTED_OUT:append:loongarch64 =3D &quot;seccomp&quot;<br>
<br>
-DISTRO_FEATURES_DEFAULT ?=3D &quot;acl alsa bluetooth debuginfod ext2 ipv4=
 ipv6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat =
seccomp&quot;<br>
-DISTRO_FEATURES ?=3D &quot;${DISTRO_FEATURES_DEFAULT}&quot;<br>
+DISTRO_FEATURES_DEFAULTS ?=3D &quot; \<br>
+=C2=A0 =C2=A0 acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadge=
t usbhost \<br>
+=C2=A0 =C2=A0 wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaud=
io \<br>
+=C2=A0 =C2=A0 gobject-introspection-data ldconfig opengl ptest multiarch w=
ayland vulkan \<br>
+=C2=A0 =C2=A0 &quot;<br>
=C2=A0IMAGE_FEATURES ?=3D &quot;&quot;<br>
<br>
=C2=A0COMMERCIAL_AUDIO_PLUGINS ?=3D &quot;&quot;<br>
diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/in=
clude/tclibc-musl.inc<br>
index 98d7a801ac84..a61a6ced0dd2 100644<br>
--- a/meta/conf/distro/include/tclibc-musl.inc<br>
+++ b/meta/conf/distro/include/tclibc-musl.inc<br>
@@ -14,7 +14,7 @@ PREFERRED_PROVIDER_virtual/libc-locale ?=3D &quot;musl-lo=
cales&quot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D &quot;nativesdk-gli=
bc&quot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D &quot;nativesdk-gl=
ibc&quot;<br>
<br>
-DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;ldconfig&quot;<br>
+DISTRO_FEATURES_OPTED_OUT +=3D &quot;ldconfig&quot;<br>
<br>
=C2=A0#USE_NLS ?=3D &quot;no&quot;<br>
<br>
diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distro/=
include/tclibc-newlib.inc<br>
index 34318b24549c..fff9b9f066fb 100644<br>
--- a/meta/conf/distro/include/tclibc-newlib.inc<br>
+++ b/meta/conf/distro/include/tclibc-newlib.inc<br>
@@ -11,7 +11,7 @@ PREFERRED_PROVIDER_virtual/libintl ?=3D &quot;newlib&quot=
;<br>
=C2=A0PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D &quot;nativesdk-gli=
bc&quot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D &quot;nativesdk-gl=
ibc&quot;<br>
<br>
-DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;ldconfig&quot;<br>
+DISTRO_FEATURES_OPTED_OUT +=3D &quot;ldconfig&quot;<br>
<br>
=C2=A0#USE_NLS ?=3D &quot;no&quot;<br>
<br>
diff --git a/meta/conf/distro/include/tclibc-picolibc.inc b/meta/conf/distr=
o/include/tclibc-picolibc.inc<br>
index 2cd26cfd7dcd..6134b0d97d6a 100644<br>
--- a/meta/conf/distro/include/tclibc-picolibc.inc<br>
+++ b/meta/conf/distro/include/tclibc-picolibc.inc<br>
@@ -11,7 +11,7 @@ PREFERRED_PROVIDER_virtual/libintl ?=3D &quot;picolibc&qu=
ot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D &quot;nativesdk-gli=
bc&quot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D &quot;nativesdk-gl=
ibc&quot;<br>
<br>
-DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;ldconfig&quot;<br>
+DISTRO_FEATURES_OPTED_OUT +=3D &quot;ldconfig&quot;<br>
<br>
=C2=A0IMAGE_LINGUAS =3D &quot;&quot;<br>
<br>
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf<br=
>
index 1853676fa060..5c93d0e47970 100644<br>
--- a/meta/conf/documentation.conf<br>
+++ b/meta/conf/documentation.conf<br>
@@ -141,8 +141,8 @@ DISTRO[doc] =3D &quot;The short name of the distributio=
n. If the variable is blank, met<br>
=C2=A0DISTRO_EXTRA_RDEPENDS[doc] =3D &quot;Specifies a list of distro-speci=
fic packages to add to all images. The variable only applies to the images =
that include packagegroup-base.&quot;<br>
=C2=A0DISTRO_EXTRA_RRECOMMENDS[doc] =3D &quot;Specifies a list of distro-sp=
ecific packages to add to all images if the packages exist. The list of pac=
kages are automatically installed but you can remove them.&quot;<br>
=C2=A0DISTRO_FEATURES[doc] =3D &quot;The features enabled for the distribut=
ion.&quot;<br>
-DISTRO_FEATURES_BACKFILL[doc] =3D &quot;Features to be added to DISTRO_FEA=
TURES if not also present in DISTRO_FEATURES_BACKFILL_CONSIDERED. This vari=
able is set in the meta/conf/bitbake.conf file and it is not intended to be=
 user-configurable.&quot;<br>
-DISTRO_FEATURES_BACKFILL_CONSIDERED[doc] =3D &quot;Features from DISTRO_FE=
ATURES_BACKFILL that should not be backfilled (i.e. added to DISTRO_FEATURE=
S) during the build.&quot;<br>
+DISTRO_FEATURES_DEFAULTS[doc] =3D &quot;The default set of distribution fe=
atures, prior to any filtering. Usually you should leave this alone and mod=
ify DISTRO_FEATURES and/or DISTRO_FEATURES_OPTED_OUT.&quot;<br>
+DISTRO_FEATURES_OPTED_OUT[doc] =3D &quot;The set of default distribtion fe=
atures to disable. Prefer opting out of features using this variable instea=
d of using DISTRO_FEATURES:remove.&quot;<br>
=C2=A0DISTRO_NAME[doc] =3D &quot;The long name of the distribution.&quot;<b=
r>
=C2=A0DISTRO_PN_ALIAS[doc] =3D &quot;Alias names used for the recipe in var=
ious Linux distributions.&quot;<br>
=C2=A0DISTRO_VERSION[doc] =3D &quot;The version of the distribution.&quot;<=
br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div></div></div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#235727): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/235727" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/235727</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118620443/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118620443/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--00000000000033f8f806501259ba--

