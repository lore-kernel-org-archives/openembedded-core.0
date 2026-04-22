Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F3EFA1FD3
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 16:17:14 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86630.1776874632957786556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 09:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ReATKlpS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48896199cbaso56805505e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776874631; x=1777479431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V3UgYvZuiP2dEDKRd5JdtGGM5rEqNOa9UY258JNFn4w=;
        b=ReATKlpSWOFSxAKHSJMYs7ETtVHhIPhCzlIhgr7T4/qYcJDxAe+gIUqELGWeabXLrt
         siZ1IX8R3P3jS4yNHFIOv73iZOY+m+WcU8YGpVlQ1f4SRrHDo0ZVbTaoTVv7DzmsA+JX
         zCMcIkjLYzKngBJdiiJllx5LrIrf6Ev/osCrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776874631; x=1777479431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3UgYvZuiP2dEDKRd5JdtGGM5rEqNOa9UY258JNFn4w=;
        b=F2KcMZAx19drApp3yb2BgouWy3tVheaCHLAkIfIvvkaHJqaZbGGsmFG2EycxLpc0y8
         Z1tvQFi7aI00CDZ3czauy1NvWQ01iZhuDACv9ED/p3WR/wwIfBitle4ARK/DSv0Ic2za
         aI7+9ZLoq8J3mI7fexCpZWsrEZY1m+Be0kyQd7hTFCyNW/fGM/MDeqPM+QlW9hRABfsW
         rE7xlKhCCiYyhvETIRKPQAWw19IICufTk8BNmVLft2yug/H6kozUm1gCiurkh4CifMt1
         5MRr5AQiRLT9AASHWkKXLT5jD7afY6kXFJvNSKx8zzYccPXrBIJ6zFBcfFPJ2fT3vPP8
         CQOg==
X-Gm-Message-State: AOJu0Yx+mTSC2JQiaruGTDGHPpU01N2u+E7sMTp6/KNF99lrNpsucjvr
	NRmY6hAocCll2tPKQvk24/AC0A8U/wTystlLLL9jk33FbvOOe/ye0EcC44tFvz7P/9ls6TpqCZc
	kHmOOyqg=
X-Gm-Gg: AeBDiessTrcErUGmOEZ+Cu3tBRTAf1N2wFmtnawrp5+oURQDrCiYAhL9FLsS441gRUU
	wzfjg14yg3FxM+y6bQt+gOeAR/QatEGBLwQBu8ZjertwGK+g9ijCSs5++itmGaVDEUeGOEaqQlE
	bAlKh5M6EZqdrmjulwz1G9wSlpdyo/jk5cmTxlwbzRB9z/uqUGW3770Omj0amwQ4ylOQzBT8fuu
	xZOUNA+1jaAyYg+1SaprzOPbirQsNnUmGSY+QH8B2APcMLQlIQ0xYyZhipTQkY7XcdADvxHcfXg
	GqBKNROJ4ZNvd32zHi5/HCgLogVa31xcJN5VPp7JPaSPENQCWDg/VBoscwsCGmk7TnAOdu0Z6Zi
	zQMHbuUuYN31S6OQZGRy6NCVmYYZhVs1r0ZJZc5dngpK/msXCRIxH7qJeE2REgbiIllpb8LerKy
	7MiwbsJp/sH3/qQGM3LzN1eYjythVbYO3Zt8/tiLt9nJxuYUR8rd51iGlBqYLKvDo=
X-Received: by 2002:a05:600c:154e:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-488fb74fc02mr326808845e9.10.1776874630262;
        Wed, 22 Apr 2026 09:17:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a9c6:3deb:bd01:ef01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm248636285e9.9.2026.04.22.09.17.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:17:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/runtime_test: Avoid virgl test on opensuse 16.0 for now
Date: Wed, 22 Apr 2026 17:17:08 +0100
Message-ID: <20260422161708.597348-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 16:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235734

Currently this sometimes works but sometimes crashes the Xserver on that
platform. For now, disable it there until someone investiagtes/fixes it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index a337194f9b1..a3c31260368 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -243,6 +243,8 @@ TEST_RUNQEMUPARAMS += " slirp"
             self.skipTest('virgl isn\'t working with Centos 7')
         if distro and distro == 'opensuseleap-15.0':
             self.skipTest('virgl isn\'t working with Opensuse 15.0')
+        if distro and distro == 'opensuseleap-16.0':
+            self.skipTest('virgl isn\'t working with Opensuse 16.0')
 
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')

