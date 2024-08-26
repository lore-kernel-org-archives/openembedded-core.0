Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD476C5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 15:14:22 +0000 (UTC)
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
 by mx.groups.io with SMTP id smtpd.web10.55370.1724685252553229526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 08:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.168, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WsvN21BDcz6q2;
	Mon, 26 Aug 2024 17:14:10 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4WsvN14MQCzvxN;
	Mon, 26 Aug 2024 17:14:09 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 26 Aug 2024 17:13:32 +0200
Subject: [PATCH scarthgap] weston-init: fix weston not starting when
 xwayland is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-weston-init-xwayland-scarthgap-v1-1-5659014592b6@cherry.de>
X-B4-Tracking: v=1; b=H4sIAJubzGYC/x3NQQqDQAxG4atI1g3YaSnaq5QuwsyvBkqUyVAV8
 e4duvw27x3kyAqnZ3NQxlddZ6u4XhqKk9gI1lRNoQ33tgsPXuFlNlbTwtsq+0cssUfJZRpl4b4
 PN0AwdDFRjSwZg27/wet9nj9Y3Q5vcAAAAA==
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.14.0
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 15:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203756

From: Quentin Schulz <quentin.schulz@cherry.de>

When xwayland PACKAGECONFIG option is set, xwayland is enabled in
weston.ini. However, if the xwayland module isn't installed, weston will
refuse to start with the following error message:
Failed to load module: /usr/lib/libweston-13/xwayland.so: cannot open shared object file: No such file or directory

Therefore, whenever the xwayland PACKAGECONFIG is set, weston-init
should depend on weston-xwayland to bring this module in.

(cherry picked from commit fa2314125318634108452af4e40c9eeee260767c)

Fixes: fdbe559c66c9 ("weston.init: enabled xwayland")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 024e400665..34b7eb78d2 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -83,7 +83,7 @@ USERADD_PACKAGES = "${PN}"
 #
 require ${THISDIR}/required-distro-features.inc
 
-RDEPENDS:${PN} = "weston kbd"
+RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
 
 INITSCRIPT_NAME = "weston"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."

---
base-commit: 0795169be206f1d4d140fe378e2476a44d0ce02b
change-id: 20240826-weston-init-xwayland-scarthgap-9923eeaef8cd

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


