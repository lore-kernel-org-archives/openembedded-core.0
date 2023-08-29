Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCA9C6FA8F
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 17:01:20 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.2316.1693328470537108168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 10:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mxhdp6YS;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99c353a395cso599105766b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 10:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693328469; x=1693933269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cCAdHCLBd+uHwRneclY+Fl8GT8zGqugR2WFyewdg+lc=;
        b=mxhdp6YSqhCx/nEzov92SAisSn4GNaWXkMZs5PMgJO8aVB024O4rMm2uxYnmCeRQsv
         jKHcSWEu/frlEF0pRnvBm4LmjnGrQIolrwigWtLDCl/XGp1wLl44FWacr0WzcDV0iFTx
         MSG0AoGbvwHTBrqR14PaLXTkk8M/j2LPvrZVFVTvTPPnJO0lQURj2Ztugn2bXvI+Qs2/
         X4u8fNDWoEBBcQNtWBPUYW5gs7FW+Wb8hWeLP8YJha8b6mHtgP9inmroTfUZL1k7YfW4
         a6q2U+plMQJ4R5Gp4ncy3j/JjLZiAMcJ4AWQ9x36PM/SzwO7oBj+tipxoyjl0ASisDi/
         tbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693328469; x=1693933269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCAdHCLBd+uHwRneclY+Fl8GT8zGqugR2WFyewdg+lc=;
        b=UUtWgpq6llmWVLqTprYWDsksv/2B69Qsyb3qzOmKFXx1hMyaDqdA2KG6Fg3KJI0uL+
         WT4xwTFVz0i4GuYgbcKwucyAEuzgLNq/viKAkncrXnjfiIaJcMT3U31htSLCllAiHw8p
         rEF2d80fOZBcWmuUzPsHrLAHT3QZLd0MbJGTmJABeSdkntUQB5s9hjVrujHphXdLNGF1
         QP3Wh4vt6zcOz/qU1RBgHxNlUmGEhMSy+71CejqjuX6OU1mGBipnn7aNVVBsH6wRjVYt
         /Ivw/7Ger+3Tamm/ifSdvxph7MGC2G2hmSZlEs5JiyHVT28aTqY2PYIM7o5Y+t1Jizz6
         3LDw==
X-Gm-Message-State: AOJu0YzX0qfHy8J82IXkQdktKjoMURAdXW/pHDzwYmWuuMGaZkIY6N+3
	uxTWMXQqNLZ/ZQtllpaw9AuJAyBBE88=
X-Google-Smtp-Source: AGHT+IEw+vkgshKqHmbmlD890dNBOyw0LTH+iDnNqCyCpAK/GeS7glWpklDindt8ZO+hAmio8Rx0HA==
X-Received: by 2002:a17:906:8a44:b0:9a1:e758:fc73 with SMTP id gx4-20020a1709068a4400b009a1e758fc73mr12749685ejc.67.1693328468471;
        Tue, 29 Aug 2023 10:01:08 -0700 (PDT)
Received: from t14s-af.. ([178.197.202.150])
        by smtp.gmail.com with ESMTPSA id h7-20020a170906718700b0099bcf1c07c6sm6186127ejk.138.2023.08.29.10.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:01:07 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH v2] json-c: fix CVE-2021-32292
Date: Tue, 29 Aug 2023 19:00:46 +0200
Message-ID: <20230829170046.231673-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 17:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186865

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
 .../json-c/json-c/CVE-2021-32292.patch        | 30 +++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.15.bb   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch

diff --git a/meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch b/meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch
new file mode 100644
index 0000000000..7ac08c4cb0
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch
@@ -0,0 +1,30 @@
+From da22ae6541584068f8169315274016920da11d8b Mon Sep 17 00:00:00 2001
+From: Marc <34656315+MarcT512@users.noreply.github.com>
+Date: Fri, 7 Aug 2020 10:49:45 +0100
+Subject: [PATCH] Fix read past end of buffer
+
+Fixes: CVE-2021-32292
+Issue: https://github.com/json-c/json-c/issues/654
+
+Upstream Status: Backport [4e9e44e5258dee7654f74948b0dd5da39c28beec]
+CVE: CVE-2021-32292
+
+Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
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


