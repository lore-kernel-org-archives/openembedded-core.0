Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E59C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 21:54:25 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.60650.1744062859192641678
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 14:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RQRgZedL;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72bb97260ceso1281000a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 14:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744062857; x=1744667657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r30pSus09pjpEex90gr/UNJeRbbF7NYuifeEiWomHwE=;
        b=RQRgZedLiNbUvn3Y4+LXItlv2KnUoxmWucW9XlJRDo8v+RARQECiZ48tMnZPSv7Vjt
         irclLQ7Rsdmruun1bJDNVzJVNIY67ilPTlB9PmRdAzXySFCvZvWSCAru23F6tfoOt424
         /TLu35FxBUZ8KZPIPLMyd4hWlJTJ5xmh4Rj5t4VSPH42yE/GLqfXRvtQV+Z6po4+00wm
         N5PCzJfmtUgFFiPD/zTwE8qeXF5aSQDyC9YG+Qw5qLiPS6nvEcb3arPdwj5xdp7IlVzN
         1O9CEI06jvDpvOizJUaWA/x//khjPas9SupLPpgTjqnVhrMIMcCGTU6+pv9myQfuqhoq
         RtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744062857; x=1744667657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r30pSus09pjpEex90gr/UNJeRbbF7NYuifeEiWomHwE=;
        b=q3HAoAOkg7/b9ZTa7k8hF3Dj7j6Ued75v2nK/2HP4UuRTWHDx1XxdQI3oT/Wa7loD9
         IVGVp1g7oiY5HqTvoOKO1B6YQK4uvS3MkxXB8acYQsStOxbi04PllsW0WKwI+/jQL+GU
         va59SB/0eF3j7RkybK+YcCDvtxmev9UrKRg7gh4uaKDvnrrVo9CeNviIPKYICQCe4JL8
         KxlXKCpavmhgQeDtdBiZtGgUcB1JBlo5s6q9fvttF3s7y+/KTEIygsl+WncQcsEFnN9a
         MKew4FiDEs36BMsc0gmTSxjHnDyVmJ4K+iqEDqcX3YfrDqj7QBZJ6mbINm4XMOfrAr2I
         cBvg==
X-Gm-Message-State: AOJu0YxQ9R/QN1lq7DCnCezrELWW+pRD2IvYHpyheTciUeZjPa+fiPnC
	hhr07nxbOrq7cWjB0A0amE65R8UjzFEWnHc2IDtlOIptbU6KEq1A3HuWVA==
X-Gm-Gg: ASbGncuNWwV5ti6R8++OzKAIsDcGnfHBEdyP8I+RhA80Nx+KeqAOErz+umlLKiUNqop
	jPyx8gnT2Pokbpprhj1dxcLWsZKKBB/RzN6PW2JXUGim8keM+jvLMQ2xotRfXabpHnla5il1EhV
	8QDcwDQOiwv8sHwLOKju9Ghn/UleSJ7kdVsZmSMhykp7k8jyysZiE8XmslyoQHs3Hr8SMQzDrOP
	UFMC4BpF+Kz7WdFuCF1EptLI9b0b7fibqAdJp7/cVtWoEfzSezImDOiyPHq26p8XfTdjsovZXqB
	LaQoa5MB9ENCW0zwDik2ptRP6g3UFKnG+b8zHKNXfuM=
X-Google-Smtp-Source: AGHT+IGsr9qa0UjQKcvDIjArv8McbBAiMQxonh8Se1ph4n0MZs7jikmv/PiiLS3BnFstlqtFsVjzrQ==
X-Received: by 2002:a05:6830:d08:b0:72b:938e:31cb with SMTP id 46e09a7af769-72e40e32823mr5906545a34.7.1744062857394;
        Mon, 07 Apr 2025 14:54:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::bf01])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e65272502sm115489a34.65.2025.04.07.14.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 14:54:16 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib: oe: Add cve_check to BBIMPORTS
Date: Mon,  7 Apr 2025 15:54:11 -0600
Message-ID: <20250407215411.2024494-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 21:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214482

Adds cve_check.py to BBIMPORTS so the functions it exposes will be
correctly scanned for dependencies in the dependency scanner

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/__init__.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 3179a3f3d2c..a55694669d1 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -11,4 +11,5 @@ __path__ = extend_path(__path__, __name__)
 # processed correctly (e.g. qa)
 BBIMPORTS = ["qa", "data", "path", "utils", "types", "package", "packagedata", \
              "packagegroup", "sstatesig", "lsb", "cachedpath", "license", \
-             "reproducible", "rust", "buildcfg", "go", "spdx30_tasks", "spdx_common"]
+             "reproducible", "rust", "buildcfg", "go", "spdx30_tasks", "spdx_common", \
+             "cve_check"]
-- 
2.49.0


