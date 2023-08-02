Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20407C04E69
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 18:02:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.3284.1690999359370708763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 11:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CQW8T9EH;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso1097835e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 11:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999358; x=1691604158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nVvPQrIJmgv135udDLabboYfmOUt9gE1kNRey8d5PK0=;
        b=CQW8T9EH0BQmGYIMG5vaUmN3SSyLeSJ0friL2Scvgj5mco7eufKeg5OHJGbWRqPfsn
         D5gmaPpX0xlLpUGXzFRukcoxe43WNwBRWnirOjakjojD9JP/P00GnZLqZtc6J9b6MwzV
         WKE/ckGLmpaM8mbd3X+wchh6Nt3pPn1vBAIgcilXbLXKNyScv0EUp72m0h8PQgpeNaV6
         UYbN+msVc1Bc0gIOBDtBWWzCz5nr+uCU9Q5dzmsMSpv3d8PHVpKb+w7eGX5ADXXtNUBI
         XxpralNFltJAwvAO1LtpoGncuITI20x/o682c6952F3vCDeQmxwEpbvuTuSo4MRq69mn
         aNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999358; x=1691604158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVvPQrIJmgv135udDLabboYfmOUt9gE1kNRey8d5PK0=;
        b=U3FXotkTu8DB6Rldo1x4gTSzGiCTGJDBX/C5MpHwkb46nDYAHRC6T+xamOLXWPcdqT
         0E6FMzSHtsA7kv5BN01PtLXenYAIB0jvTqRA8+Bqv5khbtqRKjbQpV54jhi6UpeMVczm
         MgVdS7Up058iX1B1/yh4wYB3Rr7uyNvJYx8E4EDxMrb6NcJEUgpfZ/1DXhqOj7ydo4nZ
         gI6Uty91UI1xtUbUuMTLyTOjosnfKvHCVW+Ehd2UmUPn2+/6gxQ9WhenJE7d2eM+w5nS
         jwAHnRscWuQfe6iBe2JBSGqPVDXBqEkRffhftoorK14qVFavdr9HQAhEbCxJPjpmyK8G
         YHOg==
X-Gm-Message-State: ABy/qLaNYZ+TXAmxGGAoTBB+LTz3+OrB6l3J/fo4Yn890Ho0uFXmKsyz
	FireKSdKLoh1sMvpHKyNTnBXKlLlTRU=
X-Google-Smtp-Source: APBJJlEVQPWH/jnZ79Fj51zkAyFzqeEZxmpx1haai2ks5MU7mQonWMM9/IQK6GoceuPKQcnLTlu8dA==
X-Received: by 2002:a05:600c:219a:b0:3fb:af9a:bf30 with SMTP id e26-20020a05600c219a00b003fbaf9abf30mr5735859wme.2.1690999357611;
        Wed, 02 Aug 2023 11:02:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n4-20020a05600c294400b003fbe4cecc3bsm2288824wmd.16.2023.08.02.11.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 11:02:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] curl: ensure all ptest failures are caught
Date: Wed,  2 Aug 2023 20:02:30 +0200
Message-Id: <20230802180230.4167091-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 18:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185424

Piping results through sed is masking failures that aren't
picked up by sed expressions.

One such failure probes the source tree, and so isn't
relevant for target testing, and can be disabled.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/curl/curl/disable-tests | 2 ++
 meta/recipes-support/curl/curl/run-ptest     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-support/curl/curl/disable-tests
index 92056bd8cae..b687b2bb763 100644
--- a/meta/recipes-support/curl/curl/disable-tests
+++ b/meta/recipes-support/curl/curl/disable-tests
@@ -18,6 +18,8 @@
 1165
 # This CRL test is looking for src files
 1185
+# This test is scanning the source tree
+1222
 # These CRL tests need --libcurl option to be enabled
 1400
 1401
diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-support/curl/curl/run-ptest
index 614e822922e..2c74c58f5da 100644
--- a/meta/recipes-support/curl/curl/run-ptest
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
 cd tests
-./runtests.pl -a -n -s | sed \
+{ ./runtests.pl -a -n -s || echo "FAIL: curl" ; } | sed \
      -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
      -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
      -e 's/Warning: test[0-9]\+ not present in tests\/data\/Makefile.inc//'
-- 
2.30.2


