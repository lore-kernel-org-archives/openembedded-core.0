Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D1CCA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 06:46:37 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.39892.1757573193889493003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 23:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZkODhN2N;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-25669596921so3168585ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 23:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757573193; x=1758177993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+O3ElNI4FmEvFoI4iGFDUVwRHmFs7QZjQyv2/wTixOI=;
        b=ZkODhN2N/h7ZemsXM0i7TeqaZl3l5ssC0GSX5avtTcUduJ/s+CpIdHb0QWO37Advpv
         JOE4SmMQxgRKU/2+oKbjrs1XxJmJ8gMLrZZwUUu2xkHU00348GFiaWXIlZsWtENq7gjb
         ccri/ax0WZAUgxlNcoSbkT9F4WjLFczlDEpodjKKZJYB9e8LKlE4m9fGaMovg2pXwhTr
         v37+OflA/SLUaAAj6//9SGmTWh84Kj5Wi3751rF9pNy0DRnIshsJz95Tw7CZWlVlTIjU
         OxTIAmx3asC1WGK6/tl7kiysA2WW5hiDslKW6KRlXqeA1CAkpvzBYMpSzlH4L7vmgCij
         AbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757573193; x=1758177993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+O3ElNI4FmEvFoI4iGFDUVwRHmFs7QZjQyv2/wTixOI=;
        b=UX1gbWMWspsG0CbncUxgoaVtzU16oQ3V0gRpR8y7UQyzlgOb2t9ig+t+SOJ7rUtuLE
         7snjyoZtuJGHWkgj6EptRqCYAFWKXMXkjCb/2ukq/iMm/CG2y9+yvZgeEzh9pdWJma3E
         XhF4CwcI8xYMFtSwHI7Cwb0ZxKHXJQXAeX42vbK9cUwG3SicO7FZbhBBTp/1nxtHUwUx
         23k0f4P7B8jHY5twSbLs/o5iY+zw6T8cvTPHFFuDQBPTloEGWG8CeZxqfgWLg3L+fNSC
         ihxTQ/0sgYXZr5rrUWSj8FToqAbgOBNWsoZh2YcQckx9/xYeSSl2HLj1Tm/cEsOu1i42
         qYCg==
X-Gm-Message-State: AOJu0Yxkpjdbjm/CXARRpqNOY0JmsT7p2smBaAUk5myVAw0dFUhsCQAI
	mAbd5C69O4x8fPNd9b36CJSvnOrv/jk7bZCnRJfVCQRJVV1TrJpGN1KueXDN09F7
X-Gm-Gg: ASbGncvbAOlv+eSaBVeHz+MyjqGb3YzR/PNn/P6Rs4gDEYz3WSinRET4u0H/DgMwbO3
	YrQqgGCnlJmgAng37aUwrrmGZTR6YkVFGGa0rfqniK+pnS8OgkdYEzTUcSrrzgz4zP+m+R8etJS
	BGyWoKeIR220regVFzTbNoI0f4ttwsYrZFWQJsIrdlCiym6VJdjLDMRNEKAMvgo1RLH66OGjz9g
	925GqSvY4WjySXI6EH3pP4sLw1fB3rqr+D1uLEAUu/rCTeaQ+nemQFc9s8y/sPARW831VhWoAY4
	jjMhnjHf/6ttOHZvTOCyX9NvsAMltdbnvQyejWs8yRxjzmVCmTU30XbcnhZd/EyWgOswLfPwdDq
	QWyYb6s2FfTh1k/FJ2zcaj/4SKJUKNJtmwfk2Tm2VAMx6l3+WYFsmwWyxMOVSijpGYkWhjziYco
	BdtQiE0KLW10cZPdMTCTuL0Kek3QKcpl4Q1BSPmqBZ
X-Google-Smtp-Source: AGHT+IGjB8LCGg6Xw2edFUwX3rEMOAHWIlcU/0Gp+sEN4HRnqc/4FPhJrxDxzlJHv9Pa5g3u9sQu1Q==
X-Received: by 2002:a17:902:cf4c:b0:24c:7b94:2f53 with SMTP id d9443c01a7336-2516dbf192fmr262306295ad.6.1757573192532;
        Wed, 10 Sep 2025 23:46:32 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::db23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84a491sm8238115ad.68.2025.09.10.23.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 23:46:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [PATCH] apt: Fix build with llvm libc++
