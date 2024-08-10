Return-Path: <ypa.takayasu.ito@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4348C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 02:51:00 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web10.99296.1723258252339991347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 19:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UG9sjZTO;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: ypa.takayasu.ito@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-1fd66cddd4dso26157405ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 19:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723258251; x=1723863051; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=odXG5MEl9E3UWC6fxW1osm3C6f8HvTZRW3vzRxfpdiI=;
        b=UG9sjZTOvFhkoy8jGtJlrpzINffwtNi1Tvw4d3kPJ+blAjLA0dHHt04roSjKGW8Mtz
         hzPyo6iqgS62RRZKrQKAYnBB86Xpt8YKU2/j+1C1Qg5woUKUy1YI+8bC2ycgDlRGnzoR
         LRnm0KC/2WBU5TvS/RwVxZ2AaHNQYOQlfAM9k972Ea0CsqKB7vBXOPc/4DJhxwZEhVBs
         QLXR6MohYLo+582cp4X4WbqDaX+01UGwOVsG6BT+aRP9WrFjEwHqoAZBcK2EujC4lcJU
         gz/xguS/iHa2AoMYSeu6BS7oU3CuOqtQqyDUSSRiEwpbgjOpaWpWsLitPI5LdAd+R/tz
         XSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723258251; x=1723863051;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odXG5MEl9E3UWC6fxW1osm3C6f8HvTZRW3vzRxfpdiI=;
        b=L+330KJwnqtXCTDAaWXifJH3XDX8eRJzMc/GIcPATJCqCr/EJ9+79ZwvtbUPjYJMe1
         GIZR3uLDy/XYlCs3Lt15LLtH5gcT/CnDDzQjZeENJKvMNZ/A0d+iqbPEA0AbZTxz8AFA
         ZQFfO4CpI3va6aluLINnpJ0w6I7R4nVFU6Fgo9NAWW34tg0nSBfVMHjRGGdmM5Z2Lkmg
         iCmZP/2B04RJG/k5GzC1RfFVaPSj/MIM6xbHGoq2he4uD5x7dxEuVASmxJ45IfsjRlt1
         6D47UCYyOrz3pPVNBSb0WtI1A0zly6u2JUuLklpNXxTIgMu0eYsWjoCNJDj1AZ0VERkC
         XGrw==
X-Gm-Message-State: AOJu0YzCGqCgJ/TPPDw7xq+trrUCcBKJl2G8UKBm+k28sejhnVMBBMpI
	nqaTaKfmD1l9eLD0oBTVw7Io73L4sBbJFyTi/b/dsvdG5fW8UQ9gsQ0XWRL/
X-Google-Smtp-Source: AGHT+IGNULI8DiBLWOOcYf3BCq+Kh/Hy1hiqjFJNEoYLk4w3TctVnmRixSC69T4M+gfLON+Y9INF9Q==
X-Received: by 2002:a17:903:1c9:b0:1fd:5e91:2b13 with SMTP id d9443c01a7336-200ae4db5bdmr44850635ad.1.1723258250169;
        Fri, 09 Aug 2024 19:50:50 -0700 (PDT)
