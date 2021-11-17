Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A215C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:32 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.8729.1637163331150536763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mh++AlVL;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id d24so5576036wra.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gGBznOuAQS3KpomZN2bfb3/5oWYg/d7ksCc7zwPCNvE=;
        b=mh++AlVLKzUOD3DYcAOoyUYYMPkI+voLzBzzO047VOVQ6mbBcOz5nR2/cpLNCS32bu
         Y0l62Ois38takQLY9pnmOFMDuAQAmLThTPGzLVVKaeCunUabYW8OeQ31EGhdKCqJLcKb
         fDbXjMmfoCUpeHlI6AD5TyGEpu7ly53TbzDIVlxmSECCW8ALRSptYLPicKBWEoGmGAHL
         YMOpPZl8qB6rXVwplMvTEbQbKW3hWfQm8tAVS1FgCgW1fH06RdvOS3YyNOGR92j76BJ5
         wlLDmWa90Rln2+0vKoy4ufC3gnPXmUikKJBuj7bAmZqJzeJ9QU17vPhVd0MUE/bSp4lU
         2TNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gGBznOuAQS3KpomZN2bfb3/5oWYg/d7ksCc7zwPCNvE=;
        b=7BJ4mmL155L8aFnyILNRxtdQgG5mbQ5Z5IemF5HUkawhDq7NAQcOTgAjKznuecN81h
         C+5257YN7thEZfIBXfW+/PYO6JAhLbZ14BMkJk9pcNcZdL+ECtXIEqIOGilQ1iN/4KO7
         N81yh3Zdq6UwPeowS7a2SwkeRWIa3gJrhyb/A8gieM02nGnSEQS61iuB4iCj/eeEONYR
         OkOrDKG8urZa9JdOwT0gtLRKmeHs5hZpdGPWV7IE2YQ5lBrII781UgAwcChNLjRkKhM9
         zTTho7NjlBmK2fubNhmeBYnd53XhzOUOD8thbfQV4F8ONFAFpb2aRWhRHxmIIzoQVLMb
         W3tg==
X-Gm-Message-State: AOAM533t4C8j1H/GPdP9xDyC0FKIXvv85ULklxWeEKYKGEdeKEGt2mwj
	MYB77P7GILWlB/oXkOyUuHZ6vipmhhc=
X-Google-Smtp-Source: 
 ABdhPJz+tU9lufsQKZACV2s/ixVLvTxb3E6uV+mRqnItorzcVr7aM0gbnG/6Wwth2CXalGp8sNss9A==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr19817070wri.355.1637163329742;
        Wed, 17 Nov 2021 07:35:29 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/36] db: mark all patches as non-upstreamable
Date: Wed, 17 Nov 2021 16:34:54 +0100
Message-Id: <20211117153525.257146-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158400

Since Oracle relicensed bdb, the open source community
is slowly but surely replacing bdb with supported and
open source friendly alternatives.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch | 2 +-
 ...1-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch | 2 +-
 .../db/db/0001-clock-Do-not-define-own-timespec.patch           | 2 +-
 ...1-configure-Add-explicit-tag-options-to-libtool-invoca.patch | 2 +-
 meta/recipes-support/db/db/fix-parallel-build.patch             | 2 +-
 meta/recipes-support/db/db/sequence-type.patch                  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/db/db/0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch b/meta/recipes-support/db/db/0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch
index a4ff2ecb0c..c82e7c375f 100644
--- a/meta/recipes-support/db/db/0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch
+++ b/meta/recipes-support/db/db/0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch
@@ -7,7 +7,7 @@ db5 does not build because it is redefining a C++11 standard
 library identifier, atomic_init().  Therefore prefix all
 its internal defines with '__db_', to avoid collisions.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [as far as open source community is concerned, upstream is dead]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch b/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
index 571708e03e..2374885e77 100644
--- a/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
+++ b/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
@@ -11,7 +11,7 @@ Fixes
 ../db-5.3.28/src/dbinc/atomic.h:179:19: error: definition of builtin function '__atomic_compare_exchange'
 static inline int __atomic_compare_exchange(
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [as far as open source community is concerned, upstream is dead]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch b/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
index 9d51a44a26..d238b0f063 100644
--- a/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
+++ b/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
@@ -10,7 +10,7 @@ its 12-bytes here and libc has 16-bytes
 
 This can cause problems especially with 64bit time_t
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [as far as open source community is concerned, upstream is dead]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/dbinc/clock.h | 17 +----------------
diff --git a/meta/recipes-support/db/db/0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch b/meta/recipes-support/db/db/0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch
index cb28db1343..a574cf67b9 100644
--- a/meta/recipes-support/db/db/0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch
+++ b/meta/recipes-support/db/db/0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch
@@ -7,7 +7,7 @@ This helps cross compile when tag inference via heuristics
 fail because CC variable is having -fPIE -pie and libtool
 smartly removes it when building libraries
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [as far as open source community is concerned, upstream is dead]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-support/db/db/fix-parallel-build.patch b/meta/recipes-support/db/db/fix-parallel-build.patch
index 27632e1ddb..42c2407cf2 100644
--- a/meta/recipes-support/db/db/fix-parallel-build.patch
+++ b/meta/recipes-support/db/db/fix-parallel-build.patch
@@ -2,7 +2,7 @@ With higher paralelism it sometimes fails with:
 libtool: link: `util_log.lo' is not a valid libtool object
 make: *** [db_replicate] Error 1
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [as far as open source community is concerned, upstream is dead]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
diff --git a/meta/recipes-support/db/db/sequence-type.patch b/meta/recipes-support/db/db/sequence-type.patch
index a6fe3d62a0..fc9f7f0113 100644
--- a/meta/recipes-support/db/db/sequence-type.patch
+++ b/meta/recipes-support/db/db/sequence-type.patch
@@ -6,7 +6,7 @@ in stdint.h.
 This then breaks the overly complicated type check but as we know that int64_t
 exists and works, we can just delete that.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [as far as open source community is concerned, upstream is dead]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 --- a/dist/aclocal/sequence.m4~	2013-09-09 16:35:02.000000000 +0100
-- 
2.20.1


