Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0F7E74900
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 23:07:57 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.111220.1766531269072835405
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 15:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LuTZbuEf;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-644715aad1aso6574783d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 15:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766531268; x=1767136068; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v9AMqK7U3nXX0IGoloKuHoiscD1B2zWPgibnDZB4oSE=;
        b=LuTZbuEfzxMYpel3j+UUG2k1dibTINB52KtVxullnnQSwHL74mMjTs9q+AV+J54Inh
         z6U96i1NNNFaWcfeB9dql46NXVg4lPkojaKZeZQ6Uaca1+RNnRBDpIgArU1DPuGyvsuO
         JkiHIein9MdTBk8Ni7ITF1h0TAoMcT46fh9cOYk3PhPAjcyqZhsNnEfq8E+HvQiViWXB
         V5J3yNZwNJKkLKx79CygpjyyOW44HU3jprDW+coxj2bGa3rWXico6sZi9IwhXjHWGAy6
         AjHWGtkksS6F/opFmYbj3keKzhjgUzVPN7Cp2/QFxIUzNxhxKFZsx0CNtFB76NUHYr+H
         En6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766531268; x=1767136068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9AMqK7U3nXX0IGoloKuHoiscD1B2zWPgibnDZB4oSE=;
        b=tq/aBBzHQDbLFSKYArEoa13PtV0x0/o7cYq/+xmQ8bzjapTQ/DmoJn6uEUs64ASn8E
         gq2KMfdnirmGdeM89Bhlc+RubAp+c11WGPmuKjONWggDWu4C9jwX5/Lgcy8bOF1/eYbk
         FZVNlJDTXAQSA52trrN4KUgZvo3qZ/87+PJJTV/jdv0TtER3U/MmEoy0Z6j7E/kig1/v
         /RimCZSOb5EX43x1T+scKauWAQnvZIPedzqMZ/VYGu7IdU/bDnie0+pCu6BRN4d3+mc+
         8YNaghtaBlIfKFyqzCuNrLZ53+RciVmBpJ05rdZI60U30cfSkdgqTa3H3/CEbO0D8A05
         ef5A==
X-Gm-Message-State: AOJu0Yw0CoTzVCWYnD+cxGZVt+zCdEs1dmDt9ZMl2RTzHHtCmpXXGjXy
	Fra53WH0aVNT0ApFEUfe5Xb0yE1Oj9rRfa7yH+CroaEjGYKe2os2Gl+sgy244Pj9WGz2oGNNVGM
	Vu/iXjt6kcwSBASxcUyoGzUOl+e9IDug5F+SVT3g=
X-Gm-Gg: AY/fxX5gLpPBFyQWfouswVsrIhKMufLz8/L5O0t/+KWruyiJmvW52tVvVsUffoxiKEL
	H34HCyTR3PVWcr1sUYu4ZBZ5HlodsE7kdAUcdVxginGOQLpbXvjyl49cCmoCWWe5wpUeN3qL9Tf
	Eqbg9I2Fj5ll20Me1egZ7qIoK0aadKTQUx/JCXd65yUyCPQVjim4bgDb5RoK2RWFsPiIO3OpV6a
	CjeO4GwVcaEu8ZvgXVD27dXyXRA8uN1I6IfApUEKOfMBOz7mW/WS+RmNv7jkVFlPOwzx0WcqLZf
	q0egsq49eSuXO2odeQkg9Fp8xnCkwIX7FlVUXgGQjEkGN7g+dnDiJRfe+d0qUgWqh1IatQdcNPP
	UOkLW3wIkMVYB1WOfHUddG5ep5qD733ugTKe2OJXOUg==
X-Google-Smtp-Source: AGHT+IGqpDEij6M5O6N6jQv6yfrV6tx30MKn8koBfdJPBgFuDQK5d9F8ZFQzvRy2bd90wcRYdpzTwHZfBst3iqxCIKg=
X-Received: by 2002:a05:690e:4290:10b0:644:7175:813d with SMTP id
 956f58d0204a3-646632549f4mr11565664d50.21.1766531267963; Tue, 23 Dec 2025
 15:07:47 -0800 (PST)
MIME-Version: 1.0
References: <20251222200739.2278706-1-alex.kanavin@gmail.com> <20251222200739.2278706-47-alex.kanavin@gmail.com>
In-Reply-To: <20251222200739.2278706-47-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Dec 2025 15:07:21 -0800
X-Gm-Features: AQt7F2qyKqhCVzwSCXB3MgkkbU7xXsHYxVdcp1vKR2miq1_3PdZ03wvLURvOcQw
Message-ID: <CAMKF1soo1kGa9XhE=Ti+fmycHXPLWnr2b7Sj3wfQ_bVqau5Usw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 047/114] ovmf: upgrade 202508 -> 202511
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000b62f510646a69c95"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 23:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228511

--000000000000b62f510646a69c95
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

meta/recipes-core/ovmf/ovmf-shell-image.bb also needs to narrow down
COMPATIBLE_HOST to respond to this change.

On Mon, Dec 22, 2025 at 12:08=E2=80=AFPM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:

