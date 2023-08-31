Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE1BC83F01
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 13:38:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.17322.1693489085303560771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 06:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TNS2Mf1g;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37VDc4EI035750
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 08:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693489084;
	bh=rvV4fW0ZSGo95bWEEpDX5kYTg+7AtZ8+VokmcqapMHU=;
	h=From:To:Subject:Date;
	b=TNS2Mf1gQeN3TcEZbt7VFsFTEa5oXxYx7MfB+QIVv+tZuxXHYyajA0SO1XCJmcQPs
	 2WV1tPk5XkkUhuf6HdmD2gBPwm5rSaDfAS3U5nCBf0C4RRI2ms8xKYjpR5zdip63J/
	 vuuknEWHOMhDzR4WMOmW/4fpImd/n4Vh73DWggyA=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37VDc4sH077849
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 08:38:04 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 31
 Aug 2023 08:38:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 31 Aug 2023 08:38:03 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37VDc3vb109710
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 08:38:03 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qbhs3-0007xX-NB
	for openembedded-core@lists.openembedded.org; Thu, 31 Aug 2023 08:38:03 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] kernel.bbclass: Add file exist checks around removes
Date: Thu, 31 Aug 2023 08:38:03 -0500
Message-ID: <20230831133803.30556-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 13:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186974

The latest 6.5 kernels do not appear to create the source file in
${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source so the
recipe errors out when trying to remove it.  Simple fix is to add an
exists check around the call.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/classes-recipe/kernel.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index acb43bd4d5..4df052061b 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -454,8 +454,12 @@ kernel_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
+		if [ -e "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build" ]; then
+			rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
+		fi
+		if [ -e "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source" ]; then
+			rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
+		fi
 		# Remove empty module directories to prevent QA issues
 		find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
 	else
-- 
2.17.1


