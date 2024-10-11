Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19FED0EE37
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 20:27:42 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.22073.1728678453348686370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 13:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sGLH09zZ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49BKRVSm109281;
	Fri, 11 Oct 2024 15:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728678452;
	bh=PELyOMTlULY4LURy9XkfkMUVG60cO/CojuIzGma7vgA=;
	h=From:To:CC:Subject:Date;
	b=sGLH09zZIHC2ah99mnMBk0PeVZTzFz28gcJD+6h7A47dNla5ET1gEuG2E36ctohFm
	 AkW6H7iPB5Trs7c46chwucV4YR2M1J3QT0Izj0B0dNH6GPyyMI7xnvvkjZuJ04th3Z
	 T1e5OZpv24+DsB7JCMxkssskgVAnIJw08RMcVuhA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49BKRVCG112374
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Oct 2024 15:27:31 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Oct 2024 15:27:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Oct 2024 15:27:31 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49BKRVSS079522;
	Fri, 11 Oct 2024 15:27:31 -0500
From: <rs@ti.com>
To: <crg7475@mailbox.org>, <richard.purdie@linuxfoundation.org>,
        <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>, <reatmon@ti.com>
Subject: [oe-core][kirkstone][PATCHv2] kmscube: create_framebuffer: backport modifier fix
Date: Fri, 11 Oct 2024 15:26:35 -0500
Message-ID: <20241011202634.1129654-2-rs@ti.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 20:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205700

From: Randolph Sapp <rs@ti.com>

Backport the upstream buffer modifier fix for create_framebuffer to
handle the case where no valid modifiers are available.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2: add signoff to backported patch to satisfy patchtest

 ...common.c-do-not-use-invalid-modifier.patch | 31 +++++++++++++++++++
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch b/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch
new file mode 100644
index 0000000000..dff2f20613
--- /dev/null
+++ b/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch
@@ -0,0 +1,31 @@
+From 23e3ab9b32258bfffd302769fdd290008da8277e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 8 Aug 2022 20:22:39 +0200
+Subject: [PATCH] drm-common.c: do not use invalid modifier
+
+Prior to kernel 5.19 this was a soft failure, but 5.19
+adds checks that result in a hard syscall fail.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/kmscube/-/commit/23e3ab9b32258bfffd302769fdd290008da8277e]
+Signed-off-by: Randolph Sapp <rs@ti.com>
+
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


