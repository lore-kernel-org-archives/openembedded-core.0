Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA761C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 09:16:52 +0000 (UTC)
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
 by mx.groups.io with SMTP id smtpd.web10.15803.1724231803402649197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 02:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Wpggq56LCzq4F;
	Wed, 21 Aug 2024 11:16:39 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Wpggq1J0fz7Ln;
	Wed, 21 Aug 2024 11:16:39 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 21 Aug 2024 11:15:56 +0200
Subject: [PATCH] weston-init: fix weston not starting when xwayland is
 enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240821-weston-init-xwayland-v1-1-77cd13a14883@cherry.de>
X-B4-Tracking: v=1; b=H4sIAEuwxWYC/x3MQQ5AMBBA0avIrE2i1QiuIhalg0lkSCtKxN01l
 m/x/wOBPFOANnvA08mBN0lQeQbjYmUmZJcMutCmqLXCSOHYBFn4wCvae7Xi0LjBVlQ1ptQKUrp
 7mvj6t13/vh+cxFJuZgAAAA==
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.0
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 09:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203580

From: Quentin Schulz <quentin.schulz@cherry.de>

When xwayland PACKAGECONFIG option is set, xwayland is enabled in
weston.ini. However, if the xwayland module isn't installed, weston will
refuse to start with the following error message:
Failed to load module: /usr/lib/libweston-13/xwayland.so: cannot open shared object file: No such file or directory

Therefore, whenever the xwayland PACKAGECONFIG is set, weston-init
should depend on weston-xwayland to bring this module in.

Fixes: fdbe559c66c9 ("weston.init: enabled xwayland")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
This should also be backported to scarthgap (kirkstone is not impacted
as the commit which introduced the bug isn't part of kirkstone).
---
 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 83f0cea49c..3de697ec34 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -84,7 +84,7 @@ USERADD_PACKAGES = "${PN}"
 #
 require ${THISDIR}/required-distro-features.inc
 
-RDEPENDS:${PN} = "weston kbd"
+RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
 
 INITSCRIPT_NAME = "weston"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."

---
base-commit: 30ee6edc57ff7629a72606d1005f92d43a5d14f9
change-id: 20240821-weston-init-xwayland-4dba6e694321

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


