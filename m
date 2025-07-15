Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6904EC83F3A
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:40 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.5346.1752611797864167209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qP7YfBME;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235e1d710d8so74671485ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611797; x=1753216597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9J+VXXu0ftmgTRlfpE8L6bPXqXomwv9lBlOcDAGfYzo=;
        b=qP7YfBMEF7g1W/GI6JvxhPsCjYfHkBTgl/YGsnQAzkiIoJbh1kfIdf1+OjNXv57DkC
         SemjueMCgpQaqlcRhLtX7FTUFrnyPw+/FZAJ5VQHtS+DvOSh6wGwJsyNy5bgQCb0GVDh
         6YTsng1s2HoEue2Zovopxe0BIUmexTvMuV+S/FaW2tAg0WH2J7fMMhvwzICm0kenPK4T
         +tVue3f0x2LX4xoCfYzq6ib3ev9PHs5q50EV6Nk91u/P1FOS9vNLBek7RJp2jlM9WLBZ
         Qj8yTCqTD4PR96YU7BiChXfNE5H3gtmINEpTpGSRckL6wIDcwC9zb4clXZfIjrzgBi7U
         iwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611797; x=1753216597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9J+VXXu0ftmgTRlfpE8L6bPXqXomwv9lBlOcDAGfYzo=;
        b=n29FZjJvcH7d9LNiafQvIJdocpMlix7sxbeR3j6dVH2YcHT7Uur2YvBUu74s95GfRN
         OQuUsI3YnmMDA9GZZRL0K4C/OYwvh98f73/ZIZNhskPdUQ704N0h0KXjI3V92B7Mm11s
         GA7AKSUGpky6k5ZZ0ok78Y+UKgv3VrFybloW9tGM1/J0ebvmO/gy62A83F12Vi2vPgJG
         NchCurHL5CEQTLqMHXQFWFv3pBvwBT2dzFVaknO5UbM3kyn9wzqvDSBHs14eN1IfhWx6
         kme9GqcZoi7bq1l1FKKYWmuYSRs+hDO+dJQ//bSm2FJI5dihCewXUIOUGgBVoDa4h0Fo
         xLgw==
X-Gm-Message-State: AOJu0Yxa3GVldTHivyYv05qtwxCg5DX1YlNcDWxfZ1vKdJZ1/9v9hn9d
	usVlxjhPHRg9VdlitsGUAPYKaKY1Q6u4kax49ePt8rphvpiyQbny8UJS+whNk5Sy4QSB3Fq1toI
	WzS9F
X-Gm-Gg: ASbGncswIhkBsfVHmiGlo5SgfeV1dvXfNPvSB+qOZMekFUesFRshWOW8lRABR74QeZJ
	JdEW0+R8kZ+rlTrWQGznoLOZeNz2cZ8W8bWad1LyMJcH4OKX8NV6n8lwisorbkA/4WVzoqoFO/y
	P85t7YnSZnJOJebvZLkCkSyWHGKFRAuuuy9IremWhvrnVK/4gGj5RMKJYjvxcXwD7bKxf4Rfo4D
	KOpah5oJTsfDj8vBot/PqAsz1DzKdMbwbNMFg6yWz7c4kxPw+mxLwjUjSHLlKBweXNnVsc9mnnN
	hvUviTff4Ib9Evv1uAG/k/ea8goyz0Uf5LxUrrfgE65hk5TVerAKAp062JClrQBFs1sn0Kicn0A
	7mRJZ5uR22GKkMg==
X-Google-Smtp-Source: AGHT+IHT1/65InWI3MpEKEpHvs4pksNdUr6Z5FIBDrkhSqV5+uZ8AzUmF4Nh7bTvVaZRtHipqW5ssA==
X-Received: by 2002:a17:902:f786:b0:236:6f43:7051 with SMTP id d9443c01a7336-23e24eeb3damr5283115ad.23.1752611797008;
        Tue, 15 Jul 2025 13:36:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/16] ghostscript: ignore CVE-2025-46646
Date: Tue, 15 Jul 2025 13:36:10 -0700
Message-ID: <a3e02ed74db2c234b7c3718b4d6b5332468de226.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220418

From: Peter Marko <peter.marko@siemens.com>

The code patched by [1] which fixes this CVE is not available in 9.55.0.
Also Debian says in [2] that even 10.0.0 is not yet affected.

[1] https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=f14ea81e6c3d2f51593f23cdf13c4679a18f1a3f
[2] https://security-tracker.debian.org/tracker/CVE-2025-46646

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 3b50ac1409..4d696159e0 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -28,6 +28,8 @@ CVE_CHECK_IGNORE += "CVE-2023-38560 CVE-2024-46954"
 CVE_CHECK_IGNORE += "CVE-2024-29507 CVE-2025-27833"
 # Only impacts codepaths relevant for Windows builds
 CVE_CHECK_IGNORE += "CVE-2025-27837"
+# Vulnerable code was introduced later, so 9.55.0 is not affected yet
+CVE_CHECK_IGNORE += "CVE-2025-46646"
 
 def gs_verdir(v):
     return "".join(v.split("."))
-- 
2.43.0


