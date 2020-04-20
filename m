Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.2134.1587412836947394189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 13:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L68YRFc9;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: geissonator@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id m13so9254368otf.6
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2020 13:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DsK4bPZqyboweS/KJs9b8UENqd6dL8bGkH8dLzySfZ4=;
        b=L68YRFc9gzXdLPkRdSuW7chLHGWEDW7Fa+JEwfDMFFIskgXxb0Wt7EdxvQuuBt5En9
         jPPQDQHS5inUoOUnxHcZZnoo9mSWSjdAL85w784N3rM45Aj7qhviA13+bYtGKtOoh1Xy
         sEgWs3l/YGevxpKKo6WJlKBpukK2AEu4Lsl5LveY3guPGAnIUbNkCZu/c9i00lqowk/B
         KbestcZwlD/2PVN8Jh33FManeu4C/lgcCtmbwtNaygp4oEYP7FCqNS7TM1OVBoUz6glN
         ylcJ5PkqHvXZePqx8THmUAtLbBpqJ7L0JODgPNBoNXmnHbuDVQcZrDx8Y2QklODeM3vD
         uWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DsK4bPZqyboweS/KJs9b8UENqd6dL8bGkH8dLzySfZ4=;
        b=CtyMSRNy8GSHuaLmW9SnM/XxZeJBovvwzsFmb1VJiIRuXb9lTWzEgChRxeX3qaXeo6
         Ef77VSpHa41CrwoQdNJivhZy8TDjsA7l71++Zhhnz3AOc2ByHy1YNSYpIVEK58FMLVUG
         Z+JOy4hiRf8LDgz3bW2ay/rArkx2RSjq7z1d05BHKjk3/2mIMSbMggHrYOU0EaBSviBl
         TZgZKpeNx5Pqk5tRYYf40UXKo0cbxjLqVIqTSsghHAAfF6VOkelM6ps9RNGcWguEadca
         UW8K8u99DakPj8RYurr2559VPmgX+1BTXSPj7fdhfBi+KWzAOZoc3OqRqAhFmup2p6df
         yWgQ==
X-Gm-Message-State: AGi0PubInMw3rBojEbDYp4f3FUX6+/gRH/z6TFD/77dP+cHx2h6NZi8g
	l0JEmvsCJEYDr31xzSsgqbPT5AmxRtc=
X-Google-Smtp-Source: APiQypKHrqI3dre69aTJe778kjjXZ9PkHy+tY7dX5vnkSweVcJCyqY1cKWNhO4+ypYyRJ1f4BvHG/g==
X-Received: by 2002:a9d:4716:: with SMTP id a22mr10604349otf.46.1587412834424;
        Mon, 20 Apr 2020 13:00:34 -0700 (PDT)
Return-Path: <geissonator@gmail.com>
Received: from Andrews-MBP-2.attlocal.net (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
        by smtp.gmail.com with ESMTPSA id t17sm100797oof.43.2020.04.20.13.00.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Apr 2020 13:00:33 -0700 (PDT)
From: "Andrew Geissler" <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@gmail.com>
Subject: [PATCH 2/2] boost: revert 1.72.0 regression
Date: Mon, 20 Apr 2020 15:00:16 -0500
Message-Id: <20200420200016.49947-2-geissonator@gmail.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20200420200016.49947-1-geissonator@gmail.com>
References: <20200420200016.49947-1-geissonator@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

https://www.boost.org/users/history/version_1_72_0.html documents a
"Known Issue" and has a revert patch for an issue that causes code to
fail to compile that includes the coroutine function. Without this
patch, code which includes the asymmetric_coroutine.hpp will fail to
compile.

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
---
 meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
 ...001-revert-cease-dependence-on-range.patch | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
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
index 0000000000..a6002074ab
--- /dev/null
+++ b/meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch
@@ -0,0 +1,49 @@
+From 436e1dbe6fcd31523d261d18ad011392f1d6fbbc Mon Sep 17 00:00:00 2001
+From: Oliver Kowalke <oliver.kowalke@gmail.com>
+Date: Sun, 1 Dec 2019 20:40:28 +0100
+Subject: [PATCH] Revert "Cease dependence on Range"
+
+This reverts commit 0c556bb59241e682bbcd3f572815149c5a9b17db.
+
+see #44 (One test fails to compile after boostorg/coroutine submodule updated)
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
2.21.0 (Apple Git-122)

