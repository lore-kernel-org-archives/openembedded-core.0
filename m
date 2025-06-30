Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8786BC8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 10:51:39 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.36634.1751280697728805020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 03:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZCWbrxyP;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45310223677so13294755e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 03:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1751280696; x=1751885496; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gVzn/0SeHNXG1F40/PsrnQXsytI1AnnzQA2YeC0UgMI=;
        b=ZCWbrxyPgtMmxPp9+njEq3495B6wheNAIRYWzI4qyaDKGviXR0p3RZxg8ymHmlMo1H
         H/Y3BwrHKhpcK+eToxsJ7lk2VeiFE8CJc0zON7SYtofaJvCXt+cb1l8DBTQddZKiZFGq
         E23/9p8fhkKOtRKUqUDQze8EsUAqSnzqY8/P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751280696; x=1751885496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVzn/0SeHNXG1F40/PsrnQXsytI1AnnzQA2YeC0UgMI=;
        b=WSbEM5J2jJjAIVdwWZCcfCSbmkaKq4hEp6vrXiCyBJ8xmCkvp/X9CFlWCTO72ROffL
         1i2TkBk+lhVaeGjc+GH4eKl/Tf+o193AmCH5o5W0qpezzcPYRdZkuUc8s2tFCL62rocj
         3e4EWbfZ4p8NtbMXVb0Evphri1Jy/QHjJDHeZ+cIpQoKohvDfMBsHp/DN2NEcXJyot3o
         RNcD3OJ32lh+F4r/WACEYsA8RhZEaproFzTiC2pKdpNHdyZD11E9T0N4omH4BYigiJtD
         F6b/1Xj2UWThNzHGS3Yc1QxPekPzb+24dne+qXWy2O7fEyoThQxN+lXfJpiCfhOCyLF9
         npmw==
X-Gm-Message-State: AOJu0YxkpwBlX1GZddjyob/0P/4dEPjy2Bvik+6jNi5KMVVGNDT4aoXI
	+KNFIvaaGzeOAlk2atAbTz1QEKo1dxraeS6GMxNl3jUHsImCawPoruKg5JY0MqQgXp3+SM0nrNX
	5sMFTcOoRUowXeQNHoX14pZkpz9ZGxAdjsOkwUoUA6w==
X-Gm-Gg: ASbGncsgmM/93jPrRRPBcbCw+XnGpkNxjmUpsV6MmNLmb+13cIv5xspo1Z0Hp9y0Ycb
	Gh9YtsiGPDn8rWI19qsT2qRzaff7hZxnqmpnzNWm7UDm+wgsNWsVawV4MmniA8EhGVMgoMv05+Y
	kjsPgxD1Z7ttABZgPaY8A24TZBonXNl6nKy5yrx+/Nrv6cJg5Jck+NuNfZYdgZk9KRRKfcvx+RU
	n8yKQ==
X-Google-Smtp-Source: AGHT+IEJEW+tKTW4wkqLeqJ/xFrGBvKCFxZ5M9NrDcHegA9Yz5B1SA5aAPMKIZJVOrdenl4qi+yKWboEUtZBGHWjEgA=
X-Received: by 2002:a05:600c:190b:b0:440:6a1a:d89f with SMTP id
 5b1f17b1804b1-4538ee4fd6cmr137185305e9.4.1751280695713; Mon, 30 Jun 2025
 03:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250630104104.4093207-1-Moritz.Haase@bmw.de> <20250630104104.4093207-4-Moritz.Haase@bmw.de>
In-Reply-To: <20250630104104.4093207-4-Moritz.Haase@bmw.de>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 30 Jun 2025 12:51:09 +0200
X-Gm-Features: Ac12FXzBIzHuXMoXmVLtljXtD-VZIsUWmZwCgPMNaOhBasB-qoBdVj2yVAve7x4
Message-ID: <CAMSfU+7WhC+=fKu8kGOSiqH2cnRqisJy90ZBMcUB27NYiCPesg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] cmake: upgrade 3.31.6 -> 4.0.3
To: Moritz.Haase@bmw.de
Cc: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Content-Type: multipart/alternative; boundary="000000000000c53b160638c7cf32"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 10:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219508

--000000000000c53b160638c7cf32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le lun. 30 juin 2025 =C3=A0 12:42, Moritz Haase via lists.openembedded.org
<Moritz.Haase=3Dbmw.de@lists.openembedded.org> a =C3=A9crit :

> This is the first major release bump for CMake since 3.0 was released in
> 2014.
> Compatibility with versions of CMake older than 3.5 has been removed. Ful=
l
> release notes are available at [0].
>

Thanks!

Out of curiosity (because we will soon find out), do we know how much of
meta-openembedded does "Compatibility with versions of CMake older than 3.5
has been removed" break?



