Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AB7C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:35:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.13177.1685712905287007370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=TmRS1jA3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6e72a1464so19617425e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685712903; x=1688304903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXqUane1bpcOW4xXS00buX+/aurD+4C8L6Y41LdznoM=;
        b=TmRS1jA3ombBf+2zFxKr/HN64BLJMJ44uV4KpGv5VBRqVs6DBLAhA0cL1odqsIs8Ow
         GQQ9gB1JRUFHGzS+ulHquHc0/JzNs4IyU4k8V75+FOZt4jILjBBLfU+95zcmpnmFDO5t
         kBbF3wRWzmbrYatkuQToxgGBzon3KwOkLuk2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712903; x=1688304903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXqUane1bpcOW4xXS00buX+/aurD+4C8L6Y41LdznoM=;
        b=dP4CkbpxVi3jx2fOcEqLSZ/gJwhn2MEyvRJcOpnWjCCzxEiGz2q5CAuvI3ntPglh8G
         ZVc4xumXUiYJw9slZwNloVliWbi6yDZkNZUK2wzgbLw/BAQkMrQnNMmUpztdWeDsXQtW
         h4QMNUWIxMuw2mLIfR07jBUqq3s8ILegmxywnIkOJf5QHmMWjBFIvNdS468mDVp17okH
         thfuBH/koa2x+3WS08FONqOxG07wRVTgYDMpgdYxz8EJzdwGMBX6eZdSpNGEa0+bbZ54
         babQeiLLaa/4xuLVNwCzzzjeYRNnrTf/uJpN8x85CJSQGVr5TCZ3JprHFZIc/0OI9XGh
         oHtQ==
X-Gm-Message-State: AC+VfDx7DK1AAc8xQb4EY2dOYkt/gpluhIAJ5hoffr9ohe8J6a5Xptzv
	VN40ScXr5rkUhMUKKW8ElfktA0OMcuEr1AqiFRk=
X-Google-Smtp-Source: ACHHUZ7bGkPDby8ReP/Xs/t8gfslLqQBm6aHM55XCyf7F910yXMbrQCiulsenfsBAOAwAcCbL9wySA==
X-Received: by 2002:adf:fe43:0:b0:30a:e86d:17a3 with SMTP id m3-20020adffe43000000b0030ae86d17a3mr4400569wrs.46.1685712903647;
        Fri, 02 Jun 2023 06:35:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b003063a92bbf5sm1734262wrw.70.2023.06.02.06.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:35:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH 11/11] classes/create-spdx-2.2: Make license errors fatal
Date: Fri,  2 Jun 2023 14:34:53 +0100
Message-Id: <20230602133453.229023-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
References: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182329

From: Joshua Watt <JPEWhacker@gmail.com>

Otherwise the task is still put into sstate, which means the error can
effectively be hidden by ignoring it.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 7569f8792b2..844b674f6f1 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -138,7 +138,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
                     with open(filename, errors="replace") as f:
                         extracted_info.extractedText = f.read()
                 else:
-                    bb.error("Cannot find any text for license %s" % name)
+                    bb.fatal("Cannot find any text for license %s" % name)
 
         extracted[name] = extracted_info
         document.hasExtractedLicensingInfos.append(extracted_info)
-- 
2.39.2


