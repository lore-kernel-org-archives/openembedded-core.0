Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A0DC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 06:43:43 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.34623.1715928213357090175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 23:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SN5e6e1a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4202c1d19d5so10448295e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 23:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715928211; x=1716533011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMppiIEJDW3esIPUUq+/2hYM0NsFD5cS/19UTSaZCuE=;
        b=SN5e6e1abOWqwEQIR2Nn6yBVTrSHK9jaSqRScnyVuj1oq5L2YByfwcz/HGzr0EgxDR
         Jp4Zu1VF8Yc+pPdPB6JwnKdlYbqypRzJzFi/ZvFoc4i9ECBimMhYy4Rcl1nXZKnztRmj
         mn8i/LCjB5jAtEj2tWWMIY9AL52ZnWE9ukwlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715928211; x=1716533011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMppiIEJDW3esIPUUq+/2hYM0NsFD5cS/19UTSaZCuE=;
        b=C/a5WrFMj03pDLi9TwLqFqr3JOXsv79/6yzArFijpmHZLcKB7fkVL7DLQZ4Rplu9m1
         4XTtxu24RIpcVOeT9JpCMlCBzmfwRUCBstXljg+9lc5bg0NGwTjH2sWJGwEhdcqPbExf
         RVr6oZKrwdfisCUZPZQKnxKhOpL3Z0biYC0wgHfzBtYHJbHUBRF7mh0hoQJtjbAxUS13
         21Nl1xnmGG44g0AW1e+zYzfij47NSwsgD+PeZ7DdSNd1PaBA9qs49g2HWMCbFUYNA1QQ
         bxixf8aO4yqHpkGtRg/Bf+HMyJWX1IbTN1EfAeuqaurb3fQ3Sw9kRHN5CDid2AeSdsHH
         d3tA==
X-Gm-Message-State: AOJu0YywYDWrP48cnTbkteZ5T5LJz6Sa4rQl0T3+Rc8gmHaoxqC0QLGF
	cIuPXWq80DIhrQ7ZgI35oYJf0q7CYK1VI3pOw1fAtCF0xBqSo7+zpMKARW69BKnLu5ziCXXQ1NF
	GJGc=
X-Google-Smtp-Source: AGHT+IET9W6Pz4QTVbrW1ACAsy/hlulyMVGS/7FZaU0zg9zvexar0RLCwfHskSpqnwl3RWVc6ZIgBA==
X-Received: by 2002:a05:600c:1f83:b0:41c:190:2ba9 with SMTP id 5b1f17b1804b1-41feac55162mr189784355e9.31.1715928210976;
        Thu, 16 May 2024 23:43:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ec9d:c0cc:86e8:686a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fdd402518sm279224735e9.27.2024.05.16.23.43.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 23:43:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/cases/runtime_test: Exclude centos-9 from virgl tests
Date: Fri, 17 May 2024 07:43:29 +0100
Message-Id: <20240517064329.796326-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 06:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199505

Similarly to centos 8, centos 9 doesn't support the render device we need
for this test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 12000aac16e..13aa5f16c9b 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -273,7 +273,7 @@ TEST_RUNQEMUPARAMS += " slirp"
         import subprocess, os
 
         distro = oe.lsb.distro_identifier()
-        if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or
+        if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'centos-9', 'ubuntu-16.04', 'ubuntu-18.04'] or
             distro.startswith('almalinux') or distro.startswith('rocky')):
             self.skipTest('virgl headless cannot be tested with %s' %(distro))
 
-- 
2.40.1


