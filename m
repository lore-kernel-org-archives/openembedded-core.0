Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3405.1628040858338271881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 18:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BA95440C32
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Aug 2021 01:34:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVHFMkMJmpoL
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Aug 2021 01:34:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AB9AF40BEC
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Aug 2021 01:34:17 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6A9AF17464D;
	Tue,  3 Aug 2021 21:34:17 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] libwpe: remove rpi-specific custom code
Date: Tue,  3 Aug 2021 21:34:16 -0400
Message-Id: <1628040856-46307-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

This recipe was ported from another layer, which had special handling for rpi.

OE-Core doesn't have 'rpi' override, doesn't define 'vc4graphics' DISTRO_FEATURES
and overall, BSP-specifics should be handled in downstream layers, not in OE-Core.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-sato/webkit/libwpe_1.10.1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-sato/webkit/libwpe_1.10.1.bb b/meta/recipes-sato/webkit/libwpe_1.10.1.bb
index 22fff93..6f2fe1d 100644
--- a/meta/recipes-sato/webkit/libwpe_1.10.1.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.10.1.bb
@@ -6,9 +6,6 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=371a616eb4903c6cb79e9893a5f615cc"
 DEPENDS = "virtual/egl libxkbcommon"
 
-# Workaround build issue with RPi userland EGL libraries.
-CFLAGS:append_rpi = " ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', '-D_GNU_SOURCE', d)}"
-
 inherit cmake features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.7.4

