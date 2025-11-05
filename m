Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7BDCCFA1A
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:11 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3010.1762386485047125070
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hT8ihWkx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386485; x=1793922485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JC3rtXEUjUBn9WH7xTMe1oly6PZn8SVCxwhy31zzN4o=;
  b=hT8ihWkx1oDl3cd7yxeVNwc8AaaLtkvyTUiafHlF576PZXG7S78YOB0b
   dr0GujBRosESL3tSNE3iYYR/D5zeiuTkSJPbrJtGqVatvEzJt7kcluRss
   viEsLgR7ajTME2yFCBWOLtova4k69xa9UGDWzqg6wI/I+QuVxBfUVSWxL
   4FyW4df5FLS/KTpOV65Hc8DZCLEl6WOhiUlTmvsYAmzyz/CP73RV2WIue
   MiGjZQiEL87sIFVGvEg/001wqsGT4n4DCTyx6hHQv7BOpdms7qRD/s6C2
   /zC4iBt+Y/KuMTMmoZs0/0jGFmVQDx6knag3d7ns+R5V2/aW7PDELCEkL
   g==;
X-CSE-ConnectionGUID: SeQLT1DYRCO7AI0N4lW7/A==
X-CSE-MsgGUID: 97+1Grn0R4un5PLu4kNjHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="205651660"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="205651660"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:48:03 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 9FEFF1561
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:48:03 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 555B3C00D64
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:48:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id C1EB514005BD;
	Wed,  5 Nov 2025 23:48:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/29] libcap: upgrade 2.76 -> 2.77
Date: Thu,  6 Nov 2025 07:47:08 +0800
Message-ID: <20251105234712.446-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225955

From: Wang Mingyu <wangmy@fujitsu.com>

0001-libcap-Add-build-ldflags-to-_makenames-rule.patch
removed since it's included in 2.77

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...Add-build-ldflags-to-_makenames-rule.patch | 29 -------------------
 .../libcap/{libcap_2.76.bb => libcap_2.77.bb} |  6 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-support/libcap/files/0001-libcap-Add-build-ldflags-to-_makenames-rule.patch
 rename meta/recipes-support/libcap/{libcap_2.76.bb => libcap_2.77.bb} (91%)

diff --git a/meta/recipes-support/libcap/files/0001-libcap-Add-build-ldflags-to-_makenames-rule.patch b/meta/recipes-support/libcap/files/0001-libcap-Add-build-ldflags-to-_makenames-rule.patch
deleted file mode 100644
index 10ddf64935..0000000000
--- a/meta/recipes-support/libcap/files/0001-libcap-Add-build-ldflags-to-_makenames-rule.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e52d3232882c263f5bd4b1980195ac633d706a53 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 21 Oct 2025 18:27:51 -0700
-Subject: [PATCH] libcap: Add build ldflags to _makenames rule
-
-its calling compiler and linker in single step
-ensure that build ldflags are respected as it
-might have important information like which runtime
-to use.
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=c3ddf45d9afaab85d3b7db0dc7bfd1aafb8fde50]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libcap/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcap/Makefile b/libcap/Makefile
-index e90a950..f0eb87e 100644
---- a/libcap/Makefile
-+++ b/libcap/Makefile
-@@ -80,7 +80,7 @@ $(PSXTITLE).pc: $(PSXTITLE).pc.in
- 		$< >$@
-
- _makenames: _makenames.c cap_names.list.h
--	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@
-+	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@ $(BUILD_LDFLAGS)
-
- cap_names.h: _makenames
- 	./_makenames > cap_names.h
diff --git a/meta/recipes-support/libcap/libcap_2.76.bb b/meta/recipes-support/libcap/libcap_2.77.bb
similarity index 91%
rename from meta/recipes-support/libcap/libcap_2.76.bb
rename to meta/recipes-support/libcap/libcap_2.77.bb
index 27093ff3e7..9968cd5f50 100644
--- a/meta/recipes-support/libcap/libcap_2.76.bb
+++ b/meta/recipes-support/libcap/libcap_2.77.bb
@@ -12,13 +12,11 @@ LIC_FILES_CHKSUM = "file://License;md5=2965a646645b72ecee859b43c592dcaa \
 
 DEPENDS = "hostperl-runtime-native gperf-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
-           file://0001-libcap-Add-build-ldflags-to-_makenames-rule.patch \
-		   "
+SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz"
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "629da4ab29900d0f7fcc36227073743119925fd711c99a1689bbf5c9b40c8e6f"
+SRC_URI[sha256sum] = "897bc18b44afc26c70e78cead3dbb31e154acc24bee085a5a09079a88dbf6f52"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.43.0


