Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59A2CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 19:08:52 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.2337.1759518528595268458
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 12:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=K6vyU2uX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.45, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-378aa12c13dso1074958fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1759518528; x=1760123328; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTUzg/kZjKiz5oKfjw08JHx5oeP6YKVmoeGsnu9nNFQ=;
        b=K6vyU2uXc1SY95ybZVSw0xx9Y3huSl6vn2hjFkWHm0AdNl8/w2Tjw/7kY3NR3qHrSP
         kKbNOUtjnvQG1eLsjnFwDXq4Dbqp2ROv/12aDlwja5DR8VBag2AqlnrVjPecmsbBKP0+
         kVqx9abNrtTyi6Y/uXriq2VB02ODBrPD96dc0+e2PTpgWs8HeUW+Yxb/eS8KQdbrfWS0
         x8w64LWYrJeLV0SqvjnUCw8SLewPOBGEjCmYEDDfoVAeLAwnscp1aDybevY+aqGWdsUc
         P5B4VjPCXj7I0iYaJRIt1X2rxVzY3d1949HsRE4tezfBF7e8cGhQuaA0AqVYB6fofMlB
         pGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759518528; x=1760123328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTUzg/kZjKiz5oKfjw08JHx5oeP6YKVmoeGsnu9nNFQ=;
        b=xSxGUvOR9i58aeh72DTuebeB2NgV+IHKfKt6985zzzUcequzX7c8xG+KuMUsgta02k
         zflq2XHzl60KFkvl1cGwYLhthNXXHYgjm6Iy5asKPlitlKR/zX/wSMZIpZD8/qDWaIRn
         RNb1qJSIQRAO9FD4QxUq0aWZk7V6sczxWScb3z9Kz6SfgAy2fVhHAil2K09mb47WE2ko
         GR8B3oXO8MJoRlOsDlOsGM8PYVfosRD/vrxADfIAF2LJri/LX1rRpg63VbBFuKD0UD+S
         wVl2fz1CiVvJIfGAT/drtEu8g+ouc+7/unI051vXi2c6l2ywR3nfQobgUPtsNatybOwg
         ba/Q==
X-Gm-Message-State: AOJu0Yzv8exsl5Uh0VNAKd4AglrbuEHV53Cy1PIUpDfmGGUJPsLrSaNa
	xMEBW6QEazzTq/CgJo6W0Ssfm8yPqfGybkXUonQDZjKqjmeCd/a6LIFJJhK04sC311pwZ5W9nQA
	B78znLi0JW26c+z0BsgD4Ceh4fVSF6WJ2Xxp8CWDR
X-Gm-Gg: ASbGncv226ohTsPCyONjtyp0Dkzw9jSuaNjArbtzzoKMYdpFqjLuvrZS1Cw/tvtP2NA
	1XLKZCcgdArlk22Eq/jSxyV21Hs8hAKxvaWNYCmOfqaLkEP0sRwIImo6oIxWbXtMoOKKopq0Ahk
	9+W/UTVMKJJB8UT6y8yoSRhY3JWrVi/2hJKoRvzprqSF1Q83sIlcmqyhxWZE/yVCp7Jzqftwoi6
	/8NO1scnxHwmn17Yw5IG+NDs0TPtdNgJRswzBXNlQ==
X-Google-Smtp-Source: AGHT+IFVTwF+vSc214dl3KQZ49Vckj4UwvB6yycR/rEImFri3cuWwpfCYwVmg/M/rgxWTBWxWS5PIfPQDM5imM6dJ6Y=
X-Received: by 2002:a05:6870:1484:b0:349:805a:dc75 with SMTP id
 586e51a60fabf-3b0fa43ef58mr2281500fac.42.1759518527744; Fri, 03 Oct 2025
 12:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250929153647.1258488-1-raj.khem@gmail.com>
In-Reply-To: <20250929153647.1258488-1-raj.khem@gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 3 Oct 2025 15:08:37 -0400
X-Gm-Features: AS18NWCzXeCks9NAwuT9NnAh7lmK4sMJS2BFzs70marNnjevz7JRWLOmQXOe8G4
Message-ID: <CAPoiz9zpXWb3HMsaTLhhB5bOfHsdk4tbcPdBe4+Pt-KkbH28iA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] gn: Add recipe
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 19:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224420

