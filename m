Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C8DC83F14
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 11:33:49 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.15104.1693308827731674763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 04:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KjmR4xJ3;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31aeef88a55so3517263f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 04:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693308826; x=1693913626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7F/MY8VTrqHwPVuPOTPhUrdJIDLrU1CLZE2N68wDwA=;
        b=KjmR4xJ34BO5yRTIWoYdwtOsV4YsjLhbP6D+Cx6ws5cC7bpdbKwWt6OtDde3hfwNvC
         Q0HMxtAH7wi3fxax+sXVw1HQteXrZ3SwCkUUr/7EEJKy44uVNWzCC4dR6ELYi3xLLQRs
         qlWMZQy2/o/GvExVTDId7woMvHXviUg8XpLYz4JdgTwc8v6kW4AP2q1UJhnMvyEvyoTA
         KWtSSsqT+ucoyUTFubfVbPELF0dEps7AUHSq+ml80bHXLHg5M/TtQPO+QzMZtGnKzY6L
         JLTt/6DHvylWMJXhRMwt9RVROyTuoLeWEN7SMOkxIeWiNYO1SiaUNqhW71s0k1VJ4zTO
         F1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693308826; x=1693913626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7F/MY8VTrqHwPVuPOTPhUrdJIDLrU1CLZE2N68wDwA=;
        b=QK39/Q0i7ow8+7gGepi2sFWq5VXOi2xNEfyK80FvMdGCbrlEAPCCAuba6rrVO/IDqe
         W8XF6M55b4EY7Z9rzJqMadqMAfgwj8EuTycpFgUMWEK22u20n0XwPawD1cDrnGvvanwX
         udYYq/4qx//0GZepLdYc/ubO0vHvi6rsAOqxBOQicpJdP1vAZ8qyEhBCkVZE/X8dyuUV
         RE79A/Vo5LxMf7IVAVhwwQc+d/opC7Tw8nHEtamf/NGy5wt264KFrdihBoDT+SvKHsft
         lHvac+uIsrq0feazMCHMJYQknO66vwsh/G19T6duZS0yyS5FXLNDrHpBbxUWg2s0ZrNS
         jAFA==
X-Gm-Message-State: AOJu0YxgISUVz1Y0SphAof74XYsl6O2TD9y3zyH8KPW4Sptlp27JHWEL
	Wq+etFPwjfdqh1Okde4QIrqT9vKSxO0=
X-Google-Smtp-Source: AGHT+IH9G/V2UOKifMo0+iD41ASZUM877exK7Qu1pX4yzTL/v14bCFDW6JJDEQ98lvfMIGMs2UJXvQ==
X-Received: by 2002:adf:f892:0:b0:317:6c19:6445 with SMTP id u18-20020adff892000000b003176c196445mr21841542wrp.39.1693308825414;
        Tue, 29 Aug 2023 04:33:45 -0700 (PDT)
Received: from t14s-af.. ([178.197.202.150])
        by smtp.gmail.com with ESMTPSA id s16-20020adfea90000000b003198a9d758dsm13575060wrm.78.2023.08.29.04.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 04:33:45 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH] json-c: fix CVE-2021-32292
Date: Tue, 29 Aug 2023 13:33:32 +0200
Message-ID: <20230829113332.157678-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 11:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186855

This is a read past end of buffer issue in the json_parse test app,
which can happened with malformed json data. It's not an issue with the
library itself. For what ever reason this CVE has a base score of 9.8.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2021-32292

Upstream issue:
https://github.com/json-c/json-c/issues/654

The CVE is fixed with version 0.16 (which is already in all active
branches of poky).

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../json-c/json-c/CVE-2021-32292.patch        | 24 +++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.15.bb   |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch

diff --git a/meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch b/meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch
new file mode 100644
index 0000000000..f3af0a52c9
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch
@@ -0,0 +1,24 @@
+From da22ae6541584068f8169315274016920da11d8b Mon Sep 17 00:00:00 2001
+From: Marc <34656315+MarcT512@users.noreply.github.com>
+Date: Fri, 7 Aug 2020 10:49:45 +0100
+Subject: [PATCH] Fix read past end of buffer
+
+Resolves https://github.com/json-c/json-c/issues/654
+---
+ apps/json_parse.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/apps/json_parse.c b/apps/json_parse.c
+index bba4622..72b31a8 100644
+--- a/apps/json_parse.c
++++ b/apps/json_parse.c
+@@ -82,7 +82,8 @@ static int parseit(int fd, int (*callback)(struct json_object *))
+ 			int parse_end = json_tokener_get_parse_end(tok);
+ 			if (obj == NULL && jerr != json_tokener_continue)
+ 			{
+-				char *aterr = &buf[start_pos + parse_end];
++				char *aterr = (start_pos + parse_end < sizeof(buf)) ?
++					&buf[start_pos + parse_end] : "";
+ 				fflush(stdout);
+ 				int fail_offset = total_read - ret + start_pos + parse_end;
+ 				fprintf(stderr, "Failed at offset %d: %s %c\n", fail_offset,
diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes-devtools/json-c/json-c_0.15.bb
index 7cbed55b3b..4da30bc50c 100644
--- a/meta/recipes-devtools/json-c/json-c_0.15.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.15.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 SRC_URI = " \
     https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
     file://run-ptest \
+    file://CVE-2021-32292.patch \
 "
 
 SRC_URI[sha256sum] = "b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6"
-- 
2.41.0


