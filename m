Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDB3CA0EE7
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 07:13:46 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.7622.1725002022451000668
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 00:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K8slRWxM;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-202318c4f45so14656385ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 00:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725002022; x=1725606822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgJcJZfA6mdGufY0pw9j4BxnBfxqUFEuuh2dM8dxi54=;
        b=K8slRWxMPgfiD5F86XvaQF/DQcOUYEh/fbYKmAoGFQaM9QVrzfbS69CW1pn5vGwUB2
         p/o2NaVllNk/hM2Yu3oJKhWgun5fNr7naYuEM0Dj4gbc8RKuZ/Jj5KdS3tAS9Vr/jCPR
         8iaLDb/bZJs5vqKh8d+dw+gAigGCwhFZfGDp46fCB02TY4UHWYivjujqC/Jxjs8CrP2Z
         JyPpParQKI8f8Xutn8ZIu8jSphCkfS3idiFH8hmBIoFW/Lf7fh70tjKzMN+bIANz6VCm
         oDV2SvDhFCI2MLEW9Der2PBlTAFfaXh0wORVlhVcJS4pE5OFxBcMNVsnaFYW91v+RYjX
         IiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725002022; x=1725606822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgJcJZfA6mdGufY0pw9j4BxnBfxqUFEuuh2dM8dxi54=;
        b=liGBaWIZNGEQprp2Bxid0rWc9nZdYaSUVmQIoJQ7F6AZ0E7f4QUx1hSI86pn6to5mr
         jJ7oEbHw9LX7oJStILyqp8Fc4jQN26rvrEtdKNsVoXZnS2cihm3fO2a3+vvrr/03i4gG
         YkEgjT9PjA9Lq+hscOl/P2t6du8xt/8PsnKSopCID/+qhNDdG5cM0/gydtjk2hH1nS55
         oLr1r+4fKIqp+pRMJPxmcnBDqfY8N8GUy7imb4yCjVwiBjjBQVT8aSNzCzFCGMuuC1Dz
         bptCKbt3kQpwwikXNIixMLEsE6qwcj+v6zbSPsVRC1ViBkHtXVSWL20fVoU6jNqQLqRr
         lyFA==
X-Gm-Message-State: AOJu0Yy9BPafraTfy0pAyKgNxuKoJqhqe3vcZLfixz8H9o+twkHlFSSi
	HyO0DV6QITw90I0gYOiKSZIeVR4cZd2f0TqMAkaqnK58EOcKl8TyLK/4UwuB
X-Google-Smtp-Source: AGHT+IHAgvVRDCxtn5qP/3wcNP/ln0VL3+QcL4jyVSC9DKBbTCVeU13oEyKtELXihzHuhb1OjDamnw==
X-Received: by 2002:a17:902:f605:b0:205:eec:5755 with SMTP id d9443c01a7336-2050eec5a0emr69541205ad.23.1725002021627;
        Fri, 30 Aug 2024 00:13:41 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205227baebfsm8082765ad.247.2024.08.30.00.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:13:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] aspell: Backport a fix to build with gcc-15/clang-19
Date: Fri, 30 Aug 2024 00:13:38 -0700
Message-ID: <20240830071338.3847609-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 07:13:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203953

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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