On Mon, Sep 29, 2025 at 11:36=E2=80=AFAM Khem Raj via lists.openembedded.or=
g
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> gn is a commonly used build tool to generate ninja files, used
> in a lot of recipes e.g. chromium, qtwebengine, perfetto, hafnium etc.
> these recipes come from different layers e.g. meta-qt6/meta-arm/meta-oe
>
> since not all layers depend on meta-oe ( meta-arm does not ), its not
> a possible option.
>
> Given the usecases, putting it in core will benefit the ecosystem
> and reduce some duplication. This recipe is taken from meta-arm
>
> Disable maybe-initialized is a gcc specific option as error
>
> Disable format warnings as errors, it adds -Wno-format explictly in
> its build system
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2:
>  * Disable shallow clone, build fails gen.py does not work with it
>  * Add build progress for do_compile
>  * Update to latest commit on main
> v3:
>  * Make maybe-intialized opton to be gcc specific

I'm seeing this causing issues with qemuarm64-secureboot and clang,
and needs to be added back.  See
https://gitlab.com/jonmason00/meta-arm/-/jobs/11586703411/viewer#L10702

Want me to send a patch to remove the gcc specificity?

Thanks,
Jon

>  * Disable format string warnings as errors
>
>  meta/conf/distro/include/maintainers.inc    |  1 +
>  meta/conf/distro/include/security_flags.inc |  1 +
>  meta/recipes-devtools/gn/gn_git.bb          | 52 +++++++++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-devtools/gn/gn_git.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 0988bf50a72..85a9914469b 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -224,6 +224,7 @@ RECIPE_MAINTAINER:pn-glibc-scripts =3D "Khem Raj <raj=
.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glibc-testsuite =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gmp =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glslang =3D "Jose Quaresma <quaresma.jose@gmail.com=
>"
> +RECIPE_MAINTAINER:pn-gn =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gnome-desktop-testing =3D "Ross Burton <ross.burton=
@arm.com>"
>  RECIPE_MAINTAINER:pn-gnu-config =3D "Robert Yang <liezhi.yang@windriver.=
com>"
>  RECIPE_MAINTAINER:pn-gnu-efi =3D "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/dist=
ro/include/security_flags.inc
> index f713a994651..824ba2c0e3f 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -46,6 +46,7 @@ SECURITY_LDFLAGS:pn-sysklogd =3D ""
>  # Recipes which fail to compile when elevating -Wformat-security to an e=
rror
>  SECURITY_STRINGFORMAT:pn-busybox =3D ""
>  SECURITY_STRINGFORMAT:pn-gcc =3D ""
> +SECURITY_STRINGFORMAT:pn-gn =3D ""
>
>  TARGET_CC_ARCH:append:class-target =3D " ${SECURITY_CFLAGS}"
>  TARGET_LDFLAGS:append:class-target =3D " ${SECURITY_LDFLAGS}"
> diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/g=
n/gn_git.bb
> new file mode 100644
> index 00000000000..d8896609b19
> --- /dev/null
> +++ b/meta/recipes-devtools/gn/gn_git.bb
> @@ -0,0 +1,52 @@
> +SUMMARY =3D "GN is a meta-build system that generates build files for Ni=
nja"
> +HOMEPAGE =3D "https://gn.googlesource.com/gn/"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fca02217a5d49a14dfe2d11837bb=
34d"
> +
> +DEPENDS +=3D "ninja-native"
> +UPSTREAM_CHECK_COMMITS =3D "1"
> +
> +SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmain=
"
> +SRCREV =3D "81b24e01531ecf0eff12ec9359a555ec3944ec4e"
> +PV =3D "0+git"
> +
> +BB_GIT_SHALLOW =3D ""
> +
> +B =3D "${WORKDIR}/build"
> +
> +# Map from our _OS strings to the GN's platform values.
> +def gn_platform(variable, d):
> +    os =3D d.getVar(variable)
> +    if "linux" in os:
> +        return "linux"
> +    elif "mingw" in os:
> +        return "mingw"
> +    else:
> +        return os
> +
> +do_configure[cleandirs] +=3D "${B}"
> +do_configure() {
> +    python3 ${S}/build/gen.py \
> +        --platform=3D${@gn_platform("TARGET_OS", d)} \
> +        --out-path=3D${B} \
> +        --no-static-libstdc++ \
> +        --no-strip
> +}
> +
> +# Catch build progress from ninja
> +do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
> +
> +do_compile() {
> +    ninja -C ${B} --verbose
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install ${B}/gn ${D}${bindir}
> +}
> +
> +BBCLASSEXTEND =3D "native"
> +
> +COMPATIBLE_HOST =3D "^(?!riscv32).*"
> +
> +CFLAGS:append:toolchain-gcc =3D " -Wno-error=3Dmaybe-uninitialized"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224149): https://lists.openembedded.org/g/openembedde=
d-core/message/224149
> Mute This Topic: https://lists.openembedded.org/mt/115497351/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jd=
mason@kudzu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