Received: from ?IPV6:2400:2412:6a60:8500:e8c8:7bb1:39b4:ea6e? ([2400:2412:6a60:8500:e8c8:7bb1:39b4:ea6e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb8fd737sm4070295ad.116.2024.08.09.19.50.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 19:50:49 -0700 (PDT)
Message-ID: <ffcd0df5-663c-41a7-a23c-c2c083aa0974@gmail.com>
Date: Sat, 10 Aug 2024 11:50:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.43 release
To: openembedded-core@lists.openembedded.org
References: <20240805044317.4104470-1-raj.khem@gmail.com>
From: Takayasu Ito <ypa.takayasu.ito@gmail.com>
Content-Language: en-US
In-Reply-To: <20240805044317.4104470-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Aug 2024 02:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203179

Hi Kem,

 > [1] https://sourceware.org/pipermail/binutils/2024-January/132213.html

The above changelog is for 2.42.
The one for 2.43 is as follows.
https://sourceware.org/pipermail/binutils/2024-August/136151.html


On 2024/08/05 13:43, Khem Raj via lists.openembedded.org wrote:
> Detailed changelog [1]
> 
> [1] https://sourceware.org/pipermail/binutils/2024-January/132213.html
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/conf/distro/include/tcmode-default.inc   |    2 +-
>   .../{binutils-2.42.inc => binutils-2.43.inc}  |    9 +-
>   ....42.bb => binutils-cross-canadian_2.43.bb} |    0
>   ...s-cross_2.42.bb => binutils-cross_2.43.bb} |    0
>   ...ssdk_2.42.bb => binutils-crosssdk_2.43.bb} |    0
>   ...ite_2.42.bb => binutils-testsuite_2.43.bb} |    0
>   ...s-crosssdk-Generate-relocatable-SDKs.patch |   12 +-
>   ...o-not-generate-linker-script-directo.patch |    6 +-
>   ...dk-Search-for-alternative-ld.so.conf.patch |   10 +-
>   ...004-Point-scripts-location-to-libdir.patch |    6 +-
>   ...stro-compiler-point-to-the-wrong-ins.patch |    4 +-
>   ...-system-directories-when-cross-linki.patch |   57 +-
>   ...ect-assembling-for-ppc-wait-mnemonic.patch |    2 +-
>   .../binutils/0008-Use-libtool-2.4.patch       | 1774 +++++++++--------
>   ...h-in-libtool-when-sysroot-is-enabled.patch |    2 +-
>   .../0010-sync-with-OE-libtool-changes.patch   |    2 +-
>   ...or-clang-before-checking-gcc-version.patch |    8 +-
>   ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |    4 +-
>   ...sing-_Alignof-when-using-C11-or-newe.patch |    2 +-
>   ...-pe-dll.o-entry-deom-targ_extra_ofil.patch |    2 +-
>   ...rofng-change-use-of-bignum-to-bigint.patch |   17 -
>   .../{binutils_2.42.bb => binutils_2.43.bb}    |    0
>   22 files changed, 961 insertions(+), 958 deletions(-)
>   rename meta/recipes-devtools/binutils/{binutils-2.42.inc => binutils-2.43.inc} (90%)
>   rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.42.bb => binutils-cross-canadian_2.43.bb} (100%)
>   rename meta/recipes-devtools/binutils/{binutils-cross_2.42.bb => binutils-cross_2.43.bb} (100%)
>   rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.42.bb => binutils-crosssdk_2.43.bb} (100%)
>   rename meta/recipes-devtools/binutils/{binutils-testsuite_2.42.bb => binutils-testsuite_2.43.bb} (100%)
>   delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-gprofng-change-use-of-bignum-to-bigint.patch
>   rename meta/recipes-devtools/binutils/{binutils_2.42.bb => binutils_2.43.bb} (100%)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index c6bc80c5421..a286d25a53a 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>   
>   GCCVERSION ?= "14.%"
>   SDKGCCVERSION ?= "${GCCVERSION}"
> -BINUVERSION ?= "2.42%"
> +BINUVERSION ?= "2.43%"
>   GDBVERSION ?= "15.%"
>   GLIBCVERSION ?= "2.40%"
>   LINUXLIBCVERSION ?= "6.10%"
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.43.inc
> similarity index 90%
> rename from meta/recipes-devtools/binutils/binutils-2.42.inc
> rename to meta/recipes-devtools/binutils/binutils-2.43.inc
> index bcc333506fe..c1689a82dc2 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.43.inc
> @@ -12,15 +12,15 @@ LIC_FILES_CHKSUM="\
>   
>   # When upgrading to 2.42, please make sure there is no trailing .0, so
>   # that upstream version check can work correctly.
> -PV = "2.42"
> -CVE_VERSION = "2.42"
> -SRCBRANCH ?= "binutils-2_42-branch"
> +PV = "2.43"
> +CVE_VERSION = "2.43"
> +SRCBRANCH ?= "binutils-2_43-branch"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>   
>   CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
>   
> -SRCREV ?= "e343b51459ca120ead1d1a0eda14dd7bd8849f4f"
> +SRCREV ?= "2fbb863136724cfef2fc2f4c2b7f51be36f132c7"
>   BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
>   SRC_URI = "\
>        ${BINUTILS_GIT_URI} \
> @@ -35,6 +35,5 @@ SRC_URI = "\
>        file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
>        file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
>        file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
> -     file://0015-gprofng-change-use-of-bignum-to-bigint.patch \
>   "
>   S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.42.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.43.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.42.bb
> rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.43.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.42.bb b/meta/recipes-devtools/binutils/binutils-cross_2.43.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross_2.42.bb
> rename to meta/recipes-devtools/binutils/binutils-cross_2.43.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.42.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.42.bb
> rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.43.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-testsuite_2.42.bb b/meta/recipes-devtools/binutils/binutils-testsuite_2.43.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-testsuite_2.42.bb
> rename to meta/recipes-devtools/binutils/binutils-testsuite_2.43.bb
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> index 4ef11c56e7c..3dd559e3961 100644
> --- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> @@ -1,4 +1,4 @@
> -From 089ee95b342e79af09258b45c888a13b35fadf26 Mon Sep 17 00:00:00 2001
> +From 56d41f0cc6a806d2e8d7dcbfb4cca4cd37fba835 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Mon, 2 Mar 2015 01:58:54 +0000
>   Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
> @@ -34,10 +34,10 @@ index b43ae841a6c..6101a95195b 100644
>      Output_section_data* odata = new Output_data_const(interp, len, 1);
>    
>   diff --git a/ld/genscripts.sh b/ld/genscripts.sh
> -index d6ceb3fe4f5..365c0e778cc 100755
> +index a726b158161..5d2eb737efc 100755
>   --- a/ld/genscripts.sh
>   +++ b/ld/genscripts.sh
> -@@ -298,6 +298,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
> +@@ -315,6 +315,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
>    LD_FLAG=r
>    DATA_ALIGNMENT=${DATA_ALIGNMENT_r}
>    DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
> @@ -45,7 +45,7 @@ index d6ceb3fe4f5..365c0e778cc 100755
>    ( echo "/* Script for -r */"
>      source_sh ${CUSTOMIZER_SCRIPT}
>      source_sh ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
> -@@ -306,10 +307,12 @@ DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
> +@@ -323,10 +324,12 @@ DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
>    LD_FLAG=u
>    DATA_ALIGNMENT=${DATA_ALIGNMENT_u}
>    CONSTRUCTING=" "
> @@ -59,10 +59,10 @@ index d6ceb3fe4f5..365c0e778cc 100755
>    DATA_ALIGNMENT=${DATA_ALIGNMENT_}
>    RELOCATING=" "
>   diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
> -index fae7c2ad71c..7fe37eb1874 100644
> +index 54716110b61..da17fe5cbce 100644
>   --- a/ld/scripttempl/elf.sc
>   +++ b/ld/scripttempl/elf.sc
> -@@ -150,8 +150,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
> +@@ -152,8 +152,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
>        DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
>      fi
>    fi
> diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
> index 1652473bcb2..3ad1da38e6b 100644
> --- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
> @@ -1,4 +1,4 @@
> -From 6fae7afeb713a60755e17443964e46190bb97ede Mon Sep 17 00:00:00 2001
> +From 4f2a54c468c448efdd44813273893ec9c541deaf Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Mon, 6 Mar 2017 23:37:05 -0800
>   Subject: [PATCH] binutils-cross: Do not generate linker script directories
> @@ -22,10 +22,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 25 deletions(-)
>   
>   diff --git a/ld/genscripts.sh b/ld/genscripts.sh
> -index 365c0e778cc..b0893fda3c5 100755
> +index 5d2eb737efc..ad225b0071d 100755
>   --- a/ld/genscripts.sh
>   +++ b/ld/genscripts.sh
> -@@ -229,31 +229,6 @@ append_to_lib_path()
> +@@ -244,31 +244,6 @@ append_to_lib_path()
>      fi
>    }
>    
> diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
> index f45690ed68d..ec8e40c132e 100644
> --- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
> @@ -1,4 +1,4 @@
> -From 1fe9aa3f25e09281cb018b29081db4cc44bdc01f Mon Sep 17 00:00:00 2001
> +From bbb86582536ba9e4ab0fb4656d4697542172ab78 Mon Sep 17 00:00:00 2001
>   From: Richard Purdie <richard.purdie@linuxfoundation.org>
>   Date: Wed, 19 Feb 2020 09:51:16 -0800
>   Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf in SDK
> @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    5 files changed, 7 insertions(+), 3 deletions(-)
>   
>   diff --git a/ld/Makefile.am b/ld/Makefile.am
> -index f9ee05b1400..07801c2c3ac 100644
> +index 6a9833e5775..b2776d2a1f3 100644
>   --- a/ld/Makefile.am
>   +++ b/ld/Makefile.am
>   @@ -42,7 +42,8 @@ ZLIBINC = @zlibinc@
> @@ -43,7 +43,7 @@ index f9ee05b1400..07801c2c3ac 100644
>    NO_WERROR = @NO_WERROR@
>    AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
>   diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index abb0565718f..6329a12a0d6 100644
> +index 8639e782cdf..19c19088724 100644
>   --- a/ld/Makefile.in
>   +++ b/ld/Makefile.in
>   @@ -576,7 +576,8 @@ ZLIB = @zlibdir@ -lz
> @@ -57,7 +57,7 @@ index abb0565718f..6329a12a0d6 100644
>    AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
>    
>   diff --git a/ld/ldelf.c b/ld/ldelf.c
> -index 2852851dcd5..187b359af86 100644
> +index 09691609fc0..e49c0217ae2 100644
>   --- a/ld/ldelf.c
>   +++ b/ld/ldelf.c
>   @@ -939,7 +939,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed_list *l, int force,
> @@ -70,7 +70,7 @@ index 2852851dcd5..187b359af86 100644
>          if (!ldelf_parse_ld_so_conf (&info, tmppath))
>    	{
>   diff --git a/ld/ldmain.c b/ld/ldmain.c
> -index e90c2021b33..01b306e58a1 100644
> +index 037099b9d37..2f500d73c58 100644
>   --- a/ld/ldmain.c
>   +++ b/ld/ldmain.c
>   @@ -69,6 +69,7 @@ char *program_name;
> diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
> index ab12c145ea9..572c2e840ba 100644
> --- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
> @@ -1,4 +1,4 @@
> -From 780109902b00652dfdc080607c614f210e96ae9b Mon Sep 17 00:00:00 2001
> +From aa371816a7ad55af4b29ffc32b213a812f4c6216 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Mon, 2 Mar 2015 01:09:58 +0000
>   Subject: [PATCH] Point scripts location to libdir
> @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    2 files changed, 2 insertions(+), 2 deletions(-)
>   
>   diff --git a/ld/Makefile.am b/ld/Makefile.am
> -index 07801c2c3ac..a2bcffecf73 100644
> +index b2776d2a1f3..76ebecb5685 100644
>   --- a/ld/Makefile.am
>   +++ b/ld/Makefile.am
>   @@ -51,7 +51,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
> @@ -25,7 +25,7 @@ index 07801c2c3ac..a2bcffecf73 100644
>    EMUL = @EMUL@
>    EMULATION_OFILES = @EMULATION_OFILES@
>   diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index 6329a12a0d6..15311048855 100644
> +index 19c19088724..4be38a75feb 100644
>   --- a/ld/Makefile.in
>   +++ b/ld/Makefile.in
>   @@ -584,7 +584,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
> diff --git a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> index f7c3987542f..2b1d57a05ed 100644
> --- a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> @@ -1,4 +1,4 @@
> -From c8cca8d2364c9f233d6e771136a4d4ff7f405c21 Mon Sep 17 00:00:00 2001
> +From cf20233a1d53effa223a8b72ae9c0652a472a87a Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Mon, 2 Mar 2015 01:39:01 +0000
>   Subject: [PATCH] don't let the distro compiler point to the wrong installation
> @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 2 insertions(+), 1 deletion(-)
>   
>   diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
> -index 85c4b6b6ef8..cb6e91c8f9b 100644
> +index b77a41c781c..9fb4d6f09c9 100644
>   --- a/libiberty/Makefile.in
>   +++ b/libiberty/Makefile.in
>   @@ -385,7 +385,8 @@ install-strip: install
> diff --git a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
> index bf6a1a39611..b267e516b37 100644
> --- a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
> @@ -1,4 +1,4 @@
> -From a92c46e3703d038d7d810bdc91e8540ad9d9150a Mon Sep 17 00:00:00 2001
> +From 26f6a7a397e62b5e974cf88f6d4d8ba9a3d51e3c Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 15 Jan 2016 06:31:09 +0000
>   Subject: [PATCH] warn for uses of system directories when cross linking
> @@ -56,17 +56,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    ld/configure.ac | 10 ++++++++++
>    ld/ld.h         |  8 ++++++++
>    ld/ld.texi      | 12 ++++++++++++
> - ld/ldfile.c     | 17 +++++++++++++++++
> + ld/ldfile.c     | 16 ++++++++++++++++
>    ld/ldlex.h      |  2 ++
>    ld/ldmain.c     |  6 ++++--
>    ld/lexsup.c     | 15 +++++++++++++++
> - 9 files changed, 87 insertions(+), 2 deletions(-)
> + 9 files changed, 86 insertions(+), 2 deletions(-)
>   
>   diff --git a/ld/config.in b/ld/config.in
> -index 52d62f06ff0..b5944e7ba55 100644
> +index f7c9da3d02a..e4fdbf6db5b 100644
>   --- a/ld/config.in
>   +++ b/ld/config.in
> -@@ -70,6 +70,9 @@
> +@@ -74,6 +74,9 @@
>       language is requested. */
>    #undef ENABLE_NLS
>    
> @@ -77,7 +77,7 @@ index 52d62f06ff0..b5944e7ba55 100644
>    #undef EXTRA_SHLIB_EXTENSION
>    
>   diff --git a/ld/configure b/ld/configure
> -index 6f8a05c3b6c..98a76d6da7f 100755
> +index 1d89e3b0677..dd770216b61 100755
>   --- a/ld/configure
>   +++ b/ld/configure
>   @@ -844,6 +844,7 @@ with_lib_path
> @@ -88,7 +88,7 @@ index 6f8a05c3b6c..98a76d6da7f 100755
>    enable_gold
>    enable_got
>    enable_compressed_debug_sections
> -@@ -1534,6 +1535,8 @@ Optional Features:
> +@@ -1535,6 +1536,8 @@ Optional Features:
>      --enable-checking       enable run-time checks
>      --enable-targets        alternative target configurations
>      --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
> @@ -118,10 +118,10 @@ index 6f8a05c3b6c..98a76d6da7f 100755
>    if test "${enable_gold+set}" = set; then :
>      enableval=$enable_gold; case "${enableval}" in
>   diff --git a/ld/configure.ac b/ld/configure.ac
> -index 4a11787ae71..104a531fb0f 100644
> +index bdf51a062fa..3d370ff92ce 100644
>   --- a/ld/configure.ac
>   +++ b/ld/configure.ac
> -@@ -103,6 +103,16 @@ AC_SUBST(use_sysroot)
> +@@ -102,6 +102,16 @@ AC_SUBST(use_sysroot)
>    AC_SUBST(TARGET_SYSTEM_ROOT)
>    AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
>    
> @@ -139,7 +139,7 @@ index 4a11787ae71..104a531fb0f 100644
>    dnl "install_as_default" is set to false if gold is the default linker.
>    dnl "installed_linker" is the installed BFD linker name.
>   diff --git a/ld/ld.h b/ld/ld.h
> -index 54d9079678c..9f0163b2911 100644
> +index 0dee944cf2a..83bd82d2a2e 100644
>   --- a/ld/ld.h
>   +++ b/ld/ld.h
>   @@ -166,6 +166,14 @@ typedef struct
> @@ -158,10 +158,10 @@ index 54d9079678c..9f0163b2911 100644
>      enum endian_enum endian;
>    
>   diff --git a/ld/ld.texi b/ld/ld.texi
> -index 4fda259a552..22685f5f1dd 100644
> +index 89e3913317a..178908edf32 100644
>   --- a/ld/ld.texi
>   +++ b/ld/ld.texi
> -@@ -3119,6 +3119,18 @@ creation of the metadata note, if one had been enabled by an earlier
> +@@ -3245,6 +3245,18 @@ creation of the metadata note, if one had been enabled by an earlier
>    occurrence of the --package-metadata option.
>    If the linker has been built with libjansson, then the JSON string
>    will be validated.
> @@ -181,14 +181,13 @@ index 4fda259a552..22685f5f1dd 100644
>    
>    @c man end
>   diff --git a/ld/ldfile.c b/ld/ldfile.c
> -index dc9875d8813..49d899ee49d 100644
> +index 87be885d31a..86c8a5b267d 100644
>   --- a/ld/ldfile.c
>   +++ b/ld/ldfile.c
> -@@ -327,6 +327,23 @@ ldfile_add_library_path (const char *name, bool cmdline)
> -     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
> -   else
> -     new_dirs->name = xstrdup (name);
> -+
> +@@ -344,6 +344,22 @@ ldfile_add_library_path (const char *name, enum search_dir_source source)
> +       search_tail_ptr = &new_dirs->next;
> +     }
> +
>   +#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
>   +  if (command_line.poison_system_directories
>   +  && ((!strncmp (name, "/lib", 4))
> @@ -205,16 +204,16 @@ index dc9875d8813..49d899ee49d 100644
>   +   }
>   +#endif
>   +
> +   return new_dirs;
>    }
>    
> - /* Try to open a BFD for a lang_input_statement.  */
>   diff --git a/ld/ldlex.h b/ld/ldlex.h
> -index 161a9d4d8dc..757fe2f7650 100644
> +index defe3fcbbb9..aea75a25dc8 100644
>   --- a/ld/ldlex.h
>   +++ b/ld/ldlex.h
> -@@ -147,6 +147,8 @@ enum option_values
> -   OPTION_PLUGIN,
> +@@ -149,6 +149,8 @@ enum option_values
>      OPTION_PLUGIN_OPT,
> +   OPTION_PLUGIN_SAVE_TEMPS,
>    #endif /* BFD_SUPPORTS_PLUGINS */
>   +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
>   +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
> @@ -222,10 +221,10 @@ index 161a9d4d8dc..757fe2f7650 100644
>      OPTION_PRINT_OUTPUT_FORMAT,
>      OPTION_PRINT_SYSROOT,
>   diff --git a/ld/ldmain.c b/ld/ldmain.c
> -index 01b306e58a1..eddefc24332 100644
> +index 2f500d73c58..8b1bf7ad6aa 100644
>   --- a/ld/ldmain.c
>   +++ b/ld/ldmain.c
> -@@ -326,6 +326,8 @@ main (int argc, char **argv)
> +@@ -348,6 +348,8 @@ main (int argc, char **argv)
>      command_line.warn_mismatch = true;
>      command_line.warn_search_mismatch = true;
>      command_line.check_section_addresses = -1;
> @@ -234,7 +233,7 @@ index 01b306e58a1..eddefc24332 100644
>    
>      /* We initialize DEMANGLING based on the environment variable
>         COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
> -@@ -1458,7 +1460,7 @@ undefined_symbol (struct bfd_link_info *info,
> +@@ -1489,7 +1491,7 @@ undefined_symbol (struct bfd_link_info *info,
>          argv[1] = "undefined-symbol";
>          argv[2] = (char *) name;
>          argv[3] = NULL;
> @@ -243,7 +242,7 @@ index 01b306e58a1..eddefc24332 100644
>          if (verbose)
>    	einfo (_("%P: About to run error handling script '%s' with arguments: '%s' '%s'\n"),
>    	       argv[0], argv[1], argv[2]);
> -@@ -1479,7 +1481,7 @@ undefined_symbol (struct bfd_link_info *info,
> +@@ -1510,7 +1512,7 @@ undefined_symbol (struct bfd_link_info *info,
>    	 carry on to issue the normal error message.  */
>        }
>    #endif /* SUPPORT_ERROR_HANDLING_SCRIPT */
> @@ -253,10 +252,10 @@ index 01b306e58a1..eddefc24332 100644
>        {
>          if (error_count < MAX_ERRORS_IN_A_ROW)
>   diff --git a/ld/lexsup.c b/ld/lexsup.c
> -index 099dff8ecde..e9939000b2e 100644
> +index 4aa0124ce2f..65c90d48332 100644
>   --- a/ld/lexsup.c
>   +++ b/ld/lexsup.c
> -@@ -642,6 +642,14 @@ static const struct ld_option ld_options[] =
> +@@ -648,6 +648,14 @@ static const struct ld_option ld_options[] =
>    		   "                                <method> is: share-unconflicted (default),\n"
>    		   "                                             share-duplicated"),
>        TWO_DASHES },
> @@ -271,7 +270,7 @@ index 099dff8ecde..e9939000b2e 100644
>    };
>    
>    #define OPTION_COUNT ARRAY_SIZE (ld_options)
> -@@ -1818,6 +1826,13 @@ parse_args (unsigned argc, char **argv)
> +@@ -1834,6 +1842,13 @@ parse_args (unsigned argc, char **argv)
>    
>    	case OPTION_PRINT_MAP_LOCALS:
>    	  config.print_map_locals = true;
> diff --git a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> index f9fa0d4f78d..7144b7d18de 100644
> --- a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> @@ -1,4 +1,4 @@
> -From d35fd95eee9930ab41d9ad637eacb35aa9fe6f44 Mon Sep 17 00:00:00 2001
> +From bfc643d4044dccc917549f2db439cff165512b02 Mon Sep 17 00:00:00 2001
>   From: Zhenhua Luo <zhenhua.luo@nxp.com>
>   Date: Sat, 11 Jun 2016 22:08:29 -0500
>   Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
> diff --git a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
> index 05f1ed0dc55..19dc7ab7bda 100644
> --- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
> @@ -1,4 +1,4 @@
> -From da089ddacb6506f406acd8939389183a4356ebf0 Mon Sep 17 00:00:00 2001
> +From a5272ced746039b50606ebeb311c38adad49a817 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Sun, 14 Feb 2016 17:04:07 +0000
>   Subject: [PATCH] Use libtool 2.4
> @@ -27,11 +27,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    gprofng/src/Makefile.in             |    2 +
>    ld/Makefile.in                      |    3 +
>    ld/configure                        | 1694 ++++++++++++----
> - libbacktrace/Makefile.in            |  108 +-
> + libbacktrace/Makefile.in            |  112 +-
>    libbacktrace/aclocal.m4             |   73 +-
>    libbacktrace/configure              | 1441 +++++++++----
>    libctf/Makefile.in                  |    2 +
> - libctf/configure                    | 1334 +++++++++---
> + libctf/configure                    | 1330 +++++++++---
>    libsframe/Makefile.in               |  344 ++--
>    libsframe/aclocal.m4                |  220 +-
>    libsframe/configure                 | 1553 ++++++++++----
> @@ -44,10 +44,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    opcodes/configure                   | 1331 +++++++++---
>    zlib/Makefile.in                    |    3 +
>    zlib/configure                      | 1331 +++++++++---
> - 35 files changed, 16094 insertions(+), 6104 deletions(-)
> + 35 files changed, 16090 insertions(+), 6108 deletions(-)
>   
>   diff --git a/bfd/Makefile.in b/bfd/Makefile.in
> -index faaa0c424b8..5371e093163 100644
> +index b3d97d478ea..8c19e1766fa 100644
>   --- a/bfd/Makefile.in
>   +++ b/bfd/Makefile.in
>   @@ -340,6 +340,7 @@ DATADIRNAME = @DATADIRNAME@
> @@ -75,7 +75,7 @@ index faaa0c424b8..5371e093163 100644
>    ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
>    all_backends = @all_backends@
>   diff --git a/bfd/configure b/bfd/configure
> -index acbac2f364a..a53a9d52719 100755
> +index 9fe9cf6919f..37b2e6c3393 100755
>   --- a/bfd/configure
>   +++ b/bfd/configure
>   @@ -712,6 +712,9 @@ OTOOL
> @@ -105,7 +105,7 @@ index acbac2f364a..a53a9d52719 100755
>      --with-mmap             try using mmap for BFD input files if available
>      --with-separate-debug-dir=DIR
>                              Look for global separate debug info in DIR
> -@@ -5063,8 +5069,8 @@ esac
> +@@ -5061,8 +5067,8 @@ esac
>    
>    
>    
> @@ -116,7 +116,7 @@ index acbac2f364a..a53a9d52719 100755
>    
>    
>    
> -@@ -5104,7 +5110,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5102,7 +5108,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>    $as_echo_n "checking how to print strings... " >&6; }
>    # Test print first, because it will be a builtin if present.
> @@ -125,7 +125,7 @@ index acbac2f364a..a53a9d52719 100755
>       test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>      ECHO='print -r --'
>    elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5797,8 +5803,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5795,8 +5801,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>    # Try some XSI features
>    xsi_shell=no
>    ( _lt_dummy="a/b/c"
> @@ -136,7 +136,7 @@ index acbac2f364a..a53a9d52719 100755
>        && eval 'test $(( 1 + 1 )) -eq 2 \
>        && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>      && xsi_shell=yes
> -@@ -5847,6 +5853,80 @@ esac
> +@@ -5845,6 +5851,80 @@ esac
>    
>    
>    
> @@ -217,7 +217,7 @@ index acbac2f364a..a53a9d52719 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>    $as_echo_n "checking for $LD option to reload object files... " >&6; }
>    if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5863,6 +5943,11 @@ case $reload_flag in
> +@@ -5861,6 +5941,11 @@ case $reload_flag in
>    esac
>    reload_cmds='$LD$reload_flag -o $output$reload_objs'
>    case $host_os in
> @@ -229,7 +229,7 @@ index acbac2f364a..a53a9d52719 100755
>      darwin*)
>        if test "$GCC" = yes; then
>          reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6031,7 +6116,8 @@ mingw* | pw32*)
> +@@ -6029,7 +6114,8 @@ mingw* | pw32*)
>        lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>        lt_cv_file_magic_cmd='func_win32_libid'
>      else
> @@ -239,7 +239,7 @@ index acbac2f364a..a53a9d52719 100755
>        lt_cv_file_magic_cmd='$OBJDUMP -f'
>      fi
>      ;;
> -@@ -6190,6 +6276,21 @@ esac
> +@@ -6188,6 +6274,21 @@ esac
>    fi
>    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>    $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -261,7 +261,7 @@ index acbac2f364a..a53a9d52719 100755
>    file_magic_cmd=$lt_cv_file_magic_cmd
>    deplibs_check_method=$lt_cv_deplibs_check_method
>    test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6205,6 +6306,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6203,6 +6304,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>    
>    
>    
> @@ -419,7 +419,7 @@ index acbac2f364a..a53a9d52719 100755
>    plugin_option=
>    plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>    for plugin in $plugin_names; do
> -@@ -6219,8 +6471,10 @@ for plugin in $plugin_names; do
> +@@ -6217,8 +6469,10 @@ for plugin in $plugin_names; do
>    done
>    
>    if test -n "$ac_tool_prefix"; then
> @@ -432,7 +432,7 @@ index acbac2f364a..a53a9d52719 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_AR+:} false; then :
> -@@ -6236,7 +6490,7 @@ do
> +@@ -6234,7 +6488,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -441,7 +441,7 @@ index acbac2f364a..a53a9d52719 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -6256,11 +6510,15 @@ $as_echo "no" >&6; }
> +@@ -6254,11 +6508,15 @@ $as_echo "no" >&6; }
>    fi
>    
>    
> @@ -460,7 +460,7 @@ index acbac2f364a..a53a9d52719 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6276,7 +6534,7 @@ do
> +@@ -6274,7 +6532,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -469,7 +469,7 @@ index acbac2f364a..a53a9d52719 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -6295,6 +6553,10 @@ else
> +@@ -6293,6 +6551,10 @@ else
>    $as_echo "no" >&6; }
>    fi
>    
> @@ -480,7 +480,7 @@ index acbac2f364a..a53a9d52719 100755
>      if test "x$ac_ct_AR" = x; then
>        AR="false"
>      else
> -@@ -6306,25 +6568,20 @@ ac_tool_warned=yes ;;
> +@@ -6304,25 +6566,20 @@ ac_tool_warned=yes ;;
>    esac
>        AR=$ac_ct_AR
>      fi
> @@ -516,7 +516,7 @@ index acbac2f364a..a53a9d52719 100755
>    
>    
>    
> -@@ -6335,6 +6592,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -6333,6 +6590,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>    
>    
>    
> @@ -580,7 +580,7 @@ index acbac2f364a..a53a9d52719 100755
>    
>    if test -n "$ac_tool_prefix"; then
>      # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
> -@@ -6675,8 +6989,8 @@ esac
> +@@ -6673,8 +6987,8 @@ esac
>    lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>    
>    # Transform an extracted symbol line into symbol name and symbol address
> @@ -591,7 +591,7 @@ index acbac2f364a..a53a9d52719 100755
>    
>    # Handle CRLF in mingw tool chain
>    opt_cr=
> -@@ -6712,6 +7026,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6710,6 +7024,7 @@ for ac_symprfx in "" "_"; do
>      else
>        lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>      fi
> @@ -599,7 +599,7 @@ index acbac2f364a..a53a9d52719 100755
>    
>      # Check to see that the pipe works correctly.
>      pipe_works=no
> -@@ -6753,6 +7068,18 @@ _LT_EOF
> +@@ -6751,6 +7066,18 @@ _LT_EOF
>          if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>    	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>    	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -618,7 +618,7 @@ index acbac2f364a..a53a9d52719 100755
>    #ifdef __cplusplus
>    extern "C" {
>    #endif
> -@@ -6764,7 +7091,7 @@ _LT_EOF
> +@@ -6762,7 +7089,7 @@ _LT_EOF
>    	  cat <<_LT_EOF >> conftest.$ac_ext
>    
>    /* The mapping between symbol names and symbols.  */
> @@ -627,7 +627,7 @@ index acbac2f364a..a53a9d52719 100755
>      const char *name;
>      void       *address;
>    }
> -@@ -6790,8 +7117,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6788,8 +7115,8 @@ static const void *lt_preloaded_setup() {
>    _LT_EOF
>    	  # Now try linking the two files.
>    	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -638,7 +638,7 @@ index acbac2f364a..a53a9d52719 100755
>    	  LIBS="conftstm.$ac_objext"
>    	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>    	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6801,8 +7128,8 @@ _LT_EOF
> +@@ -6799,8 +7126,8 @@ _LT_EOF
>      test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>    	    pipe_works=yes
>    	  fi
> @@ -649,7 +649,7 @@ index acbac2f364a..a53a9d52719 100755
>    	else
>    	  echo "cannot find nm_test_func in $nlist" >&5
>    	fi
> -@@ -6839,6 +7166,14 @@ else
> +@@ -6837,6 +7164,14 @@ else
>    $as_echo "ok" >&6; }
>    fi
>    
> @@ -664,7 +664,7 @@ index acbac2f364a..a53a9d52719 100755
>    
>    
>    
> -@@ -6857,6 +7192,47 @@ fi
> +@@ -6855,6 +7190,47 @@ fi
>    
>    
>    
> @@ -712,7 +712,7 @@ index acbac2f364a..a53a9d52719 100755
>    
>    
>    
> -@@ -7066,6 +7442,123 @@ esac
> +@@ -7064,6 +7440,123 @@ esac
>    
>    need_locks="$enable_libtool_lock"
>    
> @@ -836,7 +836,7 @@ index acbac2f364a..a53a9d52719 100755
>    
>      case $host_os in
>        rhapsody* | darwin*)
> -@@ -7629,6 +8122,8 @@ _LT_EOF
> +@@ -7627,6 +8120,8 @@ _LT_EOF
>          $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>          echo "$AR cru libconftest.a conftest.o" >&5
>          $AR cru libconftest.a conftest.o 2>&5
> @@ -845,7 +845,7 @@ index acbac2f364a..a53a9d52719 100755
>          cat > conftest.c << _LT_EOF
>    int main() { return 0;}
>    _LT_EOF
> -@@ -8182,8 +8677,6 @@ fi
> +@@ -8180,8 +8675,6 @@ fi
>    lt_prog_compiler_pic=
>    lt_prog_compiler_static=
>    
> @@ -854,7 +854,7 @@ index acbac2f364a..a53a9d52719 100755
>    
>      if test "$GCC" = yes; then
>        lt_prog_compiler_wl='-Wl,'
> -@@ -8349,6 +8842,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8347,6 +8840,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>    	lt_prog_compiler_pic='--shared'
>    	lt_prog_compiler_static='--static'
>    	;;
> @@ -867,7 +867,7 @@ index acbac2f364a..a53a9d52719 100755
>          pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>            # Portland Group compilers (*not* the Pentium gcc compiler,
>    	# which looks to be a dead project)
> -@@ -8411,7 +8910,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8409,7 +8908,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>          lt_prog_compiler_pic='-KPIC'
>          lt_prog_compiler_static='-Bstatic'
>          case $cc_basename in
> @@ -876,7 +876,7 @@ index acbac2f364a..a53a9d52719 100755
>    	lt_prog_compiler_wl='-Qoption ld ';;
>          *)
>    	lt_prog_compiler_wl='-Wl,';;
> -@@ -8468,13 +8967,17 @@ case $host_os in
> +@@ -8466,13 +8965,17 @@ case $host_os in
>        lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>        ;;
>    esac
> @@ -900,7 +900,7 @@ index acbac2f364a..a53a9d52719 100755
>    
>    #
>    # Check to make sure the PIC flag actually works.
> -@@ -8535,6 +9038,11 @@ fi
> +@@ -8533,6 +9036,11 @@ fi
>    
>    
>    
> @@ -912,7 +912,7 @@ index acbac2f364a..a53a9d52719 100755
>    #
>    # Check to make sure the static flag actually works.
>    #
> -@@ -8885,7 +9393,8 @@ _LT_EOF
> +@@ -8883,7 +9391,8 @@ _LT_EOF
>          allow_undefined_flag=unsupported
>          always_export_symbols=no
>          enable_shared_with_static_runtimes=yes
> @@ -922,7 +922,7 @@ index acbac2f364a..a53a9d52719 100755
>    
>          if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>            archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -8984,12 +9493,12 @@ _LT_EOF
> +@@ -8982,12 +9491,12 @@ _LT_EOF
>    	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>    	  hardcode_libdir_flag_spec=
>    	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -937,7 +937,7 @@ index acbac2f364a..a53a9d52719 100755
>    	  fi
>    	  ;;
>    	esac
> -@@ -9003,8 +9512,8 @@ _LT_EOF
> +@@ -9001,8 +9510,8 @@ _LT_EOF
>    	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>    	wlarc=
>          else
> @@ -948,7 +948,7 @@ index acbac2f364a..a53a9d52719 100755
>          fi
>          ;;
>    
> -@@ -9022,8 +9531,8 @@ _LT_EOF
> +@@ -9020,8 +9529,8 @@ _LT_EOF
>    
>    _LT_EOF
>          elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -959,7 +959,7 @@ index acbac2f364a..a53a9d52719 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -9069,8 +9578,8 @@ _LT_EOF
> +@@ -9067,8 +9576,8 @@ _LT_EOF
>    
>        *)
>          if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -970,7 +970,7 @@ index acbac2f364a..a53a9d52719 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -9200,7 +9709,13 @@ _LT_EOF
> +@@ -9198,7 +9707,13 @@ _LT_EOF
>    	allow_undefined_flag='-berok'
>            # Determine the default libpath from the value encoded in an
>            # empty executable.
> @@ -985,7 +985,7 @@ index acbac2f364a..a53a9d52719 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -9213,22 +9728,29 @@ main ()
> +@@ -9211,22 +9726,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -1028,7 +1028,7 @@ index acbac2f364a..a53a9d52719 100755
>    
>            hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>            archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9240,7 +9762,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9238,7 +9760,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	else
>    	 # Determine the default libpath from the value encoded in an
>    	 # empty executable.
> @@ -1043,7 +1043,7 @@ index acbac2f364a..a53a9d52719 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -9253,22 +9781,29 @@ main ()
> +@@ -9251,22 +9779,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -1086,7 +1086,7 @@ index acbac2f364a..a53a9d52719 100755
>    
>    	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>    	  # Warning - without using the other run time loading flags,
> -@@ -9313,20 +9848,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9311,20 +9846,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>          # Microsoft Visual C++.
>          # hardcode_libdir_flag_spec is actually meaningless, as there is
>          # no search path for DLLs.
> @@ -1164,7 +1164,7 @@ index acbac2f364a..a53a9d52719 100755
>          ;;
>    
>        darwin* | rhapsody*)
> -@@ -9387,7 +9965,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9385,7 +9963,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>        freebsd* | dragonfly*)
> @@ -1173,7 +1173,7 @@ index acbac2f364a..a53a9d52719 100755
>          hardcode_libdir_flag_spec='-R$libdir'
>          hardcode_direct=yes
>          hardcode_shlibpath_var=no
> -@@ -9395,7 +9973,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9393,7 +9971,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux9*)
>          if test "$GCC" = yes; then
> @@ -1182,7 +1182,7 @@ index acbac2f364a..a53a9d52719 100755
>          else
>    	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>          fi
> -@@ -9411,7 +9989,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9409,7 +9987,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux10*)
>          if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -1191,7 +1191,7 @@ index acbac2f364a..a53a9d52719 100755
>          else
>    	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>          fi
> -@@ -9435,10 +10013,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9433,10 +10011,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
>    	  ;;
>    	ia64*)
> @@ -1204,7 +1204,7 @@ index acbac2f364a..a53a9d52719 100755
>    	  ;;
>    	esac
>          else
> -@@ -9517,23 +10095,36 @@ fi
> +@@ -9515,23 +10093,36 @@ fi
>    
>        irix5* | irix6* | nonstopux*)
>          if test "$GCC" = yes; then
> @@ -1249,7 +1249,7 @@ index acbac2f364a..a53a9d52719 100755
>          else
>    	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>    	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9618,7 +10209,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9616,7 +10207,7 @@ rm -f core conftest.err conftest.$ac_objext \
>        osf4* | osf5*)	# as osf3* with the addition of -msym flag
>          if test "$GCC" = yes; then
>    	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -1258,7 +1258,7 @@ index acbac2f364a..a53a9d52719 100755
>    	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>          else
>    	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9637,9 +10228,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9635,9 +10226,9 @@ rm -f core conftest.err conftest.$ac_objext \
>          no_undefined_flag=' -z defs'
>          if test "$GCC" = yes; then
>    	wlarc='${wl}'
> @@ -1270,7 +1270,7 @@ index acbac2f364a..a53a9d52719 100755
>          else
>    	case `$CC -V 2>&1` in
>    	*"Compilers 5.0"*)
> -@@ -10215,8 +10806,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10213,8 +10804,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>      need_version=no
>      need_lib_prefix=no
>    
> @@ -1282,7 +1282,7 @@ index acbac2f364a..a53a9d52719 100755
>        library_names_spec='$libname.dll.a'
>        # DLL is installed to $(libdir)/../bin by postinstall_cmds
>        postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10249,13 +10841,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10247,13 +10839,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>          library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>          ;;
>        esac
> @@ -1355,16 +1355,16 @@ index acbac2f364a..a53a9d52719 100755
>      # FIXME: first we should search . and the directory the executable is in
>      shlibpath_var=PATH
>      ;;
> -@@ -11157,7 +11807,7 @@ else
> +@@ -11155,7 +11805,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 11160 "configure"
> +-#line 11158 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -11201,10 +11851,10 @@ else
> +@@ -11199,10 +11849,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -1377,16 +1377,16 @@ index acbac2f364a..a53a9d52719 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11263,7 +11913,7 @@ else
> +@@ -11261,7 +11911,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 11266 "configure"
> +-#line 11264 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -11307,10 +11957,10 @@ else
> +@@ -11305,10 +11955,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -1399,7 +1399,7 @@ index acbac2f364a..a53a9d52719 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -15691,7 +16341,7 @@ SHARED_LDFLAGS=
> +@@ -15689,7 +16339,7 @@ SHARED_LDFLAGS=
>    if test "$enable_shared" = "yes"; then
>      x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
>      if test -n "$x"; then
> @@ -1408,7 +1408,7 @@ index acbac2f364a..a53a9d52719 100755
>      fi
>    fi
>    
> -@@ -18313,13 +18963,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -18316,13 +18966,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>    lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>    lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>    lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -1429,7 +1429,7 @@ index acbac2f364a..a53a9d52719 100755
>    STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>    RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>    old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -18334,14 +18991,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -18337,14 +18994,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>    lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -1448,7 +1448,7 @@ index acbac2f364a..a53a9d52719 100755
>    DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>    NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>    LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -18374,12 +19034,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -18377,12 +19037,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>    hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>    inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>    link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -1462,7 +1462,7 @@ index acbac2f364a..a53a9d52719 100755
>    file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>    variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>    need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -18434,8 +19094,13 @@ reload_flag \
> +@@ -18437,8 +19097,13 @@ reload_flag \
>    OBJDUMP \
>    deplibs_check_method \
>    file_magic_cmd \
> @@ -1476,7 +1476,7 @@ index acbac2f364a..a53a9d52719 100755
>    STRIP \
>    RANLIB \
>    CC \
> -@@ -18445,12 +19110,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -18448,12 +19113,14 @@ lt_cv_sys_global_symbol_pipe \
>    lt_cv_sys_global_symbol_to_cdecl \
>    lt_cv_sys_global_symbol_to_c_name_address \
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -1492,7 +1492,7 @@ index acbac2f364a..a53a9d52719 100755
>    DSYMUTIL \
>    NMEDIT \
>    LIPO \
> -@@ -18466,7 +19133,6 @@ no_undefined_flag \
> +@@ -18469,7 +19136,6 @@ no_undefined_flag \
>    hardcode_libdir_flag_spec \
>    hardcode_libdir_flag_spec_ld \
>    hardcode_libdir_separator \
> @@ -1500,7 +1500,7 @@ index acbac2f364a..a53a9d52719 100755
>    exclude_expsyms \
>    include_expsyms \
>    file_list_spec \
> -@@ -18502,6 +19168,7 @@ module_cmds \
> +@@ -18505,6 +19171,7 @@ module_cmds \
>    module_expsym_cmds \
>    export_symbols_cmds \
>    prelink_cmds \
> @@ -1508,7 +1508,7 @@ index acbac2f364a..a53a9d52719 100755
>    postinstall_cmds \
>    postuninstall_cmds \
>    finish_cmds \
> -@@ -19278,7 +19945,8 @@ $as_echo X"$file" |
> +@@ -19281,7 +19948,8 @@ $as_echo X"$file" |
>    # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>    #
>    #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -1518,7 +1518,7 @@ index acbac2f364a..a53a9d52719 100755
>    #   Written by Gordon Matzigkeit, 1996
>    #
>    #   This file is part of GNU Libtool.
> -@@ -19381,19 +20049,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -19384,19 +20052,42 @@ SP2NL=$lt_lt_SP2NL
>    # turn newlines into spaces.
>    NL2SP=$lt_lt_NL2SP
>    
> @@ -1562,7 +1562,7 @@ index acbac2f364a..a53a9d52719 100755
>    # A symbol stripping program.
>    STRIP=$lt_STRIP
>    
> -@@ -19423,6 +20114,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -19426,6 +20117,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>    # Transform the output of nm in a C name address pair when lib prefix is needed.
>    global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>    
> @@ -1575,7 +1575,7 @@ index acbac2f364a..a53a9d52719 100755
>    # The name of the directory that contains temporary libtool files.
>    objdir=$objdir
>    
> -@@ -19432,6 +20129,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -19435,6 +20132,9 @@ MAGIC_CMD=$MAGIC_CMD
>    # Must we lock files when doing compilation?
>    need_locks=$lt_need_locks
>    
> @@ -1585,7 +1585,7 @@ index acbac2f364a..a53a9d52719 100755
>    # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>    DSYMUTIL=$lt_DSYMUTIL
>    
> -@@ -19546,12 +20246,12 @@ with_gcc=$GCC
> +@@ -19549,12 +20249,12 @@ with_gcc=$GCC
>    # Compiler flag to turn off builtin functions.
>    no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>    
> @@ -1601,7 +1601,7 @@ index acbac2f364a..a53a9d52719 100755
>    # Compiler flag to prevent dynamic linking.
>    link_static_flag=$lt_lt_prog_compiler_static
>    
> -@@ -19638,9 +20338,6 @@ inherit_rpath=$inherit_rpath
> +@@ -19641,9 +20341,6 @@ inherit_rpath=$inherit_rpath
>    # Whether libtool must link a program against all its dependency libraries.
>    link_all_deplibs=$link_all_deplibs
>    
> @@ -1611,7 +1611,7 @@ index acbac2f364a..a53a9d52719 100755
>    # Set to "yes" if exported symbols are required.
>    always_export_symbols=$always_export_symbols
>    
> -@@ -19656,6 +20353,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -19659,6 +20356,9 @@ include_expsyms=$lt_include_expsyms
>    # Commands necessary for linking programs (against libraries) with templates.
>    prelink_cmds=$lt_prelink_cmds
>    
> @@ -1621,7 +1621,7 @@ index acbac2f364a..a53a9d52719 100755
>    # Specify filename containing input files.
>    file_list_spec=$lt_file_list_spec
>    
> -@@ -19688,210 +20388,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -19691,210 +20391,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>      # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>      # text mode, it properly converts lines to CR/LF.  This bash problem
>      # is reportedly fixed, but why not run on old versions too?
> @@ -1996,10 +1996,10 @@ index acbac2f364a..a53a9d52719 100755
>      chmod +x "$ofile"
>    
>   diff --git a/bfd/configure.ac b/bfd/configure.ac
> -index 7fcc5d4a947..f7191d3f30f 100644
> +index 6bcfd1b7368..6aedf387cb9 100644
>   --- a/bfd/configure.ac
>   +++ b/bfd/configure.ac
> -@@ -276,7 +276,7 @@ changequote(,)dnl
> +@@ -275,7 +275,7 @@ changequote(,)dnl
>      x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
>    changequote([,])dnl
>      if test -n "$x"; then
> @@ -2009,7 +2009,7 @@ index 7fcc5d4a947..f7191d3f30f 100644
>    fi
>    
>   diff --git a/binutils/Makefile.in b/binutils/Makefile.in
> -index 842a6d99b54..037cccde038 100644
> +index 67fa5b3b8d9..3273426119c 100644
>   --- a/binutils/Makefile.in
>   +++ b/binutils/Makefile.in
>   @@ -495,6 +495,7 @@ DEBUGINFOD_LIBS = @DEBUGINFOD_LIBS@
> @@ -2037,7 +2037,7 @@ index 842a6d99b54..037cccde038 100644
>    ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
>    am__include = @am__include@
>   diff --git a/binutils/configure b/binutils/configure
> -index a1092735311..f3bdee98f3f 100755
> +index e97f4cba053..6e6e08b350a 100755
>   --- a/binutils/configure
>   +++ b/binutils/configure
>   @@ -704,8 +704,11 @@ OTOOL
> @@ -2069,7 +2069,7 @@ index a1092735311..f3bdee98f3f 100755
>      --with-debuginfod       Enable debuginfo lookups with debuginfod
>                              (auto/yes/no)
>      --with-gnu-ld           assume the C compiler uses GNU ld default=no
> -@@ -4958,8 +4964,8 @@ esac
> +@@ -4956,8 +4962,8 @@ esac
>    
>    
>    
> @@ -2080,7 +2080,7 @@ index a1092735311..f3bdee98f3f 100755
>    
>    
>    
> -@@ -4999,7 +5005,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4997,7 +5003,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>    $as_echo_n "checking how to print strings... " >&6; }
>    # Test print first, because it will be a builtin if present.
> @@ -2089,7 +2089,7 @@ index a1092735311..f3bdee98f3f 100755
>       test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>      ECHO='print -r --'
>    elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5692,8 +5698,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5690,8 +5696,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>    # Try some XSI features
>    xsi_shell=no
>    ( _lt_dummy="a/b/c"
> @@ -2100,7 +2100,7 @@ index a1092735311..f3bdee98f3f 100755
>        && eval 'test $(( 1 + 1 )) -eq 2 \
>        && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>      && xsi_shell=yes
> -@@ -5742,6 +5748,80 @@ esac
> +@@ -5740,6 +5746,80 @@ esac
>    
>    
>    
> @@ -2181,7 +2181,7 @@ index a1092735311..f3bdee98f3f 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>    $as_echo_n "checking for $LD option to reload object files... " >&6; }
>    if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5758,6 +5838,11 @@ case $reload_flag in
> +@@ -5756,6 +5836,11 @@ case $reload_flag in
>    esac
>    reload_cmds='$LD$reload_flag -o $output$reload_objs'
>    case $host_os in
> @@ -2193,7 +2193,7 @@ index a1092735311..f3bdee98f3f 100755
>      darwin*)
>        if test "$GCC" = yes; then
>          reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -5926,7 +6011,8 @@ mingw* | pw32*)
> +@@ -5924,7 +6009,8 @@ mingw* | pw32*)
>        lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>        lt_cv_file_magic_cmd='func_win32_libid'
>      else
> @@ -2203,7 +2203,7 @@ index a1092735311..f3bdee98f3f 100755
>        lt_cv_file_magic_cmd='$OBJDUMP -f'
>      fi
>      ;;
> -@@ -6085,6 +6171,21 @@ esac
> +@@ -6083,6 +6169,21 @@ esac
>    fi
>    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>    $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -2225,7 +2225,7 @@ index a1092735311..f3bdee98f3f 100755
>    file_magic_cmd=$lt_cv_file_magic_cmd
>    deplibs_check_method=$lt_cv_deplibs_check_method
>    test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6100,6 +6201,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6098,6 +6199,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>    
>    
>    
> @@ -2383,7 +2383,7 @@ index a1092735311..f3bdee98f3f 100755
>    plugin_option=
>    plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>    for plugin in $plugin_names; do
> -@@ -6114,8 +6366,10 @@ for plugin in $plugin_names; do
> +@@ -6112,8 +6364,10 @@ for plugin in $plugin_names; do
>    done
>    
>    if test -n "$ac_tool_prefix"; then
> @@ -2396,7 +2396,7 @@ index a1092735311..f3bdee98f3f 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_AR+:} false; then :
> -@@ -6131,7 +6385,7 @@ do
> +@@ -6129,7 +6383,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -2405,7 +2405,7 @@ index a1092735311..f3bdee98f3f 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -6151,11 +6405,15 @@ $as_echo "no" >&6; }
> +@@ -6149,11 +6403,15 @@ $as_echo "no" >&6; }
>    fi
>    
>    
> @@ -2424,7 +2424,7 @@ index a1092735311..f3bdee98f3f 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6171,7 +6429,7 @@ do
> +@@ -6169,7 +6427,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -2433,7 +2433,7 @@ index a1092735311..f3bdee98f3f 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -6190,6 +6448,10 @@ else
> +@@ -6188,6 +6446,10 @@ else
>    $as_echo "no" >&6; }
>    fi
>    
> @@ -2444,7 +2444,7 @@ index a1092735311..f3bdee98f3f 100755
>      if test "x$ac_ct_AR" = x; then
>        AR="false"
>      else
> -@@ -6201,25 +6463,19 @@ ac_tool_warned=yes ;;
> +@@ -6199,25 +6461,19 @@ ac_tool_warned=yes ;;
>    esac
>        AR=$ac_ct_AR
>      fi
> @@ -2479,7 +2479,7 @@ index a1092735311..f3bdee98f3f 100755
>    
>    
>    
> -@@ -6231,6 +6487,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -6229,6 +6485,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>    
>    
>    
> @@ -2544,7 +2544,7 @@ index a1092735311..f3bdee98f3f 100755
>    if test -n "$ac_tool_prefix"; then
>      # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
>    set dummy ${ac_tool_prefix}strip; ac_word=$2
> -@@ -6570,8 +6884,8 @@ esac
> +@@ -6568,8 +6882,8 @@ esac
>    lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>    
>    # Transform an extracted symbol line into symbol name and symbol address
> @@ -2555,7 +2555,7 @@ index a1092735311..f3bdee98f3f 100755
>    
>    # Handle CRLF in mingw tool chain
>    opt_cr=
> -@@ -6607,6 +6921,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6605,6 +6919,7 @@ for ac_symprfx in "" "_"; do
>      else
>        lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>      fi
> @@ -2563,7 +2563,7 @@ index a1092735311..f3bdee98f3f 100755
>    
>      # Check to see that the pipe works correctly.
>      pipe_works=no
> -@@ -6648,6 +6963,18 @@ _LT_EOF
> +@@ -6646,6 +6961,18 @@ _LT_EOF
>          if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>    	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>    	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -2582,7 +2582,7 @@ index a1092735311..f3bdee98f3f 100755
>    #ifdef __cplusplus
>    extern "C" {
>    #endif
> -@@ -6659,7 +6986,7 @@ _LT_EOF
> +@@ -6657,7 +6984,7 @@ _LT_EOF
>    	  cat <<_LT_EOF >> conftest.$ac_ext
>    
>    /* The mapping between symbol names and symbols.  */
> @@ -2591,7 +2591,7 @@ index a1092735311..f3bdee98f3f 100755
>      const char *name;
>      void       *address;
>    }
> -@@ -6685,8 +7012,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6683,8 +7010,8 @@ static const void *lt_preloaded_setup() {
>    _LT_EOF
>    	  # Now try linking the two files.
>    	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -2602,7 +2602,7 @@ index a1092735311..f3bdee98f3f 100755
>    	  LIBS="conftstm.$ac_objext"
>    	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>    	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6696,8 +7023,8 @@ _LT_EOF
> +@@ -6694,8 +7021,8 @@ _LT_EOF
>      test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>    	    pipe_works=yes
>    	  fi
> @@ -2613,7 +2613,7 @@ index a1092735311..f3bdee98f3f 100755
>    	else
>    	  echo "cannot find nm_test_func in $nlist" >&5
>    	fi
> -@@ -6734,6 +7061,18 @@ else
> +@@ -6732,6 +7059,18 @@ else
>    $as_echo "ok" >&6; }
>    fi
>    
> @@ -2632,7 +2632,7 @@ index a1092735311..f3bdee98f3f 100755
>    
>    
>    
> -@@ -6750,6 +7089,43 @@ fi
> +@@ -6748,6 +7087,43 @@ fi
>    
>    
>    
> @@ -2676,7 +2676,7 @@ index a1092735311..f3bdee98f3f 100755
>    
>    
>    
> -@@ -6961,6 +7337,123 @@ esac
> +@@ -6959,6 +7335,123 @@ esac
>    
>    need_locks="$enable_libtool_lock"
>    
> @@ -2800,7 +2800,7 @@ index a1092735311..f3bdee98f3f 100755
>    
>      case $host_os in
>        rhapsody* | darwin*)
> -@@ -7524,6 +8017,8 @@ _LT_EOF
> +@@ -7522,6 +8015,8 @@ _LT_EOF
>          $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>          echo "$AR cru libconftest.a conftest.o" >&5
>          $AR cru libconftest.a conftest.o 2>&5
> @@ -2809,7 +2809,7 @@ index a1092735311..f3bdee98f3f 100755
>          cat > conftest.c << _LT_EOF
>    int main() { return 0;}
>    _LT_EOF
> -@@ -8108,8 +8603,6 @@ fi
> +@@ -8106,8 +8601,6 @@ fi
>    lt_prog_compiler_pic=
>    lt_prog_compiler_static=
>    
> @@ -2818,7 +2818,7 @@ index a1092735311..f3bdee98f3f 100755
>    
>      if test "$GCC" = yes; then
>        lt_prog_compiler_wl='-Wl,'
> -@@ -8275,6 +8768,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8273,6 +8766,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>    	lt_prog_compiler_pic='--shared'
>    	lt_prog_compiler_static='--static'
>    	;;
> @@ -2831,7 +2831,7 @@ index a1092735311..f3bdee98f3f 100755
>          pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>            # Portland Group compilers (*not* the Pentium gcc compiler,
>    	# which looks to be a dead project)
> -@@ -8337,7 +8836,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8335,7 +8834,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>          lt_prog_compiler_pic='-KPIC'
>          lt_prog_compiler_static='-Bstatic'
>          case $cc_basename in
> @@ -2840,7 +2840,7 @@ index a1092735311..f3bdee98f3f 100755
>    	lt_prog_compiler_wl='-Qoption ld ';;
>          *)
>    	lt_prog_compiler_wl='-Wl,';;
> -@@ -8394,13 +8893,17 @@ case $host_os in
> +@@ -8392,13 +8891,17 @@ case $host_os in
>        lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>        ;;
>    esac
> @@ -2864,7 +2864,7 @@ index a1092735311..f3bdee98f3f 100755
>    
>    #
>    # Check to make sure the PIC flag actually works.
> -@@ -8461,6 +8964,11 @@ fi
> +@@ -8459,6 +8962,11 @@ fi
>    
>    
>    
> @@ -2876,7 +2876,7 @@ index a1092735311..f3bdee98f3f 100755
>    #
>    # Check to make sure the static flag actually works.
>    #
> -@@ -8811,7 +9319,8 @@ _LT_EOF
> +@@ -8809,7 +9317,8 @@ _LT_EOF
>          allow_undefined_flag=unsupported
>          always_export_symbols=no
>          enable_shared_with_static_runtimes=yes
> @@ -2886,7 +2886,7 @@ index a1092735311..f3bdee98f3f 100755
>    
>          if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>            archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -8910,12 +9419,12 @@ _LT_EOF
> +@@ -8908,12 +9417,12 @@ _LT_EOF
>    	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>    	  hardcode_libdir_flag_spec=
>    	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -2901,7 +2901,7 @@ index a1092735311..f3bdee98f3f 100755
>    	  fi
>    	  ;;
>    	esac
> -@@ -8929,8 +9438,8 @@ _LT_EOF
> +@@ -8927,8 +9436,8 @@ _LT_EOF
>    	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>    	wlarc=
>          else
> @@ -2912,7 +2912,7 @@ index a1092735311..f3bdee98f3f 100755
>          fi
>          ;;
>    
> -@@ -8948,8 +9457,8 @@ _LT_EOF
> +@@ -8946,8 +9455,8 @@ _LT_EOF
>    
>    _LT_EOF
>          elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -2923,7 +2923,7 @@ index a1092735311..f3bdee98f3f 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -8995,8 +9504,8 @@ _LT_EOF
> +@@ -8993,8 +9502,8 @@ _LT_EOF
>    
>        *)
>          if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -2934,7 +2934,7 @@ index a1092735311..f3bdee98f3f 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -9126,7 +9635,13 @@ _LT_EOF
> +@@ -9124,7 +9633,13 @@ _LT_EOF
>    	allow_undefined_flag='-berok'
>            # Determine the default libpath from the value encoded in an
>            # empty executable.
> @@ -2949,7 +2949,7 @@ index a1092735311..f3bdee98f3f 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -9139,22 +9654,29 @@ main ()
> +@@ -9137,22 +9652,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -2992,7 +2992,7 @@ index a1092735311..f3bdee98f3f 100755
>    
>            hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>            archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9166,7 +9688,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9164,7 +9686,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	else
>    	 # Determine the default libpath from the value encoded in an
>    	 # empty executable.
> @@ -3007,7 +3007,7 @@ index a1092735311..f3bdee98f3f 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -9179,22 +9707,29 @@ main ()
> +@@ -9177,22 +9705,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -3050,7 +3050,7 @@ index a1092735311..f3bdee98f3f 100755
>    
>    	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>    	  # Warning - without using the other run time loading flags,
> -@@ -9239,20 +9774,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9237,20 +9772,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>          # Microsoft Visual C++.
>          # hardcode_libdir_flag_spec is actually meaningless, as there is
>          # no search path for DLLs.
> @@ -3128,7 +3128,7 @@ index a1092735311..f3bdee98f3f 100755
>          ;;
>    
>        darwin* | rhapsody*)
> -@@ -9313,7 +9891,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9311,7 +9889,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>        freebsd* | dragonfly*)
> @@ -3137,7 +3137,7 @@ index a1092735311..f3bdee98f3f 100755
>          hardcode_libdir_flag_spec='-R$libdir'
>          hardcode_direct=yes
>          hardcode_shlibpath_var=no
> -@@ -9321,7 +9899,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9319,7 +9897,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux9*)
>          if test "$GCC" = yes; then
> @@ -3146,7 +3146,7 @@ index a1092735311..f3bdee98f3f 100755
>          else
>    	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>          fi
> -@@ -9337,7 +9915,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9335,7 +9913,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux10*)
>          if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -3155,7 +3155,7 @@ index a1092735311..f3bdee98f3f 100755
>          else
>    	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>          fi
> -@@ -9361,10 +9939,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9359,10 +9937,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
>    	  ;;
>    	ia64*)
> @@ -3168,7 +3168,7 @@ index a1092735311..f3bdee98f3f 100755
>    	  ;;
>    	esac
>          else
> -@@ -9443,23 +10021,36 @@ fi
> +@@ -9441,23 +10019,36 @@ fi
>    
>        irix5* | irix6* | nonstopux*)
>          if test "$GCC" = yes; then
> @@ -3213,7 +3213,7 @@ index a1092735311..f3bdee98f3f 100755
>          else
>    	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>    	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9544,7 +10135,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9542,7 +10133,7 @@ rm -f core conftest.err conftest.$ac_objext \
>        osf4* | osf5*)	# as osf3* with the addition of -msym flag
>          if test "$GCC" = yes; then
>    	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -3222,7 +3222,7 @@ index a1092735311..f3bdee98f3f 100755
>    	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>          else
>    	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9563,9 +10154,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9561,9 +10152,9 @@ rm -f core conftest.err conftest.$ac_objext \
>          no_undefined_flag=' -z defs'
>          if test "$GCC" = yes; then
>    	wlarc='${wl}'
> @@ -3234,7 +3234,7 @@ index a1092735311..f3bdee98f3f 100755
>          else
>    	case `$CC -V 2>&1` in
>    	*"Compilers 5.0"*)
> -@@ -10141,8 +10732,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10139,8 +10730,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>      need_version=no
>      need_lib_prefix=no
>    
> @@ -3246,7 +3246,7 @@ index a1092735311..f3bdee98f3f 100755
>        library_names_spec='$libname.dll.a'
>        # DLL is installed to $(libdir)/../bin by postinstall_cmds
>        postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10175,13 +10767,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10173,13 +10765,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>          library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>          ;;
>        esac
> @@ -3319,16 +3319,16 @@ index a1092735311..f3bdee98f3f 100755
>      # FIXME: first we should search . and the directory the executable is in
>      shlibpath_var=PATH
>      ;;
> -@@ -11083,7 +11733,7 @@ else
> +@@ -11081,7 +11731,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 11086 "configure"
> +-#line 11084 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -11127,10 +11777,10 @@ else
> +@@ -11125,10 +11775,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -3341,16 +3341,16 @@ index a1092735311..f3bdee98f3f 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11189,7 +11839,7 @@ else
> +@@ -11187,7 +11837,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 11192 "configure"
> +-#line 11190 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -11233,10 +11883,10 @@ else
> +@@ -11231,10 +11881,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -3363,7 +3363,7 @@ index a1092735311..f3bdee98f3f 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -17390,13 +18040,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -17393,13 +18043,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>    lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>    lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>    lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -3384,7 +3384,7 @@ index a1092735311..f3bdee98f3f 100755
>    STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>    RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>    old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -17411,14 +18068,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -17414,14 +18071,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>    lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -3403,7 +3403,7 @@ index a1092735311..f3bdee98f3f 100755
>    DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>    NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>    LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -17451,12 +18111,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -17454,12 +18114,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>    hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>    inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>    link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -3417,7 +3417,7 @@ index a1092735311..f3bdee98f3f 100755
>    file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>    variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>    need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -17511,8 +18171,13 @@ reload_flag \
> +@@ -17514,8 +18174,13 @@ reload_flag \
>    OBJDUMP \
>    deplibs_check_method \
>    file_magic_cmd \
> @@ -3431,7 +3431,7 @@ index a1092735311..f3bdee98f3f 100755
>    STRIP \
>    RANLIB \
>    CC \
> -@@ -17522,12 +18187,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -17525,12 +18190,14 @@ lt_cv_sys_global_symbol_pipe \
>    lt_cv_sys_global_symbol_to_cdecl \
>    lt_cv_sys_global_symbol_to_c_name_address \
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -3447,7 +3447,7 @@ index a1092735311..f3bdee98f3f 100755
>    DSYMUTIL \
>    NMEDIT \
>    LIPO \
> -@@ -17543,7 +18210,6 @@ no_undefined_flag \
> +@@ -17546,7 +18213,6 @@ no_undefined_flag \
>    hardcode_libdir_flag_spec \
>    hardcode_libdir_flag_spec_ld \
>    hardcode_libdir_separator \
> @@ -3455,7 +3455,7 @@ index a1092735311..f3bdee98f3f 100755
>    exclude_expsyms \
>    include_expsyms \
>    file_list_spec \
> -@@ -17579,6 +18245,7 @@ module_cmds \
> +@@ -17582,6 +18248,7 @@ module_cmds \
>    module_expsym_cmds \
>    export_symbols_cmds \
>    prelink_cmds \
> @@ -3463,7 +3463,7 @@ index a1092735311..f3bdee98f3f 100755
>    postinstall_cmds \
>    postuninstall_cmds \
>    finish_cmds \
> -@@ -18352,7 +19019,8 @@ $as_echo X"$file" |
> +@@ -18355,7 +19022,8 @@ $as_echo X"$file" |
>    # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>    #
>    #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -3473,7 +3473,7 @@ index a1092735311..f3bdee98f3f 100755
>    #   Written by Gordon Matzigkeit, 1996
>    #
>    #   This file is part of GNU Libtool.
> -@@ -18455,19 +19123,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -18458,19 +19126,42 @@ SP2NL=$lt_lt_SP2NL
>    # turn newlines into spaces.
>    NL2SP=$lt_lt_NL2SP
>    
> @@ -3517,7 +3517,7 @@ index a1092735311..f3bdee98f3f 100755
>    # A symbol stripping program.
>    STRIP=$lt_STRIP
>    
> -@@ -18497,6 +19188,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -18500,6 +19191,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>    # Transform the output of nm in a C name address pair when lib prefix is needed.
>    global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>    
> @@ -3530,7 +3530,7 @@ index a1092735311..f3bdee98f3f 100755
>    # The name of the directory that contains temporary libtool files.
>    objdir=$objdir
>    
> -@@ -18506,6 +19203,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -18509,6 +19206,9 @@ MAGIC_CMD=$MAGIC_CMD
>    # Must we lock files when doing compilation?
>    need_locks=$lt_need_locks
>    
> @@ -3540,7 +3540,7 @@ index a1092735311..f3bdee98f3f 100755
>    # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>    DSYMUTIL=$lt_DSYMUTIL
>    
> -@@ -18620,12 +19320,12 @@ with_gcc=$GCC
> +@@ -18623,12 +19323,12 @@ with_gcc=$GCC
>    # Compiler flag to turn off builtin functions.
>    no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>    
> @@ -3556,7 +3556,7 @@ index a1092735311..f3bdee98f3f 100755
>    # Compiler flag to prevent dynamic linking.
>    link_static_flag=$lt_lt_prog_compiler_static
>    
> -@@ -18712,9 +19412,6 @@ inherit_rpath=$inherit_rpath
> +@@ -18715,9 +19415,6 @@ inherit_rpath=$inherit_rpath
>    # Whether libtool must link a program against all its dependency libraries.
>    link_all_deplibs=$link_all_deplibs
>    
> @@ -3566,7 +3566,7 @@ index a1092735311..f3bdee98f3f 100755
>    # Set to "yes" if exported symbols are required.
>    always_export_symbols=$always_export_symbols
>    
> -@@ -18730,6 +19427,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -18733,6 +19430,9 @@ include_expsyms=$lt_include_expsyms
>    # Commands necessary for linking programs (against libraries) with templates.
>    prelink_cmds=$lt_prelink_cmds
>    
> @@ -3576,7 +3576,7 @@ index a1092735311..f3bdee98f3f 100755
>    # Specify filename containing input files.
>    file_list_spec=$lt_file_list_spec
>    
> -@@ -18762,210 +19462,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -18765,210 +19465,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>      # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>      # text mode, it properly converts lines to CR/LF.  This bash problem
>      # is reportedly fixed, but why not run on old versions too?
> @@ -3951,7 +3951,7 @@ index a1092735311..f3bdee98f3f 100755
>      chmod +x "$ofile"
>    
>   diff --git a/gas/Makefile.in b/gas/Makefile.in
> -index bc25765cb5b..c481d96a05a 100644
> +index b57516369d7..1d5f5295102 100644
>   --- a/gas/Makefile.in
>   +++ b/gas/Makefile.in
>   @@ -384,6 +384,7 @@ CYGPATH_W = @CYGPATH_W@
> @@ -3979,7 +3979,7 @@ index bc25765cb5b..c481d96a05a 100644
>    ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
>    am__include = @am__include@
>   diff --git a/gas/configure b/gas/configure
> -index 5f8c8493589..998727b6108 100755
> +index a4d64ce5289..01c0c35ecad 100755
>   --- a/gas/configure
>   +++ b/gas/configure
>   @@ -692,8 +692,11 @@ OTOOL
> @@ -4011,7 +4011,7 @@ index 5f8c8493589..998727b6108 100755
>      --with-cpu=CPU          default cpu variant is CPU (currently only supported
>                              on ARC)
>      --with-gnu-ld           assume the C compiler uses GNU ld default=no
> -@@ -4652,8 +4658,8 @@ esac
> +@@ -4650,8 +4656,8 @@ esac
>    
>    
>    
> @@ -4022,7 +4022,7 @@ index 5f8c8493589..998727b6108 100755
>    
>    
>    
> -@@ -4693,7 +4699,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4691,7 +4697,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>    $as_echo_n "checking how to print strings... " >&6; }
>    # Test print first, because it will be a builtin if present.
> @@ -4031,7 +4031,7 @@ index 5f8c8493589..998727b6108 100755
>       test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>      ECHO='print -r --'
>    elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5386,8 +5392,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5384,8 +5390,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>    # Try some XSI features
>    xsi_shell=no
>    ( _lt_dummy="a/b/c"
> @@ -4042,7 +4042,7 @@ index 5f8c8493589..998727b6108 100755
>        && eval 'test $(( 1 + 1 )) -eq 2 \
>        && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>      && xsi_shell=yes
> -@@ -5436,6 +5442,80 @@ esac
> +@@ -5434,6 +5440,80 @@ esac
>    
>    
>    
> @@ -4123,7 +4123,7 @@ index 5f8c8493589..998727b6108 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>    $as_echo_n "checking for $LD option to reload object files... " >&6; }
>    if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5452,6 +5532,11 @@ case $reload_flag in
> +@@ -5450,6 +5530,11 @@ case $reload_flag in
>    esac
>    reload_cmds='$LD$reload_flag -o $output$reload_objs'
>    case $host_os in
> @@ -4135,7 +4135,7 @@ index 5f8c8493589..998727b6108 100755
>      darwin*)
>        if test "$GCC" = yes; then
>          reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -5620,7 +5705,8 @@ mingw* | pw32*)
> +@@ -5618,7 +5703,8 @@ mingw* | pw32*)
>        lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>        lt_cv_file_magic_cmd='func_win32_libid'
>      else
> @@ -4145,7 +4145,7 @@ index 5f8c8493589..998727b6108 100755
>        lt_cv_file_magic_cmd='$OBJDUMP -f'
>      fi
>      ;;
> -@@ -5779,6 +5865,21 @@ esac
> +@@ -5777,6 +5863,21 @@ esac
>    fi
>    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>    $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -4167,7 +4167,7 @@ index 5f8c8493589..998727b6108 100755
>    file_magic_cmd=$lt_cv_file_magic_cmd
>    deplibs_check_method=$lt_cv_deplibs_check_method
>    test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -5794,6 +5895,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -5792,6 +5893,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>    
>    
>    
> @@ -4325,7 +4325,7 @@ index 5f8c8493589..998727b6108 100755
>    plugin_option=
>    plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>    for plugin in $plugin_names; do
> -@@ -5808,8 +6060,10 @@ for plugin in $plugin_names; do
> +@@ -5806,8 +6058,10 @@ for plugin in $plugin_names; do
>    done
>    
>    if test -n "$ac_tool_prefix"; then
> @@ -4338,7 +4338,7 @@ index 5f8c8493589..998727b6108 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_AR+:} false; then :
> -@@ -5825,7 +6079,7 @@ do
> +@@ -5823,7 +6077,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -4347,7 +4347,7 @@ index 5f8c8493589..998727b6108 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -5845,11 +6099,15 @@ $as_echo "no" >&6; }
> +@@ -5843,11 +6097,15 @@ $as_echo "no" >&6; }
>    fi
>    
>    
> @@ -4366,7 +4366,7 @@ index 5f8c8493589..998727b6108 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -5865,7 +6123,7 @@ do
> +@@ -5863,7 +6121,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -4375,7 +4375,7 @@ index 5f8c8493589..998727b6108 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -5884,6 +6142,10 @@ else
> +@@ -5882,6 +6140,10 @@ else
>    $as_echo "no" >&6; }
>    fi
>    
> @@ -4386,7 +4386,7 @@ index 5f8c8493589..998727b6108 100755
>      if test "x$ac_ct_AR" = x; then
>        AR="false"
>      else
> -@@ -5895,29 +6157,81 @@ ac_tool_warned=yes ;;
> +@@ -5893,29 +6155,81 @@ ac_tool_warned=yes ;;
>    esac
>        AR=$ac_ct_AR
>      fi
> @@ -4483,7 +4483,7 @@ index 5f8c8493589..998727b6108 100755
>    
>    
>    
> -@@ -6264,8 +6578,8 @@ esac
> +@@ -6262,8 +6576,8 @@ esac
>    lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>    
>    # Transform an extracted symbol line into symbol name and symbol address
> @@ -4494,7 +4494,7 @@ index 5f8c8493589..998727b6108 100755
>    
>    # Handle CRLF in mingw tool chain
>    opt_cr=
> -@@ -6301,6 +6615,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6299,6 +6613,7 @@ for ac_symprfx in "" "_"; do
>      else
>        lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>      fi
> @@ -4502,7 +4502,7 @@ index 5f8c8493589..998727b6108 100755
>    
>      # Check to see that the pipe works correctly.
>      pipe_works=no
> -@@ -6342,6 +6657,18 @@ _LT_EOF
> +@@ -6340,6 +6655,18 @@ _LT_EOF
>          if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>    	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>    	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -4521,7 +4521,7 @@ index 5f8c8493589..998727b6108 100755
>    #ifdef __cplusplus
>    extern "C" {
>    #endif
> -@@ -6353,7 +6680,7 @@ _LT_EOF
> +@@ -6351,7 +6678,7 @@ _LT_EOF
>    	  cat <<_LT_EOF >> conftest.$ac_ext
>    
>    /* The mapping between symbol names and symbols.  */
> @@ -4530,7 +4530,7 @@ index 5f8c8493589..998727b6108 100755
>      const char *name;
>      void       *address;
>    }
> -@@ -6379,8 +6706,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6377,8 +6704,8 @@ static const void *lt_preloaded_setup() {
>    _LT_EOF
>    	  # Now try linking the two files.
>    	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -4541,7 +4541,7 @@ index 5f8c8493589..998727b6108 100755
>    	  LIBS="conftstm.$ac_objext"
>    	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>    	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6390,8 +6717,8 @@ _LT_EOF
> +@@ -6388,8 +6715,8 @@ _LT_EOF
>      test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>    	    pipe_works=yes
>    	  fi
> @@ -4552,7 +4552,7 @@ index 5f8c8493589..998727b6108 100755
>    	else
>    	  echo "cannot find nm_test_func in $nlist" >&5
>    	fi
> -@@ -6428,6 +6755,19 @@ else
> +@@ -6426,6 +6753,19 @@ else
>    $as_echo "ok" >&6; }
>    fi
>    
> @@ -4572,7 +4572,7 @@ index 5f8c8493589..998727b6108 100755
>    
>    
>    
> -@@ -6444,6 +6784,42 @@ fi
> +@@ -6442,6 +6782,42 @@ fi
>    
>    
>    
> @@ -4615,7 +4615,7 @@ index 5f8c8493589..998727b6108 100755
>    
>    
>    
> -@@ -6655,6 +7031,123 @@ esac
> +@@ -6653,6 +7029,123 @@ esac
>    
>    need_locks="$enable_libtool_lock"
>    
> @@ -4739,7 +4739,7 @@ index 5f8c8493589..998727b6108 100755
>    
>      case $host_os in
>        rhapsody* | darwin*)
> -@@ -7218,6 +7711,8 @@ _LT_EOF
> +@@ -7216,6 +7709,8 @@ _LT_EOF
>          $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>          echo "$AR cru libconftest.a conftest.o" >&5
>          $AR cru libconftest.a conftest.o 2>&5
> @@ -4748,7 +4748,7 @@ index 5f8c8493589..998727b6108 100755
>          cat > conftest.c << _LT_EOF
>    int main() { return 0;}
>    _LT_EOF
> -@@ -7802,8 +8297,6 @@ fi
> +@@ -7800,8 +8295,6 @@ fi
>    lt_prog_compiler_pic=
>    lt_prog_compiler_static=
>    
> @@ -4757,7 +4757,7 @@ index 5f8c8493589..998727b6108 100755
>    
>      if test "$GCC" = yes; then
>        lt_prog_compiler_wl='-Wl,'
> -@@ -7969,6 +8462,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7967,6 +8460,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>    	lt_prog_compiler_pic='--shared'
>    	lt_prog_compiler_static='--static'
>    	;;
> @@ -4770,7 +4770,7 @@ index 5f8c8493589..998727b6108 100755
>          pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>            # Portland Group compilers (*not* the Pentium gcc compiler,
>    	# which looks to be a dead project)
> -@@ -8031,7 +8530,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8029,7 +8528,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>          lt_prog_compiler_pic='-KPIC'
>          lt_prog_compiler_static='-Bstatic'
>          case $cc_basename in
> @@ -4779,7 +4779,7 @@ index 5f8c8493589..998727b6108 100755
>    	lt_prog_compiler_wl='-Qoption ld ';;
>          *)
>    	lt_prog_compiler_wl='-Wl,';;
> -@@ -8088,13 +8587,17 @@ case $host_os in
> +@@ -8086,13 +8585,17 @@ case $host_os in
>        lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>        ;;
>    esac
> @@ -4803,7 +4803,7 @@ index 5f8c8493589..998727b6108 100755
>    
>    #
>    # Check to make sure the PIC flag actually works.
> -@@ -8155,6 +8658,11 @@ fi
> +@@ -8153,6 +8656,11 @@ fi
>    
>    
>    
> @@ -4815,7 +4815,7 @@ index 5f8c8493589..998727b6108 100755
>    #
>    # Check to make sure the static flag actually works.
>    #
> -@@ -8505,7 +9013,8 @@ _LT_EOF
> +@@ -8503,7 +9011,8 @@ _LT_EOF
>          allow_undefined_flag=unsupported
>          always_export_symbols=no
>          enable_shared_with_static_runtimes=yes
> @@ -4825,7 +4825,7 @@ index 5f8c8493589..998727b6108 100755
>    
>          if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>            archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -8604,12 +9113,12 @@ _LT_EOF
> +@@ -8602,12 +9111,12 @@ _LT_EOF
>    	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>    	  hardcode_libdir_flag_spec=
>    	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -4840,7 +4840,7 @@ index 5f8c8493589..998727b6108 100755
>    	  fi
>    	  ;;
>    	esac
> -@@ -8623,8 +9132,8 @@ _LT_EOF
> +@@ -8621,8 +9130,8 @@ _LT_EOF
>    	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>    	wlarc=
>          else
> @@ -4851,7 +4851,7 @@ index 5f8c8493589..998727b6108 100755
>          fi
>          ;;
>    
> -@@ -8642,8 +9151,8 @@ _LT_EOF
> +@@ -8640,8 +9149,8 @@ _LT_EOF
>    
>    _LT_EOF
>          elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -4862,7 +4862,7 @@ index 5f8c8493589..998727b6108 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -8689,8 +9198,8 @@ _LT_EOF
> +@@ -8687,8 +9196,8 @@ _LT_EOF
>    
>        *)
>          if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -4873,7 +4873,7 @@ index 5f8c8493589..998727b6108 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -8820,7 +9329,13 @@ _LT_EOF
> +@@ -8818,7 +9327,13 @@ _LT_EOF
>    	allow_undefined_flag='-berok'
>            # Determine the default libpath from the value encoded in an
>            # empty executable.
> @@ -4888,7 +4888,7 @@ index 5f8c8493589..998727b6108 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -8833,22 +9348,29 @@ main ()
> +@@ -8831,22 +9346,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -4931,7 +4931,7 @@ index 5f8c8493589..998727b6108 100755
>    
>            hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>            archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -8860,7 +9382,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8858,7 +9380,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	else
>    	 # Determine the default libpath from the value encoded in an
>    	 # empty executable.
> @@ -4946,7 +4946,7 @@ index 5f8c8493589..998727b6108 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -8873,22 +9401,29 @@ main ()
> +@@ -8871,22 +9399,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -4989,7 +4989,7 @@ index 5f8c8493589..998727b6108 100755
>    
>    	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>    	  # Warning - without using the other run time loading flags,
> -@@ -8933,20 +9468,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8931,20 +9466,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>          # Microsoft Visual C++.
>          # hardcode_libdir_flag_spec is actually meaningless, as there is
>          # no search path for DLLs.
> @@ -5067,7 +5067,7 @@ index 5f8c8493589..998727b6108 100755
>          ;;
>    
>        darwin* | rhapsody*)
> -@@ -9007,7 +9585,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9005,7 +9583,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>        freebsd* | dragonfly*)
> @@ -5076,7 +5076,7 @@ index 5f8c8493589..998727b6108 100755
>          hardcode_libdir_flag_spec='-R$libdir'
>          hardcode_direct=yes
>          hardcode_shlibpath_var=no
> -@@ -9015,7 +9593,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9013,7 +9591,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux9*)
>          if test "$GCC" = yes; then
> @@ -5085,7 +5085,7 @@ index 5f8c8493589..998727b6108 100755
>          else
>    	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>          fi
> -@@ -9031,7 +9609,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9029,7 +9607,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux10*)
>          if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -5094,7 +5094,7 @@ index 5f8c8493589..998727b6108 100755
>          else
>    	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>          fi
> -@@ -9055,10 +9633,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9053,10 +9631,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
>    	  ;;
>    	ia64*)
> @@ -5107,7 +5107,7 @@ index 5f8c8493589..998727b6108 100755
>    	  ;;
>    	esac
>          else
> -@@ -9137,23 +9715,36 @@ fi
> +@@ -9135,23 +9713,36 @@ fi
>    
>        irix5* | irix6* | nonstopux*)
>          if test "$GCC" = yes; then
> @@ -5152,7 +5152,7 @@ index 5f8c8493589..998727b6108 100755
>          else
>    	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>    	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9238,7 +9829,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9236,7 +9827,7 @@ rm -f core conftest.err conftest.$ac_objext \
>        osf4* | osf5*)	# as osf3* with the addition of -msym flag
>          if test "$GCC" = yes; then
>    	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -5161,7 +5161,7 @@ index 5f8c8493589..998727b6108 100755
>    	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>          else
>    	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9257,9 +9848,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9255,9 +9846,9 @@ rm -f core conftest.err conftest.$ac_objext \
>          no_undefined_flag=' -z defs'
>          if test "$GCC" = yes; then
>    	wlarc='${wl}'
> @@ -5173,7 +5173,7 @@ index 5f8c8493589..998727b6108 100755
>          else
>    	case `$CC -V 2>&1` in
>    	*"Compilers 5.0"*)
> -@@ -9835,8 +10426,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9833,8 +10424,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>      need_version=no
>      need_lib_prefix=no
>    
> @@ -5185,7 +5185,7 @@ index 5f8c8493589..998727b6108 100755
>        library_names_spec='$libname.dll.a'
>        # DLL is installed to $(libdir)/../bin by postinstall_cmds
>        postinstall_cmds='base_file=`basename \${file}`~
> -@@ -9869,13 +10461,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9867,13 +10459,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>          library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>          ;;
>        esac
> @@ -5258,16 +5258,16 @@ index 5f8c8493589..998727b6108 100755
>      # FIXME: first we should search . and the directory the executable is in
>      shlibpath_var=PATH
>      ;;
> -@@ -10777,7 +11427,7 @@ else
> +@@ -10775,7 +11425,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 10780 "configure"
> +-#line 10778 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -10821,10 +11471,10 @@ else
> +@@ -10819,10 +11469,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -5280,16 +5280,16 @@ index 5f8c8493589..998727b6108 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -10883,7 +11533,7 @@ else
> +@@ -10881,7 +11531,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 10886 "configure"
> +-#line 10884 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -10927,10 +11577,10 @@ else
> +@@ -10925,10 +11575,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -5302,7 +5302,7 @@ index 5f8c8493589..998727b6108 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -17080,13 +17730,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -17078,13 +17728,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>    lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>    lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>    lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -5323,7 +5323,7 @@ index 5f8c8493589..998727b6108 100755
>    STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>    RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>    old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -17101,14 +17758,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -17099,14 +17756,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>    lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -5342,7 +5342,7 @@ index 5f8c8493589..998727b6108 100755
>    DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>    NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>    LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -17141,12 +17801,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -17139,12 +17799,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>    hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>    inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>    link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -5356,7 +5356,7 @@ index 5f8c8493589..998727b6108 100755
>    file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>    variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>    need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -17201,8 +17861,13 @@ reload_flag \
> +@@ -17199,8 +17859,13 @@ reload_flag \
>    OBJDUMP \
>    deplibs_check_method \
>    file_magic_cmd \
> @@ -5370,7 +5370,7 @@ index 5f8c8493589..998727b6108 100755
>    STRIP \
>    RANLIB \
>    CC \
> -@@ -17212,12 +17877,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -17210,12 +17875,14 @@ lt_cv_sys_global_symbol_pipe \
>    lt_cv_sys_global_symbol_to_cdecl \
>    lt_cv_sys_global_symbol_to_c_name_address \
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -5386,7 +5386,7 @@ index 5f8c8493589..998727b6108 100755
>    DSYMUTIL \
>    NMEDIT \
>    LIPO \
> -@@ -17233,7 +17900,6 @@ no_undefined_flag \
> +@@ -17231,7 +17898,6 @@ no_undefined_flag \
>    hardcode_libdir_flag_spec \
>    hardcode_libdir_flag_spec_ld \
>    hardcode_libdir_separator \
> @@ -5394,7 +5394,7 @@ index 5f8c8493589..998727b6108 100755
>    exclude_expsyms \
>    include_expsyms \
>    file_list_spec \
> -@@ -17269,6 +17935,7 @@ module_cmds \
> +@@ -17267,6 +17933,7 @@ module_cmds \
>    module_expsym_cmds \
>    export_symbols_cmds \
>    prelink_cmds \
> @@ -5402,7 +5402,7 @@ index 5f8c8493589..998727b6108 100755
>    postinstall_cmds \
>    postuninstall_cmds \
>    finish_cmds \
> -@@ -18049,7 +18716,8 @@ $as_echo X"$file" |
> +@@ -18047,7 +18714,8 @@ $as_echo X"$file" |
>    # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>    #
>    #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -5412,7 +5412,7 @@ index 5f8c8493589..998727b6108 100755
>    #   Written by Gordon Matzigkeit, 1996
>    #
>    #   This file is part of GNU Libtool.
> -@@ -18152,19 +18820,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -18150,19 +18818,42 @@ SP2NL=$lt_lt_SP2NL
>    # turn newlines into spaces.
>    NL2SP=$lt_lt_NL2SP
>    
> @@ -5456,7 +5456,7 @@ index 5f8c8493589..998727b6108 100755
>    # A symbol stripping program.
>    STRIP=$lt_STRIP
>    
> -@@ -18194,6 +18885,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -18192,6 +18883,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>    # Transform the output of nm in a C name address pair when lib prefix is needed.
>    global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>    
> @@ -5469,7 +5469,7 @@ index 5f8c8493589..998727b6108 100755
>    # The name of the directory that contains temporary libtool files.
>    objdir=$objdir
>    
> -@@ -18203,6 +18900,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -18201,6 +18898,9 @@ MAGIC_CMD=$MAGIC_CMD
>    # Must we lock files when doing compilation?
>    need_locks=$lt_need_locks
>    
> @@ -5479,7 +5479,7 @@ index 5f8c8493589..998727b6108 100755
>    # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>    DSYMUTIL=$lt_DSYMUTIL
>    
> -@@ -18317,12 +19017,12 @@ with_gcc=$GCC
> +@@ -18315,12 +19015,12 @@ with_gcc=$GCC
>    # Compiler flag to turn off builtin functions.
>    no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>    
> @@ -5495,7 +5495,7 @@ index 5f8c8493589..998727b6108 100755
>    # Compiler flag to prevent dynamic linking.
>    link_static_flag=$lt_lt_prog_compiler_static
>    
> -@@ -18409,9 +19109,6 @@ inherit_rpath=$inherit_rpath
> +@@ -18407,9 +19107,6 @@ inherit_rpath=$inherit_rpath
>    # Whether libtool must link a program against all its dependency libraries.
>    link_all_deplibs=$link_all_deplibs
>    
> @@ -5505,7 +5505,7 @@ index 5f8c8493589..998727b6108 100755
>    # Set to "yes" if exported symbols are required.
>    always_export_symbols=$always_export_symbols
>    
> -@@ -18427,6 +19124,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -18425,6 +19122,9 @@ include_expsyms=$lt_include_expsyms
>    # Commands necessary for linking programs (against libraries) with templates.
>    prelink_cmds=$lt_prelink_cmds
>    
> @@ -5515,7 +5515,7 @@ index 5f8c8493589..998727b6108 100755
>    # Specify filename containing input files.
>    file_list_spec=$lt_file_list_spec
>    
> -@@ -18459,210 +19159,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -18457,210 +19157,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>      # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>      # text mode, it properly converts lines to CR/LF.  This bash problem
>      # is reportedly fixed, but why not run on old versions too?
> @@ -5918,7 +5918,7 @@ index a7398231030..fc7a3d78db0 100644
>    ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
>    am__include = @am__include@
>   diff --git a/gprof/configure b/gprof/configure
> -index 2d62b6fbb07..0cafee249eb 100755
> +index e3c86d3f1ed..e5e6edbe821 100755
>   --- a/gprof/configure
>   +++ b/gprof/configure
>   @@ -669,8 +669,11 @@ OTOOL
> @@ -5950,7 +5950,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    
>    Some influential environment variables:
>      CC          C compiler command
> -@@ -4530,8 +4536,8 @@ esac
> +@@ -4528,8 +4534,8 @@ esac
>    
>    
>    
> @@ -5961,7 +5961,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    
>    
>    
> -@@ -4571,7 +4577,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4569,7 +4575,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>    $as_echo_n "checking how to print strings... " >&6; }
>    # Test print first, because it will be a builtin if present.
> @@ -5970,7 +5970,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>       test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>      ECHO='print -r --'
>    elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5264,8 +5270,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5262,8 +5268,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>    # Try some XSI features
>    xsi_shell=no
>    ( _lt_dummy="a/b/c"
> @@ -5981,7 +5981,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>        && eval 'test $(( 1 + 1 )) -eq 2 \
>        && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>      && xsi_shell=yes
> -@@ -5314,6 +5320,80 @@ esac
> +@@ -5312,6 +5318,80 @@ esac
>    
>    
>    
> @@ -6062,7 +6062,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>    $as_echo_n "checking for $LD option to reload object files... " >&6; }
>    if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5330,6 +5410,11 @@ case $reload_flag in
> +@@ -5328,6 +5408,11 @@ case $reload_flag in
>    esac
>    reload_cmds='$LD$reload_flag -o $output$reload_objs'
>    case $host_os in
> @@ -6074,7 +6074,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>      darwin*)
>        if test "$GCC" = yes; then
>          reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -5498,7 +5583,8 @@ mingw* | pw32*)
> +@@ -5496,7 +5581,8 @@ mingw* | pw32*)
>        lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>        lt_cv_file_magic_cmd='func_win32_libid'
>      else
> @@ -6084,7 +6084,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>        lt_cv_file_magic_cmd='$OBJDUMP -f'
>      fi
>      ;;
> -@@ -5657,6 +5743,21 @@ esac
> +@@ -5655,6 +5741,21 @@ esac
>    fi
>    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>    $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -6106,7 +6106,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    file_magic_cmd=$lt_cv_file_magic_cmd
>    deplibs_check_method=$lt_cv_deplibs_check_method
>    test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -5672,6 +5773,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -5670,6 +5771,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>    
>    
>    
> @@ -6264,7 +6264,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    plugin_option=
>    plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>    for plugin in $plugin_names; do
> -@@ -5686,8 +5938,10 @@ for plugin in $plugin_names; do
> +@@ -5684,8 +5936,10 @@ for plugin in $plugin_names; do
>    done
>    
>    if test -n "$ac_tool_prefix"; then
> @@ -6277,7 +6277,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_AR+:} false; then :
> -@@ -5703,7 +5957,7 @@ do
> +@@ -5701,7 +5955,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -6286,7 +6286,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -5723,11 +5977,15 @@ $as_echo "no" >&6; }
> +@@ -5721,11 +5975,15 @@ $as_echo "no" >&6; }
>    fi
>    
>    
> @@ -6305,7 +6305,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -5743,7 +6001,7 @@ do
> +@@ -5741,7 +5999,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -6314,7 +6314,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -5762,6 +6020,10 @@ else
> +@@ -5760,6 +6018,10 @@ else
>    $as_echo "no" >&6; }
>    fi
>    
> @@ -6325,7 +6325,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>      if test "x$ac_ct_AR" = x; then
>        AR="false"
>      else
> -@@ -5773,25 +6035,19 @@ ac_tool_warned=yes ;;
> +@@ -5771,25 +6033,19 @@ ac_tool_warned=yes ;;
>    esac
>        AR=$ac_ct_AR
>      fi
> @@ -6360,7 +6360,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    
>    
>    
> -@@ -5803,6 +6059,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -5801,6 +6057,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>    
>    
>    
> @@ -6425,7 +6425,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    if test -n "$ac_tool_prefix"; then
>      # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
>    set dummy ${ac_tool_prefix}strip; ac_word=$2
> -@@ -6142,8 +6456,8 @@ esac
> +@@ -6140,8 +6454,8 @@ esac
>    lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>    
>    # Transform an extracted symbol line into symbol name and symbol address
> @@ -6436,7 +6436,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    
>    # Handle CRLF in mingw tool chain
>    opt_cr=
> -@@ -6179,6 +6493,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6177,6 +6491,7 @@ for ac_symprfx in "" "_"; do
>      else
>        lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>      fi
> @@ -6444,7 +6444,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    
>      # Check to see that the pipe works correctly.
>      pipe_works=no
> -@@ -6220,6 +6535,18 @@ _LT_EOF
> +@@ -6218,6 +6533,18 @@ _LT_EOF
>          if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>    	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>    	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -6463,7 +6463,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    #ifdef __cplusplus
>    extern "C" {
>    #endif
> -@@ -6231,7 +6558,7 @@ _LT_EOF
> +@@ -6229,7 +6556,7 @@ _LT_EOF
>    	  cat <<_LT_EOF >> conftest.$ac_ext
>    
>    /* The mapping between symbol names and symbols.  */
> @@ -6472,7 +6472,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>      const char *name;
>      void       *address;
>    }
> -@@ -6257,8 +6584,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6255,8 +6582,8 @@ static const void *lt_preloaded_setup() {
>    _LT_EOF
>    	  # Now try linking the two files.
>    	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -6483,7 +6483,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    	  LIBS="conftstm.$ac_objext"
>    	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>    	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6268,8 +6595,8 @@ _LT_EOF
> +@@ -6266,8 +6593,8 @@ _LT_EOF
>      test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>    	    pipe_works=yes
>    	  fi
> @@ -6494,7 +6494,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    	else
>    	  echo "cannot find nm_test_func in $nlist" >&5
>    	fi
> -@@ -6306,6 +6633,18 @@ else
> +@@ -6304,6 +6631,18 @@ else
>    $as_echo "ok" >&6; }
>    fi
>    
> @@ -6513,7 +6513,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    
>    
>    
> -@@ -6322,6 +6661,43 @@ fi
> +@@ -6320,6 +6659,43 @@ fi
>    
>    
>    
> @@ -6557,7 +6557,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    
>    
>    
> -@@ -6533,6 +6909,123 @@ esac
> +@@ -6531,6 +6907,123 @@ esac
>    
>    need_locks="$enable_libtool_lock"
>    
> @@ -6681,7 +6681,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    
>      case $host_os in
>        rhapsody* | darwin*)
> -@@ -7096,6 +7589,8 @@ _LT_EOF
> +@@ -7094,6 +7587,8 @@ _LT_EOF
>          $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>          echo "$AR cru libconftest.a conftest.o" >&5
>          $AR cru libconftest.a conftest.o 2>&5
> @@ -6690,7 +6690,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>          cat > conftest.c << _LT_EOF
>    int main() { return 0;}
>    _LT_EOF
> -@@ -7680,8 +8175,6 @@ fi
> +@@ -7678,8 +8173,6 @@ fi
>    lt_prog_compiler_pic=
>    lt_prog_compiler_static=
>    
> @@ -6699,7 +6699,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    
>      if test "$GCC" = yes; then
>        lt_prog_compiler_wl='-Wl,'
> -@@ -7847,6 +8340,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7845,6 +8338,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>    	lt_prog_compiler_pic='--shared'
>    	lt_prog_compiler_static='--static'
>    	;;
> @@ -6712,7 +6712,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>          pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>            # Portland Group compilers (*not* the Pentium gcc compiler,
>    	# which looks to be a dead project)
> -@@ -7909,7 +8408,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7907,7 +8406,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>          lt_prog_compiler_pic='-KPIC'
>          lt_prog_compiler_static='-Bstatic'
>          case $cc_basename in
> @@ -6721,7 +6721,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    	lt_prog_compiler_wl='-Qoption ld ';;
>          *)
>    	lt_prog_compiler_wl='-Wl,';;
> -@@ -7966,13 +8465,17 @@ case $host_os in
> +@@ -7964,13 +8463,17 @@ case $host_os in
>        lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>        ;;
>    esac
> @@ -6745,7 +6745,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    
>    #
>    # Check to make sure the PIC flag actually works.
> -@@ -8033,6 +8536,11 @@ fi
> +@@ -8031,6 +8534,11 @@ fi
>    
>    
>    
> @@ -6757,7 +6757,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    #
>    # Check to make sure the static flag actually works.
>    #
> -@@ -8383,7 +8891,8 @@ _LT_EOF
> +@@ -8381,7 +8889,8 @@ _LT_EOF
>          allow_undefined_flag=unsupported
>          always_export_symbols=no
>          enable_shared_with_static_runtimes=yes
> @@ -6767,7 +6767,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    
>          if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>            archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -8482,12 +8991,12 @@ _LT_EOF
> +@@ -8480,12 +8989,12 @@ _LT_EOF
>    	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>    	  hardcode_libdir_flag_spec=
>    	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -6782,7 +6782,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    	  fi
>    	  ;;
>    	esac
> -@@ -8501,8 +9010,8 @@ _LT_EOF
> +@@ -8499,8 +9008,8 @@ _LT_EOF
>    	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>    	wlarc=
>          else
> @@ -6793,7 +6793,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>          fi
>          ;;
>    
> -@@ -8520,8 +9029,8 @@ _LT_EOF
> +@@ -8518,8 +9027,8 @@ _LT_EOF
>    
>    _LT_EOF
>          elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -6804,7 +6804,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -8567,8 +9076,8 @@ _LT_EOF
> +@@ -8565,8 +9074,8 @@ _LT_EOF
>    
>        *)
>          if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -6815,7 +6815,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -8698,7 +9207,13 @@ _LT_EOF
> +@@ -8696,7 +9205,13 @@ _LT_EOF
>    	allow_undefined_flag='-berok'
>            # Determine the default libpath from the value encoded in an
>            # empty executable.
> @@ -6830,7 +6830,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -8711,22 +9226,29 @@ main ()
> +@@ -8709,22 +9224,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -6873,7 +6873,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    
>            hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>            archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -8738,7 +9260,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8736,7 +9258,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	else
>    	 # Determine the default libpath from the value encoded in an
>    	 # empty executable.
> @@ -6888,7 +6888,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -8751,22 +9279,29 @@ main ()
> +@@ -8749,22 +9277,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -6931,7 +6931,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    
>    	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>    	  # Warning - without using the other run time loading flags,
> -@@ -8811,20 +9346,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8809,20 +9344,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>          # Microsoft Visual C++.
>          # hardcode_libdir_flag_spec is actually meaningless, as there is
>          # no search path for DLLs.
> @@ -7009,7 +7009,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>          ;;
>    
>        darwin* | rhapsody*)
> -@@ -8885,7 +9463,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8883,7 +9461,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>        freebsd* | dragonfly*)
> @@ -7018,7 +7018,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>          hardcode_libdir_flag_spec='-R$libdir'
>          hardcode_direct=yes
>          hardcode_shlibpath_var=no
> -@@ -8893,7 +9471,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8891,7 +9469,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux9*)
>          if test "$GCC" = yes; then
> @@ -7027,7 +7027,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>          else
>    	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>          fi
> -@@ -8909,7 +9487,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8907,7 +9485,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux10*)
>          if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -7036,7 +7036,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>          else
>    	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>          fi
> -@@ -8933,10 +9511,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8931,10 +9509,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
>    	  ;;
>    	ia64*)
> @@ -7049,7 +7049,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    	  ;;
>    	esac
>          else
> -@@ -9015,23 +9593,36 @@ fi
> +@@ -9013,23 +9591,36 @@ fi
>    
>        irix5* | irix6* | nonstopux*)
>          if test "$GCC" = yes; then
> @@ -7094,7 +7094,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>          else
>    	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>    	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9116,7 +9707,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9114,7 +9705,7 @@ rm -f core conftest.err conftest.$ac_objext \
>        osf4* | osf5*)	# as osf3* with the addition of -msym flag
>          if test "$GCC" = yes; then
>    	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -7103,7 +7103,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>          else
>    	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9135,9 +9726,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9133,9 +9724,9 @@ rm -f core conftest.err conftest.$ac_objext \
>          no_undefined_flag=' -z defs'
>          if test "$GCC" = yes; then
>    	wlarc='${wl}'
> @@ -7115,7 +7115,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>          else
>    	case `$CC -V 2>&1` in
>    	*"Compilers 5.0"*)
> -@@ -9713,8 +10304,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9711,8 +10302,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>      need_version=no
>      need_lib_prefix=no
>    
> @@ -7127,7 +7127,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>        library_names_spec='$libname.dll.a'
>        # DLL is installed to $(libdir)/../bin by postinstall_cmds
>        postinstall_cmds='base_file=`basename \${file}`~
> -@@ -9747,13 +10339,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9745,13 +10337,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>          library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>          ;;
>        esac
> @@ -7200,16 +7200,16 @@ index 2d62b6fbb07..0cafee249eb 100755
>      # FIXME: first we should search . and the directory the executable is in
>      shlibpath_var=PATH
>      ;;
> -@@ -10655,7 +11305,7 @@ else
> +@@ -10653,7 +11303,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 10658 "configure"
> +-#line 10656 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -10699,10 +11349,10 @@ else
> +@@ -10697,10 +11347,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -7222,16 +7222,16 @@ index 2d62b6fbb07..0cafee249eb 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -10761,7 +11411,7 @@ else
> +@@ -10759,7 +11409,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 10764 "configure"
> +-#line 10762 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -10805,10 +11455,10 @@ else
> +@@ -10803,10 +11453,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -7244,7 +7244,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -14728,13 +15378,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -14726,13 +15376,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>    lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>    lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>    lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -7265,7 +7265,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>    RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>    old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -14749,14 +15406,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -14747,14 +15404,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>    lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -7284,7 +7284,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>    NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>    LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -14789,12 +15449,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -14787,12 +15447,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>    hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>    inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>    link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -7298,7 +7298,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>    variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>    need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -14849,8 +15509,13 @@ reload_flag \
> +@@ -14847,8 +15507,13 @@ reload_flag \
>    OBJDUMP \
>    deplibs_check_method \
>    file_magic_cmd \
> @@ -7312,7 +7312,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    STRIP \
>    RANLIB \
>    CC \
> -@@ -14860,12 +15525,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -14858,12 +15523,14 @@ lt_cv_sys_global_symbol_pipe \
>    lt_cv_sys_global_symbol_to_cdecl \
>    lt_cv_sys_global_symbol_to_c_name_address \
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -7328,7 +7328,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    DSYMUTIL \
>    NMEDIT \
>    LIPO \
> -@@ -14881,7 +15548,6 @@ no_undefined_flag \
> +@@ -14879,7 +15546,6 @@ no_undefined_flag \
>    hardcode_libdir_flag_spec \
>    hardcode_libdir_flag_spec_ld \
>    hardcode_libdir_separator \
> @@ -7336,7 +7336,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    exclude_expsyms \
>    include_expsyms \
>    file_list_spec \
> -@@ -14917,6 +15583,7 @@ module_cmds \
> +@@ -14915,6 +15581,7 @@ module_cmds \
>    module_expsym_cmds \
>    export_symbols_cmds \
>    prelink_cmds \
> @@ -7344,7 +7344,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    postinstall_cmds \
>    postuninstall_cmds \
>    finish_cmds \
> -@@ -15690,7 +16357,8 @@ $as_echo X"$file" |
> +@@ -15688,7 +16355,8 @@ $as_echo X"$file" |
>    # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>    #
>    #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -7354,7 +7354,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    #   Written by Gordon Matzigkeit, 1996
>    #
>    #   This file is part of GNU Libtool.
> -@@ -15793,19 +16461,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -15791,19 +16459,42 @@ SP2NL=$lt_lt_SP2NL
>    # turn newlines into spaces.
>    NL2SP=$lt_lt_NL2SP
>    
> @@ -7398,7 +7398,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    # A symbol stripping program.
>    STRIP=$lt_STRIP
>    
> -@@ -15835,6 +16526,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -15833,6 +16524,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>    # Transform the output of nm in a C name address pair when lib prefix is needed.
>    global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>    
> @@ -7411,7 +7411,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    # The name of the directory that contains temporary libtool files.
>    objdir=$objdir
>    
> -@@ -15844,6 +16541,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -15842,6 +16539,9 @@ MAGIC_CMD=$MAGIC_CMD
>    # Must we lock files when doing compilation?
>    need_locks=$lt_need_locks
>    
> @@ -7421,7 +7421,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>    DSYMUTIL=$lt_DSYMUTIL
>    
> -@@ -15958,12 +16658,12 @@ with_gcc=$GCC
> +@@ -15956,12 +16656,12 @@ with_gcc=$GCC
>    # Compiler flag to turn off builtin functions.
>    no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>    
> @@ -7437,7 +7437,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    # Compiler flag to prevent dynamic linking.
>    link_static_flag=$lt_lt_prog_compiler_static
>    
> -@@ -16050,9 +16750,6 @@ inherit_rpath=$inherit_rpath
> +@@ -16048,9 +16748,6 @@ inherit_rpath=$inherit_rpath
>    # Whether libtool must link a program against all its dependency libraries.
>    link_all_deplibs=$link_all_deplibs
>    
> @@ -7447,7 +7447,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    # Set to "yes" if exported symbols are required.
>    always_export_symbols=$always_export_symbols
>    
> -@@ -16068,6 +16765,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -16066,6 +16763,9 @@ include_expsyms=$lt_include_expsyms
>    # Commands necessary for linking programs (against libraries) with templates.
>    prelink_cmds=$lt_prelink_cmds
>    
> @@ -7457,7 +7457,7 @@ index 2d62b6fbb07..0cafee249eb 100755
>    # Specify filename containing input files.
>    file_list_spec=$lt_file_list_spec
>    
> -@@ -16100,210 +16800,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -16098,210 +16798,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>      # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>      # text mode, it properly converts lines to CR/LF.  This bash problem
>      # is reportedly fixed, but why not run on old versions too?
> @@ -7832,10 +7832,10 @@ index 2d62b6fbb07..0cafee249eb 100755
>      chmod +x "$ofile"
>    
>   diff --git a/gprofng/Makefile.in b/gprofng/Makefile.in
> -index dbc868191b7..1ca6dd01f58 100644
> +index 5ced0e012eb..e6174273972 100644
>   --- a/gprofng/Makefile.in
>   +++ b/gprofng/Makefile.in
> -@@ -253,6 +253,7 @@ CXXFLAGS = @CXXFLAGS@
> +@@ -254,6 +254,7 @@ CXXFLAGS = @CXXFLAGS@
>    CYGPATH_W = @CYGPATH_W@
>    DEFS = @DEFS@
>    DEPDIR = @DEPDIR@
> @@ -7843,7 +7843,7 @@ index dbc868191b7..1ca6dd01f58 100644
>    DSYMUTIL = @DSYMUTIL@
>    DUMPBIN = @DUMPBIN@
>    ECHO_C = @ECHO_C@
> -@@ -289,6 +290,7 @@ LN_S = @LN_S@
> +@@ -290,6 +291,7 @@ LN_S = @LN_S@
>    LTLIBOBJS = @LTLIBOBJS@
>    MAINT = @MAINT@
>    MAKEINFO = @MAKEINFO@
> @@ -7852,10 +7852,10 @@ index dbc868191b7..1ca6dd01f58 100644
>    NM = @NM@
>    NMEDIT = @NMEDIT@
>   diff --git a/gprofng/configure b/gprofng/configure
> -index bdfa2281f2c..b6376eb3f77 100755
> +index cf3e9c3d0db..56e99cbe272 100755
>   --- a/gprofng/configure
>   +++ b/gprofng/configure
> -@@ -671,6 +671,8 @@ OTOOL
> +@@ -672,6 +672,8 @@ OTOOL
>    LIPO
>    NMEDIT
>    DSYMUTIL
> @@ -7864,7 +7864,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    OBJDUMP
>    LN_S
>    NM
> -@@ -801,6 +803,7 @@ enable_static
> +@@ -802,6 +804,7 @@ enable_static
>    with_pic
>    enable_fast_install
>    with_gnu_ld
> @@ -7872,7 +7872,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    enable_libtool_lock
>    enable_werror_always
>    enable_gprofng_tools
> -@@ -1464,6 +1467,8 @@ Optional Packages:
> +@@ -1465,6 +1468,8 @@ Optional Packages:
>      --with-pic              try to use only PIC/non-PIC objects [default=use
>                              both]
>      --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -7881,7 +7881,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>      --with-jdk=PATH         specify prefix directory for installed JDK.
>      --with-system-zlib      use installed libz
>    
> -@@ -6152,8 +6157,8 @@ esac
> +@@ -6153,8 +6158,8 @@ esac
>    
>    
>    
> @@ -7892,7 +7892,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>    
>    
> -@@ -6193,7 +6198,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -6194,7 +6199,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>    $as_echo_n "checking how to print strings... " >&6; }
>    # Test print first, because it will be a builtin if present.
> @@ -7901,7 +7901,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>       test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>      ECHO='print -r --'
>    elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6886,8 +6891,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -6887,8 +6892,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>    # Try some XSI features
>    xsi_shell=no
>    ( _lt_dummy="a/b/c"
> @@ -7912,7 +7912,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>        && eval 'test $(( 1 + 1 )) -eq 2 \
>        && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>      && xsi_shell=yes
> -@@ -6936,6 +6941,80 @@ esac
> +@@ -6937,6 +6942,80 @@ esac
>    
>    
>    
> @@ -7993,7 +7993,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>    $as_echo_n "checking for $LD option to reload object files... " >&6; }
>    if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6952,6 +7031,11 @@ case $reload_flag in
> +@@ -6953,6 +7032,11 @@ case $reload_flag in
>    esac
>    reload_cmds='$LD$reload_flag -o $output$reload_objs'
>    case $host_os in
> @@ -8005,7 +8005,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>      darwin*)
>        if test "$GCC" = yes; then
>          reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -7120,7 +7204,8 @@ mingw* | pw32*)
> +@@ -7121,7 +7205,8 @@ mingw* | pw32*)
>        lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>        lt_cv_file_magic_cmd='func_win32_libid'
>      else
> @@ -8015,7 +8015,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>        lt_cv_file_magic_cmd='$OBJDUMP -f'
>      fi
>      ;;
> -@@ -7279,6 +7364,21 @@ esac
> +@@ -7280,6 +7365,21 @@ esac
>    fi
>    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>    $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -8037,7 +8037,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    file_magic_cmd=$lt_cv_file_magic_cmd
>    deplibs_check_method=$lt_cv_deplibs_check_method
>    test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -7294,6 +7394,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -7295,6 +7395,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>    
>    
>    
> @@ -8195,7 +8195,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    plugin_option=
>    plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>    for plugin in $plugin_names; do
> -@@ -7308,8 +7559,10 @@ for plugin in $plugin_names; do
> +@@ -7309,8 +7560,10 @@ for plugin in $plugin_names; do
>    done
>    
>    if test -n "$ac_tool_prefix"; then
> @@ -8208,7 +8208,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_AR+:} false; then :
> -@@ -7325,7 +7578,7 @@ do
> +@@ -7326,7 +7579,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -8217,7 +8217,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -7345,11 +7598,15 @@ $as_echo "no" >&6; }
> +@@ -7346,11 +7599,15 @@ $as_echo "no" >&6; }
>    fi
>    
>    
> @@ -8236,7 +8236,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -7365,7 +7622,7 @@ do
> +@@ -7366,7 +7623,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -8245,7 +8245,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -7384,6 +7641,10 @@ else
> +@@ -7385,6 +7642,10 @@ else
>    $as_echo "no" >&6; }
>    fi
>    
> @@ -8256,7 +8256,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>      if test "x$ac_ct_AR" = x; then
>        AR="false"
>      else
> -@@ -7395,25 +7656,19 @@ ac_tool_warned=yes ;;
> +@@ -7396,25 +7657,19 @@ ac_tool_warned=yes ;;
>    esac
>        AR=$ac_ct_AR
>      fi
> @@ -8291,7 +8291,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>    
>    
> -@@ -7425,6 +7680,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -7426,6 +7681,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>    
>    
>    
> @@ -8356,7 +8356,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    if test -n "$ac_tool_prefix"; then
>      # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
>    set dummy ${ac_tool_prefix}strip; ac_word=$2
> -@@ -7764,8 +8077,8 @@ esac
> +@@ -7765,8 +8078,8 @@ esac
>    lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>    
>    # Transform an extracted symbol line into symbol name and symbol address
> @@ -8367,7 +8367,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>    # Handle CRLF in mingw tool chain
>    opt_cr=
> -@@ -7801,6 +8114,7 @@ for ac_symprfx in "" "_"; do
> +@@ -7802,6 +8115,7 @@ for ac_symprfx in "" "_"; do
>      else
>        lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>      fi
> @@ -8375,7 +8375,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>      # Check to see that the pipe works correctly.
>      pipe_works=no
> -@@ -7842,6 +8156,18 @@ _LT_EOF
> +@@ -7843,6 +8157,18 @@ _LT_EOF
>          if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>    	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>    	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -8394,7 +8394,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    #ifdef __cplusplus
>    extern "C" {
>    #endif
> -@@ -7853,7 +8179,7 @@ _LT_EOF
> +@@ -7854,7 +8180,7 @@ _LT_EOF
>    	  cat <<_LT_EOF >> conftest.$ac_ext
>    
>    /* The mapping between symbol names and symbols.  */
> @@ -8403,7 +8403,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>      const char *name;
>      void       *address;
>    }
> -@@ -7879,8 +8205,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7880,8 +8206,8 @@ static const void *lt_preloaded_setup() {
>    _LT_EOF
>    	  # Now try linking the two files.
>    	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -8414,7 +8414,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    	  LIBS="conftstm.$ac_objext"
>    	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>    	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7890,8 +8216,8 @@ _LT_EOF
> +@@ -7891,8 +8217,8 @@ _LT_EOF
>      test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>    	    pipe_works=yes
>    	  fi
> @@ -8425,7 +8425,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    	else
>    	  echo "cannot find nm_test_func in $nlist" >&5
>    	fi
> -@@ -7928,6 +8254,14 @@ else
> +@@ -7929,6 +8255,14 @@ else
>    $as_echo "ok" >&6; }
>    fi
>    
> @@ -8440,7 +8440,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>    
>    
> -@@ -7946,6 +8280,47 @@ fi
> +@@ -7947,6 +8281,47 @@ fi
>    
>    
>    
> @@ -8488,7 +8488,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>    
>    
> -@@ -8155,6 +8530,123 @@ esac
> +@@ -8156,6 +8531,123 @@ esac
>    
>    need_locks="$enable_libtool_lock"
>    
> @@ -8612,7 +8612,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>      case $host_os in
>        rhapsody* | darwin*)
> -@@ -8718,6 +9210,8 @@ _LT_EOF
> +@@ -8719,6 +9211,8 @@ _LT_EOF
>          $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>          echo "$AR cru libconftest.a conftest.o" >&5
>          $AR cru libconftest.a conftest.o 2>&5
> @@ -8621,7 +8621,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>          cat > conftest.c << _LT_EOF
>    int main() { return 0;}
>    _LT_EOF
> -@@ -8788,6 +9282,16 @@ done
> +@@ -8789,6 +9283,16 @@ done
>    
>    
>    
> @@ -8638,7 +8638,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>    
>    # Set options
> -@@ -9273,8 +9777,6 @@ fi
> +@@ -9274,8 +9778,6 @@ fi
>    lt_prog_compiler_pic=
>    lt_prog_compiler_static=
>    
> @@ -8647,7 +8647,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>      if test "$GCC" = yes; then
>        lt_prog_compiler_wl='-Wl,'
> -@@ -9440,6 +9942,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -9441,6 +9943,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>    	lt_prog_compiler_pic='--shared'
>    	lt_prog_compiler_static='--static'
>    	;;
> @@ -8660,7 +8660,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>          pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>            # Portland Group compilers (*not* the Pentium gcc compiler,
>    	# which looks to be a dead project)
> -@@ -9502,7 +10010,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -9503,7 +10011,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>          lt_prog_compiler_pic='-KPIC'
>          lt_prog_compiler_static='-Bstatic'
>          case $cc_basename in
> @@ -8669,7 +8669,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    	lt_prog_compiler_wl='-Qoption ld ';;
>          *)
>    	lt_prog_compiler_wl='-Wl,';;
> -@@ -9559,13 +10067,17 @@ case $host_os in
> +@@ -9560,13 +10068,17 @@ case $host_os in
>        lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>        ;;
>    esac
> @@ -8693,7 +8693,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>    #
>    # Check to make sure the PIC flag actually works.
> -@@ -9626,6 +10138,11 @@ fi
> +@@ -9627,6 +10139,11 @@ fi
>    
>    
>    
> @@ -8705,7 +8705,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    #
>    # Check to make sure the static flag actually works.
>    #
> -@@ -9976,7 +10493,8 @@ _LT_EOF
> +@@ -9977,7 +10494,8 @@ _LT_EOF
>          allow_undefined_flag=unsupported
>          always_export_symbols=no
>          enable_shared_with_static_runtimes=yes
> @@ -8715,7 +8715,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>          if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>            archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -10075,12 +10593,12 @@ _LT_EOF
> +@@ -10076,12 +10594,12 @@ _LT_EOF
>    	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>    	  hardcode_libdir_flag_spec=
>    	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -8730,7 +8730,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    	  fi
>    	  ;;
>    	esac
> -@@ -10094,8 +10612,8 @@ _LT_EOF
> +@@ -10095,8 +10613,8 @@ _LT_EOF
>    	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>    	wlarc=
>          else
> @@ -8741,7 +8741,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>          fi
>          ;;
>    
> -@@ -10113,8 +10631,8 @@ _LT_EOF
> +@@ -10114,8 +10632,8 @@ _LT_EOF
>    
>    _LT_EOF
>          elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -8752,7 +8752,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -10160,8 +10678,8 @@ _LT_EOF
> +@@ -10161,8 +10679,8 @@ _LT_EOF
>    
>        *)
>          if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -8763,7 +8763,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -10291,7 +10809,13 @@ _LT_EOF
> +@@ -10292,7 +10810,13 @@ _LT_EOF
>    	allow_undefined_flag='-berok'
>            # Determine the default libpath from the value encoded in an
>            # empty executable.
> @@ -8778,7 +8778,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -10304,22 +10828,29 @@ main ()
> +@@ -10305,22 +10829,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -8821,7 +8821,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>            hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>            archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -10331,7 +10862,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10332,7 +10863,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	else
>    	 # Determine the default libpath from the value encoded in an
>    	 # empty executable.
> @@ -8836,7 +8836,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -10344,22 +10881,29 @@ main ()
> +@@ -10345,22 +10882,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -8879,7 +8879,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>    	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>    	  # Warning - without using the other run time loading flags,
> -@@ -10404,20 +10948,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10405,20 +10949,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>          # Microsoft Visual C++.
>          # hardcode_libdir_flag_spec is actually meaningless, as there is
>          # no search path for DLLs.
> @@ -8957,7 +8957,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>          ;;
>    
>        darwin* | rhapsody*)
> -@@ -10478,7 +11065,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10479,7 +11066,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>        freebsd* | dragonfly*)
> @@ -8966,7 +8966,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>          hardcode_libdir_flag_spec='-R$libdir'
>          hardcode_direct=yes
>          hardcode_shlibpath_var=no
> -@@ -10486,7 +11073,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10487,7 +11074,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux9*)
>          if test "$GCC" = yes; then
> @@ -8975,7 +8975,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>          else
>    	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>          fi
> -@@ -10502,7 +11089,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10503,7 +11090,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux10*)
>          if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -8984,7 +8984,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>          else
>    	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>          fi
> -@@ -10526,10 +11113,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10527,10 +11114,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
>    	  ;;
>    	ia64*)
> @@ -8997,7 +8997,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    	  ;;
>    	esac
>          else
> -@@ -10608,23 +11195,36 @@ fi
> +@@ -10609,23 +11196,36 @@ fi
>    
>        irix5* | irix6* | nonstopux*)
>          if test "$GCC" = yes; then
> @@ -9042,7 +9042,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>          else
>    	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>    	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -10709,7 +11309,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10710,7 +11310,7 @@ rm -f core conftest.err conftest.$ac_objext \
>        osf4* | osf5*)	# as osf3* with the addition of -msym flag
>          if test "$GCC" = yes; then
>    	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -9051,7 +9051,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>          else
>    	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -10728,9 +11328,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10729,9 +11329,9 @@ rm -f core conftest.err conftest.$ac_objext \
>          no_undefined_flag=' -z defs'
>          if test "$GCC" = yes; then
>    	wlarc='${wl}'
> @@ -9063,7 +9063,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>          else
>    	case `$CC -V 2>&1` in
>    	*"Compilers 5.0"*)
> -@@ -11306,8 +11906,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -11307,8 +11907,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>      need_version=no
>      need_lib_prefix=no
>    
> @@ -9075,7 +9075,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>        library_names_spec='$libname.dll.a'
>        # DLL is installed to $(libdir)/../bin by postinstall_cmds
>        postinstall_cmds='base_file=`basename \${file}`~
> -@@ -11340,13 +11941,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -11341,13 +11942,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>          library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>          ;;
>        esac
> @@ -9148,16 +9148,16 @@ index bdfa2281f2c..b6376eb3f77 100755
>      # FIXME: first we should search . and the directory the executable is in
>      shlibpath_var=PATH
>      ;;
> -@@ -12248,7 +12907,7 @@ else
> +@@ -12249,7 +12908,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 12251 "configure"
> +-#line 12252 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -12292,10 +12951,10 @@ else
> +@@ -12293,10 +12952,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -9170,16 +9170,16 @@ index bdfa2281f2c..b6376eb3f77 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12354,7 +13013,7 @@ else
> +@@ -12355,7 +13014,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 12357 "configure"
> +-#line 12358 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -12398,10 +13057,10 @@ else
> +@@ -12399,10 +13058,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -9192,7 +9192,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12793,6 +13452,7 @@ $RM -r conftest*
> +@@ -12794,6 +13453,7 @@ $RM -r conftest*
>    
>      # Allow CC to be a program name with arguments.
>      lt_save_CC=$CC
> @@ -9200,7 +9200,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>      lt_save_LD=$LD
>      lt_save_GCC=$GCC
>      GCC=$GXX
> -@@ -12810,6 +13470,7 @@ $RM -r conftest*
> +@@ -12811,6 +13471,7 @@ $RM -r conftest*
>      fi
>      test -z "${LDCXX+set}" || LD=$LDCXX
>      CC=${CXX-"c++"}
> @@ -9208,7 +9208,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>      compiler=$CC
>      compiler_CXX=$CC
>      for cc_temp in $compiler""; do
> -@@ -13092,7 +13753,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
> +@@ -13093,7 +13754,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
>              allow_undefined_flag_CXX='-berok'
>              # Determine the default libpath from the value encoded in an empty
>              # executable.
> @@ -9223,7 +9223,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -13105,22 +13772,29 @@ main ()
> +@@ -13106,22 +13773,29 @@ main ()
>    _ACEOF
>    if ac_fn_cxx_try_link "$LINENO"; then :
>    
> @@ -9266,7 +9266,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>              hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
>    
> -@@ -13133,7 +13807,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13134,7 +13808,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>              else
>    	    # Determine the default libpath from the value encoded in an
>    	    # empty executable.
> @@ -9281,7 +9281,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -13146,22 +13826,29 @@ main ()
> +@@ -13147,22 +13827,29 @@ main ()
>    _ACEOF
>    if ac_fn_cxx_try_link "$LINENO"; then :
>    
> @@ -9324,7 +9324,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>    	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
>    	    # Warning - without using the other run time loading flags,
> -@@ -13204,29 +13891,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13205,29 +13892,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>            ;;
>    
>          cygwin* | mingw* | pw32* | cegcc*)
> @@ -9423,7 +9423,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>          darwin* | rhapsody*)
>    
>    
> -@@ -13332,7 +14065,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13333,7 +14066,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>                ;;
>              *)
>                if test "$GXX" = yes; then
> @@ -9432,7 +9432,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>                else
>                  # FIXME: insert proper C++ library support
>                  ld_shlibs_CXX=no
> -@@ -13403,10 +14136,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13404,10 +14137,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
>    	            ;;
>    	          ia64*)
> @@ -9445,7 +9445,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    	            ;;
>    	        esac
>    	      fi
> -@@ -13447,9 +14180,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13448,9 +14181,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>              *)
>    	    if test "$GXX" = yes; then
>    	      if test "$with_gnu_ld" = no; then
> @@ -9457,7 +9457,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    	      fi
>    	    fi
>    	    link_all_deplibs_CXX=yes
> -@@ -13727,7 +14460,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13728,7 +14461,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
>    		  ;;
>    	        *)
> @@ -9466,7 +9466,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    		  ;;
>    	      esac
>    
> -@@ -13773,7 +14506,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13774,7 +14507,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>          solaris*)
>            case $cc_basename in
> @@ -9475,7 +9475,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    	    # Sun C++ 4.2, 5.x and Centerline C++
>                archive_cmds_need_lc_CXX=yes
>    	    no_undefined_flag_CXX=' -zdefs'
> -@@ -13814,9 +14547,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13815,9 +14548,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
>    	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
>    	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> @@ -9487,7 +9487,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>    	        # Commands to make compiler produce verbose output that lists
>    	        # what "hidden" libraries, object files and flags are used when
> -@@ -13952,6 +14685,13 @@ private:
> +@@ -13953,6 +14686,13 @@ private:
>    };
>    _LT_EOF
>    
> @@ -9501,7 +9501,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>      (eval $ac_compile) 2>&5
>      ac_status=$?
> -@@ -13965,7 +14705,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13966,7 +14706,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>      pre_test_object_deps_done=no
>    
>      for p in `eval "$output_verbose_link_cmd"`; do
> @@ -9510,7 +9510,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>        -L* | -R* | -l*)
>           # Some compilers place space between "-{L,R}" and the path.
> -@@ -13974,13 +14714,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13975,13 +14715,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>              test $p = "-R"; then
>    	 prev=$p
>    	 continue
> @@ -9537,7 +9537,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    	   # Internal compiler library paths should come after those
>    	   # provided the user.  The postdeps already come after the
>    	   # user supplied libs so there is no need to process them.
> -@@ -14000,8 +14749,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -14001,8 +14750,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>    	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
>    	 fi
>           fi
> @@ -9548,7 +9548,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>        *.$objext)
>           # This assumes that the test object file only shows up
>           # once in the compiler output.
> -@@ -14037,6 +14788,7 @@ else
> +@@ -14038,6 +14789,7 @@ else
>    fi
>    
>    $RM -f confest.$objext
> @@ -9556,7 +9556,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>    # PORTME: override above test on systems where it is broken
>    case $host_os in
> -@@ -14072,7 +14824,7 @@ linux*)
> +@@ -14073,7 +14825,7 @@ linux*)
>    
>    solaris*)
>      case $cc_basename in
> @@ -9565,7 +9565,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>        # The more standards-conforming stlport4 library is
>        # incompatible with the Cstd library. Avoid specifying
>        # it if it's in CXXFLAGS. Ignore libCrun as
> -@@ -14137,8 +14889,6 @@ fi
> +@@ -14138,8 +14890,6 @@ fi
>    lt_prog_compiler_pic_CXX=
>    lt_prog_compiler_static_CXX=
>    
> @@ -9574,7 +9574,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>      # C++ specific cases for pic, static, wl, etc.
>      if test "$GXX" = yes; then
> -@@ -14243,6 +14993,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -14244,6 +14994,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>    	  ;;
>    	esac
>    	;;
> @@ -9586,7 +9586,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>          dgux*)
>    	case $cc_basename in
>    	  ec++*)
> -@@ -14395,7 +15150,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -14396,7 +15151,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>    	;;
>          solaris*)
>    	case $cc_basename in
> @@ -9595,7 +9595,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    	    # Sun C++ 4.2, 5.x and Centerline C++
>    	    lt_prog_compiler_pic_CXX='-KPIC'
>    	    lt_prog_compiler_static_CXX='-Bstatic'
> -@@ -14460,10 +15215,17 @@ case $host_os in
> +@@ -14461,10 +15216,17 @@ case $host_os in
>        lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
>        ;;
>    esac
> @@ -9616,7 +9616,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>    #
>    # Check to make sure the PIC flag actually works.
> -@@ -14521,6 +15283,8 @@ fi
> +@@ -14522,6 +15284,8 @@ fi
>    
>    
>    
> @@ -9625,7 +9625,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    #
>    # Check to make sure the static flag actually works.
>    #
> -@@ -14698,6 +15462,7 @@ fi
> +@@ -14699,6 +15463,7 @@ fi
>    $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
>    
>      export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> @@ -9633,7 +9633,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>      case $host_os in
>      aix[4-9]*)
>        # If we're using GNU nm, then we don't want the "-C" option.
> -@@ -14712,15 +15477,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
> +@@ -14713,15 +15478,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
>        ;;
>      pw32*)
>        export_symbols_cmds_CXX="$ltdll_cmds"
> @@ -9659,7 +9659,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    
>    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
>    $as_echo "$ld_shlibs_CXX" >&6; }
> -@@ -14983,8 +15753,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -14984,8 +15754,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>      need_version=no
>      need_lib_prefix=no
>    
> @@ -9671,7 +9671,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>        library_names_spec='$libname.dll.a'
>        # DLL is installed to $(libdir)/../bin by postinstall_cmds
>        postinstall_cmds='base_file=`basename \${file}`~
> -@@ -15016,13 +15787,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -15017,13 +15788,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>          library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>          ;;
>        esac
> @@ -9744,7 +9744,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>      # FIXME: first we should search . and the directory the executable is in
>      shlibpath_var=PATH
>      ;;
> -@@ -15586,6 +16415,7 @@ fi
> +@@ -15587,6 +16416,7 @@ fi
>      fi # test -n "$compiler"
>    
>      CC=$lt_save_CC
> @@ -9752,7 +9752,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>      LDCXX=$LD
>      LD=$lt_save_LD
>      GCC=$lt_save_GCC
> -@@ -17738,13 +18568,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -17785,13 +18615,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>    lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>    lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>    lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -9773,7 +9773,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>    RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>    old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -17759,14 +18596,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -17806,14 +18643,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>    lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -9792,7 +9792,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>    NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>    LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -17799,12 +18639,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -17846,12 +18686,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>    hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>    inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>    link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -9806,7 +9806,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>    variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>    need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -17843,8 +18683,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
> +@@ -17890,8 +18730,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
>    compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
>    GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
>    lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
> @@ -9816,7 +9816,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
>    lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
>    archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
> -@@ -17871,12 +18711,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
> +@@ -17918,12 +18758,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
>    hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
>    inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
>    link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
> @@ -9830,7 +9830,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
>    hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
>    compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
> -@@ -17914,8 +18754,13 @@ reload_flag \
> +@@ -17961,8 +18801,13 @@ reload_flag \
>    OBJDUMP \
>    deplibs_check_method \
>    file_magic_cmd \
> @@ -9844,7 +9844,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    STRIP \
>    RANLIB \
>    CC \
> -@@ -17925,12 +18770,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -17972,12 +18817,14 @@ lt_cv_sys_global_symbol_pipe \
>    lt_cv_sys_global_symbol_to_cdecl \
>    lt_cv_sys_global_symbol_to_c_name_address \
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -9860,7 +9860,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    DSYMUTIL \
>    NMEDIT \
>    LIPO \
> -@@ -17946,7 +18793,6 @@ no_undefined_flag \
> +@@ -17993,7 +18840,6 @@ no_undefined_flag \
>    hardcode_libdir_flag_spec \
>    hardcode_libdir_flag_spec_ld \
>    hardcode_libdir_separator \
> @@ -9868,7 +9868,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    exclude_expsyms \
>    include_expsyms \
>    file_list_spec \
> -@@ -17968,8 +18814,8 @@ LD_CXX \
> +@@ -18015,8 +18861,8 @@ LD_CXX \
>    reload_flag_CXX \
>    compiler_CXX \
>    lt_prog_compiler_no_builtin_flag_CXX \
> @@ -9878,7 +9878,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    lt_prog_compiler_static_CXX \
>    lt_cv_prog_compiler_c_o_CXX \
>    export_dynamic_flag_spec_CXX \
> -@@ -17981,7 +18827,6 @@ no_undefined_flag_CXX \
> +@@ -18028,7 +18874,6 @@ no_undefined_flag_CXX \
>    hardcode_libdir_flag_spec_CXX \
>    hardcode_libdir_flag_spec_ld_CXX \
>    hardcode_libdir_separator_CXX \
> @@ -9886,7 +9886,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    exclude_expsyms_CXX \
>    include_expsyms_CXX \
>    file_list_spec_CXX \
> -@@ -18015,6 +18860,7 @@ module_cmds \
> +@@ -18062,6 +18907,7 @@ module_cmds \
>    module_expsym_cmds \
>    export_symbols_cmds \
>    prelink_cmds \
> @@ -9894,7 +9894,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    postinstall_cmds \
>    postuninstall_cmds \
>    finish_cmds \
> -@@ -18029,7 +18875,8 @@ archive_expsym_cmds_CXX \
> +@@ -18076,7 +18922,8 @@ archive_expsym_cmds_CXX \
>    module_cmds_CXX \
>    module_expsym_cmds_CXX \
>    export_symbols_cmds_CXX \
> @@ -9904,7 +9904,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>        case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
>        *[\\\\\\\`\\"\\\$]*)
>          eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
> -@@ -18786,7 +19633,8 @@ $as_echo X"$file" |
> +@@ -18833,7 +19680,8 @@ $as_echo X"$file" |
>    # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>    #
>    #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -9914,7 +9914,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    #   Written by Gordon Matzigkeit, 1996
>    #
>    #   This file is part of GNU Libtool.
> -@@ -18889,19 +19737,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -18936,19 +19784,42 @@ SP2NL=$lt_lt_SP2NL
>    # turn newlines into spaces.
>    NL2SP=$lt_lt_NL2SP
>    
> @@ -9958,7 +9958,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    # A symbol stripping program.
>    STRIP=$lt_STRIP
>    
> -@@ -18931,6 +19802,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -18978,6 +19849,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>    # Transform the output of nm in a C name address pair when lib prefix is needed.
>    global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>    
> @@ -9971,7 +9971,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    # The name of the directory that contains temporary libtool files.
>    objdir=$objdir
>    
> -@@ -18940,6 +19817,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -18987,6 +19864,9 @@ MAGIC_CMD=$MAGIC_CMD
>    # Must we lock files when doing compilation?
>    need_locks=$lt_need_locks
>    
> @@ -9981,7 +9981,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>    DSYMUTIL=$lt_DSYMUTIL
>    
> -@@ -19054,12 +19934,12 @@ with_gcc=$GCC
> +@@ -19101,12 +19981,12 @@ with_gcc=$GCC
>    # Compiler flag to turn off builtin functions.
>    no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>    
> @@ -9997,7 +9997,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    # Compiler flag to prevent dynamic linking.
>    link_static_flag=$lt_lt_prog_compiler_static
>    
> -@@ -19146,9 +20026,6 @@ inherit_rpath=$inherit_rpath
> +@@ -19193,9 +20073,6 @@ inherit_rpath=$inherit_rpath
>    # Whether libtool must link a program against all its dependency libraries.
>    link_all_deplibs=$link_all_deplibs
>    
> @@ -10007,7 +10007,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    # Set to "yes" if exported symbols are required.
>    always_export_symbols=$always_export_symbols
>    
> -@@ -19164,6 +20041,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -19211,6 +20088,9 @@ include_expsyms=$lt_include_expsyms
>    # Commands necessary for linking programs (against libraries) with templates.
>    prelink_cmds=$lt_prelink_cmds
>    
> @@ -10017,7 +10017,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    # Specify filename containing input files.
>    file_list_spec=$lt_file_list_spec
>    
> -@@ -19210,210 +20090,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -19257,210 +20137,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>      # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>      # text mode, it properly converts lines to CR/LF.  This bash problem
>      # is reportedly fixed, but why not run on old versions too?
> @@ -10391,7 +10391,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>        (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>      chmod +x "$ofile"
>    
> -@@ -19441,12 +20280,12 @@ with_gcc=$GCC_CXX
> +@@ -19488,12 +20327,12 @@ with_gcc=$GCC_CXX
>    # Compiler flag to turn off builtin functions.
>    no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
>    
> @@ -10407,7 +10407,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    # Compiler flag to prevent dynamic linking.
>    link_static_flag=$lt_lt_prog_compiler_static_CXX
>    
> -@@ -19533,9 +20372,6 @@ inherit_rpath=$inherit_rpath_CXX
> +@@ -19580,9 +20419,6 @@ inherit_rpath=$inherit_rpath_CXX
>    # Whether libtool must link a program against all its dependency libraries.
>    link_all_deplibs=$link_all_deplibs_CXX
>    
> @@ -10417,7 +10417,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    # Set to "yes" if exported symbols are required.
>    always_export_symbols=$always_export_symbols_CXX
>    
> -@@ -19551,6 +20387,9 @@ include_expsyms=$lt_include_expsyms_CXX
> +@@ -19598,6 +20434,9 @@ include_expsyms=$lt_include_expsyms_CXX
>    # Commands necessary for linking programs (against libraries) with templates.
>    prelink_cmds=$lt_prelink_cmds_CXX
>    
> @@ -10428,7 +10428,7 @@ index bdfa2281f2c..b6376eb3f77 100755
>    file_list_spec=$lt_file_list_spec_CXX
>    
>   diff --git a/gprofng/doc/Makefile.in b/gprofng/doc/Makefile.in
> -index 3306c51b31c..6ab3d9636c8 100644
> +index 5b57544d91a..da05c4cc0f0 100644
>   --- a/gprofng/doc/Makefile.in
>   +++ b/gprofng/doc/Makefile.in
>   @@ -238,6 +238,7 @@ CXXFLAGS = @CXXFLAGS@
> @@ -10448,10 +10448,10 @@ index 3306c51b31c..6ab3d9636c8 100644
>    NM = @NM@
>    NMEDIT = @NMEDIT@
>   diff --git a/gprofng/gp-display-html/Makefile.in b/gprofng/gp-display-html/Makefile.in
> -index 61c00cd6e46..edce3cb94c5 100644
> +index b667ae91617..1a6dcf47d34 100644
>   --- a/gprofng/gp-display-html/Makefile.in
>   +++ b/gprofng/gp-display-html/Makefile.in
> -@@ -197,6 +197,7 @@ CXXFLAGS = @CXXFLAGS@
> +@@ -198,6 +198,7 @@ CXXFLAGS = @CXXFLAGS@
>    CYGPATH_W = @CYGPATH_W@
>    DEFS = @DEFS@
>    DEPDIR = @DEPDIR@
> @@ -10459,7 +10459,7 @@ index 61c00cd6e46..edce3cb94c5 100644
>    DSYMUTIL = @DSYMUTIL@
>    DUMPBIN = @DUMPBIN@
>    ECHO_C = @ECHO_C@
> -@@ -231,6 +232,7 @@ LN_S = @LN_S@
> +@@ -232,6 +233,7 @@ LN_S = @LN_S@
>    LTLIBOBJS = @LTLIBOBJS@
>    MAINT = @MAINT@
>    MAKEINFO = @MAKEINFO@
> @@ -10488,7 +10488,7 @@ index ce8755c80c9..91e29c29ab8 100644
>    NM = @NM@
>    NMEDIT = @NMEDIT@
>   diff --git a/gprofng/libcollector/configure b/gprofng/libcollector/configure
> -index 8b0092433fe..a363ab1047c 100755
> +index 4c55f672332..5c175851e3c 100755
>   --- a/gprofng/libcollector/configure
>   +++ b/gprofng/libcollector/configure
>   @@ -640,6 +640,8 @@ OTOOL
> @@ -13064,10 +13064,10 @@ index 8b0092433fe..a363ab1047c 100755
>    file_list_spec=$lt_file_list_spec_CXX
>    
>   diff --git a/gprofng/src/Makefile.in b/gprofng/src/Makefile.in
> -index db763ef71b2..726dc69bf85 100644
> +index cef4b275305..8b769d439fa 100644
>   --- a/gprofng/src/Makefile.in
>   +++ b/gprofng/src/Makefile.in
> -@@ -321,6 +321,7 @@ CXXFLAGS = @CXXFLAGS@
> +@@ -322,6 +322,7 @@ CXXFLAGS = @CXXFLAGS@
>    CYGPATH_W = @CYGPATH_W@
>    DEFS = @DEFS@
>    DEPDIR = @DEPDIR@
> @@ -13075,7 +13075,7 @@ index db763ef71b2..726dc69bf85 100644
>    DSYMUTIL = @DSYMUTIL@
>    DUMPBIN = @DUMPBIN@
>    ECHO_C = @ECHO_C@
> -@@ -355,6 +356,7 @@ LN_S = @LN_S@
> +@@ -356,6 +357,7 @@ LN_S = @LN_S@
>    LTLIBOBJS = @LTLIBOBJS@
>    MAINT = @MAINT@
>    MAKEINFO = @MAKEINFO@
> @@ -13084,7 +13084,7 @@ index db763ef71b2..726dc69bf85 100644
>    NM = @NM@
>    NMEDIT = @NMEDIT@
>   diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index 15311048855..71b39ee9311 100644
> +index 4be38a75feb..24b219d9df6 100644
>   --- a/ld/Makefile.in
>   +++ b/ld/Makefile.in
>   @@ -390,6 +390,7 @@ CYGPATH_W = @CYGPATH_W@
> @@ -13112,7 +13112,7 @@ index 15311048855..71b39ee9311 100644
>    ac_ct_CXX = @ac_ct_CXX@
>    ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
>   diff --git a/ld/configure b/ld/configure
> -index 98a76d6da7f..a4266996c44 100755
> +index dd770216b61..e8c5bc61d24 100755
>   --- a/ld/configure
>   +++ b/ld/configure
>   @@ -705,8 +705,11 @@ OTOOL
> @@ -13135,7 +13135,7 @@ index 98a76d6da7f..a4266996c44 100755
>    enable_libtool_lock
>    enable_plugins
>    enable_largefile
> -@@ -1581,6 +1585,8 @@ Optional Packages:
> +@@ -1583,6 +1587,8 @@ Optional Packages:
>      --with-pic              try to use only PIC/non-PIC objects [default=use
>                              both]
>      --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -15016,7 +15016,7 @@ index 98a76d6da7f..a4266996c44 100755
>      LDCXX=$LD
>      LD=$lt_save_LD
>      GCC=$lt_save_GCC
> -@@ -20310,13 +21141,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -20335,13 +21166,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>    lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>    lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>    lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -15037,7 +15037,7 @@ index 98a76d6da7f..a4266996c44 100755
>    STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>    RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>    old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -20331,14 +21169,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -20356,14 +21194,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>    lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -15056,7 +15056,7 @@ index 98a76d6da7f..a4266996c44 100755
>    DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>    NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>    LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -20371,12 +21212,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -20396,12 +21237,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>    hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>    inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>    link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -15070,7 +15070,7 @@ index 98a76d6da7f..a4266996c44 100755
>    file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>    variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>    need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -20415,8 +21256,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
> +@@ -20440,8 +21281,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
>    compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
>    GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
>    lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
> @@ -15080,7 +15080,7 @@ index 98a76d6da7f..a4266996c44 100755
>    lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
>    lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
>    archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
> -@@ -20443,12 +21284,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
> +@@ -20468,12 +21309,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
>    hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
>    inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
>    link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
> @@ -15094,7 +15094,7 @@ index 98a76d6da7f..a4266996c44 100755
>    file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
>    hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
>    compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
> -@@ -20486,8 +21327,13 @@ reload_flag \
> +@@ -20511,8 +21352,13 @@ reload_flag \
>    OBJDUMP \
>    deplibs_check_method \
>    file_magic_cmd \
> @@ -15108,7 +15108,7 @@ index 98a76d6da7f..a4266996c44 100755
>    STRIP \
>    RANLIB \
>    CC \
> -@@ -20497,12 +21343,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -20522,12 +21368,14 @@ lt_cv_sys_global_symbol_pipe \
>    lt_cv_sys_global_symbol_to_cdecl \
>    lt_cv_sys_global_symbol_to_c_name_address \
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -15124,7 +15124,7 @@ index 98a76d6da7f..a4266996c44 100755
>    DSYMUTIL \
>    NMEDIT \
>    LIPO \
> -@@ -20518,7 +21366,6 @@ no_undefined_flag \
> +@@ -20543,7 +21391,6 @@ no_undefined_flag \
>    hardcode_libdir_flag_spec \
>    hardcode_libdir_flag_spec_ld \
>    hardcode_libdir_separator \
> @@ -15132,7 +15132,7 @@ index 98a76d6da7f..a4266996c44 100755
>    exclude_expsyms \
>    include_expsyms \
>    file_list_spec \
> -@@ -20540,8 +21387,8 @@ LD_CXX \
> +@@ -20565,8 +21412,8 @@ LD_CXX \
>    reload_flag_CXX \
>    compiler_CXX \
>    lt_prog_compiler_no_builtin_flag_CXX \
> @@ -15142,7 +15142,7 @@ index 98a76d6da7f..a4266996c44 100755
>    lt_prog_compiler_static_CXX \
>    lt_cv_prog_compiler_c_o_CXX \
>    export_dynamic_flag_spec_CXX \
> -@@ -20553,7 +21400,6 @@ no_undefined_flag_CXX \
> +@@ -20578,7 +21425,6 @@ no_undefined_flag_CXX \
>    hardcode_libdir_flag_spec_CXX \
>    hardcode_libdir_flag_spec_ld_CXX \
>    hardcode_libdir_separator_CXX \
> @@ -15150,7 +15150,7 @@ index 98a76d6da7f..a4266996c44 100755
>    exclude_expsyms_CXX \
>    include_expsyms_CXX \
>    file_list_spec_CXX \
> -@@ -20587,6 +21433,7 @@ module_cmds \
> +@@ -20612,6 +21458,7 @@ module_cmds \
>    module_expsym_cmds \
>    export_symbols_cmds \
>    prelink_cmds \
> @@ -15158,7 +15158,7 @@ index 98a76d6da7f..a4266996c44 100755
>    postinstall_cmds \
>    postuninstall_cmds \
>    finish_cmds \
> -@@ -20601,7 +21448,8 @@ archive_expsym_cmds_CXX \
> +@@ -20626,7 +21473,8 @@ archive_expsym_cmds_CXX \
>    module_cmds_CXX \
>    module_expsym_cmds_CXX \
>    export_symbols_cmds_CXX \
> @@ -15168,7 +15168,7 @@ index 98a76d6da7f..a4266996c44 100755
>        case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
>        *[\\\\\\\`\\"\\\$]*)
>          eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
> -@@ -21374,7 +22222,8 @@ $as_echo X"$file" |
> +@@ -21399,7 +22247,8 @@ $as_echo X"$file" |
>    # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>    #
>    #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -15178,7 +15178,7 @@ index 98a76d6da7f..a4266996c44 100755
>    #   Written by Gordon Matzigkeit, 1996
>    #
>    #   This file is part of GNU Libtool.
> -@@ -21477,19 +22326,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -21502,19 +22351,42 @@ SP2NL=$lt_lt_SP2NL
>    # turn newlines into spaces.
>    NL2SP=$lt_lt_NL2SP
>    
> @@ -15222,7 +15222,7 @@ index 98a76d6da7f..a4266996c44 100755
>    # A symbol stripping program.
>    STRIP=$lt_STRIP
>    
> -@@ -21519,6 +22391,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -21544,6 +22416,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>    # Transform the output of nm in a C name address pair when lib prefix is needed.
>    global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>    
> @@ -15235,7 +15235,7 @@ index 98a76d6da7f..a4266996c44 100755
>    # The name of the directory that contains temporary libtool files.
>    objdir=$objdir
>    
> -@@ -21528,6 +22406,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -21553,6 +22431,9 @@ MAGIC_CMD=$MAGIC_CMD
>    # Must we lock files when doing compilation?
>    need_locks=$lt_need_locks
>    
> @@ -15245,7 +15245,7 @@ index 98a76d6da7f..a4266996c44 100755
>    # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>    DSYMUTIL=$lt_DSYMUTIL
>    
> -@@ -21642,12 +22523,12 @@ with_gcc=$GCC
> +@@ -21667,12 +22548,12 @@ with_gcc=$GCC
>    # Compiler flag to turn off builtin functions.
>    no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>    
> @@ -15261,7 +15261,7 @@ index 98a76d6da7f..a4266996c44 100755
>    # Compiler flag to prevent dynamic linking.
>    link_static_flag=$lt_lt_prog_compiler_static
>    
> -@@ -21734,9 +22615,6 @@ inherit_rpath=$inherit_rpath
> +@@ -21759,9 +22640,6 @@ inherit_rpath=$inherit_rpath
>    # Whether libtool must link a program against all its dependency libraries.
>    link_all_deplibs=$link_all_deplibs
>    
> @@ -15271,7 +15271,7 @@ index 98a76d6da7f..a4266996c44 100755
>    # Set to "yes" if exported symbols are required.
>    always_export_symbols=$always_export_symbols
>    
> -@@ -21752,6 +22630,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -21777,6 +22655,9 @@ include_expsyms=$lt_include_expsyms
>    # Commands necessary for linking programs (against libraries) with templates.
>    prelink_cmds=$lt_prelink_cmds
>    
> @@ -15281,7 +15281,7 @@ index 98a76d6da7f..a4266996c44 100755
>    # Specify filename containing input files.
>    file_list_spec=$lt_file_list_spec
>    
> -@@ -21798,210 +22679,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -21823,210 +22704,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>      # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>      # text mode, it properly converts lines to CR/LF.  This bash problem
>      # is reportedly fixed, but why not run on old versions too?
> @@ -15655,7 +15655,7 @@ index 98a76d6da7f..a4266996c44 100755
>        (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>      chmod +x "$ofile"
>    
> -@@ -22029,12 +22869,12 @@ with_gcc=$GCC_CXX
> +@@ -22054,12 +22894,12 @@ with_gcc=$GCC_CXX
>    # Compiler flag to turn off builtin functions.
>    no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
>    
> @@ -15671,7 +15671,7 @@ index 98a76d6da7f..a4266996c44 100755
>    # Compiler flag to prevent dynamic linking.
>    link_static_flag=$lt_lt_prog_compiler_static_CXX
>    
> -@@ -22121,9 +22961,6 @@ inherit_rpath=$inherit_rpath_CXX
> +@@ -22146,9 +22986,6 @@ inherit_rpath=$inherit_rpath_CXX
>    # Whether libtool must link a program against all its dependency libraries.
>    link_all_deplibs=$link_all_deplibs_CXX
>    
> @@ -15681,7 +15681,7 @@ index 98a76d6da7f..a4266996c44 100755
>    # Set to "yes" if exported symbols are required.
>    always_export_symbols=$always_export_symbols_CXX
>    
> -@@ -22139,6 +22976,9 @@ include_expsyms=$lt_include_expsyms_CXX
> +@@ -22164,6 +23001,9 @@ include_expsyms=$lt_include_expsyms_CXX
>    # Commands necessary for linking programs (against libraries) with templates.
>    prelink_cmds=$lt_prelink_cmds_CXX
>    
> @@ -15692,7 +15692,7 @@ index 98a76d6da7f..a4266996c44 100755
>    file_list_spec=$lt_file_list_spec_CXX
>    
>   diff --git a/libbacktrace/Makefile.in b/libbacktrace/Makefile.in
> -index 0a61880ba67..500756cd023 100644
> +index 49852a21d37..d371dda2d34 100644
>   --- a/libbacktrace/Makefile.in
>   +++ b/libbacktrace/Makefile.in
>   @@ -1,7 +1,7 @@
> @@ -15705,79 +15705,83 @@ index 0a61880ba67..500756cd023 100644
>    
>    # This Makefile.in is free software; the Free Software Foundation
>    # gives unlimited permission to copy and/or distribute it,
> -@@ -189,6 +189,35 @@ CONFIG_HEADER = config.h
> +@@ -190,37 +190,6 @@ CONFIG_HEADER = config.h
>    CONFIG_CLEAN_FILES = backtrace-supported.h \
>    	install-debuginfo-for-buildid.sh
>    CONFIG_CLEAN_VPATH_FILES =
> -+@NATIVE_TRUE@am__EXEEXT_1 = allocfail$(EXEEXT)
> -+@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am__EXEEXT_2 = b2test$(EXEEXT)
> -+@HAVE_DWZ_TRUE@@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am__EXEEXT_3 = b3test$(EXEEXT)
> -+@NATIVE_TRUE@am__EXEEXT_4 = test_elf_32$(EXEEXT) test_elf_64$(EXEEXT) \
> -+@NATIVE_TRUE@	test_macho$(EXEEXT) test_xcoff_32$(EXEEXT) \
> -+@NATIVE_TRUE@	test_xcoff_64$(EXEEXT) test_pecoff$(EXEEXT) \
> -+@NATIVE_TRUE@	test_unknown$(EXEEXT) unittest$(EXEEXT) \
> -+@NATIVE_TRUE@	unittest_alloc$(EXEEXT) btest$(EXEEXT)
> -+@HAVE_ELF_TRUE@@NATIVE_TRUE@am__EXEEXT_5 = btest_lto$(EXEEXT)
> -+@NATIVE_TRUE@am__EXEEXT_6 = btest_alloc$(EXEEXT) stest$(EXEEXT) \
> -+@NATIVE_TRUE@	stest_alloc$(EXEEXT)
> -+@HAVE_ELF_TRUE@@NATIVE_TRUE@am__EXEEXT_7 = ztest$(EXEEXT) \
> -+@HAVE_ELF_TRUE@@NATIVE_TRUE@	ztest_alloc$(EXEEXT)
> -+@NATIVE_TRUE@am__EXEEXT_8 = edtest$(EXEEXT) edtest_alloc$(EXEEXT)
> -+@HAVE_PTHREAD_TRUE@@NATIVE_TRUE@am__EXEEXT_9 = ttest$(EXEEXT) \
> -+@HAVE_PTHREAD_TRUE@@NATIVE_TRUE@	ttest_alloc$(EXEEXT)
> -+@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@am__EXEEXT_10 =  \
> -+@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@	ctestg$(EXEEXT) \
> -+@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@	ctesta$(EXEEXT) \
> -+@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@	ctestg_alloc$(EXEEXT) \
> -+@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@	ctesta_alloc$(EXEEXT)
> -+@HAVE_DWARF5_TRUE@@NATIVE_TRUE@am__EXEEXT_11 = dwarf5$(EXEEXT) \
> -+@HAVE_DWARF5_TRUE@@NATIVE_TRUE@	dwarf5_alloc$(EXEEXT)
> -+@NATIVE_TRUE@am__EXEEXT_12 = mtest$(EXEEXT)
> -+@HAVE_ELF_TRUE@am__EXEEXT_13 = xztest$(EXEEXT) xztest_alloc$(EXEEXT)
> -+am__EXEEXT_14 = $(am__EXEEXT_4) $(am__EXEEXT_5) $(am__EXEEXT_6) \
> -+	$(am__EXEEXT_7) $(am__EXEEXT_8) $(am__EXEEXT_9) \
> -+	$(am__EXEEXT_10) $(am__EXEEXT_11) $(am__EXEEXT_12) \
> -+	$(am__EXEEXT_13)
> - LTLIBRARIES = $(noinst_LTLIBRARIES)
> - am__DEPENDENCIES_1 =
> - am_libbacktrace_la_OBJECTS = atomic.lo dwarf.lo fileline.lo posix.lo \
> -@@ -220,35 +249,6 @@ libbacktrace_instrumented_alloc_la_OBJECTS =  \
> - libbacktrace_noformat_la_OBJECTS =  \
> - 	$(am_libbacktrace_noformat_la_OBJECTS)
> - @NATIVE_TRUE@am_libbacktrace_noformat_la_rpath =
> --@NATIVE_TRUE@am__EXEEXT_1 = allocfail$(EXEEXT)
> --@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am__EXEEXT_2 = b2test$(EXEEXT)
> --@HAVE_DWZ_TRUE@@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am__EXEEXT_3 = b3test$(EXEEXT)
> --@NATIVE_TRUE@am__EXEEXT_4 = test_elf_32$(EXEEXT) test_elf_64$(EXEEXT) \
> --@NATIVE_TRUE@	test_macho$(EXEEXT) test_xcoff_32$(EXEEXT) \
> --@NATIVE_TRUE@	test_xcoff_64$(EXEEXT) test_pecoff$(EXEEXT) \
> --@NATIVE_TRUE@	test_unknown$(EXEEXT) unittest$(EXEEXT) \
> --@NATIVE_TRUE@	unittest_alloc$(EXEEXT) btest$(EXEEXT)
> --@HAVE_ELF_TRUE@@NATIVE_TRUE@am__EXEEXT_5 = btest_lto$(EXEEXT)
> --@NATIVE_TRUE@am__EXEEXT_6 = btest_alloc$(EXEEXT) stest$(EXEEXT) \
> --@NATIVE_TRUE@	stest_alloc$(EXEEXT)
> --@HAVE_ELF_TRUE@@NATIVE_TRUE@am__EXEEXT_7 = ztest$(EXEEXT) \
> --@HAVE_ELF_TRUE@@NATIVE_TRUE@	ztest_alloc$(EXEEXT)
> --@NATIVE_TRUE@am__EXEEXT_8 = edtest$(EXEEXT) edtest_alloc$(EXEEXT)
> --@HAVE_PTHREAD_TRUE@@NATIVE_TRUE@am__EXEEXT_9 = ttest$(EXEEXT) \
> --@HAVE_PTHREAD_TRUE@@NATIVE_TRUE@	ttest_alloc$(EXEEXT)
> --@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@am__EXEEXT_10 =  \
> --@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@	ctestg$(EXEEXT) \
> --@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@	ctesta$(EXEEXT) \
> --@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@	ctestg_alloc$(EXEEXT) \
> --@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@	ctesta_alloc$(EXEEXT)
> --@HAVE_DWARF5_TRUE@@NATIVE_TRUE@am__EXEEXT_11 = dwarf5$(EXEEXT) \
> --@HAVE_DWARF5_TRUE@@NATIVE_TRUE@	dwarf5_alloc$(EXEEXT)
> --@NATIVE_TRUE@am__EXEEXT_12 = mtest$(EXEEXT)
> --@HAVE_ELF_TRUE@am__EXEEXT_13 = xztest$(EXEEXT) xztest_alloc$(EXEEXT)
> --am__EXEEXT_14 = $(am__EXEEXT_4) $(am__EXEEXT_5) $(am__EXEEXT_6) \
> --	$(am__EXEEXT_7) $(am__EXEEXT_8) $(am__EXEEXT_9) \
> --	$(am__EXEEXT_10) $(am__EXEEXT_11) $(am__EXEEXT_12) \
> --	$(am__EXEEXT_13)
> +-LTLIBRARIES = $(noinst_LTLIBRARIES)
> +-am__DEPENDENCIES_1 =
> +-am_libbacktrace_la_OBJECTS = atomic.lo dwarf.lo fileline.lo posix.lo \
> +-	print.lo sort.lo state.lo
> +-libbacktrace_la_OBJECTS = $(am_libbacktrace_la_OBJECTS)
> +-AM_V_lt = $(am__v_lt_@AM_V@)
> +-am__v_lt_ = $(am__v_lt_@AM_DEFAULT_V@)
> +-am__v_lt_0 = --silent
> +-am__v_lt_1 =
> +-am__objects_1 = atomic.lo dwarf.lo fileline.lo posix.lo print.lo \
> +-	sort.lo state.lo
> +-@NATIVE_TRUE@am_libbacktrace_alloc_la_OBJECTS = $(am__objects_1)
> +-libbacktrace_alloc_la_OBJECTS = $(am_libbacktrace_alloc_la_OBJECTS)
> +-@NATIVE_TRUE@am_libbacktrace_alloc_la_rpath =
> +-@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@libbacktrace_elf_for_test_la_DEPENDENCIES = $(am__DEPENDENCIES_1) \
> +-@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@	elf_for_test.lo \
> +-@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@	$(am__DEPENDENCIES_1) \
> +-@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@	$(am__DEPENDENCIES_1)
> +-@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am_libbacktrace_elf_for_test_la_OBJECTS = $(am__objects_1)
> +-libbacktrace_elf_for_test_la_OBJECTS =  \
> +-	$(am_libbacktrace_elf_for_test_la_OBJECTS)
> +-@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am_libbacktrace_elf_for_test_la_rpath =
> +-@NATIVE_TRUE@am_libbacktrace_instrumented_alloc_la_OBJECTS =  \
> +-@NATIVE_TRUE@	$(am__objects_1)
> +-libbacktrace_instrumented_alloc_la_OBJECTS =  \
> +-	$(am_libbacktrace_instrumented_alloc_la_OBJECTS)
> +-@NATIVE_TRUE@am_libbacktrace_instrumented_alloc_la_rpath =
> +-@NATIVE_TRUE@am_libbacktrace_noformat_la_OBJECTS = $(am__objects_1)
> +-libbacktrace_noformat_la_OBJECTS =  \
> +-	$(am_libbacktrace_noformat_la_OBJECTS)
> +-@NATIVE_TRUE@am_libbacktrace_noformat_la_rpath =
> + @NATIVE_TRUE@am__EXEEXT_1 = allocfail$(EXEEXT)
> + @HAVE_BUILDID_TRUE@@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am__EXEEXT_2 = b2test$(EXEEXT)
> + @HAVE_BUILDID_TRUE@@HAVE_DWZ_TRUE@@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am__EXEEXT_3 = b3test$(EXEEXT)
> +@@ -253,6 +222,37 @@ am__EXEEXT_16 = $(am__EXEEXT_4) $(am__EXEEXT_5) $(am__EXEEXT_6) \
> + 	$(am__EXEEXT_7) $(am__EXEEXT_8) $(am__EXEEXT_9) \
> + 	$(am__EXEEXT_10) $(am__EXEEXT_11) $(am__EXEEXT_12) \
> + 	$(am__EXEEXT_13) $(am__EXEEXT_14) $(am__EXEEXT_15)
> ++LTLIBRARIES = $(noinst_LTLIBRARIES)
> ++am__DEPENDENCIES_1 =
> ++am_libbacktrace_la_OBJECTS = atomic.lo dwarf.lo fileline.lo posix.lo \
> ++	print.lo sort.lo state.lo
> ++libbacktrace_la_OBJECTS = $(am_libbacktrace_la_OBJECTS)
> ++AM_V_lt = $(am__v_lt_@AM_V@)
> ++am__v_lt_ = $(am__v_lt_@AM_DEFAULT_V@)
> ++am__v_lt_0 = --silent
> ++am__v_lt_1 =
> ++am__objects_1 = atomic.lo dwarf.lo fileline.lo posix.lo print.lo \
> ++	sort.lo state.lo
> ++@NATIVE_TRUE@am_libbacktrace_alloc_la_OBJECTS = $(am__objects_1)
> ++libbacktrace_alloc_la_OBJECTS = $(am_libbacktrace_alloc_la_OBJECTS)
> ++@NATIVE_TRUE@am_libbacktrace_alloc_la_rpath =
> ++@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@libbacktrace_elf_for_test_la_DEPENDENCIES = $(am__DEPENDENCIES_1) \
> ++@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@	elf_for_test.lo \
> ++@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@	$(am__DEPENDENCIES_1) \
> ++@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@	$(am__DEPENDENCIES_1)
> ++@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am_libbacktrace_elf_for_test_la_OBJECTS = $(am__objects_1)
> ++libbacktrace_elf_for_test_la_OBJECTS =  \
> ++	$(am_libbacktrace_elf_for_test_la_OBJECTS)
> ++@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am_libbacktrace_elf_for_test_la_rpath =
> ++@NATIVE_TRUE@am_libbacktrace_instrumented_alloc_la_OBJECTS =  \
> ++@NATIVE_TRUE@	$(am__objects_1)
> ++libbacktrace_instrumented_alloc_la_OBJECTS =  \
> ++	$(am_libbacktrace_instrumented_alloc_la_OBJECTS)
> ++@NATIVE_TRUE@am_libbacktrace_instrumented_alloc_la_rpath =
> ++@NATIVE_TRUE@am_libbacktrace_noformat_la_OBJECTS = $(am__objects_1)
> ++libbacktrace_noformat_la_OBJECTS =  \
> ++	$(am_libbacktrace_noformat_la_OBJECTS)
> ++@NATIVE_TRUE@am_libbacktrace_noformat_la_rpath =
>    @NATIVE_TRUE@am_allocfail_OBJECTS = allocfail-allocfail.$(OBJEXT) \
>    @NATIVE_TRUE@	allocfail-testlib.$(OBJEXT)
>    allocfail_OBJECTS = $(am_allocfail_OBJECTS)
> -@@ -536,7 +536,7 @@ am__v_at_0 = @
> +@@ -571,7 +571,7 @@ am__v_at_0 = @
>    am__v_at_1 =
>    DEFAULT_INCLUDES = -I.@am__isrc@
>    depcomp =
> @@ -15786,7 +15790,7 @@ index 0a61880ba67..500756cd023 100644
>    COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
>    	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
>    LTCOMPILE = $(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) \
> -@@ -579,8 +579,8 @@ am__can_run_installinfo = \
> +@@ -615,8 +615,8 @@ am__can_run_installinfo = \
>        n|no|NO) false;; \
>        *) (install-info --version) >/dev/null 2>&1;; \
>      esac
> @@ -15797,7 +15801,7 @@ index 0a61880ba67..500756cd023 100644
>    # Read a list of newline-separated strings from the standard input,
>    # and print each of them once, without duplicates.  Input order is
>    # *not* preserved.
> -@@ -597,9 +597,6 @@ am__define_uniq_tagged_files = \
> +@@ -633,9 +633,6 @@ am__define_uniq_tagged_files = \
>      unique=`for i in $$list; do \
>        if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
>      done | $(am__uniquify_input)`
> @@ -15807,7 +15811,7 @@ index 0a61880ba67..500756cd023 100644
>    AM_RECURSIVE_TARGETS = cscope check recheck
>    am__tty_colors_dummy = \
>      mgn= red= grn= lgn= blu= brg= std=; \
> -@@ -783,6 +780,7 @@ am__set_TESTS_bases = \
> +@@ -819,6 +816,7 @@ am__set_TESTS_bases = \
>      bases='$(TEST_LOGS)'; \
>      bases=`for i in $$bases; do echo $$i; done | sed 's/\.log$$//'`; \
>      bases=`echo $$bases`
> @@ -15815,7 +15819,7 @@ index 0a61880ba67..500756cd023 100644
>    RECHECK_LOGS = $(TEST_LOGS)
>    TEST_SUITE_LOG = test-suite.log
>    TEST_EXTENSIONS = @EXEEXT@ .test
> -@@ -825,8 +823,11 @@ CLOCK_GETTIME_LINK = @CLOCK_GETTIME_LINK@
> +@@ -861,8 +859,11 @@ CLOCK_GETTIME_LINK = @CLOCK_GETTIME_LINK@
>    COMM = @COMM@
>    CPP = @CPP@
>    CPPFLAGS = @CPPFLAGS@
> @@ -15827,7 +15831,7 @@ index 0a61880ba67..500756cd023 100644
>    DSYMUTIL = @DSYMUTIL@
>    DUMPBIN = @DUMPBIN@
>    DWZ = @DWZ@
> -@@ -834,6 +835,7 @@ ECHO_C = @ECHO_C@
> +@@ -870,6 +871,7 @@ ECHO_C = @ECHO_C@
>    ECHO_N = @ECHO_N@
>    ECHO_T = @ECHO_T@
>    EGREP = @EGREP@
> @@ -15835,7 +15839,7 @@ index 0a61880ba67..500756cd023 100644
>    EXEEXT = @EXEEXT@
>    EXTRA_FLAGS = @EXTRA_FLAGS@
>    FGREP = @FGREP@
> -@@ -854,6 +856,7 @@ LN_S = @LN_S@
> +@@ -890,6 +892,7 @@ LN_S = @LN_S@
>    LTLIBOBJS = @LTLIBOBJS@
>    MAINT = @MAINT@
>    MAKEINFO = @MAKEINFO@
> @@ -15843,7 +15847,7 @@ index 0a61880ba67..500756cd023 100644
>    MKDIR_P = @MKDIR_P@
>    NM = @NM@
>    NMEDIT = @NMEDIT@
> -@@ -886,6 +889,7 @@ abs_builddir = @abs_builddir@
> +@@ -922,6 +925,7 @@ abs_builddir = @abs_builddir@
>    abs_srcdir = @abs_srcdir@
>    abs_top_builddir = @abs_top_builddir@
>    abs_top_srcdir = @abs_top_srcdir@
> @@ -15851,7 +15855,7 @@ index 0a61880ba67..500756cd023 100644
>    ac_ct_CC = @ac_ct_CC@
>    ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
>    am__leading_dot = @am__leading_dot@
> -@@ -1178,8 +1182,8 @@ Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
> +@@ -1267,8 +1271,8 @@ Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
>    	    echo ' $(SHELL) ./config.status'; \
>    	    $(SHELL) ./config.status;; \
>    	  *) \
> @@ -15862,7 +15866,7 @@ index 0a61880ba67..500756cd023 100644
>    	esac;
>    $(top_srcdir)/../multilib.am $(am__empty):
>    
> -@@ -1211,6 +1215,15 @@ backtrace-supported.h: $(top_builddir)/config.status $(srcdir)/backtrace-support
> +@@ -1300,6 +1304,15 @@ backtrace-supported.h: $(top_builddir)/config.status $(srcdir)/backtrace-support
>    install-debuginfo-for-buildid.sh: $(top_builddir)/config.status $(srcdir)/install-debuginfo-for-buildid.sh.in
>    	cd $(top_builddir) && $(SHELL) ./config.status $@
>    
> @@ -15878,7 +15882,7 @@ index 0a61880ba67..500756cd023 100644
>    clean-checkLTLIBRARIES:
>    	-test -z "$(check_LTLIBRARIES)" || rm -f $(check_LTLIBRARIES)
>    	@list='$(check_LTLIBRARIES)'; \
> -@@ -1248,15 +1261,6 @@ libbacktrace_instrumented_alloc.la: $(libbacktrace_instrumented_alloc_la_OBJECTS
> +@@ -1337,15 +1350,6 @@ libbacktrace_instrumented_alloc.la: $(libbacktrace_instrumented_alloc_la_OBJECTS
>    libbacktrace_noformat.la: $(libbacktrace_noformat_la_OBJECTS) $(libbacktrace_noformat_la_DEPENDENCIES) $(EXTRA_libbacktrace_noformat_la_DEPENDENCIES)
>    	$(AM_V_CCLD)$(LINK) $(am_libbacktrace_noformat_la_rpath) $(libbacktrace_noformat_la_OBJECTS) $(libbacktrace_noformat_la_LIBADD) $(LIBS)
>    
> @@ -15894,7 +15898,7 @@ index 0a61880ba67..500756cd023 100644
>    allocfail$(EXEEXT): $(allocfail_OBJECTS) $(allocfail_DEPENDENCIES) $(EXTRA_allocfail_DEPENDENCIES)
>    	@rm -f allocfail$(EXEEXT)
>    	$(AM_V_CCLD)$(allocfail_LINK) $(allocfail_OBJECTS) $(allocfail_LDADD) $(LIBS)
> -@@ -1959,7 +1963,7 @@ $(TEST_SUITE_LOG): $(TEST_LOGS)
> +@@ -2096,7 +2100,7 @@ $(TEST_SUITE_LOG): $(TEST_LOGS)
>    	  test x"$$VERBOSE" = x || cat $(TEST_SUITE_LOG);		\
>    	fi;								\
>    	echo "$${col}$$br$${std}"; 					\
> @@ -15903,7 +15907,7 @@ index 0a61880ba67..500756cd023 100644
>    	echo "$${col}$$br$${std}"; 					\
>    	create_testsuite_report --maybe-color;				\
>    	echo "$$col$$br$$std";						\
> -@@ -1972,7 +1976,7 @@ $(TEST_SUITE_LOG): $(TEST_LOGS)
> +@@ -2109,7 +2113,7 @@ $(TEST_SUITE_LOG): $(TEST_LOGS)
>    	fi;								\
>    	$$success || exit 1
>    
> @@ -15912,7 +15916,7 @@ index 0a61880ba67..500756cd023 100644
>    	@list='$(RECHECK_LOGS)';           test -z "$$list" || rm -f $$list
>    	@list='$(RECHECK_LOGS:.log=.trs)'; test -z "$$list" || rm -f $$list
>    	@test -z "$(TEST_SUITE_LOG)" || rm -f $(TEST_SUITE_LOG)
> -@@ -1982,7 +1986,7 @@ check-TESTS:
> +@@ -2119,7 +2123,7 @@ check-TESTS:
>    	log_list=`echo $$log_list`; trs_list=`echo $$trs_list`; \
>    	$(MAKE) $(AM_MAKEFLAGS) $(TEST_SUITE_LOG) TEST_LOGS="$$log_list"; \
>    	exit $$?;
> @@ -15921,7 +15925,7 @@ index 0a61880ba67..500756cd023 100644
>    	@test -z "$(TEST_SUITE_LOG)" || rm -f $(TEST_SUITE_LOG)
>    	@set +e; $(am__set_TESTS_bases); \
>    	bases=`for i in $$bases; do echo $$i; done \
> -@@ -2260,7 +2264,7 @@ xztest_alloc.log: xztest_alloc$(EXEEXT)
> +@@ -2439,7 +2443,7 @@ xztest_alloc.log: xztest_alloc$(EXEEXT)
>    @am__EXEEXT_TRUE@	$(am__common_driver_flags) $(AM_TEST_LOG_DRIVER_FLAGS) $(TEST_LOG_DRIVER_FLAGS) -- $(TEST_LOG_COMPILE) \
>    @am__EXEEXT_TRUE@	"$$tst" $(AM_TESTS_FD_REDIRECT)
>    check-am: all-am
> @@ -16175,10 +16179,10 @@ index 528e6173930..d88a5ec84f2 100644
>    # This file is free software; the Free Software Foundation
>    # gives unlimited permission to copy and/or distribute it,
>   diff --git a/libbacktrace/configure b/libbacktrace/configure
> -index e5ca8ad9379..b7c4c4be78d 100755
> +index 4ab612dc780..68f6b8566e9 100755
>   --- a/libbacktrace/configure
>   +++ b/libbacktrace/configure
> -@@ -680,7 +680,10 @@ OTOOL
> +@@ -686,7 +686,10 @@ OTOOL
>    LIPO
>    NMEDIT
>    DSYMUTIL
> @@ -16189,7 +16193,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    OBJDUMP
>    LN_S
>    NM
> -@@ -701,6 +704,9 @@ AM_BACKSLASH
> +@@ -707,6 +710,9 @@ AM_BACKSLASH
>    AM_DEFAULT_VERBOSITY
>    AM_DEFAULT_V
>    AM_V
> @@ -16199,7 +16203,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    am__untar
>    am__tar
>    AMTAR
> -@@ -798,6 +804,7 @@ enable_static
> +@@ -804,6 +810,7 @@ enable_static
>    with_pic
>    enable_fast_install
>    with_gnu_ld
> @@ -16207,7 +16211,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    enable_libtool_lock
>    enable_largefile
>    enable_cet
> -@@ -1458,6 +1465,8 @@ Optional Packages:
> +@@ -1466,6 +1473,8 @@ Optional Packages:
>      --with-pic              try to use only PIC/non-PIC objects [default=use
>                              both]
>      --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -16216,7 +16220,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>      --with-system-libunwind use installed libunwind
>    
>    Some influential environment variables:
> -@@ -4047,7 +4056,7 @@ libtool_VERSION=1:0:0
> +@@ -4054,7 +4063,7 @@ libtool_VERSION=1:0:0
>    # -Wall: Issue all automake warnings.
>    # -Wno-portability: Don't warn about constructs supported by GNU make.
>    #    (because GCC requires GNU make anyhow).
> @@ -16225,7 +16229,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>    # Find a good install program.  We prefer a C program (faster),
>    # so one script is as good as another.  But avoid the broken or
> -@@ -4220,12 +4229,7 @@ ac_script='s/[\\$]/&&/g;s/;s,x,x,$//'
> +@@ -4227,12 +4236,7 @@ ac_script='s/[\\$]/&&/g;s/;s,x,x,$//'
>    program_transform_name=`$as_echo "$program_transform_name" | sed "$ac_script"`
>    
>    if test x"${MISSING+set}" != xset; then
> @@ -16239,7 +16243,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    fi
>    # Use eval to expand $SHELL
>    if eval "$MISSING --is-lightweight"; then
> -@@ -4551,8 +4555,8 @@ MAKEINFO=${MAKEINFO-"${am_missing_run}makeinfo"}
> +@@ -4558,8 +4562,8 @@ MAKEINFO=${MAKEINFO-"${am_missing_run}makeinfo"}
>    
>    # For better backward compatibility.  To be removed once Automake 1.9.x
>    # dies out for good.  For more background, see:
> @@ -16250,7 +16254,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    mkdir_p='$(MKDIR_P)'
>    
>    # We need awk for the "check" target (and possibly the TAP driver).  The
> -@@ -4571,6 +4575,20 @@ am__tar='$${TAR-tar} chof - "$$tardir"' am__untar='$${TAR-tar} xf -'
> +@@ -4578,6 +4582,20 @@ am__tar='$${TAR-tar} chof - "$$tardir"' am__untar='$${TAR-tar} xf -'
>    
>    
>    
> @@ -16271,7 +16275,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>    # POSIX will say in a future version that running "rm -f" with no argument
>    # is OK; and we want to be able to make that assumption in our Makefile
> -@@ -4603,7 +4621,7 @@ END
> +@@ -4610,7 +4628,7 @@ END
>    Aborting the configuration process, to ensure you take notice of the issue.
>    
>    You can download and install GNU coreutils to get an 'rm' implementation
> @@ -16280,7 +16284,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>    If you want to complete the configuration process using your problematic
>    'rm' anyway, export the environment variable ACCEPT_INFERIOR_RM_PROGRAM
> -@@ -5446,8 +5464,8 @@ esac
> +@@ -5453,8 +5471,8 @@ esac
>    
>    
>    
> @@ -16291,7 +16295,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>    
>    
> -@@ -5487,7 +5505,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5494,7 +5512,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>    $as_echo_n "checking how to print strings... " >&6; }
>    # Test print first, because it will be a builtin if present.
> @@ -16300,7 +16304,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>       test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>      ECHO='print -r --'
>    elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6180,8 +6198,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -6187,8 +6205,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>    # Try some XSI features
>    xsi_shell=no
>    ( _lt_dummy="a/b/c"
> @@ -16311,7 +16315,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>        && eval 'test $(( 1 + 1 )) -eq 2 \
>        && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>      && xsi_shell=yes
> -@@ -6230,6 +6248,80 @@ esac
> +@@ -6237,6 +6255,80 @@ esac
>    
>    
>    
> @@ -16392,7 +16396,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>    $as_echo_n "checking for $LD option to reload object files... " >&6; }
>    if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6246,6 +6338,11 @@ case $reload_flag in
> +@@ -6253,6 +6345,11 @@ case $reload_flag in
>    esac
>    reload_cmds='$LD$reload_flag -o $output$reload_objs'
>    case $host_os in
> @@ -16404,7 +16408,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>      darwin*)
>        if test "$GCC" = yes; then
>          reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6414,7 +6511,8 @@ mingw* | pw32*)
> +@@ -6421,7 +6518,8 @@ mingw* | pw32*)
>        lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>        lt_cv_file_magic_cmd='func_win32_libid'
>      else
> @@ -16414,7 +16418,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>        lt_cv_file_magic_cmd='$OBJDUMP -f'
>      fi
>      ;;
> -@@ -6573,6 +6671,21 @@ esac
> +@@ -6580,6 +6678,21 @@ esac
>    fi
>    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>    $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -16436,7 +16440,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    file_magic_cmd=$lt_cv_file_magic_cmd
>    deplibs_check_method=$lt_cv_deplibs_check_method
>    test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6588,6 +6701,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6595,6 +6708,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>    
>    
>    
> @@ -16594,7 +16598,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    plugin_option=
>    plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>    for plugin in $plugin_names; do
> -@@ -6602,8 +6866,10 @@ for plugin in $plugin_names; do
> +@@ -6609,8 +6873,10 @@ for plugin in $plugin_names; do
>    done
>    
>    if test -n "$ac_tool_prefix"; then
> @@ -16607,7 +16611,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_AR+:} false; then :
> -@@ -6619,7 +6885,7 @@ do
> +@@ -6626,7 +6892,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -16616,7 +16620,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -6639,11 +6905,15 @@ $as_echo "no" >&6; }
> +@@ -6646,11 +6912,15 @@ $as_echo "no" >&6; }
>    fi
>    
>    
> @@ -16635,7 +16639,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6659,7 +6929,7 @@ do
> +@@ -6666,7 +6936,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -16644,7 +16648,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -6678,6 +6948,10 @@ else
> +@@ -6685,6 +6955,10 @@ else
>    $as_echo "no" >&6; }
>    fi
>    
> @@ -16655,7 +16659,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>      if test "x$ac_ct_AR" = x; then
>        AR="false"
>      else
> -@@ -6689,31 +6963,83 @@ ac_tool_warned=yes ;;
> +@@ -6696,31 +6970,83 @@ ac_tool_warned=yes ;;
>    esac
>        AR=$ac_ct_AR
>      fi
> @@ -16754,7 +16758,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>    
>    
> -@@ -7058,8 +7384,8 @@ esac
> +@@ -7065,8 +7391,8 @@ esac
>    lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>    
>    # Transform an extracted symbol line into symbol name and symbol address
> @@ -16765,7 +16769,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>    # Handle CRLF in mingw tool chain
>    opt_cr=
> -@@ -7095,6 +7421,7 @@ for ac_symprfx in "" "_"; do
> +@@ -7102,6 +7428,7 @@ for ac_symprfx in "" "_"; do
>      else
>        lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>      fi
> @@ -16773,7 +16777,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>      # Check to see that the pipe works correctly.
>      pipe_works=no
> -@@ -7136,6 +7463,18 @@ _LT_EOF
> +@@ -7143,6 +7470,18 @@ _LT_EOF
>          if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>    	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>    	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -16792,7 +16796,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    #ifdef __cplusplus
>    extern "C" {
>    #endif
> -@@ -7147,7 +7486,7 @@ _LT_EOF
> +@@ -7154,7 +7493,7 @@ _LT_EOF
>    	  cat <<_LT_EOF >> conftest.$ac_ext
>    
>    /* The mapping between symbol names and symbols.  */
> @@ -16801,7 +16805,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>      const char *name;
>      void       *address;
>    }
> -@@ -7173,8 +7512,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7180,8 +7519,8 @@ static const void *lt_preloaded_setup() {
>    _LT_EOF
>    	  # Now try linking the two files.
>    	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -16812,7 +16816,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    	  LIBS="conftstm.$ac_objext"
>    	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>    	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7184,8 +7523,8 @@ _LT_EOF
> +@@ -7191,8 +7530,8 @@ _LT_EOF
>      test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>    	    pipe_works=yes
>    	  fi
> @@ -16823,7 +16827,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    	else
>    	  echo "cannot find nm_test_func in $nlist" >&5
>    	fi
> -@@ -7222,6 +7561,18 @@ else
> +@@ -7229,6 +7568,18 @@ else
>    $as_echo "ok" >&6; }
>    fi
>    
> @@ -16842,7 +16846,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>    
>    
> -@@ -7238,6 +7589,43 @@ fi
> +@@ -7245,6 +7596,43 @@ fi
>    
>    
>    
> @@ -16886,7 +16890,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>    
>    
> -@@ -7404,50 +7792,167 @@ _ACEOF
> +@@ -7411,50 +7799,167 @@ _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>      lt_cv_cc_needs_belf=yes
>    else
> @@ -17093,7 +17097,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>    
>      case $host_os in
> -@@ -8012,6 +8517,8 @@ _LT_EOF
> +@@ -8019,6 +8524,8 @@ _LT_EOF
>          $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>          echo "$AR cru libconftest.a conftest.o" >&5
>          $AR cru libconftest.a conftest.o 2>&5
> @@ -17102,7 +17106,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>          cat > conftest.c << _LT_EOF
>    int main() { return 0;}
>    _LT_EOF
> -@@ -8596,8 +9103,6 @@ fi
> +@@ -8603,8 +9110,6 @@ fi
>    lt_prog_compiler_pic=
>    lt_prog_compiler_static=
>    
> @@ -17111,7 +17115,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>      if test "$GCC" = yes; then
>        lt_prog_compiler_wl='-Wl,'
> -@@ -8763,6 +9268,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8770,6 +9275,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>    	lt_prog_compiler_pic='--shared'
>    	lt_prog_compiler_static='--static'
>    	;;
> @@ -17124,7 +17128,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>          pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>            # Portland Group compilers (*not* the Pentium gcc compiler,
>    	# which looks to be a dead project)
> -@@ -8825,7 +9336,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8832,7 +9343,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>          lt_prog_compiler_pic='-KPIC'
>          lt_prog_compiler_static='-Bstatic'
>          case $cc_basename in
> @@ -17133,7 +17137,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    	lt_prog_compiler_wl='-Qoption ld ';;
>          *)
>    	lt_prog_compiler_wl='-Wl,';;
> -@@ -8882,13 +9393,17 @@ case $host_os in
> +@@ -8889,13 +9400,17 @@ case $host_os in
>        lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>        ;;
>    esac
> @@ -17157,7 +17161,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>    #
>    # Check to make sure the PIC flag actually works.
> -@@ -8949,6 +9464,11 @@ fi
> +@@ -8956,6 +9471,11 @@ fi
>    
>    
>    
> @@ -17169,7 +17173,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    #
>    # Check to make sure the static flag actually works.
>    #
> -@@ -9299,7 +9819,8 @@ _LT_EOF
> +@@ -9306,7 +9826,8 @@ _LT_EOF
>          allow_undefined_flag=unsupported
>          always_export_symbols=no
>          enable_shared_with_static_runtimes=yes
> @@ -17179,7 +17183,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>          if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>            archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9398,12 +9919,12 @@ _LT_EOF
> +@@ -9405,12 +9926,12 @@ _LT_EOF
>    	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>    	  hardcode_libdir_flag_spec=
>    	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -17194,7 +17198,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    	  fi
>    	  ;;
>    	esac
> -@@ -9417,8 +9938,8 @@ _LT_EOF
> +@@ -9424,8 +9945,8 @@ _LT_EOF
>    	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>    	wlarc=
>          else
> @@ -17205,7 +17209,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>          fi
>          ;;
>    
> -@@ -9436,8 +9957,8 @@ _LT_EOF
> +@@ -9443,8 +9964,8 @@ _LT_EOF
>    
>    _LT_EOF
>          elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -17216,7 +17220,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -9483,8 +10004,8 @@ _LT_EOF
> +@@ -9490,8 +10011,8 @@ _LT_EOF
>    
>        *)
>          if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -17227,7 +17231,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -9614,7 +10135,13 @@ _LT_EOF
> +@@ -9621,7 +10142,13 @@ _LT_EOF
>    	allow_undefined_flag='-berok'
>            # Determine the default libpath from the value encoded in an
>            # empty executable.
> @@ -17242,7 +17246,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -9627,22 +10154,29 @@ main ()
> +@@ -9634,22 +10161,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -17285,7 +17289,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>            hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>            archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9654,7 +10188,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9661,7 +10195,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	else
>    	 # Determine the default libpath from the value encoded in an
>    	 # empty executable.
> @@ -17300,7 +17304,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -9667,22 +10207,29 @@ main ()
> +@@ -9674,22 +10214,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -17343,7 +17347,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    
>    	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>    	  # Warning - without using the other run time loading flags,
> -@@ -9727,20 +10274,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9734,20 +10281,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>          # Microsoft Visual C++.
>          # hardcode_libdir_flag_spec is actually meaningless, as there is
>          # no search path for DLLs.
> @@ -17421,7 +17425,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>          ;;
>    
>        darwin* | rhapsody*)
> -@@ -9801,7 +10391,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9808,7 +10398,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>        freebsd* | dragonfly*)
> @@ -17430,7 +17434,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>          hardcode_libdir_flag_spec='-R$libdir'
>          hardcode_direct=yes
>          hardcode_shlibpath_var=no
> -@@ -9809,7 +10399,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9816,7 +10406,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux9*)
>          if test "$GCC" = yes; then
> @@ -17439,7 +17443,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>          else
>    	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>          fi
> -@@ -9825,7 +10415,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9832,7 +10422,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux10*)
>          if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -17448,7 +17452,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>          else
>    	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>          fi
> -@@ -9849,10 +10439,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9856,10 +10446,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
>    	  ;;
>    	ia64*)
> @@ -17461,7 +17465,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    	  ;;
>    	esac
>          else
> -@@ -9931,23 +10521,36 @@ fi
> +@@ -9938,23 +10528,36 @@ fi
>    
>        irix5* | irix6* | nonstopux*)
>          if test "$GCC" = yes; then
> @@ -17506,7 +17510,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>          else
>    	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>    	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -10032,7 +10635,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10039,7 +10642,7 @@ rm -f core conftest.err conftest.$ac_objext \
>        osf4* | osf5*)	# as osf3* with the addition of -msym flag
>          if test "$GCC" = yes; then
>    	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -17515,7 +17519,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>          else
>    	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -10051,9 +10654,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10058,9 +10661,9 @@ rm -f core conftest.err conftest.$ac_objext \
>          no_undefined_flag=' -z defs'
>          if test "$GCC" = yes; then
>    	wlarc='${wl}'
> @@ -17527,7 +17531,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>          else
>    	case `$CC -V 2>&1` in
>    	*"Compilers 5.0"*)
> -@@ -10629,8 +11232,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10636,8 +11239,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>      need_version=no
>      need_lib_prefix=no
>    
> @@ -17539,7 +17543,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>        library_names_spec='$libname.dll.a'
>        # DLL is installed to $(libdir)/../bin by postinstall_cmds
>        postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10663,13 +11267,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10670,13 +11274,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>          library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>          ;;
>        esac
> @@ -17612,16 +17616,16 @@ index e5ca8ad9379..b7c4c4be78d 100755
>      # FIXME: first we should search . and the directory the executable is in
>      shlibpath_var=PATH
>      ;;
> -@@ -11571,7 +12233,7 @@ else
> +@@ -11578,7 +12240,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 11574 "configure"
> +-#line 11581 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -11615,10 +12277,10 @@ else
> +@@ -11622,10 +12284,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -17634,16 +17638,16 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11677,7 +12339,7 @@ else
> +@@ -11684,7 +12346,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 11680 "configure"
> +-#line 11687 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -11721,10 +12383,10 @@ else
> +@@ -11728,10 +12390,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -17656,7 +17660,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -15010,13 +15672,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -15191,13 +15853,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>    lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>    lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>    lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -17677,7 +17681,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>    RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>    old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -15031,14 +15700,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -15212,14 +15881,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>    lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -17696,7 +17700,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>    NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>    LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -15071,12 +15743,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -15252,12 +15924,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>    hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>    inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>    link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -17710,7 +17714,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>    variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>    need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -15131,8 +15803,13 @@ reload_flag \
> +@@ -15312,8 +15984,13 @@ reload_flag \
>    OBJDUMP \
>    deplibs_check_method \
>    file_magic_cmd \
> @@ -17724,7 +17728,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    STRIP \
>    RANLIB \
>    CC \
> -@@ -15142,12 +15819,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -15323,12 +16000,14 @@ lt_cv_sys_global_symbol_pipe \
>    lt_cv_sys_global_symbol_to_cdecl \
>    lt_cv_sys_global_symbol_to_c_name_address \
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -17740,7 +17744,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    DSYMUTIL \
>    NMEDIT \
>    LIPO \
> -@@ -15163,7 +15842,6 @@ no_undefined_flag \
> +@@ -15344,7 +16023,6 @@ no_undefined_flag \
>    hardcode_libdir_flag_spec \
>    hardcode_libdir_flag_spec_ld \
>    hardcode_libdir_separator \
> @@ -17748,7 +17752,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    exclude_expsyms \
>    include_expsyms \
>    file_list_spec \
> -@@ -15199,6 +15877,7 @@ module_cmds \
> +@@ -15380,6 +16058,7 @@ module_cmds \
>    module_expsym_cmds \
>    export_symbols_cmds \
>    prelink_cmds \
> @@ -17756,7 +17760,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    postinstall_cmds \
>    postuninstall_cmds \
>    finish_cmds \
> -@@ -15897,7 +16576,8 @@ esac ;;
> +@@ -16078,7 +16757,8 @@ esac ;;
>    # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>    #
>    #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -17766,7 +17770,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    #   Written by Gordon Matzigkeit, 1996
>    #
>    #   This file is part of GNU Libtool.
> -@@ -16000,19 +16680,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -16181,19 +16861,42 @@ SP2NL=$lt_lt_SP2NL
>    # turn newlines into spaces.
>    NL2SP=$lt_lt_NL2SP
>    
> @@ -17810,7 +17814,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    # A symbol stripping program.
>    STRIP=$lt_STRIP
>    
> -@@ -16042,6 +16745,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -16223,6 +16926,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>    # Transform the output of nm in a C name address pair when lib prefix is needed.
>    global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>    
> @@ -17823,7 +17827,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    # The name of the directory that contains temporary libtool files.
>    objdir=$objdir
>    
> -@@ -16051,6 +16760,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -16232,6 +16941,9 @@ MAGIC_CMD=$MAGIC_CMD
>    # Must we lock files when doing compilation?
>    need_locks=$lt_need_locks
>    
> @@ -17833,7 +17837,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>    DSYMUTIL=$lt_DSYMUTIL
>    
> -@@ -16165,12 +16877,12 @@ with_gcc=$GCC
> +@@ -16346,12 +17058,12 @@ with_gcc=$GCC
>    # Compiler flag to turn off builtin functions.
>    no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>    
> @@ -17849,7 +17853,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    # Compiler flag to prevent dynamic linking.
>    link_static_flag=$lt_lt_prog_compiler_static
>    
> -@@ -16257,9 +16969,6 @@ inherit_rpath=$inherit_rpath
> +@@ -16438,9 +17150,6 @@ inherit_rpath=$inherit_rpath
>    # Whether libtool must link a program against all its dependency libraries.
>    link_all_deplibs=$link_all_deplibs
>    
> @@ -17859,7 +17863,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    # Set to "yes" if exported symbols are required.
>    always_export_symbols=$always_export_symbols
>    
> -@@ -16275,6 +16984,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -16456,6 +17165,9 @@ include_expsyms=$lt_include_expsyms
>    # Commands necessary for linking programs (against libraries) with templates.
>    prelink_cmds=$lt_prelink_cmds
>    
> @@ -17869,7 +17873,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>    # Specify filename containing input files.
>    file_list_spec=$lt_file_list_spec
>    
> -@@ -16307,210 +17019,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -16488,210 +17200,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>      # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>      # text mode, it properly converts lines to CR/LF.  This bash problem
>      # is reportedly fixed, but why not run on old versions too?
> @@ -18244,7 +18248,7 @@ index e5ca8ad9379..b7c4c4be78d 100755
>      chmod +x "$ofile"
>    
>   diff --git a/libctf/Makefile.in b/libctf/Makefile.in
> -index 1cdf105a323..b69d6472e86 100644
> +index 54f5daa79ee..ce780a7ccde 100644
>   --- a/libctf/Makefile.in
>   +++ b/libctf/Makefile.in
>   @@ -442,6 +442,7 @@ CYGPATH_W = @CYGPATH_W@
> @@ -18264,7 +18268,7 @@ index 1cdf105a323..b69d6472e86 100644
>    MKINSTALLDIRS = @MKINSTALLDIRS@
>    MSGFMT = @MSGFMT@
>   diff --git a/libctf/configure b/libctf/configure
> -index 3701bd8e796..9e36ae7c51c 100755
> +index 7466d56a18b..0325e438a47 100755
>   --- a/libctf/configure
>   +++ b/libctf/configure
>   @@ -669,6 +669,8 @@ OTOOL
> @@ -19543,7 +19547,16 @@ index 3701bd8e796..9e36ae7c51c 100755
>      # FIXME: first we should search . and the directory the executable is in
>      shlibpath_var=PATH
>      ;;
> -@@ -13640,10 +14293,10 @@ else
> +@@ -13596,7 +14245,7 @@ else
> +   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
> +   lt_status=$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 13599 "configure"
> ++#line $LINENO "configure"
> + #include "confdefs.h"
> +
> + #if HAVE_DLFCN_H
> +@@ -13640,10 +14289,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -19556,7 +19569,16 @@ index 3701bd8e796..9e36ae7c51c 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -13746,10 +14403,10 @@ else
> +@@ -13702,7 +14351,7 @@ else
> +   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
> +   lt_status=$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 13705 "configure"
> ++#line $LINENO "configure"
> + #include "confdefs.h"
> +
> + #if HAVE_DLFCN_H
> +@@ -13746,10 +14395,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -19569,7 +19591,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -17797,13 +18454,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -17813,13 +18462,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>    lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>    lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>    lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -19590,7 +19612,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>    RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>    old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -17818,14 +18482,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -17834,14 +18490,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>    lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -19609,7 +19631,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>    NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>    LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -17858,12 +18525,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -17874,12 +18533,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>    hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>    inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>    link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -19623,7 +19645,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>    variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>    need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -17918,8 +18585,13 @@ reload_flag \
> +@@ -17934,8 +18593,13 @@ reload_flag \
>    OBJDUMP \
>    deplibs_check_method \
>    file_magic_cmd \
> @@ -19637,7 +19659,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    STRIP \
>    RANLIB \
>    CC \
> -@@ -17929,12 +18601,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -17945,12 +18609,14 @@ lt_cv_sys_global_symbol_pipe \
>    lt_cv_sys_global_symbol_to_cdecl \
>    lt_cv_sys_global_symbol_to_c_name_address \
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -19653,7 +19675,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    DSYMUTIL \
>    NMEDIT \
>    LIPO \
> -@@ -17950,7 +18624,6 @@ no_undefined_flag \
> +@@ -17966,7 +18632,6 @@ no_undefined_flag \
>    hardcode_libdir_flag_spec \
>    hardcode_libdir_flag_spec_ld \
>    hardcode_libdir_separator \
> @@ -19661,7 +19683,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    exclude_expsyms \
>    include_expsyms \
>    file_list_spec \
> -@@ -17986,6 +18659,7 @@ module_cmds \
> +@@ -18002,6 +18667,7 @@ module_cmds \
>    module_expsym_cmds \
>    export_symbols_cmds \
>    prelink_cmds \
> @@ -19669,7 +19691,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    postinstall_cmds \
>    postuninstall_cmds \
>    finish_cmds \
> -@@ -18845,7 +19519,8 @@ $as_echo X"$file" |
> +@@ -18861,7 +19527,8 @@ $as_echo X"$file" |
>    # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>    #
>    #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -19679,7 +19701,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    #   Written by Gordon Matzigkeit, 1996
>    #
>    #   This file is part of GNU Libtool.
> -@@ -18948,19 +19623,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -18964,19 +19631,42 @@ SP2NL=$lt_lt_SP2NL
>    # turn newlines into spaces.
>    NL2SP=$lt_lt_NL2SP
>    
> @@ -19723,7 +19745,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    # A symbol stripping program.
>    STRIP=$lt_STRIP
>    
> -@@ -18990,6 +19688,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -19006,6 +19696,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>    # Transform the output of nm in a C name address pair when lib prefix is needed.
>    global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>    
> @@ -19736,7 +19758,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    # The name of the directory that contains temporary libtool files.
>    objdir=$objdir
>    
> -@@ -18999,6 +19703,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -19015,6 +19711,9 @@ MAGIC_CMD=$MAGIC_CMD
>    # Must we lock files when doing compilation?
>    need_locks=$lt_need_locks
>    
> @@ -19746,7 +19768,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>    DSYMUTIL=$lt_DSYMUTIL
>    
> -@@ -19113,12 +19820,12 @@ with_gcc=$GCC
> +@@ -19129,12 +19828,12 @@ with_gcc=$GCC
>    # Compiler flag to turn off builtin functions.
>    no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>    
> @@ -19762,7 +19784,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    # Compiler flag to prevent dynamic linking.
>    link_static_flag=$lt_lt_prog_compiler_static
>    
> -@@ -19205,9 +19912,6 @@ inherit_rpath=$inherit_rpath
> +@@ -19221,9 +19920,6 @@ inherit_rpath=$inherit_rpath
>    # Whether libtool must link a program against all its dependency libraries.
>    link_all_deplibs=$link_all_deplibs
>    
> @@ -19772,7 +19794,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    # Set to "yes" if exported symbols are required.
>    always_export_symbols=$always_export_symbols
>    
> -@@ -19223,6 +19927,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -19239,6 +19935,9 @@ include_expsyms=$lt_include_expsyms
>    # Commands necessary for linking programs (against libraries) with templates.
>    prelink_cmds=$lt_prelink_cmds
>    
> @@ -19782,7 +19804,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>    # Specify filename containing input files.
>    file_list_spec=$lt_file_list_spec
>    
> -@@ -19255,210 +19962,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -19271,210 +19970,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>      # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>      # text mode, it properly converts lines to CR/LF.  This bash problem
>      # is reportedly fixed, but why not run on old versions too?
> @@ -20157,7 +20179,7 @@ index 3701bd8e796..9e36ae7c51c 100755
>      chmod +x "$ofile"
>    
>   diff --git a/libsframe/Makefile.in b/libsframe/Makefile.in
> -index 9e3d268902b..c22ed33460a 100644
> +index 8915321da78..13c725a698d 100644
>   --- a/libsframe/Makefile.in
>   +++ b/libsframe/Makefile.in
>   @@ -1,7 +1,7 @@
> @@ -20170,7 +20192,7 @@ index 9e3d268902b..c22ed33460a 100644
>    
>    # This Makefile.in is free software; the Free Software Foundation
>    # gives unlimited permission to copy and/or distribute it,
> -@@ -142,6 +142,13 @@ mkinstalldirs = $(SHELL) $(top_srcdir)/../mkinstalldirs
> +@@ -144,6 +144,13 @@ mkinstalldirs = $(SHELL) $(top_srcdir)/../mkinstalldirs
>    CONFIG_HEADER = config.h
>    CONFIG_CLEAN_FILES =
>    CONFIG_CLEAN_VPATH_FILES =
> @@ -20184,7 +20206,7 @@ index 9e3d268902b..c22ed33460a 100644
>    am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
>    am__vpath_adj = case $$p in \
>        $(srcdir)/*) f=`echo "$$p" | sed "s|^$$srcdirstrip/||"`;; \
> -@@ -185,45 +192,44 @@ libsframe_la_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) \
> +@@ -187,45 +194,44 @@ libsframe_la_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) \
>    	$(libsframe_la_LDFLAGS) $(LDFLAGS) -o $@
>    @INSTALL_LIBBFD_FALSE@am_libsframe_la_rpath =
>    @INSTALL_LIBBFD_TRUE@am_libsframe_la_rpath = -rpath $(libdir)
> @@ -20243,7 +20265,7 @@ index 9e3d268902b..c22ed33460a 100644
>    testsuite_libsframe_find_plt_findfre_1_OBJECTS =  \
>    	$(am_testsuite_libsframe_find_plt_findfre_1_OBJECTS)
>    testsuite_libsframe_find_plt_findfre_1_DEPENDENCIES =  \
> -@@ -242,7 +248,17 @@ am__v_at_0 = @
> +@@ -244,7 +250,17 @@ am__v_at_0 = @
>    am__v_at_1 =
>    DEFAULT_INCLUDES = -I.@am__isrc@
>    depcomp = $(SHELL) $(top_srcdir)/../depcomp
> @@ -20262,7 +20284,7 @@ index 9e3d268902b..c22ed33460a 100644
>    am__mv = mv -f
>    COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
>    	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
> -@@ -325,8 +341,8 @@ am__can_run_installinfo = \
> +@@ -327,8 +343,8 @@ am__can_run_installinfo = \
>      esac
>    am__include_HEADERS_DIST = $(INCDIR)/sframe.h $(INCDIR)/sframe-api.h
>    HEADERS = $(include_HEADERS)
> @@ -20273,7 +20295,7 @@ index 9e3d268902b..c22ed33460a 100644
>    # Read a list of newline-separated strings from the standard input,
>    # and print each of them once, without duplicates.  Input order is
>    # *not* preserved.
> -@@ -343,9 +359,6 @@ am__define_uniq_tagged_files = \
> +@@ -345,9 +361,6 @@ am__define_uniq_tagged_files = \
>      unique=`for i in $$list; do \
>        if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
>      done | $(am__uniquify_input)`
> @@ -20283,7 +20305,7 @@ index 9e3d268902b..c22ed33460a 100644
>    AM_RECURSIVE_TARGETS = cscope
>    DEJATOOL = $(PACKAGE)
>    RUNTESTDEFAULTFLAGS = --tool $$tool --srcdir $$srcdir
> -@@ -372,6 +385,8 @@ am__post_remove_distdir = $(am__remove_distdir)
> +@@ -374,6 +387,8 @@ am__post_remove_distdir = $(am__remove_distdir)
>    DIST_ARCHIVES = $(distdir).tar.gz
>    GZIP_ENV = --best
>    DIST_TARGETS = dist-gzip
> @@ -20292,7 +20314,7 @@ index 9e3d268902b..c22ed33460a 100644
>    distuninstallcheck_listfiles = find . -type f -print
>    am__distuninstallcheck_listfiles = $(distuninstallcheck_listfiles) \
>      | sed 's|^\./|$(prefix)/|' | grep -v '$(infodir)/dir$$'
> -@@ -390,15 +405,19 @@ CFLAGS = @CFLAGS@
> +@@ -392,15 +407,19 @@ CFLAGS = @CFLAGS@
>    COMPAT_DEJAGNU = @COMPAT_DEJAGNU@
>    CPP = @CPP@
>    CPPFLAGS = @CPPFLAGS@
> @@ -20312,7 +20334,7 @@ index 9e3d268902b..c22ed33460a 100644
>    EXEEXT = @EXEEXT@
>    FGREP = @FGREP@
>    GREP = @GREP@
> -@@ -417,6 +436,7 @@ LN_S = @LN_S@
> +@@ -419,6 +438,7 @@ LN_S = @LN_S@
>    LTLIBOBJS = @LTLIBOBJS@
>    MAINT = @MAINT@
>    MAKEINFO = @MAKEINFO@
> @@ -20320,7 +20342,7 @@ index 9e3d268902b..c22ed33460a 100644
>    MKDIR_P = @MKDIR_P@
>    NM = @NM@
>    NMEDIT = @NMEDIT@
> -@@ -589,8 +609,8 @@ Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
> +@@ -595,8 +615,8 @@ Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
>    	    echo ' $(SHELL) ./config.status'; \
>    	    $(SHELL) ./config.status;; \
>    	  *) \
> @@ -20331,7 +20353,7 @@ index 9e3d268902b..c22ed33460a 100644
>    	esac;
>    $(srcdir)/doc/local.mk $(srcdir)/testsuite/local.mk $(srcdir)/testsuite/libsframe.decode/local.mk $(srcdir)/testsuite/libsframe.encode/local.mk $(srcdir)/testsuite/libsframe.find/local.mk $(am__empty):
>    
> -@@ -618,6 +638,15 @@ $(srcdir)/config.h.in: @MAINTAINER_MODE_TRUE@ $(am__configure_deps)
> +@@ -624,6 +644,15 @@ $(srcdir)/config.h.in: @MAINTAINER_MODE_TRUE@ $(am__configure_deps)
>    distclean-hdr:
>    	-rm -f config.h stamp-h1
>    
> @@ -20347,7 +20369,7 @@ index 9e3d268902b..c22ed33460a 100644
>    install-libLTLIBRARIES: $(lib_LTLIBRARIES)
>    	@$(NORMAL_INSTALL)
>    	@list='$(lib_LTLIBRARIES)'; test -n "$(libdir)" || list=; \
> -@@ -666,36 +695,27 @@ clean-noinstLTLIBRARIES:
> +@@ -672,36 +701,27 @@ clean-noinstLTLIBRARIES:
>    
>    libsframe.la: $(libsframe_la_OBJECTS) $(libsframe_la_DEPENDENCIES) $(EXTRA_libsframe_la_DEPENDENCIES)
>    	$(AM_V_CCLD)$(libsframe_la_LINK) $(am_libsframe_la_rpath) $(libsframe_la_OBJECTS) $(libsframe_la_LIBADD) $(LIBS)
> @@ -20387,7 +20409,7 @@ index 9e3d268902b..c22ed33460a 100644
>    	testsuite/libsframe.decode/$(am__dirstamp) \
>    	testsuite/libsframe.decode/$(DEPDIR)/$(am__dirstamp)
>    
> -@@ -708,7 +728,7 @@ testsuite/libsframe.encode/$(am__dirstamp):
> +@@ -714,7 +734,7 @@ testsuite/libsframe.encode/$(am__dirstamp):
>    testsuite/libsframe.encode/$(DEPDIR)/$(am__dirstamp):
>    	@$(MKDIR_P) testsuite/libsframe.encode/$(DEPDIR)
>    	@: > testsuite/libsframe.encode/$(DEPDIR)/$(am__dirstamp)
> @@ -20396,7 +20418,7 @@ index 9e3d268902b..c22ed33460a 100644
>    	testsuite/libsframe.encode/$(am__dirstamp) \
>    	testsuite/libsframe.encode/$(DEPDIR)/$(am__dirstamp)
>    
> -@@ -721,21 +741,21 @@ testsuite/libsframe.find/$(am__dirstamp):
> +@@ -727,21 +747,21 @@ testsuite/libsframe.find/$(am__dirstamp):
>    testsuite/libsframe.find/$(DEPDIR)/$(am__dirstamp):
>    	@$(MKDIR_P) testsuite/libsframe.find/$(DEPDIR)
>    	@: > testsuite/libsframe.find/$(DEPDIR)/$(am__dirstamp)
> @@ -20421,7 +20443,7 @@ index 9e3d268902b..c22ed33460a 100644
>    	testsuite/libsframe.find/$(am__dirstamp) \
>    	testsuite/libsframe.find/$(DEPDIR)/$(am__dirstamp)
>    
> -@@ -752,16 +772,22 @@ mostlyclean-compile:
> +@@ -758,16 +778,22 @@ mostlyclean-compile:
>    distclean-compile:
>    	-rm -f *.tab.c
>    
> @@ -20454,7 +20476,7 @@ index 9e3d268902b..c22ed33460a 100644
>    
>    .c.o:
>    @am__fastdepCC_TRUE@	$(AM_V_CC)depbase=`echo $@ | sed 's|[^/]*$$|$(DEPDIR)/&|;s|\.o$$||'`;\
> -@@ -808,103 +834,103 @@ libsframe_la-sframe-error.lo: sframe-error.c
> +@@ -814,103 +840,103 @@ libsframe_la-sframe-error.lo: sframe-error.c
>    @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
>    @am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) --mode=compile $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(libsframe_la_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o libsframe_la-sframe-error.lo `test -f 'sframe-error.c' || echo '$(srcdir)/'`sframe-error.c
>    
> @@ -20628,7 +20650,7 @@ index 9e3d268902b..c22ed33460a 100644
>    
>    mostlyclean-libtool:
>    	-rm -f *.lo
> -@@ -1142,7 +1168,7 @@ site.exp: Makefile $(EXTRA_DEJAGNU_SITE_CONFIG)
> +@@ -1148,7 +1174,7 @@ site.exp: Makefile $(EXTRA_DEJAGNU_SITE_CONFIG)
>    	@echo '# Do not edit here.  If you wish to override these values' >>site.tmp
>    	@echo '# edit the last section' >>site.tmp
>    	@echo 'set srcdir "$(srcdir)"' >>site.tmp
> @@ -20637,7 +20659,7 @@ index 9e3d268902b..c22ed33460a 100644
>    	@echo 'set build_alias "$(build_alias)"' >>site.tmp
>    	@echo 'set build_triplet $(build_triplet)' >>site.tmp
>    	@echo 'set host_alias "$(host_alias)"' >>site.tmp
> -@@ -1166,8 +1192,10 @@ distclean-DEJAGNU:
> +@@ -1174,8 +1200,10 @@ distclean-DEJAGNU:
>    	-l='$(DEJATOOL)'; for tool in $$l; do \
>    	  rm -f $$tool.sum $$tool.log; \
>    	done
> @@ -20649,7 +20671,7 @@ index 9e3d268902b..c22ed33460a 100644
>    	$(am__remove_distdir)
>    	test -d "$(distdir)" || mkdir "$(distdir)"
>    	@srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; \
> -@@ -1225,6 +1253,10 @@ dist-xz: distdir
> +@@ -1233,6 +1261,10 @@ dist-xz: distdir
>    	tardir=$(distdir) && $(am__tar) | XZ_OPT=$${XZ_OPT--e} xz -c >$(distdir).tar.xz
>    	$(am__post_remove_distdir)
>    
> @@ -20660,7 +20682,7 @@ index 9e3d268902b..c22ed33460a 100644
>    dist-tarZ: distdir
>    	@echo WARNING: "Support for distribution archives compressed with" \
>    		       "legacy program 'compress' is deprecated." >&2
> -@@ -1267,6 +1299,8 @@ distcheck: dist
> +@@ -1275,6 +1307,8 @@ distcheck: dist
>    	  eval GZIP= gzip $(GZIP_ENV) -dc $(distdir).shar.gz | unshar ;;\
>    	*.zip*) \
>    	  unzip $(distdir).zip ;;\
> @@ -20669,7 +20691,7 @@ index 9e3d268902b..c22ed33460a 100644
>    	esac
>    	chmod -R a-w $(distdir)
>    	chmod u+w $(distdir)
> -@@ -1282,7 +1316,7 @@ distcheck: dist
> +@@ -1290,7 +1324,7 @@ distcheck: dist
>    	    $(DISTCHECK_CONFIGURE_FLAGS) \
>    	    --srcdir=../.. --prefix="$$dc_install_base" \
>    	  && $(MAKE) $(AM_MAKEFLAGS) \
> @@ -20678,7 +20700,7 @@ index 9e3d268902b..c22ed33460a 100644
>    	  && $(MAKE) $(AM_MAKEFLAGS) check \
>    	  && $(MAKE) $(AM_MAKEFLAGS) install \
>    	  && $(MAKE) $(AM_MAKEFLAGS) installcheck \
> -@@ -1338,6 +1372,8 @@ check-am: all-am
> +@@ -1346,6 +1380,8 @@ check-am: all-am
>    	$(MAKE) $(AM_MAKEFLAGS) check-DEJAGNU
>    check: check-am
>    all-am: Makefile $(INFO_DEPS) $(LTLIBRARIES) $(HEADERS) config.h
> @@ -20687,7 +20709,7 @@ index 9e3d268902b..c22ed33460a 100644
>    installdirs:
>    	for dir in "$(DESTDIR)$(libdir)" "$(DESTDIR)$(infodir)" "$(DESTDIR)$(includedir)"; do \
>    	  test -z "$$dir" || $(MKDIR_P) "$$dir"; \
> -@@ -1390,7 +1426,16 @@ clean-am: clean-aminfo clean-checkPROGRAMS clean-generic \
> +@@ -1398,7 +1434,16 @@ clean-am: clean-aminfo clean-checkPROGRAMS clean-generic \
>    
>    distclean: distclean-am
>    	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
> @@ -20705,7 +20727,7 @@ index 9e3d268902b..c22ed33460a 100644
>    	-rm -f Makefile
>    distclean-am: clean-am distclean-DEJAGNU distclean-compile \
>    	distclean-generic distclean-hdr distclean-libtool \
> -@@ -1530,7 +1575,16 @@ installcheck-am:
> +@@ -1538,7 +1583,16 @@ installcheck-am:
>    maintainer-clean: maintainer-clean-am
>    	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
>    	-rm -rf $(top_srcdir)/autom4te.cache
> @@ -20723,7 +20745,7 @@ index 9e3d268902b..c22ed33460a 100644
>    	-rm -f Makefile
>    maintainer-clean-am: distclean-am maintainer-clean-aminfo \
>    	maintainer-clean-generic
> -@@ -1554,28 +1608,28 @@ uninstall-am: uninstall-dvi-am uninstall-html-am \
> +@@ -1562,28 +1616,28 @@ uninstall-am: uninstall-dvi-am uninstall-html-am \
>    
>    .MAKE: all check-am install-am install-strip
>    
> @@ -20773,7 +20795,7 @@ index 9e3d268902b..c22ed33460a 100644
>    .PRECIOUS: Makefile
>    
>   diff --git a/libsframe/aclocal.m4 b/libsframe/aclocal.m4
> -index b0cdd6b184d..c83d4f62ece 100644
> +index 8804d9fb42b..f4974423bd6 100644
>   --- a/libsframe/aclocal.m4
>   +++ b/libsframe/aclocal.m4
>   @@ -1,6 +1,6 @@
> @@ -21222,7 +21244,7 @@ index b0cdd6b184d..c83d4f62ece 100644
>    # This file is free software; the Free Software Foundation
>    # gives unlimited permission to copy and/or distribute it,
>   diff --git a/libsframe/configure b/libsframe/configure
> -index 1d9e5e10695..a234c4815b1 100755
> +index 4727eff533a..ca3885ad105 100755
>   --- a/libsframe/configure
>   +++ b/libsframe/configure
>   @@ -658,6 +658,8 @@ OTOOL
> @@ -21234,7 +21256,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    OBJDUMP
>    LN_S
>    NM
> -@@ -682,6 +684,9 @@ AM_BACKSLASH
> +@@ -674,6 +676,9 @@ AM_BACKSLASH
>    AM_DEFAULT_VERBOSITY
>    AM_DEFAULT_V
>    AM_V
> @@ -21244,7 +21266,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    am__fastdepCC_FALSE
>    am__fastdepCC_TRUE
>    CCDEPMODE
> -@@ -689,7 +694,6 @@ am__nodep
> +@@ -681,7 +686,6 @@ am__nodep
>    AMDEPBACKSLASH
>    AMDEP_FALSE
>    AMDEP_TRUE
> @@ -21252,7 +21274,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    am__include
>    DEPDIR
>    am__untar
> -@@ -762,7 +766,8 @@ PACKAGE_VERSION
> +@@ -766,7 +770,8 @@ PACKAGE_VERSION
>    PACKAGE_TARNAME
>    PACKAGE_NAME
>    PATH_SEPARATOR
> @@ -21262,7 +21284,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    ac_subst_files=''
>    ac_user_opts='
>    enable_option_checking
> -@@ -773,6 +778,7 @@ enable_static
> +@@ -777,6 +782,7 @@ enable_static
>    with_pic
>    enable_fast_install
>    with_gnu_ld
> @@ -21270,7 +21292,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    enable_libtool_lock
>    enable_largefile
>    enable_maintainer_mode
> -@@ -1428,6 +1434,8 @@ Optional Packages:
> +@@ -1433,6 +1439,8 @@ Optional Packages:
>      --with-pic              try to use only PIC/non-PIC objects [default=use
>                              both]
>      --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -21279,7 +21301,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    Some influential environment variables:
>      CC          C compiler command
> -@@ -3610,7 +3618,7 @@ $as_echo "$ac_cv_safe_to_define___extensions__" >&6; }
> +@@ -3727,7 +3735,7 @@ $as_echo "$ac_cv_safe_to_define___extensions__" >&6; }
>      $as_echo "#define _TANDEM_SOURCE 1" >>confdefs.h
>    
>    
> @@ -21288,7 +21310,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    # Find a good install program.  We prefer a C program (faster),
>    # so one script is as good as another.  But avoid the broken or
> -@@ -3783,12 +3791,7 @@ ac_script='s/[\\$]/&&/g;s/;s,x,x,$//'
> +@@ -3900,12 +3908,7 @@ ac_script='s/[\\$]/&&/g;s/;s,x,x,$//'
>    program_transform_name=`$as_echo "$program_transform_name" | sed "$ac_script"`
>    
>    if test x"${MISSING+set}" != xset; then
> @@ -21302,7 +21324,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    fi
>    # Use eval to expand $SHELL
>    if eval "$MISSING --is-lightweight"; then
> -@@ -4036,45 +4039,45 @@ DEPDIR="${am__leading_dot}deps"
> +@@ -4153,45 +4156,45 @@ DEPDIR="${am__leading_dot}deps"
>    
>    ac_config_commands="$ac_config_commands depfiles"
>    
> @@ -21381,7 +21403,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    # Check whether --enable-dependency-tracking was given.
>    if test "${enable_dependency_tracking+set}" = set; then :
> -@@ -4186,8 +4189,8 @@ MAKEINFO=${MAKEINFO-"${am_missing_run}makeinfo"}
> +@@ -4303,8 +4306,8 @@ MAKEINFO=${MAKEINFO-"${am_missing_run}makeinfo"}
>    
>    # For better backward compatibility.  To be removed once Automake 1.9.x
>    # dies out for good.  For more background, see:
> @@ -21392,7 +21414,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    mkdir_p='$(MKDIR_P)'
>    
>    # We need awk for the "check" target (and possibly the TAP driver).  The
> -@@ -4334,6 +4337,20 @@ else
> +@@ -4451,6 +4454,20 @@ else
>    fi
>    
>    
> @@ -21413,7 +21435,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    # POSIX will say in a future version that running "rm -f" with no argument
>    # is OK; and we want to be able to make that assumption in our Makefile
> -@@ -4366,7 +4383,7 @@ END
> +@@ -4483,7 +4500,7 @@ END
>    Aborting the configuration process, to ensure you take notice of the issue.
>    
>    You can download and install GNU coreutils to get an 'rm' implementation
> @@ -21422,7 +21444,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    If you want to complete the configuration process using your problematic
>    'rm' anyway, export the environment variable ACCEPT_INFERIOR_RM_PROGRAM
> -@@ -5351,8 +5368,8 @@ esac
> +@@ -5468,8 +5485,8 @@ esac
>    
>    
>    
> @@ -21433,7 +21455,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    
>    
> -@@ -5463,7 +5480,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5509,7 +5526,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>    $as_echo_n "checking how to print strings... " >&6; }
>    # Test print first, because it will be a builtin if present.
> @@ -21442,7 +21464,7 @@ index 1d9e5e10695..a234c4815b1 100755
>       test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>      ECHO='print -r --'
>    elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6156,8 +6173,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -6202,8 +6219,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>    # Try some XSI features
>    xsi_shell=no
>    ( _lt_dummy="a/b/c"
> @@ -21453,7 +21475,7 @@ index 1d9e5e10695..a234c4815b1 100755
>        && eval 'test $(( 1 + 1 )) -eq 2 \
>        && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>      && xsi_shell=yes
> -@@ -6206,6 +6223,80 @@ esac
> +@@ -6252,6 +6269,80 @@ esac
>    
>    
>    
> @@ -21534,7 +21556,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>    $as_echo_n "checking for $LD option to reload object files... " >&6; }
>    if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6222,6 +6313,11 @@ case $reload_flag in
> +@@ -6268,6 +6359,11 @@ case $reload_flag in
>    esac
>    reload_cmds='$LD$reload_flag -o $output$reload_objs'
>    case $host_os in
> @@ -21546,7 +21568,7 @@ index 1d9e5e10695..a234c4815b1 100755
>      darwin*)
>        if test "$GCC" = yes; then
>          reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6390,7 +6486,8 @@ mingw* | pw32*)
> +@@ -6436,7 +6532,8 @@ mingw* | pw32*)
>        lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>        lt_cv_file_magic_cmd='func_win32_libid'
>      else
> @@ -21556,7 +21578,7 @@ index 1d9e5e10695..a234c4815b1 100755
>        lt_cv_file_magic_cmd='$OBJDUMP -f'
>      fi
>      ;;
> -@@ -6549,6 +6646,21 @@ esac
> +@@ -6595,6 +6692,21 @@ esac
>    fi
>    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>    $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -21578,7 +21600,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    file_magic_cmd=$lt_cv_file_magic_cmd
>    deplibs_check_method=$lt_cv_deplibs_check_method
>    test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6564,6 +6676,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6610,6 +6722,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>    
>    
>    
> @@ -21736,7 +21758,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    plugin_option=
>    plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>    for plugin in $plugin_names; do
> -@@ -6578,8 +6841,10 @@ for plugin in $plugin_names; do
> +@@ -6624,8 +6887,10 @@ for plugin in $plugin_names; do
>    done
>    
>    if test -n "$ac_tool_prefix"; then
> @@ -21749,7 +21771,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_AR+:} false; then :
> -@@ -6595,7 +6860,7 @@ do
> +@@ -6641,7 +6906,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -21758,7 +21780,7 @@ index 1d9e5e10695..a234c4815b1 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -6615,11 +6880,15 @@ $as_echo "no" >&6; }
> +@@ -6661,11 +6926,15 @@ $as_echo "no" >&6; }
>    fi
>    
>    
> @@ -21777,7 +21799,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6635,7 +6904,7 @@ do
> +@@ -6681,7 +6950,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -21786,7 +21808,7 @@ index 1d9e5e10695..a234c4815b1 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -6654,6 +6923,10 @@ else
> +@@ -6700,6 +6969,10 @@ else
>    $as_echo "no" >&6; }
>    fi
>    
> @@ -21797,7 +21819,7 @@ index 1d9e5e10695..a234c4815b1 100755
>      if test "x$ac_ct_AR" = x; then
>        AR="false"
>      else
> -@@ -6665,29 +6938,81 @@ ac_tool_warned=yes ;;
> +@@ -6711,29 +6984,81 @@ ac_tool_warned=yes ;;
>    esac
>        AR=$ac_ct_AR
>      fi
> @@ -21894,7 +21916,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    
>    
> -@@ -7034,8 +7359,8 @@ esac
> +@@ -7080,8 +7405,8 @@ esac
>    lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>    
>    # Transform an extracted symbol line into symbol name and symbol address
> @@ -21905,7 +21927,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    # Handle CRLF in mingw tool chain
>    opt_cr=
> -@@ -7071,6 +7396,7 @@ for ac_symprfx in "" "_"; do
> +@@ -7117,6 +7442,7 @@ for ac_symprfx in "" "_"; do
>      else
>        lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>      fi
> @@ -21913,7 +21935,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>      # Check to see that the pipe works correctly.
>      pipe_works=no
> -@@ -7112,6 +7438,18 @@ _LT_EOF
> +@@ -7158,6 +7484,18 @@ _LT_EOF
>          if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>    	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>    	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -21932,7 +21954,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    #ifdef __cplusplus
>    extern "C" {
>    #endif
> -@@ -7123,7 +7461,7 @@ _LT_EOF
> +@@ -7169,7 +7507,7 @@ _LT_EOF
>    	  cat <<_LT_EOF >> conftest.$ac_ext
>    
>    /* The mapping between symbol names and symbols.  */
> @@ -21941,7 +21963,7 @@ index 1d9e5e10695..a234c4815b1 100755
>      const char *name;
>      void       *address;
>    }
> -@@ -7149,8 +7487,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7195,8 +7533,8 @@ static const void *lt_preloaded_setup() {
>    _LT_EOF
>    	  # Now try linking the two files.
>    	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -21952,7 +21974,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    	  LIBS="conftstm.$ac_objext"
>    	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>    	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7160,8 +7498,8 @@ _LT_EOF
> +@@ -7206,8 +7544,8 @@ _LT_EOF
>      test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>    	    pipe_works=yes
>    	  fi
> @@ -21963,7 +21985,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    	else
>    	  echo "cannot find nm_test_func in $nlist" >&5
>    	fi
> -@@ -7198,6 +7536,16 @@ else
> +@@ -7244,6 +7582,16 @@ else
>    $as_echo "ok" >&6; }
>    fi
>    
> @@ -21980,7 +22002,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    
>    
> -@@ -7214,6 +7562,45 @@ fi
> +@@ -7260,6 +7608,45 @@ fi
>    
>    
>    
> @@ -22026,7 +22048,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    
>    
> -@@ -7419,11 +7806,128 @@ sparc*-*solaris*)
> +@@ -7465,11 +7852,128 @@ sparc*-*solaris*)
>          ;;
>        esac
>      fi
> @@ -22158,7 +22180,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    
>      case $host_os in
> -@@ -7988,6 +8492,8 @@ _LT_EOF
> +@@ -8034,6 +8538,8 @@ _LT_EOF
>          $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>          echo "$AR cru libconftest.a conftest.o" >&5
>          $AR cru libconftest.a conftest.o 2>&5
> @@ -22167,7 +22189,7 @@ index 1d9e5e10695..a234c4815b1 100755
>          cat > conftest.c << _LT_EOF
>    int main() { return 0;}
>    _LT_EOF
> -@@ -8542,8 +9048,6 @@ fi
> +@@ -8588,8 +9094,6 @@ fi
>    lt_prog_compiler_pic=
>    lt_prog_compiler_static=
>    
> @@ -22176,7 +22198,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>      if test "$GCC" = yes; then
>        lt_prog_compiler_wl='-Wl,'
> -@@ -8709,6 +9213,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8755,6 +9259,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>    	lt_prog_compiler_pic='--shared'
>    	lt_prog_compiler_static='--static'
>    	;;
> @@ -22189,7 +22211,7 @@ index 1d9e5e10695..a234c4815b1 100755
>          pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>            # Portland Group compilers (*not* the Pentium gcc compiler,
>    	# which looks to be a dead project)
> -@@ -8771,7 +9281,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8817,7 +9327,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>          lt_prog_compiler_pic='-KPIC'
>          lt_prog_compiler_static='-Bstatic'
>          case $cc_basename in
> @@ -22198,7 +22220,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    	lt_prog_compiler_wl='-Qoption ld ';;
>          *)
>    	lt_prog_compiler_wl='-Wl,';;
> -@@ -8828,13 +9338,17 @@ case $host_os in
> +@@ -8874,13 +9384,17 @@ case $host_os in
>        lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>        ;;
>    esac
> @@ -22222,7 +22244,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    #
>    # Check to make sure the PIC flag actually works.
> -@@ -8895,6 +9409,11 @@ fi
> +@@ -8941,6 +9455,11 @@ fi
>    
>    
>    
> @@ -22234,7 +22256,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    #
>    # Check to make sure the static flag actually works.
>    #
> -@@ -9245,7 +9764,8 @@ _LT_EOF
> +@@ -9291,7 +9810,8 @@ _LT_EOF
>          allow_undefined_flag=unsupported
>          always_export_symbols=no
>          enable_shared_with_static_runtimes=yes
> @@ -22244,7 +22266,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>          if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>            archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9344,12 +9864,12 @@ _LT_EOF
> +@@ -9390,12 +9910,12 @@ _LT_EOF
>    	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>    	  hardcode_libdir_flag_spec=
>    	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -22259,7 +22281,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    	  fi
>    	  ;;
>    	esac
> -@@ -9363,8 +9883,8 @@ _LT_EOF
> +@@ -9409,8 +9929,8 @@ _LT_EOF
>    	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>    	wlarc=
>          else
> @@ -22270,7 +22292,7 @@ index 1d9e5e10695..a234c4815b1 100755
>          fi
>          ;;
>    
> -@@ -9382,8 +9902,8 @@ _LT_EOF
> +@@ -9428,8 +9948,8 @@ _LT_EOF
>    
>    _LT_EOF
>          elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -22281,7 +22303,7 @@ index 1d9e5e10695..a234c4815b1 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -9429,8 +9949,8 @@ _LT_EOF
> +@@ -9475,8 +9995,8 @@ _LT_EOF
>    
>        *)
>          if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -22292,7 +22314,7 @@ index 1d9e5e10695..a234c4815b1 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -9560,7 +10080,13 @@ _LT_EOF
> +@@ -9606,7 +10126,13 @@ _LT_EOF
>    	allow_undefined_flag='-berok'
>            # Determine the default libpath from the value encoded in an
>            # empty executable.
> @@ -22307,7 +22329,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -9573,22 +10099,29 @@ main ()
> +@@ -9619,22 +10145,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -22350,7 +22372,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>            hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>            archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9600,7 +10133,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9646,7 +10179,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	else
>    	 # Determine the default libpath from the value encoded in an
>    	 # empty executable.
> @@ -22365,7 +22387,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -9613,22 +10152,29 @@ main ()
> +@@ -9659,22 +10198,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -22408,7 +22430,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>    	  # Warning - without using the other run time loading flags,
> -@@ -9673,20 +10219,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9719,20 +10265,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>          # Microsoft Visual C++.
>          # hardcode_libdir_flag_spec is actually meaningless, as there is
>          # no search path for DLLs.
> @@ -22486,7 +22508,7 @@ index 1d9e5e10695..a234c4815b1 100755
>          ;;
>    
>        darwin* | rhapsody*)
> -@@ -9747,7 +10336,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9793,7 +10382,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>        freebsd* | dragonfly*)
> @@ -22495,7 +22517,7 @@ index 1d9e5e10695..a234c4815b1 100755
>          hardcode_libdir_flag_spec='-R$libdir'
>          hardcode_direct=yes
>          hardcode_shlibpath_var=no
> -@@ -9755,7 +10344,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9801,7 +10390,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux9*)
>          if test "$GCC" = yes; then
> @@ -22504,7 +22526,7 @@ index 1d9e5e10695..a234c4815b1 100755
>          else
>    	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>          fi
> -@@ -9771,7 +10360,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9817,7 +10406,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux10*)
>          if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -22513,7 +22535,7 @@ index 1d9e5e10695..a234c4815b1 100755
>          else
>    	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>          fi
> -@@ -9795,10 +10384,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9841,10 +10430,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
>    	  ;;
>    	ia64*)
> @@ -22526,7 +22548,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    	  ;;
>    	esac
>          else
> -@@ -9877,23 +10466,36 @@ fi
> +@@ -9923,23 +10512,36 @@ fi
>    
>        irix5* | irix6* | nonstopux*)
>          if test "$GCC" = yes; then
> @@ -22571,7 +22593,7 @@ index 1d9e5e10695..a234c4815b1 100755
>          else
>    	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>    	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9978,7 +10580,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10024,7 +10626,7 @@ rm -f core conftest.err conftest.$ac_objext \
>        osf4* | osf5*)	# as osf3* with the addition of -msym flag
>          if test "$GCC" = yes; then
>    	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -22580,7 +22602,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>          else
>    	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9997,9 +10599,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10043,9 +10645,9 @@ rm -f core conftest.err conftest.$ac_objext \
>          no_undefined_flag=' -z defs'
>          if test "$GCC" = yes; then
>    	wlarc='${wl}'
> @@ -22592,7 +22614,7 @@ index 1d9e5e10695..a234c4815b1 100755
>          else
>    	case `$CC -V 2>&1` in
>    	*"Compilers 5.0"*)
> -@@ -10575,8 +11177,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10621,8 +11223,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>      need_version=no
>      need_lib_prefix=no
>    
> @@ -22604,7 +22626,7 @@ index 1d9e5e10695..a234c4815b1 100755
>        library_names_spec='$libname.dll.a'
>        # DLL is installed to $(libdir)/../bin by postinstall_cmds
>        postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10609,13 +11212,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10655,13 +11258,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>          library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>          ;;
>        esac
> @@ -22677,16 +22699,16 @@ index 1d9e5e10695..a234c4815b1 100755
>      # FIXME: first we should search . and the directory the executable is in
>      shlibpath_var=PATH
>      ;;
> -@@ -11517,7 +12178,7 @@ else
> +@@ -11563,7 +12224,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 11520 "configure"
> +-#line 11566 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -11561,10 +12222,10 @@ else
> +@@ -11607,10 +12268,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -22699,16 +22721,16 @@ index 1d9e5e10695..a234c4815b1 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11623,7 +12284,7 @@ else
> +@@ -11669,7 +12330,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 11626 "configure"
> +-#line 11672 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -11667,10 +12328,10 @@ else
> +@@ -11713,10 +12374,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -22721,7 +22743,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -13490,7 +14151,7 @@ cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
> +@@ -13541,7 +14202,7 @@ cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
>    #
>    # INIT-COMMANDS
>    #
> @@ -22730,7 +22752,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    
>    
>    # The HP-UX ksh and POSIX shell print the target directory to stdout
> -@@ -13528,13 +14189,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -13579,13 +14240,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>    lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>    lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>    lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -22751,7 +22773,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>    RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>    old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -13549,14 +14217,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -13600,14 +14268,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>    lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -22770,7 +22792,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>    NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>    LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -13589,12 +14260,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -13640,12 +14311,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>    hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>    inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>    link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -22784,7 +22806,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>    variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>    need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -13649,8 +14320,13 @@ reload_flag \
> +@@ -13700,8 +14371,13 @@ reload_flag \
>    OBJDUMP \
>    deplibs_check_method \
>    file_magic_cmd \
> @@ -22798,7 +22820,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    STRIP \
>    RANLIB \
>    CC \
> -@@ -13660,12 +14336,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -13711,12 +14387,14 @@ lt_cv_sys_global_symbol_pipe \
>    lt_cv_sys_global_symbol_to_cdecl \
>    lt_cv_sys_global_symbol_to_c_name_address \
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -22814,7 +22836,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    DSYMUTIL \
>    NMEDIT \
>    LIPO \
> -@@ -13681,7 +14359,6 @@ no_undefined_flag \
> +@@ -13732,7 +14410,6 @@ no_undefined_flag \
>    hardcode_libdir_flag_spec \
>    hardcode_libdir_flag_spec_ld \
>    hardcode_libdir_separator \
> @@ -22822,7 +22844,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    exclude_expsyms \
>    include_expsyms \
>    file_list_spec \
> -@@ -13717,6 +14394,7 @@ module_cmds \
> +@@ -13768,6 +14445,7 @@ module_cmds \
>    module_expsym_cmds \
>    export_symbols_cmds \
>    prelink_cmds \
> @@ -22830,7 +22852,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    postinstall_cmds \
>    postuninstall_cmds \
>    finish_cmds \
> -@@ -14363,29 +15041,35 @@ $as_echo "$as_me: executing $ac_file commands" >&6;}
> +@@ -14414,29 +15092,35 @@ $as_echo "$as_me: executing $ac_file commands" >&6;}
>      # Older Autoconf quotes --file arguments for eval, but not when files
>      # are listed without --file.  Let's play safe and only enable the eval
>      # if we detect the quoting.
> @@ -22885,7 +22907,7 @@ index 1d9e5e10695..a234c4815b1 100755
>        sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
>    	    s//\1/
>    	    q
> -@@ -14403,53 +15087,50 @@ $as_echo X"$mf" |
> +@@ -14454,53 +15138,50 @@ $as_echo X"$mf" |
>    	    q
>    	  }
>    	  s/.*/./; q'`
> @@ -22972,7 +22994,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    }
>     ;;
>        "libtool":C)
> -@@ -14473,7 +15154,8 @@ $as_echo X"$file" |
> +@@ -14524,7 +15205,8 @@ $as_echo X"$file" |
>    # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>    #
>    #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -22982,7 +23004,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    #   Written by Gordon Matzigkeit, 1996
>    #
>    #   This file is part of GNU Libtool.
> -@@ -14576,19 +15258,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -14627,19 +15309,42 @@ SP2NL=$lt_lt_SP2NL
>    # turn newlines into spaces.
>    NL2SP=$lt_lt_NL2SP
>    
> @@ -23026,7 +23048,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    # A symbol stripping program.
>    STRIP=$lt_STRIP
>    
> -@@ -14618,6 +15323,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -14669,6 +15374,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>    # Transform the output of nm in a C name address pair when lib prefix is needed.
>    global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>    
> @@ -23039,7 +23061,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    # The name of the directory that contains temporary libtool files.
>    objdir=$objdir
>    
> -@@ -14627,6 +15338,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -14678,6 +15389,9 @@ MAGIC_CMD=$MAGIC_CMD
>    # Must we lock files when doing compilation?
>    need_locks=$lt_need_locks
>    
> @@ -23049,7 +23071,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>    DSYMUTIL=$lt_DSYMUTIL
>    
> -@@ -14741,12 +15455,12 @@ with_gcc=$GCC
> +@@ -14792,12 +15506,12 @@ with_gcc=$GCC
>    # Compiler flag to turn off builtin functions.
>    no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>    
> @@ -23065,7 +23087,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    # Compiler flag to prevent dynamic linking.
>    link_static_flag=$lt_lt_prog_compiler_static
>    
> -@@ -14833,9 +15547,6 @@ inherit_rpath=$inherit_rpath
> +@@ -14884,9 +15598,6 @@ inherit_rpath=$inherit_rpath
>    # Whether libtool must link a program against all its dependency libraries.
>    link_all_deplibs=$link_all_deplibs
>    
> @@ -23075,7 +23097,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    # Set to "yes" if exported symbols are required.
>    always_export_symbols=$always_export_symbols
>    
> -@@ -14851,6 +15562,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -14902,6 +15613,9 @@ include_expsyms=$lt_include_expsyms
>    # Commands necessary for linking programs (against libraries) with templates.
>    prelink_cmds=$lt_prelink_cmds
>    
> @@ -23085,7 +23107,7 @@ index 1d9e5e10695..a234c4815b1 100755
>    # Specify filename containing input files.
>    file_list_spec=$lt_file_list_spec
>    
> -@@ -14883,210 +15597,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -14934,210 +15648,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>      # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>      # text mode, it properly converts lines to CR/LF.  This bash problem
>      # is reportedly fixed, but why not run on old versions too?
> @@ -30496,7 +30518,7 @@ index bf92b5e0790..c573da90c5c 100644
>    # These exist entirely to fool aclocal when bootstrapping libtool.
>    #
>   diff --git a/opcodes/Makefile.in b/opcodes/Makefile.in
> -index 245479140c9..bfed90449bf 100644
> +index 57aaed26da8..9cca46c7dfd 100644
>   --- a/opcodes/Makefile.in
>   +++ b/opcodes/Makefile.in
>   @@ -298,6 +298,7 @@ CYGPATH_W = @CYGPATH_W@
> @@ -30524,7 +30546,7 @@ index 245479140c9..bfed90449bf 100644
>    ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
>    am__include = @am__include@
>   diff --git a/opcodes/configure b/opcodes/configure
> -index 1660c3266a3..a1b84ed81f9 100755
> +index 313cbd436ed..e8ef4ba915b 100755
>   --- a/opcodes/configure
>   +++ b/opcodes/configure
>   @@ -688,6 +688,9 @@ OTOOL
> @@ -30554,7 +30576,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>    Some influential environment variables:
>      CC          C compiler command
> -@@ -4997,8 +5003,8 @@ esac
> +@@ -4995,8 +5001,8 @@ esac
>    
>    
>    
> @@ -30565,7 +30587,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>    
>    
> -@@ -5038,7 +5044,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5036,7 +5042,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>    $as_echo_n "checking how to print strings... " >&6; }
>    # Test print first, because it will be a builtin if present.
> @@ -30574,7 +30596,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>       test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>      ECHO='print -r --'
>    elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5731,8 +5737,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5729,8 +5735,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>    # Try some XSI features
>    xsi_shell=no
>    ( _lt_dummy="a/b/c"
> @@ -30585,7 +30607,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>        && eval 'test $(( 1 + 1 )) -eq 2 \
>        && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>      && xsi_shell=yes
> -@@ -5781,6 +5787,80 @@ esac
> +@@ -5779,6 +5785,80 @@ esac
>    
>    
>    
> @@ -30666,7 +30688,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>    $as_echo_n "checking for $LD option to reload object files... " >&6; }
>    if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5797,6 +5877,11 @@ case $reload_flag in
> +@@ -5795,6 +5875,11 @@ case $reload_flag in
>    esac
>    reload_cmds='$LD$reload_flag -o $output$reload_objs'
>    case $host_os in
> @@ -30678,7 +30700,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>      darwin*)
>        if test "$GCC" = yes; then
>          reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -5965,7 +6050,8 @@ mingw* | pw32*)
> +@@ -5963,7 +6048,8 @@ mingw* | pw32*)
>        lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>        lt_cv_file_magic_cmd='func_win32_libid'
>      else
> @@ -30688,7 +30710,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>        lt_cv_file_magic_cmd='$OBJDUMP -f'
>      fi
>      ;;
> -@@ -6124,6 +6210,21 @@ esac
> +@@ -6122,6 +6208,21 @@ esac
>    fi
>    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>    $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -30710,7 +30732,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    file_magic_cmd=$lt_cv_file_magic_cmd
>    deplibs_check_method=$lt_cv_deplibs_check_method
>    test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6139,6 +6240,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6137,6 +6238,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>    
>    
>    
> @@ -30868,7 +30890,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    plugin_option=
>    plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>    for plugin in $plugin_names; do
> -@@ -6153,8 +6405,10 @@ for plugin in $plugin_names; do
> +@@ -6151,8 +6403,10 @@ for plugin in $plugin_names; do
>    done
>    
>    if test -n "$ac_tool_prefix"; then
> @@ -30881,7 +30903,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_AR+:} false; then :
> -@@ -6170,7 +6424,7 @@ do
> +@@ -6168,7 +6422,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -30890,7 +30912,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -6190,11 +6444,15 @@ $as_echo "no" >&6; }
> +@@ -6188,11 +6442,15 @@ $as_echo "no" >&6; }
>    fi
>    
>    
> @@ -30909,7 +30931,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6210,7 +6468,7 @@ do
> +@@ -6208,7 +6466,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -30918,7 +30940,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -6229,6 +6487,10 @@ else
> +@@ -6227,6 +6485,10 @@ else
>    $as_echo "no" >&6; }
>    fi
>    
> @@ -30929,7 +30951,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>      if test "x$ac_ct_AR" = x; then
>        AR="false"
>      else
> -@@ -6240,25 +6502,20 @@ ac_tool_warned=yes ;;
> +@@ -6238,25 +6500,20 @@ ac_tool_warned=yes ;;
>    esac
>        AR=$ac_ct_AR
>      fi
> @@ -30965,7 +30987,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>    
>    
> -@@ -6269,6 +6526,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -6267,6 +6524,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>    
>    
>    
> @@ -31029,7 +31051,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>    if test -n "$ac_tool_prefix"; then
>      # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
> -@@ -6609,8 +6923,8 @@ esac
> +@@ -6607,8 +6921,8 @@ esac
>    lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>    
>    # Transform an extracted symbol line into symbol name and symbol address
> @@ -31040,7 +31062,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>    # Handle CRLF in mingw tool chain
>    opt_cr=
> -@@ -6646,6 +6960,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6644,6 +6958,7 @@ for ac_symprfx in "" "_"; do
>      else
>        lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>      fi
> @@ -31048,7 +31070,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>      # Check to see that the pipe works correctly.
>      pipe_works=no
> -@@ -6687,6 +7002,18 @@ _LT_EOF
> +@@ -6685,6 +7000,18 @@ _LT_EOF
>          if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>    	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>    	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -31067,7 +31089,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    #ifdef __cplusplus
>    extern "C" {
>    #endif
> -@@ -6698,7 +7025,7 @@ _LT_EOF
> +@@ -6696,7 +7023,7 @@ _LT_EOF
>    	  cat <<_LT_EOF >> conftest.$ac_ext
>    
>    /* The mapping between symbol names and symbols.  */
> @@ -31076,7 +31098,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>      const char *name;
>      void       *address;
>    }
> -@@ -6724,8 +7051,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6722,8 +7049,8 @@ static const void *lt_preloaded_setup() {
>    _LT_EOF
>    	  # Now try linking the two files.
>    	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -31087,7 +31109,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    	  LIBS="conftstm.$ac_objext"
>    	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>    	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6735,8 +7062,8 @@ _LT_EOF
> +@@ -6733,8 +7060,8 @@ _LT_EOF
>      test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>    	    pipe_works=yes
>    	  fi
> @@ -31098,7 +31120,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    	else
>    	  echo "cannot find nm_test_func in $nlist" >&5
>    	fi
> -@@ -6773,6 +7100,14 @@ else
> +@@ -6771,6 +7098,14 @@ else
>    $as_echo "ok" >&6; }
>    fi
>    
> @@ -31113,7 +31135,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>    
>    
> -@@ -6791,6 +7126,47 @@ fi
> +@@ -6789,6 +7124,47 @@ fi
>    
>    
>    
> @@ -31161,7 +31183,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>    
>    
> -@@ -7000,6 +7376,123 @@ esac
> +@@ -6998,6 +7374,123 @@ esac
>    
>    need_locks="$enable_libtool_lock"
>    
> @@ -31285,7 +31307,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>      case $host_os in
>        rhapsody* | darwin*)
> -@@ -7563,6 +8056,8 @@ _LT_EOF
> +@@ -7561,6 +8054,8 @@ _LT_EOF
>          $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>          echo "$AR cru libconftest.a conftest.o" >&5
>          $AR cru libconftest.a conftest.o 2>&5
> @@ -31294,7 +31316,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>          cat > conftest.c << _LT_EOF
>    int main() { return 0;}
>    _LT_EOF
> -@@ -8117,8 +8612,6 @@ fi
> +@@ -8115,8 +8610,6 @@ fi
>    lt_prog_compiler_pic=
>    lt_prog_compiler_static=
>    
> @@ -31303,7 +31325,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>      if test "$GCC" = yes; then
>        lt_prog_compiler_wl='-Wl,'
> -@@ -8284,6 +8777,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8282,6 +8775,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>    	lt_prog_compiler_pic='--shared'
>    	lt_prog_compiler_static='--static'
>    	;;
> @@ -31316,7 +31338,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>          pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>            # Portland Group compilers (*not* the Pentium gcc compiler,
>    	# which looks to be a dead project)
> -@@ -8346,7 +8845,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8344,7 +8843,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>          lt_prog_compiler_pic='-KPIC'
>          lt_prog_compiler_static='-Bstatic'
>          case $cc_basename in
> @@ -31325,7 +31347,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    	lt_prog_compiler_wl='-Qoption ld ';;
>          *)
>    	lt_prog_compiler_wl='-Wl,';;
> -@@ -8403,13 +8902,17 @@ case $host_os in
> +@@ -8401,13 +8900,17 @@ case $host_os in
>        lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>        ;;
>    esac
> @@ -31349,7 +31371,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>    #
>    # Check to make sure the PIC flag actually works.
> -@@ -8470,6 +8973,11 @@ fi
> +@@ -8468,6 +8971,11 @@ fi
>    
>    
>    
> @@ -31361,7 +31383,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    #
>    # Check to make sure the static flag actually works.
>    #
> -@@ -8820,7 +9328,8 @@ _LT_EOF
> +@@ -8818,7 +9326,8 @@ _LT_EOF
>          allow_undefined_flag=unsupported
>          always_export_symbols=no
>          enable_shared_with_static_runtimes=yes
> @@ -31371,7 +31393,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>          if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>            archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -8919,12 +9428,12 @@ _LT_EOF
> +@@ -8917,12 +9426,12 @@ _LT_EOF
>    	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>    	  hardcode_libdir_flag_spec=
>    	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -31386,7 +31408,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    	  fi
>    	  ;;
>    	esac
> -@@ -8938,8 +9447,8 @@ _LT_EOF
> +@@ -8936,8 +9445,8 @@ _LT_EOF
>    	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>    	wlarc=
>          else
> @@ -31397,7 +31419,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>          fi
>          ;;
>    
> -@@ -8957,8 +9466,8 @@ _LT_EOF
> +@@ -8955,8 +9464,8 @@ _LT_EOF
>    
>    _LT_EOF
>          elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -31408,7 +31430,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -9004,8 +9513,8 @@ _LT_EOF
> +@@ -9002,8 +9511,8 @@ _LT_EOF
>    
>        *)
>          if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -31419,7 +31441,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -9135,7 +9644,13 @@ _LT_EOF
> +@@ -9133,7 +9642,13 @@ _LT_EOF
>    	allow_undefined_flag='-berok'
>            # Determine the default libpath from the value encoded in an
>            # empty executable.
> @@ -31434,7 +31456,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -9148,22 +9663,29 @@ main ()
> +@@ -9146,22 +9661,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -31477,7 +31499,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>            hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>            archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9175,7 +9697,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9173,7 +9695,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	else
>    	 # Determine the default libpath from the value encoded in an
>    	 # empty executable.
> @@ -31492,7 +31514,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    /* end confdefs.h.  */
>    
>    int
> -@@ -9188,22 +9716,29 @@ main ()
> +@@ -9186,22 +9714,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -31535,7 +31557,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    
>    	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>    	  # Warning - without using the other run time loading flags,
> -@@ -9248,20 +9783,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9246,20 +9781,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>          # Microsoft Visual C++.
>          # hardcode_libdir_flag_spec is actually meaningless, as there is
>          # no search path for DLLs.
> @@ -31613,7 +31635,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>          ;;
>    
>        darwin* | rhapsody*)
> -@@ -9322,7 +9900,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9320,7 +9898,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>        freebsd* | dragonfly*)
> @@ -31622,7 +31644,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>          hardcode_libdir_flag_spec='-R$libdir'
>          hardcode_direct=yes
>          hardcode_shlibpath_var=no
> -@@ -9330,7 +9908,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9328,7 +9906,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux9*)
>          if test "$GCC" = yes; then
> @@ -31631,7 +31653,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>          else
>    	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>          fi
> -@@ -9346,7 +9924,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9344,7 +9922,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux10*)
>          if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -31640,7 +31662,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>          else
>    	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>          fi
> -@@ -9370,10 +9948,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9368,10 +9946,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
>    	  ;;
>    	ia64*)
> @@ -31653,7 +31675,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    	  ;;
>    	esac
>          else
> -@@ -9452,23 +10030,36 @@ fi
> +@@ -9450,23 +10028,36 @@ fi
>    
>        irix5* | irix6* | nonstopux*)
>          if test "$GCC" = yes; then
> @@ -31698,7 +31720,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>          else
>    	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>    	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9553,7 +10144,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9551,7 +10142,7 @@ rm -f core conftest.err conftest.$ac_objext \
>        osf4* | osf5*)	# as osf3* with the addition of -msym flag
>          if test "$GCC" = yes; then
>    	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -31707,7 +31729,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>          else
>    	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9572,9 +10163,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9570,9 +10161,9 @@ rm -f core conftest.err conftest.$ac_objext \
>          no_undefined_flag=' -z defs'
>          if test "$GCC" = yes; then
>    	wlarc='${wl}'
> @@ -31719,7 +31741,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>          else
>    	case `$CC -V 2>&1` in
>    	*"Compilers 5.0"*)
> -@@ -10150,8 +10741,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10148,8 +10739,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>      need_version=no
>      need_lib_prefix=no
>    
> @@ -31731,7 +31753,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>        library_names_spec='$libname.dll.a'
>        # DLL is installed to $(libdir)/../bin by postinstall_cmds
>        postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10184,13 +10776,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10182,13 +10774,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>          library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>          ;;
>        esac
> @@ -31804,16 +31826,16 @@ index 1660c3266a3..a1b84ed81f9 100755
>      # FIXME: first we should search . and the directory the executable is in
>      shlibpath_var=PATH
>      ;;
> -@@ -11092,7 +11742,7 @@ else
> +@@ -11090,7 +11740,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 11095 "configure"
> +-#line 11093 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -11136,10 +11786,10 @@ else
> +@@ -11134,10 +11784,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -31826,16 +31848,16 @@ index 1660c3266a3..a1b84ed81f9 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11198,7 +11848,7 @@ else
> +@@ -11196,7 +11846,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 11201 "configure"
> +-#line 11199 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -11242,10 +11892,10 @@ else
> +@@ -11240,10 +11890,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -31848,7 +31870,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -15351,13 +16001,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -15349,13 +15999,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>    lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>    lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>    lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -31869,7 +31891,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>    RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>    old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -15372,14 +16029,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -15370,14 +16027,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>    lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -31888,7 +31910,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>    NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>    LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -15412,12 +16072,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -15410,12 +16070,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>    hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>    inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>    link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -31902,7 +31924,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>    variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>    need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -15472,8 +16132,13 @@ reload_flag \
> +@@ -15470,8 +16130,13 @@ reload_flag \
>    OBJDUMP \
>    deplibs_check_method \
>    file_magic_cmd \
> @@ -31916,7 +31938,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    STRIP \
>    RANLIB \
>    CC \
> -@@ -15483,12 +16148,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -15481,12 +16146,14 @@ lt_cv_sys_global_symbol_pipe \
>    lt_cv_sys_global_symbol_to_cdecl \
>    lt_cv_sys_global_symbol_to_c_name_address \
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -31932,7 +31954,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    DSYMUTIL \
>    NMEDIT \
>    LIPO \
> -@@ -15504,7 +16171,6 @@ no_undefined_flag \
> +@@ -15502,7 +16169,6 @@ no_undefined_flag \
>    hardcode_libdir_flag_spec \
>    hardcode_libdir_flag_spec_ld \
>    hardcode_libdir_separator \
> @@ -31940,7 +31962,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    exclude_expsyms \
>    include_expsyms \
>    file_list_spec \
> -@@ -15540,6 +16206,7 @@ module_cmds \
> +@@ -15538,6 +16204,7 @@ module_cmds \
>    module_expsym_cmds \
>    export_symbols_cmds \
>    prelink_cmds \
> @@ -31948,7 +31970,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    postinstall_cmds \
>    postuninstall_cmds \
>    finish_cmds \
> -@@ -16313,7 +16980,8 @@ $as_echo X"$file" |
> +@@ -16311,7 +16978,8 @@ $as_echo X"$file" |
>    # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>    #
>    #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -31958,7 +31980,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    #   Written by Gordon Matzigkeit, 1996
>    #
>    #   This file is part of GNU Libtool.
> -@@ -16416,19 +17084,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -16414,19 +17082,42 @@ SP2NL=$lt_lt_SP2NL
>    # turn newlines into spaces.
>    NL2SP=$lt_lt_NL2SP
>    
> @@ -32002,7 +32024,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    # A symbol stripping program.
>    STRIP=$lt_STRIP
>    
> -@@ -16458,6 +17149,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -16456,6 +17147,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>    # Transform the output of nm in a C name address pair when lib prefix is needed.
>    global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>    
> @@ -32015,7 +32037,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    # The name of the directory that contains temporary libtool files.
>    objdir=$objdir
>    
> -@@ -16467,6 +17164,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -16465,6 +17162,9 @@ MAGIC_CMD=$MAGIC_CMD
>    # Must we lock files when doing compilation?
>    need_locks=$lt_need_locks
>    
> @@ -32025,7 +32047,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>    DSYMUTIL=$lt_DSYMUTIL
>    
> -@@ -16581,12 +17281,12 @@ with_gcc=$GCC
> +@@ -16579,12 +17279,12 @@ with_gcc=$GCC
>    # Compiler flag to turn off builtin functions.
>    no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>    
> @@ -32041,7 +32063,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    # Compiler flag to prevent dynamic linking.
>    link_static_flag=$lt_lt_prog_compiler_static
>    
> -@@ -16673,9 +17373,6 @@ inherit_rpath=$inherit_rpath
> +@@ -16671,9 +17371,6 @@ inherit_rpath=$inherit_rpath
>    # Whether libtool must link a program against all its dependency libraries.
>    link_all_deplibs=$link_all_deplibs
>    
> @@ -32051,7 +32073,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    # Set to "yes" if exported symbols are required.
>    always_export_symbols=$always_export_symbols
>    
> -@@ -16691,6 +17388,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -16689,6 +17386,9 @@ include_expsyms=$lt_include_expsyms
>    # Commands necessary for linking programs (against libraries) with templates.
>    prelink_cmds=$lt_prelink_cmds
>    
> @@ -32061,7 +32083,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>    # Specify filename containing input files.
>    file_list_spec=$lt_file_list_spec
>    
> -@@ -16723,210 +17423,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -16721,210 +17421,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>      # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>      # text mode, it properly converts lines to CR/LF.  This bash problem
>      # is reportedly fixed, but why not run on old versions too?
> @@ -32436,7 +32458,7 @@ index 1660c3266a3..a1b84ed81f9 100755
>      chmod +x "$ofile"
>    
>   diff --git a/zlib/Makefile.in b/zlib/Makefile.in
> -index dd8a21deba1..28628282c56 100644
> +index 951260ac4c5..9398823cc09 100644
>   --- a/zlib/Makefile.in
>   +++ b/zlib/Makefile.in
>   @@ -281,6 +281,7 @@ CPPFLAGS = @CPPFLAGS@
> @@ -32464,7 +32486,7 @@ index dd8a21deba1..28628282c56 100644
>    ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
>    am__include = @am__include@
>   diff --git a/zlib/configure b/zlib/configure
> -index 2d551360683..e01d0a70438 100755
> +index cae55c5ca49..24193ee5db7 100755
>   --- a/zlib/configure
>   +++ b/zlib/configure
>   @@ -648,8 +648,11 @@ OTOOL
> @@ -32496,7 +32518,7 @@ index 2d551360683..e01d0a70438 100755
>    
>    Some influential environment variables:
>      CC          C compiler command
> -@@ -4190,8 +4196,8 @@ esac
> +@@ -4189,8 +4195,8 @@ esac
>    
>    
>    
> @@ -32507,7 +32529,7 @@ index 2d551360683..e01d0a70438 100755
>    
>    
>    
> -@@ -4231,7 +4237,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4230,7 +4236,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>    $as_echo_n "checking how to print strings... " >&6; }
>    # Test print first, because it will be a builtin if present.
> @@ -32516,7 +32538,7 @@ index 2d551360683..e01d0a70438 100755
>       test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>      ECHO='print -r --'
>    elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5054,8 +5060,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5053,8 +5059,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>    # Try some XSI features
>    xsi_shell=no
>    ( _lt_dummy="a/b/c"
> @@ -32527,7 +32549,7 @@ index 2d551360683..e01d0a70438 100755
>        && eval 'test $(( 1 + 1 )) -eq 2 \
>        && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>      && xsi_shell=yes
> -@@ -5104,6 +5110,80 @@ esac
> +@@ -5103,6 +5109,80 @@ esac
>    
>    
>    
> @@ -32608,7 +32630,7 @@ index 2d551360683..e01d0a70438 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>    $as_echo_n "checking for $LD option to reload object files... " >&6; }
>    if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5120,6 +5200,11 @@ case $reload_flag in
> +@@ -5119,6 +5199,11 @@ case $reload_flag in
>    esac
>    reload_cmds='$LD$reload_flag -o $output$reload_objs'
>    case $host_os in
> @@ -32620,7 +32642,7 @@ index 2d551360683..e01d0a70438 100755
>      darwin*)
>        if test "$GCC" = yes; then
>          reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -5288,7 +5373,8 @@ mingw* | pw32*)
> +@@ -5287,7 +5372,8 @@ mingw* | pw32*)
>        lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>        lt_cv_file_magic_cmd='func_win32_libid'
>      else
> @@ -32630,7 +32652,7 @@ index 2d551360683..e01d0a70438 100755
>        lt_cv_file_magic_cmd='$OBJDUMP -f'
>      fi
>      ;;
> -@@ -5447,6 +5533,21 @@ esac
> +@@ -5446,6 +5532,21 @@ esac
>    fi
>    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>    $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -32652,7 +32674,7 @@ index 2d551360683..e01d0a70438 100755
>    file_magic_cmd=$lt_cv_file_magic_cmd
>    deplibs_check_method=$lt_cv_deplibs_check_method
>    test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -5462,6 +5563,158 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -5461,6 +5562,158 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>    
>    
>    
> @@ -32811,7 +32833,7 @@ index 2d551360683..e01d0a70438 100755
>    plugin_option=
>    plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>    for plugin in $plugin_names; do
> -@@ -5476,8 +5729,10 @@ for plugin in $plugin_names; do
> +@@ -5475,8 +5728,10 @@ for plugin in $plugin_names; do
>    done
>    
>    if test -n "$ac_tool_prefix"; then
> @@ -32824,7 +32846,7 @@ index 2d551360683..e01d0a70438 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_AR+:} false; then :
> -@@ -5493,7 +5748,7 @@ do
> +@@ -5492,7 +5747,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -32833,7 +32855,7 @@ index 2d551360683..e01d0a70438 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -5513,11 +5768,15 @@ $as_echo "no" >&6; }
> +@@ -5512,11 +5767,15 @@ $as_echo "no" >&6; }
>    fi
>    
>    
> @@ -32852,7 +32874,7 @@ index 2d551360683..e01d0a70438 100755
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>    $as_echo_n "checking for $ac_word... " >&6; }
>    if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -5533,7 +5792,7 @@ do
> +@@ -5532,7 +5791,7 @@ do
>      test -z "$as_dir" && as_dir=.
>        for ac_exec_ext in '' $ac_executable_extensions; do
>      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -32861,7 +32883,7 @@ index 2d551360683..e01d0a70438 100755
>        $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>        break 2
>      fi
> -@@ -5552,6 +5811,10 @@ else
> +@@ -5551,6 +5810,10 @@ else
>    $as_echo "no" >&6; }
>    fi
>    
> @@ -32872,7 +32894,7 @@ index 2d551360683..e01d0a70438 100755
>      if test "x$ac_ct_AR" = x; then
>        AR="false"
>      else
> -@@ -5563,25 +5826,19 @@ ac_tool_warned=yes ;;
> +@@ -5562,25 +5825,19 @@ ac_tool_warned=yes ;;
>    esac
>        AR=$ac_ct_AR
>      fi
> @@ -32907,7 +32929,7 @@ index 2d551360683..e01d0a70438 100755
>    
>    
>    
> -@@ -5593,6 +5850,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -5592,6 +5849,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>    
>    
>    
> @@ -32972,7 +32994,7 @@ index 2d551360683..e01d0a70438 100755
>    if test -n "$ac_tool_prefix"; then
>      # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
>    set dummy ${ac_tool_prefix}strip; ac_word=$2
> -@@ -5932,8 +6247,8 @@ esac
> +@@ -5931,8 +6246,8 @@ esac
>    lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>    
>    # Transform an extracted symbol line into symbol name and symbol address
> @@ -32983,7 +33005,7 @@ index 2d551360683..e01d0a70438 100755
>    
>    # Handle CRLF in mingw tool chain
>    opt_cr=
> -@@ -5969,6 +6284,7 @@ for ac_symprfx in "" "_"; do
> +@@ -5968,6 +6283,7 @@ for ac_symprfx in "" "_"; do
>      else
>        lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>      fi
> @@ -32991,7 +33013,7 @@ index 2d551360683..e01d0a70438 100755
>    
>      # Check to see that the pipe works correctly.
>      pipe_works=no
> -@@ -6010,6 +6326,18 @@ _LT_EOF
> +@@ -6009,6 +6325,18 @@ _LT_EOF
>          if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>    	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>    	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -33010,7 +33032,7 @@ index 2d551360683..e01d0a70438 100755
>    #ifdef __cplusplus
>    extern "C" {
>    #endif
> -@@ -6021,7 +6349,7 @@ _LT_EOF
> +@@ -6020,7 +6348,7 @@ _LT_EOF
>    	  cat <<_LT_EOF >> conftest.$ac_ext
>    
>    /* The mapping between symbol names and symbols.  */
> @@ -33019,7 +33041,7 @@ index 2d551360683..e01d0a70438 100755
>      const char *name;
>      void       *address;
>    }
> -@@ -6047,8 +6375,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6046,8 +6374,8 @@ static const void *lt_preloaded_setup() {
>    _LT_EOF
>    	  # Now try linking the two files.
>    	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -33030,7 +33052,7 @@ index 2d551360683..e01d0a70438 100755
>    	  LIBS="conftstm.$ac_objext"
>    	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>    	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6058,8 +6386,8 @@ _LT_EOF
> +@@ -6057,8 +6385,8 @@ _LT_EOF
>      test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>    	    pipe_works=yes
>    	  fi
> @@ -33041,7 +33063,7 @@ index 2d551360683..e01d0a70438 100755
>    	else
>    	  echo "cannot find nm_test_func in $nlist" >&5
>    	fi
> -@@ -6096,6 +6424,17 @@ else
> +@@ -6095,6 +6423,17 @@ else
>    $as_echo "ok" >&6; }
>    fi
>    
> @@ -33059,7 +33081,7 @@ index 2d551360683..e01d0a70438 100755
>    
>    
>    
> -@@ -6113,6 +6452,43 @@ fi
> +@@ -6112,6 +6451,43 @@ fi
>    
>    
>    
> @@ -33103,7 +33125,7 @@ index 2d551360683..e01d0a70438 100755
>    
>    
>    
> -@@ -6327,6 +6703,123 @@ esac
> +@@ -6326,6 +6702,123 @@ esac
>    
>    need_locks="$enable_libtool_lock"
>    
> @@ -33227,7 +33249,7 @@ index 2d551360683..e01d0a70438 100755
>    
>      case $host_os in
>        rhapsody* | darwin*)
> -@@ -6893,6 +7386,8 @@ _LT_EOF
> +@@ -6892,6 +7385,8 @@ _LT_EOF
>          $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>          echo "$AR cru libconftest.a conftest.o" >&5
>          $AR cru libconftest.a conftest.o 2>&5
> @@ -33236,7 +33258,7 @@ index 2d551360683..e01d0a70438 100755
>          cat > conftest.c << _LT_EOF
>    int main() { return 0;}
>    _LT_EOF
> -@@ -7744,8 +8239,6 @@ fi
> +@@ -7743,8 +8238,6 @@ fi
>    lt_prog_compiler_pic=
>    lt_prog_compiler_static=
>    
> @@ -33245,7 +33267,7 @@ index 2d551360683..e01d0a70438 100755
>    
>      if test "$GCC" = yes; then
>        lt_prog_compiler_wl='-Wl,'
> -@@ -7911,6 +8404,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7910,6 +8403,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>    	lt_prog_compiler_pic='--shared'
>    	lt_prog_compiler_static='--static'
>    	;;
> @@ -33258,7 +33280,7 @@ index 2d551360683..e01d0a70438 100755
>          pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>            # Portland Group compilers (*not* the Pentium gcc compiler,
>    	# which looks to be a dead project)
> -@@ -7973,7 +8472,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7972,7 +8471,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>          lt_prog_compiler_pic='-KPIC'
>          lt_prog_compiler_static='-Bstatic'
>          case $cc_basename in
> @@ -33267,7 +33289,7 @@ index 2d551360683..e01d0a70438 100755
>    	lt_prog_compiler_wl='-Qoption ld ';;
>          *)
>    	lt_prog_compiler_wl='-Wl,';;
> -@@ -8030,13 +8529,17 @@ case $host_os in
> +@@ -8029,13 +8528,17 @@ case $host_os in
>        lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>        ;;
>    esac
> @@ -33291,7 +33313,7 @@ index 2d551360683..e01d0a70438 100755
>    
>    #
>    # Check to make sure the PIC flag actually works.
> -@@ -8097,6 +8600,11 @@ fi
> +@@ -8096,6 +8599,11 @@ fi
>    
>    
>    
> @@ -33303,7 +33325,7 @@ index 2d551360683..e01d0a70438 100755
>    #
>    # Check to make sure the static flag actually works.
>    #
> -@@ -8447,7 +8955,8 @@ _LT_EOF
> +@@ -8446,7 +8954,8 @@ _LT_EOF
>          allow_undefined_flag=unsupported
>          always_export_symbols=no
>          enable_shared_with_static_runtimes=yes
> @@ -33313,7 +33335,7 @@ index 2d551360683..e01d0a70438 100755
>    
>          if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>            archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -8546,12 +9055,12 @@ _LT_EOF
> +@@ -8545,12 +9054,12 @@ _LT_EOF
>    	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>    	  hardcode_libdir_flag_spec=
>    	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -33328,7 +33350,7 @@ index 2d551360683..e01d0a70438 100755
>    	  fi
>    	  ;;
>    	esac
> -@@ -8565,8 +9074,8 @@ _LT_EOF
> +@@ -8564,8 +9073,8 @@ _LT_EOF
>    	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>    	wlarc=
>          else
> @@ -33339,7 +33361,7 @@ index 2d551360683..e01d0a70438 100755
>          fi
>          ;;
>    
> -@@ -8584,8 +9093,8 @@ _LT_EOF
> +@@ -8583,8 +9092,8 @@ _LT_EOF
>    
>    _LT_EOF
>          elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -33350,7 +33372,7 @@ index 2d551360683..e01d0a70438 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -8631,8 +9140,8 @@ _LT_EOF
> +@@ -8630,8 +9139,8 @@ _LT_EOF
>    
>        *)
>          if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -33361,7 +33383,7 @@ index 2d551360683..e01d0a70438 100755
>          else
>    	ld_shlibs=no
>          fi
> -@@ -8762,7 +9271,13 @@ _LT_EOF
> +@@ -8761,7 +9270,13 @@ _LT_EOF
>    	allow_undefined_flag='-berok'
>            # Determine the default libpath from the value encoded in an
>            # empty executable.
> @@ -33376,7 +33398,7 @@ index 2d551360683..e01d0a70438 100755
>      as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
>    fi
>    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -@@ -8778,22 +9293,29 @@ main ()
> +@@ -8777,22 +9292,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -33419,7 +33441,7 @@ index 2d551360683..e01d0a70438 100755
>    
>            hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>            archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -8805,7 +9327,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8804,7 +9326,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	else
>    	 # Determine the default libpath from the value encoded in an
>    	 # empty executable.
> @@ -33434,7 +33456,7 @@ index 2d551360683..e01d0a70438 100755
>      as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
>    fi
>    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -@@ -8821,22 +9349,29 @@ main ()
> +@@ -8820,22 +9348,29 @@ main ()
>    _ACEOF
>    if ac_fn_c_try_link "$LINENO"; then :
>    
> @@ -33477,7 +33499,7 @@ index 2d551360683..e01d0a70438 100755
>    
>    	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>    	  # Warning - without using the other run time loading flags,
> -@@ -8881,20 +9416,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8880,20 +9415,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>          # Microsoft Visual C++.
>          # hardcode_libdir_flag_spec is actually meaningless, as there is
>          # no search path for DLLs.
> @@ -33555,7 +33577,7 @@ index 2d551360683..e01d0a70438 100755
>          ;;
>    
>        darwin* | rhapsody*)
> -@@ -8955,7 +9533,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8954,7 +9532,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>        freebsd* | dragonfly*)
> @@ -33564,7 +33586,7 @@ index 2d551360683..e01d0a70438 100755
>          hardcode_libdir_flag_spec='-R$libdir'
>          hardcode_direct=yes
>          hardcode_shlibpath_var=no
> -@@ -8963,7 +9541,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8962,7 +9540,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux9*)
>          if test "$GCC" = yes; then
> @@ -33573,7 +33595,7 @@ index 2d551360683..e01d0a70438 100755
>          else
>    	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>          fi
> -@@ -8979,7 +9557,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8978,7 +9556,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    
>        hpux10*)
>          if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -33582,7 +33604,7 @@ index 2d551360683..e01d0a70438 100755
>          else
>    	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>          fi
> -@@ -9003,10 +9581,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9002,10 +9580,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>    	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
>    	  ;;
>    	ia64*)
> @@ -33595,7 +33617,7 @@ index 2d551360683..e01d0a70438 100755
>    	  ;;
>    	esac
>          else
> -@@ -9085,26 +9663,39 @@ fi
> +@@ -9084,26 +9662,39 @@ fi
>    
>        irix5* | irix6* | nonstopux*)
>          if test "$GCC" = yes; then
> @@ -33643,7 +33665,7 @@ index 2d551360683..e01d0a70438 100755
>          else
>    	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>    	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9189,7 +9780,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9188,7 +9779,7 @@ rm -f core conftest.err conftest.$ac_objext \
>        osf4* | osf5*)	# as osf3* with the addition of -msym flag
>          if test "$GCC" = yes; then
>    	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -33652,7 +33674,7 @@ index 2d551360683..e01d0a70438 100755
>    	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>          else
>    	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9208,9 +9799,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9207,9 +9798,9 @@ rm -f core conftest.err conftest.$ac_objext \
>          no_undefined_flag=' -z defs'
>          if test "$GCC" = yes; then
>    	wlarc='${wl}'
> @@ -33664,7 +33686,7 @@ index 2d551360683..e01d0a70438 100755
>          else
>    	case `$CC -V 2>&1` in
>    	*"Compilers 5.0"*)
> -@@ -9786,8 +10377,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9785,8 +10376,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>      need_version=no
>      need_lib_prefix=no
>    
> @@ -33676,7 +33698,7 @@ index 2d551360683..e01d0a70438 100755
>        library_names_spec='$libname.dll.a'
>        # DLL is installed to $(libdir)/../bin by postinstall_cmds
>        postinstall_cmds='base_file=`basename \${file}`~
> -@@ -9820,13 +10412,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9819,13 +10411,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>          library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>          ;;
>        esac
> @@ -33749,16 +33771,16 @@ index 2d551360683..e01d0a70438 100755
>      # FIXME: first we should search . and the directory the executable is in
>      shlibpath_var=PATH
>      ;;
> -@@ -10746,7 +11396,7 @@ else
> +@@ -10745,7 +11395,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 10749 "configure"
> +-#line 10748 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -10790,10 +11440,10 @@ else
> +@@ -10789,10 +11439,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -33771,16 +33793,16 @@ index 2d551360683..e01d0a70438 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -10852,7 +11502,7 @@ else
> +@@ -10851,7 +11501,7 @@ else
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat > conftest.$ac_ext <<_LT_EOF
> --#line 10855 "configure"
> +-#line 10854 "configure"
>   +#line $LINENO "configure"
>    #include "confdefs.h"
>    
>    #if HAVE_DLFCN_H
> -@@ -10896,10 +11546,10 @@ else
> +@@ -10895,10 +11545,10 @@ else
>    /* When -fvisbility=hidden is used, assume the code has been annotated
>       correspondingly for the symbols needed.  */
>    #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -33793,7 +33815,7 @@ index 2d551360683..e01d0a70438 100755
>    int main ()
>    {
>      void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12385,13 +13035,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -12377,13 +13027,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>    lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>    lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>    lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -33814,7 +33836,7 @@ index 2d551360683..e01d0a70438 100755
>    STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>    RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>    old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -12406,14 +13063,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -12398,14 +13055,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>    lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -33833,7 +33855,7 @@ index 2d551360683..e01d0a70438 100755
>    DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>    NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>    LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -12446,12 +13106,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -12438,12 +13098,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>    hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>    inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>    link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -33847,7 +33869,7 @@ index 2d551360683..e01d0a70438 100755
>    file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>    variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>    need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -12506,8 +13166,13 @@ reload_flag \
> +@@ -12498,8 +13158,13 @@ reload_flag \
>    OBJDUMP \
>    deplibs_check_method \
>    file_magic_cmd \
> @@ -33861,7 +33883,7 @@ index 2d551360683..e01d0a70438 100755
>    STRIP \
>    RANLIB \
>    CC \
> -@@ -12517,12 +13182,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -12509,12 +13174,14 @@ lt_cv_sys_global_symbol_pipe \
>    lt_cv_sys_global_symbol_to_cdecl \
>    lt_cv_sys_global_symbol_to_c_name_address \
>    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -33877,7 +33899,7 @@ index 2d551360683..e01d0a70438 100755
>    DSYMUTIL \
>    NMEDIT \
>    LIPO \
> -@@ -12538,7 +13205,6 @@ no_undefined_flag \
> +@@ -12530,7 +13197,6 @@ no_undefined_flag \
>    hardcode_libdir_flag_spec \
>    hardcode_libdir_flag_spec_ld \
>    hardcode_libdir_separator \
> @@ -33885,7 +33907,7 @@ index 2d551360683..e01d0a70438 100755
>    exclude_expsyms \
>    include_expsyms \
>    file_list_spec \
> -@@ -12574,6 +13240,7 @@ module_cmds \
> +@@ -12566,6 +13232,7 @@ module_cmds \
>    module_expsym_cmds \
>    export_symbols_cmds \
>    prelink_cmds \
> @@ -33893,7 +33915,7 @@ index 2d551360683..e01d0a70438 100755
>    postinstall_cmds \
>    postuninstall_cmds \
>    finish_cmds \
> -@@ -13172,7 +13839,8 @@ $as_echo X"$file" |
> +@@ -13164,7 +13831,8 @@ $as_echo X"$file" |
>    # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>    #
>    #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -33903,7 +33925,7 @@ index 2d551360683..e01d0a70438 100755
>    #   Written by Gordon Matzigkeit, 1996
>    #
>    #   This file is part of GNU Libtool.
> -@@ -13275,19 +13943,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -13267,19 +13935,42 @@ SP2NL=$lt_lt_SP2NL
>    # turn newlines into spaces.
>    NL2SP=$lt_lt_NL2SP
>    
> @@ -33947,7 +33969,7 @@ index 2d551360683..e01d0a70438 100755
>    # A symbol stripping program.
>    STRIP=$lt_STRIP
>    
> -@@ -13317,6 +14008,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -13309,6 +14000,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>    # Transform the output of nm in a C name address pair when lib prefix is needed.
>    global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>    
> @@ -33960,7 +33982,7 @@ index 2d551360683..e01d0a70438 100755
>    # The name of the directory that contains temporary libtool files.
>    objdir=$objdir
>    
> -@@ -13326,6 +14023,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -13318,6 +14015,9 @@ MAGIC_CMD=$MAGIC_CMD
>    # Must we lock files when doing compilation?
>    need_locks=$lt_need_locks
>    
> @@ -33970,7 +33992,7 @@ index 2d551360683..e01d0a70438 100755
>    # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>    DSYMUTIL=$lt_DSYMUTIL
>    
> -@@ -13440,12 +14140,12 @@ with_gcc=$GCC
> +@@ -13432,12 +14132,12 @@ with_gcc=$GCC
>    # Compiler flag to turn off builtin functions.
>    no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>    
> @@ -33986,7 +34008,7 @@ index 2d551360683..e01d0a70438 100755
>    # Compiler flag to prevent dynamic linking.
>    link_static_flag=$lt_lt_prog_compiler_static
>    
> -@@ -13532,9 +14232,6 @@ inherit_rpath=$inherit_rpath
> +@@ -13524,9 +14224,6 @@ inherit_rpath=$inherit_rpath
>    # Whether libtool must link a program against all its dependency libraries.
>    link_all_deplibs=$link_all_deplibs
>    
> @@ -33996,7 +34018,7 @@ index 2d551360683..e01d0a70438 100755
>    # Set to "yes" if exported symbols are required.
>    always_export_symbols=$always_export_symbols
>    
> -@@ -13550,6 +14247,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -13542,6 +14239,9 @@ include_expsyms=$lt_include_expsyms
>    # Commands necessary for linking programs (against libraries) with templates.
>    prelink_cmds=$lt_prelink_cmds
>    
> @@ -34006,7 +34028,7 @@ index 2d551360683..e01d0a70438 100755
>    # Specify filename containing input files.
>    file_list_spec=$lt_file_list_spec
>    
> -@@ -13582,210 +14282,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -13574,210 +14274,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>      # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>      # text mode, it properly converts lines to CR/LF.  This bash problem
>      # is reportedly fixed, but why not run on old versions too?
> diff --git a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> index 50201fb6b69..72015134534 100644
> --- a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> @@ -1,4 +1,4 @@
> -From c9e810840d95554046b7132e3e2c98bf99cb2d89 Mon Sep 17 00:00:00 2001
> +From 7f8a2d32fa0951aa2f921a4401ce1cac664db129 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Mon, 2 Mar 2015 01:42:38 +0000
>   Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
> diff --git a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
> index 57d9ac5f27f..0564980c13c 100644
> --- a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
> @@ -1,4 +1,4 @@
> -From befc176c209bbb4c32b57c2068e813c88b1ab6b1 Mon Sep 17 00:00:00 2001
> +From 397884efce0bb7c3f1ff5e1da212e874c7eaf14b Mon Sep 17 00:00:00 2001
>   From: Ross Burton <ross.burton@intel.com>
>   Date: Mon, 6 Mar 2017 23:33:27 -0800
>   Subject: [PATCH] sync with OE libtool changes
> diff --git a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
> index c47f41f5caf..728dee0908c 100644
> --- a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
> @@ -1,4 +1,4 @@
> -From cad852e0ed46a1c26607f9e7d17cc5974b05e38a Mon Sep 17 00:00:00 2001
> +From 75a17814ee39346612a2ff582fe5466201fa56b3 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Wed, 15 Apr 2020 14:17:20 -0700
>   Subject: [PATCH] Check for clang before checking gcc version
> @@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    2 files changed, 2 insertions(+), 2 deletions(-)
>   
>   diff --git a/configure b/configure
> -index 670684d83d1..f9ba1c0a4f7 100755
> +index 7823f2c3784..52b6a1318ae 100755
>   --- a/configure
>   +++ b/configure
>   @@ -5432,7 +5432,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
> @@ -31,10 +31,10 @@ index 670684d83d1..f9ba1c0a4f7 100755
>    #endif
>    int main() {}
>   diff --git a/configure.ac b/configure.ac
> -index 88b4800e298..6cd4530db56 100644
> +index a390639bfa9..66b8de7d4fd 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -1410,7 +1410,7 @@ if test "$GCC" = yes; then
> +@@ -1411,7 +1411,7 @@ if test "$GCC" = yes; then
>      AC_MSG_CHECKING([whether g++ accepts -static-libstdc++ -static-libgcc])
>      AC_LANG_PUSH(C++)
>      AC_LINK_IFELSE([AC_LANG_SOURCE([
> diff --git a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> index 985911aab14..aaf90d25b7d 100644
> --- a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> @@ -1,4 +1,4 @@
> -From 47e53916e3112391d8bff2b2257dcec0a2426d66 Mon Sep 17 00:00:00 2001
> +From 508c79dbef580e52b1c47026dfe2fe5ae7be4d56 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Thu, 10 Mar 2022 21:21:33 -0800
>   Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empty
> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 5 insertions(+)
>   
>   diff --git a/ld/ldelf.c b/ld/ldelf.c
> -index 187b359af86..ad792f02d63 100644
> +index e49c0217ae2..069f2263c81 100644
>   --- a/ld/ldelf.c
>   +++ b/ld/ldelf.c
>   @@ -1130,6 +1130,9 @@ ldelf_handle_dt_needed (struct elf_link_hash_table *htab,
> diff --git a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
> index 0cb2f46a070..5027f0c6a5d 100644
> --- a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
> @@ -1,4 +1,4 @@
> -From d479020609329cdc7fa3675bc3daf072401fefae Mon Sep 17 00:00:00 2001
> +From aea8ba15afba280c9bc5ae22828fae4eed09db41 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Sun, 15 Jan 2023 00:16:25 -0800
>   Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
> diff --git a/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch b/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
> index 8aef2cc7101..2c38aeccdaf 100644
> --- a/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
> @@ -1,4 +1,4 @@
> -From ddd941856582a82171626cbe609325b11e223704 Mon Sep 17 00:00:00 2001
> +From d9b37b144a952283cefafdf679d06f842cafc955 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Wed, 18 Jan 2023 19:35:07 -0800
>   Subject: [PATCH] Remove duplicate pe-dll.o entry deom targ_extra_ofiles
> diff --git a/meta/recipes-devtools/binutils/binutils/0015-gprofng-change-use-of-bignum-to-bigint.patch b/meta/recipes-devtools/binutils/binutils/0015-gprofng-change-use-of-bignum-to-bigint.patch
> deleted file mode 100644
> index 0d3d289ebad..00000000000
> --- a/meta/recipes-devtools/binutils/binutils/0015-gprofng-change-use-of-bignum-to-bigint.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=3243d790ee32aa8eda69226d81b1e79dbd1dcd87]
> -
> -Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> -
> -diff --git a/gprofng/gp-display-html/gp-display-html.in b/gprofng/gp-display-html/gp-display-html.in
> -index 6f37ca282e7..306c99a0ec3 100644
> ---- a/gprofng/gp-display-html/gp-display-html.in
> -+++ b/gprofng/gp-display-html/gp-display-html.in
> -@@ -25,7 +25,7 @@ use warnings;
> - # Disable before release
> - # use Perl::Critic;
> -
> --use bignum;
> -+use bigint;
> - use List::Util qw (max);
> - use Cwd qw (abs_path cwd);
> - use File::Basename;
> diff --git a/meta/recipes-devtools/binutils/binutils_2.42.bb b/meta/recipes-devtools/binutils/binutils_2.43.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils_2.42.bb
> rename to meta/recipes-devtools/binutils/binutils_2.43.bb
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202982): https://lists.openembedded.org/g/openembedded-core/message/202982
> Mute This Topic: https://lists.openembedded.org/mt/107727094/7581020
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ypa.takayasu.ito@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Takayasu Ito
Yocto Project Ambassador
ypa.takayasu.ito@gmail.com


