Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15078CAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 09:33:29 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.42181.1757583207863547664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 02:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i32ovBsZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62733e779bbso722880a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 02:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757583206; x=1758188006; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u/wsSIF1GtaOPkYahaxybnACTLeO6GDXnEcWfy+lnM4=;
        b=i32ovBsZmlh0vNs4QIR2KPG0m3gXcueIl59sUbJL3vNmalRIlcNxvqwdrDaPJfHAIq
         27huIpH1ibzOMCCtRD99akanJieNHb3d1rUOfzhc1UVhSmJQDj2dKBdnWicWzeV+WH9q
         vMhV6wFOkW3lcrfMqrhNHueFSjzO+tw0lFMcBEmZ2bjSPmD9W+2tOsTfsjGA/q7/9AUh
         110orHIjqiu7QXCnLLZR3/9BQhz1iooa8qHSUYvWavGSqtwQduX9gfI3x1MOVv6uQYwH
         oVJy7JB37GF7WPXGG5Nj9EtMku0AJF4g9A7GOTYlldQX+V7XY1Y7i8PXnuKWUAg/S0Z7
         G0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583206; x=1758188006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/wsSIF1GtaOPkYahaxybnACTLeO6GDXnEcWfy+lnM4=;
        b=s4oVWrIN0inVnMJMItofAt8Z+FHKswyjl4FBAPIpvlLKWD9Q8tn+cHhXJO8sxsJ+VH
         IFo5lvEXps3uGIk674DssSZ94nlBcDxoyWdgKmEkIlH3bUB9K72yXsJTFcNTVHQR2j5q
         fhy2+vcDM/HECqc64SBnf/RhnCyL7D0c8ODLvoqDc/3iuN0WNlImF8h1u8wONxJemOm7
         E6AUcvtkGt0K84y4CKjivcK8fOZrbuSNpZ2unts1oeO17iZmVUoVAOMNuSzbBhuAXtVN
         AmImq6cbHAvyAl8zuRy7ECq4EDbMKABXDQezOjb1QqAtjYjkfwe6/4vQN7iXt0IIs82X
         fcPA==
X-Forwarded-Encrypted: i=1; AJvYcCV9MVHz5CMbTkvZWog5nHUDYi9WGcYSwdUbUDAu6PjNi7IOuaN9Ty1FPScA+E9bic9QNM5NwTwKhuaR1wP80ksn4A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1m1UVDm4ZcjdeIrwZom7ruA1IK0PrClAB7kbliRREq8ZP56Br
	x1Bf0yf7ezs3S07L8ks7AcoBNY1dH0Dhwy0Hc2EmCcMckPV949DYLrkN
X-Gm-Gg: ASbGnctAuDRocZ3S8pmwpxRnDz+W+cCrXpTljN9w6XFLJZJM5jDQ+xwW86YlHd9tl0Q
	xI5gtxjB9jR3oWmpfMycvz9u0LXGEj6y2LDkkj5aCW+xQjg/z8rDkhDUQH+qQlEESB7IgaTeAg0
	RGqCSCdPmqo+ihbkKFwyCOwc4g79PYpshwzFiTRyXT8HtWPUPt/rhEaqlCNQ7o3C9W7XthMttbE
	BUH9WGF8/dvIaGLCqMedoZYLx8I3PYDkTJksmdwFzNmr60TAj67xDip3W2Dg495tD9jlAX6ktW6
	BmztNiyApmfwO/m2pX3YjiekduNKMgOpaeVR/w851Imj2Ud2z+d9wfIlDhfDkIOnnxKe0vKQ/GQ
	UYO8GYjjzEdmb6Cd6s8y860KsMvwtnfE=
X-Google-Smtp-Source: AGHT+IEHptqZcMuM+B03Uo7bfO26gK+wjwKbvNhr/QfAUDPu2+eagkD9kGwZ3WafMJrPcb4J6K7bHg==
X-Received: by 2002:a17:906:7316:b0:b04:75ce:7b61 with SMTP id a640c23a62f3a-b04b13f3f60mr2017894866b.2.1757583205522;
        Thu, 11 Sep 2025 02:33:25 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3333e81sm94610866b.94.2025.09.11.02.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:33:25 -0700 (PDT)
Message-ID: <1289689c-f0df-442d-8eda-adac3dd2ca15@gmail.com>
Date: Thu, 11 Sep 2025 11:33:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] apt: Fix build with llvm libc++
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20250911064629.773789-1-raj.khem@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250911064629.773789-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 09:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223267

Sorry, wasn't fast enough - thank you for taking care of this.

