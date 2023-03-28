Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A44C6FD18
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 21:44:01 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.9610.1680039835030354090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 14:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kDuZRFrr;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso14071402pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 14:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680039834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MoNCyA2SB6oyu7KLcttlug5azWoeSxvvwHqfp+UW3XA=;
        b=kDuZRFrrOJCTStbrRmL952by/Ul9ex7haCoz2xq+/or5jVrc2dsjkUSzLoM15h8P0S
         /I/7a7nd1S82A6+rw5RusfiFwXh4zsfwYV21vipUtuWRALxisU0+Wn4C/eQF3iwc2zNI
         o/mULeNpzN2qUfnlrAIJu8vUoDasYYpspESm+X8ty8ylvZQfTBpM5oIbyJ74WY6/9pok
         81v5EOzVNMIjZcQFc1mQMQHPETRJwT8LVZDXDIimsLSCbknF6QSJgGVFCJTNjTPS+8xf
         8PV1ZEtfsjjQAYbrmTs+xKB8+LqtJbtlYllJ6sFWPPftRQjNvRuH7uZxK8nxZ6JqYlkv
         iRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680039834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoNCyA2SB6oyu7KLcttlug5azWoeSxvvwHqfp+UW3XA=;
        b=ogHIeil+fNrEgdnA5DEl+H0cYUTQ312ktdbu8cvPquaqRUlZvckoUy37bgKsiP7tPt
         ZAo4aCpYmJAYlOIE2dv5n1kHWEH02bGXikL3Ztn+UKfM0huvDjiXtx8JFwVWfjn/hDKg
         RRm8rqotjZbtqPvpuxFY7dLJk4k3oLUXQ0b0QMSD8jc6VcQIInPD0LNDeVcBlqQrScXd
         Uz6u/8q+udtQvfhFrLdlFwaesJtlX2l1huzp8yQMMMae/oNf6liUTRPj8ZFSTojWManb
         LZqkgrIRyVZrsNnyve8pu8k3a4+9RLAtZW1qC/WwgUGvf8p9UeGOJ/rYpOC17o5X7dXG
         BRog==
X-Gm-Message-State: AAQBX9dVADqkMMeqGH/QAy7Iern5kjybL5uLw+eVazQj6LPd0Mdk8aux
	xQt40GIQk8qx/G0tnSUPBxXq0y9xZvNydg==
X-Google-Smtp-Source: AKy350YMZJNTR9zfbjNRMtDxgpn2ggMxVOvXkcP/ALznKLrdXlTJkyrSRCmYoWGazyiInssJQiUFeQ==
X-Received: by 2002:a17:902:d0c9:b0:1a1:ee8c:eed7 with SMTP id n9-20020a170902d0c900b001a1ee8ceed7mr12879119pln.67.1680039833957;
        Tue, 28 Mar 2023 14:43:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902a5c700b001a207906418sm10254613plq.23.2023.03.28.14.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 14:43:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Fix build on 32bit platforms without 64bit atomics
Date: Tue, 28 Mar 2023 14:43:51 -0700
Message-Id: <20230328214351.3666478-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 21:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179249

The fix is to remove a static_assert which is anyway diagnostics
we will not hit on 64bit platforms and it will still work on 32bit
platforms although a bit slow.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...move-static_assert-for-64bit-atomics.patch | 33 +++++++++++++++++++
 .../recipes-sato/webkit/webkitgtk-3_2.40.0.bb |  1 +
 meta/recipes-sato/webkit/webkitgtk_2.40.0.bb  |  1 +
 3 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/files/0001-ANGLE-Remove-static_assert-for-64bit-atomics.patch

diff --git a/meta/recipes-sato/webkit/files/0001-ANGLE-Remove-static_assert-for-64bit-atomics.patch b/meta/recipes-sato/webkit/files/0001-ANGLE-Remove-static_assert-for-64bit-atomics.patch
new file mode 100644
index 0000000000..d39eee6c58
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/0001-ANGLE-Remove-static_assert-for-64bit-atomics.patch
@@ -0,0 +1,33 @@
+From 03d5f84e7bb292f5cf7120af91e979fc87b36e04 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Mar 2023 14:38:17 -0700
+Subject: [PATCH] ANGLE: Remove static_assert for 64bit atomics
+
+This will make sure that it can be built on 32bit platforms e.g.
+mips32/ppc32
+
+This partially reverts https://chromium-review.googlesource.com/c/angle/angle/+/4205892
+the suggestion to remove the assertion is from the author of the patch
+itself
+
+Upstream-Status: Inappropriate [32-bit specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/ThirdParty/ANGLE/src/libANGLE/renderer/serial_utils.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Source/ThirdParty/ANGLE/src/libANGLE/renderer/serial_utils.h b/Source/ThirdParty/ANGLE/src/libANGLE/renderer/serial_utils.h
+index 51ad1af9..9412c805 100644
+--- a/Source/ThirdParty/ANGLE/src/libANGLE/renderer/serial_utils.h
++++ b/Source/ThirdParty/ANGLE/src/libANGLE/renderer/serial_utils.h
+@@ -129,7 +129,6 @@ class AtomicQueueSerial final
+   private:
+     static constexpr uint64_t kInvalid = 0;
+     std::atomic<uint64_t> mValue       = kInvalid;
+-    static_assert(decltype(mValue)::is_always_lock_free, "Must always be lock free");
+ };
+ 
+ // Used as default/initial serial
+-- 
+2.40.0
+
diff --git a/meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb b/meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb
index a9d6af2626..23378d7d16 100644
--- a/meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://disable_wasm_riscv64.patch \
+           file://0001-ANGLE-Remove-static_assert-for-64bit-atomics.patch \
            "
 SRC_URI[sha256sum] = "a4607ea1bf89669e89b1cb2c63faaec513f93de09b6ae60cc71d6a8aab7ab393"
 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
index e219cbf6d4..5c64dab23b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://disable_wasm_riscv64.patch \
+           file://0001-ANGLE-Remove-static_assert-for-64bit-atomics.patch \
            "
 SRC_URI[sha256sum] = "a4607ea1bf89669e89b1cb2c63faaec513f93de09b6ae60cc71d6a8aab7ab393"
 
-- 
2.40.0


