Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425BEE77172
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:47 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.25356.1733345145301953628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=209xuKcm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2153e642114so1493445ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345144; x=1733949944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnaZhybdWFaTCIToIn958yGf4orHlQ2sE8z/gLz75zU=;
        b=209xuKcmYxzMDN0x2xb6d4wALHLqabGOWfjJ/9gh8mQBKVuMgzhCCldKV+rGXYxrUx
         TVBQONoqGG8wz1SRGHSIFkRnXl44pc6UmilMKuKNLGQUC8G7KSReePcW3L0yXwUeRYKQ
         BjonQDlFkZzH5WuQrfZK2p1523XOFPiVYyVxGhby1Jj7KbrGJcJxAlHoIv4uWy678ZDw
         G/6ZDDaL5gEKZjPZqVHF7jf/IftWt9Dt6ZikE/KVzWPikHlvz8HbzXLBhNFhz6tfL5rw
         Rce0uESBswGes7RUA8Gsncqz+vfvfR+ZUxQr/B/8Y+/mmnManXPxUtvCsKb2Wt/1CMhu
         lgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345144; x=1733949944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnaZhybdWFaTCIToIn958yGf4orHlQ2sE8z/gLz75zU=;
        b=mj6kZge82X3HL6Vk218oKVAQS7Pp5H7gZMLvJMzgExaUFESZVMegfsaKcxRKr+d215
         ctD1L/v/iMEvY7DoOq3KPs66E25yEBtGBA//+vYe/HIa/zSXcvpWZJRZ+9tAVTsKLp+g
         XgGZOatiUYyhp4sDW/JTYOmRIfJyyxt6y3iAxZzG8BQ5ZyVe4F50nMyKkPktfpnlKIM3
         r8bd9qvr7eMFyGCuSUu8yZrT1YS7dqKQ3xnvLzHEBPdQBx661w6IunNKHHo+dRsd2bBI
         mliHrmJTUCwMJ2Q/OQNc0+6NExfzB9CeG0Y99w6BF0OtPwi1BRSKDv7jwD9yl3lwURYg
         kxoQ==
X-Gm-Message-State: AOJu0YzDYmz9JQP4GjuvI2cwTqhTLSOFQuvQp1bfN+eWnS1Kt3yjqXoI
	3qPsqFfa7MgHJRYi1V0qAFKQZvOwn4ABjX4HRs1K/P9A+XeBkvb6GH+j+cUr+wQTjSH01QYVOIi
	T
X-Gm-Gg: ASbGncstA2iy1PLnlVKemCocuW1Xx2g8XywGFUmgbiLArkTnyVYRy+UGERnsONSF0Un
	kkPkNqZg6Q9yYJ67EtF+4mzoJWpxtgImrTBDoMA3LNS+x9ecgZf89dpmPgHy5AczXyHCST5Y34q
	6gY2ULAWO73t/CP9ndaudkRxYtN2k6USIHcbiyhfEotxRAd4SNOVl0Cqy+RzfVfTfzf8xXHML3R
	6ntI+/Ekl9hKoEFLqmjbHqYaNQmdJSx5qINNg8=
X-Google-Smtp-Source: AGHT+IEs0PHQ3ooObYVMZs0tlzV8hvMkslhXhJofrOfwx2EkB7SmcHZtVS9tK/nICNRPJSODUu00qw==
X-Received: by 2002:a17:902:dac8:b0:215:72a7:f39f with SMTP id d9443c01a7336-215bd241431mr114455485ad.36.1733345144610;
        Wed, 04 Dec 2024 12:45:44 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 12/14] resulttool: Clean up repoducible build logs
Date: Wed,  4 Dec 2024 12:45:21 -0800
Message-Id: <316535d421be32d773a4f98beea5bf2aabfccefb.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208356

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


