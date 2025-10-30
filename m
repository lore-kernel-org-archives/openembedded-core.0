Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EECCCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:12:38 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.3236.1761844357445475511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U5t2QP8e;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-88e51cf965dso190993285a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 10:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761844356; x=1762449156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDxydMiNr7sF3wnUgE1xWBmvVIeCwUHG8yx3KJcOo3s=;
        b=U5t2QP8eP4cHLNMh3Obn9OI5KD8Q6ZOhIQ8n5U27X7ytLSkzjsDpCAJc565sBxSHAg
         WDOyKY8fsCPDLw1pzqKyeNNv2v1J0iPP1mwyOs50E4FKAnbAy9szmYKDvnzw/YnGtFV8
         9UI04ZMUYPYi+npQ9n/UgjWz32dJcHl+f/0LEYq1GhkkQ0mEe3514chMYBvcRee9yO/e
         Wp5dAZjrqy9AhQVRx6PIvW+OFcKJcKyYVQ821gHBlF8FImInukozcNpiwqR+Q3HFqs+N
         g7fihbpGlWJH56i6VgIpvF3XwAoP45m+/5k1RyDUKFAhKdgwpn8Hb9IQU8eZQta2Scwx
         v9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844356; x=1762449156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDxydMiNr7sF3wnUgE1xWBmvVIeCwUHG8yx3KJcOo3s=;
        b=B3GtBIuunoFkhlgNhO/t98AujM38gZU4RhNZclIesLGgtoO9dcFafms7fv3D9wIxCy
         471hRwfl7uBq+eIg8gn41chxPI3ScKwAvyFPEq32qIxpCBBwVI6kZzhnz0wWzvaDQE9G
         m2LPh4kS3dN0cM0yWoGe5I/x99Rg6xmpAmaXtCQfpLU0dX9HSX4m1t2BkTKRrCVQ24Yi
         5fTcJr1ebeC2VPr2ydXF20GqbyFxNufvKMtUhUg+hhEJ2jET5Mc1H+vqAjj9EBQ3wBId
         haIdkMu+qD1T5hU8sbpk/KQP2bBDFjLIjs2LdEJ7sf6EXSAZOrPaIAIyvkdb0a0bAIYI
         +Gyw==
X-Gm-Message-State: AOJu0YxVo1Z4pHBgrb4cvwUK5kPIAzjvISPgT6ZeW2WFQodHmr5Aau4B
	EgZXbChduwlkTKGuMN95leyNTA629Fmx1PkxH0j/1ei+9X8dpzlI5Zbi0aeUXdVJ8F8=
X-Gm-Gg: ASbGncsG3Gg2j5UjbfOnUNVPuVy28VF5NouB7UBtBWAGfrD1OS9EFaxa1XXHun3JtD9
	rujWkjvuae45b5HBu5JzTg0xE0bHYlJLlB8obsoNRtIRN+pMXnDwhBeMLYuQdMK9ShMfNUgylzd
	uUYqh65N7+Yuuz8cA04q494HNSF5WF6/rxXen6BAmbLbyTOQ8D7MncpHNuf8BSj4oTirK+yenXc
	ak3Tn95JQj7GutyJxDqPZUYe6W7s5yc9BGb7KPzunCAOOa6yy666qu+vsmgNBEz2vVh4ygAhY7b
	nm7/D/JwOKCiz4XFxbJ5BFSS+eypK4/S3mSJAVtRpIcm5F8SHSWRhkxRwvjvqIb6TdHcU6UWtjX
	5P1KeV1g9KBRTMohEZ+H1BCY/juygkBfxdeLQ5yNW6k8EkmbXr92dxZrmZrQj6OYb2CVRgZkV4o
	8/OsgQ4jIkYlxRDgGYWBtY/BBTDCyBWkEfLC7PEfQBsyxV+GhrU0Qrz3cCJqhT4LNq8Gz8XWcYn
	9vFkztJciFPkYQ=
X-Google-Smtp-Source: AGHT+IFvk1FKzlo36CRzTRPFqNfE2kD5ew4xm99Pl2lmeGdf3C91RJiqg8ryxDLQuM6XDRjP89aEHA==
X-Received: by 2002:a05:620a:4009:b0:85f:40ef:4aa8 with SMTP id af79cd13be357-8ab9acee37fmr28865685a.49.1761844356219;
        Thu, 30 Oct 2025 10:12:36 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254ab74fsm1279296385a.32.2025.10.30.10.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:12:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/14] linux-yocto/6.17: unify qemumips (malta) branches
Date: Thu, 30 Oct 2025 13:12:17 -0400
Message-Id: <791075f373170e63dcdc95b3d9e6613455bb45f0.1761844161.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1761844161.git.bruce.ashfield@gmail.com>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225506

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 6.17+ kernel cache is using a single branch for the mti malta
machines, which are what qemumips* emulate. We update our branch
specification to make them buildable.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.17.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 2180f0f36f..9d2f51ad41 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -9,14 +9,14 @@ include recipes-kernel/linux/cve-exclusion_6.17.inc
 # board specific branches
 KBRANCH:qemuarm  ?= "v6.17/standard/arm-versatile-926ejs"
 KBRANCH:qemuarm64 ?= "v6.17/standard/base"
-KBRANCH:qemumips ?= "v6.17/standard/mti-malta32"
+KBRANCH:qemumips ?= "v6.17/standard/mti-malta"
 KBRANCH:qemuppc  ?= "v6.17/standard/qemuppc"
 KBRANCH:qemuriscv64  ?= "v6.17/standard/base"
 KBRANCH:qemuriscv32  ?= "v6.17/standard/base"
 KBRANCH:qemux86  ?= "v6.17/standard/base"
 KBRANCH:qemux86-64 ?= "v6.17/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.17/standard/base"
-KBRANCH:qemumips64 ?= "v6.17/standard/mti-malta64"
+KBRANCH:qemumips64 ?= "v6.17/standard/mti-malta"
 
 SRCREV_machine:qemuarm ?= "23c78022fc97ea5ebc19ea8fb86d324c23a6fbaa"
 SRCREV_machine:qemuarm64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-- 
2.39.2


