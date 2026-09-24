Return-Path: <pistora.tobias@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A588C98311
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 08:52:22 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3367.1790239933551357516
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 01:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dn4FSIiT;
 spf=pass (domain: gmail.com, ip: 74.125.225.141, mailfrom: pistora.tobias@gmail.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so12506905e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 01:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790239932; x=1790844732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8FQKFSJl+tyC5L27/EkU/69c9wjbyX1pfTrasvcgqk=;
        b=dn4FSIiTwX4X2lyB6kxv2HmPkozTOsEpPmiH12jk2QHuj5xI56tXtObafUhs1xUWUH
         /dcS236AkxqGujxBeV6eMFNyZFp36e1hkJ2nVYtT1WxQOitlRE00srDTf9N2CHptI9Oo
         IN6xkqG+qlxDK76tmjCl+srJuXwhGdgXqr3ReF7VLks7mycFAYpURThHFB4JDnIIPzVM
         KN7bDqXjVjwObnPYu7B83eDOTwxjAqQ3zIZMfFW54FIUmRBqQ0xb8WUDEzo+0iaP/kU5
         sQyIOzMe7Eat91FTKJkIU1SSlzz0hBIxDBUrLb5MIpuXMpsAp5+LiglFKZnpNVQrj3Di
         V/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239932; x=1790844732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8FQKFSJl+tyC5L27/EkU/69c9wjbyX1pfTrasvcgqk=;
        b=DvscySFR87NqSEn6dFMAwSrRkn68X2rZLOj4smV+x26PLN76shYxtkMyUstioQWcjh
         gZeiceUhsKImIhLLm89cnO7Rd4DS7pAKzgj+T00n+S6CsB+QplfT9f3mtZMIZNEo2Gql
         CS9AiSGxSQ9+qPZ03o0JYwEegTqFMAMLIDXBsgg+EMAyRqVUhhO6b0IeTEgk+jGZT+1L
         OHuej+dtx0JNopt0tTLPcJFlHMCyVNtjtK06PCFR1C3HUB2umX14SMdeq1gYrGEh/a5K
         8YfmrcFlM2PkiipJJZQmvmq7ZTv+1NlH226uGRwRVATsWK5He25kaloDkHADWHDpjwJN
         sFag==
X-Gm-Message-State: AFuF++kJ5t0KcIN3yLha7CAQ8UVBaLrLdB+I6Zt+m6kG+RcCOzOj293I
	MhcWWl/NrrJ7kqIoWytsdQ5vsq/lAPTmy5dPHWUtI5L4v8bBFO2rs4dzNGMTVg==
X-Gm-Gg: AYBFou2tjx7bv8ovvja2Q59Udv54YOVzxAJ+ZGKcqbfwsIrf7PHOI94sfErqa+Bq/Dp
	BLA4TmBc4TzPmnd4jycYb+/F8XKLRyURAID1uPPYhs9//znhch5Ivn32ZT3NCom0gp6BH/qTi1f
	30fP7e/lRY3XuK8kY4vVHe3j5yZQfET1n4Alz2i200UCiz+mlip7IRnOlpnRVN6bQYEA4gj4gZ1
	peWRwj7q7fuQ4l0wkhjROSuXUgXsGWFjkmuZo00dNoruCzeHUPYNawd+fs3cbmtU1TkhhizaQHx
	ejQIOnJVPtPmhYz1yGcu4qUMpDaiOfXbIEJz6RsI9iMlHrdMQ1XY+Pm5hKO638PhzNoa/L0kL/M
	5IjyGMkLxJ5O6sasK00H7bsKbZwUYoRgghPZQDakrRHSZITPRnYIurJEquIrNZhlWl1r2dCOOB+
	f3HKm4za4SAJusbd3Kv1hJQMV09pCaWZkEc9PtNIVOlkSTuc0N1Bg5c7cM3jvTJON4+kDKbAcFq
	EPfr9h0C02k/lgdVy7S/uiAlZlEyz+Q
X-Received: by 2002:a05:600c:3514:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-49fe6701e7emr28521155e9.35.1790239931646;
        Thu, 24 Sep 2026 01:52:11 -0700 (PDT)
Received: from se-pc-pto1.wien.schrack-seconet.com ([81.223.165.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm49558855e9.14.2026.09.24.01.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:52:11 -0700 (PDT)
From: Tobias Pistora <pistora.tobias@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tobias Pistora <pistora.tobias@gmail.com>
Subject: [PATCH] remove fatal error when .crt file is missing at fitimage sanity check
Date: Thu, 24 Sep 2026 10:52:02 +0200
Message-ID: <20260924085202.21862-1-pistora.tobias@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 08:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246573

Fixes [YOCTO #16427]

The minimal requirement of mkimage for signing a fitImage is a private
key file (.key -> using -k). Passing a public key file (.crt) is only
necessary when a key-destination is provided (-K). The -K option is
optional in the kernel-fit-image signing process and can be passed only
by the user via UBOOT_MKIMAGE_SIGN_ARGS. Therefore, providing a private
.crt key file is optional and should not cause a fatal error when
missing.

Signed-off-by: Tobias Pistora <pistora.tobias@gmail.com>
---
 meta/lib/oe/fitimage.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 1ac4b2c59d..484e5c5ee0 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -593,8 +593,11 @@ class ItsNodeRootKernel(ItsNode):
             if not os.path.exists(key_path + '.pem'):
                 bb.fatal("ECDSA signing requires '%s.pem'" % key_path)
         else:
-            if not os.path.exists(key_path + '.key') or not os.path.exists(key_path + '.crt'):
-                bb.fatal("%s.key or .crt does not exist" % key_path)
+            if not os.path.exists(key_path + '.key'):
+                bb.fatal("%s.key (private key) does not exist" % key_path)
+            # public key is only necessary when passing -K option to mkimage
+            if not os.path.exists(key_path + '.crt'):
+                bb.debug(1, "%s.crt (public key) does not exist" % key_path)
 
     def run_mkimage_sign(self, fitfile):
         if not self._sign_enable:
-- 
2.47.3


