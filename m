Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22F6D3C52D
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 11:41:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13519.1765366894270520013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 03:41:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SoCW+m36;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42e2e445dbbso3061970f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 03:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765366893; x=1765971693; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IFwRiNdPSUAK//oruWNeANzDzi31oQlReFdOvbfOhAM=;
        b=SoCW+m36u5wV+l1rryQy0LjoENPRxMS+eECgMyFmm3UL9Hvw3gMI3kl9c4JqBjS8s6
         kDiP/IribUSYD6covwMM13sv4HIVFV0squ8X63bnZiej9zxBIy9yF6cZ1MD6lutkVdL6
         KwJ8uxhXUvCVyIbcDXNrZiaiAnr6+5zSvBqw93pWJ8ouLQWetW3pnlh/XviYuhqxINKP
         x6MhSiWIB5KS/b4S+RDgfIW/kribFHc5qWwxq+np9Ie29eTJ/jyLNgfTCq5ANCrYKlVR
         GGzUB7vDOXGjAAQIzuTZiMIRP5H4W23yLA4EvrnN/Q3byhIBWeSJsUgnfrFfaGmKDvPa
         3WsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765366893; x=1765971693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFwRiNdPSUAK//oruWNeANzDzi31oQlReFdOvbfOhAM=;
        b=teXh6H/4ULlg4zmZ0bBiNyWbqjLiwIHxJmXZ/Uxk2E/A6xclH7/lErJJPvvOCogWLx
         PslMbtX5TWTj19tQ9bVOil1SzavIKN5I3NAOxkcAyu4Udj0I0JbVCMxtsB7W/4IekFGN
         yu3PJeOHghYKD9bQXzssyScmfxKKMl6T9L4XZ2kR/9SOMg+oYHzZ0XVEow86XrpF82x7
         KCyvY+nKdSKpPJVebcwK6QshT8mEEkterf/LfvAX9Mc4w8JeUPjvRwlgy4yllFMycgI8
         0r9qW0RICaBLM3lbgjxyq51+msiKHapR8FacUTQTVwPseQLGO95QId+UDvfvggX0sYBK
         vBTg==
X-Forwarded-Encrypted: i=1; AJvYcCWJwwqVqlLw4mBtrNCiIqzx5QsltEjEOwGBbhy8Xbn4/QMLbn5+8dHxWt7mygPxVn6amjJDFzxMUQkBytysI3xo4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzG3RG1NnUygltZVq/3pXEKfXrfKQHdC6n493BrzHKwIEhdoKXp
	ExspevC9q83d4mWH5/aDP31ggAMr+IYN77BScT2QBsOl/r5S5EZzMjp6
X-Gm-Gg: AY/fxX4Wme217pJmT0VsKeA74NLKA2rfxcYIHG4Txs7ePzrQdg4qnaSmmaTyOYVqObr
	6FFS8RU4YS1GuUWvq5fkbhUF5W3CIFIlkV2sJH8jMuf+M9xpbyTT9qgzPMZyu2Ew2JrcP2CFM8D
	pgnjaTT4vxMKh94tzvn7Wxf/BiYbA4o38i0XSQCe//ivTZd515KTSRDJS4cupkmU5laRATHIwfr
	ECtKk87ClpD1Jt4CKZQqqzPbWYGw9RIkCUz5gprnD6Rv0CE8gVDjW6/c/k6DRRZFlOM6Pks4Kck
	pMK7N7hn/+IGLU4/tV4XChZEUEUQCWPLCCOGtUkQqObynau6/SMNYN7qnh4cH18Kin3shonZdxE
	fYVvqQXOoGQX7zZwYL1yIFbZ65MNRXQP516jBoebLrZc66Jwr5CLDebMt7poeOKBhMekgLGp75O
	igdPigxhQwtrl4fyb9Vbm4pco0gN5Clw==
X-Google-Smtp-Source: AGHT+IE41HC5iYdAtT8trgARTUALftr0VQQw8x/rPOnyuPUsNaiHCXPlIsKQVocBASldbWobGxH2Nw==
X-Received: by 2002:a05:6000:2f8a:b0:429:cacf:1078 with SMTP id ffacd0b85a97d-42fa39d881emr2012382f8f.28.1765366892313;
        Wed, 10 Dec 2025 03:41:32 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331092sm37712904f8f.30.2025.12.10.03.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 03:41:31 -0800 (PST)
Message-ID: <8ae421be-bc8d-4a46-b346-13af5345a671@gmail.com>
Date: Wed, 10 Dec 2025 12:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/5] libtoml: new recipe
To: adam.duskett@amarulasolutions.com,
 openembedded-core@lists.openembedded.org
References: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
 <20251210110340.3631065-2-adam.duskett@amarulasolutions.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251210110340.3631065-2-adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 11:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227472

On 12/10/25 12:03, Adam Duskett via lists.openembedded.org wrote:
> DNF5 requires libtoml. As such, copy libtoml from
> meta-openembedded to openembedded-core.

