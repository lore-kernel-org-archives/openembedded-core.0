Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04296E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:07 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.5185.1735810864793690979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GI5aoWUb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso71197685e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810863; x=1736415663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IDIEMLPiazonl7IbXpmR9S3Wlmi7H4v6NNmON4b27E=;
        b=GI5aoWUbWPLPD0GxpVBN/mMTuQKBsfSOhoQ5xkqs/DMOmSYBeTBbs+sPXDiWEF1AR+
         N5hKMlIZBqyca0SLor47bKiaKTPLrcuLMqv08SDvh9k1Jw8tqab8scoGSVFVK+CcuB2u
         5FEpifbM9rG8RLjhermIPQlT+7HuwrDAovWXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810863; x=1736415663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IDIEMLPiazonl7IbXpmR9S3Wlmi7H4v6NNmON4b27E=;
        b=S7jQ7VLw2eeuTUapZmuuY/30fWp7DqPA9iqu7pNfWBwfX9YS767KMPeONI9i5cy7eX
         LSMcORyBq6rM4gDBfBhHUsazkS3zXjLmk38Pg3w2ZAJwoSfna11AqlD5xaM/vQbDKazQ
         uCHH2R07FJ2boXAEPrQA79jTZEnxEK94o2pQftVHklB6wM0Jfmz08ZlAPqfh26+91RCT
         GeJP1RkKmSy7wHywQZyGbinAt6c0oMB/Qa2LpfS/Y6spfUKoZk+kDiOhTtMdfy6FkzwH
         RZS4jWgEAtzAzFs11fdN7rJBkj6xJ3yZDpZdDsxhWMBSaUjSKTKangHsn+NDw7y/1VHK
         6yCg==
X-Gm-Message-State: AOJu0Yz7KOn9BCGFLEFhRvXgA7dT+OkPclB6g/6HNlrdV7KYKDCN9YZF
	geTspyjbJA3zcZhnHJdlIdBcaJSgNQee7dQU5j7yPE2hiVEAHm/Dft6DF3Ca5gmkIQYsiZOUaL3
	4kHg=
X-Gm-Gg: ASbGncuk9uwJb2bvTk+VuovaSEgrn92RVJ4aZbtqYY1NJ61ZRpvRkMvQEdehuZIifpW
	0nWh1LvBWKS0GuRL2TJirHUpIO/YkFp29XODGVUFMmyu1FJlx2cMvWKLD6gb5/45m6xPlcnCIuf
	12ZYZAz0+2uOCHBhjOoiAXetv2k5jKWNPpA+bOc5rRR5/4P9xOcqy6rSr3nneRzuod7vEw6SqkJ
	UvlXjlSEuYXCbSr7bp4d71g6FoVjTx9RshscynWY5G3/c2awhVLtoxPdi2wL9EMZEFU//zGaKZ3
	JOCsTf2A7w==
X-Google-Smtp-Source: AGHT+IFA7eIZLv9o1yqNZH4iiWHLJYKyix/t3+YjAzrZOb5TVCsMbNHW0sGREeu/K/2eOwFue4dNYg==
X-Received: by 2002:a05:600c:450f:b0:434:9f90:2583 with SMTP id 5b1f17b1804b1-4365c79294amr406201085e9.11.1735810862633;
        Thu, 02 Jan 2025 01:41:02 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/21] bash-completion: upgrade 2.15.0 -> 2.16.0
Date: Thu,  2 Jan 2025 09:40:33 +0000
Message-ID: <20250102094059.322187-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209262

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{bash-completion_2.15.0.bb => bash-completion_2.16.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.15.0.bb => bash-completion_2.16.0.bb} (92%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb b/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb
similarity index 92%
rename from meta/recipes-support/bash-completion/bash-completion_2.15.0.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.16.0.bb
index 709443c067f..d1a8f5e0ccf 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb
@@ -14,7 +14,7 @@ SECTION = "console/utils"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "976a62ee6226970283cda85ecb9c7a4a88f62574c0a6f9e856126976decf1a06"
+SRC_URI[sha256sum] = "3369bd5e418a75fb990863925aed5b420398acebb320ec4c0306b3eae23f107a"
 GITHUB_BASE_URI = "https://github.com/scop/bash-completion/releases"
 
 PARALLEL_MAKE = ""

