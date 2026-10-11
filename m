Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F544CA9ED7
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:18 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23429.1791708067949004448
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wxjem2+y;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso518360f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708066; x=1792312866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T4nkVpkBHgoVdUxB5q3FW04+XSFv/2p8/7PTO58TEpM=;
        b=wxjem2+yCyA0/3L/9tgtramPsoF3N2TK3/ELb1anMwtW8RuJL5hS/NQZhnLngTeHz3
         2iT1FbkxAtPgHCUFi2AhwnfK17Lzx2YHU1OZFQusfpFi7FhlaTOheHK0k566UiTh04f6
         zHd20CPdgj8ET9JGHP5T1qzO7jXnVTMSUr+bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708066; x=1792312866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T4nkVpkBHgoVdUxB5q3FW04+XSFv/2p8/7PTO58TEpM=;
        b=pVwew0UqNjhvkmspRMlYwT1FgML6u72MjbRctFHnz2j6AtxJh965+Y0lfautRyYRT8
         rf61qbzqonMtJa9hoAmjC43z+BNxEuEiuhl+xlk711sw5WrVA6CdHzqBUb9BEWtGVUg6
         6fAvp4J2ANt12616xU6nB0BVB0ngsVTbuik8k6H8xCY6G4kBLqQHnCn2EkRAVZGESj1/
         EKQjl8U/f9s2MUtmJ19OkqBMDf9ev41gDQE60huGwHiESZT/iBlWwM0wgj7Djjjo7IGc
         z3xir/i8jtkF87JaIMClMpHPIlE7tTZHhbVARCUhE2YeY0MM7XEK8f/KMjcUCvvtabmJ
         Ocdw==
X-Gm-Message-State: AFq9FYJy6PgFKPGIOPw5gVmpO+9dI3jwRtrVd0nvzIXbyj5sZ3UE/qQX
	SdkQx+mhu2VZcBZ1r8dogQc+O3BYVEYu6BJ87OLbmnNQN+VExss0HBgO1tn76lCARlHH+guIx63
	c+Hft3cQ=
X-Gm-Gg: AYBFou0FpTQp1CG1ZOFTETBrWZodNubuaBCHC5LxxOkJAL+due9MG9tNFicYyQoMdwJ
	Mia/0oZkBUVBBa8SkMArNWQ+yofH2g+JxfFS9/rSGpofcYdvcI0ntbeWFLhM9l9qPCIbhi/rVLC
	Y8rGaT8OxYqQbh+Atjk9XeZE4vvtvOo3s1zmCKHspA81IXB6Hg3R9a3sOToSADBewdi3ialfsu0
	GLvZjuzs+FWjMHxWZGegRmQhM/Vr5/ZsRGDLd4kPJW6/t3ovqSly/3JVz6zjGB4lFEjtGxPTs0p
	oLLT6MgqqCp0xgk/EcN7TEOQPWsDl47Pd/SNdFScsrvLErvm50uuLnpGj2f5dQ3Y86Yxd5uq4NH
	ZlvM6z/BTG+9alB0fI5TkrPvjHYglskXyGNWmgFCp2CISjnAGmAsvX22q04hQqbrCV43u2tT30V
	aiboJrEsky6QLMEMgfeutEdGR9T7BbjFcwEdHoQXI+/PoalIPROUz/XorK/Tj593HugedRVOqID
	jv0OXFOPIJD1mf5/LKE+P+M1jTNKR1QaLpJ/ty7NP49Xp7XaFQbEruYPzcYGLr1wY25173Lww==
X-Received: by 2002:a5d:4a8d:0:b0:48b:a21:87f7 with SMTP id ffacd0b85a97d-48dbaae3792mr9021783f8f.44.1791708066067;
        Sun, 11 Oct 2026 01:41:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/60] bind: upgrade 9.20.26 -> 9.20.27
Date: Sun, 11 Oct 2026 10:39:44 +0200
Message-ID: <6d4261cbea4c9dc965f2907bbd30b493e9c834ce.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247520

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

ChangeLog: https://bind9.readthedocs.io/en/stable/changelog.html#bind-9-20-27

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6de1243270216428d7eefdbc0ea5657e0aeb3a48)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch     | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.26.bb => bind_9.20.27.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.26.bb => bind_9.20.27.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 7ed4c5fd2f9..30da1e9fd3e 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From a67ac281cd86d8d9ca27e64a5944deb5578e5087 Mon Sep 17 00:00:00 2001
+From 7682cbc2fa624fbeeb088736e154090d92c8b524 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index da4cdef696e..f1d8a8e5691 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From 16608520c9d946223404165732eacd79b59de471 Mon Sep 17 00:00:00 2001
+From a633e336c248ceab41d3182848b65c95e90ef88c Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 07acce9cba0..da4057064e1 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From d925183807ae182cf332124ff5a617d257e184f9 Mon Sep 17 00:00:00 2001
+From 4b870f60338fe45e036b8a76d47f053338920048 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index af020f0..f461229 100644
+index 56bca5b..4fd62ed 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 4e90e972715..9adc101247e 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From af229781e60d6779c76d5a61d26a4597b2a42f6c Mon Sep 17 00:00:00 2001
+From f3736e5535236cf978fd368b6905098ff6e4fd84 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f47ce7b..af020f0 100644
+index c06a0d7..56bca5b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 3425742d1ba..803456c0b33 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From bde3a4cb010f459a9ef92817c7e6e6e2d871794a Mon Sep 17 00:00:00 2001
+From 450187e8feac041de02afd4c0c9039cc41e04cb9 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index 9b55afb5d3b..a2c1fbb8f70 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 8876e722beda701a0de021360ff381347120c6ff Mon Sep 17 00:00:00 2001
+From 582334d31432969be7e10906de7540f1dc64b17e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 33d5d34f158..dc1f8f5a9a6 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From 26c988eee9d2eae7c7dec8c529176352017b2ce1 Mon Sep 17 00:00:00 2001
+From 50601a7ee8fd19ddbe9a592c57ae6197782d4c2f Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.26.bb b/meta/recipes-connectivity/bind/bind_9.20.27.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.26.bb
rename to meta/recipes-connectivity/bind/bind_9.20.27.bb
index fe2ae3f002f..6d2b88e0123 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.26.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.27.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "55248def0f870c4c46b3de72978ea972615131516663188a4564dca1d20bf350"
+SRC_URI[sha256sum] = "145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