On 9/11/25 08:46, Khem Raj wrote:
> Clang finds more problems when compiling apt with libc++
> for c++ runtime.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...sic_string_view-unsigned-char-in-Hex.patch |  68 ++++++++
>  ...r-Var-before-std-queue-members-to-sa.patch | 163 ++++++++++++++++++
>  meta/recipes-devtools/apt/apt_3.0.3.bb        |   4 +
>  3 files changed, 235 insertions(+)
>  create mode 100644 meta/recipes-devtools/apt/apt/0001-apt-avoid-std-basic_string_view-unsigned-char-in-Hex.patch
>  create mode 100644 meta/recipes-devtools/apt/apt/0001-apt-define-Solver-Var-before-std-queue-members-to-sa.patch
>
> diff --git a/meta/recipes-devtools/apt/apt/0001-apt-avoid-std-basic_string_view-unsigned-char-in-Hex.patch b/meta/recipes-devtools/apt/apt/0001-apt-avoid-std-basic_string_view-unsigned-char-in-Hex.patch
> new file mode 100644
> index 00000000000..03307364ab7
> --- /dev/null
> +++ b/meta/recipes-devtools/apt/apt/0001-apt-avoid-std-basic_string_view-unsigned-char-in-Hex.patch
> @@ -0,0 +1,68 @@
> +From 9cc3b306093cf762e23d3a8611f2ad12cfe4b960 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 10 Sep 2025 16:02:37 -0700
> +Subject: [PATCH] apt: avoid std::basic_string_view<unsigned char> in HexDigest
> + for libc++
> +
> +LLVM libc++ 18+ removed the generic std::char_traits<T> template [1], so
> +instantiating std::basic_string_view<unsigned char> no longer compiles.
> +HexDigest previously took a basic_string_view<unsigned char> and relied
> +on this unsupported instantiation.
> +
> +Switch HexDigest to take a raw unsigned char* with explicit size,
> +and update its caller in PrivateHashes::HexDigest accordingly.
> +The conversion loop is unchanged, but the implementation is simplified
> +using a constexpr hex digit table.
> +
> +This fixes build failures with recent libc++ while preserving existing
> +behavior.
> +
> +[1] https://github.com/llvm/llvm-project/commit/e30a148b098d462d0267c479cd9e4783363c2761
> +
> +Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/511]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + apt-pkg/contrib/hashes.cc | 21 ++++++++-------------
> + 1 file changed, 8 insertions(+), 13 deletions(-)
> +
> +diff --git a/apt-pkg/contrib/hashes.cc b/apt-pkg/contrib/hashes.cc
> +index 9c0ce40..74b4d5f 100644
> +--- a/apt-pkg/contrib/hashes.cc
> ++++ b/apt-pkg/contrib/hashes.cc
> +@@ -296,20 +296,15 @@ bool HashStringList::operator!=(HashStringList const &other) const
> +    return !(*this == other);
> + }
> + 									/*}}}*/
> +-static APT_PURE std::string HexDigest(std::basic_string_view<unsigned char> const &Sum)
> ++static APT_PURE std::string HexDigest(unsigned char const* data, size_t size)
> + {
> +-   char Conv[16] =
> +-      {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b',
> +-       'c', 'd', 'e', 'f'};
> +-   std::string Result(Sum.size() * 2, 0);
> +-
> ++   static constexpr char Conv[] = "0123456789abcdef";
> ++   std::string Result(size * 2, 0);
> +    // Convert each char into two letters
> +-   size_t J = 0;
> +-   size_t I = 0;
> +-   for (; I != (Sum.size()) * 2; J++, I += 2)
> +-   {
> +-      Result[I] = Conv[Sum[J] >> 4];
> +-      Result[I + 1] = Conv[Sum[J] & 0xF];
> ++   for (size_t j = 0, i = 0; j < size; ++j, i += 2) {
> ++      unsigned char b = data[j];
> ++      Result[i]     = Conv[(b >> 4) & 0xF];
> ++      Result[i + 1] = Conv[b & 0xF];
> +    }
> +    return Result;
> + };
> +@@ -360,7 +355,7 @@ class PrivateHashes
> +       EVP_DigestFinal_ex(tmpContext, Sum, nullptr);
> +       EVP_MD_CTX_destroy(tmpContext);
> + 
> +-      return ::HexDigest(std::basic_string_view<unsigned char>(Sum, Size));
> ++      return ::HexDigest(Sum, static_cast<size_t>(Size));
> +    }
> + 
> +    bool Enable(HashAlgo const &algo)
> diff --git a/meta/recipes-devtools/apt/apt/0001-apt-define-Solver-Var-before-std-queue-members-to-sa.patch b/meta/recipes-devtools/apt/apt/0001-apt-define-Solver-Var-before-std-queue-members-to-sa.patch
> new file mode 100644
> index 00000000000..b33d4797ad2
> --- /dev/null
> +++ b/meta/recipes-devtools/apt/apt/0001-apt-define-Solver-Var-before-std-queue-members-to-sa.patch
> @@ -0,0 +1,163 @@
> +From 59e7c9e118921b76ed1f8c765ce57a3aff5a32d8 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 10 Sep 2025 23:29:50 -0700
> +Subject: [PATCH] apt: define Solver::Var before std::queue members to satisfy
> + libc++
> +
> +LLVM libc++ requires element types of std::deque/std::queue to be
> +complete at the point of declaration, as sizeof(T) is used internally.
> +In solver3.h, Solver::Var was only forward-declared when the
> +propQ and discoverQ queues were declared, leading to a build failure:
> +
> +error: invalid application of 'sizeof' to an incomplete type 'APT::Solver::Var'
> +
> +Move the full definition of Solver::Var into the Solver class body
> +above the queue members and drop the later out-of-class definition.
> +This ensures Var is complete when used in std::queue.
> +
> +Fixes build with libc++ 18+ while preserving existing semantics.
> +
> +Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/511]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + apt-pkg/solver3.h | 119 +++++++++++++++++++++++-----------------------
> + 1 file changed, 59 insertions(+), 60 deletions(-)
> +
> +diff --git a/apt-pkg/solver3.h b/apt-pkg/solver3.h
> +index 6810df4..0484909 100644
> +--- a/apt-pkg/solver3.h
> ++++ b/apt-pkg/solver3.h
> +@@ -80,7 +80,65 @@ class Solver
> + {
> +    enum class Decision : uint16_t;
> +    enum class Hint : uint16_t;
> +-   struct Var;
> ++/**
> ++ * \brief Tagged union holding either a package, version, or nothing; representing the reason for installing something.
> ++ *
> ++ * We want to keep track of the reason why things are being installed such that
> ++ * we can have sensible debugging abilities; and we want to generically refer to
> ++ * both packages and versions as variables, hence this class was added.
> ++ *
> ++ */
> ++   struct Var
> ++   {
> ++      uint32_t value;
> ++
> ++      explicit constexpr Var(uint32_t value = 0) : value{value} {}
> ++      explicit Var(pkgCache::PkgIterator const &Pkg) : value(uint32_t(Pkg.MapPointer()) << 1) {}
> ++      explicit Var(pkgCache::VerIterator const &Ver) : value(uint32_t(Ver.MapPointer()) << 1 | 1) {}
> ++
> ++      inline constexpr bool isVersion() const { return value & 1; }
> ++      inline constexpr uint32_t mapPtr() const { return value >> 1; }
> ++
> ++      // \brief Return the package, if any, otherwise 0.
> ++      map_pointer<pkgCache::Package> Pkg() const
> ++      {
> ++         return isVersion() ? 0 : map_pointer<pkgCache::Package>{mapPtr()};
> ++      }
> ++      // \brief Return the version, if any, otherwise 0.
> ++      map_pointer<pkgCache::Version> Ver() const
> ++      {
> ++         return isVersion() ? map_pointer<pkgCache::Version>{mapPtr()} : 0;
> ++      }
> ++      // \brief Return the package iterator if storing a package, or an empty one
> ++      pkgCache::PkgIterator Pkg(pkgCache &cache) const
> ++      {
> ++         return isVersion() ? pkgCache::PkgIterator() : pkgCache::PkgIterator(cache, cache.PkgP + Pkg());
> ++      }
> ++      // \brief Return the version iterator if storing a package, or an empty end.
> ++      pkgCache::VerIterator Ver(pkgCache &cache) const
> ++      {
> ++         return isVersion() ? pkgCache::VerIterator(cache, cache.VerP + Ver()) : pkgCache::VerIterator();
> ++      }
> ++      // \brief Return a package, cast from version if needed
> ++      pkgCache::PkgIterator CastPkg(pkgCache &cache) const
> ++      {
> ++         return isVersion() ? Ver(cache).ParentPkg() : Pkg(cache);
> ++      }
> ++      // \brief Check if there is no reason.
> ++      constexpr bool empty() const { return value == 0; }
> ++      constexpr bool operator!=(Var const other) const { return value != other.value; }
> ++      constexpr bool operator==(Var const other) const { return value == other.value; }
> ++
> ++      std::string toString(pkgCache &cache) const
> ++      {
> ++         if (auto P = Pkg(cache); not P.end())
> ++	    return P.FullName();
> ++         if (auto V = Ver(cache); not V.end())
> ++	    return V.ParentPkg().FullName() + "=" + V.VerStr();
> ++         return "(root)";
> ++      }
> ++   };
> ++
> +    struct CompareProviders3;
> +    struct State;
> +    struct Clause;
> +@@ -320,65 +378,6 @@ class Solver
> + 
> + }; // namespace APT
> + 
> +-/**
> +- * \brief Tagged union holding either a package, version, or nothing; representing the reason for installing something.
> +- *
> +- * We want to keep track of the reason why things are being installed such that
> +- * we can have sensible debugging abilities; and we want to generically refer to
> +- * both packages and versions as variables, hence this class was added.
> +- *
> +- */
> +-struct APT::Solver::Var
> +-{
> +-   uint32_t value;
> +-
> +-   explicit constexpr Var(uint32_t value = 0) : value{value} {}
> +-   explicit Var(pkgCache::PkgIterator const &Pkg) : value(uint32_t(Pkg.MapPointer()) << 1) {}
> +-   explicit Var(pkgCache::VerIterator const &Ver) : value(uint32_t(Ver.MapPointer()) << 1 | 1) {}
> +-
> +-   inline constexpr bool isVersion() const { return value & 1; }
> +-   inline constexpr uint32_t mapPtr() const { return value >> 1; }
> +-
> +-   // \brief Return the package, if any, otherwise 0.
> +-   map_pointer<pkgCache::Package> Pkg() const
> +-   {
> +-      return isVersion() ? 0 : map_pointer<pkgCache::Package>{mapPtr()};
> +-   }
> +-   // \brief Return the version, if any, otherwise 0.
> +-   map_pointer<pkgCache::Version> Ver() const
> +-   {
> +-      return isVersion() ? map_pointer<pkgCache::Version>{mapPtr()} : 0;
> +-   }
> +-   // \brief Return the package iterator if storing a package, or an empty one
> +-   pkgCache::PkgIterator Pkg(pkgCache &cache) const
> +-   {
> +-      return isVersion() ? pkgCache::PkgIterator() : pkgCache::PkgIterator(cache, cache.PkgP + Pkg());
> +-   }
> +-   // \brief Return the version iterator if storing a package, or an empty end.
> +-   pkgCache::VerIterator Ver(pkgCache &cache) const
> +-   {
> +-      return isVersion() ? pkgCache::VerIterator(cache, cache.VerP + Ver()) : pkgCache::VerIterator();
> +-   }
> +-   // \brief Return a package, cast from version if needed
> +-   pkgCache::PkgIterator CastPkg(pkgCache &cache) const
> +-   {
> +-      return isVersion() ? Ver(cache).ParentPkg() : Pkg(cache);
> +-   }
> +-   // \brief Check if there is no reason.
> +-   constexpr bool empty() const { return value == 0; }
> +-   constexpr bool operator!=(Var const other) const { return value != other.value; }
> +-   constexpr bool operator==(Var const other) const { return value == other.value; }
> +-
> +-   std::string toString(pkgCache &cache) const
> +-   {
> +-      if (auto P = Pkg(cache); not P.end())
> +-	 return P.FullName();
> +-      if (auto V = Ver(cache); not V.end())
> +-	 return V.ParentPkg().FullName() + "=" + V.VerStr();
> +-      return "(root)";
> +-   }
> +-};
> +-
> + /**
> +  * \brief A single clause
> +  *
> diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
> index 03a6869393b..666e059cccc 100644
> --- a/meta/recipes-devtools/apt/apt_3.0.3.bb
> +++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
> @@ -11,6 +11,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
>             file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
>             file://0001-cmake-Do-not-build-po-files.patch \
>             file://0001-fix-compilation-with-musl.patch \
> +           file://0001-apt-avoid-std-basic_string_view-unsigned-char-in-Hex.patch \
> +           file://0001-apt-define-Solver-Var-before-std-queue-members-to-sa.patch \
>             "
>  
>  SRC_URI:append:class-native = " \
> @@ -34,6 +36,8 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
>  # to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
>  UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
>  
> +CXXFLAGS += "-Wno-unknown-attributes -Wno-vla-cxx-extension -Wno-misleading-indentation -Wno-unused-private-field"
> +
>  inherit cmake perlnative bash-completion useradd
>  
>  # User is added to allow apt to drop privs, will runtime warn without


