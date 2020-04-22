Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.1910.1587514757522715810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 17:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MNVFYSLP;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: geissonator@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id z17so640216oto.4
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 17:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X+pgCF6Eu+cGgQOVaREa4KLyaDv7JwktIA0BQPTW7vY=;
        b=MNVFYSLPjfCjpOb1HTPEt50bqN0s75FOn3kzavw+hBoW3+/La1okqkdXMWHPjs5RQ4
         UsrDztM/XZQBYdUBDooHXCWxNGeTL3rLjXPMSCYcAj1O1hzbo81VoI46FRYRvryFiXXg
         DcKVC2hvH1eAQ5E0n6UD4zmS3Boa6EtZZLIx/Pnt3D45758l/6zkLnnsbA3cWl80Qz+B
         qGoITmd/RUjEUOzt/4VhWEiq1cZdCpbazTZ01b4buoRvv4WKn5loxcIfvFhOL0mk9hQB
         UlnnxVayXJzw3r6jR0xGF5DlZE3TpaHedvXGYxpKaEnBZpZXk0BmSeEf3ReR5eVG8rPR
         pUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X+pgCF6Eu+cGgQOVaREa4KLyaDv7JwktIA0BQPTW7vY=;
        b=sgWQIgPlAdmcjstKLzX/ST2KC5lGzHoy39+S3NMERURQsuq11tiZgRC1Q0fcuQTkK+
         KGkbPTTracsqcq69mQkAlwOJJ6DM6VJii9Xv+dF24fiuP+B8skPSE5Tvv+TcNEG/8lxH
         q6+lWHfwhp7OSWAuz4ONfRsF37J2/d8do33dYPkZZhYIs/w52IUgVA3JeQ07dVlcB5CT
         MADHv293IyMr8TpmhtgTGFCZzIsd/jQdofcz3/KIPCAk6p9WpQWi7qtRVfGUxBP5+R0p
         KiBBZDIJyyf7AMRIeY2v+1X+KxW8meVPewYs4d7TjZosRyqVp9X3f3dHhxdWuJ2KoFj6
         4MsQ==
X-Gm-Message-State: AGi0PuaBOTYxT1EqXurHOljJ2nbXysrnf/rSXJzAwN3gULzosZs1zQBE
	Nxw315Vw6lbeZgUHEkivxtQkFKmDvX8=
X-Google-Smtp-Source: APiQypIQVXkJQnk7q2yo4zOp3gpWM82rNWVDruXlY1UTlEKc58FFBuaZRiqO82Z0EqHARRadUj2DYw==
X-Received: by 2002:a9d:7282:: with SMTP id t2mr15037802otj.302.1587514756607;
        Tue, 21 Apr 2020 17:19:16 -0700 (PDT)
Return-Path: <geissonator@gmail.com>
Received: from Andrews-MBP-2.attlocal.net (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
        by smtp.gmail.com with ESMTPSA id i20sm1147724ots.29.2020.04.21.17.19.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Apr 2020 17:19:16 -0700 (PDT)
From: "Andrew Geissler" <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@gmail.com>
Subject: [PATCH v3] boost: revert 1.72.0 regression
Date: Tue, 21 Apr 2020 19:19:11 -0500
Message-Id: <20200422001911.54795-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <FMfcgxwHMsVFPnVQgdLQQLSjJbLpgsnJ>
References: <FMfcgxwHMsVFPnVQgdLQQLSjJbLpgsnJ>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

https://www.boost.org/users/history/version_1_72_0.html documents a
"Known Issue" and has a revert patch for an issue that causes code to
fail to compile that includes the coroutine function. Without this
patch, code which includes the asymmetric_coroutine.hpp will fail to
compile.

Signed-off-by: Andrew Geissler <geissonator@gmail.com>

v2: added Signed-off-by to patch
    added Upstream-Status tag
v3: moved Upstream-status tag to the patch file
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
2.21.0 (Apple Git-122)

