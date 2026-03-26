Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFAE109E53D
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 02:36:08 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39798.1774492556578323043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 19:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BFiqPSsF;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c160308a54so1206483eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 19:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774492556; x=1775097356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmc/+lL5IB5Ai3Y+k632LD3rgQsDO9ze9+fQ62izFjQ=;
        b=BFiqPSsFpW6w529uZxM3JCp4GmHWvO1oL93lO7yfYR0SgyR46858u+1QeBrFmYjgu1
         stfiU+MsN/q3TwxpaO3xYi4FDjLMan5wpyS+9hXLzSU48sVcn/HdY+1XPPC3GirugcTV
         0q4MAP9IOfyraC4avHIVyPO755oLVZtsaUHF7WYmjP3vL0uh1yj7TNB8Ge7yuRnHmtTb
         UaoHVObMWfCx6L3DcvQWTrF3YiWYO955D2UXoD06kdgm008PfacP0Wco8gO3/ryEQm1O
         rk8tqXkIc8nKYAQ4TanJXDVaVw2dTjVYFDxsqgpTt08ukdYcTuDoO42sT8N4G81dXECK
         XvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774492556; x=1775097356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmc/+lL5IB5Ai3Y+k632LD3rgQsDO9ze9+fQ62izFjQ=;
        b=jrTgtGaNw1InMyxx3CA4w790fVtLF0uRzwO/5MNlkQwLZADNnMChUTYCWnUYl15Zyf
         IlmWg6gn50SkdoztOU676zdbw9JzEITzbNVOEzzXnBqM8+pX2HQNA+xN3IKYOHDfl0tU
         X3vR2dDG5fVmnemUrhe/DmJGpxqRhmOiJUZ7q3/qA3NTXQhwL2FN5Cm10zzi8Zuw4uqY
         Vst34ngTvWOdeax32CgHyyWyCGpM6sLokC0pRcKvrICOVDnfnwJmHUg++GaNTRWmiNa6
         /vQ07T5nZqPbhruU9tu7UGoA64/8h6+R8+t/RjOYKH5u9tHi4HvF0wYL2y9WQ2NQyF0k
         /I6g==
X-Gm-Message-State: AOJu0YyezaSjAml9ku4tAuRDys05MYFWgeTZJ3GLQV+o1ZuWYcX8SlWA
	HtIGtqT/RDU/PaqcMV2h2jimhP3OqUr7OhJC7SsAkuQnyma4T87ghWr0gCxob7vhqgk=
X-Gm-Gg: ATEYQzwcdJTr0vO4tt+1scDPDfi3xQ+ZLaqs6NZ15jDueurl56jDEzRrGU3TK54nROn
	aQE4VNcmgQl41dFNjHIZn1KKfcxAbbGroAFnHsAcy1nmSXDO911lBH9klIC+5Y7Wi6pukx8G3ur
	f7fc7m+DaLSjlPzMkpupBDxuMerohb2AvHAKAVKqplO+4QMTi1bZ94qsMfXxsHaFyMOStsr3zjC
	yF6EJpn8kyb3aqbOFK4ILxHsP207e0fEMJ47VNA3YxzO8gG8/fgKj6aQHmk++vvT95NxdlQBU4k
	kBSNzCya8xgUtaJVagC7KQibp406C20Sa0jtuhM3vpwoAL9kKHBt3i+tcORdWoCPpihUIocpBYv
	6WCA1rzJflqlovR/dlVZVpYAwvuuVAZw2cWtLnuCIqjN71JjF+JTjKWShIWco4/hbCykC7aHn4P
	zURt+tVizQICX6QgeQ4TFDQLW/CGq+I1LerjySj0B1MsHr6m1MnJW7mKt2jRjaOj/hEH5FnjKhl
	pox1XGmRvDe3/37D+B3gt+iFOH6UqUcXGJhn4oCbVdvU1l1etiNeoMm76oLLJHatTg10XE=
X-Received: by 2002:a05:7300:cc12:b0:2be:b00c:d083 with SMTP id 5a478bee46e88-2c15d442b12mr3431163eec.35.1774492555622;
        Wed, 25 Mar 2026 19:35:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec257b4sm1258440eec.6.2026.03.25.19.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:35:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH] nativesdk-clang-glue: Delete do_create_recipe_spdx
Date: Wed, 25 Mar 2026 19:35:51 -0700
Message-ID: <20260326023551.632579-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 02:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233947

Delete this task, it is in SPDX 3.0 implementation

Fixes
ERROR: Task /mnt/b/yoe/master/sources/openembedded-core/meta/recipes-devtools/clang/clang-crosssdk_git.bb:do_create_recipe_spdx has circular dependency on /mnt/b/yoe/master/sources/openembedded-core/meta/recipes-devtools/clang/nativesdk-clang-glue.bb:do_create_recipe_spdx
ERROR: Command execution failed: 1

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/clang/nativesdk-clang-glue.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
index 8e5622f6c1..d113b6cd9a 100644
--- a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
+++ b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
@@ -34,3 +34,4 @@ deltask do_unpack
 deltask do_create_spdx
 deltask do_create_package_spdx
 deltask do_create_runtime_spdx
+deltask do_create_recipe_spdx

