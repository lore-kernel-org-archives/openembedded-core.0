Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA61C47DB3
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 15:24:15 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.14377.1705591450579226417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 07:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bF1kr4De;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-337c40fde20so1655283f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 07:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705591448; x=1706196248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/Gn0BlMR5NtnEdOPhanWOLZuLKDN6I2Og3toAFDxdc=;
        b=bF1kr4DeV9wFWE/ALSpD95m1J/ik1eTqBHfndsOKCPfjPJhK0jhXTwTsVPBHB2YCnN
         reNWUNUxNGjTxALRvVf4BwUdtNbWTY7TnwTQrc2uh8YNP8IJzUbbF00z6aoCeqPKKUgs
         Z7kx2MmFi7mZTHVq4HVXqjr5dYvKeYgLmzqHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705591448; x=1706196248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/Gn0BlMR5NtnEdOPhanWOLZuLKDN6I2Og3toAFDxdc=;
        b=mYyjcOwnERzKLntJsRJV7JfR7JDZOPJiBmvsgn2FTD3ELB+91RDjzuL4nBx8XNS1yv
         e7R8K8RQ+VxXE7mwfnJEKOIZxlZCAQsU4RCmRNr2skJJV5nDxZZm3t2zqB6G6eSA+5S8
         odqCfcdCj3m3i7psWFi9pnJh1UJIwa5Pk2PYOa7eQzoyrrH8hSZA8foCr4RU9W+cbWD1
         pokVTyNfR07kHfZHVWflQijlysWR7O5IvVeVmzQ64nBbFEZZR5jQRxo5Pw6FLoixpbcY
         GetDaFDs8oaOR47SWKQpvoLM6AzS8g+RW+RD0eIlwmDGULLTJOLstrSR1cc5WTyltP+f
         S0bA==
X-Gm-Message-State: AOJu0Yw/nxlDOSHaDOOA3XbhDbc6yK4X+oyIPvAG2tdjecj1bSO4QQ6m
	G59qVMemIujFi8YRyWWAlD1ZyiA2bxDyheDxDVFlEFyrcRx+uyFIyUXSKWeYAzAIefvpaXorbZG
	d
X-Google-Smtp-Source: AGHT+IH6GRTMcQWZp5w5DhwUNnTn3dl/R/jPg7DVl5Ur6H1o4Y2WyibuBYtkCwF/DAwpyAmcVYHDBg==
X-Received: by 2002:a05:600c:3548:b0:40e:7af8:d49f with SMTP id i8-20020a05600c354800b0040e7af8d49fmr598650wmq.121.1705591448591;
        Thu, 18 Jan 2024 07:24:08 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:40e2:c3a1:fc4b:1c22])
        by smtp.gmail.com with ESMTPSA id l22-20020a05600c4f1600b0040d6b91efd9sm29836920wmq.44.2024.01.18.07.24.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 07:24:08 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] reproducible: Fix race with externalsrc/devtool over lockfile
Date: Thu, 18 Jan 2024 15:24:07 +0000
Message-Id: <20240118152407.52596-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 15:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193993

We occasionally see races over the lockfile used by externalsrc/devtool
when walking files for the source_date_epock calculation. Skip this file
if present to avoid the issues and fix a real issue where SDE could be
contaminated too.

[YOCTO #14921]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/reproducible.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 9ac75c02e38..448befce332 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -131,6 +131,9 @@ def get_source_date_epoch_from_youngest_file(d, sourcedir):
         files = [f for f in files if not f[0] == '.']
 
         for fname in files:
+            if fname == "singletask.lock":
+                 # Ignore externalsrc/devtool lockfile [YOCTO #14921]
+                 continue
             filename = os.path.join(root, fname)
             try:
                 mtime = int(os.lstat(filename).st_mtime)
-- 
2.40.1