> From: Alexander Kanavin <alex@linutronix.de>
>
> Upstream has dropped support for 32 bit x86:
>
> https://github.com/tianocore/edk2/commit/2a6708a786eb0f0e9b979cd93c5dc12c=
42e337a1
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...ovmf-update-path-to-native-BaseTools.patch |  9 +++--
>  ...ile-adjust-to-build-in-under-bitbake.patch | 11 ++++--
>  .../ovmf/ovmf/0003-debug-prefix-map.patch     | 37 ++++++++++---------
>  .../ovmf/ovmf/0004-reproducible.patch         | 17 +++++----
>  ...ceptionHandlerLib-fix-push-instructi.patch |  7 +++-
>  meta/recipes-core/ovmf/ovmf_git.bb            | 16 +++-----
>  6 files changed, 53 insertions(+), 44 deletions(-)
>
> diff --git
> a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.p=
atch
> b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.p=
atch
> index 890e586210..bc70c1ab91 100644
> ---
> a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.p=
atch
> +++
> b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.p=
atch
> @@ -1,7 +1,7 @@
> -From 0f859c6de2914cd984f8a0dd61471b91a2371bfa Mon Sep 17 00:00:00 2001
> +From 89a7bfe82c9dea89fa7d859eb392aa414a365578 Mon Sep 17 00:00:00 2001
>  From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
>  Date: Thu, 9 Jun 2016 02:23:01 -0700
> -Subject: [PATCH] ovmf: update path to native BaseTools
> +Subject: [PATCH 1/5] ovmf: update path to native BaseTools
>
>  BaseTools is a set of utilities to build EDK-based firmware. These
> utilities
>  are used during the build process. Thus, they need to be built natively.
> @@ -16,7 +16,7 @@ Upstream-Status: Inappropriate [oe-core cross compile
> specific]
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh
> -index 279f0d099a..285f061bf4 100755
> +index 30f4830173..ce4ffb20ab 100755
>  --- a/OvmfPkg/build.sh
>  +++ b/OvmfPkg/build.sh
>  @@ -24,7 +24,7 @@ then
> @@ -28,3 +28,6 @@ index 279f0d099a..285f061bf4 100755
>     echo $EDK_TOOLS_PATH
>     source edksetup.sh BaseTools
>   else
> +--
> +2.47.3
> +
> diff --git
> a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-=
under-bitbake.patch
> b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-=
under-bitbake.patch
> index 4a55528571..27c4324b67 100644
> ---
> a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-=
under-bitbake.patch
> +++
> b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-=
under-bitbake.patch
> @@ -1,7 +1,7 @@
> -From 9dbd082516fdd7100f99f0f389b8eef5ececab19 Mon Sep 17 00:00:00 2001
> +From 8b4941871ccc88ed8b31eb7ffc097e1fe39fe57d Mon Sep 17 00:00:00 2001
>  From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
>  Date: Fri, 26 Jul 2019 17:34:26 -0400
> -Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
> +Subject: [PATCH 2/5] BaseTools: makefile: adjust to build in under bitba=
ke
>
>  Prepend the build flags with those of bitbake. This is to build
>  using the bitbake native sysroot include and library directories.
> @@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [needs to be converted
> to in-recipe fixups]
>   1 file changed, 7 insertions(+), 8 deletions(-)
>
>  diff --git a/BaseTools/Source/C/Makefiles/header.makefile
> b/BaseTools/Source/C/Makefiles/header.makefile
> -index 55a7307a5e..e36e6a8f04 100644
> +index 53e73abe53..0b3f9bbb2a 100644
>  --- a/BaseTools/Source/C/Makefiles/header.makefile
>  +++ b/BaseTools/Source/C/Makefiles/header.makefile
> -@@ -154,35 +154,34 @@ endif
> +@@ -151,35 +151,34 @@ endif
>
>   INCLUDE =3D $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Commo=
n
> -I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I
> $(MAKEROOT)/Common/ -I .. -I . $(ARCH_INCLUDE)
>   INCLUDE +=3D -I $(EDK2_PATH)/MdePkg/Include
> @@ -64,3 +64,6 @@ index 55a7307a5e..e36e6a8f04 100644
>   ifeq ($(HOST_ARCH), IA32)
>   #
>   # Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns
> i386, but gcc defaults
> +--
> +2.47.3
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
> b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
> index 1e79c23ae9..18ea24802a 100644
> --- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
> +++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
> @@ -1,7 +1,7 @@
> -From eb6db21ed0a845dce149d17acf8673d5188adea4 Mon Sep 17 00:00:00 2001
> +From 640b1e443a1b400d32d9af0c478abbbaebd491f1 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 14 Jun 2021 19:56:28 +0200
> -Subject: [PATCH] debug prefix map
> +Subject: [PATCH 3/5] debug prefix map
>
>  We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
>   --debug-prefix-map to nasm (we carry a patch to nasm for this). The
> @@ -22,30 +22,30 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
>  diff --git a/BaseTools/Conf/tools_def.template
> b/BaseTools/Conf/tools_def.template
> -index 0caa1c9001..dd86b3249d 100755
> +index 90a389bdff..1e134b299a 100755
>  --- a/BaseTools/Conf/tools_def.template
>  +++ b/BaseTools/Conf/tools_def.template
> -@@ -920,7 +920,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D
> --add-gnu-debuglink=3D"$(DEBUG_DIR)/$(MODULE_
> +@@ -833,7 +833,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D
> --add-gnu-debuglink=3D"$(DEBUG_DIR)/$(MODULE_
>   *_*_*_DTC_PATH                     =3D DEF(DTC_BIN)
>
>   # All supported GCC archs except LOONGARCH64 support
> -mstack-protector-guard=3Dglobal, so set that on everything except LOONGA=
RCH64
>  -DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builti=
n
> -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h
> -fno-common -fstack-protector
>  +DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builti=
n
> -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h
> -fno-common -fstack-protector ENV(GCC_PREFIX_MAP)
>   DEFINE GCC_IA32_X64_CC_FLAGS       =3D -mstack-protector-guard=3Dglobal
> - DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS)
> -mlittle-endian -mabi=3Daapcs -fno-short-enums -funsigned-char
> -ffunction-sections -fdata-sections -fomit-frame-pointer -Wno-address
> -mthumb -fno-pic -fno-pie -mstack-protector-guard=3Dglobal
>   DEFINE GCC_LOONGARCH64_CC_FLAGS    =3D DEF(GCC_ALL_CC_FLAGS) -mabi=3Dlp=
64d
> -fno-asynchronous-unwind-tables -Wno-address -fno-short-enums -fsigned-ch=
ar
> -ffunction-sections -fdata-sections
> -@@ -938,8 +938,8 @@ DEFINE GCC_ARM_AARCH64_ASLDLINK_FLAGS =3D
> -Wl,--defsym=3DPECOFF_HEADER_SIZE=3D0 DEF(GC
> - DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLINK_FLAGS)
> -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)
> DEF(GCC_ARM_AARCH64_ASLDLINK_FLAGS)
> - DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS)
> -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)
> DEF(GCC_ARM_AARCH64_ASLDLINK_FLAGS)
> + DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_FLAGS)
> -mlittle-endian -fno-short-enums -fverbose-asm -funsigned-char
> -ffunction-sections -fdata-sections -Wno-address
> -fno-asynchronous-unwind-tables -fno-unwind-tables -fno-pic -fno-pie
> -ffixed-x18 -mstack-protector-guard=3Dglobal
> +@@ -845,8 +845,8 @@ DEFINE GCC_AARCH64_DLINK_FLAGS     =3D
> -Wl,--emit-relocs -nostdlib -Wl,--gc-sectio
> + DEFINE GCC_LOONGARCH64_DLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_COMMON=
)
> -z common-page-size=3D0x20
> + DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS)
> -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)
> -Wl,--defsym=3DPECOFF_HEADER_SIZE=3D0 DEF(GCC_DLINK2_FLAGS_COMMON) -z
> common-page-size=3D0x20
>   DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_FLA=
GS)
> -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)
> --DEFINE GCC_ASM_FLAGS               =3D -c -x assembler -imacros AutoGen=
.h
> +-DEFINE GCC_ASM_FLAGS               =3D -c -x assembler
>  -DEFINE GCC_PP_FLAGS                =3D -E -x assembler-with-cpp -includ=
e
> AutoGen.h
> -+DEFINE GCC_ASM_FLAGS               =3D -c -x assembler -imacros AutoGen=
.h
> ENV(GCC_PREFIX_MAP)
> ++DEFINE GCC_ASM_FLAGS               =3D -c -x assembler ENV(GCC_PREFIX_M=
AP)
>  +DEFINE GCC_PP_FLAGS                =3D -E -x assembler-with-cpp -includ=
e
> AutoGen.h ENV(GCC_PREFIX_MAP)
>   DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -DVFRCOMPILE --include
> $(MODULE_NAME)StrDefs.h
>   DEFINE GCC_ASLPP_FLAGS             =3D -x c -E -include AutoGen.h
> - DEFINE GCC_ASLCC_FLAGS             =3D -x c
> -@@ -1092,7 +1092,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D
> -mabi=3Dlp64d -march=3Dloongarch64 DEF(
> + DEFINE GCC_ASLCC_FLAGS             =3D -x c -include AutoGen.h
> -fshort-wchar
> +@@ -980,7 +980,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D
> -mabi=3Dlp64d -march=3Dloongarch64 DEF(
>   *_GCC48_IA32_DLINK2_FLAGS         =3D DEF(GCC48_IA32_DLINK2_FLAGS)
>   *_GCC48_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)
>   *_GCC48_IA32_OBJCOPY_FLAGS        =3D
> @@ -54,7 +54,7 @@ index 0caa1c9001..dd86b3249d 100755
>
>     DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS)
>   RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS)
> -Wno-unused-but-set-variable
> -@@ -1120,7 +1120,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D
> DEF(GCC48_IA32_CC_FLAGS) -Wno-unused-but-set
> +@@ -1008,7 +1008,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D
> DEF(GCC48_IA32_CC_FLAGS) -Wno-unused-but-set
>   *_GCC48_X64_DLINK2_FLAGS         =3D DEF(GCC48_X64_DLINK2_FLAGS)
>   *_GCC48_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)
>   *_GCC48_X64_OBJCOPY_FLAGS        =3D
> @@ -63,7 +63,7 @@ index 0caa1c9001..dd86b3249d 100755
>
>     DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS)
>   RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS)
> -Wno-unused-but-set-variable
> -@@ -1229,7 +1229,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D
> DEF(GCC48_AARCH64_CC_FLAGS) -Wno-unused-but-s
> +@@ -1087,7 +1087,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D
> DEF(GCC48_AARCH64_CC_FLAGS) -Wno-unused-but-s
>   *_GCC49_IA32_DLINK2_FLAGS         =3D DEF(GCC49_IA32_DLINK2_FLAGS)
>   *_GCC49_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)
>   *_GCC49_IA32_OBJCOPY_FLAGS        =3D
> @@ -72,7 +72,7 @@ index 0caa1c9001..dd86b3249d 100755
>
>     DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS)
>   RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS)
> -Wno-unused-but-set-variable -Wno-unused-const-variable
> -@@ -1257,7 +1257,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D
> DEF(GCC49_IA32_CC_FLAGS) -Wno-unused-but-set
> +@@ -1115,7 +1115,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D
> DEF(GCC49_IA32_CC_FLAGS) -Wno-unused-but-set
>   *_GCC49_X64_DLINK2_FLAGS         =3D DEF(GCC49_X64_DLINK2_FLAGS)
>   *_GCC49_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)
>   *_GCC49_X64_OBJCOPY_FLAGS        =3D
> @@ -81,7 +81,7 @@ index 0caa1c9001..dd86b3249d 100755
>
>     DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS)
>   RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS)
> -Wno-unused-but-set-variable -Wno-unused-const-variable
> -@@ -1516,7 +1516,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z
> common-page-size=3D0x20
> +@@ -1314,7 +1314,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z
> common-page-size=3D0x20
>   *_GCC5_IA32_DLINK2_FLAGS         =3D DEF(GCC5_IA32_DLINK2_FLAGS) -no-pi=
e
>   *_GCC5_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)
>   *_GCC5_IA32_OBJCOPY_FLAGS        =3D
> @@ -90,7 +90,7 @@ index 0caa1c9001..dd86b3249d 100755
>
>     DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto
>     DEBUG_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X64_DLINK_FLAGS) -fl=
to
> -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386
> -@@ -1548,7 +1548,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D
> DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto -Os -Wl,
> +@@ -1346,7 +1346,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D
> DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto -Os -Wl,
>   *_GCC5_X64_DLINK2_FLAGS          =3D DEF(GCC5_X64_DLINK2_FLAGS)
>   *_GCC5_X64_RC_FLAGS              =3D DEF(GCC_X64_RC_FLAGS)
>   *_GCC5_X64_OBJCOPY_FLAGS         =3D
> @@ -99,3 +99,6 @@ index 0caa1c9001..dd86b3249d 100755
>
>     DEBUG_GCC5_X64_CC_FLAGS        =3D DEF(GCC5_X64_CC_FLAGS) -flto
> -DUSING_LTO
>     DEBUG_GCC5_X64_DLINK_FLAGS     =3D DEF(GCC5_X64_DLINK_FLAGS) -flto -O=
s
> +--
> +2.47.3
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
> b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
> index 73f242321e..b42ecde211 100644
> --- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
> +++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
> @@ -1,7 +1,7 @@
> -From 0d22e07cd9cc35ede04c01d3141068db744d7677 Mon Sep 17 00:00:00 2001
> +From 8b218dffa0368fbc2bfb5d8051b358476266fcb4 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 14 Jun 2021 19:57:30 +0200
> -Subject: [PATCH] reproducible
> +Subject: [PATCH 4/5] reproducible
>
>  This patch fixes various things which make the build more reproducible.
> Some changes
>  here only change intermediate artefacts but that means when you have two
> build trees
> @@ -35,7 +35,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m
> >
>   4 files changed, 24 insertions(+), 16 deletions(-)
>
>  diff --git a/BaseTools/Source/C/GenFw/Elf64Convert.c
> b/BaseTools/Source/C/GenFw/Elf64Convert.c
> -index 18594122ea..92b5f13cf6 100644
> +index 83f1b285c2..e2f582f8fb 100644
>  --- a/BaseTools/Source/C/GenFw/Elf64Convert.c
>  +++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
>  @@ -15,6 +15,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
> @@ -47,7 +47,7 @@ index 18594122ea..92b5f13cf6 100644
>   #endif
>   #include <assert.h>
>   #include <stdio.h>
> -@@ -990,7 +992,7 @@ ScanSections64 (
> +@@ -995,7 +997,7 @@ ScanSections64 (
>     }
>     mCoffOffset =3D mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTORY_ENTRY=
) +
>                   sizeof(EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY) +
> @@ -56,7 +56,7 @@ index 18594122ea..92b5f13cf6 100644
>
>     //
>     // Add more space in the .debug data region for the
> DllCharacteristicsEx
> -@@ -2322,7 +2324,7 @@ WriteDebug64 (
> +@@ -2329,7 +2331,7 @@ WriteDebug64 (
>     EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY         *Nb10;
>     EFI_IMAGE_DEBUG_EX_DLLCHARACTERISTICS_ENTRY *DllEntry;
>
> @@ -65,7 +65,7 @@ index 18594122ea..92b5f13cf6 100644
>
>     NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffse=
t);
>     DataDir =3D
> &NtHdr->Pe32Plus.OptionalHeader.DataDirectory[EFI_IMAGE_DIRECTORY_ENTRY_D=
EBUG];
> -@@ -2355,7 +2357,7 @@ WriteDebug64 (
> +@@ -2362,7 +2364,7 @@ WriteDebug64 (
>
>     Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);
>     Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;
> @@ -153,7 +153,7 @@ index e5f282c4ac..27a34ef7c6 100755
>                   if T.GenFileListMacro and T.FileListMacro not in
> self.FileListMacros:
>                       self.FileListMacros[T.FileListMacro] =3D []
>  diff --git a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
> b/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
> -index aa0b71632e..57c9cad117 100755
> +index 764c51789b..40aadbcfbc 100755
>  --- a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
>  +++ b/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
>  @@ -1429,6 +1429,9 @@ class ModuleAutoGen(AutoGen):
> @@ -175,3 +175,6 @@ index aa0b71632e..57c9cad117 100755
>
>           # Ignore generating makefile when it is a binary module
>           if self.IsBinaryModule:
> +--
> +2.47.3
> +
> diff --git
> a/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-=
push-instructi.patch
> b/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-=
push-instructi.patch
> index 43c402b91a..650e084b5b 100644
> ---
> a/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-=
push-instructi.patch
> +++
> b/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-=
push-instructi.patch
> @@ -1,7 +1,7 @@
> -From 7dcf5ed06b5a256436521f892d2579421c163902 Mon Sep 17 00:00:00 2001
> +From 7e6be0f4068a2158af3c97e873edb33fa4d5c6b8 Mon Sep 17 00:00:00 2001
>  From: Gerd Hoffmann <kraxel@redhat.com>
>  Date: Mon, 3 Nov 2025 09:56:52 +0100
> -Subject: [PATCH] UefiCpuPkg/CpuExceptionHandlerLib: fix push instruction=
s
> +Subject: [PATCH 5/5] UefiCpuPkg/CpuExceptionHandlerLib: fix push
> instructions
>
>  Nasm 3.0 complains about 'dword' being invalid.  The comment talks about
>  a '8-byte value' so 'qword' should be correct here.
> @@ -41,3 +41,6 @@ index 3d64ac9080..671ed98f85 100644
>   VectorNum:
>       push    rax
>   %ifdef NO_ABSOLUTE_RELOCS_IN_TEXT
> +--
> +2.47.3
> +
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/
> ovmf_git.bb
> index 6b42041ac7..ec6c3b516c 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -28,8 +28,8 @@ SRC_URI =3D "gitsm://
> github.com/tianocore/edk2.git;branch=3Dmaster;protocol=3Dhttps;ta
>
> file://0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instructi.patch \
>             "
>
> -PV =3D "edk2-stable202508"
> -SRCREV =3D "d46aa46c8361194521391aa581593e556c707c6e"
> +PV =3D "edk2-stable202511"
> +SRCREV =3D "46548b1adac82211d8d11da12dd914f41e7aa775"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
>
>  CVE_PRODUCT =3D "edk2"
> @@ -58,7 +58,7 @@ EDK_TOOLS_DIR =3D "edk2_basetools"
>  BUILD_OPTIMIZATION =3D ""
>
>  # OVMF supports IA only, although it could conceivably support ARM
> someday.
> -COMPATIBLE_HOST:class-target =3D '(i.86|x86_64).*'
> +COMPATIBLE_HOST:class-target =3D '(x86_64).*'
>
>  # Additional build flags for OVMF with Secure Boot.
>  # Fedora also uses "-D SMM_REQUIRE -D EXCLUDE_SHELL_FROM_FD".
> @@ -178,9 +178,6 @@ do_compile:class-target() {
>      export LFLAGS=3D"${LDFLAGS}"
>      PARALLEL_JOBS=3D"${@oe.utils.parallel_make_argument(d, '-n %d')}"
>      OVMF_ARCH=3D"X64"
> -    if [ "${TARGET_ARCH}" !=3D "x86_64" ] ; then
> -        OVMF_ARCH=3D"IA32"
> -    fi
>
>      # The build for the target uses BaseTools/Conf/tools_def.template
>      # from ovmf-native to find the compiler, which depends on
> @@ -197,9 +194,6 @@ do_compile:class-target() {
>      rm -rf ${WORKDIR}/ovmf
>      mkdir ${WORKDIR}/ovmf
>      OVMF_DIR_SUFFIX=3D"X64"
> -    if [ "${TARGET_ARCH}" !=3D "x86_64" ] ; then
> -        OVMF_DIR_SUFFIX=3D"Ia32" # Note the different capitalization
> -    fi
>      FIXED_GCCVER=3D$(fixup_target_tools ${GCC_VER})
>      bbnote FIXED_GCCVER is ${FIXED_GCCVER}
>
>  build_dir=3D"${S}/Build/Ovmf$OVMF_DIR_SUFFIX/${OVMF_BUILD_TYPE}_${FIXED_=
GCCVER}"
> @@ -231,10 +225,10 @@ do_install:class-native() {
>
>  do_install:class-target() {
>      # Content for UEFI shell iso. We install the EFI shell as
> -    # bootx64/ia32.efi because then it can be started even when the
> +    # bootx64.efi because then it can be started even when the
>      # firmware itself does not contain it.
>      install -d ${D}/efi/boot
> -    install ${WORKDIR}/ovmf/Shell.efi ${D}/efi/boot/boot${@ "ia32" if
> "${TARGET_ARCH}" !=3D "x86_64" else "x64"}.efi
> +    install ${WORKDIR}/ovmf/Shell.efi ${D}/efi/boot/bootx64.efi
>      if ${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'true',
> 'false', d)}; then
>          install ${WORKDIR}/ovmf/EnrollDefaultKeys.efi ${D}
>      fi
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228372):
> https://lists.openembedded.org/g/openembedded-core/message/228372
> Mute This Topic: https://lists.openembedded.org/mt/116906945/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b62f510646a69c95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>meta/recipes-core/ovmf/<a href=3D"http://ovmf-shell-i=
mage.bb">ovmf-shell-image.bb</a> also needs to narrow down COMPATIBLE_HOST =
to respond to this change.</div></div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 22, 2025 =
at 12:08=E2=80=AFPM Alexander Kanavin via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=3D"_blank">al=
ex@linutronix.de</a>&gt;<br>
<br>
Upstream has dropped support for 32 bit x86:<br>
<a href=3D"https://github.com/tianocore/edk2/commit/2a6708a786eb0f0e9b979cd=
93c5dc12c42e337a1" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
tianocore/edk2/commit/2a6708a786eb0f0e9b979cd93c5dc12c42e337a1</a><br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0...ovmf-update-path-to-native-BaseTools.patch |=C2=A0 9 +++--<br>
=C2=A0...ile-adjust-to-build-in-under-bitbake.patch | 11 ++++--<br>
=C2=A0.../ovmf/ovmf/0003-debug-prefix-map.patch=C2=A0 =C2=A0 =C2=A0| 37 +++=
+++++++---------<br>
=C2=A0.../ovmf/ovmf/0004-reproducible.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 17 +++++----<br>
=C2=A0...ceptionHandlerLib-fix-push-instructi.patch |=C2=A0 7 +++-<br>
=C2=A0meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferr=
er" target=3D"_blank">ovmf_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 16 +++-----<br>
=C2=A06 files changed, 53 insertions(+), 44 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-Ba=
seTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native=
-BaseTools.patch<br>
index 890e586210..bc70c1ab91 100644<br>
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch<br>
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch<br>
@@ -1,7 +1,7 @@<br>
-From 0f859c6de2914cd984f8a0dd61471b91a2371bfa Mon Sep 17 00:00:00 2001<br>
+From 89a7bfe82c9dea89fa7d859eb392aa414a365578 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Ricardo Neri &lt;<a href=3D"mailto:ricardo.neri-calderon@linux.=
intel.com" target=3D"_blank">ricardo.neri-calderon@linux.intel.com</a>&gt;<=
br>
=C2=A0Date: Thu, 9 Jun 2016 02:23:01 -0700<br>
-Subject: [PATCH] ovmf: update path to native BaseTools<br>
+Subject: [PATCH 1/5] ovmf: update path to native BaseTools<br>
<br>
=C2=A0BaseTools is a set of utilities to build EDK-based firmware. These ut=
ilities<br>
=C2=A0are used during the build process. Thus, they need to be built native=
ly.<br>
@@ -16,7 +16,7 @@ Upstream-Status: Inappropriate [oe-core cross compile spe=
cific]<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh<br>
-index 279f0d099a..285f061bf4 100755<br>
+index 30f4830173..ce4ffb20ab 100755<br>
=C2=A0--- a/OvmfPkg/build.sh<br>
=C2=A0+++ b/OvmfPkg/build.sh<br>
=C2=A0@@ -24,7 +24,7 @@ then<br>
@@ -28,3 +28,6 @@ index 279f0d099a..285f061bf4 100755<br>
=C2=A0 =C2=A0 echo $EDK_TOOLS_PATH<br>
=C2=A0 =C2=A0 source edksetup.sh BaseTools<br>
=C2=A0 else<br>
+-- <br>
+2.47.3<br>
+<br>
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-=
build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-m=
akefile-adjust-to-build-in-under-bitbake.patch<br>
index 4a55528571..27c4324b67 100644<br>
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch<br>
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch<br>
@@ -1,7 +1,7 @@<br>
-From 9dbd082516fdd7100f99f0f389b8eef5ececab19 Mon Sep 17 00:00:00 2001<br>
+From 8b4941871ccc88ed8b31eb7ffc097e1fe39fe57d Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Ricardo Neri &lt;<a href=3D"mailto:ricardo.neri-calderon@linux.=
intel.com" target=3D"_blank">ricardo.neri-calderon@linux.intel.com</a>&gt;<=
br>
=C2=A0Date: Fri, 26 Jul 2019 17:34:26 -0400<br>
-Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake<br>
+Subject: [PATCH 2/5] BaseTools: makefile: adjust to build in under bitbake=
<br>
<br>
=C2=A0Prepend the build flags with those of bitbake. This is to build<br>
=C2=A0using the bitbake native sysroot include and library directories.<br>
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [needs to be converted t=
o in-recipe fixups]<br>
=C2=A0 1 file changed, 7 insertions(+), 8 deletions(-)<br>
<br>
=C2=A0diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools=
/Source/C/Makefiles/header.makefile<br>
-index 55a7307a5e..e36e6a8f04 100644<br>
+index 53e73abe53..0b3f9bbb2a 100644<br>
=C2=A0--- a/BaseTools/Source/C/Makefiles/header.makefile<br>
=C2=A0+++ b/BaseTools/Source/C/Makefiles/header.makefile<br>
-@@ -154,35 +154,34 @@ endif<br>
+@@ -151,35 +151,34 @@ endif<br>
<br>
=C2=A0 INCLUDE =3D $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Co=
mmon -I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(M=
AKEROOT)/Common/ -I .. -I . $(ARCH_INCLUDE)<br>
=C2=A0 INCLUDE +=3D -I $(EDK2_PATH)/MdePkg/Include<br>
@@ -64,3 +64,6 @@ index 55a7307a5e..e36e6a8f04 100644<br>
=C2=A0 ifeq ($(HOST_ARCH), IA32)<br>
=C2=A0 #<br>
=C2=A0 # Snow Leopard=C2=A0 is a 32-bit and 64-bit environment. uname -m re=
turns i386, but gcc defaults<br>
+-- <br>
+2.47.3<br>
+<br>
diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch b/meta=
/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch<br>
index 1e79c23ae9..18ea24802a 100644<br>
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch<br>
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch<br>
@@ -1,7 +1,7 @@<br>
-From eb6db21ed0a845dce149d17acf8673d5188adea4 Mon Sep 17 00:00:00 2001<br>
+From 640b1e443a1b400d32d9af0c478abbbaebd491f1 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 14 Jun 2021 19:56:28 +0200<br>
-Subject: [PATCH] debug prefix map<br>
+Subject: [PATCH 3/5] debug prefix map<br>
<br>
=C2=A0We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in<=
br>
=C2=A0 --debug-prefix-map to nasm (we carry a patch to nasm for this). The<=
br>
@@ -22,30 +22,30 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br=
>
=C2=A0 1 file changed, 9 insertions(+), 9 deletions(-)<br>
<br>
=C2=A0diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools=
_def.template<br>
-index 0caa1c9001..dd86b3249d 100755<br>
+index 90a389bdff..1e134b299a 100755<br>
=C2=A0--- a/BaseTools/Conf/tools_def.template<br>
=C2=A0+++ b/BaseTools/Conf/tools_def.template<br>
-@@ -920,7 +920,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG=C2=A0 =C2=A0 =C2=A0=3D =
--add-gnu-debuglink=3D&quot;$(DEBUG_DIR)/$(MODULE_<br>
+@@ -833,7 +833,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG=C2=A0 =C2=A0 =C2=A0=3D =
--add-gnu-debuglink=3D&quot;$(DEBUG_DIR)/$(MODULE_<br>
=C2=A0 *_*_*_DTC_PATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(DTC_BIN)<br>
<br>
=C2=A0 # All supported GCC archs except LOONGARCH64 support -mstack-protect=
or-guard=3Dglobal, so set that on everything except LOONGARCH64<br>
=C2=A0-DEFINE GCC_ALL_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 -g -Os -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-=
array-bounds -include AutoGen.h -fno-common -fstack-protector<br>
=C2=A0+DEFINE GCC_ALL_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 -g -Os -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-=
array-bounds -include AutoGen.h -fno-common -fstack-protector ENV(GCC_PREFI=
X_MAP)<br>
=C2=A0 DEFINE GCC_IA32_X64_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D -mstack-p=
rotector-guard=3Dglobal<br>
- DEFINE GCC_ARM_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D DEF(=
GCC_ALL_CC_FLAGS) -mlittle-endian -mabi=3Daapcs -fno-short-enums -funsigned=
-char -ffunction-sections -fdata-sections -fomit-frame-pointer -Wno-address=
 -mthumb -fno-pic -fno-pie -mstack-protector-guard=3Dglobal<br>
=C2=A0 DEFINE GCC_LOONGARCH64_CC_FLAGS=C2=A0 =C2=A0 =3D DEF(GCC_ALL_CC_FLAG=
S) -mabi=3Dlp64d -fno-asynchronous-unwind-tables -Wno-address -fno-short-en=
ums -fsigned-char -ffunction-sections -fdata-sections<br>
-@@ -938,8 +938,8 @@ DEFINE GCC_ARM_AARCH64_ASLDLINK_FLAGS =3D -Wl,--defsym=
=3DPECOFF_HEADER_SIZE=3D0 DEF(GC<br>
- DEFINE GCC_ARM_ASLDLINK_FLAGS=C2=A0 =C2=A0 =C2=A0 =3D DEF(GCC_ARM_DLINK_F=
LAGS) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AA=
RCH64_ASLDLINK_FLAGS)<br>
- DEFINE GCC_AARCH64_ASLDLINK_FLAGS=C2=A0 =3D DEF(GCC_AARCH64_DLINK_FLAGS) =
-Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_=
ASLDLINK_FLAGS)<br>
+ DEFINE GCC_AARCH64_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D DEF(GCC_ALL_CC=
_FLAGS) -mlittle-endian -fno-short-enums -fverbose-asm -funsigned-char=C2=
=A0 -ffunction-sections -fdata-sections -Wno-address -fno-asynchronous-unwi=
nd-tables -fno-unwind-tables -fno-pic -fno-pie -ffixed-x18 -mstack-protecto=
r-guard=3Dglobal<br>
+@@ -845,8 +845,8 @@ DEFINE GCC_AARCH64_DLINK_FLAGS=C2=A0 =C2=A0 =C2=A0=3D =
-Wl,--emit-relocs -nostdlib -Wl,--gc-sectio<br>
+ DEFINE GCC_LOONGARCH64_DLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_COMMON) =
-z common-page-size=3D0x20<br>
+ DEFINE GCC_AARCH64_ASLDLINK_FLAGS=C2=A0 =3D DEF(GCC_AARCH64_DLINK_FLAGS) =
-Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) -Wl,--defsym=3DPECOF=
F_HEADER_SIZE=3D0 DEF(GCC_DLINK2_FLAGS_COMMON) -z common-page-size=3D0x20<b=
r>
=C2=A0 DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_=
FLAGS) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)<br>
--DEFINE GCC_ASM_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D -c -x assembler -imacros AutoGen.h<br>
+-DEFINE GCC_ASM_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D -c -x assembler<br>
=C2=A0-DEFINE GCC_PP_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D -E -x assembler-with-cpp -include AutoGen.h<br>
-+DEFINE GCC_ASM_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D -c -x assembler -imacros AutoGen.h ENV(GCC_PREFIX_MAP)<br>
++DEFINE GCC_ASM_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D -c -x assembler ENV(GCC_PREFIX_MAP)<br>
=C2=A0+DEFINE GCC_PP_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D -E -x assembler-with-cpp -include AutoGen.h ENV(GCC_PREFIX_MAP)<=
br>
=C2=A0 DEFINE GCC_VFRPP_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D -x c -E -DVFRCOMPILE --include $(MODULE_NAME)StrDefs.h<br>
=C2=A0 DEFINE GCC_ASLPP_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D -x c -E -include AutoGen.h<br>
- DEFINE GCC_ASLCC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 -x c<br>
-@@ -1092,7 +1092,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0=3D -mabi=3Dlp64d -march=3Dloongarch64 DEF(<br>
+ DEFINE GCC_ASLCC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 -x c -include AutoGen.h -fshort-wchar<br>
+@@ -980,7 +980,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D -mabi=3Dlp64d -march=3Dloongarch64 DEF(<br>
=C2=A0 *_GCC48_IA32_DLINK2_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(G=
CC48_IA32_DLINK2_FLAGS)<br>
=C2=A0 *_GCC48_IA32_RC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D DEF(GCC_IA32_RC_FLAGS)<br>
=C2=A0 *_GCC48_IA32_OBJCOPY_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
@@ -54,7 +54,7 @@ index 0caa1c9001..dd86b3249d 100755<br>
<br>
=C2=A0 =C2=A0 DEBUG_GCC48_IA32_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(G=
CC48_IA32_CC_FLAGS)<br>
=C2=A0 RELEASE_GCC48_IA32_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GCC48_=
IA32_CC_FLAGS) -Wno-unused-but-set-variable<br>
-@@ -1120,7 +1120,7 @@ RELEASE_GCC48_IA32_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D DEF(GCC48_IA32_CC_FLAGS) -Wno-unused-but-set<br>
+@@ -1008,7 +1008,7 @@ RELEASE_GCC48_IA32_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D DEF(GCC48_IA32_CC_FLAGS) -Wno-unused-but-set<br>
=C2=A0 *_GCC48_X64_DLINK2_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GC=
C48_X64_DLINK2_FLAGS)<br>
=C2=A0 *_GCC48_X64_RC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D DEF(GCC_X64_RC_FLAGS)<br>
=C2=A0 *_GCC48_X64_OBJCOPY_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
@@ -63,7 +63,7 @@ index 0caa1c9001..dd86b3249d 100755<br>
<br>
=C2=A0 =C2=A0 DEBUG_GCC48_X64_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GC=
C48_X64_CC_FLAGS)<br>
=C2=A0 RELEASE_GCC48_X64_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GCC48_X=
64_CC_FLAGS) -Wno-unused-but-set-variable<br>
-@@ -1229,7 +1229,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS=C2=A0 =C2=A0=3D DEF(G=
CC48_AARCH64_CC_FLAGS) -Wno-unused-but-s<br>
+@@ -1087,7 +1087,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS=C2=A0 =C2=A0=3D DEF(G=
CC48_AARCH64_CC_FLAGS) -Wno-unused-but-s<br>
=C2=A0 *_GCC49_IA32_DLINK2_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(G=
CC49_IA32_DLINK2_FLAGS)<br>
=C2=A0 *_GCC49_IA32_RC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D DEF(GCC_IA32_RC_FLAGS)<br>
=C2=A0 *_GCC49_IA32_OBJCOPY_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
@@ -72,7 +72,7 @@ index 0caa1c9001..dd86b3249d 100755<br>
<br>
=C2=A0 =C2=A0 DEBUG_GCC49_IA32_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(G=
CC49_IA32_CC_FLAGS)<br>
=C2=A0 RELEASE_GCC49_IA32_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GCC49_=
IA32_CC_FLAGS) -Wno-unused-but-set-variable -Wno-unused-const-variable<br>
-@@ -1257,7 +1257,7 @@ RELEASE_GCC49_IA32_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D DEF(GCC49_IA32_CC_FLAGS) -Wno-unused-but-set<br>
+@@ -1115,7 +1115,7 @@ RELEASE_GCC49_IA32_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D DEF(GCC49_IA32_CC_FLAGS) -Wno-unused-but-set<br>
=C2=A0 *_GCC49_X64_DLINK2_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GC=
C49_X64_DLINK2_FLAGS)<br>
=C2=A0 *_GCC49_X64_RC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D DEF(GCC_X64_RC_FLAGS)<br>
=C2=A0 *_GCC49_X64_OBJCOPY_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
@@ -81,7 +81,7 @@ index 0caa1c9001..dd86b3249d 100755<br>
<br>
=C2=A0 =C2=A0 DEBUG_GCC49_X64_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GC=
C49_X64_CC_FLAGS)<br>
=C2=A0 RELEASE_GCC49_X64_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GCC49_X=
64_CC_FLAGS) -Wno-unused-but-set-variable -Wno-unused-const-variable<br>
-@@ -1516,7 +1516,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20<br>
+@@ -1314,7 +1314,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20<br>
=C2=A0 *_GCC5_IA32_DLINK2_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GC=
C5_IA32_DLINK2_FLAGS) -no-pie<br>
=C2=A0 *_GCC5_IA32_RC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D DEF(GCC_IA32_RC_FLAGS)<br>
=C2=A0 *_GCC5_IA32_OBJCOPY_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
@@ -90,7 +90,7 @@ index 0caa1c9001..dd86b3249d 100755<br>
<br>
=C2=A0 =C2=A0 DEBUG_GCC5_IA32_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GC=
C5_IA32_CC_FLAGS) -flto<br>
=C2=A0 =C2=A0 DEBUG_GCC5_IA32_DLINK_FLAGS=C2=A0 =C2=A0 =3D DEF(GCC5_IA32_X6=
4_DLINK_FLAGS) -flto -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386<br>
-@@ -1548,7 +1548,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS=C2=A0 =C2=A0 =3D DEF(G=
CC5_IA32_X64_DLINK_FLAGS) -flto -Os -Wl,<br>
+@@ -1346,7 +1346,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS=C2=A0 =C2=A0 =3D DEF(G=
CC5_IA32_X64_DLINK_FLAGS) -flto -Os -Wl,<br>
=C2=A0 *_GCC5_X64_DLINK2_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D DEF(GC=
C5_X64_DLINK2_FLAGS)<br>
=C2=A0 *_GCC5_X64_RC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D DEF(GCC_X64_RC_FLAGS)<br>
=C2=A0 *_GCC5_X64_OBJCOPY_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
@@ -99,3 +99,6 @@ index 0caa1c9001..dd86b3249d 100755<br>
<br>
=C2=A0 =C2=A0 DEBUG_GCC5_X64_CC_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D DEF(GC=
C5_X64_CC_FLAGS) -flto -DUSING_LTO<br>
=C2=A0 =C2=A0 DEBUG_GCC5_X64_DLINK_FLAGS=C2=A0 =C2=A0 =C2=A0=3D DEF(GCC5_X6=
4_DLINK_FLAGS) -flto -Os<br>
+-- <br>
+2.47.3<br>
+<br>
diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch b/meta/rec=
ipes-core/ovmf/ovmf/0004-reproducible.patch<br>
index 73f242321e..b42ecde211 100644<br>
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch<br>
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch<br>
@@ -1,7 +1,7 @@<br>
-From 0d22e07cd9cc35ede04c01d3141068db744d7677 Mon Sep 17 00:00:00 2001<br>
+From 8b218dffa0368fbc2bfb5d8051b358476266fcb4 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 14 Jun 2021 19:57:30 +0200<br>
-Subject: [PATCH] reproducible<br>
+Subject: [PATCH 4/5] reproducible<br>
<br>
=C2=A0This patch fixes various things which make the build more reproducibl=
e. Some changes<br>
=C2=A0here only change intermediate artefacts but that means when you have =
two build trees<br>
@@ -35,7 +35,7 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0 4 files changed, 24 insertions(+), 16 deletions(-)<br>
<br>
=C2=A0diff --git a/BaseTools/Source/C/GenFw/Elf64Convert.c b/BaseTools/Sour=
ce/C/GenFw/Elf64Convert.c<br>
-index 18594122ea..92b5f13cf6 100644<br>
+index 83f1b285c2..e2f582f8fb 100644<br>
=C2=A0--- a/BaseTools/Source/C/GenFw/Elf64Convert.c<br>
=C2=A0+++ b/BaseTools/Source/C/GenFw/Elf64Convert.c<br>
=C2=A0@@ -15,6 +15,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent<br>
@@ -47,7 +47,7 @@ index 18594122ea..92b5f13cf6 100644<br>
=C2=A0 #endif<br>
=C2=A0 #include &lt;assert.h&gt;<br>
=C2=A0 #include &lt;stdio.h&gt;<br>
-@@ -990,7 +992,7 @@ ScanSections64 (<br>
+@@ -995,7 +997,7 @@ ScanSections64 (<br>
=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 mCoffOffset =3D mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTO=
RY_ENTRY) +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(EFI_I=
MAGE_DEBUG_CODEVIEW_NB10_ENTRY) +<br>
@@ -56,7 +56,7 @@ index 18594122ea..92b5f13cf6 100644<br>
<br>
=C2=A0 =C2=A0 //<br>
=C2=A0 =C2=A0 // Add more space in the .debug data region for the DllCharac=
teristicsEx<br>
-@@ -2322,7 +2324,7 @@ WriteDebug64 (<br>
+@@ -2329,7 +2331,7 @@ WriteDebug64 (<br>
=C2=A0 =C2=A0 EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*Nb10;<br>
=C2=A0 =C2=A0 EFI_IMAGE_DEBUG_EX_DLLCHARACTERISTICS_ENTRY *DllEntry;<br>
<br>
@@ -65,7 +65,7 @@ index 18594122ea..92b5f13cf6 100644<br>
<br>
=C2=A0 =C2=A0 NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNt=
HdrOffset);<br>
=C2=A0 =C2=A0 DataDir =3D &amp;NtHdr-&gt;Pe32Plus.OptionalHeader.DataDirect=
ory[EFI_IMAGE_DIRECTORY_ENTRY_DEBUG];<br>
-@@ -2355,7 +2357,7 @@ WriteDebug64 (<br>
+@@ -2362,7 +2364,7 @@ WriteDebug64 (<br>
<br>
=C2=A0 =C2=A0 Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);<br>
=C2=A0 =C2=A0 Nb10-&gt;Signature =3D CODEVIEW_SIGNATURE_NB10;<br>
@@ -153,7 +153,7 @@ index e5f282c4ac..27a34ef7c6 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if T.GenFile=
ListMacro and T.FileListMacro not in self.FileListMacros:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self.FileListMacros[T.FileListMacro] =3D []<br>
=C2=A0diff --git a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py b/BaseT=
ools/Source/Python/AutoGen/ModuleAutoGen.py<br>
-index aa0b71632e..57c9cad117 100755<br>
+index 764c51789b..40aadbcfbc 100755<br>
=C2=A0--- a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py<br>
=C2=A0+++ b/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py<br>
=C2=A0@@ -1429,6 +1429,9 @@ class ModuleAutoGen(AutoGen):<br>
@@ -175,3 +175,6 @@ index aa0b71632e..57c9cad117 100755<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore generating makefile when it is =
a binary module<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.IsBinaryModule:<br>
+-- <br>
+2.47.3<br>
+<br>
diff --git a/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandle=
rLib-fix-push-instructi.patch b/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg=
-CpuExceptionHandlerLib-fix-push-instructi.patch<br>
index 43c402b91a..650e084b5b 100644<br>
--- a/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fi=
x-push-instructi.patch<br>
+++ b/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fi=
x-push-instructi.patch<br>
@@ -1,7 +1,7 @@<br>
-From 7dcf5ed06b5a256436521f892d2579421c163902 Mon Sep 17 00:00:00 2001<br>
+From 7e6be0f4068a2158af3c97e873edb33fa4d5c6b8 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=
=3D"_blank">kraxel@redhat.com</a>&gt;<br>
=C2=A0Date: Mon, 3 Nov 2025 09:56:52 +0100<br>
-Subject: [PATCH] UefiCpuPkg/CpuExceptionHandlerLib: fix push instructions<=
br>
+Subject: [PATCH 5/5] UefiCpuPkg/CpuExceptionHandlerLib: fix push instructi=
ons<br>
<br>
=C2=A0Nasm 3.0 complains about &#39;dword&#39; being invalid.=C2=A0 The com=
ment talks about<br>
=C2=A0a &#39;8-byte value&#39; so &#39;qword&#39; should be correct here.<b=
r>
@@ -41,3 +41,6 @@ index 3d64ac9080..671ed98f85 100644<br>
=C2=A0 VectorNum:<br>
=C2=A0 =C2=A0 =C2=A0 push=C2=A0 =C2=A0 rax<br>
=C2=A0 %ifdef NO_ABSOLUTE_RELOCS_IN_TEXT<br>
+-- <br>
+2.47.3<br>
+<br>
diff --git a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">ovmf_git.bb</a> b/meta/recipes-core/ovmf/<a hr=
ef=3D"http://ovmf_git.bb" rel=3D"noreferrer" target=3D"_blank">ovmf_git.bb<=
/a><br>
index 6b42041ac7..ec6c3b516c 100644<br>
--- a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferr=
er" target=3D"_blank">ovmf_git.bb</a><br>
+++ b/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferr=
er" target=3D"_blank">ovmf_git.bb</a><br>
@@ -28,8 +28,8 @@ SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/ti=
anocore/edk2.git;branch=3Dmaster;protocol=3Dhttps;ta" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/tianocore/edk2.git;branch=3Dmaster;protocol=3Dht=
tps;ta</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-UefiCpuPkg-CpuExcepti=
onHandlerLib-fix-push-instructi.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-PV =3D &quot;edk2-stable202508&quot;<br>
-SRCREV =3D &quot;d46aa46c8361194521391aa581593e556c707c6e&quot;<br>
+PV =3D &quot;edk2-stable202511&quot;<br>
+SRCREV =3D &quot;46548b1adac82211d8d11da12dd914f41e7aa775&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;edk2-stable.*)&qu=
ot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;edk2&quot;<br>
@@ -58,7 +58,7 @@ EDK_TOOLS_DIR =3D &quot;edk2_basetools&quot;<br>
=C2=A0BUILD_OPTIMIZATION =3D &quot;&quot;<br>
<br>
=C2=A0# OVMF supports IA only, although it could conceivably support ARM so=
meday.<br>
-COMPATIBLE_HOST:class-target =3D &#39;(i.86|x86_64).*&#39;<br>
+COMPATIBLE_HOST:class-target =3D &#39;(x86_64).*&#39;<br>
<br>
=C2=A0# Additional build flags for OVMF with Secure Boot.<br>
=C2=A0# Fedora also uses &quot;-D SMM_REQUIRE -D EXCLUDE_SHELL_FROM_FD&quot=
;.<br>
@@ -178,9 +178,6 @@ do_compile:class-target() {<br>
=C2=A0 =C2=A0 =C2=A0export LFLAGS=3D&quot;${LDFLAGS}&quot;<br>
=C2=A0 =C2=A0 =C2=A0PARALLEL_JOBS=3D&quot;${@oe.utils.parallel_make_argumen=
t(d, &#39;-n %d&#39;)}&quot;<br>
=C2=A0 =C2=A0 =C2=A0OVMF_ARCH=3D&quot;X64&quot;<br>
-=C2=A0 =C2=A0 if [ &quot;${TARGET_ARCH}&quot; !=3D &quot;x86_64&quot; ] ; =
then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 OVMF_ARCH=3D&quot;IA32&quot;<br>
-=C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0# The build for the target uses BaseTools/Conf/tools_de=
f.template<br>
=C2=A0 =C2=A0 =C2=A0# from ovmf-native to find the compiler, which depends =
on<br>
@@ -197,9 +194,6 @@ do_compile:class-target() {<br>
=C2=A0 =C2=A0 =C2=A0rm -rf ${WORKDIR}/ovmf<br>
=C2=A0 =C2=A0 =C2=A0mkdir ${WORKDIR}/ovmf<br>
=C2=A0 =C2=A0 =C2=A0OVMF_DIR_SUFFIX=3D&quot;X64&quot;<br>
-=C2=A0 =C2=A0 if [ &quot;${TARGET_ARCH}&quot; !=3D &quot;x86_64&quot; ] ; =
then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 OVMF_DIR_SUFFIX=3D&quot;Ia32&quot; # Note the =
different capitalization<br>
-=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0FIXED_GCCVER=3D$(fixup_target_tools ${GCC_VER})<br>
=C2=A0 =C2=A0 =C2=A0bbnote FIXED_GCCVER is ${FIXED_GCCVER}<br>
=C2=A0 =C2=A0 =C2=A0build_dir=3D&quot;${S}/Build/Ovmf$OVMF_DIR_SUFFIX/${OVM=
F_BUILD_TYPE}_${FIXED_GCCVER}&quot;<br>
@@ -231,10 +225,10 @@ do_install:class-native() {<br>
<br>
=C2=A0do_install:class-target() {<br>
=C2=A0 =C2=A0 =C2=A0# Content for UEFI shell iso. We install the EFI shell =
as<br>
-=C2=A0 =C2=A0 # bootx64/ia32.efi because then it can be started even when =
the<br>
+=C2=A0 =C2=A0 # bootx64.efi because then it can be started even when the<b=
r>
=C2=A0 =C2=A0 =C2=A0# firmware itself does not contain it.<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}/efi/boot<br>
-=C2=A0 =C2=A0 install ${WORKDIR}/ovmf/Shell.efi ${D}/efi/boot/boot${@ &quo=
t;ia32&quot; if &quot;${TARGET_ARCH}&quot; !=3D &quot;x86_64&quot; else &qu=
ot;x64&quot;}.efi<br>
+=C2=A0 =C2=A0 install ${WORKDIR}/ovmf/Shell.efi ${D}/efi/boot/bootx64.efi<=
br>
=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;s=
ecureboot&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${WORKDIR}/ovmf/EnrollDefaultKeys=
.efi ${D}<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#228372): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/228372" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/228372</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116906945/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116906945/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b62f510646a69c95--

