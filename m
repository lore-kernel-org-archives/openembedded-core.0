Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03596C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 09:02:45 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.82096.1749546157525070000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 02:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V3PRVnfl;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d3862646eeso149993285a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749546156; x=1750150956; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vTcpNe3jWKAOg87mmH3eqQoxbEfGNNhyC+bhq9vHhJM=;
        b=V3PRVnflwEVOKYNuKd90oqvLkfPvvoFkjvVI9Mit8zAuosIimp+MN7uI0QC1Nuw8Ia
         Ii9RYDImE5JZqLUdKWJ31PKPDx5z3PfwpMLxmc4q3ENV7Br/Bq0he054Gv3I+ixUkP6l
         DxYz29Jp1x3xdVWTqRTf6edEHLDOnuyPYcvL7tqLabj203aejGkIEkd2K/BEy/X72w5a
         PcHN/zsI6FNvJT1GFCU9SUwQcGQGzG1wxBMiTbpR47Tckjg9lP385d84MSb4sj7TmzGV
         NyjqMZVgYvsxcP7e97OKV2Fy9gUShyGeC/vZ8TYdquE0qi18qYKHXIzmNcvc0Kv9BbM8
         lyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546156; x=1750150956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vTcpNe3jWKAOg87mmH3eqQoxbEfGNNhyC+bhq9vHhJM=;
        b=vImhPljc4AwjYGbrYK9RBMlfhdSM2ktFO0nzmYlH14XqtoV7b3YOLGdwwtI5J5XGss
         G/LFNFMTLvjNRCEFbb/fFHsZLRpAfimweskd1xyYbzWyXJWKzhSp8i8OUlK7nuy076sW
         SMWiB83OudAfiK/acZ2KDcHPaszirh1HG46QC3fcOjZRy3kvwoYekJqhRcdWgp071vfQ
         FeFIpia7S1Ea/Ib/CO5d91oS0m35TVz73j0fOG05idkKl88bnUzqMoLDYNVmkKODCaUm
         yYKH4o/CK+7tGOusHy3hLD+E8dlz6HobAanrFh9Nud59jdC6l36OZ8+lcIA4gEPbQIEK
         UYwg==
X-Gm-Message-State: AOJu0YwK4ZO7596MnVYWlxfwQGZpWLgV5aT5Y98VgB9oLey44KUkzKx2
	j1Krb++wQ2Kz8Zfd5G8keQvQh5UfWFGJsysHZ9btGYyKRkCGvp7ewOKyzPlLRN4Dquy6y6QGZff
	hQh62RuB2KbAyNTNWt1GAauSXpiLTP7g=
X-Gm-Gg: ASbGncvPJ2tjclLRYmW870abjTo4vmLpbz0PQB6zB4bHF8E893U2rY0KG2PoKt9gXgB
	ocmYwczSjUK/Hh0QrX9zX6pDZtUOVRrt9aIAledYlD8apbyooLHfVwRXBrzmjtO7rAxqUDVyduq
	GD1s8+M4r18WKdCfcDx6MLGF3ERlEb0ebVsxo6IA2SyvDuOyfeZ+3eajJAxAc8re4DWuxQLskSZ
	eD3YQ==
X-Google-Smtp-Source: AGHT+IE5PtehgI4UjTnKIpGL/wS6kiuY2rM4M/H/Yk7iN0yPzUBShN65jlPKH7TbAxMGyMqSsBhDjJYI9DLN06KV3no=
X-Received: by 2002:a05:620a:191a:b0:7d0:984a:d1b4 with SMTP id
 af79cd13be357-7d22995cecbmr1848445385a.17.1749546156417; Tue, 10 Jun 2025
 02:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250609212448.1000608-1-pkj@axis.com>
In-Reply-To: <20250609212448.1000608-1-pkj@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Jun 2025 11:02:23 +0200
X-Gm-Features: AX0GCFs2MxGNfiEhVL5eVT2XxC0p9Flps7R-6Krm-8YB77BbOlpd9MdSEtlzy-k
Message-ID: <CANNYZj-KuAAG=64Ak+cRKVUSu78VEcTOgFM5KsMGnc_K--0ujw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake: Update to 3.31.7
To: peter.kjellerstedt@axis.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218324

Isn't 4.x the latest version? If there are reason to choose something
else for master, they should be placed into commit message.

Alex

