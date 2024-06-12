Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F377EC27C77
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 15:09:27 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.877.1718204966358502123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 08:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PzKmUUwb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42172ed3597so7302105e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 08:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718204964; x=1718809764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VeuVzIcXuozm25F3muUP8Netnlp3YgzKl7HoIouL0IU=;
        b=PzKmUUwbser8w+u61YRWPHqR81JweB3bnxSkHgOcvx1UcT42BZeplyQoID0s2/9O3F
         b3br+cb0VOikiX7t4Whqg7aSiEhYaQUGli8+FgjhOHCrFHfNZ3Zec8IP5i5LJmjwS0Sf
         SwCCcHCPn3x/7Q3c/XkT2YnvLfgieZvkXaKCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718204964; x=1718809764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VeuVzIcXuozm25F3muUP8Netnlp3YgzKl7HoIouL0IU=;
        b=fCph2NrQItsbuutJy2fWtEAyYMOWoZlSypw8wLxoRbGNX6sirNAwW2SW7DMCQNHFcC
         cHWoTaA22ukcw3spuhU+yXdar68oEXxGSSIZPxJ+4mPYK8Bz0IGHtqdtTD+KjxcYj3nT
         K7zNNN6NT9TGcwKK4Gh2Zf5q0PHIFowt/zr5dxSLwICSwYvYPdZZrTD4KXGavBfVHn5U
         zINoXBq0c8kP5ebMC9pn21vukrJbD25WvVmVl9WqfCC1MnU0/KaIInAblGmLQllqo6kt
         7o3QOkqc+PlD/gJiL44quXlHuh7SIStJQ/qrJotB0ijPnuIGN3iU4MBpz6P2m72srUOL
         3qmA==
X-Gm-Message-State: AOJu0YwO49XcyNy55hELrdzcUS2QcxSCtVzxciNuL0VPFTzlcl6KVaoR
	6qohWPMOyajDnlB4aqXahmz2EG8KTkn/tcehHhZW3qDBpOeuVgCTmYsXLXsw89WjtiDJ3SNJoRZ
	t
X-Google-Smtp-Source: AGHT+IGkDa5JwY/7DicROsvRL1JP3+RUwABzQ9a7m3AEa7cQYJ/eHH5iB0SJOA/zouFWs8S12wwo6Q==
X-Received: by 2002:a05:600c:1ca1:b0:422:1def:e1ac with SMTP id 5b1f17b1804b1-4223c92834emr52113505e9.20.1718204964394;
        Wed, 12 Jun 2024 08:09:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c2e8:7191:b6d9:616d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286ff3805sm30188665e9.11.2024.06.12.08.09.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 08:09:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/spdx: Fix for SPDX_VERSION addition
Date: Wed, 12 Jun 2024 16:09:23 +0100
Message-ID: <20240612150923.822508-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 15:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200575

Update the test for the addition of SPDX_VERSION to the deploy path.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 05fc4e390b2..7685a81e7fb 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -25,10 +25,11 @@ INHERIT += "create-spdx"
 
         deploy_dir = get_bb_var("DEPLOY_DIR")
         machine_var = get_bb_var("MACHINE")
+        spdx_version = get_bb_var("SPDX_VERSION")
         # qemux86-64 creates the directory qemux86_64
         machine_dir = machine_var.replace("-", "_")
 
-        full_file_path = os.path.join(deploy_dir, "spdx", machine_dir, high_level_dir, spdx_file)
+        full_file_path = os.path.join(deploy_dir, "spdx", spdx_version, machine_dir, high_level_dir, spdx_file)
 
         try:
             os.remove(full_file_path)

