Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374D7CDB472
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:38 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5964.1781960427784995832
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dX2k6ZvW;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so2348993f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960426; x=1782565226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59Xl4paUOIHgE/1ss/y7DyL709KS1y2/ZAHv3OnvLCM=;
        b=dX2k6ZvWRLCntxBxjzupS7pqrxBiC5UUU6FFYNu7w6hS3r9XLE4CJOhZGYbJzdJuJ8
         PnSyv0+5ylmnW4kMe0QWfA3mJP9tJcx00m80vMnLNw4wGoXv1tzWKlH89Ao9K8Dq/PNA
         E+4SwaUK8FtTXsSbhOJb4S5KFr31RrRK22FQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960426; x=1782565226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=59Xl4paUOIHgE/1ss/y7DyL709KS1y2/ZAHv3OnvLCM=;
        b=FkvWt7cGEoAeRb/aYz1T8OvBVJtYDqWPevw83st5e1eBCwy7Sr2PDaHf962Aq/A395
         kGiVof7t6HcAlRRtha2dpaE1c8hMREvpFGVJE1LvCIIpj8SUBnE/H9BS3lNXc/tN+C/4
         zXGvLqIT5jPxIUofJ7zit9zu4Yg+CZmsC+I+9nLplGzTIG82VrHy9HeuCVOpE/XFX++3
         F/dyGj6hyHUyozdtWbIZrkfg7bnOrBCHKX2iLjPiEWbMIfS7R9S63+Dux3dVRouG1wpZ
         XiqAhwBM+j3iZe8kZVyc+4M0mK/cuJgYqnZUsNWlkYzYTp7lECVYKSQbWuoN/iQ8pJ97
         KgRg==
X-Gm-Message-State: AOJu0YyU9/DNMK+xS8NUz21E+qqfuBQWhO5ByEfhrzATiaAlNpPIHGGr
	6/DMDiPrBbDTskp6AlLoC0iCMtxa5mtgTgy1Gj7+lzgp9iiaBl33jUJSPzeiOnc72IS/dkghMeb
	8waV6
X-Gm-Gg: AfdE7ckLs1OYdG2R5nTFlpC2IFHuqd2pVf1rJ2do0IWfHfnwSC1+iJR24W+gVArR2a7
	/+C4pXicb5m6JNHG1VTdzIxqYo4dqEWGJxeoSHRB/Hrz6iUmQCcMi1pZhH6UOphbfkIyhmV6dSJ
	08XJ5Kfa8BZgDHPb9bZawcq4F1gxgtMxIZ+HoMAZBX0bC+WhpPkJlTu6k5FuFvmVoly0QKKBpS9
	MC/fjEm/pUkbRWDB05DcWWcTlNQ5Flo6PjZ13xFq88/g1VaDl6rUqkMRiHOHcmG30rqde8GAJ9z
	6c72yGIGV7YQJsTNdar7i/T3kEOCHz+G1DBZ78fbHk+H0AoOzPAmwGSUp37UyApKQiX4ZoBm5Tw
	UuEoq1Z9Z6sZFPww6dmhmDrjY9uZYnwGxpp2ou+uM+4jXL+/S2eR/0xk/dMbiLonKVn5JaNmYpn
	U9Vx5R4fNFXZbSupVGQwmVjhOMm3DRb/6k88lWKgM93GqcUgqCGFlOekfKo84+0G5JIT8sery58
	xmwiw74CAn6W4H2
X-Received: by 2002:a5d:634b:0:b0:461:bfd6:5109 with SMTP id ffacd0b85a97d-46501b5ac77mr9615413f8f.22.1781960426031;
        Sat, 20 Jun 2026 06:00:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 26/36] ttf-bitstream-vera: Use SPDX license identifier
Date: Sat, 20 Jun 2026 14:59:41 +0200
Message-ID: <4133d2b38e12ebecdcb41d01991d180f661715ee.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239236

From: Joshua Watt <JPEWhacker@gmail.com>

Change the license identifier to use the SPDX license identifier
"Bitstream-Vera" which refers to the same license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a4a3816d33809be3d7e5601ad4ad176369dc09f2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index ebc836d801c..d086485c92d 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -6,7 +6,7 @@ and bold).  In addition Fontconfig/Xft2 can artificially oblique the \
 serif faces for you: this loses hinting and distorts the faces slightly, \
 but is visibly different than normal and bold, and reasonably pleasing."
 SECTION = "x11/fonts"
-LICENSE = "BitstreamVera"
+LICENSE = "Bitstream-Vera"
 LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
 
 inherit allarch fontcache

