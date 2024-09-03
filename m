Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EC2CD3445
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 15:41:51 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.26642.1725378102713561232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 08:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lTszs+Cr;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-70f5a9bf18bso2226244a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725378101; x=1725982901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/8nseoTcJHFwSbeR7bnlMnq1V5Kg0N87OiV58MTfno=;
        b=lTszs+CrVjWtACioEemG432uz0masW6BBzlU7u5UcSTVlmiRHLJJM7SFLwblLwToJU
         fbB7xmrinCZqETgj6eD7HKJBqY2SWudVo/sGBi7rqou20eCvRZbteBwJTOwRIzMpxPPf
         u7fJiZ6jE4AHe+ITz8aN/Awl0GJ2gpiVBv118HFp0yeIIxG+25Yq/LBMnIs6qwlGIgm3
         f7N49HHuQ5SEmDuAUEJSq4SRvhSxXDs9jN43JiCNUMtYbXTJ3+QTxFuJ0fKtCZ+TtVxI
         hK1ABTFWgTxXUL70lYHzF2rShsYdX8k1GRhpZReHukJqsgJHpSTmtpWG1r2Y6MoSse6l
         /x6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725378101; x=1725982901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/8nseoTcJHFwSbeR7bnlMnq1V5Kg0N87OiV58MTfno=;
        b=Cz9TyqTasUjhK4+0ydCbpBq+iADkr6+hgS4M+yUODs1Ct0ZaFY91t0JPL0cHXp/nmW
         +IK4zIVnEoUF5qoYf/1EY0/+2pU0EAaphcK6nKJ3XChwQMC6p0bveQz9lgPasfLyg2aW
         OpzlqXrhdGWVgfhlaix+2H5VMgZWEn+X7x1cJDynTXtiBb4WtScJZXH0Q+piLIA9OfQc
         /UDUec7BsdWavqSSGCCqVkevW0E4ZbUvnsyKfAoVGcVtl3hjYvBPh24hq+w1QatmsaDL
         5RKK0jxztWwh4IDxiWsG1FVFSdYNhpgXWVkTQ04fNwBEDsN6EAfw9QVWl3bZyKIQrpXg
         2lCg==
X-Gm-Message-State: AOJu0YyU9GNfE+eW2fw/BkqIYDTjeO39jccp7v6dDoGI5+2uszo3s0e7
	L3cAOLYHDLvSBlXBGQTEJZzNJP1qSRdSbZPyRp3vLMC+a2XILAUWUe5ZzQ==
X-Google-Smtp-Source: AGHT+IGzzkSs9gmK8JuUi7xJCDdNdgVFete5LSwnNo13zoNthg1o/GTQOXweOr0qxNFAut3BK1xrSg==
X-Received: by 2002:a05:6830:4188:b0:708:b29e:e95 with SMTP id 46e09a7af769-70f7070b3c5mr11444171a34.20.1725378101230;
        Tue, 03 Sep 2024 08:41:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::9ea])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5e17bac0af4sm408602eaf.30.2024.09.03.08.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:41:40 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/create-spdx-image-3.0: Fix SSTATE_SKIP_CREATION
Date: Tue,  3 Sep 2024 09:41:36 -0600
Message-ID: <20240903154136.1685191-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 15:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204170

Fixes SSTATE_SKIP_CREATION for do_create_image_spdx

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index fcae134d66e..18e6cf6dfa2 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -48,7 +48,7 @@ python do_create_image_spdx() {
 }
 addtask do_create_image_spdx after do_image_complete do_create_rootfs_spdx before do_build
 SSTATETASKS += "do_create_image_spdx"
-SSTATE_SKIP_CREATION:task-combine-image-type-spdx = "1"
+SSTATE_SKIP_CREATION:task-create-image-spdx = "1"
 do_create_image_spdx[sstate-inputdirs] = "${SPDXIMAGEWORK}"
 do_create_image_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
 do_create_image_spdx[cleandirs] = "${SPDXIMAGEWORK}"
-- 
2.46.0


