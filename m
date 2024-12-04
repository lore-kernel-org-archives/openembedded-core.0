Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A42E77172
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:56 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.25158.1733344609110288691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zb6cTffv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-724d23df764so227610b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344608; x=1733949408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnaZhybdWFaTCIToIn958yGf4orHlQ2sE8z/gLz75zU=;
        b=zb6cTffvvRLxzUWnYb6ctbNYKy2Si6hlF5Gh52yYIqxfFe6oYv6vEmBiPfU9etP0sm
         FA1OBLe7BV2LVaQVTETNQ5F9+dABnBzjoM8wq7u+AnDALIL2hqbuZdCmW+MRX8NnlhZO
         EanqXTtbBfpgi5CF9mO9hsvCD3LjFkxg2aNFrZSfwZHAYzJn0nIeOZu6A80pm7iHCM+/
         OchkmOIdfjJk1b20SYjvahBjALnWCqJ0f0le9dPUZmfUS6VKy3TR+uLS/XEeNtXqVJe7
         2APCHT6pUvSFQ1VZ/hElhEDWZJYL1hbBrD17WJUtPnzGXngQD0FpgV3pmu6sMeDBf7Zv
         trHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344608; x=1733949408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnaZhybdWFaTCIToIn958yGf4orHlQ2sE8z/gLz75zU=;
        b=KqMTgGTJSN+HqIRMQyqN+heWjxcokkfQjDC6r5YZJ99m3DpNU7+TdV1tISWY+fdajn
         pdw4Yetv95I2o30TeqC/CK+zvrhDVjd/k8gp0UdD8Nn7JSy3GbdW3LI9zAhkHI2MFLHl
         O3VDyzY43AeoUmuDOMSMz29v6nvN2f9e/H2kZuIBO85i90d6W6IymoLYZ7KpmtU2scY+
         m7jLLpe4bAgwaKdfQhSEl8Tm+rhU2mUCZ1GNgrJOEDYAJuyEIfv/epgvZAvIZSc4VbI3
         aUg3rnNLnmRyrDBeEQOiLmmsD4HI+Xa9i9WeTtZKLujZRS30r2QDqcIPlaSKgRC25pL5
         upew==
X-Gm-Message-State: AOJu0YxaunH+Xq5uXVEnBlrKAxsis8HTCa3gy3KFLouvqEyf0JggUWjB
	AU10dJzO7AbGpWeUxM4iHkJjNIz7bEnad1BiHtbvi8v/u4jceOHFFKE+p0znT14FgosGiO1DO0L
	n
X-Gm-Gg: ASbGnculjVdiWzS0bTRHqe0Qc3AGHRTe8pgh0YgK9VRIwyybcYBdLHT5RCU1js50tRi
	yq3YLquEpyA1YPOUdlpWkdJXT18Xvcd1F7QWKtLgVBzUJMcVep4is4nGcA8ZV1+Aic0Wl9QAmXF
	xLFpveXxudQTcYJ//0wVoTjQMJWCZfq19vxTpoxC7hRfWo0KyghYMYMYxy11nIYd9UDOzxeI4Gw
	zq8bzfwsQ4abpmA7k/sTJUoUVQ+NS4zfQWCRyY=
X-Google-Smtp-Source: AGHT+IEg2IAL/z0BObQzAhbDnUlmWWBcRd72ixA+VL1TQ1Nuz6lk4x1NKzhprAaPdEwXW8uJWysNKA==
X-Received: by 2002:a05:6a00:c92:b0:71e:55e2:2c54 with SMTP id d2e1a72fcca58-7257fa731ffmr10205168b3a.12.1733344608351;
        Wed, 04 Dec 2024 12:36:48 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/15] resulttool: Clean up repoducible build logs
Date: Wed,  4 Dec 2024 12:36:20 -0800
Message-Id: <82acc3b1e410afd40fe8a67c77bfe69add95066e.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208341

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We've improved the data stored for reproduicible builds. Teach resulttool how
to apply those cleanups when reprocessing data so we can reduce results file
sizes and make the data easier to process.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b799c57ae6d61c1b1c7035c8a2c4ba6ee08d1a81)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/resultutils.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index b9b93afaa6..9cba8639a3 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -131,6 +131,27 @@ def strip_logs(results):
                     del newresults[res]['result']['ptestresult.sections'][i]['log']
     return newresults
 
+def handle_cleanups(results):
+    # Remove pointless path duplication from old format reproducibility results
+    for res2 in results:
+        try:
+            section = results[res2]['result']['reproducible']['files']
+            for pkgtype in section:
+                for filelist in section[pkgtype].copy():
+                    if section[pkgtype][filelist] and type(section[pkgtype][filelist][0]) == dict:
+                        newlist = []
+                        for entry in section[pkgtype][filelist]:
+                            newlist.append(entry["reference"].split("/./")[1])
+                        section[pkgtype][filelist] = newlist
+
+        except KeyError:
+            pass
+    # Remove pointless duplicate rawlogs data
+    try:
+        del results[res2]['result']['reproducible.rawlogs']
+    except KeyError:
+        pass
+
 def decode_log(logdata):
     if isinstance(logdata, str):
         return logdata
@@ -173,6 +194,7 @@ def save_resultsdata(results, destdir, fn="testresults.json", ptestjson=False, p
         resultsout = results[res]
         if not ptestjson:
             resultsout = strip_logs(results[res])
+        handle_cleanups(resultsout)
         with open(dst, 'w') as f:
             f.write(json.dumps(resultsout, sort_keys=True, indent=1))
         for res2 in results[res]:
-- 
2.34.1


