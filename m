Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B417C47DDB
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 16:26:47 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.19846.1706545599996413454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 08:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=Zrk7EHKC;
 spf=pass (domain: madison.systems, ip: 209.85.215.176, mailfrom: matt@madison.systems)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5ce942efda5so2133617a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 08:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google; t=1706545598; x=1707150398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIruV5PADtpTJBzzykc5p1RhlwqJWSXTBh29tZsDTqc=;
        b=Zrk7EHKCjtPoDbIp2qljMaMxHmA9Tdoen7BIz2JZRusrCKLaSSp4MrBAo5PuyP8MfE
         3Wm95XT4ocu/Bo4AEMEr0tuAh+hHxvIgiu5kQuq+9E25tfbCCUCit9Ikh0C4SJ/ZCD5b
         NwVrjyHCOyzbmTgKNGiTu/V+S1WA/RWW7IvKAMKA7W1DVbh4sNrBz6UKigAhJqh8xfQp
         mMCWrkdEzv1fWfgh51z9Ri5pBRZ0/rnsmDSOYtPnoGmizh0jhdRWDrnpMu4418nukfIK
         WiJhkEtQ29WpPig8jM9/eO9GR6UsYafiCNgGpBBukwo2SY0mBslhetYPyRUWd2Idn3q3
         ClbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706545598; x=1707150398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIruV5PADtpTJBzzykc5p1RhlwqJWSXTBh29tZsDTqc=;
        b=BQjB+Li/tKRQLWnuhk/9k4HAES2521+lfsVWYneeU64s89WZ2yWXiYHQTmfYJ0hdFC
         BCPDXPgSaUciKusJsHjZEFnoG47PNHKs7dwlDd38NGqfAzyv+9VPryfB0utGYZoF1w3Z
         o2GPPLHBRiff94cnbsGYeDH79DqftYBph4Kmxl1xOHeFEclaPHW2M7keu2g4X/64zJWK
         TVBCTneAx5oPKHGYYsr4U6Myc7DoCdkA5UiXv2BDxSMnBi/aDKVG56pmpFMX8qHn/7T2
         ehF29Hs91TvIO3DxF5uae4SYfQjhpFAVq0pTPAChyqcbetliia2PTfs8XRjfT+G6fFcw
         ELhg==
X-Gm-Message-State: AOJu0Yx3tcgky4CSio+qx6WeR1rpzth4TT9oo6B5k+4XxNCGdUsYOpoT
	sMU+VZi69oKGEOlzdWY1XMHhMHe4JnV6MLvcsK3QYU2z/Z/4nwr8zFneF7CJUnAEqEDB12HMjbE
	q
X-Google-Smtp-Source: AGHT+IHfd+ZtULJ4v9Kk1btCcorYFzujoamEFZeTz0PqV8a2VcOs8OZxuw1JZZYtX9ikZLSUeOn03Q==
X-Received: by 2002:a05:6a20:1452:b0:19c:a342:3ab with SMTP id a18-20020a056a20145200b0019ca34203abmr4077184pzi.43.1706545598578;
        Mon, 29 Jan 2024 08:26:38 -0800 (PST)
Received: from visar.local ([2600:1700:87f0:9cff:8110:8cf4:5932:4a46])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8b574c9f1sm4086682plb.305.2024.01.29.08.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:26:38 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Matt Madison <matt@madison.systems>
Subject: [PATCH][pseudo] ports/linux: add wrapper for statvfs64
Date: Mon, 29 Jan 2024 08:26:15 -0800
Message-Id: <20240129162615.3724802-1-matt@madison.systems>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 16:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194464

rpm 4.19 now builds with LFS64 support enabled by default,
so it calls statvfs64() to get the space available on the
filesystem it is installing packages into.  Add a wrapper
for this call so the right filesystem is used.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 ports/linux/statvfs/guts/statvfs64.c | 15 +++++++++++++++
 ports/linux/statvfs/wrapfuncs.in     |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 ports/linux/statvfs/guts/statvfs64.c

diff --git a/ports/linux/statvfs/guts/statvfs64.c b/ports/linux/statvfs/guts/statvfs64.c
new file mode 100644
index 0000000..856d3db
--- /dev/null
+++ b/ports/linux/statvfs/guts/statvfs64.c
@@ -0,0 +1,15 @@
+/*
+ * Copyright (c) 2018 Wind River Systems; see
+ * guts/COPYRIGHT for information.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ * int statvfs64(const char *path, struct statvfs64 *buf)
+ *	int rc = -1;
+ */
+
+	rc = real_statvfs64(path, buf);
+
+/*	return rc;
+ * }
+ */
diff --git a/ports/linux/statvfs/wrapfuncs.in b/ports/linux/statvfs/wrapfuncs.in
index 1afb64d..6a59660 100644
--- a/ports/linux/statvfs/wrapfuncs.in
+++ b/ports/linux/statvfs/wrapfuncs.in
@@ -1 +1,2 @@
 int statvfs(const char *path, struct statvfs *buf);
+int statvfs64(const char *path, struct statvfs64 *buf);
-- 
2.34.1


