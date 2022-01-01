Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD64C433FE
	for <webhook@archiver.kernel.org>; Sat,  1 Jan 2022 11:30:09 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.24247.1641036607885067394
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 03:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ORDKz376;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so15798804wme.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 03:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9UE++Bo9ldTBVCUuBaUWY0c6s7HDORfIMK5zjrR7Aak=;
        b=ORDKz376YKzoOLJDOzFWAb8wvZiLXyBM/cNKf1VdsO4bm1ZxlXZtzAOgpkcz9ylTyh
         0TxPQH0MNlHZ996pJnlclD4ywEzEMoVAx7ZkeUVifrMMF+Mezvr5WC+6EyHbPTnqpy80
         LW9KfzLxLFwNTOpuUv/qGRTZ9aWhZoHNY+NeLPpCooCbtC4cy8MLGSPA1e45JkXFgJeB
         SsMLN/PcQHHAmAmcLBxhLr/46sLjMMpRFpHkvgc2cZC+mMEm1dGX8goxlbJ0Zk/Nrc+s
         rjUHGo9VSinZKFpRD4hgZPV1C1fDCfItmGBCgCpsmReijKtTJ7YnNFkZ4XG26T8xGsd5
         VNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9UE++Bo9ldTBVCUuBaUWY0c6s7HDORfIMK5zjrR7Aak=;
        b=vgZmhJn9RwdHJLA7aTlrQwKKrBrY26p6t8GQVqIPF2Xvio6HOdJgZmdTq1aeaL5ZZq
         w2XfUX2TtnGqvRvuhJb8v/i7vTt9tvn96vq2IbN+6OAOd7WbUYCoeg9x+Oz0i455wvi+
         XECH+019X+ludHuVUb36XL5sVuQy23qLGbwBiXVhFQ9X7lEjx5O8aH8T9kxmVjK77vVD
         nCjLDQes6YeKd8/itHsmzEOijHt28pD1Tg6ku87E6omcLCmLajTh91zWn9k3GmbGvrik
         Rw5/eEAJJI9AlPudfNmK6H+2RMK5hlyhbrP4vXGOzPdD5pjSLxKOC2vql9VoJpq4808g
         hOmw==
X-Gm-Message-State: AOAM5316cf9P2UbRkq7kN+uJz92+bOHEPRX8IozhktSyNnCbISVj7DL4
	VjqyKLp5OiioTM0kjt7b4oVybU7kn+Y=
X-Google-Smtp-Source: 
 ABdhPJzuqBMjZTFchAAeGn0i4aj85m1eiQ4aTz35/bLUiJqBUUBoBI8Nxr5lrbmql0TTI/hfMTXtEg==
X-Received: by 2002:a05:600c:ad2:: with SMTP id
 c18mr31841215wmr.177.1641036606446;
        Sat, 01 Jan 2022 03:30:06 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j85sm44679935wmj.3.2022.01.01.03.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 03:30:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/6] go-runtime.inc: do not make installation set dependent on
 host
Date: Sat,  1 Jan 2022 12:29:57 +0100
Message-Id: <20220101112959.1866747-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220101112959.1866747-1-alex@linutronix.de>
References: <20220101112959.1866747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jan 2022 11:30:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160097

This cannot be right: what we install for the target should not
depend on what host it's being built on. If this was fixing
some problem, there needs to be a different solution.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/go-runtime.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index a08d44dd3a..106017bd89 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -43,10 +43,8 @@ do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 do_install() {
 	install -d ${D}${libdir}/go/src
 	cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
-	if [ "${BUILD_GOTUPLE}" != "${TARGET_GOTUPLE}" ]; then
-		rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPLE}
-		rm -rf ${D}${libdir}/go/pkg/obj/${BUILD_GOTUPLE}
-	fi
+	rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPLE}
+	rm -rf ${D}${libdir}/go/pkg/obj/${BUILD_GOTUPLE}
 	rm -rf ${D}${libdir}/go/pkg/tool
 	rm -rf ${D}${libdir}/go/pkg/obj
 	rm -rf ${D}${libdir}/go/pkg/bootstrap
-- 
2.20.1


