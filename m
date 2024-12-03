Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CCEE77165
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 22:38:58 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.799.1733265533070150542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 14:38:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LXRLZElf;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-29e61fcc3d2so2656899fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 14:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733265532; x=1733870332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs5WneK+Z3rFkHKiEo5z2sywvFlRAlzZ/c1Gcrz+yz4=;
        b=LXRLZElfglQFniZuP9NJDCLq7HzN6/p4n9a0MzQUowtjR4yoiGjKIPrhrBvb03bFKx
         SXvlKrY19BoeqgfYcIqsjtZFxSDJAxcfNwbip7O8F6m4ZOLkHAf8dt/7qLJnArohg1Fl
         R2xd7wPORwmcb2B9Bk1qVL8nO7kHPQY2jrssuagxrjmB3DrQryjOs/5RyhUQ2Ke2Sdsc
         Znr1MHptDQEW3AQqeK1sZkxbch73tXyCDOBsGY0gIqTID2xFGR8xXOd3A0B77+Suteha
         ODk2gjYQM10De5Vg2nSSQM0LFzaceB9gacYiatAljt2z8Yhv8IGVS8xN4/I4AcY5fzjK
         m+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733265532; x=1733870332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cs5WneK+Z3rFkHKiEo5z2sywvFlRAlzZ/c1Gcrz+yz4=;
        b=v55MJwm+mqDc4Uqsj4w2bnpnK3PomihoQaeYsl/GNRLLtVzK15q+UQWOZBN0iiQG8m
         R2KJEXkPyzoYaBE3uRExIRR3kUKVjzPiJ0mvUfCUs+ObAfzCuhyKqD0oEQNvyZgZhy8C
         oU1/DntSO25YKQtmrA1BmfgJLiRZQ51xWtCAPNtasw4v9RaLgINVdg3fGQEyLdi5opkY
         hnYYAVNsFwIcUlc1+l5iOE/Y67JsslwKIWlhZ7tPg8etGN9f7tRQc2fUZ95gHsgssx8J
         zH76lnJqjEBG/8ZsxqsHYdG7tCJMuh8vRoD9/GAE4OLFCVAuU5ilr7CEknVwF9FggWSY
         pszA==
X-Gm-Message-State: AOJu0Yy5OGCv/o30+mFAara2WXqcizKxp9TKa551UNUecLxO2F6DpLbd
	QY0c+wCrKudkpUnZEu4zYBWWWdVzzvs5Guf/sJgso6PR+nY0Gd31KRegxQ==
X-Gm-Gg: ASbGncvDTMa0aNTP/mVEIP3gBkNB1NxpD7yf/d1v/jXwXUDfJdVoCWRF7TMHsfx3QDy
	t8s5H2Rabgh0Tdfcb6r2A0i8M4R84k8VhMTzIuQiBhsfmC/78+hIMDW1a0JrQickeRDZJQCVXI3
	Nz4x28bGfnvzzEsj9el5CwjwhdUI1NiufxryxxvQ9+ovVdfXDeRsQDw+YiHzzMzbX1bqLFXX9ms
	BBinIluR4cF09HR7DIw/0pybLbjMkbOoO42E9wHV/UVFEqq
X-Google-Smtp-Source: AGHT+IFdaAinT3wDUt4BtmKxEXF70YKeXXXjtTUUB3f+opNldHyahM+n6aalKM4bthfCcuRWQv1SzQ==
X-Received: by 2002:a05:6871:e7c4:b0:29e:443b:edcd with SMTP id 586e51a60fabf-29e888da8a1mr4814863fac.37.1733265531828;
        Tue, 03 Dec 2024 14:38:51 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29de928c9b7sm4037836fac.22.2024.12.03.14.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 14:38:51 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/5] lib: sbom30: Fix agent reference
Date: Tue,  3 Dec 2024 15:37:07 -0700
Message-ID: <20241203223844.2689172-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203223844.2689172-1-JPEWhacker@gmail.com>
References: <20241203223844.2689172-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208223

When a agent reference was being used, the code was not using the
correct base variable to look up the agent

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index ea70f6fb69d..7d01715ce24 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -393,7 +393,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         if ref_varname:
             if ref_varname == varname:
                 bb.fatal(f"{varname} cannot reference itself")
-            return new_agent(varname, creation_info=creation_info)
+            return self.new_agent(ref_varname, creation_info=creation_info)
 
         import_key = self.d.getVar(f"{varname}_import")
         if import_key:
-- 
2.47.1


