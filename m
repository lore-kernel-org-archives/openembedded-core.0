Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09D2EB3655
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 00:46:03 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7683.1772498755092041875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 16:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BLjE2ZtL;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-463a0e14b4cso2194774b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772498754; x=1773103554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZsTCBgME1PNRjxHczDMbLqJbIl+DF2WK2U4einEvRE=;
        b=BLjE2ZtLhcqry0LtyQ3FtwBmXjYAb4pzTKM/2t5k3894knMCpzOWiu53a2yhAAhV/B
         qALGC8L2nipIbOCWfGXmje9+37JK8/ySLtCTt3N1b7lBu1DghoTfehAu9XHzCKc3C8GZ
         vCuYKYm3acTSupK5cvDrT7HllVhWhGDygi9T/b4sAUMJcgJWu0/9Y5rMzaYkgrtlzWO8
         35sbc5OjunG/500kKmWCsgiS7KWqUll/NoMY4pkTb/qmw/AYJnhiRYvJEFXWftzG3kqN
         nbR+d0oU0lWRjTHl6Oo7OLOAuq0v/2NGLEPwoUGnADxtDEEpVVP94ZN+c30YJ7+M/qIB
         Y+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772498754; x=1773103554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZsTCBgME1PNRjxHczDMbLqJbIl+DF2WK2U4einEvRE=;
        b=CbZZQDIbJDyNqJlv/4+DqfBk4Xq+M8L1GrOqNbt/i9SrhQWMKgNQ5B2E5+jEXvXt7F
         ngaTSjg3ePUhH0L5ov+lg/YrKtYZmmOLLlWElMf1OVIOULxGHpabIdaPNRDWeRt1P1R0
         p3vRTQX0B1lo44c+S4P+i/LH92Bv3RSOOtQFWUAxv13E2/MgCAPviTkpe/0iJWg+5Fw9
         vgmNsBh2HzkxCw1cT7MqnM9MUmRq+jcZ3x4uAoKfCwnT7vR2AEj9SeeJfDSC11myaU2C
         Agp4CaNBD0WiiMZeVw5A+3eKo/ubUlhv+jAgKnjYr7y42DTBLG1e/wADfiTpRga7kFGN
         iIVw==
X-Gm-Message-State: AOJu0YwuqfQWdFoq1qvD9KvwJX56Y9B3FZbR/33eA6PsnIEcdNQ9LTFi
	Q4SlavOaqzvriOvArDOHQspHVjN4TiUwF77wQef/wLLwPrngRUQ60p7s14WIXA==
X-Gm-Gg: ATEYQzx7pncxMp7GxJMj0R3BjIDWgaxn+xeauP1G7PgSpusl1s3u1bFi3i4CNCbvIMq
	CUICn/R2zSSTi5elPWVqYESwWQK8aMtZyBtWkSAKxbDH9LpkWD4/0hirO6hwGRT8Nzk5QjC1jQ7
	DlP/SXe1OuSkYh+X/ej/iEUXzN6czhJhJax8ncoDr26TCT+Z5iMZaS/GeGzEUA7oHrGWuYDWTlD
	8lYjS6rb76DYsBrGVAYZspj5R1O8MoRRUL66G0PeF0ZO7U5oNsYlBMe1Y5SAzMRLV9MEgf1BY+S
	8xZxbH42ANAAVe/8YJBWVmrKQAPGP5AJkQNzQv1pZ9DxUjOB3QTqMjL08UQt8it93GDfL3CRzWL
	rAPGSsDyZcVveWS5stohN5fDVWxj/MtaSYfYL7uo64tmbknPFELReLW/Fzm8C885XvF+iJ1PqSp
	5fsctCzG1HV1Rh+QZm/jr9vk8sbkAjxgU=
X-Received: by 2002:a05:6808:1492:b0:45e:f91f:9730 with SMTP id 5614622812f47-464befb9a1amr8522744b6e.51.1772498754164;
        Mon, 02 Mar 2026 16:45:54 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb59b66fsm8637446b6e.10.2026.03.02.16.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 16:45:53 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 1/9] llvm-project-source: Use allarch.bbclass
Date: Mon,  2 Mar 2026 17:43:48 -0700
Message-ID: <20260303004550.650726-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303004550.650726-1-JPEWhacker@gmail.com>
References: <20260226173930.2847872-1-JPEWhacker@gmail.com>
 <20260303004550.650726-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 00:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232224

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


