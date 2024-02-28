Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F090BC5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 01:33:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.3363.1709084009100942644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 17:33:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Q+VOVD/P;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41S1XSaw011695
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 19:33:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709084008;
	bh=BwBqdLn2ZmGJCbs+gqFXdWSQmPLVraf95sieajghK2A=;
	h=From:To:Subject:Date;
	b=Q+VOVD/PO63YgW0+2xrswrbXNja4NE1eIvOgmB9wFnY/hxSDBhCMLfNwxRgR/KGG7
	 i52F6Yg/MIf0wL+oLg2m9DieId7ei/xPMF9C7XYuJbxUs9Rkx3+QwX34Q6aRqX5oOa
	 NUZ/zF7mRgOyqSPVcYIKr0rYpZHlQ5MbbbeYDJUk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41S1XS2k122673
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 19:33:28 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Feb 2024 19:33:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Feb 2024 19:33:28 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41S1XR0M033364
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 19:33:27 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rf8p5-0001h9-L7
	for openembedded-core@lists.openembedded.org; Tue, 27 Feb 2024 19:33:27 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] perf: Fix QA error due to most recent kernel
Date: Tue, 27 Feb 2024 19:33:27 -0600
Message-ID: <20240228013327.6432-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 01:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196317

A change in the latest kernel (next), triggers a QA error due to a
missing RDEPENDS on perl for perf-tests.

ERROR: QA Issue: /usr/libexec/perf-core/tests/shell/common/check_no_patterns_found.pl contained in package perf-tests requires /usr/bin/perl, but no providers found in RDEPENDS:perf-tests? [file-rdeps]

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 4f26813de0..ae7e24aa0c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -382,7 +382,7 @@ RDEPENDS:${PN} += "elfutils bash"
 RDEPENDS:${PN}-archive =+ "bash"
 RDEPENDS:${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
 RDEPENDS:${PN}-perl =+ "bash perl perl-modules"
-RDEPENDS:${PN}-tests =+ "python3 bash"
+RDEPENDS:${PN}-tests =+ "python3 bash perl"
 
 RSUGGESTS:${PN} += "${PN}-archive ${PN}-tests \
                     ${@bb.utils.contains('PACKAGECONFIG', 'perl', '${PN}-perl', '', d)} \
-- 
2.17.1


