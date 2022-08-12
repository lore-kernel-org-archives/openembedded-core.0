Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1F8C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 10:45:25 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.9213.1660301120057185119
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 03:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XnoW+1ai;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id v3so807548wrp.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 03:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=QhJmQr0Qw1vOjavIOmCv/E+Zir1UW7xtjq4rXJ4sS94=;
        b=XnoW+1aiS0OAoYWliSsTTDN6RkddR/aaSzQyc1ATyE1n4Tx5LlCVA7UIrMZwle84N+
         dUR9ZPD4lUefeJruXTqe+rt9R6f1lPXhtoKF0keCJRRlFWA0mgssUbtvanHB5LYoSSOW
         9xS2K8doXTt6MDFuTInBh0/qFZwiNREtiMy9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=QhJmQr0Qw1vOjavIOmCv/E+Zir1UW7xtjq4rXJ4sS94=;
        b=1Ril0bSKOPf0Z1V6ETs+PV0vrDzRLIsLsut9b+qL+8hmcN2SNoHHzJ4mIxbg+LgViy
         kvcBgEuUWz9q/8JahSrHn2K7poK6AYhBO68mc9nikb/hjgsepTqT3t0vll0+7ztLSYk0
         WmV3h7QkEVZkxLTDGhzZjqTUc1xvfRlaCHD8LmzzRq0jCCCzaP3lNFaRd88AbyNgURnQ
         NFRK41HKd+eX0q6DrdUY5VxZIweDkAERuazq+NCfwhjMrjnutKbg8C8bIv1PN/cQNYbF
         NThmVzADK2zkpwdIkhX7iR92LYCBaI/7/mdh6K5SMl6C3W4nMssguAhhmvvXhxrpLe+Q
         pkWw==
X-Gm-Message-State: ACgBeo01mIDWEZ11VO5X2TMLfJee0PYIvvBfCXaMZigCoHMsJzUYUPBo
	L7pvNEA0I377/7T9sRRgA0/TqSuhQ/F/2g==
X-Google-Smtp-Source: 
 AA6agR7WhprcLc1AM1FdJPsT5p3djMi+KdOmWhzvydpPusdlOzh/CokG/5MQrIemUdQ+uY+l3LI/DA==
X-Received: by 2002:a05:6000:985:b0:223:8131:e1f4 with SMTP id
 by5-20020a056000098500b002238131e1f4mr1759824wrb.65.1660301118017;
        Fri, 12 Aug 2022 03:45:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c425:95a5:4141:7147])
        by smtp.gmail.com with ESMTPSA id
 s11-20020a5d69cb000000b00220628ef654sm1587732wrw.24.2022.08.12.03.45.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 03:45:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] selftest/runtime_test: Use testexport in IMAGE_CLASSES,
 not globally
Date: Fri, 12 Aug 2022 11:45:14 +0100
Message-Id: <20220812104514.825820-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812104514.825820-1-richard.purdie@linuxfoundation.org>
References: <20220812104514.825820-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 10:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169280

testexport doesn't make sense outside the scope of SDKs and images so
use via IMAGE_CLASSES instead of in the global scope.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 70fff6c6541..0e63e73b629 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -23,7 +23,7 @@ class TestExport(OESelftestTestCase):
         Author: Mariano Lopez <mariano.lopez@intel.com>
         """
 
-        features = 'INHERIT += "testexport"\n'
+        features = 'IMAGE_CLASSES += "testexport"\n'
         # These aren't the actual IP addresses but testexport class needs something defined
         features += 'TEST_SERVER_IP = "192.168.7.1"\n'
         features += 'TEST_TARGET_IP = "192.168.7.1"\n'
@@ -64,7 +64,7 @@ class TestExport(OESelftestTestCase):
         Author: Mariano Lopez <mariano.lopez@intel.com>
         """
 
-        features = 'INHERIT += "testexport"\n'
+        features = 'IMAGE_CLASSES += "testexport"\n'
         # These aren't the actual IP addresses but testexport class needs something defined
         features += 'TEST_SERVER_IP = "192.168.7.1"\n'
         features += 'TEST_TARGET_IP = "192.168.7.1"\n'
-- 
2.34.1


