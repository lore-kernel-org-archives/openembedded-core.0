Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9A7C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 21:00:46 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.4737.1741208436984558534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 13:00:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PFcMOVZF;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f422d6e3b0so2163779b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 13:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741208435; x=1741813235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zj6oI/Zctc5gm0VooCkyTX5WAGFVUKdiifzjAXlL1RQ=;
        b=PFcMOVZFN/oeyZe7+a8X5rt7mVZySYsXv7jxanX0EGeTtzlgK8mlymomMFG3ca2sVK
         9PVQVWDF8Sp/Iej6/cQZhRt+yj1H3qdgW2xS4x3Fmc6cEv0+yKjTpVfhL5EUpK3V1l8n
         QsX6jkT8zTh24DfGy/Am77gT6KD5kYhO8K/6NMjDgP2nzHBml8biyWzhjdOJS0ofM6HW
         gtASl3NLUfqVkKvnnYwb4O8J0lI6f0/aYrmDUKjOQx8tQJ2t0EXN2iBYf/N1wJFNrMmE
         qdQUP4X/Y2ykvQqqVN6IkqPvndHLgvjwqjkWA8Ynsen5RUlH4rHEk7LtYST4GV/pK/0E
         qufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741208435; x=1741813235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zj6oI/Zctc5gm0VooCkyTX5WAGFVUKdiifzjAXlL1RQ=;
        b=wm5OqwxFV3CsCbTphe6fKpte/WHgAUuQ1vOnOjV32s43jJyMgdwL94INy82YT1PTaV
         nJzSL6uefGNDPHtVEf7Hp/T/HMdu/IxHfC8KVSr/drw6rQlTEVoQ9IN2CBLTD6EdMR4D
         nP02PkIqEVtuKgwH6Gyg+xDaUjzJBarXFpnmjBLQtH+V3S6FrJjl3Q4QoqVhRnp7UMbn
         f/pLTYL2YPT/dafN5160siPYcl+LnMuaNxHgyBnXNsw9IVON2A9QOPnYP9UnViH4EROY
         iOKu1TCmFteeZuVJA11LPvRMEIrwkQZFl2x3IMN5cThVpS+U83z2hX0unoQs/5zCo8wi
         8K6g==
X-Gm-Message-State: AOJu0YxzqZeaUxtSJr5J8DmY5IUDUfy5BazJ2VtYF3GMIyvrXsz/H1qw
	bxqlHKELAgeuSwWBQxi0s9lPTJNaH5sVPnCCvsToAmKU52EQkkb1lA1RNQ==
X-Gm-Gg: ASbGncv/MVm9FZnTleV9ocxUv0nA1jZAEAGg7gUwy5XfSmRi+CBbt33BX4tQW5fMPdT
	uj7kt0r0kK4xFVY0UWARUAA+AaWH91lBaLz64NW44m53jqrUMB2DEHBo7gzcWWA8y1CFD+8+z5K
	3Cmh8tXhXymUSY3tH08/aq10JNa0Q7dtA6icQYZX0Kwejf4YODUtzEYoiM8UnuRPkqDFBFd/TZT
	Zj8G1LYyVAznxTepFjhRB47FilgOSEnB0v03Dze1L0ocrfalTEW92/C2BEcABLzH32AAFYxhOko
	bOzg2ZLNtWK5nhl20PZc3frfdShcAbDuEIXOCaxkrQ==
X-Google-Smtp-Source: AGHT+IEOt+Xz3NOURR/3HXH/FbAxYCKRUZDIgraetsmQxCDc20SaVRgr841cHAMKqh8qSx4sqzVGeA==
X-Received: by 2002:a05:6808:3513:b0:3f5:4ff4:c527 with SMTP id 5614622812f47-3f6831d49bdmr1763036b6e.31.1741208435558;
        Wed, 05 Mar 2025 13:00:35 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::152])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f684b19201sm374313b6e.23.2025.03.05.13.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:00:33 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib: sbom30: Add action statement for affected VEX statements
Date: Wed,  5 Mar 2025 14:00:30 -0700
Message-ID: <20250305210030.4034059-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 21:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212348

VEX Affected relationships have a mandatory action statement that
indicates the mitigation for a vulnerability. Since we don't track this
add a statement indicating that no mitigation is known.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 0595ebd41ca..227ac518770 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -685,6 +685,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             to,
             spdxid_name="vex-affected",
             security_vexVersion=VEX_VERSION,
+            security_actionStatement="Mitigation action unknown",
         )
 
     def new_vex_ignored_relationship(self, from_, to, *, impact_statement):
-- 
2.47.1


