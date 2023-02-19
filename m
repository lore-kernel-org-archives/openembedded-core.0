Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589BEC6FA9D
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.3926.1676835071799349989
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kQKUlJBK;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id bx23so836023wrb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuTlApxnnmOB8/EIJcOwjncrR71moJi12PiEjxUHnCw=;
        b=kQKUlJBKiezGu6isf0I8K+gigWXxn3PsTuX362HAp85/G2fWpKG5xkgxfYXx1CM2ZK
         k42fqtGCVMrw3/fn4+hy+ahE+xwW1OJ9AFamw3Cx4Ib0+sEMyCDaCtN+YOHij/89MS6V
         9AVX4Qr0DcmvSUlcvBA9DSSjlMRv0E18nVaGHkNyl/Z8ij674u43fvvPqd0h0efOuisw
         mQdQ4DYIa8S7e3qo5Tdi4FIIZptLy/FJ/zckX06CTg4PWe9rzMYMZxWzgJA//23ArOGm
         +oDRG+K0jliiClyR5jFOhHE6k2pUwh+iMD2tUtzPBhFigFf3dNoiT7r0Jr2q/uH6RJKw
         3H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuTlApxnnmOB8/EIJcOwjncrR71moJi12PiEjxUHnCw=;
        b=l3kc83sNg5dJCtxV4oPYmFg6MlpoQuUptL3UzjoGl4S7COZ+l0eXRD+hCxJdIVRxsI
         xArQtJeZdVl+aUy17mwfGlss9ujUN4K0UV8GoyNb+885xEpSPHtJDgO5qm6JQwAz/oPV
         KqAEu8D1lr3czXwagqDuf9dJ+c3Bfh6Xwnq9QtOB1+96aqTlp0EYxS0s/FGejvhpBC4c
         yBOTsCq5erL1tFA3voWgwfn8GTT/wX/uQEkERzY+qZ5eW2aq4t65VkH1pkoU8c/+z6hm
         RCVUP46iq9XDztV4OUHbfPB+GGbBV84XUPooA5XxvniewIJjXnvXWPxLJ7Rt3dpiYqDH
         o2Tg==
X-Gm-Message-State: AO0yUKX+2k2jz0qSLs1MyQnM3ylWsf0MvRVyh9qJPV++Q58yuxeBwTsG
	HukyvRNHA7WU2kXGUTdCXFoxs0tG9Yg=
X-Google-Smtp-Source: AK7set90FaGnr6vlPLJz0zemewI3ogsdgtTJRGL0lgvNyMkWfS7G8qDTTlcDt+ZY+LkoRqJabG9wJg==
X-Received: by 2002:a5d:5603:0:b0:2bf:ee7d:5369 with SMTP id l3-20020a5d5603000000b002bfee7d5369mr1915954wrv.59.1676835072600;
        Sun, 19 Feb 2023 11:31:12 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/39] puzzles: upgrade to latest revision
Date: Sun, 19 Feb 2023 20:30:34 +0100
Message-Id: <20230219193101.338397-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177354

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 1774d0fb20..5998c23dcd 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "37df1f2bbc689d224369d963dd8007d68fcd7c6a"
+SRCREV = "7364ce8e266d947be146d635958a7b282752aac6"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.30.2


