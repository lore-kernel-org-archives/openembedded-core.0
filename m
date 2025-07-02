Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E1CC8303D
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:30 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.15051.1751425950363737562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d0Jnpjvi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74264d1832eso4874988b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425950; x=1752030750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeKBdhFgDGcV3HEvKka7M6jm0TLSJPvOXtCPjxOJrkg=;
        b=d0JnpjviCGEt3sAZX+qV2Ip6PDUVTnqb0wALibfQBRyR2TFXxtH0SEer3fzvk8+xHM
         8jnLQ4RfgREaUPc0vQlHcGPohWFY/+RTYPD4lURg/DMKHO6r1mfowYBi/koOWrf6chJg
         SfKljweLyZXWksPhGfLBgIvwVEHXd22tPos75+qVEMrk0adtQmXhfEp5rQlKkPOR1ukx
         7L6AWWlVFe2pXmfPDqZEVdJpenVLyiliWpRhR11XH75qCHHjC8ZROajMIFFHOngJT9c1
         d1J89nwqovsHGHihPt8qbh9Ag0gpR7V2wPxT7VCvJXw4L4iJeTGKvbTGtOIuBrjYVjjB
         YC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425950; x=1752030750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeKBdhFgDGcV3HEvKka7M6jm0TLSJPvOXtCPjxOJrkg=;
        b=hVUUojW/mTaHB+dfSGj2nCSpmURmOdFQq5lazkVx10qkqcFgfeiN8bbGlxbjAoKajH
         Hf0oMh4pfFkuybh7AWGYI6c6W0h2lwzCBHB0XmDsOB636OCfR+Rm0R1unarV08U0eWsh
         uyrukI+MDdJIkYvM7l46ZxTDTAbB8l7AJi0tGhRq3JOR9ZUOfGfw1oufNuu71lRXLpiN
         Cd88iW+/OZV5+a3WdLstQRUfSzNpyVnQIZ6hZq0PjHgtnfhdmAfkW3WmpFIFkh1SHIe0
         pv4SB0y6M06Uxt5wP9dFr59b3cf0IKQBI8cAiwO/cQfuS2L+gcoH6nvHRnMMtHKjX6qD
         P7qQ==
X-Gm-Message-State: AOJu0Yw6otRZXDk4gAgG10Chjm1JWXf7NvcMq9WPAgtr9hHzcbYQMsXw
	yP/x4ltoweTt83pmO1Hw57Sj3i+mbgHo0JTxn2X6PkSXNmwwBM34MFQeyzIa/E3FXl53gsYeCcZ
	0Vujw
X-Gm-Gg: ASbGnctNcuKLsbaT7voQAQ453n8adcRGM8TdMu/HHahvYnjzdGxz2dINfh64zRK2MgC
	QypJWej7v4L21Go64pxovzix4pSkB5nyqTvJ7+VkQgpiFrRYdImwAGqGbOcQ+MQoDoHFIW3nM8q
	mPuYZb+KW+Syo9KqjmqzeJpnBwftR+TZV1Z6aSzkf7ory34uXaD9mIIe6fLo1GaMuQOuKND9TCR
	AEvhlgdiXoZzdKEosEyk7n/byihf/+3YEErkpHocVpVTTkuXmjFAE7/DxywtpCU/ExrUudhJSNL
	vLuimGTGRQ1lj9xjfQ7zUT1BZDWjkdNjpnQsbSEiBy4jOfboA2v0DQ==
X-Google-Smtp-Source: AGHT+IE85PIBxK9BhVU/x/KI0RrQms2pQehG4YNQW5+T5gw2lqM1ou911eVGCkuqsLIKCD/n+FaA7g==
X-Received: by 2002:a05:6a20:7488:b0:1f5:931d:ca6d with SMTP id adf61e73a8af0-222d7daa533mr2598669637.1.1751425949595;
        Tue, 01 Jul 2025 20:12:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 05/19] linux/cve-exclusion: update with latest cvelistV5
Date: Tue,  1 Jul 2025 20:11:50 -0700
Message-ID: <9e3bff5413a55675ef0ff9bca0cc8b87668dc255.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219759

From: Peter Marko <peter.marko@siemens.com>

This is preparation for fix in the script so that next update shows only
entries updated by the script change.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 583e9f15c01555863ae467c7f91729ce85aae194)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index a25cd3adaa..24d5631588 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,6 +1,6 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-04-25 11:23:06.829517+00:00 for version 6.12.23
+# Generated at 2025-04-27 08:54:24.704112+00:00 for version 6.12.23
 
 python check_kernel_cve_status_version() {
     this_version = "6.12.23"
@@ -11860,7 +11860,7 @@ CVE_STATUS[CVE-2025-22120] = "fixed-version: only affects 6.13 onwards"
 
 # CVE-2025-22125 needs backporting (fixed from 6.15rc1)
 
-# CVE-2025-22126 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22126 needs backporting (fixed from 6.12.25)
 
 # CVE-2025-22127 needs backporting (fixed from 6.15rc1)
 
-- 
2.43.0


