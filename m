Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B9CCAC599
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 13:13:02 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.22592.1758114777427421731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 06:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jNUm2MiB;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso66021175e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 06:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758114776; x=1758719576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XsDOKWCkV9ibOh5OFKSuPwIAsB/Qjwx+BeV4ifY2WJE=;
        b=jNUm2MiBuRe5ulK/S+uUluny8BRwDWZtnlS7nLdfa6RJWNJU16qZOo5Vcyf603cJEw
         g0FfNbUUzhdJQTm5M9Ir7/gwW3eGFfUhs3ibkoglLtY9w05pt/l2cnzmpNs+5qW7Qnhe
         QW5Ulxch/JbXAKfUL9XEwKGubcH5P+n9y3MXXwBSyv0ffgzoreIKDPFhiG9r1s2yobpR
         4SqufSblfbi7uPUL0/w6MZ3rzX398haCrHlmkf0oqpDmwYMfDuQNoumU/PFC6yi5AlO8
         L34K5Bpv0keKDnrXVbHI2rs/43nTW4GUAmQhPSFl6ia1ClxO7sh6sHl1WyMD99yKoBD9
         ik1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758114776; x=1758719576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsDOKWCkV9ibOh5OFKSuPwIAsB/Qjwx+BeV4ifY2WJE=;
        b=lE+vRpdbKTlQL5olBCgY9rQ3/AkFPmFk+DzbUK7xpC2KvoNcIkeaNTjJPQ175E219+
         3LGqWh6rkpyqKLvq94MY1/URjR/5p4dTJDjB6uumihNiARYfqWV8OxbAECRNUBOtaYUG
         0o96FCDhVK92F4aY+nhwsf+T+OPyXMbwpD36v3JbFYrIOZgbhH+gDM+VVtTQTRdGZRmm
         9fzZ0fP7FvwZUU6Y9fvxisjoShXG7dq/gjCJkSqr4ce4z9ARTI/l2mztfr88LYMcW5kV
         mqvTY/LXguCJdlLWosMV56x/WXnCTBRlAfrQDGQq6rVZffY451Xaju+YUvZS35YCS+pK
         5tkg==
X-Gm-Message-State: AOJu0YwzSsj89SHEbfI0HKggjcU6yejfQd7d6yMyQNbhDlUNwX9e24Gc
	CI4z+YyiKeOA5wSJt275ae+CTdsAEUn1z2fjNUrPnH9G9HbZFRrhMze0+JPQJQ==
X-Gm-Gg: ASbGncsDv4M2i4vG3oRacRckDMa76SA+l+r0iAq8UTAqDQQVseDey9UPnzSMm/4mYNo
	anJMcAFgg6tF2AXjk4oFrgb5VPMBH1vEn/XOVfFaJlE0NheapBjFRYzy8jU9c9k3ZODMQFRg0C1
	8nrWnek5IeegxQ5DoIq5PblzyEuXExOwnY370wzp+Y001jKaCQHoEprRHiPW9JQ2OPdUK6ipEAY
	Pe5QKVvh+NmyQMPCN6RtswojNyDc76JvPTP3WioWpanM+FdOIj1G+bsU4T0YaU8JvNZzbb8GH5m
	F4VK2UFrJX2ljIrJvGRiR6gOArWwzEios4O/GDwtR9vfbiBsTCU1xXndyUUNd5nWjxtABT+qFb8
	WObxU/R3DfL0zy97NCAppyFYXLUxhRZusZTalH7LPQuEHT+NUrM9Rbttc
X-Google-Smtp-Source: AGHT+IHAr+DRFyPlgvyqapRCGQXw7EGeiZ+RT3cWwbtZofUTavRJx++iR1Pei10LmJDUegULfVXUsw==
X-Received: by 2002:a05:600c:1f13:b0:459:e025:8c40 with SMTP id 5b1f17b1804b1-46202bf8382mr24405915e9.10.1758114775620;
        Wed, 17 Sep 2025 06:12:55 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4613d14d212sm41723905e9.12.2025.09.17.06.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 06:12:54 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCHv2] sanity.conf: Update minimum bitbake version to 2.8.13
Date: Wed, 17 Sep 2025 15:12:50 +0200
Message-ID: <20250917131250.2490358-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223602

From: Martin Jansa <martin.jansa@gmail.com>

Needed for multiprocessing module in bb used in the next commit.

It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
which was backported to 2.8 branch and tagged as 2.8.13

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index d2f56a3fb0..45ff2fc09b 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.7.3"
+BB_MIN_VERSION = "2.8.13"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 

