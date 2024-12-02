Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C943E69EA0
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 23:40:39 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.7364.1733182833049831214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 15:40:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=SFtR1upe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202412022340308ab0a10dd33f13ce2d-re17m8@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202412022340308ab0a10dd33f13ce2d
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Dec 2024 00:40:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MHCz1/FNQBti5AagsX094znrtXDwW0l762pCg8Whtb0=;
 b=SFtR1upe8pddPfwztjtFf2kYVD5Xkl+MUQ8+rgSuJyX88FeoCO6OHR5W0K4jNFjAZAZxR1
 94dxPqgLNscnAAPq+9TCMfwglYf3rPvToCm0cpa4apKmoJa4cndArmTXU1QPgySyUaYAvKb9
 wY4tWZuKbjpCOt5EhkH9EwP4zTXwv/AyaaWVKUHZadnakf3V5EFufixULa9w6kCza9u4EMP5
 CQYZyB0V4ni5LtC4Xe2lfMHBotlEEzToIXKNYMCQUK3HiTdt6dRRhGox0qq2sL55nj4/ncHZ
 EKwQy16q2e37TzUbAMZ2hituWTOvoNo23XyTMbHpO64RneuQ7dQUK7cg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] qemu: set CVE-2024-6505 to fixed
Date: Tue,  3 Dec 2024 00:39:41 +0100
Message-Id: <20241202233941.2808729-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 23:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208165

From: Peter Marko <peter.marko@siemens.com>

NVD DB has this CVE as version-less (with "-").

Patch [3] is linked from [1] via [2].
[1] https://nvd.nist.gov/vuln/detail/CVE-2024-6505
[2] https://bugzilla.redhat.com/show_bug.cgi?id=2295760
[3] https://gitlab.com/qemu-project/qemu/-/commit/f1595ceb

$ git describe f1595ceb
v9.1.0-rc0-38-gf1595ceb9a
$ git tag --contains f1595ceb | grep -v -- -rc.$
v9.1.0
v9.1.1
v9.1.2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 77b879fea9..d4693fe8b0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -49,6 +49,9 @@ CVE_STATUS[CVE-2018-18438] = "disputed: The issues identified by this CVE were d
 # As per https://bugzilla.redhat.com/show_bug.cgi?id=2203387
 CVE_STATUS[CVE-2023-2680] = "not-applicable-platform: RHEL specific issue."
 
+# NVD DB has this CVE as version-less (with "-")
+CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.30.2


