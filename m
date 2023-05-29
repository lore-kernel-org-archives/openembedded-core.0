Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568FAC77B7E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 09:42:43 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.46183.1685353356521092783
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 02:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XCu7awN0;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-256766a1c43so581505a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 02:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685353356; x=1687945356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lC+SnnIBdOgl1sUipzuK7EQ0FwyTG3qSNodP49VDtk=;
        b=XCu7awN0u2k2+INRJWKARafoMVTQxUkVDc8rVjKUBlRMc0uIf513tpgMRJ6oK9VHO2
         DF/1KQHXvFkHz3ypTmyj1rLxvjJ/Xq/AVjCrjXCFyVn/GsRZn9kye0AcdFig+kBfenEA
         lRvbVrzy5cv3HUl3yuwDN86UFYT1OwMhOy2CTrtY4bO16LE9JhZrka7ponmjs0v9sN39
         HUJdHSWOC739UTw1q/aI1VCe8ky2aLUAXZwcZFpq/LRtJassRstnryrtzMCBsHQol46K
         6L6PA8G1IHTrINAnvmXKsVKiFqtZd1aBM7ZEzySG/Rgm5QDdZF8vK1Bt1TIpQhhJCpuf
         JYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685353356; x=1687945356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lC+SnnIBdOgl1sUipzuK7EQ0FwyTG3qSNodP49VDtk=;
        b=iYUZZ1O48w8Tgjx2qyuiNgX5fwKZFsqDYrHFwiRuekmnj9QiI6XWrY4wtwGnO/ORvi
         q2Zng6JZu3T2dtkdka5dOHjACw31osfAWo136eD/haZVQVkpPyQi+8Je+gOebGOozFXo
         oViFu/9RYGAJUQPA354LMfYEY5Es7iQWNJsab43L76LaIzPOsbLTg6zqepI0WvifTaSh
         WNz274Cp1uR4dD7baPo3TkbKodGVW/O55gLq3/Fc2CcdjcYlQCiusDTTtOXanhjsw89+
         74SeIvL9EXf7czLTlPCMBl4zGMyD84TwXluk6emkfZ0NDuVgi1adQFvywxRmOGjYur0m
         CAQg==
X-Gm-Message-State: AC+VfDzjZKXnOV0QJcyflsc3S+FLV9nmD3ecbLjNVYyrOPXSrge4c2Qe
	kf85IJP0n2CmdkQA7+pHNQFCnHziusSOUyO2
X-Google-Smtp-Source: ACHHUZ7lYg0VpY18MejhgeycvxtC7d4KUw8jSwNWj5tRUSu9isIzfaMdBtznkwiN8n49xIKwSOpGoQ==
X-Received: by 2002:a17:90a:9f8a:b0:256:6b1c:f5e9 with SMTP id o10-20020a17090a9f8a00b002566b1cf5e9mr3805654pjp.42.1685353355482;
        Mon, 29 May 2023 02:42:35 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id v17-20020a17090a899100b0024752ff8061sm6809869pjn.12.2023.05.29.02.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 02:42:35 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	naveen.gowda@windriver.com,
	shivaprasad.moodalappa@windriver.com,
	yash.shinde@windriver.com,
	deepthi.hemraj@windriver.com,
	umesh.kalappa0@gmail.com
Subject: [PATCH] Cargo: build failure on 32-bit machine when DEBUG enabled
Date: Mon, 29 May 2023 15:12:11 +0530
Message-Id: <20230529094211.756085-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181859

Cargo build is failing on 32-bit machines with a 'signal: 11, SIGSEGV: invalid memory reference error'.
This is a workaround to disable the Debug builds for 32-bit machines.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/classes-recipe/cargo.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 7a8cc1e751..bc5ca4fdc6 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -38,6 +38,11 @@ CARGO_SRC_DIR ??= ""
 MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
 RUSTFLAGS ??= ""
+DEBUG_BUILD:qemuarm = '0'
+DEBUG_BUILD:qemuppc = '0'
+DEBUG_BUILD:qemumips = '0'
+DEBUG_BUILD:qemux86 = '0'
+DEBUG_BUILD:virtclass-multilib-lib32 = '0'
 BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
 CARGO_BUILD_FLAGS = "-v --offline --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
 
-- 
2.34.1


