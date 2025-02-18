Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4858C021B5
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.14624.1739864483510125833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d63B+I+t;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864485; x=1771400485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eR1IK9ZiHvJ4jtatgxrzqm5dkoM0gEzYyRXwuFR3zl8=;
  b=d63B+I+tXnG1CPTnWjK1n2cEH7rJaWFeUs9PRwla1b/xvLfJe8aIOqdU
   t9T3lKf/H6tp4iezdO7bTN7Qnryw2SIl8PwRV6hQ0DiFmVno9cl8zXXiv
   maAfMCCRYnOuWGa8IIfoy9FAW/f3yRJy+wRHaKpX1H6HGu7gjtgt2dYze
   0R6Fx9HdqhyTkWKkOnxzy2BYrXn3UrOcGZIb8IptRKQgHeqMMZiJrtGGa
   Uqlw7YROWhgHHvyquq8/Jqy9L3HCv8zYMNXRi5yQcgQONlNNDE5ePqM7U
   8sSQuUQWsvxMqkZTBe3j0e6H4WFXY7m80dAJsBJT98zHF2tcB0zXdFDwu
   A==;
X-CSE-ConnectionGUID: CNa+iCsTSKKN3jrva4LgjA==
X-CSE-MsgGUID: Xbcwy9mBQyu+EkB6zeE6xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190317068"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190317068"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:23 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C66A96749
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D8F7CF7D9
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C40AE1A000B;
	Tue, 18 Feb 2025 15:41:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/32] gcr: upgrade 4.3.0 -> 4.3.91
Date: Tue, 18 Feb 2025 15:39:08 +0800
Message-Id: <1739864375-21394-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211567

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Several updates to the CI
- gcr: Implement Certificate Policies extension
- gcr: Implement Authority Information Access (AIA) extension
- gcr: Implement Authority Key Identifier extension
- gcr: Implement CRL Distribution Points extension
- gcr: Add GcrGeneralNames helper object
- gck: Add missing finish-func annotation to gck_slot_open_session_full_async
- Migrate away from g_assert() in some unit tests
- Updated translations
- ci: Another tarball publish fix
- meson: fix library version
- ci: Tarball publish fix
- gcr: Add new GcrCertificateExtension API
- gcr: Vala override for CertificateField.get_value
- Fix meson test failures in FIPS mode
- doap: Remove invalid maintainer entry
- tests: Replace echo -n by printf
- build: Avoid redundant libegg linking into gck tests
- build: Fix some GLib/GTK deprecation warnings
- ssh-agent: Request rsa-sha2-256 signature in tests
- Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gcr/{gcr_4.3.0.bb => gcr_4.3.91.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_4.3.0.bb => gcr_4.3.91.bb} (95%)

diff --git a/meta/recipes-gnome/gcr/gcr_4.3.0.bb b/meta/recipes-gnome/gcr/gcr_4.3.91.bb
similarity index 95%
rename from meta/recipes-gnome/gcr/gcr_4.3.0.bb
rename to meta/recipes-gnome/gcr/gcr_4.3.91.bb
index dcd8658d9c..a76e8d486a 100644
--- a/meta/recipes-gnome/gcr/gcr_4.3.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.3.91.bb
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache gi-docgen features_check vala gobject-introspec
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
-SRC_URI[archive.sha256sum] = "c3ee8728e4364b0397f435fa20f92f901ab139d2b264f4e059d67b3c0f43cd36"
+SRC_URI[archive.sha256sum] = "9d326ed3d78ad0eafb0848395a068adbefdeb6cff04ec5615cb3ef767d933990"
 
 PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-- 
2.43.0


