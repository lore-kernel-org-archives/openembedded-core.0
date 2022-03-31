Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F6BC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 11:01:56 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.5723.1648724515315152012
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 04:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WcHz7QdK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id u16so33251512wru.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FK7txEAu4fO3cu3Ankujpl9FAEsIoIo0KcviBTI5to0=;
        b=WcHz7QdKT5LkokHHV4ka/KYVmu+2QAzuNDwg8bGMPARXKYsEm1HhNOr8tsyHHKfiLI
         /Usem10kSmDGrIbdsmqPLLNLEKhtBNGo7z6ZOKT0lS9k+jA+L8USwnpqWFdFQMdUjyuP
         tiOdR4kvx4n/kEoX/GuL+wjhuVoX6XvBKQY3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FK7txEAu4fO3cu3Ankujpl9FAEsIoIo0KcviBTI5to0=;
        b=eWuAIxYcxqPaVpKKmhwQcseT5CwihJiTrgvuC2y+vY4w8tasD3jg19l6R274eNw47g
         IGF3Mtw3R4PXR3n0ry/cbcnsBhz1Gw+553NipQpD5qWwuHd2sXLZ54HBEXFdhskacwRm
         U5iDNh0DR0gTzwTP9RjpAMzjzqmnQE7sdf0+tMObwrsu4AVj3VWuksnaZGxlllkLbr5Z
         lM9sPVia6RFAaj5/U+YyYB7pyIVRIgdoyNrHkY56TBMWAfzlB1KN4oOQ13YQ/1n7S+T8
         lmk37e/LtfnsB2oxzUPM3l5DjID0ZQJPb8JbgfHmoGFW0JSWFmNA9JRILWfjNEth+HsB
         2ArQ==
X-Gm-Message-State: AOAM533fCxu2e+wEQWuveyGdH4OewjgW8p3ipw45CVqiIPtvQAVmNmhx
	Sr+0n/AbtQw8Dvs+igs5px9cQdJtoN0YCcO7
X-Google-Smtp-Source: 
 ABdhPJyw3voNFWwpoXmdaZK+TQecZnqKxyPcBCI46h/KxTUgkQofzfYU8MmFcWyjY7TBAVy9zjyOAg==
X-Received: by 2002:a5d:6b0f:0:b0:1e7:9432:ee8c with SMTP id
 v15-20020a5d6b0f000000b001e79432ee8cmr3596749wrw.216.1648724513199;
        Thu, 31 Mar 2022 04:01:53 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6605:7b3b:ef3e:a309])
        by smtp.gmail.com with ESMTPSA id
 v18-20020a5d5912000000b00205a7d0c6a3sm15296708wrd.69.2022.03.31.04.01.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 04:01:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] base: Don't add duplicates to sys.path
Date: Thu, 31 Mar 2022 12:01:50 +0100
Message-Id: <20220331110151.1562779-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 11:01:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163808

We can re-trigger this code and there is little point in stacking a ton of duplicate
paths which just waste time during searches for modules. This could in theory alter
layer module search order but that seems unlikely in common use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index cc81461473f..e51722d945d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -20,8 +20,8 @@ PACKAGECONFIG_CONFARGS ??= ""
 def oe_import(d):
     import sys
 
-    bbpath = d.getVar("BBPATH").split(":")
-    sys.path[0:0] = [os.path.join(dir, "lib") for dir in bbpath]
+    bbpath = [os.path.join(dir, "lib") for dir in d.getVar("BBPATH").split(":")]
+    sys.path[0:0] = [dir for dir in bbpath if dir not in sys.path]
 
     def inject(name, value):
         """Make a python object accessible from the metadata"""
-- 
2.32.0


