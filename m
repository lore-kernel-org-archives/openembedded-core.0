Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A145C001DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.7492.1686734988786673963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NwRuuXUS;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-977e0fbd742so66533666b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734987; x=1689326987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p5ESz3sANiETumnL5TgeCeuL3bofMt/WkW5LCS4M9s=;
        b=NwRuuXUSR76ur5jqykNM+r9QcJE9CEj2Ib/U+HBGnkn5kvtfjzNsfK+iOWW+IpXpEn
         Qvc9LiNzUwCJdEIPd0LRndLG9xFgP3x5qFDkAFKbj2Oj41Q2rMy8UNECDq0ukKK0KrYR
         PxkC66vt+s/vc+1vlnx8wLs8DUi3MiME1tbbdbIn+ALcg4/0eeCi9HjSvHskhX/OAXAh
         QlGa4J4+iboq7TRll+fm/CUaMSCFkFiUr1gIf12mb9PZGDY79LaEucvE7p5LnNYCIygl
         TFd457WrNNVhaNPIrk03DhwSkeauZSdlYAXiptp1BzfOliATyH1RwGBVlzqbwfQyF0at
         3MDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734987; x=1689326987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6p5ESz3sANiETumnL5TgeCeuL3bofMt/WkW5LCS4M9s=;
        b=dL1I9Rn5xA7g12/Fjc5a0kvv43BbZHrZy6ijQB+O8LSxzbji6Tyuc4VjqguHNghiDt
         sHdZkcPmYKUZYa05AUxTc+U7shG0GpetEB4/ROvwsk3mUmcbgGNb68wc/CRMrCC/xfzD
         Izn72Z/7srvWiWdSnzMCu7/q+8ly3im4ukcbo/tuZnuOWxdqg/K7BFD3e014HRWPYz6T
         c9CmyuhRNlbEziN0wE2syy0qUs3W0GTFKm5lkW8h52S9ugJA2Cb25xbwTthlV4qusrm6
         xx5YENBKuVdYhiZ4DXGR5+e7gem5I8WjwplYgjux3y7QwyD6huJUwu8StTLZXfdkSBVD
         L/vQ==
X-Gm-Message-State: AC+VfDzCJxyi4/ATOWDe9wEDOUV6odD5zw7pSx+sqq4pbu23m4mIZ0CU
	lDXHC+76JlJsd+Otp4e3DhiQMXncpTg=
X-Google-Smtp-Source: ACHHUZ47e/LzaztXLvn0Ol+60a8DPkP1/DAZ+k1VSJ3w/b2GpG8oNGXp1QINluiWYYDWlOWVLxtwMA==
X-Received: by 2002:a17:907:6e23:b0:970:e80:e29a with SMTP id sd35-20020a1709076e2300b009700e80e29amr13917895ejc.68.1686734987202;
        Wed, 14 Jun 2023 02:29:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/55] puzzles: upgrade to latest revision
Date: Wed, 14 Jun 2023 11:28:59 +0200
Message-Id: <20230614092918.4065570-36-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182781

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 4b045886826..960b5d3b110 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "5a491c5ad333ef34c1e7713f920f51cbb205af60"
+SRCREV = "b6c842a28cf6597df063fcff35079c3e3982381e"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.30.2


