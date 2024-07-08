Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E53FC3DA41
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 16:56:29 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.85139.1720457779913612474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 09:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V47Vqf+J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ea2ce7abaso5514867e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 09:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720457778; x=1721062578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QcapPhC/L1EvItCV1M5J+uQF88Jnimz1lzSJT3DMb0c=;
        b=V47Vqf+JyYvn7e6pYM1M69GF50hUk/x0Pfcso94XJcD5/VqVrJ0+tZEZLnECd75YzC
         PFLp7UoOBp5fTvfbDgs1E5xdoPuXTk4hnHrFJaztDosZZE6MfkclY/WNW5J/TUsZjmC6
         XBKB9yWdzKUDweKXCTrWm25zG7Pg0KBggoUhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720457778; x=1721062578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcapPhC/L1EvItCV1M5J+uQF88Jnimz1lzSJT3DMb0c=;
        b=D980q/ZnPxZesyL54q4/jLesgJz5UTgHs5smB/jZ0fQMzcYOsk5BcksFK3i0FP/8ai
         qX6vwTkTTgVjCGI67vmYUmiRVDyOSHognjatka4rga3xVQQHR6Asa1MMa4xy3tu3rxeD
         q5Q+uxu+hH+mttHqqYpL/RBRwY7WJK5w9wYs1e8wItC5t9gPkOg0YQZmwWp5u5nwvFlK
         rU6Ck0BQcPr/4lAKZIcQX+rbM/AdVhlCtpSZE5dTeNfwVJdASIv9puzz8yBEvp5zg55C
         FfA/FvgwqCiUWTAJbr04ceKxdLT8tflSZNBVr2C0jJr2NaE/ebas90iKQuCtLQtOOfTe
         n1SA==
X-Gm-Message-State: AOJu0YzGLKzynoZmRfLwNBz9RRkoRMlRk+vsNJHz4ioN+DTIVaELpp+a
	fZnUJuFTicbfiNFOo+9UvVo3ysliltr2nlbyJvQ5w6m2WS/QP1uMXZD2Pn2lFbr8U4fIXTOglDQ
	V
X-Google-Smtp-Source: AGHT+IF1ka+K0WAGvIv4v3Um/sma/ixNbr6YXVNGIKzDNexJqNBqHFE1sT+n23caRxPnKX2BEyeWIw==
X-Received: by 2002:ac2:5630:0:b0:52e:96d7:2f35 with SMTP id 2adb3069b0e04-52ea0631700mr9114829e87.24.1720457777757;
        Mon, 08 Jul 2024 09:56:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7de4:636f:6569:3199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f737b1bsm5469605e9.32.2024.07.08.09.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 09:56:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Peter Hoyes <peter.hoyes@arm.com>
Subject: [PATCH] testimage/postactions: Allow artifact collection to be skipped
Date: Mon,  8 Jul 2024 17:56:16 +0100
Message-ID: <20240708165616.349661-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 16:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201635

It does not always make sense to collect artifacts and data from the
target on failure, e.g. if testing firmware or if the target is not
running an SSH server.

Allow this by setting TESTIMAGE_FAILED_QA_ARTIFACTS to an empty
value.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/postactions.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index 2a08129d6c0..15f423218eb 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -86,6 +86,11 @@ def list_and_fetch_failed_tests_artifacts(d, tc):
 ##################################################################
 
 def run_failed_tests_post_actions(d, tc):
+    artifacts = d.getVar("TESTIMAGE_FAILED_QA_ARTIFACTS")
+    # Allow all the code to be disabled by having no artifacts set, e.g. for systems with no ssh support
+    if not artifacts:
+        return
+
     post_actions=[
         create_artifacts_directory,
         list_and_fetch_failed_tests_artifacts,