Date: Wed, 10 Sep 2025 23:46:29 -0700
Message-ID: <20250911064629.773789-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 06:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223247

Clang finds more problems when compiling apt with libc++
for c++ runtime.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...sic_string_view-unsigned-char-in-Hex.patch |  68 ++++++++
 ...r-Var-before-std-queue-members-to-sa.patch | 163 ++++++++++++++++++
 meta/recipes-devtools/apt/apt_3.0.3.bb        |   4 +
 3 files changed, 235 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-apt-avoid-std-basic_string_view-unsigned-char-in-Hex.patch
 create mode 100644 meta/recipes-devtools/apt/apt/0001-apt-define-Solver-Var-before-std-queue-members-to-sa.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-apt-avoid-std-basic_string_view-unsigned-char-in-Hex.patch b/meta/recipes-devtools/apt/apt/0001-apt-avoid-std-basic_string_view-unsigned-char-in-Hex.patch
new file mode 100644
index 00000000000..03307364ab7
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-apt-avoid-std-basic_string_view-unsigned-char-in-Hex.patch
@@ -0,0 +1,68 @@
+From 9cc3b306093cf762e23d3a8611f2ad12cfe4b960 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Sep 2025 16:02:37 -0700
+Subject: [PATCH] apt: avoid std::basic_string_view<unsigned char> in HexDigest
+ for libc++
+
+LLVM libc++ 18+ removed the generic std::char_traits<T> template [1], so
+instantiating std::basic_string_view<unsigned char> no longer compiles.
+HexDigest previously took a basic_string_view<unsigned char> and relied
+on this unsupported instantiation.
+
+Switch HexDigest to take a raw unsigned char* with explicit size,
+and update its caller in PrivateHashes::HexDigest accordingly.
+The conversion loop is unchanged, but the implementation is simplified
+using a constexpr hex digit table.
+
+This fixes build failures with recent libc++ while preserving existing
+behavior.
+
+[1] https://github.com/llvm/llvm-project/commit/e30a148b098d462d0267c479cd9e4783363c2761
+
+Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/511]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ apt-pkg/contrib/hashes.cc | 21 ++++++++-------------
+ 1 file changed, 8 insertions(+), 13 deletions(-)
+
+diff --git a/apt-pkg/contrib/hashes.cc b/apt-pkg/contrib/hashes.cc
+index 9c0ce40..74b4d5f 100644
+--- a/apt-pkg/contrib/hashes.cc
++++ b/apt-pkg/contrib/hashes.cc
+@@ -296,20 +296,15 @@ bool HashStringList::operator!=(HashStringList const &other) const
+    return !(*this == other);
+ }
+ 									/*}}}*/
+-static APT_PURE std::string HexDigest(std::basic_string_view<unsigned char> const &Sum)
++static APT_PURE std::string HexDigest(unsigned char const* data, size_t size)
+ {
+-   char Conv[16] =
+-      {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b',
+-       'c', 'd', 'e', 'f'};
+-   std::string Result(Sum.size() * 2, 0);
+-
++   static constexpr char Conv[] = "0123456789abcdef";
++   std::string Result(size * 2, 0);
+    // Convert each char into two letters
+-   size_t J = 0;
+-   size_t I = 0;
+-   for (; I != (Sum.size()) * 2; J++, I += 2)
+-   {
+-      Result[I] = Conv[Sum[J] >> 4];
+-      Result[I + 1] = Conv[Sum[J] & 0xF];
++   for (size_t j = 0, i = 0; j < size; ++j, i += 2) {
++      unsigned char b = data[j];
++      Result[i]     = Conv[(b >> 4) & 0xF];
++      Result[i + 1] = Conv[b & 0xF];
+    }
+    return Result;
+ };
+@@ -360,7 +355,7 @@ class PrivateHashes
+       EVP_DigestFinal_ex(tmpContext, Sum, nullptr);
+       EVP_MD_CTX_destroy(tmpContext);
+ 
+-      return ::HexDigest(std::basic_string_view<unsigned char>(Sum, Size));
++      return ::HexDigest(Sum, static_cast<size_t>(Size));
+    }
+ 
+    bool Enable(HashAlgo const &algo)
diff --git a/meta/recipes-devtools/apt/apt/0001-apt-define-Solver-Var-before-std-queue-members-to-sa.patch b/meta/recipes-devtools/apt/apt/0001-apt-define-Solver-Var-before-std-queue-members-to-sa.patch
new file mode 100644
index 00000000000..b33d4797ad2
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-apt-define-Solver-Var-before-std-queue-members-to-sa.patch
@@ -0,0 +1,163 @@
+From 59e7c9e118921b76ed1f8c765ce57a3aff5a32d8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Sep 2025 23:29:50 -0700
+Subject: [PATCH] apt: define Solver::Var before std::queue members to satisfy
+ libc++
+
+LLVM libc++ requires element types of std::deque/std::queue to be
+complete at the point of declaration, as sizeof(T) is used internally.
+In solver3.h, Solver::Var was only forward-declared when the
+propQ and discoverQ queues were declared, leading to a build failure:
+
+error: invalid application of 'sizeof' to an incomplete type 'APT::Solver::Var'
+
+Move the full definition of Solver::Var into the Solver class body
+above the queue members and drop the later out-of-class definition.
+This ensures Var is complete when used in std::queue.
+
+Fixes build with libc++ 18+ while preserving existing semantics.
+
+Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/511]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ apt-pkg/solver3.h | 119 +++++++++++++++++++++++-----------------------
+ 1 file changed, 59 insertions(+), 60 deletions(-)
+
+diff --git a/apt-pkg/solver3.h b/apt-pkg/solver3.h
+index 6810df4..0484909 100644
+--- a/apt-pkg/solver3.h
++++ b/apt-pkg/solver3.h
+@@ -80,7 +80,65 @@ class Solver
+ {
+    enum class Decision : uint16_t;
+    enum class Hint : uint16_t;
+-   struct Var;
++/**
++ * \brief Tagged union holding either a package, version, or nothing; representing the reason for installing something.
++ *
++ * We want to keep track of the reason why things are being installed such that
++ * we can have sensible debugging abilities; and we want to generically refer to
++ * both packages and versions as variables, hence this class was added.
++ *
++ */
++   struct Var
++   {
++      uint32_t value;
++
++      explicit constexpr Var(uint32_t value = 0) : value{value} {}
++      explicit Var(pkgCache::PkgIterator const &Pkg) : value(uint32_t(Pkg.MapPointer()) << 1) {}
++      explicit Var(pkgCache::VerIterator const &Ver) : value(uint32_t(Ver.MapPointer()) << 1 | 1) {}
++
++      inline constexpr bool isVersion() const { return value & 1; }
++      inline constexpr uint32_t mapPtr() const { return value >> 1; }
++
++      // \brief Return the package, if any, otherwise 0.
++      map_pointer<pkgCache::Package> Pkg() const
++      {
++         return isVersion() ? 0 : map_pointer<pkgCache::Package>{mapPtr()};
++      }
++      // \brief Return the version, if any, otherwise 0.
++      map_pointer<pkgCache::Version> Ver() const
++      {
++         return isVersion() ? map_pointer<pkgCache::Version>{mapPtr()} : 0;
++      }
++      // \brief Return the package iterator if storing a package, or an empty one
++      pkgCache::PkgIterator Pkg(pkgCache &cache) const
++      {
++         return isVersion() ? pkgCache::PkgIterator() : pkgCache::PkgIterator(cache, cache.PkgP + Pkg());
++      }
++      // \brief Return the version iterator if storing a package, or an empty end.
++      pkgCache::VerIterator Ver(pkgCache &cache) const
++      {
++         return isVersion() ? pkgCache::VerIterator(cache, cache.VerP + Ver()) : pkgCache::VerIterator();
++      }
++      // \brief Return a package, cast from version if needed
++      pkgCache::PkgIterator CastPkg(pkgCache &cache) const
++      {
++         return isVersion() ? Ver(cache).ParentPkg() : Pkg(cache);
++      }
++      // \brief Check if there is no reason.
++      constexpr bool empty() const { return value == 0; }
++      constexpr bool operator!=(Var const other) const { return value != other.value; }
++      constexpr bool operator==(Var const other) const { return value == other.value; }
++
++      std::string toString(pkgCache &cache) const
++      {
++         if (auto P = Pkg(cache); not P.end())
++	    return P.FullName();
++         if (auto V = Ver(cache); not V.end())
++	    return V.ParentPkg().FullName() + "=" + V.VerStr();
++         return "(root)";
++      }
++   };
++
+    struct CompareProviders3;
+    struct State;
+    struct Clause;
+@@ -320,65 +378,6 @@ class Solver
+ 
+ }; // namespace APT
+ 
+-/**
+- * \brief Tagged union holding either a package, version, or nothing; representing the reason for installing something.
+- *
+- * We want to keep track of the reason why things are being installed such that
+- * we can have sensible debugging abilities; and we want to generically refer to
+- * both packages and versions as variables, hence this class was added.
+- *
+- */
+-struct APT::Solver::Var
+-{
+-   uint32_t value;
+-
+-   explicit constexpr Var(uint32_t value = 0) : value{value} {}
+-   explicit Var(pkgCache::PkgIterator const &Pkg) : value(uint32_t(Pkg.MapPointer()) << 1) {}
+-   explicit Var(pkgCache::VerIterator const &Ver) : value(uint32_t(Ver.MapPointer()) << 1 | 1) {}
+-
+-   inline constexpr bool isVersion() const { return value & 1; }
+-   inline constexpr uint32_t mapPtr() const { return value >> 1; }
+-
+-   // \brief Return the package, if any, otherwise 0.
+-   map_pointer<pkgCache::Package> Pkg() const
+-   {
+-      return isVersion() ? 0 : map_pointer<pkgCache::Package>{mapPtr()};
+-   }
+-   // \brief Return the version, if any, otherwise 0.
+-   map_pointer<pkgCache::Version> Ver() const
+-   {
+-      return isVersion() ? map_pointer<pkgCache::Version>{mapPtr()} : 0;
+-   }
+-   // \brief Return the package iterator if storing a package, or an empty one
+-   pkgCache::PkgIterator Pkg(pkgCache &cache) const
+-   {
+-      return isVersion() ? pkgCache::PkgIterator() : pkgCache::PkgIterator(cache, cache.PkgP + Pkg());
+-   }
+-   // \brief Return the version iterator if storing a package, or an empty end.
+-   pkgCache::VerIterator Ver(pkgCache &cache) const
+-   {
+-      return isVersion() ? pkgCache::VerIterator(cache, cache.VerP + Ver()) : pkgCache::VerIterator();
+-   }
+-   // \brief Return a package, cast from version if needed
+-   pkgCache::PkgIterator CastPkg(pkgCache &cache) const
+-   {
+-      return isVersion() ? Ver(cache).ParentPkg() : Pkg(cache);
+-   }
+-   // \brief Check if there is no reason.
+-   constexpr bool empty() const { return value == 0; }
+-   constexpr bool operator!=(Var const other) const { return value != other.value; }
+-   constexpr bool operator==(Var const other) const { return value == other.value; }
+-
+-   std::string toString(pkgCache &cache) const
+-   {
+-      if (auto P = Pkg(cache); not P.end())
+-	 return P.FullName();
+-      if (auto V = Ver(cache); not V.end())
+-	 return V.ParentPkg().FullName() + "=" + V.VerStr();
+-      return "(root)";
+-   }
+-};
+-
+ /**
+  * \brief A single clause
+  *
diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index 03a6869393b..666e059cccc 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -11,6 +11,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
            file://0001-cmake-Do-not-build-po-files.patch \
            file://0001-fix-compilation-with-musl.patch \
+           file://0001-apt-avoid-std-basic_string_view-unsigned-char-in-Hex.patch \
+           file://0001-apt-define-Solver-Var-before-std-queue-members-to-sa.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -34,6 +36,8 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 # to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
 
+CXXFLAGS += "-Wno-unknown-attributes -Wno-vla-cxx-extension -Wno-misleading-indentation -Wno-unused-private-field"
+
 inherit cmake perlnative bash-completion useradd
 
 # User is added to allow apt to drop privs, will runtime warn without

