Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C855EF9018
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:47 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22973.1772642920189520576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QRSiS6G4;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-413d8b8e98aso1069841fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642919; x=1773247719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bs/2ESNOjlKv5F2a1L5fY1cfh3Mb2GOypfpxUG+ELw=;
        b=QRSiS6G4XwGe/1uD8hpnFt9QoJxwI6OG4gn/xaMcmNJ++P3Wo9FamHUYCQuJQmu1+V
         2D+3mP5rC+AMncH1KOz3I7SFyf5qXzHOTusqXPwPfftQOaDBu1tRXX2ny9zt43oLjZRl
         w5ab3GURVZbCKgzdKIhZfDNXkIjT1/h0DjopoAiogxD0L8HWh9gXCfFm/RYtMRNNkfhX
         QNBCRMNnCs7j3ZePGe7/2DM3SaBvCWitC8lVaAktyohQgq9uJ+7RVUlKQDJHRrVTT9bg
         6t/Ls4oT4INoyyPgQNhLkGj6H0Robu5uKXtAqf0S7t0CPDQV75yWDOpHmb3E+O7kxLgq
         no8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642919; x=1773247719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bs/2ESNOjlKv5F2a1L5fY1cfh3Mb2GOypfpxUG+ELw=;
        b=CzMVwoha/zyH5LPN0TMXvZ7T8loa5wYg7Ga09L5Lb8h1rEYYiLB4UIyArdBG+YQXxT
         vRKyVAuzFDnRN3KwTJYEcg5QYQOwr/Lvs+Sx8IAzcMfSsUckLelV1qWvT9HhXs08kNpB
         FHVgKI5XU44Qyc3J6kKxtufz6lomObcGgRkHciacFcN1rmHZREi3EbB8IeXpniFmQ4aP
         h/dYaL5XCi4/j+kPg6rbyU1rBS5N0KQXU72jKZVkTpk5Qi0Sf+/dfKSwh1M5nI3O5kHh
         CcG/b/woPzX8mz6tr4RoiGSG2yRB+vAnqTijEez3O1v3RL2Gtq77qWInyioib/2fziYJ
         cibw==
X-Gm-Message-State: AOJu0YyY4jLr67lFwZnasuSmKhCcrFqEFuQvbg6TQHNhaiFsd5XK0vcs
	I/byb7Px8AIWUQ0quE3QmKlCS8wo4wwKsesX1/l63N3X2skwzPriwAGWrfe2uA==
X-Gm-Gg: ATEYQzz11fPqUAZnbQhZl10pVoNwHHyfSeYBLWnObhNtClH2GJK9NYAxtHa/ZXJKwRx
	gvG+0Snm4CXbM06iSwZnAqHBlRrxPR6wYUCSpIG8zZJkmSxcmJOgd38YVW5igEf/TW51iWQHqVN
	NiLOqfE0/43vDOB47UQce6gsocj/WpJh9Tt1gx4l7mGX3b6tsbkvSlXCXrIKD2+5jDmBszqjMhO
	YdlNrwE2+Lf5wu6NV6CG/8neeEvjjm0A8UAuzWkeSclx6CsrVYnVoTVWv3+ZYGiIkQpZhEVk87Y
	NJwsQ09uw2Xy7qLOM3TZAkSTsjExKy5K6B/Vkgxw9tQ8HPV+lVZJxjWmlLcKG0yZBdXGYIml5GI
	8JRcczR+I+wXMDx2YNE2AZvxceOrxE7g66saPiUEYUk862pJxy+3gooDb6tYmG00HIatrc0WKo0
	sgIMJLhVOcYAO5kDirUNeZ
X-Received: by 2002:a05:687c:20cb:b0:40f:2ae3:2601 with SMTP id 586e51a60fabf-416ab4dc13amr1379376fac.10.1772642919087;
        Wed, 04 Mar 2026 08:48:39 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::f681])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2c9fc2sm18466442fac.18.2026.03.04.08.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:48:38 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 02/13] gcc-source: Use allarch.bbclass
Date: Wed,  4 Mar 2026 09:44:13 -0700
Message-ID: <20260304164835.3072507-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304164835.3072507-1-JPEWhacker@gmail.com>
References: <20260303004550.650726-1-JPEWhacker@gmail.com>
 <20260304164835.3072507-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232389

Converts the recipe to use allarch.bbclass. This is necessary because
SSTATE_PKGARCH is set to "allarch" based on if allarch is inherited or
not. If it is not, SSTATE_PKGARCH has the value "all", which means any
data written out based on it cannot be found (because "all" is not in
SSTATE_ARCHS)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 265bcf4bef..3ac679b1a6 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -1,11 +1,11 @@
-deltask do_configure 
-deltask do_compile 
-deltask do_install 
+deltask do_configure
+deltask do_compile
+deltask do_install
 deltask do_populate_sysroot
-deltask do_populate_lic 
+deltask do_populate_lic
 RM_WORK_EXCLUDE += "${PN}"
 
-inherit nopackages
+inherit nopackages allarch
 
 PN = "gcc-source-${PV}"
 WORKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
@@ -14,14 +14,8 @@ SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
 STAMP = "${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}"
 STAMPCLEAN = "${STAMPS_DIR}/work-shared/gcc-${PV}-*"
 
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


