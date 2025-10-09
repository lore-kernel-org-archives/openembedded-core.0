Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D4CCCD18C
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:39 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.9192.1760038289288068538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BYLmj54R;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-782bfd0a977so1196329b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038288; x=1760643088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7bOhIBUbn1T72wGnJuDRLj/+lw2rA2Ty9HuqT9WLw4=;
        b=BYLmj54ReFBfEXJKLa/mCR7HFgTBzcZaplRJ5ZpAllq/vtynFNN7Uw2YAzuodckO/z
         X54dwBn7RLhE+gWJF1GSiOTH/fqDKSdjR6ICDTG51qV2xSD5X8M6nGnvYdMETnUA0DoZ
         oXRpvdJe/KFPQd7o8+a7zvqbuspwrUrHaoRMpqn2GjttxJL6O6oZ3YVik7e04eXWNc5w
         elZWaVsSS4kW4zb+jx14yxJGzLpVOPbXEHBKFx/5eRZrxH+Kz77l7ZnR7s/Z4SQ1LrZL
         ECY2st0jf0WTnzF3bg5x4k4anHcnaV/kWi9TP3Hv9LfWAE/7GbwIqK1DM3R1FEWll3SW
         UL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038288; x=1760643088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7bOhIBUbn1T72wGnJuDRLj/+lw2rA2Ty9HuqT9WLw4=;
        b=LCZJU31Tdvpcm/yBtcnlfHS4dUHpbBcCfQ1YR6MTHgCAjY/GSii9oP8Ba0DRUNMQJ8
         Vv5Cl2LJFhoeqBOcdqkV83Isd/R0QNdjc6jedGPTv7DOGMQYIMFAcBywEeg9rmmW+EAA
         ZUXA/Cm5H0Fp5PsymFE3DP/B5XT7+IzrqhblztbVsozydaiqfEmB5l2m96r7DO3hajYF
         JfWg1clXhgiNRHfE9FK9s5ZiE2KvLf/xEcqP4ILq4ouWqgMuWJ/9q5XM+llzhtfWfaV8
         M1pS90WdF+9640d2k+55JeXsOCWlv9/RXvaNzE7oqPpP3uypQ3NW4qe4PodBdWxxlA9K
         TqeA==
X-Gm-Message-State: AOJu0Yx3GnQxc1T9o8BQdhmk4yVvc6AcUFj/yt8VidoQYowvXDqiaDTZ
	m3vuy77ImweNvS3Y0az9YZB9HNA1mSv1i0b1fEtsKKxUw4dMUqjoH/RHhEwM/TiiZvvZnO6YSBq
	SDArT
X-Gm-Gg: ASbGncuwwLrXqcT7xeFrzJsEdo47TxuTi5QuZPO5qmjjYgPB9PgXAKA86mRnklW/EAO
	8EfHybHM1P+2Q3wRJrwcdOp7mhy/74+3ej2tQDwPJ5lSpnN0KpdXJaJz52JjlzOL05db/LaT+g8
	5ui1eisbxQycsGxNDdxzr2ODrop8huEHHG8tI89TSwJ1VaEAv1/S5PyKbIcxCHjugJ3WC6Z3lhW
	1bDujO0rIHKWgv3X5/fz1C68Nv++g3QbDQE7y6z7K2fHCgN0GqsGYJbw8/Xu6PETG2r4Xuy0KAy
	MfvqN7yHeKobatZ4tbp6cJaXfT3KGdcBrQJ8zdfGDKGwtXYDlM7iSJDXlzJ1yD6FUpzdVayUcHG
	sW1xKeSQvOvfUWTJtTO1zaJQttLX/w1EhCMuooA==
X-Google-Smtp-Source: AGHT+IGl8SkNjSv6pQg70/EcvMMC9Q4cxfJ5i3FsiMmt5ACCL8+Kn8TtYRVpWlv/j1hD4+1aX8xEYA==
X-Received: by 2002:a05:6a21:a8c:b0:32d:a91a:7713 with SMTP id adf61e73a8af0-32da91a7747mr12789783637.40.1760038288576;
        Thu, 09 Oct 2025 12:31:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/24] gstreamer1.0: ignore CVEs fixed in plugins
Date: Thu,  9 Oct 2025 12:30:51 -0700
Message-ID: <86f48cdb1b26b6e234dde10b1e636e54e8a7e71f.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224626

From: Peter Marko <peter.marko@siemens.com>

All these CVEs were fixed in recent commits.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gstreamer/gstreamer1.0_1.20.7.bb                 | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
index 697c6e8b49..b9b9551bc3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
@@ -71,15 +71,21 @@ FILES:${PN}-dbg += "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
 CVE_PRODUCT = "gstreamer"
 
 # these CVEs are patched in gstreamer1.0-plugins-bad
-CVE_CHECK_IGNORE += "CVE-2023-40474 CVE-2023-40475 CVE-2023-40476 CVE-2023-44429 CVE-2023-44446 CVE-2023-50186 CVE-2024-0444"
+CVE_CHECK_IGNORE += "\
+    CVE-2023-40474 CVE-2023-40475 CVE-2023-40476 CVE-2023-44429 CVE-2023-44446 CVE-2023-50186 CVE-2024-0444 \
+    CVE-2025-3887 \
+"
 # these CVEs are patched in gstreamer1.0-plugins-base
-CVE_CHECK_IGNORE += "CVE-2024-47538 CVE-2024-47541 CVE-2024-47542 CVE-2024-47600 CVE-2024-47607 CVE-2024-47615 CVE-2024-47835"
+CVE_CHECK_IGNORE += " \
+    CVE-2024-47538 CVE-2024-47541 CVE-2024-47542 CVE-2024-47600 CVE-2024-47607 CVE-2024-47615 CVE-2024-47835 \
+    CVE-2025-47806 CVE-2025-47807 CVE-2025-47808 \
+"
 # these CVEs are patched in gstreamer1.0-plugins-good
 CVE_CHECK_IGNORE += " \
     CVE-2024-47537 CVE-2024-47539 CVE-2024-47540 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 \
     CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598 CVE-2024-47599 CVE-2024-47601 \
     CVE-2024-47602 CVE-2024-47603 CVE-2024-47613 CVE-2024-47774 CVE-2024-47775 CVE-2024-47776 \
-    CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 \
+    CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 CVE-2025-47183 CVE-2025-47219 \
 "
 
 PTEST_BUILD_HOST_FILES = ""
-- 
2.43.0


