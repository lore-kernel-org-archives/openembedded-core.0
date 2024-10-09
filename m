Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0441CEE352
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 21:36:14 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.29183.1728509771783661197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 14:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mGJa7v2S;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 499La9j0024161;
	Wed, 9 Oct 2024 16:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728509769;
	bh=TjuqYHKd+mpwfMdJU1FzxFTYNt2wZJpPNI5OzS94cQU=;
	h=From:To:CC:Subject:Date;
	b=mGJa7v2SOgPzyteuKwsq5THqlHiYWqsuMg6QLYJFxRXLd+OLGIX0znza/nK+M8QC9
	 n6r64RmalTZdAyYBK3tGl2SNHAqcXqWRg2WCZKzgSHIEN+CRPBLBcOScqI/nhnTUAb
	 qANqP/YwZ7eOI2SfB+Fc7INenXwdp/CBMztbAN9k=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 499La9Gj015303;
	Wed, 9 Oct 2024 16:36:09 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Oct 2024 16:36:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Oct 2024 16:36:09 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 499La9Ic029758;
	Wed, 9 Oct 2024 16:36:09 -0500
From: <rs@ti.com>
To: <crg7475@mailbox.org>, <richard.purdie@linuxfoundation.org>,
        <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>, <reatmon@ti.com>
Subject: [oe-core][kirkstone][PATCH] kmscube: create_framebuffer: backport modifier fix
Date: Wed, 9 Oct 2024 16:35:53 -0500
Message-ID: <20241009213553.926488-1-rs@ti.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 21:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205368

From: Randolph Sapp <rs@ti.com>

Backport the upstream buffer modifier fix for create_framebuffer to
handle the case where no valid modifiers are available.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...common.c-do-not-use-invalid-modifier.patch | 29 +++++++++++++++++++
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch b/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch
new file mode 100644
index 0000000000..3126f922ae
--- /dev/null
+++ b/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch
@@ -0,0 +1,29 @@
+From 23e3ab9b32258bfffd302769fdd290008da8277e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 8 Aug 2022 20:22:39 +0200
+Subject: [PATCH] drm-common.c: do not use invalid modifier
+
+Prior to kernel 5.19 this was a soft failure, but 5.19
+adds checks that result in a hard syscall fail.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/kmscube/-/commit/23e3ab9b32258bfffd302769fdd290008da8277e]
+---
+ drm-common.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drm-common.c b/drm-common.c
+index eb5ac20..e736922 100644
+--- a/drm-common.c
++++ b/drm-common.c
+@@ -92,7 +92,7 @@ struct drm_fb * drm_fb_get_from_bo(struct gbm_bo *bo)
+ 			modifiers[i] = modifiers[0];
+ 		}
+ 
+-		if (modifiers[0]) {
++		if (modifiers[0] && modifiers[0] != DRM_FORMAT_MOD_INVALID) {
+ 			flags = DRM_MODE_FB_MODIFIERS;
+ 			printf("Using modifier %" PRIx64 "\n", modifiers[0]);
+ 		}
+-- 
+2.46.0
+
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 40c5a14492..4051058128 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -14,6 +14,7 @@ SRCREV = "9f63f359fab1b5d8e862508e4e51c9dfe339ccb0"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            file://0001-texturator-Use-correct-GL-extension-header.patch \
            file://0001-common-fix-cast-type-in-init_egl.patch \
+           file://0001-drm-common.c-do-not-use-invalid-modifier.patch \
 "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.46.0


