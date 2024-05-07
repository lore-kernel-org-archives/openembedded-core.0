Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E4DC10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 22:47:36 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.2868.1715122049435610432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 15:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UFN9g8El;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41b782405bbso26183905e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 15:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715122047; x=1715726847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=w0fA8lE6jK3C+E7BzUV2nBEsjKf7YL7lNv/GJGIwqSM=;
        b=UFN9g8EllAxybnrmZTmQv5KFpb8//AXX1EqFiKAvMOwptKBVXcf57fY5uBpicyFKpC
         2ZjzobSM/izN+FzGio6RxomO6w/JfmNvuYsA346R6yK9vVBE46Ca5zakNsclygUWjMZc
         qXfzeeKk7EoBXYVkThC11lOq80sFcgzv+iQsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715122047; x=1715726847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w0fA8lE6jK3C+E7BzUV2nBEsjKf7YL7lNv/GJGIwqSM=;
        b=D4ob1TIX8T0cyCiBZ+fj6wOjIGOTc2fAIH75cqEsHGZtRFdWO19kUj8iBoEmwzPONR
         NHHp6L3+Y/Azu20TeJw+5NZe8+U35sEKiESK2pq24DTbyvKSN/2kiShPUGTTMGA8JUbY
         bva4WebxKYgmaEr7ML6gAJBxNZTJ3TQYfHmZPi98eODvqNcoFXdYmBX/NAiePj0sEWig
         8k9xZMcN0eZMvuPbnZKCGq8eUo5GaVS04lZU/TJs/3INXfR9PjeKejeHyesNKCYADlxV
         llABm6nDIiGelJvDdb2OXaeaDFh9zZlRRlyjsJ4wagnI9MG+gncZK8Ibb5GgnYvZ44lu
         4OJQ==
X-Gm-Message-State: AOJu0YxnwyOBC9bqvXT0MW6Z6QYt1toCukVAXGsPlzM4RD0bxXXhAfFv
	eYAopAdQONwptzr1QIMXtT96ePpY609KZ3ew5ZfPn8zDkHfaKtG7JCD+DTSJtSoJ6DVfFKC/GEf
	/P7I=
X-Google-Smtp-Source: AGHT+IF1Q/nrf0uJPEC3ccFYAUAc0JJY9+SXLQ2Cd3v2eV611Fq12RZcY5Vv6u6h8vVWOOMlg6BkUA==
X-Received: by 2002:a05:600c:4f16:b0:41a:bdaf:8d6b with SMTP id 5b1f17b1804b1-41f71accbe9mr9176035e9.34.1715122047602;
        Tue, 07 May 2024 15:47:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5b88:fab8:c8fc:9dd2])
        by smtp.gmail.com with ESMTPSA id t1-20020a05600001c100b0034e0a3a9e14sm13857217wrx.75.2024.05.07.15.47.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 15:47:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/devtool: Fix for usrmerge in DISTRO_FEATURES
Date: Tue,  7 May 2024 23:47:26 +0100
Message-Id: <20240507224726.3796162-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 22:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199109

If usrmerge is in DISTRO_FEATURES, assumptions in one of the tests would
fail. Improve the test so it works in both cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c8f9534e416..882225dde34 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1773,6 +1773,8 @@ class DevtoolExtractTests(DevtoolBase):
         # Definitions
         testrecipe = 'mdadm'
         testfile = '/sbin/mdadm'
+        if "usrmerge" in get_bb_var('DISTRO_FEATURES'):
+            testfile = '/usr/sbin/mdadm'
         testimage = 'oe-selftest-image'
         testcommand = '/sbin/mdadm --help'
         # Build an image to run
-- 
2.40.1


