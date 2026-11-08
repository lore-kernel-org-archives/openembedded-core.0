Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5916.1794175901778620002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 14:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Fnf3958L;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2026110822113979fcb8ccfa000207b0-md1fro@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026110822113979fcb8ccfa000207b0
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Nov 2026 23:11:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ZiAmmIFD1UDo/drhHxhBdnYssDdCZofJWA9SXQwcJLc=;
 b=Fnf3958LnJw4EdRjcYe3iZqdbVoT7ZaQb0VDs8SWfmU/n8dhfksbgNID8Fe3mtir/cNuFM
 bMi8Z/RmAvqkN3jLXhj0Y0vX3JM6hRZUQSi9p9FZrlexpqBEsqMY1oHEQvG0eV02h3i4xIZ3
 MAvM0Lnqz+zVYCCVqjI3LB7FQn3u7pKl9ZRQERMpgQTHCCPAHJSCyFkqjNgCrb1MkOcVtraW
 fDHTB2lMEBSu6AwK0SNFZ3LcV+L12FVr7DteaKM2SUa3m2Kt7wgs2fmC8kr7yDaVoFn6Dp9X
 cvEHE59hk6svYNzBvxLMAR+2hUzTCArrE/k2C6DPRENTWR17ZNPaPGcQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 2/3] aspell: upgrade 0.60.8.1 -> 0.60.8.2
Date: Sun,  8 Nov 2026 23:10:53 +0100
Message-ID: <20261108221054.4041414-2-peter.marko@siemens.com>
In-Reply-To: <20261108221054.4041414-1-peter.marko@siemens.com>
References: <20261108221054.4041414-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 22:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249780
Content-Type: text/plain; charset="utf-8"

From: Wang Mingyu <wangmy@fujitsu.com>

0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
removed since it's included in 0.60.8.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 1218499d028b5d5ee269cc4919a98fd1a9fa3f3f)
Changelog: https://github.com/GNUAspell/aspell/releases/tag/rel-0.60.8.2
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...default-vector_hash-t.hpp-fix-gcc-15.patch | 42 -------------------
 ...{aspell_0.60.8.1.bb => aspell_0.60.8.2.bb} |  5 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
 rename meta/recipes-support/aspell/{aspell_0.60.8.1.bb => aspell_0.60.8.2.bb} (84%)

diff --git a/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch b/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
deleted file mode 100644
index 4045e8e4127..00000000000
--- a/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d45bf96b0a3556acb2c83069a78eaaac973d31b4 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Sun, 21 Jul 2024 22:01:50 +0100
-Subject: [PATCH] modules/speller/default/vector_hash-t.hpp: fix gcc-15 build
-
-Uncoming `gcc-15` added extra checks for template instantiation that is
-guaranteed to fail in
-  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=313afcfdabeab3e6705ac0bd1273627075be0023
-
-As a result `aspell` build now fails as:
-
-    In file included from modules/speller/default/readonly_ws.cpp:51:
-    modules/speller/default/vector_hash-t.hpp: In member function 'void aspeller::VectorHashTable<Parms>::recalc_size()':
-    modules/speller/default/vector_hash-t.hpp:186:43: error: 'class aspeller::VectorHashTable<Parms>' has no member named 'e'
-      186 |     for (iterator i = begin(); i != this->e; ++i, ++this->_size);
-          |                                           ^
-    modules/speller/default/vector_hash-t.hpp:186:59: error: 'class aspeller::VectorHashTable<Parms>' has no member named '_size'; did you mean 'size'?
-      186 |     for (iterator i = begin(); i != this->e; ++i, ++this->_size);
-          |                                                           ^~~~~
-          |                                                           size
-
-It looks like `_size` is `size_` mis-spelling and `e` was not introduced
-here.
-Upstream-Status: Backport [https://github.com/GNUAspell/aspell/commit/ee6cbb12ff36a1e6618d7388a78dd4e0a2b44041]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/speller/default/vector_hash-t.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/speller/default/vector_hash-t.hpp b/modules/speller/default/vector_hash-t.hpp
-index 969a80c..e4420b4 100644
---- a/modules/speller/default/vector_hash-t.hpp
-+++ b/modules/speller/default/vector_hash-t.hpp
-@@ -183,7 +183,7 @@ namespace aspeller {
-   template<class Parms>
-   void VectorHashTable<Parms>::recalc_size() {
-     size_ = 0;
--    for (iterator i = begin(); i != this->e; ++i, ++this->_size);
-+    for (iterator i = begin(), e = end(); i != e; ++i, ++size_);
-   }
- 
- }
diff --git a/meta/recipes-support/aspell/aspell_0.60.8.1.bb b/meta/recipes-support/aspell/aspell_0.60.8.2.bb
similarity index 84%
rename from meta/recipes-support/aspell/aspell_0.60.8.1.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.2.bb
index 43940b1e1bc..5b4fab7c354 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.2.bb
@@ -13,9 +13,8 @@ HOMEPAGE = "http://aspell.net/"
 LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
-           file://0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch"
-SRC_URI[sha256sum] = "d6da12b34d42d457fa604e435ad484a74b2effcd120ff40acd6bb3fb2887d21b"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI[sha256sum] = "57fe4863eae6048f72245a8575b44b718fb85ca14b9f8c0afc41b254dfd76919"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
