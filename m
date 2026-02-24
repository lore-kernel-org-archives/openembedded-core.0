Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B26EE9B27F
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:23 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21488.1771943602085494238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fuiami+y;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48375f10628so36364995e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943600; x=1772548400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zILtqDEitUOXxwvTCLGuPp/y4njQ3UjRfcMnnjzpOUY=;
        b=fuiami+ypUcocG/koOqNExCFskkWqcPskKeCaqSgGc8sXsq2ssIG3WlbWM444C10pW
         il4C5M72SDqoMXN87v+aSFVreYKrDeUpV5fahX+25lNH6/rEhNO9eMsJpqXlvjORO3Cg
         BLClD/jWWfWJLcUYo4kO5nHjZ8kF1HwRAR9TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943600; x=1772548400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zILtqDEitUOXxwvTCLGuPp/y4njQ3UjRfcMnnjzpOUY=;
        b=G4rZf0NTEs37JiEBUCbDKmywxF4GTPS/CECjSXz8eYCe7a2choXiC+7JvCZF/9HzfU
         /XPNSsCARqG+EC9naa53UaSYDXq+TAsAT3UAaBOROJbgtfniqJYed9AO9W13LHONs1ua
         b90wWoMqdPk4JUugki+XIR/yeCNA7SaATupMsY/CWzxtyYBLszM8Wm6+X4P8ZH2t2SN1
         AEkgO/7DsngJAaKINEotOwwMWA8bhInZi3cmdYEf1mRP1tjeZm47hqMBl6G9j7rJh/I8
         kDMBPKqb5C3S7n73cEoiibli0ALutfRvX9E9ovDzQGq/TTnr4uQGCY99RcdiaPvK8T9k
         40bQ==
X-Gm-Message-State: AOJu0Yzl14nj3y/tPsztWXg4F8VGI27vXCuVXN0rpO4PX1cl0UjB9yMQ
	PLCNPMXlxBjIHbl5VkQ+d2bsQB5qRxihCP4vT5EpuAp6T6cORtcPDBbBONl4zucX/hQu6xkNccg
	XYsbM
X-Gm-Gg: AZuq6aLSkY4VK7SHRMKh7xXr+SqvYlVYVji7y/tO0VVJsX8A+nhuhsMG/jFCVl5MKch
	vzg7W4qbcIkqiMET6339ljOVcX2CJaEH5ZWWgg80rLlasTnD6kEnZ7JV8Uod7AS/vcmWMeUjBRI
	WR9b5jNlymZ8D9Va0RL/3KmuntzY/22eyT1vYdcxu54Z5+LYZoUfIewqNIiJa9tRzVRhIPfxRfi
	TM4uBnElCq0W0ndwf9wTzIOcuZiW93kjpI/Ez28LXkmBsoD/0FRRj9Y2neCYdeR8rFyNdTekvJS
	8RmGcoIe0DDkTV58Ku5AAtJ6iJzSGKryfbOPNemwV5ehwN7GBgjKUp5gX37vyCkPohQvrYiIWvU
	kG6aMiBHfGjuXcszYIm0TIz0Jjv2K2aUGToVsZdOPiJ5bw0x8oAfUnUrrr+vVKhLYKU4FL8NK72
	MNucxlx9L4xxwZP1sEXKxTjGfmnAzSdTXnY+dWhbpncdwYwuYS5S+BTTkk8dMdyvFKm9VMZCwtD
	+TLFF0O8jHoq6kYi4ZHxoEYNufN54I+zg==
X-Received: by 2002:a05:600c:a00d:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-483a95e2535mr203078465e9.20.1771943600283;
        Tue, 24 Feb 2026 06:33:20 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:19 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 44/44] u-boot: move CVE patches out of the common .inc file
Date: Tue, 24 Feb 2026 15:32:12 +0100
Message-ID: <94a2960e1ae3923599affb6b227ef3f1870f5633.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231851

From: Yoann Congal <yoann.congal@smile.fr>

An external layer might use the u-boot*.inc files but have a different
base version for which the CVE patches don't apply.

Move the CVE patches in the leaf recipe.

See related patch in kirkstone:
[kirkstone][PATCH] u-boot: move CVE patch out of u-boot-common.inc
https://lists.openembedded.org/g/openembedded-core/topic/117385432

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 12 +-----------
 meta/recipes-bsp/u-boot/u-boot_2024.01.bb | 10 ++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index da34e3d3e80..1f17bd7d0af 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,17 +14,7 @@ PE = "1"
 # repo during parse
 SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
-           file://CVE-2024-57254.patch \
-           file://CVE-2024-57255.patch \
-           file://CVE-2024-57256.patch \
-           file://CVE-2024-57257.patch \
-           file://CVE-2024-57258-1.patch \
-           file://CVE-2024-57258-2.patch \
-           file://CVE-2024-57258-3.patch \
-           file://CVE-2024-57259.patch \
-           file://CVE-2024-42040.patch \
-"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
index b15bcaa818f..e412f503f10 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
@@ -3,3 +3,13 @@ require u-boot.inc
 
 DEPENDS += "bc-native dtc-native python3-pyelftools-native"
 
+SRC_URI += "file://CVE-2024-57254.patch \
+            file://CVE-2024-57255.patch \
+            file://CVE-2024-57256.patch \
+            file://CVE-2024-57257.patch \
+            file://CVE-2024-57258-1.patch \
+            file://CVE-2024-57258-2.patch \
+            file://CVE-2024-57258-3.patch \
+            file://CVE-2024-57259.patch \
+            file://CVE-2024-42040.patch \
+"

