Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E106EC71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 08:18:15 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.2894.1750407493447715039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 01:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZNCj8YZX;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a44b3526e6so19742141cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750407492; x=1751012292; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K3nLSQYOnjRcJg8CvatSXD1TMk5XQOZv7/zMJbM61BE=;
        b=ZNCj8YZXuZU7HfQAKPyBHn3UJDzJFfJKhS+VzK/G/anaAgDQR72xC2rxwzRoajteVH
         0w0Hzir7eBUfBTasEEAqqcpo6KAo3Y459TcsNVFlFU9pXuP2LGz62OqgEhRFuq55Pe2u
         CJt2VhtUwDIY/6Nl5/cIJTnCUzqKapMEVAL0BO7BkVVgRrZoO21QWTmPSBK2tc3vW5a3
         V459RW1wvk4Og9REiHMzeZEmKv+XsSfmO+IlRrdtOrOj/b+inIlgws0cdMdlKwPIOBlz
         nfhMtLu+xCkZyAkC3OjRy77BxRX1bildQhPSaj4Hx5gg0nPjaO5TpyiocWvaLhEfi2Qz
         K9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750407492; x=1751012292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3nLSQYOnjRcJg8CvatSXD1TMk5XQOZv7/zMJbM61BE=;
        b=FkGCZzvcnlV9ZtIlm1qMQ8QWj+u301+bF9LrQEHqaodX3DH8GmUN6gYtitxxCx++DV
         3+Gq+K5r5p/3Vm0kjgGCVjzUwFFUIuL+1KFK/IqdrhQ83hnjqObLUI4W2Myi3fgUWcjF
         5vfq0PUYyHw3yEy6c5/XMzVklmlazW0QmTfFP4YPg8nsGv74AKYkjoA/mSqsaSKtEzaU
         w8CZSaR2x4x8PpSTEVUm1fnwTAeIwVvs7hMnXFE7NP4HcCBcyawvSKPg2vSBAeAaFvef
         Um4VB8hwCanT8wAoKiHxvfSEq4r6cPuaxgl2r+rsQhpCAi2/9+Sz5iFEQJ7H+xv4sfS5
         RYAA==
X-Gm-Message-State: AOJu0YxFseI5Lsr7wAeHwzb/QcEzOSsdjt5KysjyJs/2v/VJB1i/2Qd0
	GD/k27cMQSucPPzV7kFpNf3PyHfZKYcT2KE3moZIkVaKo01pRgp9755F/tlew1yiG3CytnUPqU8
	68t90BBQo6OndOcRUCtoxb4LNrQ004Pfzefjk
X-Gm-Gg: ASbGncs/xszFeRog7yZJNs7X1GveTYtOszXux2dme/xnVDldhyxAW119s81Q0zfczW/
	fFxRIqmt0PKZpLwnp8iYYVcxVqY/4CN2/uSZSqwfGBnnSKggq+iUsK1moMxopkBWYucIyKQ1Imf
	Dby1Ps0AzbzZ7ITdowAlp12kYE/V2vn46gSEgJW//L8s3pA9acaPA4s87OUQ5fU36Y0/SJq9auN
	vuswOAs5hGgQG05
X-Google-Smtp-Source: AGHT+IEUZZK4QJFWscIaBFQQbEBLa0Z5WvMM6LXAF5cfRjHee0J0apT5xTvgYJmirMHhuLz5dd2Y0fS5l7oOyKlb99E=
X-Received: by 2002:a05:6214:2e45:b0:6fa:9baa:face with SMTP id
 6a1803df08f44-6fd0a5b0f02mr37417196d6.35.1750407492266; Fri, 20 Jun 2025
 01:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250620075818.3320026-1-Moritz.Haase@bmw.de>
In-Reply-To: <20250620075818.3320026-1-Moritz.Haase@bmw.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Jun 2025 10:18:01 +0200
X-Gm-Features: Ac12FXzWsN28dyT0yWp5I6Z0UmXEBbAXFvju709U5NmDhwMklF_1y8Px_qPQXMs
Message-ID: <CANNYZj-0eFFWne=f24EN9Q7Hxv5yzKwp4yeniD7DDCv4du9Xzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake: Ensure find_package() uses deterministic
 search order by default
To: Moritz.Haase@bmw.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 08:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219113

Can you work on a cmake update to 4.x rather please? There's been
another similar 'cmake backport to fix my particular issue' patch
recently, and I'd rather see efforts to keep up to date with upstream.


Alex

