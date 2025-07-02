Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B98C83038
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:30 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.15023.1751425948546144519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t7T7n0Rw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742c7a52e97so6327838b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425948; x=1752030748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sE+QHyOn/81eB7j269LjqD2GWyIAz2xdma1FvKprIk=;
        b=t7T7n0RwlG4jYgy6S6b4e+qVV9wtGEkTsuYvuWWV56cwshf1lv0JxZEFE7NowPr/Kg
         ROaEKbYsyLcb2v48bIun9G4bYXY6mgqDgREp8fFRSiYjG6JEn2DuvBAzGgf0Lq3sJWgg
         bjRYgw6yb8wABU6PIFyp//ZwxPZ5hQV9RPz6943ArfBeA5p7H+QzisiMyvwcJismCZpj
         kljknSXbacdFosuwgyX/F8NEUqxhicGSc0ei9wnO/+dH3cuxS5BvaSC6IgbclBkXBRdg
         FtD6FvWZS3bMUq8o6lR688U6Imuess6pySzoVicQvI1pucvQy8ijI0rddJs0FFlGfCtM
         4Hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425948; x=1752030748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sE+QHyOn/81eB7j269LjqD2GWyIAz2xdma1FvKprIk=;
        b=I996mmofWihQEDZzaUAZ2zIt9cKWXE7zvz3pffTbvvUNPsVjUZ066k6rqWZd0hwIm0
         Tb5e2/i/EMhOwLT1m9+1RD+bj5ueDefVUPY5QbLlnlhl3w/BJGcxsetBjy1tEmYWHeK0
         kffJEXKKOy0YYQGl+OgToExZQpiOmk/IkFqMRPlAfrmMzqMfgX89VwO4lu4fRT8zhBof
         ZrGtiUx+iMo8V++XUx49/aIXbSaSU9Z3qAU627GpohG3851s0kQqoxUg2Qzr1nqUeoPm
         POxyQOVktaQYplWsItW8PVoDhfRVFf9oVArwEiNzbGhx/DH2W36sI7t6wbA5uB4whRZX
         UawA==
X-Gm-Message-State: AOJu0YzuLE2+BqwvRbVLFqTKC1MBNVj61KeMgIDDZHmL8HHRDEZMlEe7
	lcLEIpVecE4T+ZUtTyIDZehrhnYmSwLb7YX+JPK61WdOJK+6gmTNTsPaYO+ldA2aQZUWa9Dxmi/
	VLXCm
X-Gm-Gg: ASbGncvbnuRSTO7NTt632wMsBdkbeTcyaKhNW3YFxaUVyE3EjfEaCp2Cj9Enw371ddf
	6gJXNvUktag6EsUTrwLLg7cRWePt5kXJdSWNY3B2uu2ShMXb0yJD8kMknL9VhMJ8g8oesUNJbPO
	PS5q//fYW5jIyl6YJNTZEZfWDIbC+yRO3sHKCOM/BK7oDNqS0nJlq1dOtGdh5J7d1EX6MQcJnRa
	AOqkgJtoDFREkywUlnTSYRx6VeJ3IyJmHwCnBWWpRyegPGxIiHmaYBMFlJ1OZ2P63S1gVvAOiAO
	FLrbZa5MN+ytwGLPzuVGoSAkh97FM0btbQWl0+ks26ir37ftrCdnYw==
X-Google-Smtp-Source: AGHT+IEyM9T2wNOsgKQ3935lSy0i5Dcba5YAwbBB7jecGQEpeSMVt7hDEpy7l+5RFMdQOoMJbaFqSA==
X-Received: by 2002:a05:6a00:8c6:b0:740:6f69:8d94 with SMTP id d2e1a72fcca58-74b50c71fd9mr1848595b3a.0.1751425947773;
        Tue, 01 Jul 2025 20:12:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 04/19] cve-exclusions: correct cve status for 5 entries
Date: Tue,  1 Jul 2025 20:11:49 -0700
Message-ID: <cf239892614c0b00feacef6b6e38283832239ad6.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219757

From: Daniel Turull <daniel.turull@ericsson.com>

In commit 8a7af09feb the CVE_STATUS was copy from the old data
for 6.6 kernel, which had backport information.
Correcting status to when the fix was introduced and adding
references to the fixes.

Fixes: 8a7af09febc28477094de0999ab6321d910811b2
Reported-by: Peter Marko <Peter.Marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fc3e32bc4cf79ddce0eb9fa409656de4dc0e00ea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion.inc | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index 5f96a81bdd..f1b7db44b6 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -141,12 +141,17 @@ CVE_STATUS[CVE-2023-4155] = "fixed-version: Fixed from version 6.5rc6"
 
 CVE_STATUS[CVE-2023-6176] = "fixed-version: Fixed from version 6.6rc2"
 
-CVE_STATUS[CVE-2023-6270] = "cpe-stable-backport: Backported in 6.6.23"
+# Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f98364e926626c678fb4b9004b75cacf92ff0662
+CVE_STATUS[CVE-2023-6270] = "fixed-version: Fixed from 6.9"
 
-CVE_STATUS[CVE-2023-6610] = "cpe-stable-backport: Backported in 6.6.13"
+# Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=567320c46a60a3c39b69aa1df802d753817a3f86
+CVE_STATUS[CVE-2023-6610] = "fixed-version: Fixed from 6.7rc7"
 
-CVE_STATUS[CVE-2023-6679] = "fixed-version: only affects 6.7rc1 onwards"
+#Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=65c95f78917ea6fa7ff189a2c19879c4fe161873
+CVE_STATUS[CVE-2023-6679] = "fixed-version: Fixed from 6.7rc6"
 
-CVE_STATUS[CVE-2023-7042] = "cpe-stable-backport: Backported in 6.6.23"
+#Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ad25ee36f00172f7d53242dc77c69fff7ced0755
+CVE_STATUS[CVE-2023-7042] = "fixed-version: Fixed from 6.9rc1"
 
-CVE_STATUS[CVE-2024-0193] = "cpe-stable-backport: Backported in 6.6.10"
+#Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7315dc1e122c85ffdfc8defffbb8f8b616c2eb1a
+CVE_STATUS[CVE-2024-0193] = "fixed-version: Fixed from 6.7"
-- 
2.43.0


