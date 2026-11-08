Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5715.1794175892223294538
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 14:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=jdIJ0qbB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261108221130300a296590000207e4-xwv5ef@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261108221130300a296590000207e4
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Nov 2026 23:11:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rPnQV1PdxKnaZgdDEuBbcHhpUbxid0p80wmy+4e52Fk=;
 b=jdIJ0qbBFOLiRnKE0vBUDp9mkvnWDH0KlY9UicCMyc82XL2PgZDnlrrbDU21QAE1SA8FI+
 VvqWUErZ2hFT3qDhN4w3fANnycGUFLFPhk+eVgeVQhgNM6Sn1uVis7NEVXXzuLZ8bQv0Doy6
 im2z+kg0TJEhZEm6iBg9NHzeeH1pCscX1sSPxjqxB8v0k/0AbuYszxtZdagaLkFt3KSatE58
 2ShXMQGbPkV2mhqDo5xVNECzpUJAWtOGjSeMGAEVV/UYyxBOKH5naWM0f51L89oT0NrV9z+L
 RD9GgIL2Lcjv1KZO2WMEhuwHaEBESV5avK7o8VQ97T73sGP6LxcEm7BQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 1/3] aspell: Backport a fix to build with gcc-15/clang-19
Date: Sun,  8 Nov 2026 23:10:52 +0100
Message-ID: <20261108221054.4041414-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 22:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249779
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: d6cb53c0773d28f57b5699125ef825936d4725d1)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...default-vector_hash-t.hpp-fix-gcc-15.patch | 42 +++++++++++++++++++
 .../recipes-support/aspell/aspell_0.60.8.1.bb |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch

diff --git a/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch b/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
new file mode 100644
index 00000000000..4045e8e4127
--- /dev/null
+++ b/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
@@ -0,0 +1,42 @@
+From d45bf96b0a3556acb2c83069a78eaaac973d31b4 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Sun, 21 Jul 2024 22:01:50 +0100
+Subject: [PATCH] modules/speller/default/vector_hash-t.hpp: fix gcc-15 build
+
+Uncoming `gcc-15` added extra checks for template instantiation that is
+guaranteed to fail in
+  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=313afcfdabeab3e6705ac0bd1273627075be0023
+
+As a result `aspell` build now fails as:
+
+    In file included from modules/speller/default/readonly_ws.cpp:51:
+    modules/speller/default/vector_hash-t.hpp: In member function 'void aspeller::VectorHashTable<Parms>::recalc_size()':
+    modules/speller/default/vector_hash-t.hpp:186:43: error: 'class aspeller::VectorHashTable<Parms>' has no member named 'e'
+      186 |     for (iterator i = begin(); i != this->e; ++i, ++this->_size);
+          |                                           ^
+    modules/speller/default/vector_hash-t.hpp:186:59: error: 'class aspeller::VectorHashTable<Parms>' has no member named '_size'; did you mean 'size'?
+      186 |     for (iterator i = begin(); i != this->e; ++i, ++this->_size);
+          |                                                           ^~~~~
+          |                                                           size
+
+It looks like `_size` is `size_` mis-spelling and `e` was not introduced
+here.
+Upstream-Status: Backport [https://github.com/GNUAspell/aspell/commit/ee6cbb12ff36a1e6618d7388a78dd4e0a2b44041]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/speller/default/vector_hash-t.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/speller/default/vector_hash-t.hpp b/modules/speller/default/vector_hash-t.hpp
+index 969a80c..e4420b4 100644
+--- a/modules/speller/default/vector_hash-t.hpp
++++ b/modules/speller/default/vector_hash-t.hpp
+@@ -183,7 +183,7 @@ namespace aspeller {
+   template<class Parms>
+   void VectorHashTable<Parms>::recalc_size() {
+     size_ = 0;
+-    for (iterator i = begin(); i != this->e; ++i, ++this->_size);
++    for (iterator i = begin(), e = end(); i != e; ++i, ++size_);
+   }
+ 
+ }
diff --git a/meta/recipes-support/aspell/aspell_0.60.8.1.bb b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
index 0ea9b063e01..43940b1e1bc 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
@@ -13,7 +13,8 @@ HOMEPAGE = "http://aspell.net/"
 LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
+           file://0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch"
 SRC_URI[sha256sum] = "d6da12b34d42d457fa604e435ad484a74b2effcd120ff40acd6bb3fb2887d21b"
 
 PACKAGECONFIG ??= ""
