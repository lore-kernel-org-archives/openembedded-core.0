Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AECD59D68
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 15:40:16 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15354.1765554013341230784
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qvJ2xcIR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-295548467c7so16134715ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 07:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765554012; x=1766158812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZcbCTznQpLU7e3tx45mfU0avwWWUvLdma7vm5TVduU=;
        b=qvJ2xcIRRgB+LGq+KQLLK61u/a6g7E5B9nQ3GIn00jHlWxvDZi2wm/CuioIoaVXqLH
         zMlNJiT6uVV9aIuK5rVlGWNaVmQ8rOynKOIu7yDOxoqaborFuaGGP+rTMLWAr2syzCQ0
         eLkBUTEfmsMZPLvLK7mcFAk7EXFV0vWYIi1epP8BDw4telHMXCBEK5lm/Zw8GuNM7E+q
         r97VD34PVemCfILHeqJ2YHcxFchX9x+mZLhjCb8bJ/Kfbhf3eUEtFxES8fzDEd5AUC/0
         PEYseaOoxd0svs4bWmrVfv7aqa3MLtGiEcfoUBhHFL/yKjOzST4ZKmIs2iAR6+JADzJL
         LnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554012; x=1766158812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RZcbCTznQpLU7e3tx45mfU0avwWWUvLdma7vm5TVduU=;
        b=r3ssNEtzWD5pxFfjszzZZZfsfuoulA3JfNDR70EscaXA8jFVj+2vPKsedR+4jVSHfM
         tIQIgRReDN/H4PSTbU1m6vXvxd4zp2Ssu6c1+VMPHu7YOuyWvo/wi0mgitnXDn41kLhn
         9w1vcoUp2Y9NGId6UVHtO+APnV57Lx6h1LVGaus6nFz6ALQdVBTbslJpxMAMdp7pLIA9
         SJeeLqqTFGsyrjPuQe3kDiADUdJD4sQIrE6DYJl8q1tNdvwZgto4x2ajDT8EwceVQB+D
         dpf+0AxdATJiyOU71zgXdDiFSC3eUSa5ubqqlt83zZHeYrVAMcHUVYINPT9KSDrzOCSZ
         x96Q==
X-Gm-Message-State: AOJu0YzfdmG+xFLecFREPzuHHoIiAeVC1d5fH1KWceqXVJK1xqo+Fp+l
	/HfkD6Ii3ulCrqwR+2HLLREdpbsOVExZpvKVzv2xJg30HvJQKIVyofZloFkrOzvwlnLwBqe42Ue
	QjkYJ
X-Gm-Gg: AY/fxX7e47snw71kb1f6V5bCV8vo/fqUzjsZTGEf3lmDCWTGmx3KYxB08Ti/JbsULwP
	3G9HOwzrcaKycPHLz+iGMzeeyEeEM3rKpZfCcrTb2uKuRcBnLaKnDTILechKE0rG4y7pXKsSFnX
	Y72rnKcW3m/FrfUB+IkbojVm4xCQWYKk/f0bTfcoU29f7JV7TS4XKsqkZBh0x3NkKHd4/6OBIng
	qkhB8Y40lAQ7gdB49u/te7JU8AHN0iQDpmoEFkcSd/HVhYTXWg9+IWMtGWRC3nOC3in3CzEe7rw
	DG8TNYgyC8/YWPvLbe4slrCt2f14v4LvVmwVRWJRfwVrRP5MhAKMOA4JviJ3TN6mTD7CI7xPeMh
	p1gcnq3dA7h5sI8t4iZXY155ZkV6cL4mjNAwixj+05RmXmCDQAvcwM5k+BET2lXds1srL/vC/wF
	4eig==
X-Google-Smtp-Source: AGHT+IHssg9Xgeant2yZEOLgAqpeUx4P0L7SsJuusDZ6HJKqA7MW3db9gvuPYHQcW80oP6fkUfbH4Q==
X-Received: by 2002:a17:902:d4cb:b0:29f:1bc6:ac92 with SMTP id d9443c01a7336-29f26eefe9dmr17547185ad.51.1765554012585;
        Fri, 12 Dec 2025 07:40:12 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe23edc4sm917549a91.1.2025.12.12.07.40.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:40:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/7] classes/create-spdx-2.2: Define SPDX_VERSION to 2.2
Date: Fri, 12 Dec 2025 07:39:54 -0800
Message-ID: <04cc49593a0ba2c51e4f4d477d4587079735b624.1765553842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765553842.git.steve@sakoman.com>
References: <cover.1765553842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 15:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227601

From: Daniel Turull <daniel.turull@ericsson.com>

SPDX_VERSION is used in DEPLOY_DIR_SPDX but if is not defined,
will default to SPDX-1.1

Define SPDX_VERSION to have the correct deploy path, to align
with master branch behaviour.

The change in path was introduced in 8996d0899d

CC: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.com>
CC: JPEWhacker@gmail.com
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 2351a3d5a1..aaa2e78fe2 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+SPDX_VERSION = "2.2"
+
 DEPLOY_DIR_SPDX ??= "${DEPLOY_DIR}/spdx/${SPDX_VERSION}"
 
 # The product name that the CVE database uses.  Defaults to BPN, but may need to
-- 
2.43.0


