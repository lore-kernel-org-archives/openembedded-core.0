Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A6B98605FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 15:27:00 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u132so3593392wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QRnDDKMiNyl0vMFGP0SGTiXKZA5jdLgVo7yTEgngtq0=;
	b=EyEAOqtjV9Mid5PaKyIXFQ8o0sxgHaUUWgD7Y+vLvrmCT9pMsfpXINYfmKU88E+vaV
	3DI2r4e0NaKp8Ijb/M1Irqi9OONJEfT4r06ax1LW1Qi7SkfPBFsnyP07Jq50FUOAFRWj
	ZGshf2N9Y/2FruLm/Iouv8ap/qg1QRMABcvBH++pgLDTgvIeJtaOhKBIO0uxXRcXuAMm
	DVtwt1jn7/qd4kxtAg1Wsd35m61hIAX4LX+9fD8vDIUiOof8DMsYcKzQ/0U+2iYttuqA
	JWO8zsSgv4obT1Ui25DQ/2IHrdti2VnPAJjNN56q8TEaFOv0aOl0JJBSuhM++ua+lR1g
	Z18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QRnDDKMiNyl0vMFGP0SGTiXKZA5jdLgVo7yTEgngtq0=;
	b=NCfFDCLMoDm90efhjiVSfuFN26R+u8AxDH7n9U7OZgHjN45mVg4KT03QxXNmi/dG28
	Tkgdt5OCsm8RLlRaBKX8TXfWFGTZXc52cl80WYxchWf+zLWxSFD9auQOK35hQB0r0qmh
	0C/rdFG0ul85OxJ0GSihsWbHo3XuecIHmwOXiKhuD5JJPhBld9z19B2+cNLz6x+b7nHG
	pFviSx7lrZuiWRKULi4wTKijkl8G47zxVZGwXvFzkn4f2fl+cQy//CJTVigMVkYbSezG
	CfiYXyRtBMaoGvH08Hf7F5MouY9LH3k6IB+g1P0N1dZyC8f5kl/vj7rsiCfBMTZfPKZT
	Y+iA==
X-Gm-Message-State: AFeK/H1vfnMtonqVMwZplj6oWM88zKIq1KzTywae8aWms66lOK6VJ9Sr1Df5qkRm2na4Tc1T9bHq5T1gBETfVQ==
X-Received: by 10.28.199.132 with SMTP id x126mr3171278wmf.37.1490110020729;
	Tue, 21 Mar 2017 08:27:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Tue, 21 Mar 2017 08:26:30 -0700 (PDT)
In-Reply-To: <789385f4751e6657d8ed8d458d49f824adc2b5d7.1490086265.git-series.patrick.ohly@intel.com>
References: <1490086445.6396.214.camel@intel.com>
	<789385f4751e6657d8ed8d458d49f824adc2b5d7.1490086265.git-series.patrick.ohly@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Mar 2017 08:26:30 -0700
Message-ID: <CAMKF1srWnJuEctYX7sJmBZe6JwaBnsfimD8DW=zrXvcma3G4Yw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: ricardo.neri@intel.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ovmf: fix toolchain selection
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
X-List-Received-Date: Tue, 21 Mar 2017 15:27:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 21, 2017 at 1:56 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> For the native tools, a static patch inserted gcc/g++/ld/ar while later
> adding BUILD_LDFLAGS and BUILD_CFLAGS with sed. Now it's all done with sed,
> which has the advantage that it uses the actual compile variables. However,
> in practice those are the same.
>
> More importantly, picking the build tools for the target was
> broken. ovmf-native tried to insert TARGET_PREFIX into the tools
> definition file, but that variable is empty in a native recipe. As a
> result, "gcc" was used instead of "${HOST_PREFIX}gcc", leading to an
> undesirable dependency on the host compiler and potentially
> (probably?!) causing some of the build issues that were seen for ovmf.
>
> The new approach is to override the tool selection in ovmf-native so
> that the HOST_PREFIX env variable is used, which then gets exported
> during do_compile for the target.
>
> While at it, Python code that gets appened to do_patch only to call
> shell functions gets replaced with the do_patch[postfuncs] mechanism.
>
> Incremental builds now always use the tools definition from the
> current ovmf-native; previously, only the initial build copied the
> template file.
>

FWIW this patch looks good.