> Obsolete patches have been removed and the few remaining ones have been
> refreshed. We can now build cmake without patches, only cmake-native
> requires
> two that are not suitable for upstreaming.
>
> The main license file has been renamed from Copyright.txt to LICENSE.rst
> in [1].
> References to the file have been updated, causing changes to the licensin=
g
> header in 'cmake.h' (see [2]).
>
> Additionally, the '1996 - 2024' copyright statement in (cm)curl's COPYING
> was
> updated to '1996 - 2025' in [3].
>
> [0]: https://cmake.org/cmake/help/v4.0/release/4.0.html
> [1]:
> https://gitlab.kitware.com/cmake/cmake/-/commit/2d42a5444f859891b6598c76e=
a5d51510013565e
> [2]:
> https://gitlab.kitware.com/cmake/cmake/-/commit/de273b2e115974a012a6204ff=
ee046dc9ce77586
> [3]:
> https://gitlab.kitware.com/cmake/cmake/-/commit/48b13baebc7f99442c3b872f2=
02efd2fb92d6d7f
>
> License-Update: License file renamed; copyright years updated
> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> CC: alex.kanavin@gmail.com
> ---
> changes in v2:
> - Squashed license update into this commit to keep bisectability
> - Fixed patchtest findings
>
> ---
>
>  ...native_3.31.6.bb =3D> cmake-native_4.0.3.bb} |   6 +-
>  meta/recipes-devtools/cmake/cmake.inc         |   8 +-
>  ...mpilerABI-Strip-pipe-from-compile-fl.patch |  63 ------
>  ...xt2fs-ext2_fs.h-by-cmake-s-internal.patch} |   4 +-
>  ...ng-undocumented-type-for-CURLOPT_NET.patch |  30 ---
>  ...trary-characters-in-test-names-of-CT.patch | 202 ------------------
>  ...-CMakeLists.txt-disable-USE_NGHTTP2.patch} |   6 +-
>  .../cmake/{cmake_3.31.6.bb =3D> cmake_4.0.3.bb} |   1 -
>  8 files changed, 11 insertions(+), 309 deletions(-)
>  rename meta/recipes-devtools/cmake/{cmake-native_3.31.6.bb =3D>
> cmake-native_4.0.3.bb} (90%)
>  delete mode 100644
> meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pi=
pe-from-compile-fl.patch
>  rename
> meta/recipes-devtools/cmake/cmake/{0005-Disable-use-of-ext2fs-ext2_fs.h-b=
y-cmake-s-internal-.patch
> =3D> 0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch} (90%=
)
>  delete mode 100644
> meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-ty=
pe-for-CURLOPT_NET.patch
>  delete mode 100644
> meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-i=
n-test-names-of-CT.patch
>  rename
> meta/recipes-devtools/cmake/cmake/{0001-CMakeLists.txt-disable-USE_NGHTTP=
2.patch
> =3D> 0002-CMakeLists.txt-disable-USE_NGHTTP2.patch} (83%)
>  rename meta/recipes-devtools/cmake/{cmake_3.31.6.bb =3D> cmake_4.0.3.bb}
> (96%)
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
> b/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb
> similarity index 90%
> rename from meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
> rename to meta/recipes-devtools/cmake/cmake-native_4.0.3.bb
> index b940abb3fd..7b90bff52f 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb
> @@ -5,8 +5,8 @@ DEPENDS +=3D "bzip2-replacement-native xz-native zlib-nat=
ive
> ncurses-native zstd-n
>
>  SRC_URI +=3D "file://OEToolchainConfig.cmake \
>              file://environment.d-cmake.sh \
> -
> file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch \
> -            file://0001-CMakeLists.txt-disable-USE_NGHTTP2.patch \
> +
> file://0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch \
> +            file://0002-CMakeLists.txt-disable-USE_NGHTTP2.patch \
>              "
>
>  LICENSE:append =3D " & BSD-1-Clause & MIT & BSD-2-Clause & curl"
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM:append =3D " \
>      file://Utilities/cmexpat/COPYING;md5=3D7b3b078238d0901d3b339289117cb=
7fb
> \
>
>  file://Utilities/cmlibrhash/COPYING;md5=3Da8c2a557a5c53b1c12cddbee98c099=
af \
>      file://Utilities/cmlibuv/LICENSE;md5=3Dad93ca1fffe931537fcf64f6fcce0=
84d
> \
> -    file://Utilities/cmcurl/COPYING;md5=3Deed2e5088e1ac619c9a1c747da291d=
75 \
> +    file://Utilities/cmcurl/COPYING;md5=3D72f4e9890e99e68d77b7e40703d789=
b8 \
>  "
>
>  B =3D "${WORKDIR}/build"
> diff --git a/meta/recipes-devtools/cmake/cmake.inc
> b/meta/recipes-devtools/cmake/cmake.inc
> index 9b1898f22f..a15dfd3bb4 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -10,18 +10,16 @@ HOMEPAGE =3D "http://www.cmake.org/"
>  BUGTRACKER =3D "http://public.kitware.com/Bug/my_view_page.php"
>  SECTION =3D "console/utils"
>  LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D
> "file://Copyright.txt;md5=3D718f05155941b33862726348d3cd46ce \
> -
> file://Source/cmake.h;beginline=3D1;endline=3D2;md5=3Da5f70e1fef8614734ea=
e0d62b4f5891b
> \
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.rst;md5=3D0cafc0f3b6b28f3d5ecb5d1a68c36471 \
> +
> file://Source/cmake.h;beginline=3D1;endline=3D2;md5=3D4ba59ac0e953e1a713e=
ea8c55b1d531b
> \
>                      "
>
>  CMAKE_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
>
>  SRC_URI =3D "
> https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
> -
>  file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
> -
>  file://0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch \
>             "
>
> -SRC_URI[sha256sum] =3D
> "653427f0f5014750aafff22727fb2aa60c6c732ca91808cfb78ce22ddd9e55f0"
> +SRC_URI[sha256sum] =3D
> "8d3537b7b7732660ea247398f166be892fe6131d63cc291944b45b91279f3ffb"
>
>  UPSTREAM_CHECK_REGEX =3D "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git
> a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-=
pipe-from-compile-fl.patch
> b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-=
pipe-from-compile-fl.patch
> deleted file mode 100644
> index 3895c7e03b..0000000000
> ---
> a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-=
pipe-from-compile-fl.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From e4061151ac13bc727512d961a80faca3ceb22b5a Mon Sep 17 00:00:00 2001
> -From: Philip Lorenz <philip.lorenz@bmw.de>
> -Date: Mon, 3 Jun 2024 13:19:24 +0200
> -Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile fla=
gs
> -
> -When `-pipe` is enabled, GCC passes data between its different
> -executables using pipes instead of temporary files. This leads to issues
> -when cmake attempts to infer compiler internals via the `-v` parameter
> -as each executable will print to `stderr` in parallel.
> -
> -For example we have observed the following outputs in our builds which
> -sporadically lead to build failures as system include directories were
> -not detected reliably:
> -
> -Parsed CXX implicit include dir info from above output: rv=3Ddone
> -  found start of include info
> -  found start of implicit include info
> -    add:
> [.../usr/bin/x86_64-poky-linux/../../lib/x86_64-poky-linux/gcc/x86_64-pok=
y-linux/11.4.0/include]
> -    add:
> [.../usr/bin/x86_64-poky-linux/../../lib/x86_64-poky-linux/gcc/x86_64-pok=
y-linux/11.4.0/include-fixed]
> -    add: [.../usr/include/c++/11.4.0]
> -    add: [.../usr/include/c++/11.4.0/x86_64-poky-linux]
> -    add: [.../usr/include/c++/11.4.0/backward]
> -    add: [.../usr/lib/x86_64-poky-linux/11.4.0/include]
> -    add: [...GNU assembler version 2.38 (x86_64-poky-linux) using BFD
> version (GNU Binutils) 2.38.20220708]
> -    add: [/usr/include]
> -  end of search list found
> -
> -Fix this issue by stripping the `-pipe` parameter from the compilation
> -flag when determining the toolchain configuration.
> -
> -Upstream-Status: Backport [3.32.0,
> 71be059f3f32b6791427893a48ba4815a19e2e78]
> -Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
> ----
> - Modules/CMakeDetermineCompilerABI.cmake | 9 ++++++++-
> - 1 file changed, 8 insertions(+), 1 deletion(-)
> -
> -diff --git a/Modules/CMakeDetermineCompilerABI.cmake
> b/Modules/CMakeDetermineCompilerABI.cmake
> -index 4a75e25a..806f0b71 100644
> ---- a/Modules/CMakeDetermineCompilerABI.cmake
> -+++ b/Modules/CMakeDetermineCompilerABI.cmake
> -@@ -52,14 +52,21 @@ function(CMAKE_DETERMINE_COMPILER_ABI lang src)
> -
> -     __TestCompiler_setTryCompileTargetType()
> -
> --    # Avoid failing ABI detection on warnings.
> -+    # Avoid failing ABI detection caused by non-functionally relevant
> -+    # compiler arguments
> -     if(CMAKE_TRY_COMPILE_CONFIGURATION)
> -       string(TOUPPER "${CMAKE_TRY_COMPILE_CONFIGURATION}" _tc_config)
> -     else()
> -       set(_tc_config "DEBUG")
> -     endif()
> -     foreach(v CMAKE_${lang}_FLAGS CMAKE_${lang}_FLAGS_${_tc_config})
> -+      # Avoid failing ABI detection on warnings.
> -       string(REGEX REPLACE "(^| )-Werror([=3D ][^-][^ ]*)?( |$)" " " ${=
v}
> "${${v}}")
> -+      # Avoid passing of "-pipe" when determining the compiler
> internals. With
> -+      # "-pipe" GCC will use pipes to pass data between the involved
> -+      # executables.  This may lead to issues when their stderr output
> (which
> -+      # contains the relevant compiler internals) becomes interweaved.
> -+      string(REGEX REPLACE "(^| )-pipe( |$)" " " ${v} "${${v}}")
> -     endforeach()
> -
> -     # Save the current LC_ALL, LC_MESSAGES, and LANG environment
> variables
> diff --git
> a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-=
by-cmake-s-internal-.patch
> b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-=
by-cmake-s-internal.patch
> similarity index 90%
> rename from
> meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by=
-cmake-s-internal-.patch
> rename to
> meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by=
-cmake-s-internal.patch
> index 7559c52932..f31dce5644 100644
> ---
> a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-=
by-cmake-s-internal-.patch
> +++
> b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-=
by-cmake-s-internal.patch
> @@ -1,4 +1,4 @@
> -From 8effa783e47e2b574be90733c38b27701e06e929 Mon Sep 17 00:00:00 2001
> +From cf8210696ebbaff14612d845bc98fac447c0e6f5 Mon Sep 17 00:00:00 2001
>  From: Otavio Salvador <otavio@ossystems.com.br>
>  Date: Thu, 5 Jul 2018 10:28:04 -0300
>  Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
> @@ -18,7 +18,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br=
>
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
>  diff --git a/Utilities/cmlibarchive/CMakeLists.txt
> b/Utilities/cmlibarchive/CMakeLists.txt
> -index 4e4b49c1..50e9a733 100644
> +index
> 04d986b6ea7d8dc0bd7e909d4e7b4e73c9e35437..014fe78063f7d30c9a4970b7cf3aeea=
eb36bcdbc
> 100644
>  --- a/Utilities/cmlibarchive/CMakeLists.txt
>  +++ b/Utilities/cmlibarchive/CMakeLists.txt
>  @@ -745,12 +745,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
> diff --git
> a/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-=
type-for-CURLOPT_NET.patch
> b/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-=
type-for-CURLOPT_NET.patch
> deleted file mode 100644
> index c719c1fdfb..0000000000
> ---
> a/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-=
type-for-CURLOPT_NET.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From c608975f4490f67872926f2601e5c37f2e570307 Mon Sep 17 00:00:00 2001
> -From: Wang Mingyu <wangmy@fujitsu.com>
> -Date: Wed, 9 Apr 2025 01:40:46 +0000
> -Subject: [PATCH] cmCurl: Avoid using undocumented type for CURLOPT_NETRC
> - values
> -
> -Fix: nativesdk-cmake/3.31.6/cmake-3.31.6/Source/cmCurl.cxx:178:26: error=
:
> invalid conversion from 'long int' to 'CURL_NETRC_OPTION' [-fpermissive]
> -Upstream-Status: Backport [
> https://gitlab.kitware.com/cmake/cmake/-/merge_requests/10449/diffs?commi=
t_id=3D1b0c92a3a1b782ff3e1c4499b6ab8db614d45bcd
> ]
> -
> -Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ----
> - Source/cmCurl.cxx | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Source/cmCurl.cxx b/Source/cmCurl.cxx
> -index b9133ed7..0cf8a71a 100644
> ---- a/Source/cmCurl.cxx
> -+++ b/Source/cmCurl.cxx
> -@@ -170,7 +170,7 @@ std::string cmCurlSetNETRCOption(::CURL* curl, const
> std::string& netrc_level,
> -                                  const std::string& netrc_file)
> - {
> -   std::string e;
> --  CURL_NETRC_OPTION curl_netrc_level =3D CURL_NETRC_LAST;
> -+  long curl_netrc_level =3D CURL_NETRC_LAST;
> -   ::CURLcode res;
> -
> -   if (!netrc_level.empty()) {
> ---
> -2.43.0
> -
> diff --git
> a/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters=
-in-test-names-of-CT.patch
> b/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters=
-in-test-names-of-CT.patch
> deleted file mode 100644
> index 31f6148cac..0000000000
> ---
> a/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters=
-in-test-names-of-CT.patch
> +++ /dev/null
> @@ -1,202 +0,0 @@
> -From c7e8b03324883760a2d6fab86ae034beb82af651 Mon Sep 17 00:00:00 2001
> -From: John Drouhard <john@drouhard.dev>
> -Date: Thu, 9 Jan 2025 20:34:42 -0600
> -Subject: [PATCH] ctest: Allow arbitrary characters in test names of
> - CTestCostData.txt
> -
> -This changes the way lines in CTestCostData.txt are parsed to allow for
> -spaces in the test name.
> -
> -It does so by looking for space characters from the end; and once two
> -have been found, assumes everything from the beginning up to that
> -second-to-last-space is the test name.
> -
> -Additionally, parsing the file should be much more efficient since there
> -is no string or vector heap allocation per line. The std::string used by
> -the parse function to convert the int and float should be within most
> -standard libraries' small string optimization.
> -
> -Fixes: #26594
> -
> -Upstream-Status: Backport [4.0.0,
> 040da7d83216ace59710407e8ce35d5fd38e1340]
> -Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> ----
> - Source/CTest/cmCTestMultiProcessHandler.cxx | 77 +++++++++++++++------
> - Source/CTest/cmCTestMultiProcessHandler.h   |  3 +-
> - Tests/CTestTestScheduler/CMakeLists.txt     |  4 +-
> - 3 files changed, 61 insertions(+), 23 deletions(-)
> -
> -diff --git a/Source/CTest/cmCTestMultiProcessHandler.cxx
> b/Source/CTest/cmCTestMultiProcessHandler.cxx
> -index
> 84ea32b84d40025ec333a90d30c42eeaf7adc9ef..231e7b5f39b1d8aa75f4e59a890a099=
b53fcdaac
> 100644
> ---- a/Source/CTest/cmCTestMultiProcessHandler.cxx
> -+++ b/Source/CTest/cmCTestMultiProcessHandler.cxx
> -@@ -20,6 +20,7 @@
> -
> - #include <cm/memory>
> - #include <cm/optional>
> -+#include <cm/string_view>
> - #include <cmext/algorithm>
> -
> - #include <cm3p/json/value.h>
> -@@ -52,6 +53,48 @@ constexpr unsigned long kParallelLevelMinimum =3D 2u;
> - // Under a job server, parallelism is effectively limited
> - // only by available job server tokens.
> - constexpr unsigned long kParallelLevelUnbounded =3D 0x10000u;
> -+
> -+struct CostEntry
> -+{
> -+  cm::string_view name;
> -+  int prevRuns;
> -+  float cost;
> -+};
> -+
> -+cm::optional<CostEntry> splitCostLine(cm::string_view line)
> -+{
> -+  std::string part;
> -+  cm::string_view::size_type pos1 =3D line.size();
> -+  cm::string_view::size_type pos2 =3D line.find_last_of(' ', pos1);
> -+  auto findNext =3D [line, &part, &pos1, &pos2]() -> bool {
> -+    if (pos2 !=3D cm::string_view::npos) {
> -+      cm::string_view sub =3D line.substr(pos2 + 1, pos1 - pos2 - 1);
> -+      part.assign(sub.begin(), sub.end());
> -+      pos1 =3D pos2;
> -+      if (pos1 > 0) {
> -+        pos2 =3D line.find_last_of(' ', pos1 - 1);
> -+      }
> -+      return true;
> -+    }
> -+    return false;
> -+  };
> -+
> -+  // parse the cost
> -+  if (!findNext()) {
> -+    return cm::nullopt;
> -+  }
> -+  float cost =3D static_cast<float>(atof(part.c_str()));
> -+
> -+  // parse the previous runs
> -+  if (!findNext()) {
> -+    return cm::nullopt;
> -+  }
> -+  int prev =3D atoi(part.c_str());
> -+
> -+  // from start to the last found space is the name
> -+  return CostEntry{ line.substr(0, pos1), prev, cost };
> -+}
> -+
> - }
> -
> - namespace cmsys {
> -@@ -797,24 +840,21 @@ void cmCTestMultiProcessHandler::UpdateCostData()
> -       if (line =3D=3D "---") {
> -         break;
> -       }
> --      std::vector<std::string> parts =3D cmSystemTools::SplitString(lin=
e,
> ' ');
> -       // Format: <name> <previous_runs> <avg_cost>
> --      if (parts.size() < 3) {
> -+      cm::optional<CostEntry> entry =3D splitCostLine(line);
> -+      if (!entry) {
> -         break;
> -       }
> -
> --      std::string name =3D parts[0];
> --      int prev =3D atoi(parts[1].c_str());
> --      float cost =3D static_cast<float>(atof(parts[2].c_str()));
> --
> --      int index =3D this->SearchByName(name);
> -+      int index =3D this->SearchByName(entry->name);
> -       if (index =3D=3D -1) {
> -         // This test is not in memory. We just rewrite the entry
> --        fout << name << " " << prev << " " << cost << "\n";
> -+        fout << entry->name << " " << entry->prevRuns << " " <<
> entry->cost
> -+             << "\n";
> -       } else {
> -         // Update with our new average cost
> --        fout << name << " " << this->Properties[index]->PreviousRuns <<
> " "
> --             << this->Properties[index]->Cost << "\n";
> -+        fout << entry->name << " " <<
> this->Properties[index]->PreviousRuns
> -+             << " " << this->Properties[index]->Cost << "\n";
> -         temp.erase(index);
> -       }
> -     }
> -@@ -850,28 +890,25 @@ void cmCTestMultiProcessHandler::ReadCostData()
> -         break;
> -       }
> -
> --      std::vector<std::string> parts =3D cmSystemTools::SplitString(lin=
e,
> ' ');
> -+      // Format: <name> <previous_runs> <avg_cost>
> -+      cm::optional<CostEntry> entry =3D splitCostLine(line);
> -
> -       // Probably an older version of the file, will be fixed next run
> --      if (parts.size() < 3) {
> -+      if (!entry) {
> -         fin.close();
> -         return;
> -       }
> -
> --      std::string name =3D parts[0];
> --      int prev =3D atoi(parts[1].c_str());
> --      float cost =3D static_cast<float>(atof(parts[2].c_str()));
> --
> --      int index =3D this->SearchByName(name);
> -+      int index =3D this->SearchByName(entry->name);
> -       if (index =3D=3D -1) {
> -         continue;
> -       }
> -
> --      this->Properties[index]->PreviousRuns =3D prev;
> -+      this->Properties[index]->PreviousRuns =3D entry->prevRuns;
> -       // When not running in parallel mode, don't use cost data
> -       if (this->GetParallelLevel() > 1 && this->Properties[index] &&
> -           this->Properties[index]->Cost =3D=3D 0) {
> --        this->Properties[index]->Cost =3D cost;
> -+        this->Properties[index]->Cost =3D entry->cost;
> -       }
> -     }
> -     // Next part of the file is the failed tests
> -@@ -884,7 +921,7 @@ void cmCTestMultiProcessHandler::ReadCostData()
> -   }
> - }
> -
> --int cmCTestMultiProcessHandler::SearchByName(std::string const& name)
> -+int cmCTestMultiProcessHandler::SearchByName(cm::string_view name)
> - {
> -   int index =3D -1;
> -
> -diff --git a/Source/CTest/cmCTestMultiProcessHandler.h
> b/Source/CTest/cmCTestMultiProcessHandler.h
> -index
> fd6c17f2fac06949c20f3792dd3eae442b15850b..811be613c3387240c0181f8372b24cf=
09219621f
> 100644
> ---- a/Source/CTest/cmCTestMultiProcessHandler.h
> -+++ b/Source/CTest/cmCTestMultiProcessHandler.h
> -@@ -13,6 +13,7 @@
> - #include <vector>
> -
> - #include <cm/optional>
> -+#include <cm/string_view>
> -
> - #include "cmCTest.h"
> - #include "cmCTestResourceAllocator.h"
> -@@ -110,7 +111,7 @@ protected:
> -   void UpdateCostData();
> -   void ReadCostData();
> -   // Return index of a test based on its name
> --  int SearchByName(std::string const& name);
> -+  int SearchByName(cm::string_view name);
> -
> -   void CreateTestCostList();
> -
> -diff --git a/Tests/CTestTestScheduler/CMakeLists.txt
> b/Tests/CTestTestScheduler/CMakeLists.txt
> -index
> 6f8cb4dbc0de35984540e1868788e0a02124e819..daf6ce2b23d8c048334ae1047759130=
b246dccef
> 100644
> ---- a/Tests/CTestTestScheduler/CMakeLists.txt
> -+++ b/Tests/CTestTestScheduler/CMakeLists.txt
> -@@ -1,9 +1,9 @@
> --cmake_minimum_required(VERSION 3.10)
> -+cmake_minimum_required(VERSION 3.19)
> - project (CTestTestScheduler)
> - include (CTest)
> -
> - add_executable (Sleep sleep.c)
> -
> - foreach (time RANGE 1 4)
> --  add_test (TestSleep${time} Sleep ${time})
> -+  add_test ("TestSleep ${time}" Sleep ${time})
> - endforeach ()
> diff --git
> a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTT=
P2.patch
> b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTT=
P2.patch
> similarity index 83%
> rename from
> meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2=
.patch
> rename to
> meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2=
.patch
> index ab78fa26ba..158eea2c3e 100644
> ---
> a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTT=
P2.patch
> +++
> b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTT=
P2.patch
> @@ -1,4 +1,4 @@
> -From 061253f390ada0661b30cf8856fa8d8d40a7355d Mon Sep 17 00:00:00 2001
> +From e0a1996a85dcb43d69d3c7daecab4da74599e5ba Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Wed, 28 Dec 2022 17:51:27 +0800
>  Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
> @@ -22,10 +22,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Utilities/cmcurl/CMakeLists.txt
> b/Utilities/cmcurl/CMakeLists.txt
> -index ef6c269e..ecaac497 100644
> +index
> 75b510205984894ffa11461e7aa04d3c479709b4..83463042d82d9c7f17932753f47c47b=
12aeec85b
> 100644
>  --- a/Utilities/cmcurl/CMakeLists.txt
>  +++ b/Utilities/cmcurl/CMakeLists.txt
> -@@ -99,7 +99,7 @@ set(USE_ECH OFF)
> +@@ -105,7 +105,7 @@ set(USE_ECH OFF)
>   set(USE_HTTPSRR OFF)
>   set(USE_LIBIDN2 ON)
>   set(USE_LIBRTMP OFF)
> diff --git a/meta/recipes-devtools/cmake/cmake_3.31.6.bb
> b/meta/recipes-devtools/cmake/cmake_4.0.3.bb
> similarity index 96%
> rename from meta/recipes-devtools/cmake/cmake_3.31.6.bb
> rename to meta/recipes-devtools/cmake/cmake_4.0.3.bb
> index 2d343d6f52..7d8b8cac65 100644
> --- a/meta/recipes-devtools/cmake/cmake_3.31.6.bb
> +++ b/meta/recipes-devtools/cmake/cmake_4.0.3.bb
> @@ -5,7 +5,6 @@ inherit cmake bash-completion
>  DEPENDS +=3D "curl expat zlib libarchive xz ncurses bzip2"
>
>  SRC_URI:append:class-nativesdk =3D " \
> -
> file://0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch \
>      file://OEToolchainConfig.cmake \
>      file://SDKToolchainConfig.cmake.template \
>      file://cmake-setup.py \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219506):
> https://lists.openembedded.org/g/openembedded-core/message/219506
> Mute This Topic: https://lists.openembedded.org/mt/113905486/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000c53b160638c7cf32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 30 juin 2025=
 =C3=A0=C2=A012:42, Moritz Haase via <a href=3D"http://lists.openembedded.o=
rg">lists.openembedded.org</a> &lt;Moritz.Haase=3D<a href=3D"mailto:bmw.de@=
lists.openembedded.org">bmw.de@lists.openembedded.org</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is =
the first major release bump for CMake since 3.0 was released in 2014.<br>
Compatibility with versions of CMake older than 3.5 has been removed. Full<=
br>
release notes are available at [0].<br></blockquote><div><br></div><div>Tha=
nks!</div><div><br></div><div>Out of curiosity (because we will soon find o=
ut), do we know how much of meta-openembedded does &quot;Compatibility with=
 versions of CMake older than 3.5 has been removed&quot; break?</div><div><=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
Obsolete patches have been removed and the few remaining ones have been<br>
refreshed. We can now build cmake without patches, only cmake-native requir=
es<br>
two that are not suitable for upstreaming.<br>
<br>
The main license file has been renamed from Copyright.txt to LICENSE.rst in=
 [1].<br>
References to the file have been updated, causing changes to the licensing<=
br>
header in &#39;cmake.h&#39; (see [2]).<br>
<br>
Additionally, the &#39;1996 - 2024&#39; copyright statement in (cm)curl&#39=
;s COPYING was<br>
updated to &#39;1996 - 2025&#39; in [3].<br>
<br>
[0]: <a href=3D"https://cmake.org/cmake/help/v4.0/release/4.0.html" rel=3D"=
noreferrer" target=3D"_blank">https://cmake.org/cmake/help/v4.0/release/4.0=
.html</a><br>
[1]: <a href=3D"https://gitlab.kitware.com/cmake/cmake/-/commit/2d42a5444f8=
59891b6598c76ea5d51510013565e" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.kitware.com/cmake/cmake/-/commit/2d42a5444f859891b6598c76ea5d515100=
13565e</a><br>
[2]: <a href=3D"https://gitlab.kitware.com/cmake/cmake/-/commit/de273b2e115=
974a012a6204ffee046dc9ce77586" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.kitware.com/cmake/cmake/-/commit/de273b2e115974a012a6204ffee046dc9c=
e77586</a><br>
[3]: <a href=3D"https://gitlab.kitware.com/cmake/cmake/-/commit/48b13baebc7=
f99442c3b872f202efd2fb92d6d7f" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.kitware.com/cmake/cmake/-/commit/48b13baebc7f99442c3b872f202efd2fb9=
2d6d7f</a><br>
<br>
License-Update: License file renamed; copyright years updated<br>
Signed-off-by: Moritz Haase &lt;<a href=3D"mailto:Moritz.Haase@bmw.de" targ=
et=3D"_blank">Moritz.Haase@bmw.de</a>&gt;<br>
CC: <a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a><br>
---<br>
changes in v2:<br>
- Squashed license update into this commit to keep bisectability<br>
- Fixed patchtest findings<br>
<br>
---<br>
<br>
=C2=A0...<a href=3D"http://native_3.31.6.bb" rel=3D"noreferrer" target=3D"_=
blank">native_3.31.6.bb</a> =3D&gt; <a href=3D"http://cmake-native_4.0.3.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake-native_4.0.3.bb</a>} |=C2=A0 =
=C2=A06 +-<br>
=C2=A0meta/recipes-devtools/cmake/cmake.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0...mpilerABI-Strip-pipe-from-compile-fl.patch |=C2=A0 63 ------<br>
=C2=A0...xt2fs-ext2_fs.h-by-cmake-s-internal.patch} |=C2=A0 =C2=A04 +-<br>
=C2=A0...ng-undocumented-type-for-CURLOPT_NET.patch |=C2=A0 30 ---<br>
=C2=A0...trary-characters-in-test-names-of-CT.patch | 202 -----------------=
-<br>
=C2=A0...-CMakeLists.txt-disable-USE_NGHTTP2.patch} |=C2=A0 =C2=A06 +-<br>
=C2=A0.../cmake/{<a href=3D"http://cmake_3.31.6.bb" rel=3D"noreferrer" targ=
et=3D"_blank">cmake_3.31.6.bb</a> =3D&gt; <a href=3D"http://cmake_4.0.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">cmake_4.0.3.bb</a>} |=C2=A0 =C2=A01 -=
<br>
=C2=A08 files changed, 11 insertions(+), 309 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/cmake/{<a href=3D"http://cmake-native_3.=
31.6.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.31.6.bb</a> =
=3D&gt; <a href=3D"http://cmake-native_4.0.3.bb" rel=3D"noreferrer" target=
=3D"_blank">cmake-native_4.0.3.bb</a>} (90%)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDeterm=
ineCompilerABI-Strip-pipe-from-compile-fl.patch<br>
=C2=A0rename meta/recipes-devtools/cmake/cmake/{0005-Disable-use-of-ext2fs-=
ext2_fs.h-by-cmake-s-internal-.patch =3D&gt; 0001-Disable-use-of-ext2fs-ext=
2_fs.h-by-cmake-s-internal.patch} (90%)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoi=
d-using-undocumented-type-for-CURLOPT_NET.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-ctest-Allow=
-arbitrary-characters-in-test-names-of-CT.patch<br>
=C2=A0rename meta/recipes-devtools/cmake/cmake/{0001-CMakeLists.txt-disable=
-USE_NGHTTP2.patch =3D&gt; 0002-CMakeLists.txt-disable-USE_NGHTTP2.patch} (=
83%)<br>
=C2=A0rename meta/recipes-devtools/cmake/{<a href=3D"http://cmake_3.31.6.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake_3.31.6.bb</a> =3D&gt; <a href=
=3D"http://cmake_4.0.3.bb" rel=3D"noreferrer" target=3D"_blank">cmake_4.0.3=
.bb</a>} (96%)<br>
<br>
diff --git a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.3=
1.6.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.31.6.bb</a> b/m=
eta/recipes-devtools/cmake/<a href=3D"http://cmake-native_4.0.3.bb" rel=3D"=
noreferrer" target=3D"_blank">cmake-native_4.0.3.bb</a><br>
similarity index 90%<br>
rename from meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.31=
.6.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.31.6.bb</a><br>
rename to meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_4.0.3.=
bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_4.0.3.bb</a><br>
index b940abb3fd..7b90bff52f 100644<br>
--- a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.31.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">cmake-native_3.31.6.bb</a><br>
+++ b/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_4.0.3.bb" =
rel=3D"noreferrer" target=3D"_blank">cmake-native_4.0.3.bb</a><br>
@@ -5,8 +5,8 @@ DEPENDS +=3D &quot;bzip2-replacement-native xz-native zlib-=
native ncurses-native zstd-n<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://OEToolchainConfig.cmake \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http://en=
vironment.d-cmake.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-cm=
ake.sh</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-Disable-use-of-ext2f=
s-ext2_fs.h-by-cmake-s-internal-.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-CMakeLists.txt-disab=
le-USE_NGHTTP2.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Disable-use-of-ext2f=
s-ext2_fs.h-by-cmake-s-internal.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-CMakeLists.txt-disab=
le-USE_NGHTTP2.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LICENSE:append =3D &quot; &amp; BSD-1-Clause &amp; MIT &amp; BSD-2-Cl=
ause &amp; curl&quot;<br>
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM:append =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://Utilities/cmexpat/COPYING;md5=3D7b3b078238d0901d=
3b339289117cb7fb \<br>
=C2=A0 =C2=A0 =C2=A0file://Utilities/cmlibrhash/COPYING;md5=3Da8c2a557a5c53=
b1c12cddbee98c099af \<br>
=C2=A0 =C2=A0 =C2=A0file://Utilities/cmlibuv/LICENSE;md5=3Dad93ca1fffe93153=
7fcf64f6fcce084d \<br>
-=C2=A0 =C2=A0 file://Utilities/cmcurl/COPYING;md5=3Deed2e5088e1ac619c9a1c7=
47da291d75 \<br>
+=C2=A0 =C2=A0 file://Utilities/cmcurl/COPYING;md5=3D72f4e9890e99e68d77b7e4=
0703d789b8 \<br>
=C2=A0&quot;<br>
<br>
=C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/=
cmake/cmake.inc<br>
index 9b1898f22f..a15dfd3bb4 100644<br>
--- a/meta/recipes-devtools/cmake/cmake.inc<br>
+++ b/meta/recipes-devtools/cmake/cmake.inc<br>
@@ -10,18 +10,16 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.cmake.org/" re=
l=3D"noreferrer" target=3D"_blank">http://www.cmake.org/</a>&quot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"http://public.kitware.com/Bug/my_view=
_page.php" rel=3D"noreferrer" target=3D"_blank">http://public.kitware.com/B=
ug/my_view_page.php</a>&quot;<br>
=C2=A0SECTION =3D &quot;console/utils&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://Copyright.txt;md5=3D718f05155941b3386272=
6348d3cd46ce \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://Source/cmake.h;beginline=3D1;endline=3D2;md5=3Da5f70e1fef8614734eae0d62b=
4f5891b \<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.rst;md5=3D0cafc0f3b6b28f3d5ecb5d=
1a68c36471 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://Source/cmake.h;beginline=3D1;endline=3D2;md5=3D4ba59ac0e953e1a713eea8c55=
b1d531b \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
<br>
=C2=A0CMAKE_MAJOR_VERSION =3D &quot;${@&#39;.&#39;.join(d.getVar(&#39;PV&#3=
9;).split(&#39;.&#39;)[0:2])}&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://cmake.org/files/v$%7BCMAKE_MAJOR=
_VERSION%7D/cmake-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">ht=
tps://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-CMakeDetermineCompile=
rABI-Strip-pipe-from-compile-fl.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cmCurl-Avoid-using-un=
documented-type-for-CURLOPT_NET.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;653427f0f5014750aafff22727fb2aa60c6c732ca9180=
8cfb78ce22ddd9e55f0&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8d3537b7b7732660ea247398f166be892fe6131d63cc2=
91944b45b91279f3ffb&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;cmake-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar=
&quot;<br>
<br>
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerA=
BI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/000=
1-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch<br>
deleted file mode 100644<br>
index 3895c7e03b..0000000000<br>
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Stri=
p-pipe-from-compile-fl.patch<br>
+++ /dev/null<br>
@@ -1,63 +0,0 @@<br>
-From e4061151ac13bc727512d961a80faca3ceb22b5a Mon Sep 17 00:00:00 2001<br>
-From: Philip Lorenz &lt;<a href=3D"mailto:philip.lorenz@bmw.de" target=3D"=
_blank">philip.lorenz@bmw.de</a>&gt;<br>
-Date: Mon, 3 Jun 2024 13:19:24 +0200<br>
-Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags=
<br>
-<br>
-When `-pipe` is enabled, GCC passes data between its different<br>
-executables using pipes instead of temporary files. This leads to issues<b=
r>
-when cmake attempts to infer compiler internals via the `-v` parameter<br>
-as each executable will print to `stderr` in parallel.<br>
-<br>
-For example we have observed the following outputs in our builds which<br>
-sporadically lead to build failures as system include directories were<br>
-not detected reliably:<br>
-<br>
-Parsed CXX implicit include dir info from above output: rv=3Ddone<br>
-=C2=A0 found start of include info<br>
-=C2=A0 found start of implicit include info<br>
-=C2=A0 =C2=A0 add: [.../usr/bin/x86_64-poky-linux/../../lib/x86_64-poky-li=
nux/gcc/x86_64-poky-linux/11.4.0/include]<br>
-=C2=A0 =C2=A0 add: [.../usr/bin/x86_64-poky-linux/../../lib/x86_64-poky-li=
nux/gcc/x86_64-poky-linux/11.4.0/include-fixed]<br>
-=C2=A0 =C2=A0 add: [.../usr/include/c++/11.4.0]<br>
-=C2=A0 =C2=A0 add: [.../usr/include/c++/11.4.0/x86_64-poky-linux]<br>
-=C2=A0 =C2=A0 add: [.../usr/include/c++/11.4.0/backward]<br>
-=C2=A0 =C2=A0 add: [.../usr/lib/x86_64-poky-linux/11.4.0/include]<br>
-=C2=A0 =C2=A0 add: [...GNU assembler version 2.38 (x86_64-poky-linux) usin=
g BFD version (GNU Binutils) 2.38.20220708]<br>
-=C2=A0 =C2=A0 add: [/usr/include]<br>
-=C2=A0 end of search list found<br>
-<br>
-Fix this issue by stripping the `-pipe` parameter from the compilation<br>
-flag when determining the toolchain configuration.<br>
-<br>
-Upstream-Status: Backport [3.32.0, 71be059f3f32b6791427893a48ba4815a19e2e7=
8]<br>
-Signed-off-by: Philip Lorenz &lt;<a href=3D"mailto:philip.lorenz@bmw.de" t=
arget=3D"_blank">philip.lorenz@bmw.de</a>&gt;<br>
----<br>
- Modules/CMakeDetermineCompilerABI.cmake | 9 ++++++++-<br>
- 1 file changed, 8 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/Modules/CMakeDetermineCompilerABI.cmake b/Modules/CMakeDeterm=
ineCompilerABI.cmake<br>
-index 4a75e25a..806f0b71 100644<br>
---- a/Modules/CMakeDetermineCompilerABI.cmake<br>
-+++ b/Modules/CMakeDetermineCompilerABI.cmake<br>
-@@ -52,14 +52,21 @@ function(CMAKE_DETERMINE_COMPILER_ABI lang src)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0__TestCompiler_setTryCompileTargetType()<br>
- <br>
--=C2=A0 =C2=A0 # Avoid failing ABI detection on warnings.<br>
-+=C2=A0 =C2=A0 # Avoid failing ABI detection caused by non-functionally re=
levant<br>
-+=C2=A0 =C2=A0 # compiler arguments<br>
-=C2=A0 =C2=A0 =C2=A0if(CMAKE_TRY_COMPILE_CONFIGURATION)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0string(TOUPPER &quot;${CMAKE_TRY_COMPILE_CONFIG=
URATION}&quot; _tc_config)<br>
-=C2=A0 =C2=A0 =C2=A0else()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0set(_tc_config &quot;DEBUG&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0endif()<br>
-=C2=A0 =C2=A0 =C2=A0foreach(v CMAKE_${lang}_FLAGS CMAKE_${lang}_FLAGS_${_t=
c_config})<br>
-+=C2=A0 =C2=A0 =C2=A0 # Avoid failing ABI detection on warnings.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0string(REGEX REPLACE &quot;(^| )-Werror([=3D ][=
^-][^ ]*)?( |$)&quot; &quot; &quot; ${v} &quot;${${v}}&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 # Avoid passing of &quot;-pipe&quot; when determinin=
g the compiler internals. With<br>
-+=C2=A0 =C2=A0 =C2=A0 # &quot;-pipe&quot; GCC will use pipes to pass data =
between the involved<br>
-+=C2=A0 =C2=A0 =C2=A0 # executables.=C2=A0 This may lead to issues when th=
eir stderr output (which<br>
-+=C2=A0 =C2=A0 =C2=A0 # contains the relevant compiler internals) becomes =
interweaved.<br>
-+=C2=A0 =C2=A0 =C2=A0 string(REGEX REPLACE &quot;(^| )-pipe( |$)&quot; &qu=
ot; &quot; ${v} &quot;${${v}}&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0endforeach()<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0# Save the current LC_ALL, LC_MESSAGES, and LANG envir=
onment variables<br>
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-e=
xt2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/000=
1-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch<br>
similarity index 90%<br>
rename from meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ex=
t2_fs.h-by-cmake-s-internal-.patch<br>
rename to meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2=
_fs.h-by-cmake-s-internal.patch<br>
index 7559c52932..f31dce5644 100644<br>
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.=
h-by-cmake-s-internal-.patch<br>
+++ b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.=
h-by-cmake-s-internal.patch<br>
@@ -1,4 +1,4 @@<br>
-From 8effa783e47e2b574be90733c38b27701e06e929 Mon Sep 17 00:00:00 2001<br>
+From cf8210696ebbaff14612d845bc98fac447c0e6f5 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br" =
target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
=C2=A0Date: Thu, 5 Jul 2018 10:28:04 -0300<br>
=C2=A0Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake&#39;s inter=
nal<br>
@@ -18,7 +18,7 @@ Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otav=
io@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+), 6 deletions(-)<br>
<br>
=C2=A0diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmliba=
rchive/CMakeLists.txt<br>
-index 4e4b49c1..50e9a733 100644<br>
+index 04d986b6ea7d8dc0bd7e909d4e7b4e73c9e35437..014fe78063f7d30c9a4970b7cf=
3aeeaeb36bcdbc 100644<br>
=C2=A0--- a/Utilities/cmlibarchive/CMakeLists.txt<br>
=C2=A0+++ b/Utilities/cmlibarchive/CMakeLists.txt<br>
=C2=A0@@ -745,12 +745,8 @@ LA_CHECK_INCLUDE_FILE(&quot;copyfile.h&quot; HAV=
E_COPYFILE_H)<br>
diff --git a/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undo=
cumented-type-for-CURLOPT_NET.patch b/meta/recipes-devtools/cmake/cmake/000=
1-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch<br>
deleted file mode 100644<br>
index c719c1fdfb..0000000000<br>
--- a/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumente=
d-type-for-CURLOPT_NET.patch<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-From c608975f4490f67872926f2601e5c37f2e570307 Mon Sep 17 00:00:00 2001<br>
-From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_bla=
nk">wangmy@fujitsu.com</a>&gt;<br>
-Date: Wed, 9 Apr 2025 01:40:46 +0000<br>
-Subject: [PATCH] cmCurl: Avoid using undocumented type for CURLOPT_NETRC<b=
r>
- values<br>
-<br>
-Fix: nativesdk-cmake/3.31.6/cmake-3.31.6/Source/cmCurl.cxx:178:26: error: =
invalid conversion from &#39;long int&#39; to &#39;CURL_NETRC_OPTION&#39; [=
-fpermissive]<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.kitware.com/cmake/cma=
ke/-/merge_requests/10449/diffs?commit_id=3D1b0c92a3a1b782ff3e1c4499b6ab8db=
614d45bcd" rel=3D"noreferrer" target=3D"_blank">https://gitlab.kitware.com/=
cmake/cmake/-/merge_requests/10449/diffs?commit_id=3D1b0c92a3a1b782ff3e1c44=
99b6ab8db614d45bcd</a>]<br>
-<br>
-Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
----<br>
- Source/cmCurl.cxx | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/Source/cmCurl.cxx b/Source/cmCurl.cxx<br>
-index b9133ed7..0cf8a71a 100644<br>
---- a/Source/cmCurl.cxx<br>
-+++ b/Source/cmCurl.cxx<br>
-@@ -170,7 +170,7 @@ std::string cmCurlSetNETRCOption(::CURL* curl, const s=
td::string&amp; netrc_level,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const std::string&amp; netrc_=
file)<br>
- {<br>
-=C2=A0 =C2=A0std::string e;<br>
--=C2=A0 CURL_NETRC_OPTION curl_netrc_level =3D CURL_NETRC_LAST;<br>
-+=C2=A0 long curl_netrc_level =3D CURL_NETRC_LAST;<br>
-=C2=A0 =C2=A0::CURLcode res;<br>
- <br>
-=C2=A0 =C2=A0if (!netrc_level.empty()) {<br>
--- <br>
-2.43.0<br>
-<br>
diff --git a/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-c=
haracters-in-test-names-of-CT.patch b/meta/recipes-devtools/cmake/cmake/000=
1-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch<br>
deleted file mode 100644<br>
index 31f6148cac..0000000000<br>
--- a/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characte=
rs-in-test-names-of-CT.patch<br>
+++ /dev/null<br>
@@ -1,202 +0,0 @@<br>
-From c7e8b03324883760a2d6fab86ae034beb82af651 Mon Sep 17 00:00:00 2001<br>
-From: John Drouhard &lt;<a href=3D"mailto:john@drouhard.dev" target=3D"_bl=
ank">john@drouhard.dev</a>&gt;<br>
-Date: Thu, 9 Jan 2025 20:34:42 -0600<br>
-Subject: [PATCH] ctest: Allow arbitrary characters in test names of<br>
- CTestCostData.txt<br>
-<br>
-This changes the way lines in CTestCostData.txt are parsed to allow for<br=
>
-spaces in the test name.<br>
-<br>
-It does so by looking for space characters from the end; and once two<br>
-have been found, assumes everything from the beginning up to that<br>
-second-to-last-space is the test name.<br>
-<br>
-Additionally, parsing the file should be much more efficient since there<b=
r>
-is no string or vector heap allocation per line. The std::string used by<b=
r>
-the parse function to convert the int and float should be within most<br>
-standard libraries&#39; small string optimization.<br>
-<br>
-Fixes: #26594<br>
-<br>
-Upstream-Status: Backport [4.0.0, 040da7d83216ace59710407e8ce35d5fd38e1340=
]<br>
-Signed-off-by: Moritz Haase &lt;<a href=3D"mailto:Moritz.Haase@bmw.de" tar=
get=3D"_blank">Moritz.Haase@bmw.de</a>&gt;<br>
----<br>
- Source/CTest/cmCTestMultiProcessHandler.cxx | 77 +++++++++++++++------<br=
>
- Source/CTest/cmCTestMultiProcessHandler.h=C2=A0 =C2=A0|=C2=A0 3 +-<br>
- Tests/CTestTestScheduler/CMakeLists.txt=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<b=
r>
- 3 files changed, 61 insertions(+), 23 deletions(-)<br>
-<br>
-diff --git a/Source/CTest/cmCTestMultiProcessHandler.cxx b/Source/CTest/cm=
CTestMultiProcessHandler.cxx<br>
-index 84ea32b84d40025ec333a90d30c42eeaf7adc9ef..231e7b5f39b1d8aa75f4e59a89=
0a099b53fcdaac 100644<br>
---- a/Source/CTest/cmCTestMultiProcessHandler.cxx<br>
-+++ b/Source/CTest/cmCTestMultiProcessHandler.cxx<br>
-@@ -20,6 +20,7 @@<br>
- <br>
- #include &lt;cm/memory&gt;<br>
- #include &lt;cm/optional&gt;<br>
-+#include &lt;cm/string_view&gt;<br>
- #include &lt;cmext/algorithm&gt;<br>
- <br>
- #include &lt;cm3p/json/value.h&gt;<br>
-@@ -52,6 +53,48 @@ constexpr unsigned long kParallelLevelMinimum =3D 2u;<b=
r>
- // Under a job server, parallelism is effectively limited<br>
- // only by available job server tokens.<br>
- constexpr unsigned long kParallelLevelUnbounded =3D 0x10000u;<br>
-+<br>
-+struct CostEntry<br>
-+{<br>
-+=C2=A0 cm::string_view name;<br>
-+=C2=A0 int prevRuns;<br>
-+=C2=A0 float cost;<br>
-+};<br>
-+<br>
-+cm::optional&lt;CostEntry&gt; splitCostLine(cm::string_view line)<br>
-+{<br>
-+=C2=A0 std::string part;<br>
-+=C2=A0 cm::string_view::size_type pos1 =3D line.size();<br>
-+=C2=A0 cm::string_view::size_type pos2 =3D line.find_last_of(&#39; &#39;,=
 pos1);<br>
-+=C2=A0 auto findNext =3D [line, &amp;part, &amp;pos1, &amp;pos2]() -&gt; =
bool {<br>
-+=C2=A0 =C2=A0 if (pos2 !=3D cm::string_view::npos) {<br>
-+=C2=A0 =C2=A0 =C2=A0 cm::string_view sub =3D line.substr(pos2 + 1, pos1 -=
 pos2 - 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 part.assign(sub.begin(), sub.end());<br>
-+=C2=A0 =C2=A0 =C2=A0 pos1 =3D pos2;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (pos1 &gt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pos2 =3D line.find_last_of(&#39; &#39;, pos1 =
- 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 return true;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 return false;<br>
-+=C2=A0 };<br>
-+<br>
-+=C2=A0 // parse the cost<br>
-+=C2=A0 if (!findNext()) {<br>
-+=C2=A0 =C2=A0 return cm::nullopt;<br>
-+=C2=A0 }<br>
-+=C2=A0 float cost =3D static_cast&lt;float&gt;(atof(part.c_str()));<br>
-+<br>
-+=C2=A0 // parse the previous runs<br>
-+=C2=A0 if (!findNext()) {<br>
-+=C2=A0 =C2=A0 return cm::nullopt;<br>
-+=C2=A0 }<br>
-+=C2=A0 int prev =3D atoi(part.c_str());<br>
-+<br>
-+=C2=A0 // from start to the last found space is the name<br>
-+=C2=A0 return CostEntry{ line.substr(0, pos1), prev, cost };<br>
-+}<br>
-+<br>
- }<br>
- <br>
- namespace cmsys {<br>
-@@ -797,24 +840,21 @@ void cmCTestMultiProcessHandler::UpdateCostData()<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (line =3D=3D &quot;---&quot;) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 std::vector&lt;std::string&gt; parts =3D cmSystemToo=
ls::SplitString(line, &#39; &#39;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Format: &lt;name&gt; &lt;previous_runs&gt; &=
lt;avg_cost&gt;<br>
--=C2=A0 =C2=A0 =C2=A0 if (parts.size() &lt; 3) {<br>
-+=C2=A0 =C2=A0 =C2=A0 cm::optional&lt;CostEntry&gt; entry =3D splitCostLin=
e(line);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!entry) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 std::string name =3D parts[0];<br>
--=C2=A0 =C2=A0 =C2=A0 int prev =3D atoi(parts[1].c_str());<br>
--=C2=A0 =C2=A0 =C2=A0 float cost =3D static_cast&lt;float&gt;(atof(parts[2=
].c_str()));<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 int index =3D this-&gt;SearchByName(name);<br>
-+=C2=A0 =C2=A0 =C2=A0 int index =3D this-&gt;SearchByName(entry-&gt;name);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (index =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// This test is not in memory. We just r=
ewrite the entry<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 fout &lt;&lt; name &lt;&lt; &quot; &quot; &lt=
;&lt; prev &lt;&lt; &quot; &quot; &lt;&lt; cost &lt;&lt; &quot;\n&quot;;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fout &lt;&lt; entry-&gt;name &lt;&lt; &quot; =
&quot; &lt;&lt; entry-&gt;prevRuns &lt;&lt; &quot; &quot; &lt;&lt; entry-&g=
t;cost<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&lt; &quot;\n&quot;;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Update with our new average cost<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 fout &lt;&lt; name &lt;&lt; &quot; &quot; &lt=
;&lt; this-&gt;Properties[index]-&gt;PreviousRuns &lt;&lt; &quot; &quot;<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&lt; this-&gt;Propert=
ies[index]-&gt;Cost &lt;&lt; &quot;\n&quot;;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fout &lt;&lt; entry-&gt;name &lt;&lt; &quot; =
&quot; &lt;&lt; this-&gt;Properties[index]-&gt;PreviousRuns<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&lt; &quot; &quot; &l=
t;&lt; this-&gt;Properties[index]-&gt;Cost &lt;&lt; &quot;\n&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0temp.erase(index);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-@@ -850,28 +890,25 @@ void cmCTestMultiProcessHandler::ReadCostData()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 std::vector&lt;std::string&gt; parts =3D cmSystemToo=
ls::SplitString(line, &#39; &#39;);<br>
-+=C2=A0 =C2=A0 =C2=A0 // Format: &lt;name&gt; &lt;previous_runs&gt; &lt;av=
g_cost&gt;<br>
-+=C2=A0 =C2=A0 =C2=A0 cm::optional&lt;CostEntry&gt; entry =3D splitCostLin=
e(line);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Probably an older version of the file, will =
be fixed next run<br>
--=C2=A0 =C2=A0 =C2=A0 if (parts.size() &lt; 3) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!entry) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fin.close();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 std::string name =3D parts[0];<br>
--=C2=A0 =C2=A0 =C2=A0 int prev =3D atoi(parts[1].c_str());<br>
--=C2=A0 =C2=A0 =C2=A0 float cost =3D static_cast&lt;float&gt;(atof(parts[2=
].c_str()));<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 int index =3D this-&gt;SearchByName(name);<br>
-+=C2=A0 =C2=A0 =C2=A0 int index =3D this-&gt;SearchByName(entry-&gt;name);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (index =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 this-&gt;Properties[index]-&gt;PreviousRuns =3D prev=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 this-&gt;Properties[index]-&gt;PreviousRuns =3D entr=
y-&gt;prevRuns;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// When not running in parallel mode, don&#39;t=
 use cost data<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (this-&gt;GetParallelLevel() &gt; 1 &amp;&am=
p; this-&gt;Properties[index] &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;Properties[index]-&gt;Co=
st =3D=3D 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;Properties[index]-&gt;Cost =3D cost;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;Properties[index]-&gt;Cost =3D entry=
-&gt;cost;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0// Next part of the file is the failed tests<br>
-@@ -884,7 +921,7 @@ void cmCTestMultiProcessHandler::ReadCostData()<br>
-=C2=A0 =C2=A0}<br>
- }<br>
- <br>
--int cmCTestMultiProcessHandler::SearchByName(std::string const&amp; name)=
<br>
-+int cmCTestMultiProcessHandler::SearchByName(cm::string_view name)<br>
- {<br>
-=C2=A0 =C2=A0int index =3D -1;<br>
- <br>
-diff --git a/Source/CTest/cmCTestMultiProcessHandler.h b/Source/CTest/cmCT=
estMultiProcessHandler.h<br>
-index fd6c17f2fac06949c20f3792dd3eae442b15850b..811be613c3387240c0181f8372=
b24cf09219621f 100644<br>
---- a/Source/CTest/cmCTestMultiProcessHandler.h<br>
-+++ b/Source/CTest/cmCTestMultiProcessHandler.h<br>
-@@ -13,6 +13,7 @@<br>
- #include &lt;vector&gt;<br>
- <br>
- #include &lt;cm/optional&gt;<br>
-+#include &lt;cm/string_view&gt;<br>
- <br>
- #include &quot;cmCTest.h&quot;<br>
- #include &quot;cmCTestResourceAllocator.h&quot;<br>
-@@ -110,7 +111,7 @@ protected:<br>
-=C2=A0 =C2=A0void UpdateCostData();<br>
-=C2=A0 =C2=A0void ReadCostData();<br>
-=C2=A0 =C2=A0// Return index of a test based on its name<br>
--=C2=A0 int SearchByName(std::string const&amp; name);<br>
-+=C2=A0 int SearchByName(cm::string_view name);<br>
- <br>
-=C2=A0 =C2=A0void CreateTestCostList();<br>
- <br>
-diff --git a/Tests/CTestTestScheduler/CMakeLists.txt b/Tests/CTestTestSche=
duler/CMakeLists.txt<br>
-index 6f8cb4dbc0de35984540e1868788e0a02124e819..daf6ce2b23d8c048334ae10477=
59130b246dccef 100644<br>
---- a/Tests/CTestTestScheduler/CMakeLists.txt<br>
-+++ b/Tests/CTestTestScheduler/CMakeLists.txt<br>
-@@ -1,9 +1,9 @@<br>
--cmake_minimum_required(VERSION 3.10)<br>
-+cmake_minimum_required(VERSION 3.19)<br>
- project (CTestTestScheduler)<br>
- include (CTest)<br>
- <br>
- add_executable (Sleep sleep.c)<br>
- <br>
- foreach (time RANGE 1 4)<br>
--=C2=A0 add_test (TestSleep${time} Sleep ${time})<br>
-+=C2=A0 add_test (&quot;TestSleep ${time}&quot; Sleep ${time})<br>
- endforeach ()<br>
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-=
USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-d=
isable-USE_NGHTTP2.patch<br>
similarity index 83%<br>
rename from meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-U=
SE_NGHTTP2.patch<br>
rename to meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE=
_NGHTTP2.patch<br>
index ab78fa26ba..158eea2c3e 100644<br>
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGH=
TTP2.patch<br>
+++ b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGH=
TTP2.patch<br>
@@ -1,4 +1,4 @@<br>
-From 061253f390ada0661b30cf8856fa8d8d40a7355d Mon Sep 17 00:00:00 2001<br>
+From e0a1996a85dcb43d69d3c7daecab4da74599e5ba Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" =
target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
=C2=A0Date: Wed, 28 Dec 2022 17:51:27 +0800<br>
=C2=A0Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2<br>
@@ -22,10 +22,10 @@ Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tga=
mblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMake=
Lists.txt<br>
-index ef6c269e..ecaac497 100644<br>
+index 75b510205984894ffa11461e7aa04d3c479709b4..83463042d82d9c7f17932753f4=
7c47b12aeec85b 100644<br>
=C2=A0--- a/Utilities/cmcurl/CMakeLists.txt<br>
=C2=A0+++ b/Utilities/cmcurl/CMakeLists.txt<br>
-@@ -99,7 +99,7 @@ set(USE_ECH OFF)<br>
+@@ -105,7 +105,7 @@ set(USE_ECH OFF)<br>
=C2=A0 set(USE_HTTPSRR OFF)<br>
=C2=A0 set(USE_LIBIDN2 ON)<br>
=C2=A0 set(USE_LIBRTMP OFF)<br>
diff --git a/meta/recipes-devtools/cmake/<a href=3D"http://cmake_3.31.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">cmake_3.31.6.bb</a> b/meta/recipes-de=
vtools/cmake/<a href=3D"http://cmake_4.0.3.bb" rel=3D"noreferrer" target=3D=
"_blank">cmake_4.0.3.bb</a><br>
similarity index 96%<br>
rename from meta/recipes-devtools/cmake/<a href=3D"http://cmake_3.31.6.bb" =
rel=3D"noreferrer" target=3D"_blank">cmake_3.31.6.bb</a><br>
rename to meta/recipes-devtools/cmake/<a href=3D"http://cmake_4.0.3.bb" rel=
=3D"noreferrer" target=3D"_blank">cmake_4.0.3.bb</a><br>
index 2d343d6f52..7d8b8cac65 100644<br>
--- a/meta/recipes-devtools/cmake/<a href=3D"http://cmake_3.31.6.bb" rel=3D=
"noreferrer" target=3D"_blank">cmake_3.31.6.bb</a><br>
+++ b/meta/recipes-devtools/cmake/<a href=3D"http://cmake_4.0.3.bb" rel=3D"=
noreferrer" target=3D"_blank">cmake_4.0.3.bb</a><br>
@@ -5,7 +5,6 @@ inherit cmake bash-completion<br>
=C2=A0DEPENDS +=3D &quot;curl expat zlib libarchive xz ncurses bzip2&quot;<=
br>
<br>
=C2=A0SRC_URI:append:class-nativesdk =3D &quot; \<br>
-=C2=A0 =C2=A0 file://0001-ctest-Allow-arbitrary-characters-in-test-names-o=
f-CT.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://OEToolchainConfig.cmake \<br>
=C2=A0 =C2=A0 =C2=A0file://SDKToolchainConfig.cmake.template \<br>
=C2=A0 =C2=A0 =C2=A0file://cmake-setup.py \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#219506): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/219506" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/219506</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113905486/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113905486/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000c53b160638c7cf32--

