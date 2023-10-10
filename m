Return-Path: <paul.barker.ct@bp.renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92515CD690B
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 08:26:36 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlie5.idc.renesas.com [210.160.252.171])
 by mx.groups.io with SMTP id smtpd.web10.86399.1696926387006279493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 01:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: bp.renesas.com, ip: 210.160.252.171, mailfrom: paul.barker.ct@bp.renesas.com)
X-IronPort-AV: E=Sophos;i="6.03,212,1694703600"; 
   d="scan'208";a="178747309"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 10 Oct 2023 17:26:26 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.92.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 38CEF400D4EF;
	Tue, 10 Oct 2023 17:26:24 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: openembedded-core@lists.openembedded.org,
	Steve Sakoman <steve@sakoman.com>
Subject: [dunfell][PATCH RESEND] kernel.bbclass: Add force flag to rm calls
Date: Tue, 10 Oct 2023 09:26:23 +0100
Message-Id: <20231010082623.183168-1-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 08:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188872

From: Ryan Eatmon <reatmon@ti.com>

The latest 6.5 kernels do not appear to create the source file in
${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source so the
recipe errors out when trying to remove it.  Simple fix is to add the
-f (force) flag to the call.

(From OE-Core rev: 2e669bf797b15d803e7d6a700e449bdc467a4bcc)

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>

Backported from kirkstone commit 7e177848f97e.
Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
Re-sending this for the mailing list. My first send was dropped as I
wasn't subscribed to the list from this email address.

Yes, I do crazy things like building mainline kernels on dunfell.
This fix is unlikely to have any negative effects though, so I think
it's good to apply to dunfell.

 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ba5b6cf384a0..ca7530095e12 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -405,8 +405,8 @@ kernel_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
 		# If the kernel/ directory is empty remove it to prevent QA issues
 		rmdir --ignore-fail-on-non-empty "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel"
 	else
-- 
2.39.2


