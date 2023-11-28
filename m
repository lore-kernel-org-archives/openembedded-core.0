Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E29DC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 13:20:06 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.32466.1701177604342342571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 05:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=X2FrzYtB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-456497-20231128132000c2688bac83c81e0101-_xbrio@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20231128132000c2688bac83c81e0101
        for <openembedded-core@lists.openembedded.org>;
        Tue, 28 Nov 2023 14:20:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3S/iEJemZMTjcPwjucZXoEUgE2bIDUgLeLm/RvAYB+c=;
 b=X2FrzYtB0kKXONKnz1f25CcOa2/LDswp0fCeXEEbBVmhXJLO2w8H0YpJg2cYPlH/ezUWm/
 3Qh9CGqGOIK9eBghU3LlArOH4BkGKWPhJ7Ja5pMqcD/aMofR6zp9WlBDwXHUfBNxcITEzWAU
 WKGKgghq/GlAmH3EFjI6+I+G/Cglo=;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] linux-firmware: use install-nodedup make target
Date: Tue, 28 Nov 2023 14:19:49 +0100
Message-ID: <20231128131954.337015-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 13:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191367

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Versions starting from 20230919 require rdfind; at some point new make
target was introduced with commit 4124f8f928d5 ("Make rdfind optional").
The commit is not yet included even in 20231111, thus make even the
new make target optional.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
This patch will not help with 20231030 update, neither 20231111 will work
without rdfind. install-nodedup is not yet released as of now.

 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index c0394b9b3b9..b2b700b926e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -248,6 +248,9 @@ do_compile() {
 }
 
 do_install() {
+        # Versions 20231030 and 20231111 require rdfind, newer tags will have new "install-nodedup"
+        # make target
+        oe_runmake_call 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install-nodedup || \
         oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install
         cp GPL-2 LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
 }
-- 
2.43.0


