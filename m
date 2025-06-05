Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF383C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 09:18:48 +0000 (UTC)
Received: from h4.cmg1.smtp.forpsi.com (h4.cmg1.smtp.forpsi.com [185.129.138.163])
 by mx.groups.io with SMTP id smtpd.web10.3070.1749115127626375447
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 02:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=Wdj5L/+u;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.163, mailfrom: andrej.v@skyrain.eu)
Received: from lt-aval.kyiv.ciklum.net ([85.248.43.180])
	by cmgsmtp with ESMTPSA
	id N6k6uYqPPwQNXN6kHuueI1; Thu, 05 Jun 2025 11:18:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1749115125; bh=Flo+2g7GXVJhEnm3h++xgl2SW9vFtPLo+lP7NyR6ctA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Wdj5L/+uGeP/mhwqngHF/WdKjoQnuqDypBYKiRke2a3cjTlmXNrpU0Qnqfa3Ns/mT
	 Oioehh6xUqAJXVv0BJUlUnhVeriGPDWI1O7tg6y5kfJDu173Eyyozdg5xrCWpJGMnK
	 JrQKUu06oLp7GIQhdWEpc7WRrSudRezA5shGhv9BPx0irj9WZVHPywhHfoSSFvlREt
	 Ubw9UFjISjGF+aEx+mR0EyEwGclhHGefh009ElJz8yjAeiue7EeTYxhFFdXJUFcY+O
	 4SNPXC+Nl9QERgRrgCRL/tW2i7uvBYy2TIbEiLC+zSiZN37JhH/Sf5V2CZSxfiQcsz
	 DGnQUbGmzgjNw==
From: Andrej Valek <andrej.v@skyrain.eu>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.v@skyrain.eu>
Subject: [oe][meta][PATCH] dropbear: add xauth runtime dependency when x11-forwarding is enabled
Date: Thu,  5 Jun 2025 11:18:28 +0200
Message-Id: <20250605091828.50442-1-andrej.v@skyrain.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKOx9QbB400yMha+D7yKcuV+qur6/Ww7kyWjMRfNzK/kvk2oqW4rJfneERR8QeYdkF9LWxIzHpd99fbGFyDFLH75gdCPnJaEjea/8WEMmoRdFP46Rrjy
 5SBU/1xjebyYWHvhDfYydrAGh+LCOzME32/ppL7/iSth2cNohTCA6DjHb0BqJ8MT1tqtuTZSNGbHchBjsVog+4u9ZoVkY7Ti1f/LQZPETyKcL0SmNmGcECPv
 wz8MutzqdXhjmAchDXKS6RGf+OjAN5dKvkYtsSPybLA=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 09:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217996

Even if enable-x11-forwarding was used, XAUTH_COMMAND failed due to missing
xauth.

Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
---
 meta/recipes-core/dropbear/dropbear_2025.88.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear_2025.88.bb b/meta/recipes-core/dropbear/dropbear_2025.88.bb
index f203763b17..a1317d3b73 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.88.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.88.bb
@@ -51,7 +51,7 @@ EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[system-libtom] = "--disable-bundled-libtom,--enable-bundled-libtom,libtommath libtomcrypt"
-PACKAGECONFIG[enable-x11-forwarding] = ""
+PACKAGECONFIG[enable-x11-forwarding] = ",,,xauth"
 
 # This option appends to CFLAGS and LDFLAGS from OE
 # This is causing [textrel] QA warning
-- 
2.34.1


