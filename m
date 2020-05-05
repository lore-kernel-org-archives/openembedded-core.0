Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.1482.1588648834783183816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=s7cdy09z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.195, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f195.google.com with SMTP id u22so217837plq.12
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bN4L5vz35gFkPIUE9cSEbOnIYHd1u74ZQqkLUotnKN8=;
        b=s7cdy09zr2prdOaQrEkxPJxokL2RhNAa6khAV/9eYbYNH4NeGP+quCJABhFZTw18ZQ
         G1whe5sLHCVbdufM2xzRdnEOZjc/8W0+Ly6Vnbl4Z84OlzR1yaDvmTUTUPvByA3D5qM0
         NYbuofBG7H34nINK1h2bDe3yXbmRbmrSeTvjuQdFHpAvMZ81+FqIxeuEDQvNQNNQ6RJn
         /hYm33aEpmjI0RPEkK7ggxHqk3v/U3A/YXkk7jrOS6SQ2C/0Vads/l1z52PFHFc2xFeS
         917NQ47lCjjiBqxgVStc85RiCTarCelS5ZCmgQJZutARUxtAHV5t8uEXjV6CtkDKFFSs
         DC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bN4L5vz35gFkPIUE9cSEbOnIYHd1u74ZQqkLUotnKN8=;
        b=fkagMf1ZsKMC8goPIlW6nLjisoMZ6Ze+365e6+Wb8s3X5TwLScIvIMBASrFNcEAafV
         eC/s+sxXumUp6ZpN3gNPqMaje5YHcaCMjq7N0iaF3krbQUOw+rOdOWGk7cs8AMAiZVq3
         P34Wyod+vlpUhKqZT6fCXmc2JazoI71lyCLGETcLoRtbKXU78Z9l8sHpMZq91y+F3xnQ
         4Kx0eE3sA1SQRZ9qzeqK9d/K+JfecZeH56SZUSId+ruNPfdT/mhlNj5XKBuNx495l8uF
         r1y/22L987kkxXyLDQ5MwnwvSPpOEi1znkHn3PD+go/hZAn6tuA0bPrGrhRkH38VRLsf
         kJ5g==
X-Gm-Message-State: AGi0PuYHR6qqmVKp16Vifw2fPRWygbb8rY+WMPpi2JSKeICu0P7b7zFi
	E8H3dFs8X8/a/HkmXDibdt1WpaqwIgwvqA==
X-Google-Smtp-Source: APiQypL8R7tAjU4cSIAlrwdIUHrriTw/JpFlSB+5gP2qsjLdmwCfUu5T1DgbigJgnKZa3K6ptmN6+A==
X-Received: by 2002:a17:90a:a608:: with SMTP id c8mr401903pjq.90.1588648833707;
        Mon, 04 May 2020 20:20:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/28] boost: revert 1.72.0 regression
Date: Mon,  4 May 2020 17:19:07 -1000
Message-Id: <b9998aa98052cc1c05f59d070677f74bd64c5a10.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Andrew Geissler <geissonator@gmail.com>

https://www.boost.org/users/history/version_1_72_0.html documents a
"Known Issue" and has a revert patch for an issue that causes code to
fail to compile that includes the coroutine function. Without this
patch, code which includes the asymmetric_coroutine.hpp will fail to
compile.

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
 ...001-revert-cease-dependence-on-range.patch | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch

diff --git a/meta/recipes-support/boost/boost_1.72.0.bb b/meta/recipes-support/boost/boost_1.72.0.bb
index 5e9e0d87d7..0b7badbc76 100644
--- a/meta/recipes-support/boost/boost_1.72.0.bb
+++ b/meta/recipes-support/boost/boost_1.72.0.bb
@@ -7,4 +7,5 @@ SRC_URI += "file://arm-intrinsics.patch \
            file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
+           file://0001-revert-cease-dependence-on-range.patch \
            "
diff --git a/meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch b/meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch
new file mode 100644
index 0000000000..d6d09a23a5
--- /dev/null
+++ b/meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch
@@ -0,0 +1,53 @@
+From 436e1dbe6fcd31523d261d18ad011392f1d6fbbc Mon Sep 17 00:00:00 2001
+From: Oliver Kowalke <oliver.kowalke@gmail.com>
+Date: Sun, 1 Dec 2019 20:40:28 +0100
+Subject: [PATCH] Revert "Cease dependence on Range"
+
+This reverts commit 0c556bb59241e682bbcd3f572815149c5a9b17db.
+
+see #44 (One test fails to compile after boostorg/coroutine submodule updated)
+
+Upstream-Status: Backport [https://github.com/boostorg/coroutine/commit/9c73b2f7c1759a9508ba8780b38dc15f07f1a447]
+
+Signed-off-by: Andrew Geissler <geissonator@gmail.com>
+---
+ boost/coroutine/asymmetric_coroutine.hpp | 12 +++---------
+ 1 file changed, 3 insertions(+), 9 deletions(-)
+
+diff --git a/boost/coroutine/asymmetric_coroutine.hpp b/boost/coroutine/asymmetric_coroutine.hpp
+index ea96981..640896f 100644
+--- a/boost/coroutine/asymmetric_coroutine.hpp
++++ b/boost/coroutine/asymmetric_coroutine.hpp
+@@ -14,6 +14,7 @@
+ #include <boost/assert.hpp>
+ #include <boost/config.hpp>
+ #include <boost/move/move.hpp>
++#include <boost/range.hpp>
+ #include <boost/throw_exception.hpp>
+ #include <boost/utility/explicit_operator_bool.hpp>
+
+@@ -2354,19 +2355,12 @@ end( push_coroutine< R > & c)
+
+ }
+
+-// forward declaration of Boost.Range traits to break dependency on it
+-template<typename C, typename Enabler>
+-struct range_mutable_iterator;
+-
+-template<typename C, typename Enabler>
+-struct range_const_iterator;
+-
+ template< typename Arg >
+-struct range_mutable_iterator< coroutines::push_coroutine< Arg >, void >
++struct range_mutable_iterator< coroutines::push_coroutine< Arg > >
+ { typedef typename coroutines::push_coroutine< Arg >::iterator type; };
+
+ template< typename R >
+-struct range_mutable_iterator< coroutines::pull_coroutine< R >, void >
++struct range_mutable_iterator< coroutines::pull_coroutine< R > >
+ { typedef typename coroutines::pull_coroutine< R >::iterator type; };
+
+ }
+--
+2.24.1
+
-- 
2.17.1

