Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8071DCCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 08:01:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6665.1762502462547408943
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 00:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WavBThPB;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47112a73785so2496705e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 00:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762502461; x=1763107261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b7RgywcNInkkeDgHM9mELIkf4+qnPYpsS0z5wp4c0o0=;
        b=WavBThPBoemuVCoh+QXkT+KI4TPb0a3GYDdIjLcLQcGoUAyO7LqHVL/QdmfVqU4eVK
         PHhuKIfBc2T1wwUkHT1pMy8qRuse+VNGVMHlaafGJlCiLIWyMlDgLN/ZQX+LHb+rBRTz
         IC3T+egTIA83kXTqH31h+Y936AdpHSU0cQT8GT/LeGqdkPW2Xr7aIAFXO4UMLjEMUTWF
         FC30+n2lfP8srfjsh/rSoXkcSJdj22SwDfm9i6MPYgkczuSvTOi7gOK7I2adogkyTg/y
         Ya9m344J8qBtRiyRN+y83Ltr71CuEPvO4bJ5duKfVtFT+FBaL7tr4rBM16zIFnL/6Iaz
         ZBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762502461; x=1763107261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7RgywcNInkkeDgHM9mELIkf4+qnPYpsS0z5wp4c0o0=;
        b=BYopCPIYThNJXNhnsH0335jJFStomQJ/Y9sWqJZQFbPH2ZACJjSgqGW+PLbjokmuYr
         wpelN5HjYKxL2SlNVm5MEQoU/ELd1vUHvGUlEXcB89IvtNgi7p5DjwE0yliXkgoYy1u7
         8hyMDAXBcb71Q1mYqWJBOifZXfww0XfVuX42Btx6iDJ2aYASkGmciPZVBBWeQ1XXFAjz
         En+7i5O81xobmuGCZN1mdFXda3nWQHwMGd5lfHxvi8967v3R+zBCeN8sn2ZVMh0iXECz
         ayGDJh8JPrvsMydJk6GZk+S9Fa3Rlf3FbquB0uaQ+/lREhfU2bX5+p0esvcEs/LF3xhJ
         uaEg==
X-Gm-Message-State: AOJu0YxtvWCU1cyabiH3EKkEx7UsBExn4Zco819d/htENy+/g6QykXPf
	NlbCqzPGxJeAB4X7sDjV1Y++INh0BduSJPAIkzViIWkSbuT709humuQbcpJ2Fg==
X-Gm-Gg: ASbGncuGNyBirxD4VFXgIahuWgIw7NrJQn04S0qB3NSQPztNu1JjguO58GAprRARjDs
	RqijcXlpVTj/JlUBmxe/ags+t3bS6yVqXaDaKprNlFghZWx4h85VipMMn+FS7tfjfObevjlSGWm
	+fhuKVAEFjTc99ot6f27+OL4D7lq0oIW2duT8LG+MP9ZAUQtmHOClI+e1rKcx4D4aAF1EB4vq3L
	cfVqeSvtQljKj/dIpzyD9+f27zwbZdccgCznoMHXz6p+YVOqcR+yiaV/ie2MV1QCS2RYwluulI5
	Q2tTspzKNw/KdjbLheVTN3VOHJzWHFWJIpLr3eFMixW0K8rk/Oz3FIr6thQdE2dzxvuYbLd+M4x
	YJFow7a4exY7zk8dJt/MjOA7mEegerv1V3la70uhRdUXxjgQ+WPQxUFiNNZiyzakrT73cnzmNy8
	J4qYO7DrCcGheK7VJjfB3+UyzQx//zNM2RhAsHAGgxcMBpHKc=
X-Google-Smtp-Source: AGHT+IFsLAPMSOAuWJ2PqtAmE3lounMtReOqfs1t6dCzUF4e13km1BIYQkdkO0G1Hf4VVExvLVq2YA==
X-Received: by 2002:a05:600c:3153:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-4776bce1b49mr12965845e9.24.1762502460339;
        Fri, 07 Nov 2025 00:01:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bccd41bsm33132115e9.2.2025.11.07.00.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:00:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] meta/files/bitbake-setup.schema.json: correct bb-layers definitions
Date: Fri,  7 Nov 2025 09:00:56 +0100
Message-Id: <20251107080056.2599873-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 08:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226017

From: Alexander Kanavin <alex@linutronix.de>

- rename bb-layers property to bb-layers-in-sources and adjust its description
- add bb-layers-in-this-dir property

The rationale is that both properties are relative to their
respective directories and that should be clear from their names
(without being too verbose).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/files/bitbake-setup.schema.json | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/files/bitbake-setup.schema.json b/meta/files/bitbake-setup.schema.json
index 5101b0de53e..72d56f8ad8d 100644
--- a/meta/files/bitbake-setup.schema.json
+++ b/meta/files/bitbake-setup.schema.json
@@ -37,9 +37,16 @@
                                 "type": "string",
                                 "description": "Human-readable description of the configuration"
                             },
-                            "bb-layers": {
+                            "bb-layers-in-sources": {
                                 "type": "array",
-                                "description": "List of BitBake layers to include",
+                                "description": "List of BitBake layer paths to include, relative to the sources checkout directory",
+                                "items": {
+                                    "type": "string"
+                                }
+                            },
+                            "bb-layers-in-this-dir": {
+                                "type": "array",
+                                "description": "List of BitBake layers paths to include, relative to the directory with the configuration file",
                                 "items": {
                                     "type": "string"
                                 }
-- 
2.39.5


