Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F6FC25B78
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:34:06 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.61066.1716212044553558316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TB6gMh4R;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-662aeb8d157so136108a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212044; x=1716816844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQsibIfkcT/QkyTSSZ+KUAZc9mzQIsZybvaAtPfP+Rc=;
        b=TB6gMh4RF0lY8GHjV90h2wcQKO1eLPxQgh8Mdbz+PbIdWO1sxd3dzlIymmxnG2Yvwn
         yrj+GR0uOey+BzsJGFl2/LVtN34sZrHsBhmwdXIocS0Wgr7pq01gL8hbdbWpxsKjVr9I
         rP/tHJrRbHpJR5/4mFCewyxx9Z/MSuv1Iu8q9dWhq/4NJhOc1OsBcQxwRNQGyNXZ/vei
         F11t6e4Tdgd96YUNAOpysJo2wGosG6bwZ88jcgo1nH0PyuY79qnM0btJ3YsiOoGzJb2o
         0R5Hdwi71o4BpbvCu/zIMklMme7i/TlRQKzYmhLNzIscX7wLbR0srP8vS2T4ZcOufigH
         d6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212044; x=1716816844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQsibIfkcT/QkyTSSZ+KUAZc9mzQIsZybvaAtPfP+Rc=;
        b=nU1TntEByCqZ1nnz4jB7C7445PREwlUfArCGiR6qH3yCjiTLxGVeAheSNunHrH0Vxg
         ykntV75AZlJsntCKPiLQuiNvWU68a84vGIaIZlkNp8GOc5KkqWpbRqlUIIGyQHgJ8dWt
         QbFZX4Ux7qJLKDh2/Fi6ppPDb7cbGh2Pv/5SZSuF9WCL5QA1anFKEWCPRLP0+B3GDwRo
         Ld+XVD7TqBYcNScY0xyIfoeVsoQrWUttAH39crctQdQ6tgujSqn6qMyG6B/HVvyQKchW
         iO/jB3iDxFi/K8aATTN7kTDrh3uKPm2ad7wI4qighonDxXHWMbJtTwPHQU/MGCozChPN
         B5vQ==
X-Gm-Message-State: AOJu0YxXE+5qjS9VVmklVllx62e8fHiX3KJGbrhmr2S2iAaYeUotAJML
	P+GL3B/BRn3vmnQpzjmdEu8EfsshxbfzbL+pVZ75PtbhEUHFn0GLQltYOcu5DytfNh25m+JFJKM
	S
X-Google-Smtp-Source: AGHT+IEZE0QWk4REZNYRndFuNyZM4S7pHtUM1lcKzGhAzOmmgrFm1CR9BOU8KbEKA+xNZZRgfZ5vDw==
X-Received: by 2002:a05:6a00:2d05:b0:6ed:cd4c:cc11 with SMTP id d2e1a72fcca58-6f4e0348519mr34133968b3a.25.1716212043763;
        Mon, 20 May 2024 06:34:03 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.34.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:34:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/21] recipetool: Handle unclean response in go resolver
Date: Mon, 20 May 2024 06:33:28 -0700
Message-Id: <d61934122cdc9f2d68f99e5e3363c3f1808e7782.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199588

From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>

It appears that some go modules repond with a 404 error when trying to
resolve them dynamically. The response body may still contain the
go-import meta tag. An example for such behaviour is gonum.org/v1/gonum.

Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8f2e14ab6562a9a68819a960c66a258ea9dbe246)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/recipetool/create_go.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/create_go.py
index c560831442..0fb7115e26 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -16,7 +16,7 @@ from html.parser import HTMLParser
 from recipetool.create import RecipeHandler, handle_license_vars
 from recipetool.create import guess_license, tidy_licenses, fixup_license
 from recipetool.create import determine_from_url
-from urllib.error import URLError
+from urllib.error import URLError, HTTPError
 
 import bb.utils
 import json
@@ -251,15 +251,18 @@ class GoRecipeHandler(RecipeHandler):
         req = urllib.request.Request(url)
 
         try:
-            resp = urllib.request.urlopen(req)
-
+            body = urllib.request.urlopen(req).read()
+        except HTTPError as http_err:
+            logger.warning(
+                "Unclean status when fetching page from [%s]: %s", url, str(http_err))
+            body = http_err.fp.read()
         except URLError as url_err:
             logger.warning(
                 "Failed to fetch page from [%s]: %s", url, str(url_err))
             return None
 
         parser = GoImportHTMLParser()
-        parser.feed(resp.read().decode('utf-8'))
+        parser.feed(body.decode('utf-8'))
         parser.close()
 
         return GoImport(parser.import_prefix, parser.vcs, parser.repourl, None)
-- 
2.34.1


