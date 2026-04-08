Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488DE10F9957
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 15:44:33 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.108679.1775660410666926219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 08:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o6azBeqr;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: zizuzacker@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b299b3c739so15401055ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 08:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775660410; x=1776265210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AS+reWtdnE+L0WDM0XTt1SH3Ssst5ITHaw/dRtXtjDU=;
        b=o6azBeqrXAnbCdJEzQQqqhS/KgUr6FGtuhTUFByeUvSARm7yzWDoHgBRyFo6MKVPTr
         Pe7fqujXMF2vbLAqrYbtE44bGhYqSZ2RMr6fQCe4EcEhPMCrzx9GRiMlHPI5gF/5kgEb
         yhjxEenX0gBhlr0zrbq6bDJ8lmfLI2SEb2BLmMfH0TnSREt18vn0YGis9rbpRMsA6v5N
         UeRkBxy7u3c03U5afanFDGE8Lxjt5U6ML3aJ5zBqsWGTv7E8Hkq5vz+5CxkhU6fwAlO6
         Ch7rpXRxK9K090hnr3lOMtupjMityg6eQSzA51tSnbO1O0b8S5hDreSPFw8mAXxQdaWV
         skMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775660410; x=1776265210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AS+reWtdnE+L0WDM0XTt1SH3Ssst5ITHaw/dRtXtjDU=;
        b=S5xnCOiRPh932tFTw+zvHhPH4xmaJsd+2A0hpLNTwGooUCF12w/SIZU0vH8WYXOdF/
         A46V8gpao6B6piPjJ2q1C0LPlvhZXeBpUOPXA7Kw4AVQpaJdJ/h0JyRPo2rRh2lKaVum
         jCZEWsE123xTFmxw93zpiems4DgyFvT7LMuqjE1R8hR6ssUFnEV0DdjScgOcWg+1OJpX
         QCXnFrBXnc7IT9CnMcLHHogCJiaITQrwdGt8PCUitHO3LHSvbPC8veSee3kVRYvhQ2Yr
         Lr9NtRjbLbOsvPIo3hooqCFPWuXveHLqjiiEfXZPcCtSPmYEjnXISAAm3lCfTMmbjK8N
         isDQ==
X-Gm-Message-State: AOJu0YxGYPz4UFzx+O0drvp4gDPF7S1G4fVMrpo0cFaMtMquiruniBIa
	K7PcoXIE7C6FN2l3i8WZVeDVVZ+WSbtFfUYFcCJ23lIp/czsR5sb13vF64Mhvw==
X-Gm-Gg: AeBDiesFnQvUrP8BlV8k1UfqpNpemPSs7C/XzUO4vZoQdSJ/Rk4LW0+1N5HLEMpSNWv
	LRQXQ41ep+xUpfTG3Frv/qx8oXimERgz9trEp8kjAILekPe/jj9B7ZpbYIfhhMTiRvD4Nurw3c/
	vIWVFVMg0+nfdHNG9qyQ2x+h0ERDMbvDv7dKq7vFA1sKchVWGPZCibKR0wH/HQnq9grmbenmG9s
	q8YPcHLBpZUWUJrAH0Ry6/qhJiGBedIQrBgEEbH2miAIuu7qHSBu9jzpLd1Nyu291khgqzfEbNf
	vLF93uBVDdiXkE4cUvpyMFiRWSLdFVHrH2knZlgJwSMR1U5zXo+l07a5iEqobnvcoqTOj1gAv+Y
	cZl0HtPO5vXbAqMRSAxH8a2ZTDM8RjFFKpcAnMyDewxbvgfwMllTLPPmOZ6fPOGvEYRIEB8F9Mi
	ZraNkvVb8c2eUTnoE1fYhnrjmHCaEbh2Evicw=
X-Received: by 2002:a17:903:2c04:b0:2ae:471b:e55 with SMTP id d9443c01a7336-2b28176a488mr220278945ad.30.1775660409616;
        Wed, 08 Apr 2026 08:00:09 -0700 (PDT)
Received: from localhost.localdomain ([42.112.63.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af31sm202895775ad.52.2026.04.08.08.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 08:00:09 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: zizuzacker@gmail.com
Subject: [PATCH 1/2] useradd.bbclass: allow inheriting with only USERADD_DEPENDS set
Date: Wed,  8 Apr 2026 22:00:02 +0700
Message-Id: <20260408150003.18063-2-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408150003.18063-1-zizuzacker@gmail.com>
References: <20260408150003.18063-1-zizuzacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 15:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234853

When a recipe inherits useradd and only sets USERADD_DEPENDS (to depend
on users/groups created by another recipe), without creating any
users/groups itself, the parse-time sanity check incorrectly throws a
fatal error about missing USERADD_PACKAGES.

Skip the USERADD_PACKAGES/USERADD_PARAM validation when USERADD_DEPENDS
is set but USERADD_PACKAGES is not, since the recipe only needs build
dependency tracking, not user/group creation.

Fixes [YOCTO #15863]

Signed-off-by: Zk47T <zizuzacker@gmail.com>
---
 meta/classes/useradd.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 16a65ac323..9d857a4555 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -212,6 +212,11 @@ def update_useradd_after_parse(d):
     useradd_packages = d.getVar('USERADD_PACKAGES')
 
     if not useradd_packages:
+        # It's valid to inherit useradd and only set USERADD_DEPENDS to
+        # depend on users/groups created by another recipe, without
+        # creating any users/groups in this recipe.
+        if d.getVar('USERADD_DEPENDS'):
+            return
         bb.fatal("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE', False))
 
     for pkg in useradd_packages.split():
-- 
2.34.1