On Mon, 9 Jun 2025 at 23:25, Peter Kjellerstedt via
lists.openembedded.org
<peter.kjellerstedt=axis.com@lists.openembedded.org> wrote:
>
> Changes since 3.31.6:
> * 5c7224b: Tests: Teach RunCMake to ignore GNU ld --warn-rwx-segments
>            warnings
> * e9c4940: cmake-gui: Fix regression that prints an incidental error on
>            fresh build trees
> * 1b0c92a: cmCurl: Avoid using undocumented type for CURLOPT_NETRC
>            values
> * 1b4a802: MSVC: Split C++23 flag selection into dedicated block
> * b3f1c60: MSVC: Use -std:c++23preview flag for C++23 when available
> * 90d9c79: file(MAKE_DIRECTORY): Do not make directories for command
>            keywords
> * a039a16: file(MAKE_DIRECTORY): Clarify formatting of unexpected
>            arguments error
> * d54916d: MSVC: Revert use of temporary -std:c++23preview flag for
>            C++23
> * bbbbab4: Help: Add 3.31 release note for CMAKE_CONFIG_DIR
> * 9b5915c: MARMASM: Fix loading linker information
> * 3f5f2b2: Linker: Honor
>            CMAKE_<LANG>_LINK_LIBRARY_USING_FEATURE_SUPPORTED when FALSE
> * a9b126b: Linker: Save linker inspection results with compiler
>            inspection results
> * 7b552b9: Linker: Save GNU push-/pop-state detection with compiler
>            inspection results
> * d5be7c7: Linker: Detect GNU push-state/pop-state flags more robustly
> * cbb8f30: CUDAToolkit: Restore ability to find cupti library
> * aa64d44: macOS: Define _DARWIN_C_SOURCE in more sources
> * 14ffd1c: cmXCodeObject: Drop unused CoreFoundation header
> * 42390e7: Source: Include specific CoreFoundation headers instead of
>            umbrella header
> * 7b16db9: CMake 3.31.7
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  ...ative_3.31.6.bb => cmake-native_3.31.7.bb} |  0
>  meta/recipes-devtools/cmake/cmake.inc         |  3 +-
>  ...ng-undocumented-type-for-CURLOPT_NET.patch | 30 -------------------
>  .../{cmake_3.31.6.bb => cmake_3.31.7.bb}      |  0
>  4 files changed, 1 insertion(+), 32 deletions(-)
>  rename meta/recipes-devtools/cmake/{cmake-native_3.31.6.bb => cmake-native_3.31.7.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch
>  rename meta/recipes-devtools/cmake/{cmake_3.31.6.bb => cmake_3.31.7.bb} (100%)
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
> rename to meta/recipes-devtools/cmake/cmake-native_3.31.7.bb
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> index 9b1898f22f..ee17482e3f 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -18,10 +18,9 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
>
>  SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
>             file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
> -           file://0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch \
>             "
>
> -SRC_URI[sha256sum] = "653427f0f5014750aafff22727fb2aa60c6c732ca91808cfb78ce22ddd9e55f0"
> +SRC_URI[sha256sum] = "a6d2eb1ebeb99130dfe63ef5a340c3fdb11431cce3d7ca148524c125924cea68"
>
>  UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch b/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch
> deleted file mode 100644
> index c719c1fdfb..0000000000
> --- a/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From c608975f4490f67872926f2601e5c37f2e570307 Mon Sep 17 00:00:00 2001
> -From: Wang Mingyu <wangmy@fujitsu.com>
> -Date: Wed, 9 Apr 2025 01:40:46 +0000
> -Subject: [PATCH] cmCurl: Avoid using undocumented type for CURLOPT_NETRC
> - values
> -
> -Fix: nativesdk-cmake/3.31.6/cmake-3.31.6/Source/cmCurl.cxx:178:26: error: invalid conversion from 'long int' to 'CURL_NETRC_OPTION' [-fpermissive]
> -Upstream-Status: Backport [https://gitlab.kitware.com/cmake/cmake/-/merge_requests/10449/diffs?commit_id=1b0c92a3a1b782ff3e1c4499b6ab8db614d45bcd]
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
> -@@ -170,7 +170,7 @@ std::string cmCurlSetNETRCOption(::CURL* curl, const std::string& netrc_level,
> -                                  const std::string& netrc_file)
> - {
> -   std::string e;
> --  CURL_NETRC_OPTION curl_netrc_level = CURL_NETRC_LAST;
> -+  long curl_netrc_level = CURL_NETRC_LAST;
> -   ::CURLcode res;
> -
> -   if (!netrc_level.empty()) {
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-devtools/cmake/cmake_3.31.6.bb b/meta/recipes-devtools/cmake/cmake_3.31.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake_3.31.6.bb
> rename to meta/recipes-devtools/cmake/cmake_3.31.7.bb
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218307): https://lists.openembedded.org/g/openembedded-core/message/218307
> Mute This Topic: https://lists.openembedded.org/mt/113558809/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

