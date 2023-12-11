Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09179C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 17:36:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.1406.1702316207839860651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 09:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZMNR62Fu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40b27726369so50147595e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 09:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702316206; x=1702921006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hgvGJol4khtFjumWPSE8UNTrWg3wklEUCKVKnqHMlXU=;
        b=ZMNR62Fuiwb+j1CW6WFPZfUlVH85mzzwvkfOKM5uQ+7nx7cjWravOaoKAKvmPuQwiz
         Fx8Gg+92SNtf8rC5pwFmSGtRRVuy+6SdcOZ57hDIzWeNAiRDkp3XqMunqGn9GijNuAhH
         4tI9Oprm497gSJgCFgP7xRmaD+EEgait8yhH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702316206; x=1702921006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgvGJol4khtFjumWPSE8UNTrWg3wklEUCKVKnqHMlXU=;
        b=bQBRAt4I2TOGkPrfo0un0EJ2z4hj4Gc6WbKvgRTjYY/kbJFYcjidpDu+78GmW+IWLL
         oVR/RVScaaKhnSbcFFR4f5aE3O8IyX3ycGMfttVdoVAueamxOOSC7K/DV+KrXDpA8aNF
         ey726nEj7cV7eX1GniNr8kHO3AXExK1y9b6WOEngQA4kmI7OnYrWK8bCA+4Y5VRjn8g0
         mzU871UV8Ob8KSxGme5ojJ/2hzSKQo1/5k4NyECmPtML8skmLe5eOyMzwBHvSlGhV/0y
         lXpgQoGYl5i3dzz3Af1AWdMKfZ/nQSDdtxmzp4Zrmg2f+jpxwQY7/cKMFkDEyN6SDfRD
         rwtw==
X-Gm-Message-State: AOJu0YxSkj8nfdLoAc7UZ/zEyVkw/L8DPqRXSJ7ChhhDn3ZkfjiSTcOC
	XamlP34dw9m22zXV49zsaOnNOdz78gVUxyKZ4SU=
X-Google-Smtp-Source: AGHT+IFHrgbmXA3XzHuh6RQbRY6Iiz9xGGbv4+LtlaHV5LLvZXfg+A/tu1z/ZAQwFyGU9XJXOZIvqw==
X-Received: by 2002:a05:600c:41c1:b0:40c:34b7:b849 with SMTP id t1-20020a05600c41c100b0040c34b7b849mr2774343wmh.118.1702316206097;
        Mon, 11 Dec 2023 09:36:46 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cd7b:e198:4dbb:2063])
        by smtp.gmail.com with ESMTPSA id a16-20020adffad0000000b003333b8eb84fsm9045985wrs.113.2023.12.11.09.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 09:36:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH] pseudo_client: Add support for PSEUDO_INCLUDE_PATHS
Date: Mon, 11 Dec 2023 17:36:45 +0000
Message-Id: <20231211173645.2421999-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 17:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192184

We've often wondered if things would be better with a path include
list instead of an exclusion list. Add support for this so we can
test that theory

If set the include path takes precedence over the ignore path list.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 pseudo_client.c | 22 ++++++++++++++++++++++
 pseudo_util.c   |  1 +
 2 files changed, 23 insertions(+)

diff --git a/pseudo_client.c b/pseudo_client.c
index a03d6b1..c55ab9d 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -1577,6 +1577,28 @@ int pseudo_client_ignore_path_chroot(const char *path, int ignore_chroot) {
 	if (ignore_chroot && pseudo_chroot && strncmp(path, pseudo_chroot, pseudo_chroot_len) == 0)
 		return 0;
 
+	env = pseudo_get_value("PSEUDO_INCLUDE_PATHS");
+	if (env) {
+		char *p = env;
+		if (*path == '\0') {
+			free(env);
+			return 0;
+		}
+		while (p) {
+			char *next = strchr(p, ',');
+			if (next)
+				*next++ = '\0';
+			if (*p && !strncmp(path, p, strlen(p))) {
+				free(env);
+				return 0;
+			}
+			p = next;
+		}
+		pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
+		free(env);
+		return 1;
+        }
+
 	env = pseudo_get_value("PSEUDO_IGNORE_PATHS");
 	if (!env)
 		return 0;
diff --git a/pseudo_util.c b/pseudo_util.c
index b58036f..77edb9d 100644
--- a/pseudo_util.c
+++ b/pseudo_util.c
@@ -43,6 +43,7 @@ static struct pseudo_variables pseudo_env[] = {
 	{ "PSEUDO_BINDIR", 13, NULL },
 	{ "PSEUDO_LIBDIR", 13, NULL },
 	{ "PSEUDO_LOCALSTATEDIR", 20, NULL },
+	{ "PSEUDO_INCLUDE_PATHS", 20, NULL },
 	{ "PSEUDO_IGNORE_PATHS", 19, NULL },
 	{ "PSEUDO_PASSWD", 13, NULL },
 	{ "PSEUDO_CHROOT", 13, NULL },
-- 
2.39.2


