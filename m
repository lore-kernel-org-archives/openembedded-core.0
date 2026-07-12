Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A01C44511
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:38 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.950.1783881817288454291
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=MtydklNu;
 spf=pass (domain: underview.tech, ip: 74.125.224.51, mailfrom: vince@underview.tech)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664d530fcfdso4541782d50.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881816; x=1784486616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R67z6hoJ0NIyO+wE+zoZjMrHko4pBYAtLrCdkO3LGaw=;
        b=MtydklNucUK/stLC/T4QBusatwpyr64VSpZnKHJbRvm3na9nIXoRbm9TwgGVwneh2/
         4j+fXX9uMG6xceX7rBzEsZUyqhZFZlmuPgzfUcZerPRTfOL0H71AUlQUTVOM1TYpYciQ
         /ioAAewBqLHucT4EbGEc8t5NtLo5UJynO5Ti/VTKsE8zMzQRgeQ2v0EXNqlL7tykRfaN
         Y93piLV4kLIBP7ZHTOKkKc3+pU1gm45OJGFjUIlPToJpl1s17cvHFaqxufE3xmFQoHHm
         XTPXion8t9wFU27j7PxMlAZzJ+Fp9BP0ApPoRYlLIkFCCrXXF2q+O01sF0T8vB/Abg56
         SXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881816; x=1784486616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R67z6hoJ0NIyO+wE+zoZjMrHko4pBYAtLrCdkO3LGaw=;
        b=ARHEQVX7GihBWlBHk9iAfTbLKGmG8VW9ouD/dMhZFTCPvEcacHVdoJZgOVz92zkXjf
         5uZMc6IwS0oq/LyVdGfavud88adk94n6XwS8S1V+3q8PtBJPvlROJ1tFdgJ11RAG8+TM
         qQ3YHtgSKRrMqn3esOpF+XEY8+051PcPt2T0xDiBlEA/mkDtR6VptrAIkh7CN0v0wjm5
         COqEOTJuJgrTx3DCIj4pvg3oxR84RxSLiFD+HVDV+5etWi2VVz5GjxR8cNu68ZrI6r8p
         ZKe2ABO+WqD0YOReqJ0+9ZCFF7IllJ/Eq3j0/yFqyoUuMjStZeQH0NXNFqcESXCTTmIQ
         V5nw==
X-Gm-Message-State: AOJu0Yz1U92acAQC8eLiHMfWVCi/WFKqfOgdhh9HoVrS5M8iafX3ub2n
	yp5yzASQ8gSnElwej9aT9DfgxdCIlhZw6MKupgDDwnWerF3d6wwckFVI4ftNKcJSpvVQNxfxOPL
	PeiuU
X-Gm-Gg: AfdE7cnZEO0Y6ocKMSZEsG/USFaFrHo0iI8DmCza4jks2weXz250SFVrJlCK1hYKgch
	Xie6m2mbDqpvFQGbxgB8NLJ2pMY3EkIO5oht/qQVPURWxvfl6xsKFaFFNHCebX9+nxytCVlxXNB
	UeT0lhaaqMKrJ2O7cc1Pj4vgbLC/V8nYskDO3rM0WtbWm2RIDsQI3PVTuzxWhyojvDwKE/RRZjM
	97JwWw0G+T6fi8I5r8snngc8MQZ2GzeMvbFgDGNJQO+/GMlyApyjzd1riW6j3p9RiIn6oJAy4w5
	8T0h4e31/XVvfIm3Oe7N5H+7iUnVz71ZOncJajAyycKspmxyvLn0GthMnRcc6jOB7d/XCgFX1da
	71RdpWRmVSwhv7PL3jWF3RqTBTO9UoGV4AmJavcLeebtAIS8/vjVdjNQPIKxsagrCT1lwJKQmHS
	c9O5SyIeWL2NRJzg==
X-Received: by 2002:a05:690e:4184:b0:667:5e15:5728 with SMTP id 956f58d0204a3-667d7b4c82cmr4867666d50.28.1783881816347;
        Sun, 12 Jul 2026 11:43:36 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:35 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 22/27] libnl: rename kernel prefix
Date: Sun, 12 Jul 2026 14:43:02 -0400
Message-ID: <20260712184307.3259642-22-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240812

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-support/libnl/libnl_3.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libnl/libnl_3.12.0.bb b/meta/recipes-support/libnl/libnl_3.12.0.bb
index 2b46fb69d9..cbc5eca20e 100644
--- a/meta/recipes-support/libnl/libnl_3.12.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.12.0.bb
@@ -54,7 +54,7 @@ RREPLACES:${PN}-genl = "libnl-genl2"
 RCONFLICTS:${PN}-genl = "libnl-genl2"
 
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'libcheck', '', d)}"
-RRECOMMENDS:${PN}-ptest += "kernel-module-dummy kernel-module-bonding"
+RRECOMMENDS:${PN}-ptest += "${KERNEL_PACKAGE_NAME}-module-dummy ${KERNEL_PACKAGE_NAME}-module-bonding"
 RDEPENDS:${PN}-ptest += "iproute2-ip"
 
 do_compile_ptest() {
-- 
2.43.0


