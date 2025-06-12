Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEE8C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 18:28:47 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.1681.1749752920463439702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 11:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sVwwvpya;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55CISdGq2942637
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 13:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749752919;
	bh=1MdUU1/i119en4y9hJiztE7MDiZOT7pWNeb6n10KJ7Y=;
	h=From:To:Subject:Date;
	b=sVwwvpyah2tcXx2QsBK9tYzgOXRn0Ug9oaJOVe7Q4fX3gUiIqhyPk4k/GGow/rUx1
	 iCwFF9YvYJMQUFChiSuom8DthMWt6erLRJjNk71FmHHEktCcG1FMULAGqsMrASsyxf
	 qG3yBYPWnKpTSt6rNJRmK+i65WzPONfSalwFugO4=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55CISd4l2152929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 13:28:39 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 13:28:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 13:28:38 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55CIScEP2562182
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 13:28:38 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uPmfG-0002fh-PU
	for openembedded-core@lists.openembedded.org; Thu, 12 Jun 2025 13:28:38 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] insane: Fix debug-deps check
Date: Thu, 12 Jun 2025 13:28:38 -0500
Message-ID: <20250612182838.10230-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 18:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218533

Fixes bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15901

The cheeck for debug-deps is looking for the mere existence of the
substring "-dbg" inside of the name of an RDEPENDS package, but it should be
an endswith check.  This helps with some eroneous errors in kernel
module names like:

ERROR: linux-xxx do_package_qa: QA Issue: kernel-modules rdepends on kernel-module-g-dbgp-6.12.22-ti [debug-deps]

and

ERROR: QA Issue: kernel-module-mtk-vcodec-dec-6.16.0-rc1-next-20250610-dirty rdepends on kernel-module-mtk-vcodec-dbgfs-6.16.0-rc1-next-20250610-dirty [debug-deps]

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index eb8591f624..c45650291f 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -832,7 +832,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                 return False
 
             for rdepend in rdepends:
-                if "-dbg" in rdepend and "debug-deps" not in skip:
+                if rdepend.endswith("-dbg") and "debug-deps" not in skip:
                     error_msg = "%s rdepends on %s" % (pkg,rdepend)
                     oe.qa.handle_error("debug-deps", error_msg, d)
                 if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev") and "dev-deps" not in skip:
-- 
2.17.1


