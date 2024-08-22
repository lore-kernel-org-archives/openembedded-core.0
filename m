Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9567C5472C
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:51 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.9518.1724319344056058894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nls57UBu;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bed83488b6so887478a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319342; x=1724924142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHzMOzWpZrO7jOk+iVoTCChzw8kfScmtUvufkHudGfo=;
        b=Nls57UBuHsri9k7Wkw2nj1ghT6voiHTG/7reW4HqnWzTX6zPQrplWtIyaMNYrU+30w
         fZb6jVXhvrt0yvDJCPECYiMEamdWtMRRAag76m6ezuPhbHlmoChMhm5OkIAJ5O3UZIvp
         DD/hmBs8/3EA4hUbOwAzVXXsR3QMAEsOjNwGItS8nf0OH9j9ITryFFwkvMwZcmYxytn3
         5Ct5zcmBsFSzdLcCidL0/UcIorYRK2HVFHZiYMlE2l+nlIeT3G20EGDc7eCQisW3Hm6s
         Ail/W5j65T0w6QKZiNc+Ye+JWy85HY7fmteWyn/iLwdjc8kHTN70oJB7g3myqyKkGS0Q
         /iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319342; x=1724924142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHzMOzWpZrO7jOk+iVoTCChzw8kfScmtUvufkHudGfo=;
        b=iF12xpVsHsyO3RbCQyHiDA/9DicBlrpFxP2jn86Fz2jnV1ldI3nAa42scmuxWJE8tn
         S7oGcof1i1x8YAtFiydVIz1bDvw2qaJiht9T967PcHvlny9abtVV43gMaGGjtw46NA7g
         rWacyFVSdNhB0LqrlZ4k4+OWHb02txR6LyZgGky6jHuwyaTfmYJ0dM3+pn2TGH6YovO0
         TuEhG8PKcpgrlM6B+nG9TBR4FirxIOri9gc9onOCGXRj+DpO5U9xs4Hb/WZupvBJOIV6
         zGMCKElb4EgHohK/XdnfzAKMDeA4IZggLkw8//gWTdJvJhv3imtI1+it+nMIwoZ1GddY
         YOGQ==
X-Gm-Message-State: AOJu0Yyj13rI9Ah+qgb4f25lquJ+/BWidUfBiA1Y45hBEd5KfSq0wve+
	NTESBzoCYHlnQytVQZUrcDY6F3vHdmdWqcIYWPzfqUKiAzUlAI8pKD1VRA==
X-Google-Smtp-Source: AGHT+IFWeKvNOdoXcctOB+XQZG5qt7/wsZExmikR5zeUyEYGdRwRrot33Ia3ObukYrJyEhIZce615Q==
X-Received: by 2002:a05:6402:26c8:b0:5be:fe37:41cb with SMTP id 4fb4d7f45d1cf-5c0792b19bamr831201a12.33.1724319342191;
        Thu, 22 Aug 2024 02:35:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/32] sqlite3: upgrade 3.45.3 -> 3.46.1
Date: Thu, 22 Aug 2024 11:35:16 +0200
Message-Id: <20240822093521.36790-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203642

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sqlite/{sqlite3_3.45.3.bb => sqlite3_3.46.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.45.3.bb => sqlite3_3.46.1.bb} (69%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.46.1.bb
similarity index 69%
rename from meta/recipes-support/sqlite/sqlite3_3.45.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.46.1.bb
index 03d70bbd386..62ea4a6ba9d 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.46.1.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
+SRC_URI[sha256sum] = "67d3fe6d268e6eaddcae3727fce58fcc8e9c53869bdd07a0c61e38ddf2965071"
 
-- 
2.39.2


