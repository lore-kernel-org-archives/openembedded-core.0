Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80EAC77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 10:19:37 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.39336.1681294775527401384
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 03:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=MBoMk3ZV;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id f26so21357892ejb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 03:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681294773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VEWj5Z7eKHVKMIKthpZKvbV02DD5dwCFF6e3Kz0bkdE=;
        b=MBoMk3ZV9FMPULsKsvVzUPIIbUmj3y6CLhkkW5ewUaxkIUZPh/MGwpK81aR1nYqmqT
         gvrFwZ97z1wDJak1DAGha8DUbPn0/elb5GjUaeD25ZYP0OltC18NQOWQkiWnnJYh7YLO
         HavcTSSAIPrubzCHDqNG4Rcx17m/AiHCVIfkrO0CxotWMvNVod5VyxBjhBKqvk0IaiJc
         ungE6kenxzcAGivugJedbPwpb9LPh7GWWvD2eo62Auwmr5M8vCfWOeB61fdx1kAwErAC
         kvXC75MLymeml0clZrOc3JkFvxKD6GRB3+IJ34+jM+MLVqGEE8lcLYpyzU67fACHvDha
         w4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681294773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEWj5Z7eKHVKMIKthpZKvbV02DD5dwCFF6e3Kz0bkdE=;
        b=uRzE+pRBi3QVXm3cInliz8c6N4aRd1k40y13IbHXrdDh1AkTdIvANCvvQiMP8Cxe+9
         Z9RC4tGxdKsUgwP5gkgBexkJd9al4Mk5ibsQAiJ9JMdJ22xYMCd3deX/sXtkkS765zWM
         btKRVzoKc4rQOahD9FtK9ZAG33qOYRHtQU47rFKdjYpKn4e7Jc8TgemDlFdd1c/Jrr0S
         2XKisQC9rMkATYypZcNJimY4pYIHWIGvC/dbBmuyWAUjXUL4QHEo3loDsS1oaxIJ7Br7
         fULxM/wuY5c/UwDRa3n2u56Q2zQO95oqBDOtA7AQ2/sGO5v+jCPa0mUwAR8OoHrFBfMM
         usSA==
X-Gm-Message-State: AAQBX9eH2JRu6Pp5k0M9bVUrBamu7MOb7nrq4Vmy8/W0ysv2oWaIIgku
	crtC62RyJDGIJK9Ma7fXr3sMqD74fcg=
X-Google-Smtp-Source: AKy350Y1q7ufJiKB43akC6RCvC3LRLUZRSYTp/5vnEYC/kc052ToGCj0cBhiyVVYD8T3RDPHPRTpOA==
X-Received: by 2002:a17:906:f2d5:b0:94e:1764:b0b5 with SMTP id gz21-20020a170906f2d500b0094e1764b0b5mr5416309ejb.69.1681294773301;
        Wed, 12 Apr 2023 03:19:33 -0700 (PDT)
Received: from srv-tst-sta-04.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id qf11-20020a1709077f0b00b009477c83c3b9sm7064976ejc.133.2023.04.12.03.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 03:19:32 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] cve-update-nvd2-native: added the missing http import
Date: Wed, 12 Apr 2023 12:19:26 +0200
Message-Id: <20230412101926.1135184-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 10:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179945

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 1c14481c21..2b585983ac 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -118,6 +118,7 @@ def nvd_request_next(url, api_key, args):
     import urllib.request
     import urllib.parse
     import gzip
+    import http
 
     headers = {}
     if api_key:
-- 
2.34.1