I realize that this recipe is a verbatim copy from meta-oe, but since it
is being touched, maybe it could be improved a bit. Added some comments
below.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  .../0001-Remove-whitespace-in-operator.patch  | 46 +++++++++++++++++++
>  .../libtoml11/files/run-ptest                 | 12 +++++
>  .../libtoml11/libtoml11_4.4.0.bb              | 40 ++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
>  create mode 100755 meta/recipes-devtools/libtoml11/files/run-ptest
>  create mode 100644 meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
>
> diff --git a/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
> new file mode 100644
> index 0000000000..c8c9922d55
> --- /dev/null
> +++ b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
> @@ -0,0 +1,46 @@
> +From dee78f822d8a5b985e565e5c1ef42a59557aa8fc Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 7 Mar 2025 11:35:46 -0800
> +Subject: [PATCH] Remove whitespace in operator""
> +
> +Clang 20+ errors about this whitespace.
> +
> +Fixes
> +include/toml11/impl/../fwd/literal_fwd.hpp:22:26: error: identifier '_toml' preceded by whitespace in a literal operator declaration is deprecated [-Werror,-Wdeprecated-literal-operator]
> +|    22 | ::toml::value operator"" _toml(const char* str, std::size_t len);
> +|       |               ~~~~~~~~~~~^~~~~
> +|       |               operator""_toml
> +
> +Upstream-Status: Submitted [https://github.com/ToruNiina/toml11/pull/285]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + include/toml11/fwd/literal_fwd.hpp   | 2 +-
> + include/toml11/impl/literal_impl.hpp | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/include/toml11/fwd/literal_fwd.hpp b/include/toml11/fwd/literal_fwd.hpp
> +index e46612c..82f62b7 100644
> +--- a/include/toml11/fwd/literal_fwd.hpp
> ++++ b/include/toml11/fwd/literal_fwd.hpp
> +@@ -19,7 +19,7 @@ inline namespace literals
> + inline namespace toml_literals
> + {
> + 
> +-::toml::value operator"" _toml(const char* str, std::size_t len);
> ++::toml::value operator""_toml(const char* str, std::size_t len);
> + 
> + #if defined(TOML11_HAS_CHAR8_T)
> + // value of u8"" literal has been changed from char to char8_t and char8_t is
> +diff --git a/include/toml11/impl/literal_impl.hpp b/include/toml11/impl/literal_impl.hpp
> +index e8298c2..067d4ed 100644
> +--- a/include/toml11/impl/literal_impl.hpp
> ++++ b/include/toml11/impl/literal_impl.hpp
> +@@ -115,7 +115,7 @@ inline namespace toml_literals
> + {
> + 
> + TOML11_INLINE ::toml::value
> +-operator"" _toml(const char* str, std::size_t len)
> ++operator""_toml(const char* str, std::size_t len)
> + {
> +     if(len == 0)
> +     {
> diff --git a/meta/recipes-devtools/libtoml11/files/run-ptest b/meta/recipes-devtools/libtoml11/files/run-ptest
> new file mode 100755
> index 0000000000..9bc480aa7f
> --- /dev/null
> +++ b/meta/recipes-devtools/libtoml11/files/run-ptest
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +cd tests
> +for atest in test_* ; do
> +    rm -rf tests.log
> +    ./${atest} > tests.log 2>&1
> +    if [ $? = 0 ] ; then
> +        echo "PASS: ${atest}"
> +    else
> +        echo "FAIL: ${atest}"
> +    fi
> +done
> diff --git a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> new file mode 100644
> index 0000000000..b68e787e03
> --- /dev/null
> +++ b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> @@ -0,0 +1,40 @@
> +SUMMARY = "TOML for Modern C++"
> +DESCRIPTION = "toml11 is a feature-rich TOML language library for \
> +               C++11/14/17/20."
> +
> +HOMEPAGE = "https://github.com/ToruNiina/toml11"
> +
> +SECTION = "libs"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=44d1fcf70c7aa6991533c38daf7befa3"
> +
> +PE = "1"
> +
> +SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
> +SRCREV_json = "8c391e04fe4195d8be862c97f38cfe10e2a3472e"
> +SRCREV_doctest = "ae7a13539fb71f270b87eb2e874fbac80bc8dda2"
> +
> +SRC_URI = "git://github.com/ToruNiina/toml11;branch=main;protocol=https \
> +           git://github.com/nlohmann/json;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/tests/extlib/json;name=json;branch=develop;protocol=https \
> +           git://github.com/doctest/doctest;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/tests/extlib/doctest;name=doctest;branch=master;protocol=https \

The main and _json SRCREVs point to a tag, so ;tag= could be added to
the corresponding SRC_URIs

> +           file://0001-Remove-whitespace-in-operator.patch \
> +           file://run-ptest \
> +"
> +SRCREV_FORMAT = "json_doctest"

Are json and doctest only part of tests, or are they required by the
main library also, and it's just interesting folder structure?
If the former, then I think the main repo should get a name tag also,
and that should go in the SRCREV_FORMAT instead of these.

> +
> +
> +inherit cmake ptest
> +
> +EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON \
> +                  -DTOML11_BUILD_TESTS=${@bb.utils.contains("DISTRO_FEATURES", "ptest", "ON", "OFF", d)} \

Checking the PTEST_ENABLED variable's value is more idiomatic (and
allows disabling ptests per recipe)

> +"
> +
> +ALLOW_EMPTY:${PN} = "1"
> +
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -r ${B}/tests/test_* ${D}${PTEST_PATH}/tests
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227467): https://lists.openembedded.org/g/openembedded-core/message/227467
> Mute This Topic: https://lists.openembedded.org/mt/116710027/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


