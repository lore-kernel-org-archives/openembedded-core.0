Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCA0C44502
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156322.1783358259582436435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kdupd8UD;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c7902f47so19942505e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358258; x=1783963058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwEQlU2uHY5IggTekS4nFCEnafRO0Vxda2cKaguwuXE=;
        b=kdupd8UDVRemUeO32GL6ih/6nXz96A2hRTnIxVVZkKaDbeG74nO4bMtN5wNvgkejgt
         A/NO4Fbo2NTxmDLCrCP8oAyMBc2KXYD1MfDvgrUriTDQBUY7DUjsSwmfCU0CCqA5kAD5
         bEwhgc/Bmd5DAfxacFxTdX0vlX1aj5dlcXiHV0RvWttjmEQpByE3OhYZn8CD0Wq1jwvS
         6qT/dzdgwITujWo6Pb/adYYojtoVyAHR2R8Z/Hcpho6UkHxcQFPq9DU8+EqJHp26TWT6
         m7cUWi1M7ogWwvvZS6xeVW91R2A02cwhzIyXubvjCTA06WErzc4a7e8b7ySxTovhJL5j
         +RPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358258; x=1783963058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RwEQlU2uHY5IggTekS4nFCEnafRO0Vxda2cKaguwuXE=;
        b=UX+y39xxMNxpys6ljo4HuIUhPXMARKACaO9Tlrh7ZsMD3Iw+rm0EAtWKy/GGZJU6Rp
         oV3gIha7z+o6n/FSswSxwI7EFXa25eY4wSdPaxeEoUK/t2wIeQUO0w7E2FU7419ndcDF
         OHxInGcbhT/TJjEvgIBk1Tv+nOu/tTrlCfHCTka5um52gaIv50G9RjElfAy1oj/+2daD
         PFOLJxkYcG81Kb4GLVGCb+78/BNC+Kr7OLLh67tWiIBZYLDmtG5d/8+pcTy1KxHRzUJ7
         vot2qzIHeFvqemDw1ObCkVCsiZLrqaKWiGOud8/n+9z6ZFeHTZwcPg1s7QPDHD8ZyHp3
         L0BA==
X-Gm-Message-State: AOJu0YztfK9WwpYhZBo3hiw8uZIj3gYn0iazzWMyXE71nelhyjMCIC9q
	IzSs2UOf9XkR9JQExcGSobwayFL2b8oIrTkHOMlcm/zzrKkPb+R8IJE4Hh0GQQ==
X-Gm-Gg: AfdE7cmJBWQAOV9Iu0/nCNIZu0BkhzlBesHjxkEGkObru3yOIKUVX3tjrhdoi/yZ+M4
	Q8VeA5/SAF2BdxUxF0N4Dx5LkvHIlYKUfAf6heeGi71jOUyvx0ZA8Epe8lm/yPkFTT9PDS9W3k+
	6fDeSpZxqvplZ3xbHX15WHzz9LwZlmBdCNQNjRD1L9EKHIX50Qkp0BOGWCSv4nSdalJRs09Cb46
	u6BmL8QDPl75CgW5ao5tZEQmFEG+ZNFqtNU3KPX7KzwjeznG59pX3BE3dCBiT+HbZ/6cBuTIJMi
	82HZspE6kOLUGJD8DGbHvklwKRdNRo1mXWTHQBe/rhUIJBQUiZMo4hCEcBCSQYElgsvjFuFPPrQ
	gL8hLfi+EC3GuDmw0vlHY1JrxyvsA+7yZwJR7UWUvGRf//uaR9KRnXC4W9ePGTfrQl2VeWt+Xhy
	AdYYQ7VLIslFzVqrpIYHVjTN17ooDVIvKz7Nu8Yz3VWRrgXXWJHec3Gbcma2E=
X-Received: by 2002:a05:600c:8b17:b0:492:43d2:9e6e with SMTP id 5b1f17b1804b1-493df04a73bmr18266535e9.9.1783358257757;
        Mon, 06 Jul 2026 10:17:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 37/45] sqlite3: upgrade 3.53.2 -> 3.53.3
Date: Mon,  6 Jul 2026 19:16:51 +0200
Message-ID: <20260706171701.70536-37-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240323

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch        | 2 +-
 .../sqlite/{sqlite3_3.53.2.bb => sqlite3_3.53.3.bb}             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.53.2.bb => sqlite3_3.53.3.bb} (74%)

diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
index b4231438cc..dc49a3731f 100644
--- a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
@@ -1,4 +1,4 @@
-From a324ff380e6e83141f37cbee7b89e87282deb349 Mon Sep 17 00:00:00 2001
+From 7c6c5749f809eb3fd50fbaabb4ca6379968b3c5e Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Sun, 12 Oct 2025 23:32:46 +0200
 Subject: [PATCH] Add option to disable zlib
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.2.bb b/meta/recipes-support/sqlite/sqlite3_3.53.3.bb
similarity index 74%
rename from meta/recipes-support/sqlite/sqlite3_3.53.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.53.3.bb
index 38045f1604..655f3a2b96 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.3.bb
@@ -4,6 +4,6 @@ LICENSE = "blessing"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "588ad51949419a56ebe81fe56193d510c559eb94c9a57748387860b5d3069316"
+SRC_URI[sha256sum] = "c917d7db16648ec95f714974ace5e5dcf46b7dc70e26600a0a102a3141125db0"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
-- 
2.47.3


