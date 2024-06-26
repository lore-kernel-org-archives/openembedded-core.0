Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7A8C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 15:25:31 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.29826.1719415523254958116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 08:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M0N7gz+S;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f9ffd24262so36872465ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 08:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719415522; x=1720020322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cgzPL2yHtJ+NdrwLbe1/yhoh0258F8BSVWxur12lqG4=;
        b=M0N7gz+S/fKzhkpoFygRaTwRssVKi4biYw2eirkmdUYyTiJEvINfkkXrQy2BLAyNNQ
         pBbzhFaDaXc131P2bF9+AxAgmCKjz9IVFoTUcIJNw7S8xJ/vBZudcxX758tAV67FX3AQ
         ZlkOXV5ADuWv61m7/oX5nxCJR2hg8bfT4Dl9luZ7UuG5Wi1ZcFUQ72hmFzpOwkYYjUgX
         GkrMtdeV7x1cvvTBd7ZBie0T3jsSxFOxsW/OdvvYinTaoHEVkJvx6OKx3rKrZdJoBeS9
         u1ciujPMW4uj20TiSmRfEmv50woA7L/Rfkcz/jd9NGrzuktkHQdRHNYbmpIh5sjqkyuS
         ga+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719415522; x=1720020322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgzPL2yHtJ+NdrwLbe1/yhoh0258F8BSVWxur12lqG4=;
        b=Y+kF3KRxSweoP/G4xbZl5zRmoE7PgsKm6nmc7IT9SaWqcMrGSwKTsxXRJIj4T2nCoV
         zItJyRZ/mSTUi9N9tShpSMIPjwzhx34jRfwBBfjphZdaaGdLvt5VF5R4wL332l9bkeFR
         aRp1/l4KEZGnduf0BcoCUWfxMH0fxIvMW7GwvJwsWAqKNu/xPxbSdpHcOLzolF0pTl0S
         /Nr4tFoeEydy7OFsIJtKLWvG3FHsUue3a8SyuvFqbPOP8i0Bn8+zoc+IxnPONZPJrQjY
         8I7UnlHVY2iYrg9EYDqIFp51oT6ZTfCnwuZKhdhJnWWE2Ne9swrfi8j2DnkQYJ2uV+hl
         Nguw==
X-Gm-Message-State: AOJu0YxlvCVPJcbLxTxbqyU9pXhi55qNvppM9VHQNcuYbWiyZtoTj8ny
	m1jekRRcG3ZiNhByXz/6pM27PvOrxtBBpEsB6nPkan0tBTHvRSh5R1m14w==
X-Google-Smtp-Source: AGHT+IFCbyQpdx22SZxnEr58Rjhuxx7204Qg6giXPXP3DY96EiUrZuHD1Bmr6jbbhIJHChV3MJiyYQ==
X-Received: by 2002:a17:902:d393:b0:1f8:6776:7ab7 with SMTP id d9443c01a7336-1fa23f9e4a3mr89650255ad.24.1719415522214;
        Wed, 26 Jun 2024 08:25:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6284])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb6db388sm101042685ad.229.2024.06.26.08.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 08:25:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Update to 18.1.8
Date: Wed, 26 Jun 2024 08:25:19 -0700
Message-ID: <20240626152519.1047437-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 15:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201174

Brings following fixes

* 3b5b5c1ec4a3 [libcxx] Align `__recommend() + 1`  by __endian_factor (#90292)
* 72c9425a79fd [libc++][NFC] Rewrite function call on two lines for clarity (#79141)
* 443e23eed24d Bump version to 18.1.8 (#95458)
* 768118d1ad38 [clang-format] Fix a bug in formatting goto labels in macros (#92494)
* 8c0fe0d65ed8 release/18.x: [clang-format] Don't always break before << between str… (#94091)
* 7e6ece9b4f2d [PPCMergeStringPool] Only replace constant once (#92996)
* 1ce2d26cd2e9 Bump version to 18.1.7 (#93723)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/{llvm_18.1.6.bb => llvm_18.1.8.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_18.1.6.bb => llvm_18.1.8.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm_18.1.6.bb b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_18.1.6.bb
rename to meta/recipes-devtools/llvm/llvm_18.1.8.bb
index 189f5b1146c..3c804eddd25 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.6.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
@@ -27,8 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "bd4b4cb6374bcd5fc5a3ba60cb80425d29da34f316b8821abc12c0db225cf6b4"
-
+SRC_URI[sha256sum] = "0b58557a6d32ceee97c8d533a59b9212d87e0fc4d2833924eb6c611247db2f2a"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 

