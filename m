Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A1AF3ED5B
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 17:08:04 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.203102.1775927280062366261
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Apr 2026 10:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qwf8Gzzx;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c15849aa2cso3888530eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775927279; x=1776532079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kVkKJgdZCFVmgfuIfntkkVIKn/hI0a+UgYNmwyOhOX8=;
        b=qwf8GzzxsxuYQz7qyuXQrFnmex4CNWlV9YEBmNFejAEDqrP6RWuvlEYSqSZokmYQjQ
         knqUlL8YFrpKFj0ClSeGVNnE6YyOnEvUjPoCa2CLPhArpKMlVMYvLpI9LJjj1MwMCgZN
         YQTjOMOrkTus8BvB2vb08PUU1BJO6msQFkOcfJ/vbG38yBeGZy27wZeQrW4GMbvlyNtb
         0WccvuKEudXQkOBJCz/G6FjE67JG1BDL3/icaB0T+QtaYVy6/G84Iby7h2287lp6n8j7
         cSJCobit9X4xZC4TEg13HuuirvdzXiuHXNUI1mqOQ2+66KOTKkgqxNsb85bNhMd3zAf+
         pxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775927279; x=1776532079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVkKJgdZCFVmgfuIfntkkVIKn/hI0a+UgYNmwyOhOX8=;
        b=cVencieCtqO7yzzhg5oZv3DgFUEUjAG0rV3Gnp6vMxuJPgd9cRbQ5XicxWGf+Nn0d2
         S4Xsm9oz4+XAFPx2QpEMNS8Y+ImkP3jqicG/1rHwEXRFvv2ZMh786nDdDQQUMdmYIhqM
         UHrG2BWQ24LUdjP961gjF4jKJ9JZXGH6mmFNIYWTNf3TsjRzTPzKa1QaF7aFsMoz/Tdb
         CHZkM7wYD+BAIBj4/KYuU31NagvmNc6X1yjeLPg92KpF2KdEAQQjp4bcKEMZWnkVgSZN
         ks1O+H1L3An/uwIn+1CtFekwN9f/qsLUBSRzZP/qNT+wgJwZIHrmIqy47mFIpNEE303M
         NvSg==
X-Gm-Message-State: AOJu0YwgyecL526BAfKMsGwGr4PFkbi0sJXFYPG6NfWYC10FjvO9DFxw
	YWQjXY1n10fIpY83ANhMk928jDLbKqcyX665ih5ODG0NkxuFwOpDD39etLWQttv/
X-Gm-Gg: AeBDies0I3uADI6tOTFfhJs+4QJtFPtZ+Xg1DErlX1LXiFgd1dY7JxqNek5J92HJIg6
	iR5K2NA5Nf43T2ryyIQAhCSCVsjVY2cFAlLQib46EwPfHJcfnyZDtRGeLO52D0msYtqOvSlJi0O
	t9YLs2WEFE6WLI0t4Vij+MhmUkczz8vU2vvr8c/rTrWZtWG0vt7l5DG8MJXLARn5Tn48e2l0ip1
	06Nt5Ci7jswAQl9uNTRsydqIfQS3jy1VmBtrK2fe4jK9F0Au4Sz4PXLJBBwqPj1i16z26b/QIZn
	jCr9+pvXzBhxkuMneY0cVCuO4mOhPrRNmYqB7zIpppnv0tl9ESj8kHhx1p2+oXBjQ67Q94QrEjT
	7sfeb17rP0+ngdvP5uPjjH0b6VWwnn11aH+CgJ0Ep+d6sN5t8GTeA3e4hqreEwC6klml0uqB0UN
	w7TSu2FqqKXq4alwckn5Pp0xjnmxnZMFepOKRulleubsrQDTUWVe5gZHyjklhvaeRSBBT/4UZWw
	9R5OR0Ce5/n0L5w2WqVGl2yMfdn0EGmnudgRJvEDVeYIzHsC/iZOgydmz/D
X-Received: by 2002:a05:7301:1f10:b0:2c1:74ad:2ce1 with SMTP id 5a478bee46e88-2d588d8ab4bmr4758763eec.28.1775927278824;
        Sat, 11 Apr 2026 10:07:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5632a2a06sm9151982eec.30.2026.04.11.10.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 10:07:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] u-boot-tools: Add dependency on libyaml for dtschema validation
Date: Sat, 11 Apr 2026 10:07:55 -0700
Message-ID: <20260411170755.310124-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 17:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235047

yamltree host tool, used to emit YAML from the DT, is now
built as part of the normal u-boot-tools build to support
the schema infrastructure

Fixes link errors like

| /usr/bin/ld: scripts/dtc/yamltree.o: in function `dt_to_yaml':
| yamltree.c:(.text+0x91b): undefined reference to `yaml_emitter_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x926): undefined reference to `yaml_emitter_set_output_file'
| /usr/bin/ld: yamltree.c:(.text+0x933): undefined reference to `yaml_stream_start_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x93e): undefined reference to `yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x957): undefined reference to `yaml_document_start_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x962): undefined reference to `yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x983): undefined reference to `yaml_sequence_start_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x98e): undefined reference to `yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x9ab): undefined reference to `yaml_sequence_end_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x9b6): undefined reference to `yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x9c8): undefined reference to `yaml_document_end_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x9d3): undefined reference to `yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x9e3): undefined reference to `yaml_stream_end_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x9ee): undefined reference to `yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x9fa): undefined reference to `yaml_emitter_delete'

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
index 4e4f7fa092..f6489427cb 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -1,5 +1,5 @@
 SUMMARY = "U-Boot bootloader tools"
-DEPENDS += "gnutls openssl util-linux swig-native"
+DEPENDS += "gnutls openssl util-linux swig-native libyaml"
 
 inherit python3native
 export STAGING_INCDIR = "${STAGING_INCDIR_NATIVE}"