On Fri, 20 Jun 2025 at 09:58, Moritz Haase via lists.openembedded.org
<Moritz.Haase=bmw.de@lists.openembedded.org> wrote:
>
> Historically, find_package() does not guarantee the order in which directories
> matching a search path containing a glob expression are processed in - the
> "first valid package" will be selected if there are multiple candidates. In such
> cases, which package is chosen is completely random and can change, potentially
> leading to build failures and reproducibility issues. This is rather unexpected
> and confusing for developers.
>
> Changing the default sort order and direction to natural sorting with a
> descending order will result in the newest version of a library being picked in
> case there are multiple ones available.
>
> This commit backports a corresponding fix from upstream, which was accepted for
> CMake 4.2 (see [0]). Documentation changes have been dropped, as have been
> changes to tests that do not exist on CMake 3.31.6.
>
> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> ---
>  meta/recipes-devtools/cmake/cmake.inc         |  1 +
>  ...-deterministic-search-order-by-defau.patch | 74 +++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 meta/recipes-devtools/cmake/cmake/0001-find_package-Use-deterministic-search-order-by-defau.patch
>
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> index 9b1898f22f..a18a95233d 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -19,6 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
>  SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
>             file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
>             file://0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch \
> +           file://0001-find_package-Use-deterministic-search-order-by-defau.patch \
>             "
>
>  SRC_URI[sha256sum] = "653427f0f5014750aafff22727fb2aa60c6c732ca91808cfb78ce22ddd9e55f0"
> diff --git a/meta/recipes-devtools/cmake/cmake/0001-find_package-Use-deterministic-search-order-by-defau.patch b/meta/recipes-devtools/cmake/cmake/0001-find_package-Use-deterministic-search-order-by-defau.patch
> new file mode 100644
> index 0000000000..164f5c6428
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake/0001-find_package-Use-deterministic-search-order-by-defau.patch
> @@ -0,0 +1,74 @@
> +From fa3c5c6d914abfe7c8d3335eeddedd53518946be Mon Sep 17 00:00:00 2001
> +From: Moritz Haase <Moritz.Haase@bmw.de>
> +Date: Fri, 13 Jun 2025 13:41:50 +0200
> +Subject: [PATCH] find_package: Use deterministic search order by default
> +
> +Historically, find_package() does not guarantee the order in which directories
> +matching a search path containing a glob expression are processed in - the
> +"first valid package" will be selected if there are multiple candidates. In such
> +cases, which package is chosen is completely random and can change, potentially
> +leading to build failures and reproducibility issues. This is rather unexpected
> +and confusing for developers.
> +
> +Now that CMake has bumped its major version, it's a good time to change default
> +sort order and direction to natural sorting with a descending order. That will
> +result in the newest version of a library being picked in case there are
> +multiple ones available.
> +
> +Upstream-Status: Backport [4.2.0 (planned), 61d8fae11655d3a2c4b8fd80af7a0d1d5f3e2f9f]
> +Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> +---
> + Source/cmFindPackageCommand.h        |  8 ++++----
> + Tests/FindPackageTest/CMakeLists.txt | 13 ++++++++++++-
> + 2 files changed, 16 insertions(+), 5 deletions(-)
> +
> +diff --git a/Source/cmFindPackageCommand.h b/Source/cmFindPackageCommand.h
> +index 653e15f51faf84406e8c962207303852d1c8ad3e..478a0c6ff96d08afb01d5f056bc86372bdeae149 100644
> +--- a/Source/cmFindPackageCommand.h
> ++++ b/Source/cmFindPackageCommand.h
> +@@ -220,10 +220,10 @@ private:
> +
> +   class FlushDebugBufferOnExit;
> +
> +-  /*! the selected sortOrder (None by default)*/
> +-  SortOrderType SortOrder = None;
> +-  /*! the selected sortDirection (Asc by default)*/
> +-  SortDirectionType SortDirection = Asc;
> ++  /*! the selected sortOrder (Natural by default)*/
> ++  SortOrderType SortOrder = Natural;
> ++  /*! the selected sortDirection (Dec by default)*/
> ++  SortDirectionType SortDirection = Dec;
> +
> +   struct ConfigFileInfo
> +   {
> +diff --git a/Tests/FindPackageTest/CMakeLists.txt b/Tests/FindPackageTest/CMakeLists.txt
> +index 73d3fb4832203b4d4d10c9a4956546a1ad8be7fd..0a2186df562d302eb44d2e4046c42c96ed524f09 100644
> +--- a/Tests/FindPackageTest/CMakeLists.txt
> ++++ b/Tests/FindPackageTest/CMakeLists.txt
> +@@ -116,7 +116,7 @@ foreach(p ${PACKAGES})
> + endforeach()
> +
> + # Enable framework and bundle searching.  Make sure bundles are found
> +-# before unix-syle packages.
> ++# before unix-style packages.
> + set(CMAKE_FIND_FRAMEWORK LAST)
> + set(CMAKE_FIND_APPBUNDLE FIRST)
> +
> +@@ -579,6 +579,17 @@ IF (NOT "${SortLib_VERSION}" STREQUAL "4.0.0")
> + endif()
> + unset(SortLib_VERSION)
> +
> ++
> ++set(SortLib_DIR "" CACHE FILEPATH "Wipe out find results for testing." FORCE)
> ++# Expected to default to 'NATURAL' and 'DEC'
> ++unset(CMAKE_FIND_PACKAGE_SORT_ORDER)
> ++unset(CMAKE_FIND_PACKAGE_SORT_DIRECTION)
> ++FIND_PACKAGE(SortLib CONFIG)
> ++IF (NOT "${SortLib_VERSION}" STREQUAL "3.10.1")
> ++  message(SEND_ERROR "FIND_PACKAGE_SORT_ORDER Default! ${SortLib_VERSION}")
> ++endif()
> ++unset(SortLib_VERSION)
> ++
> + unset(CMAKE_FIND_PACKAGE_SORT_ORDER)
> + unset(CMAKE_FIND_PACKAGE_SORT_DIRECTION)
> + set(CMAKE_PREFIX_PATH )
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219104): https://lists.openembedded.org/g/openembedded-core/message/219104
> Mute This Topic: https://lists.openembedded.org/mt/113739065/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

