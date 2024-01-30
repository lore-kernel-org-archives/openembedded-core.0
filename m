Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEA0C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 13:56:06 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.18520.1706622961133696215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 05:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WZcpXR08;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40eacb4bfa0so43103505e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 05:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706622959; x=1707227759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpTriAZ36N8dEzreNIf7X/Cx3rTEI2JN6x8VzEjl7Do=;
        b=WZcpXR08rPfzulbjuQ62TME7iZVoWZdJbGuFj/NDuSHTpzXlcznVHQYqaze+5Ry0ee
         CSz39veA2OOsMbrlUc1bEjlbRI7l+LLerZH9dhuZc30q/ug1XktWaE+oWtsCLvSmSGxK
         vOSgh39YjeUlqoRpHH2Ew8YQ5Gc7Pxxyn5UBEQbkzYeOeEO8jjrCJs3SlIAi9oxtqobH
         5Fl9/TP51YLTYQI/jm9j3B3Ivq5Mcn3r3L0j8MJGgmYsVdb4ySMZizBvjggeGjFMc6iM
         1LYibW8VZ07wmuAvo+14GZ+b8+RWJ3p0XGUsr0/QEw6KHaCnI240ROguLODvdcff31qk
         9P4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706622959; x=1707227759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpTriAZ36N8dEzreNIf7X/Cx3rTEI2JN6x8VzEjl7Do=;
        b=wFy8DVZkJuZm4tATOXvj1v+fUJ9wGxXP/c1ijNTImwSvW8IUNeArj1RwQC2el/PtGG
         V1J5hEck6f80SfQQ+azxKEQ4hhhtjJ50hpe3h1C9cty4IqM/lqiwB5eVCRxpkIrkw+KC
         hiSWBuJUiJasuvQwcTiWxH7RsRlrsyCsBfzKSuMVAWhCBuCGlu+M0gsMu305h9rBfY2S
         8p/A/zzu44AIP/l/nlAKnX42oqF+oSHM7LWYZaTiyqXDk7vXELE4wxhbB6Vd+LD2qlK6
         BibVVSQhRR8XHtVKWoC1PHboEQDfKA4O1D3S4XTcLh9q8CgTw47QLV9Sxq7/DCipE5MQ
         MHZQ==
X-Gm-Message-State: AOJu0YykfoR1NdQC+e9TDhGsdZ+anr3YFT0UbBu7FmtQXFiS+u57+Iqk
	5CeB+s3jm3sitzAE5zkl8dchctH9h81OejRz9Nf/ik3P3fRTkTNVJ2PPZMx6
X-Google-Smtp-Source: AGHT+IGrZvdh6DGPQO9LUn0EzE7W74nNiNFoNT9CTwCMCQFTq1oxWzt8g9j5R/JXlS8hDbpSLDyVpw==
X-Received: by 2002:adf:e4c4:0:b0:33a:e838:7184 with SMTP id v4-20020adfe4c4000000b0033ae8387184mr5344877wrm.2.1706622959293;
        Tue, 30 Jan 2024 05:55:59 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id v2-20020a5d6b02000000b0033ae7d768b2sm7080756wrw.117.2024.01.30.05.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 05:55:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] selftest/SStateCacheManagement: do not manipulate ERROR_QA
Date: Tue, 30 Jan 2024 14:55:55 +0100
Message-Id: <20240130135556.4104447-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 13:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194492

This is no longer necessary as selftest enforces buildhistory disabling nowadays.

It is also a significant contributor to slowness of the tests:
they work by setting up private sstate and retaining autobuilder sstate
as a read-only mirror, and if the needed objects aren't in that
mirror (as particularly seen on arm hosts), then the whole build
stars from scratch - and then is thrown away.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index f7632286450..fb97243bf5e 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -270,10 +270,6 @@ class SStateCacheManagement(SStateBase):
         self.assertTrue(len(global_config) == len(target_config), msg='Lists global_config and target_config should have the same number of elements')
         self.config_sstate(temp_sstate_location=True, add_local_mirrors=[self.sstate_path])
 
-        # If buildhistory is enabled, we need to disable version-going-backwards
-        # QA checks for this test. It may report errors otherwise.
-        self.append_config('ERROR_QA:remove = "version-going-backwards"')
-
         # For now this only checks if random sstate tasks are handled correctly as a group.
         # In the future we should add control over what tasks we check for.
 
-- 
2.39.2


