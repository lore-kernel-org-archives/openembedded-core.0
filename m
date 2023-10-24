Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47206C00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 18:40:12 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.155687.1698172810955339775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 11:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=uxr8lgLV;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-41cd7a3e8f8so31004881cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 11:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698172809; x=1698777609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=deX2dtOm70r+uisH6XsyMT20znT4MhZ+LgQT4g0vamM=;
        b=uxr8lgLV/WRdbLq7NuWkY0cN8FB8enDfFlgud6p6SG+IV97gpcT/XOFvK19FIEDqlf
         P3AUv9h1sCGegIW8zGf97MDHVHfuvOGHvl9n1eXTGUfUfXDHTnNzMfkkCrUFuKAwp/OR
         lJJpLzYCtqEHZbceEeZdhnmOmx0Ge4T8gr8deBWP0DLwwvaF1M4kBy5vMPGsD8XZTjbY
         Y1Fa159Wjt0fLkMd7hp5Db1VhKx/bQTI4mJ2IGfgQK18ch+XWIdypog3pOHyKyIP/Riu
         uXzhH30YtNivx0/t4LbY3msGvkTYOJXZtm73xP2+HOHU/MFHOWVEagdjR25NVLrKyHnw
         0FdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698172809; x=1698777609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=deX2dtOm70r+uisH6XsyMT20znT4MhZ+LgQT4g0vamM=;
        b=FrlIOCNK0DCqBDBXGIzrU5WOIsiI317zRkLPykiLIfS3QBF/+6lsva9GSfXVD+qyBH
         FntPRfOzPWO8uoETPLIsiYosmXZHsZrWyquydL+kpRplz5gwgwiQ1e2MlArbluiRO7Kk
         uGlvVwkAMe2L2XoZLTWwHJRYRNI/ydBGGScr6LZqai+d4YiXohRAsNJlv/Az0exLTkWg
         AuwAzxjla52WDwjkD/XNmuXug04UoU6OpZejQcxc/TcDn+GAin07LUuKWxhv10LJu5cT
         wJNVKE+E24n4/WfNr1Wi9rRUFwy3qNK3gWphcuW/Bs5LriftjmpnI4x5lCjFD9pWDRiI
         nz4Q==
X-Gm-Message-State: AOJu0YwVVANWzYlLHXlMtDKV38zESNbmmBS/rcYcNzV1YFk+4wd2OX1k
	nvJl9CzCaIxDiAiMLk1UdSY+fAZ3WK3luBGpviw=
X-Google-Smtp-Source: AGHT+IFk0SNj+cjixw1xGGyd8Npgah93fcAbnZMDUveR3yU5wziABN9OglDLF13iirSiLaxTGt6Gkw==
X-Received: by 2002:ac8:5a85:0:b0:418:11ab:1c00 with SMTP id c5-20020ac85a85000000b0041811ab1c00mr13619958qtc.49.1698172809548;
        Tue, 24 Oct 2023 11:40:09 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id 9-20020ac85949000000b0041cf5ec8b75sm2464561qtz.96.2023.10.24.11.40.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 11:40:09 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: disable merge test
Date: Tue, 24 Oct 2023 14:40:08 -0400
Message-ID: <20231024184008.68387-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 18:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189656

Disable the merge-on-head test until patchtest properly handles merging
of series subsets and accounts for patches that are rapidly merged (i.e.
before patchtest is run).

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_mbox_merge.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/patchtest/tests/test_mbox_merge.py b/meta/lib/patchtest/tests/test_mbox_merge.py
index f69d57c71b1..535026209f7 100644
--- a/meta/lib/patchtest/tests/test_mbox_merge.py
+++ b/meta/lib/patchtest/tests/test_mbox_merge.py
@@ -18,6 +18,7 @@ def headlog():
 
 class Merge(base.Base):
     def test_series_merge_on_head(self):
+        self.skip("Merge test is disabled for now")
         if PatchTestInput.repo.branch != "master":
             self.skip("Skipping merge test since patch is not intended for master branch. Target detected is %s" % PatchTestInput.repo.branch)
         if not PatchTestInput.repo.ismerged:
-- 
2.41.0