> Probably the entire split into ovmf-native and ovmf could be
> removed. This merely hasn't been attempted yet.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch | 48 ------------------------------------------------
>  meta/recipes-core/ovmf/ovmf_git.bb                                                       | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++------------------
>  2 files changed, 50 insertions(+), 66 deletions(-)
>  delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
>
> diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
> deleted file mode 100644
> index 644b99d..0000000
> --- a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 6e24bde1979c2d7149b37d142fb882dfde0e9770 Mon Sep 17 00:00:00 2001
> -From: Matt Fleming <matt.fleming@intel.com>
> -Date: Fri, 27 Jun 2014 11:12:18 +0100
> -Subject: [PATCH] BaseTools: Force tools variables to host toolchain
> -
> -Signed-off-by: Matt Fleming <matt.fleming@intel.com>
> ----
> - BaseTools/Source/C/Makefiles/app.makefile | 7 +++++++
> - BaseTools/Source/C/VfrCompile/GNUmakefile | 5 +++++
> - 2 files changed, 12 insertions(+)
> -
> -diff --git a/BaseTools/Source/C/Makefiles/app.makefile b/BaseTools/Source/C/Makefiles/app.makefile
> -index 19269a1..62aad0f 100644
> ---- a/BaseTools/Source/C/Makefiles/app.makefile
> -+++ b/BaseTools/Source/C/Makefiles/app.makefile
> -@@ -16,6 +16,13 @@ include $(MAKEROOT)/Makefiles/header.makefile
> -
> - APPLICATION = $(MAKEROOT)/bin/$(APPNAME)
> -
> -+CC = gcc
> -+CXX = g++
> -+AS = gcc
> -+AR = ar
> -+LD = ld
> -+LINKER = $(CC)
> -+
> - .PHONY:all
> - all: $(MAKEROOT)/bin $(APPLICATION)
> -
> -diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Source/C/VfrCompile/GNUmakefile
> -index 82005e1..5ac5f7e 100644
> ---- a/BaseTools/Source/C/VfrCompile/GNUmakefile
> -+++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
> -@@ -26,6 +26,11 @@ OBJECTS = AParser.o DLexerBase.o ATokenBuffer.o EfiVfrParser.o VfrLexer.o VfrSyn
> -
> - VFR_CPPFLAGS = -DPCCTS_USE_NAMESPACE_STD $(CPPFLAGS)
> -
> -+CC = gcc
> -+CXX = g++
> -+AS = gcc
> -+AR = ar
> -+LD = ld
> - LINKER = $(BUILD_CXX)
> -
> - EXTRA_CLEAN_OBJECTS = EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg VfrTokens.h VfrLexer.cpp VfrLexer.h VfrSyntax.cpp tokens.h
> ---
> -1.9.0
> -
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> index a658c9d..898c5b7 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -11,7 +11,6 @@ PACKAGECONFIG ??= ""
>  PACKAGECONFIG[secureboot] = ",,,"
>
>  SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
> -       file://0001-BaseTools-Force-tools-variables-to-host-toolchain.patch \
>         file://0002-ovmf-update-path-to-native-BaseTools.patch \
>         file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
>         file://VfrCompile-increase-path-length-limit.patch \
> @@ -51,31 +50,54 @@ COMPATIBLE_HOST='(i.86|x86_64).*'
>  OVMF_SECURE_BOOT_EXTRA_FLAGS ??= ""
>  OVMF_SECURE_BOOT_FLAGS = "-DSECURE_BOOT_ENABLE=TRUE ${OVMF_SECURE_BOOT_EXTRA_FLAGS}"
>
> -do_patch_append_class-native() {
> -    bb.build.exec_func('do_fix_iasl', d)
> -    bb.build.exec_func('do_fix_toolchain', d)
> +do_patch[postfuncs] += "fix_basetools_location"
> +fix_basetools_location () {
>  }
> -
> -do_fix_basetools_location() {
> +fix_basetools_location_class-target() {
> +    # Replaces the fake path inserted by 0002-ovmf-update-path-to-native-BaseTools.patch.
> +    # Necessary for finding the actual BaseTools from ovmf-native.
>      sed -i -e 's#BBAKE_EDK_TOOLS_PATH#${STAGING_BINDIR_NATIVE}/${EDK_TOOLS_DIR}#' ${S}/OvmfPkg/build.sh
>  }
>
> -do_patch_append_class-target() {
> -    bb.build.exec_func('do_fix_basetools_location', d)
> +do_patch[postfuncs] += "fix_iasl"
> +fix_iasl() {
>  }
> -
> -
> -do_fix_iasl() {
> +fix_iasl_class-native() {
> +    # iasl is not installed under /usr/bin when building with OE.
>      sed -i -e 's#/usr/bin/iasl#${STAGING_BINDIR_NATIVE}/iasl#' ${S}/BaseTools/Conf/tools_def.template
>  }
>
> -do_fix_toolchain(){
> -    sed -i -e 's#DEF(ELFGCC_BIN)/#${TARGET_PREFIX}#' ${S}/BaseTools/Conf/tools_def.template
> -    sed -i -e 's#DEF(GCC.*PREFIX)#${TARGET_PREFIX}#' ${S}/BaseTools/Conf/tools_def.template
> -    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS += ${BUILD_LDFLAGS}#" ${S}/BaseTools/Source/C/Makefiles/app.makefile
> -    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS += ${BUILD_CFLAGS}#" ${S}/BaseTools/Source/C/Makefiles/app.makefile
> -    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS += ${BUILD_LDFLAGS}#" ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
> -    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS += ${BUILD_CFLAGS}#" ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
> +# Inject CC and friends into the build. LINKER already is in GNUmakefile.
> +# Must be idempotent and thus remove old assignments that were inserted
> +# earlier.
> +do_patch[postfuncs] += "fix_toolchain"
> +fix_toolchain() {
> +    sed -i \
> +        -e '/^\(CC\|CXX\|AS\|AR\|LD\|LINKER\) =/d' \
> +        -e '/^APPLICATION/a CC = ${CC}\nCXX = ${CXX}\nAS = ${AS}\nAR = ${AR}\nLD = ${LD}\nLINKER = $(CC)' \
> +        ${S}/BaseTools/Source/C/Makefiles/app.makefile
> +    sed -i \
> +        -e '/^\(CC\|CXX\|AS\|AR\|LD\)/d' \
> +        -e '/^VFR_CPPFLAGS/a CC = ${CC}\nCXX = ${CXX}\nAS = ${AS}\nAR = ${AR}\nLD = ${LD}' \
> +        ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
> +}
> +fix_toolchain_append_class-native() {
> +    # This tools_def.template is going to be used by the target ovmf and
> +    # defines which compilers to use. For the GCC toolchain definitions,
> +    # that will be ${HOST_PREFIX}gcc. However, "make" doesn't need that
> +    # prefix.
> +    #
> +    # Injecting ENV(HOST_PREFIX) matches exporting that value as env
> +    # variable in do_compile_class-target.
> +    sed -i \
> +        -e 's#\(ENV\|DEF\)(GCC.*_PREFIX)#ENV(HOST_PREFIX)#' \
> +        -e 's#ENV(HOST_PREFIX)make#make#' \
> +        ${S}/BaseTools/Conf/tools_def.template
> +    sed -i \
> +        -e '/^\(LFLAGS\|CFLAGS\) +=/d' \
> +        -e '/^LINKER/a LFLAGS += ${BUILD_LDFLAGS}\nCFLAGS += ${BUILD_CFLAGS}' \
> +        ${S}/BaseTools/Source/C/Makefiles/app.makefile \
> +        ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
>  }
>
>  GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
> @@ -119,6 +141,16 @@ do_compile_class-target() {
>          OVMF_ARCH="IA32"
>      fi
>
> +    # The build for the target uses BaseTools/Conf/tools_def.template
> +    # from ovmf-native to find the compiler, which depends on
> +    # exporting HOST_PREFIX.
> +    export HOST_PREFIX="${HOST_PREFIX}"
> +
> +    # BaseTools/Conf gets copied to Conf, but only if that does not
> +    # exist yet. To ensure that an updated template gets used during
> +    # incremental builds, we need to remove the copy before we start.
> +    rm -f `ls ${S}/Conf/*.txt | grep -v ReadMe.txt`
> +
>      # ${WORKDIR}/ovmf is a well-known location where do_install and
>      # do_deploy will be able to find the files.
>      rm -rf ${WORKDIR}/ovmf
>
> base-commit: 30bea167e7c204be52b3f5af24e43d5f339e98b7
> --
> git-series 0.9.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

