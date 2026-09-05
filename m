Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A53CC79FA5
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2477.1788641116188672438
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WsOpyMee;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48436216a98so1433537f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641114; x=1789245914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RG+UGz8kXCbmcT8X6CUUhIu6t/5vULHBXWDs6krkAGU=;
        b=WsOpyMeeQU9RH2k02GVp6gFZ6WG81BiwR/eIdvlVIs936JRqlsrhQQpj++Z+bockxx
         GFpxduyKBZyGXUfyoe6r2L744sNNHMB9bnYZ2fXG1Ew1DbrlC4cPUfgJL7mLo8zrOtYw
         o8bFiM7SxTISyrvoALn73/sbSBTYXRBd5NEXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641114; x=1789245914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RG+UGz8kXCbmcT8X6CUUhIu6t/5vULHBXWDs6krkAGU=;
        b=jFFPc4KyOtGz0IlkmoRUVleM6t2VmxYF8kWs9Jqmj6jkc/mSf051tzY6Lc+uQdHGys
         2Iy8ml0xnW80bFWl6STZt/DO+17gWOuXLgRqebO2mBQHXGKQdERgzYlW2gYv0iOUcGOh
         uKnpasZPFJQYxRj3+Vw0deixIrebShjgs7xmdy8+mxt71gacgtSVgy/jlFv049AODJBf
         Xpeff9Etjhyqc/qHd5xFvdLTsIUZzb5boaJCwMi2keHaBAFaCbCiuWkYJXKzLRjb44Kt
         NXTtyc1wGyn62zUuKjAjUeCYi1mN378adZFZMfswe4h2UOH9Rtpn1FaE5SZAWz7edIKJ
         C17w==
X-Gm-Message-State: AFuF++mD6VevpnAgzEwr5V7zBV3L34jp+fyEpkH2qud+UnBuHCBMNG1w
	/9h34eU4hYJJ4h41N8NuPRLSnpbeNV7/2GroJbN8qakygFZTZroSwmZCnEmRh7Bm8XyJZi8VmWt
	80l4E7pk=
X-Gm-Gg: AYBFou0eKOlaWuf+6UWlzCmLhoIrMR9vywBNIDzV47O4zziVO2pME/ZvvIz4DGz9ABs
	hgIOm9VYlCaC2c0+UGvrLg1Dxf+fmXFgajDd8tp7Mc9Bij0pybL+Kv2pAFxzvtMFNxhd09STUZF
	JfYAZo/ahcrFQs8fevhfLoiC4TUOUjbXyT54kQAuwu78Zv8kTeGlB3CEWe8QS3DBDCDcM9/2qFt
	qkbj8Dzo8HQU3kXVr5Nzx/DhKPNqo4dJMy6p2RbizYPM+UOmDqxhP3rMp4lwD57PsdMDGFu/Eeh
	i9XUc4gi/Uis1e3moG1rhOZBN5EHFOqQAGZGnKCWvInmCiaBnQLf+LIvn5SgWWyzDuDhx+EhRbo
	sKHy11bm1Slh/kIi2ntkMrpM0GMyQS4d9SFhJPzlvK35m2aQRU/caH5AV9vpbNMs4hSka2upP/V
	R69w2OGPiJaTH17dQQBZXPimhNKH1maGVqMTQ9hYFaaROdUSj2D6SjE0PmyvvEKpZ0MiCpo4nv/
	BJ9KqX6exOrAsRfUrVe4/R0aBfuYtvOOm4qDjJcXjpdUhB08tuIbQBQA1EvgBJ6E72iqlKYlznr
X-Received: by 2002:a05:6000:2887:b0:485:8c17:9776 with SMTP id ffacd0b85a97d-4858c179a5dmr11581527f8f.56.1788641114408;
        Sat, 05 Sep 2026 13:45:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/40] python3-babel: fix CVE_PRODUCT
Date: Sat,  5 Sep 2026 22:44:08 +0200
Message-ID: <9ac57f02e908cb8a110463ed7018ab0fbc8d3211.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245159

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-babel (2.18.0)
Before -> After: python:babel -> pocoo:babel
Newly caught CVEs: CVE-2021-42771 (locale .dat deserialization RCE)
Status: patched (fixed 2.9.1)

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 134175fa92b85e639dc4646d9a88eeaba0fae4d3)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-babel_2.18.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-babel_2.18.0.bb b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
index b0abb2c62e7..26847372bf3 100644
--- a/meta/recipes-devtools/python/python3-babel_2.18.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "b80b99a14bd085fcacfa15c9165f651fbb3406e66cc603abf11c575093
 
 inherit pypi setuptools3
 
+CVE_PRODUCT = "pocoo:babel"
+
 S = "${UNPACKDIR}/babel-${PV}"
 
 CLEANBROKEN = "1"

