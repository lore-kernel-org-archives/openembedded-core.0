Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69A8E77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 11:49:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.8572.1733831363614244036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 03:49:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fUmI40gR;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434f3d934fcso15195945e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 03:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733831361; x=1734436161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frKFxj0zJ5R9qjg8dBr3upAnwDx0SjrHwvsUyd940sI=;
        b=fUmI40gRBd9S2qyUi/k4Z4ZpvLk3olAw2VbWx7bnDuBf6iBfM8b/dMhyWHpP1bIKhA
         q+JPDfNFdCwG6WFWaGLP0l9TYTOsl6TRAvmLI4ReOLsWtcsG1ACZKdo5dIwoOfr7P4hU
         oXE2+fJNP1KTNemvdQZfcg39KYAGupvzu/FlIwMoz91bB2rp7rijVFOa4QkysZKxmPe8
         yKQicyDI0PycTuDU8N9K1tKDQd22qaIlb4O8UT1KPaE7sh1bPrDNMyTJo+xK15MljAIv
         ixkB6l8U2ibLG1QoyT+hkAFkJdXa2C7ru4VO3HzVWU69UVzGl1D9PjDUZYYFFxhbB/bB
         zcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733831361; x=1734436161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frKFxj0zJ5R9qjg8dBr3upAnwDx0SjrHwvsUyd940sI=;
        b=Gk4GIwmiXQ0jaqQlROn2t+l99hSsrdA3kM7b2VMs1A0wTWH5Gf0xuFCC4xJz/+hT8C
         BiVz+5jpVOMQnGMmSFNjsb2ZFsOAsRKf0ZCmXYmHYxaaQmNm41VssYvlPdJAPRRLYzPP
         LpLYOLCRS5av/9dUt98pYp6D31Oqn8x7fBCCw+rS5CfnKdzzv3PR3dDdZhXipdcWTqCz
         RRUfv1POU+UY/jMufRtFQbrYW66HI2hh6treZc9ymxBBVn6b7HViEG56tYTE+BKlQXeD
         64kCDts9HkM8ApPO0Cc+xJySHtzbeYpDafOXqMjUOzuFeg4dB0HjQ74r0NKC5ebV0uxC
         AMiA==
X-Gm-Message-State: AOJu0YyrL531Eo80agxEWxmx//Flig1dwJ0yoWLukec4gx2+4MVlKYia
	hooPcnxVCmZcDrjzAFS0zLOJWjgSYkSXQv8cdZ2pyE7cNbK/GdEhJTETgA==
X-Gm-Gg: ASbGncv4k0QvdDt2ZvNx9+e3dIsevEQQOx3bsE61pdjMACjX4Xu8vIuuCg3Uz7XYw+w
	wKyb/urdrGIzjQ1ndGSEtGB84WAaxIVob4CkzpYUXiNmNPy0ohAIb+ZkwilWNxbqTu+xuhrwT2M
	h5k4G6dg6bxX5z31g+ca0EPySiz3M3ffrsLfSNxn/aXgeJNNapsrmyJaUcru5FwnYQl6CNn59pO
	zm7hMFxTmuqFOS50JA4jdDR8yJ9eRRhwCQCsIse+OJTTqOSKzNV9SELl+EBi1EARE8=
X-Google-Smtp-Source: AGHT+IGmgztekQYqw1nMCzKCeWJ1aFc/huys/5zc7kRJau9fehuikNkuqyPtBMhSBPZ4IWeHAgtL7Q==
X-Received: by 2002:a05:6000:154d:b0:385:cf9d:2720 with SMTP id ffacd0b85a97d-386453dd543mr2614217f8f.23.1733831361159;
        Tue, 10 Dec 2024 03:49:21 -0800 (PST)
Received: from voyage.lan ([2a0d:3344:23bc:5a10:70e8:c835:72ed:f8f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf3efasm15569553f8f.17.2024.12.10.03.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 03:49:20 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [RFC 3/3] cve-check: revert to old NVD feed
Date: Tue, 10 Dec 2024 12:48:07 +0100
Message-ID: <20241210114839.1579228-4-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210114839.1579228-1-marta.rybczynska@ygreky.com>
References: <20241210114839.1579228-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 11:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208526

Use the old NVD feed

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 meta/classes/cve-check.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6e10dd915a..7cc2248faf 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -31,7 +31,7 @@
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-CVE_CHECK_DB_FILENAME ?= "nvdcve_2-2.db"
+CVE_CHECK_DB_FILENAME ?= "nvdcve_1-3.db"
 CVE_CHECK_DB_DIR ?= "${STAGING_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
@@ -182,7 +182,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build
-do_cve_check[depends] = "cve-update-nvd2-native:do_unpack"
+do_cve_check[depends] = "cve-update-db-native2:do_unpack"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
-- 
2.45.2


