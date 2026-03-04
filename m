Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80C9EF900F
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:46 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23102.1772642919273944076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kwc2Nth2;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4638a18efc2so4838653b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642918; x=1773247718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZsTCBgME1PNRjxHczDMbLqJbIl+DF2WK2U4einEvRE=;
        b=Kwc2Nth2ixtQuJrDMidLeHl4syHjtoX8oycayA6k+n/9vsKXt5nKTeSOxCe8renjb1
         5aGmiNojmYsrMyw1SST03gauSs3KWmCvn0fgZW1lzYjlKUUrDDF5naYMuxe/AvVgWQ5R
         gvQqBpU27yfjXNQhD1iW2v4kcXWg2f72/pGLi19pPFgvxhoyyfFNFbhuJg745vypS5rW
         D0rPcdGtjpRNI/8iUH/JtS0Y/k+BuNHuapRLuzZz44fDcsyRpyzKXA9y+/SFFm0UqOSW
         3rhXTAhRkQs3psBZF6KVgjo++tD9HP++mb5qT4jso5B/Im1vofSUIlNMVdpMSdukUKsw
         uY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642918; x=1773247718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZsTCBgME1PNRjxHczDMbLqJbIl+DF2WK2U4einEvRE=;
        b=Vr09Zu5TenIbnSuxZy5sOkDvAtuYSLjCZguwRpNMOYbee2Uxr0YtoKcWFdnThg1Kgb
         FtqZ0lNWsouu4c9+0KdcnVUUzMh1ozZhBNrtuASAWYJhgSpzznCPhaHgWgE6cvRLopkd
         E+zC4zQtZ4b2lU6Z6lLgD4E+4LaK59qYC+PZxhGyhdxjFXgp57iXdLPzvNdUtiNIohTp
         xqiOPs2dzS0NQawpXrNmXsbxXeGuIUOKw+D2i1s1UQcqlDH/XsiN/PmnXJsivATtrgnR
         ovmW8gPk9ICPCnT4kpVpy9ukKqMCqpjcBuvd2L522XGemcE28VSXLtoz9Vqw9cI6T/p/
         ibgg==
X-Gm-Message-State: AOJu0YxczcLXZ2fqHsu7IdAPC2ggh9dxctmuMgu/yUQzFFFOECK+B5Ox
	PpleieNHafPhblN3jzPpGfnP3+JAxS0xbcFpIZE/eNVZ8pYYN83yoN3DAGanpg==
X-Gm-Gg: ATEYQzyEqfGOXcYpaS63Bof4rKhJtt/IayG4BJ+8MI/mzFcsyomq2gUOyd5B5fSMuCa
	UIheJ1/EoipQzl8lVf2jvuNZhElJwgIZIq2dvoVSHHZC2LV7rdClFZhgzlDVbm6js31lNbsHq5X
	0w42LDd0xB5xLBPbq/cCvG3DTCZ/198UblnhpzBsLaW0QyjZY6zLJNEWeBWT4eJijeHpff/3hE8
	DsfJaYNcFybKiLGH+jaeKBcMJ5TGOK8tzSX3RWj10yj09wM6UDARQP1acI+rLzeYmTpwr1x9F62
	Xa5vMmuQst2euD8M7cx9NpLauIggUpkrTQ5DpPMHFBCl3jdApxDY046XUTLfI7gEGNPqXQBsSol
	g9i9p9w2InUTriIhigkFU00S239KZEGm7A4e+67zDGWo7We98Nw7oZffHPnv6grKJRUKz6AgwoD
	H8VyQO4qr4stwoTqZ4zcj9
X-Received: by 2002:a05:6808:c1fb:b0:464:8533:e32f with SMTP id 5614622812f47-4651acb06a0mr1225812b6e.35.1772642918324;
        Wed, 04 Mar 2026 08:48:38 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::f681])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2c9fc2sm18466442fac.18.2026.03.04.08.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:48:38 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 01/13] llvm-project-source: Use allarch.bbclass
Date: Wed,  4 Mar 2026 09:44:12 -0700
Message-ID: <20260304164835.3072507-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304164835.3072507-1-JPEWhacker@gmail.com>
References: <20260303004550.650726-1-JPEWhacker@gmail.com>
 <20260304164835.3072507-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232385

Converts the recipe to use allarch.bbclass. This is necessary because
SSTATE_PKGARCH is set to "allarch" based on if allarch is inherited or
not. If it is not, SSTATE_PKGARCH has the value "all", which means any
data written out based on it cannot be found (because "all" is not in
SSTATE_ARCHS)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/clang/llvm-project-source.inc | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/recipes-devtools/clang/llvm-project-source.inc
index 13e54efbc2..6bb595b7bc 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -5,7 +5,7 @@ deltask do_populate_sysroot
 deltask do_populate_lic
 RM_WORK_EXCLUDE += "${PN}"
 
-inherit nopackages
+inherit nopackages allarch
 
 PN = "llvm-project-source-${PV}"
 WORKDIR = "${TMPDIR}/work-shared/llvm-project-source-${PV}-${PR}"
@@ -14,14 +14,8 @@ SSTATE_SWSPEC = "sstate:llvm-project-source::${PV}:${PR}::${SSTATE_VERSION}:"
 STAMP = "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-${PR}"
 STAMPCLEAN = "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-*"
 
-INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
-TARGET_ARCH = "allarch"
-TARGET_AS_ARCH = "none"
-TARGET_CC_ARCH = "none"
-TARGET_LD_ARCH = "none"
-TARGET_OS = "linux"
 baselib = "lib"
 PACKAGE_ARCH = "all"
 
-- 
2.53.0


