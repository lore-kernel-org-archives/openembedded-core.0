Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCBDC433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 20:37:17 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.17051.1637699836527554300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 12:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8997540C24
	for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 20:37:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yqa8eadxBTF8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Nov 2021 20:37:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7AFE740B13
	for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 20:37:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BF06C1746D2;
	Tue, 23 Nov 2021 15:37:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] wayland-protocols: upgrade 1.23 -> 1.24
Date: Tue, 23 Nov 2021 15:36:59 -0500
Message-Id: <1637699819-44313-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 20:37:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158619

wayland-protocols 1.24 is now available.

This release adds feedback to the DMA buffer protocol, allowing smarter and
more dynamic DMA buffer allocation semantics. Other changes include
documentation improvements and improved testing infrastructure.

This is also the first release of wayland-protocols that do not include a
autotools build description.

https://lists.freedesktop.org/archives/wayland-devel/2021-November/042039.html

Disable build-time tests as they want to cross-compile in an allarch package:

| # Check buildability
| add_languages('c', 'cpp', native: false)

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../{wayland-protocols_1.23.bb => wayland-protocols_1.24.bb}        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.23.bb => wayland-protocols_1.24.bb} (84%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.23.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.24.bb
similarity index 84%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.23.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.24.bb
index 60b6eb1..2a1f1e3 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.23.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.24.bb
@@ -11,11 +11,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "6c0af1915f96f615927a6270d025bd973ff1c58e521e4ca1fc9abfc914633f76"
+SRC_URI[sha256sum] = "bff0d8cffeeceb35159d6f4aa6bab18c807b80642c9d50f66cba52ecf7338bc2"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-inherit allarch autotools pkgconfig
+inherit allarch meson pkgconfig
+
+EXTRA_OEMESON += "-Dtests=false"
 
 PACKAGES = "${PN}"
 FILES:${PN} += "${datadir}/pkgconfig/wayland-protocols.pc"
-- 
2.7.4


