Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494C6C4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:15:03 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.23475.1706987700956309934
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e5MNPlFz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-295c8b795e2so2341223a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987700; x=1707592500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhdPAzUgSTy9s9pYP1g2w4Yu6/cYt2A8EA+UT45+9tg=;
        b=e5MNPlFzgvnmSFZ7aHo1bcpBg779aY6RfKB8xgkQNMsotwQbIO4EqvtRtI+gObQFkA
         FdCTylDuBmGvRkAvi4ExPBp/H88mSm97DCUfZqV0uxf5ngaYAi0++a4JJkSnY1A8gjKr
         fxPP+3G6rvp8lHtSYAG5uxbP6HWWZ27jkXP04ZpCNo7jyyuuDMgXItgcKfeztxM5mlR3
         EDDBGQT4bHMfUN9qQdkUryp7ZutsM7WWc+zIyqUFPsv621AKB4fbKyzxugiGxlmWJyJe
         NMgrBJ8zCFgliylYV3pr29Bln7U9W3sNWZHYRBrShR477NJpJUJKIxwooCpkqem3iyvO
         ucmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987700; x=1707592500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhdPAzUgSTy9s9pYP1g2w4Yu6/cYt2A8EA+UT45+9tg=;
        b=c7MNAboghal6QKACTd5qfD32mQgN7T/SeptJojNDHsTwCzZmE53s9r0/9LSE14/FAR
         FnX0C2BqRmD94CtcXzGpY/gRPndJS+TGA0KzU0UqW5YP4aJmrfLuAeYxc7qw94Ea+51s
         RIKQ51PELC47z25RK1VfZ5Izr1MJlT7+LYXh0Ry2PfyUL0niWFIbn0rOYPRSU0ttpnoo
         RYOeNW5vRI5JQvVVOSSRbD7u/W2QMd2TYOlCIwWoe2RxEzcmXrpwEfEqwzSJYwX09DQ0
         j6LIb2wOafkcUQze2Op6wNzfYp8Vu8luJaHQ3PHNECJL3v8uTCrTsU6Sxyl/mXPsWPnA
         Ssqg==
X-Gm-Message-State: AOJu0YwYyKkUw8A/Oqy61ISYQLhuIjcGTaBnGr3fhQoDLUvzCLdFBwG+
	Zr5SpXnaCYLmFk2F9k3lxmoYCfKIzuqHypnEHoyQ5vK24ekOkHyMW2kmCm/1/TPcfbn8ssaZnRJ
	T9So=
X-Google-Smtp-Source: AGHT+IGzYcW2urNERVVF1RqHLNLbzpmz7/vAGo4APLL/TDX4iCxjlm62CJX0T77ILBYg/M2eIsLuhA==
X-Received: by 2002:a17:90b:1116:b0:296:36ce:18c5 with SMTP id gi22-20020a17090b111600b0029636ce18c5mr5456535pjb.25.1706987699936;
        Sat, 03 Feb 2024 11:14:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.14.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:14:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 06/15] curl: Disable test 1091 due to intermittent failures
Date: Sat,  3 Feb 2024 09:14:33 -1000
Message-Id: <7c183e7470565db3085b4f18044567fc51c842ab.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194850

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Disable another test that intermittently fails on the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d169e13f7e2eb6511f0ac98da63b060c6c0d53a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl/disable-tests | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-support/curl/curl/disable-tests
index 3d792e5f15..89255d6034 100644
--- a/meta/recipes-support/curl/curl/disable-tests
+++ b/meta/recipes-support/curl/curl/disable-tests
@@ -7,6 +7,8 @@
 413
 # These CRL tests are scanning docs
 971
+# Intermittently hangs e.g http://autobuilder.yocto.io/pub/non-release/20231228-18/testresults/qemux86-64-ptest/curl.log
+1091
 # Intermittently hangs e.g https://autobuilder.yocto.io/pub/non-release/20231220-27/testresults/qemux86-64-ptest/curl.log
 1096
 # These CRL tests are scanning docs
-- 
2.34.1


