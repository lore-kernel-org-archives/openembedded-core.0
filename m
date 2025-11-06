Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C51CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 11:47:17 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13259.1762429631534555289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 03:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bGyqjRSY;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so835024a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 03:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762429630; x=1763034430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TdJkI5GEihK4r/u+btn6RDosClKzBPdbktBkT395+Pk=;
        b=bGyqjRSYSKJs52WU7qX/ahocVfuxonJAj7xyFqP/GbuydE8Bc3Hv+Pm4SSYOGipXPf
         JB8tbtgbpmR+fH5zgzWnQe8qMxRI+QQ09HtdkvLxuTmn1ld6L/VZ9ALPKj9/9yqQYTxX
         wuVBoBsabUpC9ec8/R6ch8AkmZM4XPiTBkxqGMr5VzCob2f74JG7u3RiZ7ncmGXsPqC3
         LGWLuj/7Qu10R/u8ItPVqtf0jgAMwrNj9YUaQ1jVQM+uzgG1PZHXFXdfgec1910/Zrp8
         KGpjJ6iMbD4OFYixEDPRJQQ4iDpcTMCeOzRhPllZFxpxZc6XCqkohHJ/X2c9FyH/TdTx
         iYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762429630; x=1763034430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdJkI5GEihK4r/u+btn6RDosClKzBPdbktBkT395+Pk=;
        b=BgwZdTXaP3OahFHEG5yZl3dlInKWqhFCw0Lm40+cnucZRlvrA93fpF7AqCwPUzASrk
         InOHEGOvtqsTTizLbUAubFBlfDbdCfQ8AkDLW8mgOT6qNBXDDzfEW/tLWQSLSDCWbZG5
         rUvAy1abK0/nTvxZT93/xpmHpDl5j0+5oWBYF92ZmAewsIMFAI/Ssc1w5HK9DkpAPb1i
         5aMM6x+gUmgWChxs8ZfA2VmLXxbNt22k/q5oWUjquFaAoRVTcrk9qBU3fJhyt4VjMaRB
         sPgMwVdXkpdlmU734lkPLTTf+PFO3wCC9lRfZiKWpNG9KDijKCExoLVQj1x7NOjHgo6s
         2MUw==
X-Gm-Message-State: AOJu0Yz0jgoFOCJvXadS0c9IioMGQU/HHXVpTimFHcGSO7n1bka+TktL
	xgmP8J3cBlsVpNveRvIu1/kmktaJ9mzHbk8it9HnFHngGZU8t4j0Oj/Weknklw==
X-Gm-Gg: ASbGncsuJWU41Xe+1oreKIsfVrc1VzVejeueRbVly3bnVx+UhsW57rIuDcVqem65CFu
	63gRn+l/vRlPhrCG8CKAwB+knhTWkRegcBuphZPGNbUhMU7aFBs/XbnQmsm3mMq+cc9o5+65QPM
	JdoBkE0tZk5P4Do6c/eP1dO7Oh8b9c2CppGh7CHSOz4R+9jNKs1nAvbEqEIwlVEUHItVEfqR1Ao
	zBBIC2hv5PAfHnfrIZnU0gWDNofFf0uwIfiwL1MFxCf/TdA58CzUPcUeBw9yO4f1Ncy7T8BuDZ8
	//dynYJ/W6J0S2K8pmm0+9vPrV6sGLpP3HWxeUBedc6/vny7Z4KMMBBlwF6RlnMY34mSHgrTIJE
	l7/AaTLXOJvdqOd8/yLr0I5Wx7VHbWvD+57bK+YbJYDSsqoO+8BMoe0YNZd9Tl0Y/yn1cZsCDiK
	YzX7sIEUXUONmnVHIXEVmlXTsBJi095kJmwXQOUQkmL64sDd8=
X-Google-Smtp-Source: AGHT+IGeernl2mjiyVRhyvbP0hxLlxrk0AllvBUca1q7Gu6qWT6P+jltjHQ/sKb94D2EAokD1/3vRQ==
X-Received: by 2002:a05:6402:5211:b0:640:a836:eacf with SMTP id 4fb4d7f45d1cf-64105a5cc3emr6321506a12.26.1762429629622;
        Thu, 06 Nov 2025 03:47:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713a68sm1646901a12.2.2025.11.06.03.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:47:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] meta/files/bitbake-setup.schema.json: add a definition for bb-layers-relative-to-this-file
Date: Thu,  6 Nov 2025 12:47:02 +0100
Message-Id: <20251106114702.918327-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 11:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225976

From: Alexander Kanavin <alex@linutronix.de>

Also, adjust the description for bb-layers property.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/files/bitbake-setup.schema.json | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/files/bitbake-setup.schema.json b/meta/files/bitbake-setup.schema.json
index 5101b0de53e..c63bbe5a5b1 100644
--- a/meta/files/bitbake-setup.schema.json
+++ b/meta/files/bitbake-setup.schema.json
@@ -39,7 +39,14 @@
                             },
                             "bb-layers": {
                                 "type": "array",
-                                "description": "List of BitBake layers to include",
+                                "description": "List of BitBake layer paths to include, relative to the layer checkout directory",
+                                "items": {
+                                    "type": "string"
+                                }
+                            },
+                            "bb-layers-relative-to-this-file": {
+                                "type": "array",
+                                "description": "List of BitBake layers paths to include, relative to the configuration file",
                                 "items": {
                                     "type": "string"
                                 }
-- 
2.39.5


