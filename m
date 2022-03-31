Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D59FC433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 11:01:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.5663.1648724515862520949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 04:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NBnXIwo4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 p12-20020a05600c430c00b0038cbdf52227so1782564wme.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=60oZfcdRQULmG/GFK9EeuanTXInQGghEmqogUMvS4ks=;
        b=NBnXIwo409ocRrqWniwSUcoDax9iGEzK6ccDAbdKgfNMsvgQkO6lyf5x1i6vRyoQ6P
         obh+89mPBZ2ufFdWc/KrhC9H8AuDKTHebB5Tj/skKIwzwqsd0nm4yTXkhEMZP/YvyBV/
         tz66i9x2u+00mX88vvPm/qFYjVTDmqawNfdBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=60oZfcdRQULmG/GFK9EeuanTXInQGghEmqogUMvS4ks=;
        b=u7BB0l/xaN89u0r9L08mQirPsxqK6Vvzor0JCsv5EdTq81FVyFGalgxGDr0iQ0rRwW
         giP9fDWnn7gNafehITHmDIN5CsWs9TCR8dZDiOuxd9ILU/N8uNDGFOW6RL5Q6DgzUNgQ
         a+1petZ5LEpM2DXkeOCrZxtDYywv89vmWy+jI/m98V85NfX/5SbGM78pFyWrP3gl7mIo
         kVRvW4ktJXKbqTwKIqQch2CAnaxdz7+GS/+9pdvlxoWuuiw5zRiRKKya4JfaE79HeQiT
         x7pAewvKSFzNomxfCaBbx/zWqWIl95MPY/HH7aVGFt4nbxfLVABihaOGj6h0i3+lyr9R
         /Yjg==
X-Gm-Message-State: AOAM532SUyNYIQIqImSRyny+9CGo9xXJ/kHvOrP0nsw3p+7svcvg9Wo6
	gubii7lyut7wsMA6FUmax8BBqpIsLsj6W2BX
X-Google-Smtp-Source: 
 ABdhPJzbO8+kFUj8J53tSVJxZTl212WUa1Aerh+o1cWZUFZZwz9PGu30MywCRBRTBLEL5T+7zhR8uA==
X-Received: by 2002:a7b:c14d:0:b0:38c:801a:a8b3 with SMTP id
 z13-20020a7bc14d000000b0038c801aa8b3mr4250832wmi.40.1648724513899;
        Thu, 31 Mar 2022 04:01:53 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6605:7b3b:ef3e:a309])
        by smtp.gmail.com with ESMTPSA id
 v18-20020a5d5912000000b00205a7d0c6a3sm15296708wrd.69.2022.03.31.04.01.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 04:01:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] base: Clean up module import compatibility code
Date: Thu, 31 Mar 2022 12:01:51 +0100
Message-Id: <20220331110151.1562779-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331110151.1562779-1-richard.purdie@linuxfoundation.org>
References: <20220331110151.1562779-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 11:01:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163809

This code was for old versions of bitbake which we're now long past. Drop it
and simplify the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e51722d945d..3515720bf95 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -23,18 +23,11 @@ def oe_import(d):
     bbpath = [os.path.join(dir, "lib") for dir in d.getVar("BBPATH").split(":")]
     sys.path[0:0] = [dir for dir in bbpath if dir not in sys.path]
 
-    def inject(name, value):
-        """Make a python object accessible from the metadata"""
-        if hasattr(bb.utils, "_context"):
-            bb.utils._context[name] = value
-        else:
-            __builtins__[name] = value
-
     import oe.data
     for toimport in oe.data.typed_value("OE_IMPORTS", d):
         try:
-            imported = __import__(toimport)
-            inject(toimport.split(".", 1)[0], imported)
+            # Make a python object accessible from the metadata
+            bb.utils._context[toimport.split(".", 1)[0]] = __import__(toimport)
         except AttributeError as e:
             bb.error("Error importing OE modules: %s" % str(e))
     return ""
-- 
2.32.0


