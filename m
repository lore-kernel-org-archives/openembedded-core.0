Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B2DD1F9B7
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:30 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.4741.1729018281469204952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Z9Dd2tTB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e483c83dbso3757048b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018281; x=1729623081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8G3xgz+qILKRXneAvXd5PpO/QQlFGN/Lsv327BaPFc=;
        b=Z9Dd2tTBZuEXfgz+6E3MXNoDCo/KvxK2Nu3wLGxItx2jmGuvQj0KAFGSYzeS4sLV1N
         Wg6XdWf7A0T4kE4trWS4bEGk/HgNb7lJ7hJC8JZxBuhaiaAi9N2TDQ1CODAB3ABYsKxk
         hd7lOkWlE0wxlwUGg60fnWzu1yR+A4Y/NRb2tBpoYy/37umInILBlmSKFb5/gFZNer54
         uKwYW8W7HG4giXnf+IuJa18TPkBrp3hZt/mb908AeVcCTBV8f9ynJ0zNDwY1BfAB1pfX
         l/mbCP97iC/UtEOdV0JFAbdkalfTAWh5RMj1i1Ds/fIMP88MuOsGSUFGwKO3xTwrZM0T
         rJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018281; x=1729623081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8G3xgz+qILKRXneAvXd5PpO/QQlFGN/Lsv327BaPFc=;
        b=vzwGJV1nVtZw0kbyaQ2yr9Nj2+CZi63zj+KZ56b5LtdxVShpIctLyME0CZ2Sr86ZOG
         qNWBczJPxl/tQrAWO5a6wyNCsTCMnlwX+lD477X2K5PqOAS0Ht1wTsrzhPfEMyPhALWS
         Q5Qc28lkjmk+/v79seGNoY4UX1N561roLu5hCdvAQRYuG64UiEvJs/NueXsLMnkXUBK0
         jCEW5DRzJ3xcSKxqDxjTLLZQn8icJsj4U91sgMq5UkzA+pjuZyP3b19mEz/KqbUGQzSl
         WJ4XXtfyCVwve8zRN4eTYz4v3Be5FQyn1bofz8OeHG8EHhRgvPyKU3KWhZKFGjV2ZNqV
         AB9A==
X-Gm-Message-State: AOJu0Yz5E1DxeJNuBPv0ADJ7gHxnjsabkhfXb9wvlvNXTOewHhlutvhk
	pMpGZc7tV9Gx3/RhBlRwRbOD9RVVKDkjGJ1Ro8cesOqr6aTXUiOSJ70Loh+7uzQupv8MdLTi6Yt
	Y
X-Google-Smtp-Source: AGHT+IHXF88epwxlkfZbHoXv3CBNwPBQeKTk28Vl83/9Xt9oRwBJljkNudeqL8FJppZUVYH3tSI3BQ==
X-Received: by 2002:a05:6a00:cd6:b0:71e:692e:7afb with SMTP id d2e1a72fcca58-71e7da06ccbmr1845564b3a.5.1729018280710;
        Tue, 15 Oct 2024 11:51:20 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/18] makedevs: Fix matching uid/gid
Date: Tue, 15 Oct 2024 11:50:48 -0700
Message-Id: <865b7149da5dd6301c1d9805a1e7bac8dcac82a9.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205935

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Correct the length to compare in convert2guid() to fix an issue where it
ends up with returning a wrong id that matches partially. Also fix the
length of usr_buf and grp_buf in interpret_table_entry() which are used
as arguments of convert2guid().

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ca9d193a21e6b8669c4da1a68cd5e0791bb80a4b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/makedevs/makedevs/makedevs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs/makedevs.c b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
index 2254b54891..411a669153 100644
--- a/meta/recipes-devtools/makedevs/makedevs/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
@@ -202,7 +202,7 @@ static unsigned long convert2guid(char *id_buf, struct name_id *search_list)
 		// Check for bad user/group name
 		node = search_list;
 		while (node != NULL) {
-			if (!strncmp(node->name, id_buf, strlen(id_buf))) {
+			if (!strncmp(node->name, id_buf, MAX_ID_LEN)) {
 				fprintf(stderr, "WARNING: Bad user/group name %s detected\n", id_buf);
 				break;
 			}
@@ -212,7 +212,7 @@ static unsigned long convert2guid(char *id_buf, struct name_id *search_list)
 	} else {
 		node = search_list;
 		while (node != NULL) {
-			if (!strncmp(node->name, id_buf, strlen(id_buf)))
+			if (!strncmp(node->name, id_buf, MAX_ID_LEN))
 				return node->id;
 			node = node->next;
 		}
@@ -362,13 +362,13 @@ static void add_new_fifo(char *name, char *path, unsigned long uid,
 static int interpret_table_entry(char *line)
 {
 	char *name;
-	char usr_buf[MAX_ID_LEN];
-	char grp_buf[MAX_ID_LEN];
-	char path[4096], type;
+	char usr_buf[MAX_ID_LEN+1];
+	char grp_buf[MAX_ID_LEN+1];
+	char path[PATH_MAX], type;
 	unsigned long mode = 0755, uid = 0, gid = 0, major = 0, minor = 0;
 	unsigned long start = 0, increment = 1, count = 0;
 
-	if (0 > sscanf(line, "%4095s %c %lo %39s %39s %lu %lu %lu %lu %lu", path,
+	if (0 > sscanf(line, "%4095s %c %lo %40s %40s %lu %lu %lu %lu %lu", path,
 		    &type, &mode, usr_buf, grp_buf, &major, &minor, &start,
 		    &increment, &count))
 	{
-- 
2.34.1


