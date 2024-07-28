Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F3DC3DA49
	for <webhook@archiver.kernel.org>; Sun, 28 Jul 2024 14:49:17 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.35729.1722178148879085059
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 07:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SJSva0iS;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fd70ba6a15so13633075ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 07:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722178148; x=1722782948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5poF4iobFItKXfxtm4jWQs5vUtY2dkgyWiJamYfXCKg=;
        b=SJSva0iSQmxgIWFHINh5PYiXjVubqUsOtuyQo8XM75/fQBo5WUgImt4uhfRzJuJ2qG
         3WOzIm6OGLVR8kGwXdVft0BRk+qzelbOBdBwTX7QAfMHSoiPjosABiBm+Z5iZkSMNkTZ
         W861eXo/SLmV3QnTtz0QoVOwa3wreLpP11d8gTxZrozlTYIBifAvWej/fHVBjRV1/dt/
         AGKPM7BDctnGEIvbGPbV40vq0r5shZ194K2NxGQxqU7zIGww/vHZ57/TVfnJNlNsfNFR
         f7MnHvZ+NAxf3dlPiq4eEnNWudg0IA6bWiR/A2UIQe5AUhGHyS8DSI0Sl3ekOk3a9Phl
         54uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722178148; x=1722782948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5poF4iobFItKXfxtm4jWQs5vUtY2dkgyWiJamYfXCKg=;
        b=OE6aYmJpvhoTTCXTMgStmF2om2AV4o0bVTo6yS6Um6KRvZb8yn6bVVe8WfytdQ7ztu
         EAZuMZiyJRcOyWpeCNwzyNjhsPlUg7W5OrJLyvZ/XELBksQTybXgubBvwFjHJs7VMQgO
         HwcDhX4g5UgJtN+ZvIxeIs0YHdyD0iIc+KTRvhYQbXOL/dmTkMJM4wmVxHYr5sKeIdbA
         4ioE7nTjYL4w5osZ7j1JNv8lPHGYFpgjr2aDIKAihSnkH4kiqcqaFYLyD0EkRkoDt6Ny
         I+xsErx11oc6VD7z3MWgI2b2A8K9BwhiXmuCLbxq31sZTcNbeSmPViU6Bxl5aRttrPDX
         2pUQ==
X-Gm-Message-State: AOJu0YwyB/Gh+bFzK2c8NWWthGOsEClbD3AsKlCGnTH3VEXRKy3i1niK
	GNhivN9NNbQR9wvp4bKsUPDA2LLRCaKrzLmIsRNBaF/oWlaZN85wRuWhq1Nc
X-Google-Smtp-Source: AGHT+IGjJD8NyaUMxFwH1Ah0Wf4euKi3foOvHLtBSZgZhaC/66kpTTFLI5SLDbM6b87UOUUw1beZYA==
X-Received: by 2002:a17:903:234b:b0:1f6:fcd9:5b86 with SMTP id d9443c01a7336-1ff047eaca9mr39010085ad.12.1722178147828;
        Sun, 28 Jul 2024 07:49:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee1263sm65957515ad.122.2024.07.28.07.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 07:49:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libyaml: Update status of CVE-2024-35328
Date: Sun, 28 Jul 2024 07:49:05 -0700
Message-ID: <20240728144905.554155-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 14:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202569

This is open yet but seems to be disputed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index 4cb5717ece8..2d6f27af1fc 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -18,4 +18,6 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
+CVE_STATUS[CVE-2024-35328] = "disputed: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
+
 BBCLASSEXTEND = "native nativesdk"

