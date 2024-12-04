Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48512E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:46:17 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.25648.1733345168951689525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AAqY6eDY;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7250c199602so247986b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733345168; x=1733949968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9hRsYHzPHTWxl/j60i3QkvV4TBBT253RkczJMLMKDQ=;
        b=AAqY6eDY5fNbtZBy0pwz0Grsoa4r7JcNt6fywaGEPPFNqW518zkrbQOIYElpN0MEKb
         7auS5vaTjM7QXt+4ePGHyRUTGMRxV0FBCTeNPzOr3dXodUqLtL6mfA309CUWzeXQrE5a
         Nx2Fiyv2cvVc78+1c7C9GQx0UaQ7sCSigfeXCs8PhDwEImnsJRPT15BTYFik/6Qp/KmM
         s+RFWkwjA3QwsTmjYwBIU/aw+tusDNG/+l+/LdWj1pXTvERXRVt3XgBzw+MqEt6kho0C
         jFPSzAASdV7Xn46gtaJLEhwPTuFB4RsSWz4HAT45K6Etx/tizUuCm/M3DJIMvspz/K6d
         f8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345168; x=1733949968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9hRsYHzPHTWxl/j60i3QkvV4TBBT253RkczJMLMKDQ=;
        b=s5RGlP0EsSiVaqSTTIMlnS0MN+6qk5ph1Xm1x0rejMa8A52TmIdW2cXb7xGyyN8e+b
         faKERYVxUfshmwzksO7aMhuo5dR7DjbRZ33w26tyDP9QqvKwbFs8F+Qs6KvYboQ+gL+K
         5U3OrdprNypbaedz3u295qDHWWjClOElSG/VuVDMmV07xd3DQb/of9f88N1iJS+PA4eC
         lykhUMmhgcVouqzXUPHpCHEAP5WWw0y2+9xCL/ED0NAhyoPOap2fbfPHA2vc0QoN50VZ
         RKTA3ccEUpv45P+RiIgBRw9+bCSlBHx3gj9AIF35FN6zATkVTWpQJN++SaMlLGCQFasq
         iJJQ==
X-Gm-Message-State: AOJu0Yyk7SEWMfeORIYporkM+cEkSO3yXSqptlapI1B+Tzw/lwVoEFOG
	rGkIbWfRu7IRuQxZERs9On44HRrSwKfc/iMQJf3naR9MbNox/sNpUNgPNg==
X-Gm-Gg: ASbGncskYyr6K+qgkdqwLQj1f/riVSzdPQ+BWyTyUE3WXSAt3Et5ou4B88r6Ou46t6t
	2/lUs2ADZr+h7wrG3olmNKGeIXdmkmXVeRxqTnuylbjCRhdsAhS7u8hKE3iHOj6EsZr2ijQ53Tk
	SfpRkcexnBfDwq6Psr/G3mQlB1eU8Mx5YYdHEd7o/Ba48H4hV0hiJcB7wtvueLeloIOioHf1eYR
	vlNYFwcc2AAIiMCdAZrXTmQd+XovulcOQXHVsM3wECClESg03bcqhZtzp+rrJec3xue2HL9
X-Google-Smtp-Source: AGHT+IFvKTvokVTHXM9Vaf9QeTzYQPsrA9xnt9vN0F7/5vieXiUvvL9+BFPYllU4Z+6/JhefxEd3Mw==
X-Received: by 2002:a17:902:dacb:b0:215:a60d:bcd9 with SMTP id d9443c01a7336-215bd24ba1bmr77030315ad.45.1733345168074;
        Wed, 04 Dec 2024 12:46:08 -0800 (PST)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21598f3281fsm54905205ad.279.2024.12.04.12.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:46:07 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH] hwdata: upgrade version 0.389 -> 0.390
Date: Wed,  4 Dec 2024 17:44:05 -0300
Message-Id: <20241204204405.168661-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208359

From: Hiago De Franco <hiago.franco@toradex.com>

- Update pci and vendor ids.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 .../recipes-support/hwdata/{hwdata_0.389.bb => hwdata_0.390.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.389.bb => hwdata_0.390.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.389.bb b/meta/recipes-support/hwdata/hwdata_0.390.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.389.bb
rename to meta/recipes-support/hwdata/hwdata_0.390.bb
index 8ab455cd2e99..3ca39ead73d6 100644
--- a/meta/recipes-support/hwdata/hwdata_0.389.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.390.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
-SRCREV = "5313a12eb992a354c17fc895c1d69c8c42b09a06"
+SRCREV = "8b9819d19b1554d41dcc9c76a784e1732484cb15"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


