Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C46F589D5
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 13:33:45 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19788.1776951224469378223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 06:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SMxDoSOQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso47360735e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776951222; x=1777556022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWH+UmhHudZjoa3aEnSLnR5ErTY7kdv0/yr6GMYjQ1k=;
        b=SMxDoSOQjZ/QyNED7ZL4R6H6IaCbc93tgXao38LP+2WuJWhBVIO+RUDtuCYD311WRF
         uJ4D1ek9QigDQIJjOJjxkuBXd/HvV8zGyo9Oyjv0lcZCbkgXo/7fd93c7mNK45t8jHNx
         zf+owCGGyKTjBcSg+aFhErwf/nIYNR/QbCNiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951222; x=1777556022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWH+UmhHudZjoa3aEnSLnR5ErTY7kdv0/yr6GMYjQ1k=;
        b=j9CoWrAMr5InxXEV5OAYgIE0Xwq+4wvN6zZYVqlWdSiW5Obk5sqdU/RZxM0mW8sVAd
         CD9+28eoWEoCfUdyQKyueCearxmQtuO0y+Sx5r63yhRltjp8uySnGhRJQCu5LXasTl8c
         spZyl/r4ibsUMMbxdG95zlUW/hg4O2svCSWSZv2pvPvRLjfoBNzNua9nfxRFAvJWoWUR
         9siZiUEmpKCmEA2wdkJ2qWUNAr7fHKVmJQZjI/ZN2sInL6atl1nHsu8rRZREPpgBhvGe
         FD5m73gX+YetVwef/TEVgffZLCqL+f2bxQLpLAOxP3hZ/WXyVUD1iXmYcMBq3d0TVk9w
         +tew==
X-Gm-Message-State: AOJu0Ywu+2N6ujyBQmo5nTSF+BYzcP/zg6rYEAIYjeZdy82+sOoZCeRa
	xQ0K89EM23Q+miqD1qSdE/kkfx4SzT5n0gZ9/Xl8D+fsaiSXWgL5ZkvEqw/cSnJHpeeqEPz6Xlh
	XiN3rToU=
X-Gm-Gg: AeBDieshvMCOIDSxHLHLJsr8prt/y/aG9dx6mU/7g8ZApgYSfn08eEgx48SzYfcX0UY
	miHZbUxQobmOwhuLsVH1LziMy1zRKETBHCUn6/zpWYx/X8NwoTls8Wou56Nh0enNBiFQHwC3gnc
	nFDnayimROCT4GQOvDhSnr23ldxmO18Iljbi/WjIAUr+zQEwjkLwbjLSwGCsNtJF5hpbGHUzLFY
	BaF7lWSqEWoVMH9CCoY7415tfMmevEqllVUPEyiVeueCZgKQeBt47Tosyswx9kFrDr9BiqhW8XC
	lOuPqC1LGMHYpqnbH2YSomQ9a0Hn9mpVIM0jmOzBpi+xwDhuWFNca1+ceAiQbjHQ1Cg++4YJNZZ
	CKxC+18ca57+l8fhoYIezwEYUhgsVuK10ALiurGC8DQxZVdpLT8wLWYgHJ5ZMhGK+L9Mt3hRmhe
	2MkCfrC3sxVwtO4NXEpnpvY6oCL3YoNwIsY0nRb4Y08E0Ycg0GfMp8d+MbzxnRQS2XbfxK6HshL
	w==
X-Received: by 2002:a05:600c:a314:b0:48a:58aa:523 with SMTP id 5b1f17b1804b1-48a58aa059emr103159475e9.31.1776951222006;
        Thu, 23 Apr 2026 06:33:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8228:dac2:8992:4ae8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc100162sm537001275e9.5.2026.04.23.06.33.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:33:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] sanity.conf: Depend on bitbake 2.18
Date: Thu, 23 Apr 2026 14:33:39 +0100
Message-ID: <20260423133340.1954703-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 13:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235770

In readiness for release and due to the distro_features fix which needs
bb.utils.filter_string(), update to depend on bitbake 2.18.0

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 71828542748..f80763bbe97 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.15.2"
+BB_MIN_VERSION = "2.18.0"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 

