Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8BEC47079
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 14:03:26 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.23900.1704463404913444701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 06:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qvpH+CKc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6d9a795cffbso430389b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 06:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704463403; x=1705068203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xi6qd1JPF3xPg/DCk1ZF3l4NxD/DbyPunGfZCoOuSLI=;
        b=qvpH+CKcwtlkwiG7F/5badpNwv6nlxm9NlPCEnvvC0rJdwSN6iZ3k1a/IWzpMpyeSp
         jba7VHHULpg7N7Vea020di2Nyl/XtpXZUyg2HJRr0YwfcWV69twnsrmUnvxEbJWcvbaa
         B/RzUKcweN7kYOB5UJznt/3cLP22TrjulvEG0tKpFEVovCvcnApvaapWvsRXMADwcbPR
         fNJjKRzz9OOFmgQUFMPWrv27EpKCLKIrAX7TMt6yFIk3r6Q3Bj0+bX5pmiNsjkzTtLdL
         aabcfuQcpMtcARrYc221LX1+ZAtVcPoHNDieemJGNXgYgswBDUFAIDXETSelPhkO1ylL
         hl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704463404; x=1705068204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xi6qd1JPF3xPg/DCk1ZF3l4NxD/DbyPunGfZCoOuSLI=;
        b=ZiAvFybMya4xwelS9GNftCm7FOHfgjwbkl7MhBzS1tMy+51urAE2qjiE2oAi7REFUh
         waARBUAhwllEu4jVXVwZa9EEjfTvDBC18O5eyEdrgsszn0rz+2tXWFYaEVHX0o5yrhXh
         o7FddRMIXMME5QS3srsjdBDZYrWbtiswb41R5IiXg0refV5Cj2O1XQRSUT6/lqEuI2n1
         q/K+naKhfdhm8N0H+U7IkxQjf88LtE1PZjPCSJJ2ZPtYLBfPoppuzRhfZPb8R+5/akQ4
         D2WZ3TcjFHnHJVoWzJRtcCeo7TOr6RHaLJkq1VAeTiRaFj11FrMqeOqn+feu5ny+ycWE
         QOrg==
X-Gm-Message-State: AOJu0YwdULtVcpxu9mYm2858laPx0Pn1y7/M6J36+ohCE80mpYH6tzW5
	ZJ7FPjcsTaQXYMuJUk51EiEHDlDmQSdpsqqfJZC6Tg0QFoC7gw==
X-Google-Smtp-Source: AGHT+IFE15oNHA7zYtTo5kB5WU6ovI8c1SAgQQV+7vxlHIjb4KeJdIVWuGl/I8/2q8qWYW7+qgJ/yg==
X-Received: by 2002:a05:6a00:4509:b0:6d9:b42a:a6f with SMTP id cw9-20020a056a00450900b006d9b42a0a6fmr2645435pfb.29.1704463403610;
        Fri, 05 Jan 2024 06:03:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id y2-20020aa79e02000000b006d9bcf301ffsm1430097pfq.194.2024.01.05.06.03.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 06:03:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/5] cve-update-nvd2-native: remove unused variable CVE_SOCKET_TIMEOUT
Date: Fri,  5 Jan 2024 04:03:04 -1000
Message-Id: <70676801f1f8fe498ff34fc1db72b6a3bf438d4a.1704463208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704463208.git.steve@sakoman.com>
References: <cover.1704463208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 14:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193361

From: Peter Marko <peter.marko@siemens.com>

This variable is not referenced in oe-core anymore.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 905b45a814cb33327503b793741c19b44c8550b3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 67d76f75dd..64a96a46f0 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -26,9 +26,6 @@ NVDCVE_API_KEY ?= ""
 # Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
-# Timeout for blocking socket operations, such as the connection attempt.
-CVE_SOCKET_TIMEOUT ?= "60"
-
 CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
 
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
-- 
2.34.1


