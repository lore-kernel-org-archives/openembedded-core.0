Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48A0C47072
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:07 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.151492.1703864705867304746
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3Nld4xcG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d3ef33e68dso46420285ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864704; x=1704469504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ih8n+OeSXgIDyjRnrwaQ6dAUIAmZ+05E2rGPFPgi92Q=;
        b=3Nld4xcGmHMru0ny+7fgSkUVN9WwnatXlTjRF3W8KZ8phKuzKN+Re/gGDGEZ80F/e1
         DqGmBDRfb14keQsW8ihXPZHK2K0cWsYRKc8lG2kvKYOQ41H3t2NAQmAJDAKSFuAM54ub
         D+z3ngXqTzztv/YewSUug8IHnHOd8LiBzOINdD4jPD/wqs/GFs3Vg6JUHHmbPF2zaw7l
         SgPPsuGed/gWiv8tdHqvh1z6H5DQTHEvs/P6gY1hb+baNU6UhL+kuj7xRWFgS4NzYsxa
         ZdcOtLQfmnM8ObTSOWdCKm9SEh/kvZ/OEATfYBdyjLy0BSQbkgfE8wZoa2w5MGIKcZos
         x68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864704; x=1704469504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ih8n+OeSXgIDyjRnrwaQ6dAUIAmZ+05E2rGPFPgi92Q=;
        b=V0n3YaMdWTiarKcieBCPRfgDX5txuAYOLeKwrqs5/GPs46T1XHuZ7BlQh4ETgI2exm
         vYnMDFpcD+6uyc7hyVXWDSfbAY8uFFrHjqLJ2HDbcn/J09P9wHsZZZHbpNI3vPbTjnsn
         CuevCCC639m05A9p8USw+OumS6t3mvPdZI5H1kDfSDym1GrSl7RATzePsrp2hgQNE+SW
         CuqdXLcB1p5xjYIsFlgvxM3APlFGZG6yIAOzHE/mNrDdtp2oP1AJj2x1NY93z7p1lSP1
         U17BZuvwLJumfb39Yjp/hb+cVC8kgMAWcpYxVdUyGWBeihDUhoZSLSVxi4qWdILKH1oD
         G3Zw==
X-Gm-Message-State: AOJu0YzxF+K33M2gP3q/lqBgKcwJwIqiF7V8PH7jg1pts3QrEuEHyx3S
	/Gbifqua/0YkJWfW9Y/YxuFfd9Xz0cRJy6YAfcBavNVwlDYthA==
X-Google-Smtp-Source: AGHT+IGsyH+wVCYhuVMQlBOX0uvX5ezUO3ISzK0SDEAP2UyahCTa1ofaWYJ/RcjINsBDGQTTtn47zQ==
X-Received: by 2002:a17:902:ea02:b0:1d4:3af0:866a with SMTP id s2-20020a170902ea0200b001d43af0866amr11908489plg.21.1703864704536;
        Fri, 29 Dec 2023 07:45:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 01/41] cve-update-nvd2-native: remove unused variable CVE_SOCKET_TIMEOUT
Date: Fri, 29 Dec 2023 05:44:15 -1000
Message-Id: <5e545e1226dbec48e7c60735ec5969ec0e356f21.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193018

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
index d0321f1bb5..08895013cf 100644
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


