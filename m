Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2AEC48BEC
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 20:52:14 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.1608.1708030328546973732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 12:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=yzbpOrCp;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7872bc61fd3so53463885a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 12:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708030327; x=1708635127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1hRF2qh9Gd/TFMI+/EF6nyiQCCZTtwI5nUQ+8srYW4U=;
        b=yzbpOrCpNtLEo6NUjwanCkAWPfmThGivdAPtch3hehuVCpiEATxYQK313iKrMU4RyS
         Dk33AYSJVXOHmzwMqGQjnT1CAoeXEKwz8PdoKxaCyGuUxUeOc5vAqJ8pvWAg94ztooQh
         I6WppMz9koBHZxntkBicqyCi6cUMwLsuLuSONhLsGPgZSUmjWJoTQoAkhYezxznewbnv
         A0zRs6/hPzlTD0K2ppZK3s8/dvY4GQUDP0HSjG/YxbMn75aYAnR5IYoPGK62TmVyAgqu
         W+2W3bcdaRxFB6EqywvqVqYW8+F9v2L+03Zy8AuR+exNYusObP9YuSqkocDlC03w4Pqh
         7KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708030327; x=1708635127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hRF2qh9Gd/TFMI+/EF6nyiQCCZTtwI5nUQ+8srYW4U=;
        b=I0MGaepxSbe0tjPEqaddc2DjojXYwZFHWCk5JvfdH0TJPpZUnw2Nav0LlUdmyGQEZT
         I1kw7W+xoWU12TmWwdaa3LCtNd7PWGqPV4O1AmkkJYVGt7kB+7J5nK9+I7QvY9q87m16
         tnNGhBvExzEoIonXCNxd37+9vKvqMwnCAgeBpXEgbmtDgG5MJ4at555YXfpY3imlU5Uk
         m8tnXBCvxYqC3/qmbLkrEMpZgmL8IzfaGulAGjmNYqZi3WVBdYIZKjKNqzln0MiZCGec
         l53eUXTW50r4BXHGPUDy3AD/YBjduhvUY8rwJzswXcLoTKBwy/xCZ35VZUmPJA07F4Su
         ExNA==
X-Gm-Message-State: AOJu0Yxpi5E4mXwG5X/ElUeAZUg+oHfq3fsS5JdXDtnAlotA7R+Z4stR
	F+UoqA0lUpz2NHQmCtASs63OaD5/Qtb/M54Zho7B0Ys3x/qnjr0/3VmMgv7/dQeTPySAxrsrQBh
	X
X-Google-Smtp-Source: AGHT+IFzzeqts9i6l84Bj0+kV+KtsoQSWEi0ToC3g6aa2ym/2HceqG1DM6ufMgfCTrKclsSOr+F9Hw==
X-Received: by 2002:a05:620a:56e:b0:787:31f0:b516 with SMTP id p14-20020a05620a056e00b0078731f0b516mr3081669qkp.10.1708030327289;
        Thu, 15 Feb 2024 12:52:07 -0800 (PST)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id k9-20020a05620a0b8900b0078728bbc801sm927388qkh.61.2024.02.15.12.52.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 12:52:06 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] patchtest: Fix grammar in log output
Date: Thu, 15 Feb 2024 15:52:04 -0500
Message-ID: <20240215205205.3314474-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 20:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195697

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index 8c9a73e1dba..d0dc6e8fac5 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -162,7 +162,7 @@ def run(patch, logfile=None):
 
     print('----------------------------------------------------------------------\n')
     if premerge_result == 2 and postmerge_result == 2:
-        logger.error('patchtest: Not any test cases found - did you specify the correct suite directory?')
+        logger.error('patchtest: No test cases found - did you specify the correct suite directory?')
     if premerge_result == 1 or postmerge_result == 1:
         logger.error('patchtest: At least one patchtest caused a failure or an error - please check')
     else:
-- 
2.43.0


