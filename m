Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927D9C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.4221.1667832917636303752
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mOk3gNwd;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id j15so16597629wrq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bc1ERcSllU7vSbMrLlPaGmJBiakpEl7Z2wnxJ0c9fDA=;
        b=mOk3gNwdJiz4i6mFG0LJXVET7qD4CpPaMYhXCqkbebB/57DreROupPRHt5xhP5ek6D
         Qme0WKMoc6TSVHTCpVGxqHfkXgyiI5vhhoxfFWO2nVCeSaxhD4cZophehY1jieDDk5Ah
         qpINHcW1Cy9Jf1gYSqIRhukrWC43uRLbIJ5BFwnqdQKSzqIcMik/UV09P63A13GNj7ld
         6Yyp6bUEU1BzxUUlMUM78X24rgIlC4n6+vfhjGC0E0q20i/M2adSmRDKeWGVUWmqFaTE
         /H6v85dLeDG4qnVmf56za20dIMfEjNaA142n3yNxmJW6sysUFAj4XwS5Ef6oSLlFhiYw
         fkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bc1ERcSllU7vSbMrLlPaGmJBiakpEl7Z2wnxJ0c9fDA=;
        b=wnSqQF/mEZO1gH2KYUqwSsLfxlKdKsKGbubxgskZ+wHGiXmts0RDY1YFWVkzwi0MlC
         nqhcqxk+NZCIYP5AHCyaviRCLLPINXGfFgVCxY8nVXcgqIq3fPfurTCITsEp24hwsN09
         KWUt9ejaVPYGMB3KkMUnsodeMmOdpn12plvPD+BNumAsLJ1mMi1gnBJkikS5yvL2g/YG
         jCFtt6WlsAZiewcWU9QkgMAXdED9u6MFksDK7pSD/K82zVGA63SlB2vpdKqU0SGHSyrI
         6A3WGt0GvgPLHNx2QnHl2M34R5d6POdkfdkYR4gji/uu3zBB5K+umLVzb/HC8cWJdWCb
         BWaQ==
X-Gm-Message-State: ACrzQf3qDlPqniWxaIl6TG399qZKa8xc3sadwri0KVpU0kaZ5+Au2gMz
	lIM8nRLvCn//PNay/k3FiOv+CLve/dE=
X-Google-Smtp-Source: AMsMyM7ApdpcDRCMQ3AIeRYLrkvUwdHfl8QH9M/JMWe1q08VdhlRDPPI2Ox8/Utb9UJsb883lfljMw==
X-Received: by 2002:adf:e810:0:b0:236:5152:b95 with SMTP id o16-20020adfe810000000b0023651520b95mr30566967wrm.529.1667832915837;
        Mon, 07 Nov 2022 06:55:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/48] man-pages: upgrade 5.13 -> 6.01
Date: Mon,  7 Nov 2022 15:54:21 +0100
Message-Id: <20221107145508.1051404-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172851

License-update: formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../man-pages/{man-pages_5.13.bb => man-pages_6.01.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_5.13.bb => man-pages_6.01.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.13.bb b/meta/recipes-extended/man-pages/man-pages_6.01.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_5.13.bb
rename to meta/recipes-extended/man-pages/man-pages_6.01.bb
index f8602c699e..1ad4ed1317 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.13.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.01.bb
@@ -4,10 +4,10 @@ SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPL-2.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;md5=92cd5ee2e0b35d782817e7e277b6ce4b"
+LIC_FILES_CHKSUM = "file://README;md5=bf1faa9b0245e39a7c0c9690ffdf6e54"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "ed615e9a31978833f59e7316667b9aeffbbdb0a92d1391f9c66fadc6e77d0da8"
+SRC_URI[sha256sum] = "c1e8bea88589f1a80b67dafd82fb98b018ddd7f7bfa594f8f79686258d26e784"
 
 inherit manpages
 
-- 
2.30.2


