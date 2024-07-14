Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F89C3DA49
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.15287.1720960773430135210
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mnFS10Qp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fb1c69e936so18457455ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960773; x=1721565573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4vGFQ3opukPDqIPkFROx79NBrJENZgTPqw3W6HQEiA=;
        b=mnFS10Qpd7nfy0uMC5R5daQPLIIzY9RfPpp2PTzpfpJzH2jSJ7Ovvy+cacD20HpihF
         zwV7p3OtoJ6YLmyfZaYkK71U+1R2Vy0mjlXT53qZCU2ryx0VWrPQJ7iTex+hC5o97f1y
         3/mNc/dl33h9PR2VktTzoVNHHI2nVLJerroPMb7I4r1u806alOupju7bT/6cRV5q2QFw
         J988Zal25KepOEHSVgWWQC3AFMt2ibixP4QFQ8pZCFD6nuDHU04wZkYOH9G6hEzSxhv3
         tgPNJHx2F4e3G6Hp9Wiq0Mv37ASkLGTKjNU/APAjzn1fJ9rLK4s1ziXlevi0RBjJQeUZ
         8vLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960773; x=1721565573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4vGFQ3opukPDqIPkFROx79NBrJENZgTPqw3W6HQEiA=;
        b=B1MNngjTj1rOKc4VzhIMWYJJ86vnt6HLRGioSahMcimcNGYH3D91Y4lIOU5/Rb66eN
         9FVPbHXPAYQIIyyAdcRfC/LGgXof7P5v7QFc27sl+QBc20Ylyt1uHB5ClwYxV1INfzZ1
         HpmJdgbTX2zKXWZo4ZSzTfhwtw8gYnE0quGbRzPQ18dFYdACDzJ/foNCwOt3Z8i4iaXR
         6G3lHNlHoy6fPEjWoBFi44BIhAH1zetTH5CzB1VKa57dKZKjTL/rb20bv31TMiu9Hm5J
         q4FeTHsoK2subn8kxyQQvMSP0kNNXa7/fSgmvmKG+PPDhRho0q9KTcng/H+JOX8FA9JV
         EmzA==
X-Gm-Message-State: AOJu0Yx3lrvAbeH0AyTblKJbX7UkBe+iK2g0Uz52fL0gBE5XOEdAIzSb
	+WBaAKwlgPiULvPDzvF1quEur+aNntyxX4eUf8YebP5GImBdS+FsMSo2zIfVhg7jsy8w766Ajcv
	HpaA=
X-Google-Smtp-Source: AGHT+IEzIgL3x9xVDn7ae7wA4oJzA6gCQS47IdRt9Dp1lfiimeXJNkJsVJqTyBg9oG9O/jfDjZ/+og==
X-Received: by 2002:a17:902:b193:b0:1fb:4215:d9c7 with SMTP id d9443c01a7336-1fbb6ec3dddmr93573545ad.54.1720960772660;
        Sun, 14 Jul 2024 05:39:32 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/27] selftest/cases/runtime_test: Exclude centos-9 from virgl tests
Date: Sun, 14 Jul 2024 05:38:43 -0700
Message-Id: <37ddcbd51ec39e5df94b307085cec2a045fea4a1.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201873

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Similarly to centos 8, centos 9 doesn't support the render device we need
for this test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2be3afabf84f287c90b61ae2509728a6634fb8f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 12000aac16..13aa5f16c9 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -273,7 +273,7 @@ TEST_RUNQEMUPARAMS += " slirp"
         import subprocess, os
 
         distro = oe.lsb.distro_identifier()
-        if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or
+        if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'centos-9', 'ubuntu-16.04', 'ubuntu-18.04'] or
             distro.startswith('almalinux') or distro.startswith('rocky')):
             self.skipTest('virgl headless cannot be tested with %s' %(distro))
 
-- 
2.34.1


