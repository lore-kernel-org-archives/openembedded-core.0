Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC46C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 21:45:13 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.31922.1718055907120184431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 14:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L4Cvy5M1;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6f9603730d5so1633973a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 14:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718055906; x=1718660706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFBiDKeDUZ9/hBQdQ9VlPPvnT14gcMjDLNu9L3pNmcE=;
        b=L4Cvy5M1/xNrXWFOYgvJq+j6PPb0uTPLwzrLdBvLtPp0lTqU1ioKSrg5bPapxLTRfb
         SDr2MSVEKP0ImKTQNutd5mPFgb06Qa7fuigy6Fs/zb7RSfFhKR7eIveVCvI09MrYBuin
         RuytduvT21qXfN6YyxbqTfFPvs+JpGUlF9G3HgiO5oRFWsLUKSUCctFPrH1IeOcgKxKv
         8xapchmsszjdZzjkZm/4miXrg9ZdIYfSJRfuSpkfO7Ugm3TJdw3BO/GqHq+s7UJU8tLG
         ZtGyo/R7Rfu0kLOJ4hkIuKcGMrkT5Q3PvuymgthK+XbU7VyBAwXcAuNJAsHFwrsdt2jH
         2ZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718055906; x=1718660706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFBiDKeDUZ9/hBQdQ9VlPPvnT14gcMjDLNu9L3pNmcE=;
        b=TchzMSOTKhx0nPNHSBO8azzNX1gdUZExsjF1qON80S77YvyXc+tZ7ZPWq3AeOI20mG
         G/6f960HTcFgihn0K8xHKxAH0zcPDmHh2RGihCGkVl5rcST1UE+R5PI+PVQ8qoxGFrUy
         R+ymPRU5AxlV5/ZoP/G5HCmyb9DsOhRBB948ZUNkeCJRl+UFQTZplUVvU4FCnc/9WBeU
         AjIdq6maxENzOD6ErJXEwsvlH9dvDQaVlcdaiUALp2SynXa9TWeVWst6ayaYHo8jLPy0
         JDHooNop6yADN7YBMHXIaVY6Dl17rkEO5KYioRK7JhsBGfHKyh0q9NF06ikqTMWb0Qb8
         M4pQ==
X-Gm-Message-State: AOJu0YwSR57PWmu59EOeNWw+aQt2fxVg5SjErLLX6kDkf8Led84fvmoA
	gYq6sBYg4DBWLMx122gAkbg02rFAEpclwiIphh7sJ6DC7BLeHt+ZxikfrA==
X-Google-Smtp-Source: AGHT+IGiuMgk7wq3pnapSfCjs2F53GEy2GgqfvMe2l+iTgPBm6zV31g41wtJsO0AnCcPPvsksKuiuw==
X-Received: by 2002:a9d:7846:0:b0:6f9:923d:f2ea with SMTP id 46e09a7af769-6f9923df5f5mr6287869a34.25.1718055905601;
        Mon, 10 Jun 2024 14:45:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::2cec])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f94dc70d48sm1888631a34.5.2024.06.10.14.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 14:45:03 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 4/6] classes/spdx-common: Return empty list from extract_licenses
Date: Mon, 10 Jun 2024 15:41:50 -0600
Message-ID: <20240610214456.2757397-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610214456.2757397-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 21:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200488

This is nicer as the normal return type is a list, so the calling code
doesn't have to deal with a None sometimes and a list others.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/spdx-common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index f6fc182838d..03f1d0cc278 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -58,7 +58,7 @@ def extract_licenses(filename):
                 return ascii_licenses
     except Exception as e:
         bb.warn(f"Exception reading {filename}: {e}")
-    return None
+    return []
 
 def is_work_shared_spdx(d):
     return bb.data.inherits_class('kernel', d) or ('work-shared' in d.getVar('WORKDIR'))
-- 
2.43.2


