Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6FCC41513
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 11:54:16 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.83746.1691927653377762507
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 04:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fZbBsxUM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fe1a17f983so30835275e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 04:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691927651; x=1692532451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8Ha5dFM2nEx9COdLqvQkSxKrMwlfzR5Jshff6nBkRI=;
        b=fZbBsxUMjJUpNhtrq0tSmyk8u206pA6vVgjZ7gF5JFIbJ7G+85/rbFLeCtzgDwVrIa
         AObYXy/IMTYhFinY1QwAHZeeD7r7p2Y2miEM/Ny3TVyHHqKkQWqVHU/Mj1gRnBjx28WR
         ZI0bCb2H9Cq5a+60dqy5+N/KZviM1szsi/Kv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691927651; x=1692532451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8Ha5dFM2nEx9COdLqvQkSxKrMwlfzR5Jshff6nBkRI=;
        b=XUz2c1yHarJcjjNubn7WW0LZLwq4qAdTrEB35k9UTfs87wb9Ftr5TBiQJSlrOlTFMg
         3RTiH+vsDLsg+NtKwt8HRGDbUMu69xdbpq+wfg9Sxrv/S8bBJ1mvsDJstXHsyWKY0nv8
         oqim1Wqz0zG+owG4hvp9sen7zywyYaBuodm5Hd25cr8DsnsnF6JN8Us3VLRhTg4/GCW+
         c5Eknja8YkOC2fYVOjLRv2zgzvC85aiK5l9fB5feGxJcUHjG7QoKC/BdWViDNq79oXl+
         O7J3KSVV2F+SzerhZfmKgNwT1JfmdMtbzlreo91XMDkHADFCcKu5dZTeLau5rn7JQ2HT
         oQ7w==
X-Gm-Message-State: AOJu0YzddOyJLUue13A8O6fQdYwxdKYV1f6a3q7DSlRt9/Lw8BCf41kA
	Ma2fRn/EVTTZvbnUPjxTBBKDphx5HhL6s7aLmFE=
X-Google-Smtp-Source: AGHT+IE50QGy3C3dnhHBMEt1IPWmh5jDLnCHA9rchXZ7zetkMLzBeiAPqSoivMfhT15nNsz0/Nl0QQ==
X-Received: by 2002:a05:600c:259:b0:3fe:2102:8083 with SMTP id 25-20020a05600c025900b003fe21028083mr5007390wmj.26.1691927651671;
        Sun, 13 Aug 2023 04:54:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003fe1a092925sm10970082wmc.19.2023.08.13.04.54.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 04:54:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] resulttool/report: Avoid divide by zero
Date: Sun, 13 Aug 2023 12:54:03 +0100
Message-Id: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 11:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185873

Avoid a divide by zero traceback if unfortunate test counts are encountered.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/report.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index f0ca50ebe24..a349510ab85 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -176,7 +176,10 @@ class ResultsTextReport(object):
             vals['sort'] = line['testseries'] + "_" + line['result_id']
             vals['failed_testcases'] = line['failed_testcases']
             for k in cols:
-                vals[k] = "%d (%s%%)" % (line[k], format(line[k] / total_tested * 100, '.0f'))
+                if total_tested:
+                    vals[k] = "%d (%s%%)" % (line[k], format(line[k] / total_tested * 100, '.0f'))
+                else:
+                    vals[k] = "0 (0%)"
             for k in maxlen:
                 if k in vals and len(vals[k]) > maxlen[k]:
                     maxlen[k] = len(vals[k])
-- 
2.39.2


