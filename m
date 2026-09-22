Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49FAC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 13:29:26 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10078.1790083764906811236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 06:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Tjrd9UFi;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso2576182f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 06:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790083763; x=1790688563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CVE+EUkPbZ2HsN8KLyg48ZT4pWoUGhd+uZfJCri937s=;
        b=Tjrd9UFiLJadKp6Xq+PiNSyDPT4aSTFRvwNUILZl8vryXWNX/ZHnSAEQpm1TB7Ft5F
         DmQjAxmErb4IXSh6rOYMOuxTYU3WXDabIlXsHxx6QWkh0fwOGN71ZIdadfqXQNKBkGG5
         el0RrBoSYs78RX2bhEXsijeYG8gz9gMYhha00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083763; x=1790688563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVE+EUkPbZ2HsN8KLyg48ZT4pWoUGhd+uZfJCri937s=;
        b=d4QSidznWCCVGReafbVfGnMgc45AeDu58f1oURljaOW499gdvumj5WdpRz25/HXf1G
         fZKMSCw0g36gBOhxPkeNfz7yngL6HnoZ2uK/4DVkimJmq2gQcfFZW/F8pCkvOjO2xFSi
         AXmXFNohdJrIyO/v9H5mXEKMMNE0IaGUFAOVf3T8frHyuaNYCbelT6CtiSXN7O4mTPC9
         o5WUCgNl24TTteqijzaDxOw0i+5EsYct+FCBftBiaIp9/oN7JRZcSKMqj5zpp7M3vfWj
         f+P8Z1y3PGgQC2MccD2xh/ZLNi+XJozPC0wTWzA3duDO+U2+XD++zuy2nOTyfHTQdItq
         ZZfg==
X-Gm-Message-State: AFuF++n8BFe8pvupooNNBdXWWBBiJDTZbv5iU1adnzMk610UDKqAGfHQ
	ZcdRl/1KWlyYp9c+7lctmqYfILs8C19xWsLLeaDUKdLwuiundiy8TJro47up8xvzNK1romtB2t3
	MgkgmKLk=
X-Gm-Gg: AYBFou1ltLzI0WylpFcjIW90D6/gBG5OxsvyjR2N5ENJvmRf0H95gAhXv2QjFvrleuP
	rtTIOhTlXOwsZSsYxdusiwFneNIUNCnRfXPrODIRW5IsVKWubZ6jU5zNyonB3wJbSWiBZCUXeAB
	K+Is8uaFuPFLJYreeRr3Bl69W1SbGcwC31H1py1Gqxo3MEsOhiHRRe/vI0n4M+QjWyfYwdxEDW9
	MVhElcmaDdEls3qBEdGCZeR+OYeun5xZzdgPjikycAPYvFchU5jAOSck16tcC6Pej/J8HMzST62
	7/ZVP8XTIhOzIiW1HE5oyHelYOtUbJmgJObXeNVaHqfbhaHGifnQzFLjENQ1GhfbqMekwNYo/SW
	kr+ViMdgDrPJABAGsY5O5Tb34lJ1I/79sHA02EOPtttf0LlBCxSE+5/dRq7a0gHcNy6eWM4NcAA
	ggIz/ztWb614QwjLUlguYzKJDIj5PvqwUDs+1eSdJH92UIIEc0MI7UMpQeE4JiYXK5EJ4KM4yrL
	HEpJALYwTdpb1NkU+mpw4HWdYxFMv/NVbBVFVAWmSzGK2UvSnlqsus1CO0YFrxKr6rydewZiXrJ
	SaV4Lg==
X-Received: by 2002:a05:6000:2dc9:b0:487:22d5:955e with SMTP id ffacd0b85a97d-48722d5957fmr26009641f8f.7.1790083763117;
        Tue, 22 Sep 2026 06:29:23 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862731bf9sm5239724f8f.1.2026.09.22.06.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:29:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] cpio: fix "CVE:" marker in CVE-2026-66484.patch
Date: Tue, 22 Sep 2026 15:29:20 +0200
Message-ID: <20260922132920.1261261-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 13:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246414

From: Yoann Congal <yoann.congal@smile.fr>

"CVE-2026-66484.patch" should point to "CVE: CVE-2026-66484"

Cc: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cpio/files/CVE-2026-66484.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cpio/files/CVE-2026-66484.patch b/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
index 97ce9a785cf..538f80daf9b 100644
--- a/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
+++ b/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] The --no-absolute-filenames option affects hard link targets
 
 * src/tar.c (stash_tar_linkname): Apply cpio_safer_name_suffix.
 
-CVE: CVE-2026-66485
+CVE: CVE-2026-66484
 Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=e2b9cbdd3354d2b1569b7390d1bc15c1930559ad]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---

