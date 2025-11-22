Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1315CFD2FC
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:14:43 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3743.1763849675702609338
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OrQcuebJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3437af8444cso3357702a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849675; x=1764454475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h742afWuemoFVasah5LQQuHHUsQwDPyfX6YtGwvzBzs=;
        b=OrQcuebJjlUSvvcGWyKGyFSNi4BtFVYyKuvUjxflNsUoXsD6LKNeh94S0EL3Ob/Boa
         0ZaVDCdirfGXs9U6NvytJa4y//RzoFpcP/C3ZSRTkPFF7hHhJanzJeDPebOz+C18mdRK
         FPJ46Pvdd24KTOL5gfWC4XuAI6iZL/l8ham8wQ67eae4RRBM6kD23GXdv636avdyvLYI
         lzsHJ9d4SgIs+/WAYWJwKiP+es2PEocgdoDNYTCu5fRCTnHB7EuEsOM2Cy6We8NUdhUf
         aSz6gG4jqXhoO/STlk4Azm0hbWYMJbE7DA75BmRbhG97cNWFtXjjlEJ8W9Vd7n5GhrPg
         NdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849675; x=1764454475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h742afWuemoFVasah5LQQuHHUsQwDPyfX6YtGwvzBzs=;
        b=QwbuZsdtWlhFNS2jB1XhB+BteAFHdFHsUAB1gcj7/lFF5zNdLzxS9Y4UyPHHripRuf
         XbcYNe6kxY3CqNVaJ4xCfvnuT96oe7HnPcWamnKIaqBH6fvAZCwvpyNH3TdTb6KVjrYG
         kCRdwwT5gpyG2JIU7iUPbBqLFNxueJo/Aane/8DztcicFQgo1BUNzDAfoF+67ltAKtbz
         lDD3BjlaGhLkDCsD6+o9ox+vq8oHDOsAQYfGbOoviMc5JcaCvTPatn82P+2l0t/5ZIeB
         oHK70feu6oEablWhc5Ugw/HNrpjUS93+JqTu0wqIQBTrV2lQ69jw21Es0aWXuRHZdh1i
         FcpA==
X-Gm-Message-State: AOJu0YzO9Wlvq33d7/dBgnai0rPmJynjgqsokzt4Ti5qtoeTX+0RKk1T
	LUyu1psvIwKumqwIiMZ7jUszc3XObjtWgkPTlOqlgwA1Py0V1XucF1kM7tZjkQizIJLSlJs+8gm
	PJVLP
X-Gm-Gg: ASbGncs7zllHS71eOeLp2+Q1HYq/U6RmtPvt3LZukxKFsmKTsZdrcwQtnsX7cQDn1Bm
	a4SbwTA2eESpCKZThau+jfSPCpGxxNZdWtVmpcEGNWvOxoGGsbozs9gD9hXZlMLgNG3Lkoaq+gK
	SSu/cAFeRLPmnLibaF2I41CH5BKfKmmmHUjwKb3Y9BfkGAOX2vyqVMtf6+PRhdRSNX82ChLNLM5
	Q2fIRjiserC4XbUo+j5PuDfxk0oPsPlcjhwxwvUuU1ZmmHHwNK6t8gGsROCUI4DoOc+fHHyQaoK
	6BH932n62y6lKXspcoXvtLt3GlZ2PzmD+JSjM9iaxtlsFusr0sOYnHT7xZpAWFH77zrUnzeTV3R
	sRmPNn37YSrhHvIU+C2MyiqbO/QsPOgaUaZta3eXiAa+0IoLG3rUcNRgKwl/Sxs5QIiOHr6R9Bp
	y1Eg==
X-Google-Smtp-Source: AGHT+IFS+l8eGkuzISXR5pmm8ELnhF7UiwYCG5Bqmal2TtXH167Q0htTOUU2r4pke/PzZ9f84YUWOQ==
X-Received: by 2002:a17:90b:582d:b0:341:88ba:bdda with SMTP id 98e67ed59e1d1-34733f40cc0mr7284182a91.31.1763849674868;
        Sat, 22 Nov 2025 14:14:34 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.14.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:14:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/21] spdx30: fix cve status for patch files in VEX
Date: Sat, 22 Nov 2025 14:14:07 -0800
Message-ID: <8d14b2bb02861612130f02c445392f34090ba5d9.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226698

From: Peter Marko <peter.marko@siemens.com>

This commit fixes commit 08595b39b46ef2bf3a928d4528292ee31a990c98
which adapts vex creation between function create_spdx where all changes
were backported and funtion get_patched_cves where changes were not
backported.

CVE patches were previously ignored as they cannot be decoded from
CVE_STATUS variables and each caused a warning like:
WARNING: ncurses-native-6.4-r0 do_create_spdx: Skipping CVE-2023-50495 — missing or unknown CVE status

Master branch uses fix-file-included for CVE patches however since
cve-check-map.conf was not part of spdx-3.0 backport, closest one
available (backported-patch) was implemented.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/spdx30_tasks.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 6b0aa137c4..8115088ab8 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -503,7 +503,13 @@ def create_spdx(d):
     if include_vex != "none":
         patched_cves = oe.cve_check.get_patched_cves(d)
         for cve_id in patched_cves:
-            mapping, detail, description = oe.cve_check.decode_cve_status(d, cve_id)
+            # decode_cve_status is decoding CVE_STATUS, so patch files need to be hardcoded
+            if cve_id in (d.getVarFlags("CVE_STATUS") or {}):
+                mapping, detail, description = oe.cve_check.decode_cve_status(d, cve_id)
+            else:
+                mapping = "Patched"
+                detail = "backported-patch"  # fix-file-included is not available in scarthgap
+                description = None
 
             if not mapping or not detail:
                 bb.warn(f"Skipping {cve_id} — missing or unknown CVE status")
-- 
2.43.0


