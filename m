Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53753C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 13:37:30 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.15472.1738244245974375703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 05:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ek7uayqT;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaef00ab172so156156266b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 05:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738244243; x=1738849043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QfrWS0ALJsXeraiTsARU5EvOpMdzj1XcCoOGxdll/yg=;
        b=ek7uayqTQEgSYQ5XXb3Hs1LKfGpW/bd0zErcBTZ4KhyX3z7EnUoxKdk7XLSozsP0NQ
         9UKBaus210TuM9wOi567EbbVJXy/uv+R8YuCEmcMWgNtkXJuIHxJD/AjR8VJJHC5szFt
         8CG/Fis5prn1811IKavsf+CO12BW8Jdjia0rHRKb8siIRw0DrF3OknXCVPOyk6K4CkEh
         Wpp1RGK9FcqWnYl3CRbDv0Ke/czd+9JOtRapcocuEAi3NQ6NfN+P+EgjLFESKRd/GPxo
         lB1h2iO8k8NUJJXp5OxH1iJifbSLT2VnrcBlFBPzfbhVf+el4U7w3aEKfHuMzmyTWW0L
         x2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738244243; x=1738849043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QfrWS0ALJsXeraiTsARU5EvOpMdzj1XcCoOGxdll/yg=;
        b=hMPEb0SJqjjNwtvwlaZGTVTtjbFN47Ew6ISf5eJjp8zrcqcWXgCDzv8RTGFIiHNWPp
         41dg5S/IOJw+du+20j42zkjawSFj4eJrBEP/+2FepBSufWhBA0txNk8usikFpeeuRCJH
         jB1UxW8wR442GKoqtzPYFSLEEYdzDz/IPsIEn3rTXjDBRVbYV0c13nYvC6FIwFrSitdV
         V5Xjfxj0ZO55D1h57hwgSRbSVdV7ZK4CRuwAckF0KT18/UgybWdEziEVcwiyLQ4/ezb7
         sOGT2DOKLCQ1wn93vVH1ZsPWlcJ16ujA3oyeD3YLKgE8Guz8g/h8uNXWsFsBfsLZCgJw
         CTvg==
X-Gm-Message-State: AOJu0YzoAJC+y/cAfa8ak1BX0hGA9DVRZjc5p77nLLI/JnAXbM+uL6W0
	fF6bqs0dJmTUOidVW8AsRjpcH0C7kjh6nwoWvwmzHjtwTtItfBV4WxZ9fj7Z
X-Gm-Gg: ASbGnctxjotOdd033/XgXTPtp6zh41ok7ion0Z1UgCYtko+0qB6TN7ZNqtXO1vNnvLM
	Xf0a0SuhOnob7TtQLzcu8+epFEgYUOncuiNPwlrQL9M4UwetmxNovsENweRheurshYyv17rFLI5
	4gq3qSV2E0kEwevGEDA2i2YVvq2/7WzgnFhgqh6DygRPcTAwXepXjkUogKR8bpxhKvvvTVDjGg5
	tMQNDdTwlBx6EsTPX9+jaTxtbyZYI7cGPovNZGSE/yAFz63uUJz2O0GG/mbayxP79sCdxLtAqmo
	f+gvMWoItU6E+cl5Ke0oc1kLig==
X-Google-Smtp-Source: AGHT+IGAnm9GHk3z45ORCO1NzlvirKVjNmMokNSv+/UQhE/dAKO3amWfUjg+hnX6Xm13ax6wEjQekA==
X-Received: by 2002:a05:6402:a001:b0:5dc:7374:261d with SMTP id 4fb4d7f45d1cf-5dc737427bfmr3503874a12.7.1738244243128;
        Thu, 30 Jan 2025 05:37:23 -0800 (PST)
Received: from talyn.guest.local ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a2fad0sm119561966b.126.2025.01.30.05.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:37:22 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib/oe/sbom30: Fix SHA256 hash dictionary
Date: Thu, 30 Jan 2025 06:37:20 -0700
Message-ID: <20250130133720.988355-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 13:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210444

Fixes a bug in the code that created the hash dictionary that was
accidentally excluding items with a SHA256 hash instead of including
them

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index f7c4b323d56..0595ebd41ca 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -195,7 +195,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                 if not isinstance(v, oe.spdx30.Hash):
                     continue
 
-                if v.algorithm == oe.spdx30.HashAlgorithm.sha256:
+                if v.algorithm != oe.spdx30.HashAlgorithm.sha256:
                     continue
 
                 self.by_sha256_hash.setdefault(v.hashValue, set()).add(obj)
-- 
2.48.1


