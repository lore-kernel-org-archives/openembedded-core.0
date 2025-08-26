Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDD1CA0FE7
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:44:56 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.65034.1756215888601475451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tYMC9zzd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b474d0f1d5eso3710631a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215888; x=1756820688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8836OeOWbMJ7qq7RXClRyYZrpSlvTf1QEhc0VRRKdu4=;
        b=tYMC9zzdw/C4XMxyyVFd2EpKGNG3GFmwS8bPupB0NoOaDKfGQqy+UqQb8ip2NJ+UF1
         coP6LTjBN+D6pMwLZs0lYICetTuMOLoCNGEAPq7yEOILFJ2zaBNtWsBXFs98ySUDYrpg
         Tktjy68F8tft5jsqovIk57KV5FxCKRhcZmFNGru+k/yDUfBbxQJuItNO+BGHUIUMsFWH
         +rboSvV3bAmtlNl2dJr3f1DEmieiXSoXNX/kP07CvtED4Hhgw9mMXxZdYl8O2wYpqit2
         G6wEyi8tgwzD6TdjAhEh/r8kDVPnaNUOm4h5RLF7qDxBellhgzKJsyMYoo8ATQWBWSBz
         /qFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215888; x=1756820688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8836OeOWbMJ7qq7RXClRyYZrpSlvTf1QEhc0VRRKdu4=;
        b=tTCsYIAYwu/FdnJg2mFxc5HTNZaR27H/3SvGio9ah45+boM4eiITCB9Txl4vwsfAOg
         MnB11eRS2EyAMIGgWS4FoZqI4Fkuhiro0IWXYU7F5OTDahO6fbcPetjYXOV9tuSQ6W10
         3912JGWdMeUNaVkTrb56w7cM2GhO3B0FSbAVqCTzfOGCUjq24Z/ght553XZPGi8ahU+m
         Yq5yqbOKfJ4tqKf43JNlMUopWwe3Zw0ieZcLVTnr33l9XkcYvPpbkkOGxS8paHe4Sm9f
         Uf33WI6lGH5Fc7gLwuujXq8gmiQwir753Cp8KUeliLiamgkAFeRv6P0jgWCnLvjgcaP3
         aFSQ==
X-Gm-Message-State: AOJu0Yzx4ll4PLHnrBSAkqwgCnVdffRTxoBucGT7rDDjIyLFUa0+kSaU
	FRiNAAIzkwRkbyAAJ3c6MJmtiia3Wfs9sfcIq7FbSALfOGgBut/3I+dddBpnYIH8d8t6C7U9z47
	AnxRt
X-Gm-Gg: ASbGncuW4zuhNo/245VWelq5GEqR2Xc/HFHEOOnMOU1bE0cjv2VMCcRX5gv9hK8H3K8
	onnH+D/0RWDE2O8cxajxSExYFYT3TUj+qPAcekKCyG2auR89bki9sed2BH5tT/WV+eNXqucc/cY
	cXrMg6RDs77MofwC5Oa8QZ+I58j4URn44IHyAv9B+gBTdPWKuOWWn1yrKy1PrawvFzLJThFYih5
	fYNzQyjdDGgQtVxWoCezbm3lJ541P9oNAVhbty1eQCUJXhbpU0T5xgrWK4tE1rTWUbQ52N4S3kh
	/Ev2CmYSWa/6OHnZTNoTzLT5cCETVUaNixH4CjDT6aHWWKUx8WDOH2RhZOPOX06Ryxd8gQyCM3L
	rbc/blAGOsm9Nkw==
X-Google-Smtp-Source: AGHT+IFsZU36NYwtc3tmQ7Gd0nkhyhxXwhyqO0uqaQHiQ2RPJWADiPTbPsqEGr5teuPl76KhPbmjiQ==
X-Received: by 2002:a17:903:32cb:b0:226:38ff:1d6a with SMTP id d9443c01a7336-2462edd7db5mr229585495ad.7.1756215887784;
        Tue, 26 Aug 2025 06:44:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668779fa9sm96941595ad.27.2025.08.26.06.44.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:44:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/9] qemu: ignore CVE-2024-7730
Date: Tue, 26 Aug 2025 06:44:28 -0700
Message-ID: <93545ef00c4930dd297649934bee0e95c520ee16.1756215756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215756.git.steve@sakoman.com>
References: <cover.1756215756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222467

From: Peter Marko <peter.marko@siemens.com>

This CVE is for virtio-snd which was introduced in 8.2.0.
Therefore ignore this CVE for version 6.2.0.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index cae33459e6..1298514cd7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -164,6 +164,9 @@ CVE_CHECK_IGNORE += "CVE-2022-36648"
 # disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985
 CVE_CHECK_IGNORE += "CVE-2023-1386"
 
+# virtio-snd was implemented in 8.2.0, so version 6.2.0 is not yet affected
+CVE_CHECK_IGNORE += "CVE-2024-7730"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.43.0


