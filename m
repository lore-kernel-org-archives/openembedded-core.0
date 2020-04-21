Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.1424.1587503396931798418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 14:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J7SqTZuB;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: geissonator@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id x10so44367oie.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 14:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8vgJk1cxRjXAXUK32Twgo2x0l2nQqp85IrhtmlNW+gA=;
        b=J7SqTZuBnLAlXrAKr/Htzrpj1qdvWRiNQZRHK2ZmJp1cng4ekY0ZUrhMveI+7bCnIh
         9Dtn+mPm9KBrFuPmPItpjiCSFDatBdxpSWfO00TLM0TTom4P/OPcyqGyeB7T0ALnaivz
         G73HFhYXH9AfHw6eNEouH5lnV8s8ed0VDFC1yP/rTwZnE4e/KhDEH+SDCkneuqcsMy06
         YZCZeKM9NyZIk/rdTW7H6Y5ginh54gDLziBOJKNtQzz3p4dBn+MkgHh8F3rG9nr2/8MO
         qIH6uNukxKxSH3aYceVtBjGE5Y/0CEs7SRsP0z43RXjMQUY66TPYnb7luakvSdAuBLax
         W/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8vgJk1cxRjXAXUK32Twgo2x0l2nQqp85IrhtmlNW+gA=;
        b=Duj7MQ2licqo8/3P3lIJtEfigP36FG73cI614I9emouBzmwp9nlA5W5YOAd+QcVCs2
         /N2eFgCH5JqUmTjRyXciqrvuTE1wFSEV5ImVapwuwXDos6voogYkK5ve7swpRdnODeBt
         P+fDXoRjiBa4z3HfuOybHXoKNovinosV7IX8OoiyNmYz31oJNGzY+uFZ4IBim8VatddD
         /H7JhrMV6S/hcVsMBi55xxcNLm1x6KwXyEVoZs2QWGyErFrFLpKZiZLUSZR2nkoxxsfx
         yi9G+Ol7WqCMQKZtd7+J8cAHX2tKonZyr3ffNxL42sKZeCymcTuWlEIz6b8D2GcJN+ZZ
         iDqA==
X-Gm-Message-State: AGi0PuZ1Y46wEC54179L0Z7nwaR3fxOjczYlj2JrdQ0f14cJURu2wEbg
	Mkgqj8OZ4iOJ9TvpwF4nm38GjdgPPJc=
X-Google-Smtp-Source: APiQypJCaYdTkcX0urKZZX9U9cBXDGHRFWXIJNdcliW6TQ6mFKVdvt7q46Nr9TkxGSTivTKEi3gKhg==
X-Received: by 2002:aca:170e:: with SMTP id j14mr4685437oii.130.1587503395910;
        Tue, 21 Apr 2020 14:09:55 -0700 (PDT)
Return-Path: <geissonator@gmail.com>
Received: from Andrews-MBP-2.attlocal.net (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
        by smtp.gmail.com with ESMTPSA id 1sm986313oir.5.2020.04.21.14.09.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Apr 2020 14:09:55 -0700 (PDT)
From: "Andrew Geissler" <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@gmail.com>
Subject: [PATCH v2] boost: revert 1.72.0 regression
Date: Tue, 21 Apr 2020 16:09:33 -0500
Message-Id: <20200421210933.36772-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <FMfcgxwHMsSvNCwGBddRdPhnrKlPMmhL>
References: <FMfcgxwHMsSvNCwGBddRdPhnrKlPMmhL>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

https://www.boost.org/users/history/version_1_72_0.html documents a
"Known Issue" and has a revert patch for an issue that causes code to
fail to compile that includes the coroutine function. Without this
patch, code which includes the asymmetric_coroutine.hpp will fail to
compile.

Upstream-Status: Backport [https://github.com/boostorg/coroutine/commit/9c73b2f7c1759a9508ba8780b38dc15f07f1a447]

Signed-off-by: Andrew Geissler <geissonator@gmail.com>

v2: added Signed-off-by to patch
    added Upstream-Status tag
---
 meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
 ...001-revert-cease-dependence-on-range.patch | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
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
index 0000000000..e11f0cf527
--- /dev/null
+++ b/meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch
@@ -0,0 +1,51 @@
+From 436e1dbe6fcd31523d261d18ad011392f1d6fbbc Mon Sep 17 00:00:00 2001
+From: Oliver Kowalke <oliver.kowalke@gmail.com>
+Date: Sun, 1 Dec 2019 20:40:28 +0100
+Subject: [PATCH] Revert "Cease dependence on Range"
+
+This reverts commit 0c556bb59241e682bbcd3f572815149c5a9b17db.
+
+see #44 (One test fails to compile after boostorg/coroutine submodule updated)
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
2.21.0 (Apple Git-122)

