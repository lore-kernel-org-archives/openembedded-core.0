Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD037CA5FDD
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 11:39:05 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4175.1791027537317239377
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 04:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=P8jWG/HR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261003113854ce330e344b0002073d-coxvvb@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261003113854ce330e344b0002073d
        for <openembedded-core@lists.openembedded.org>;
        Sat, 03 Oct 2026 13:38:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=O0V4052v1TzW0KsMBLdLpOqzf+MQPiFYjmU2FGEekzM=;
 b=P8jWG/HRh8N5TWfoc8HM0Iz1NdJNtf+G6D8Df66cZCWSCNnnC1y1yBqYNht8HZLXfGU/sn
 IQ/xaCuuM70/ZnhI+1N7ilj3rwC5wvs5iPy4qahCYsQOmpF5nHpIf2cfyBTHn1bgi1isICjb
 FzllSaAA6+V6n/6U65jMfjhkPjIiy4ojgq5Lz/xz4JZXmn2AcbLt/nuqdmm1hX8d5ZdR2TwG
 cv7LhmS3foWwEI788YeYrIH19h2v83wJvrXq/OvkQTyJ39OIFnR8JCZfoC/7OWcN+dxv05R2
 joUWWCj48wM04hR4UrTz4fj5lceTqmwyqXpinHX+zGMLsEFfXnuu0HOA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] dhcpcd: set status for CVE-2026-56116
Date: Sat,  3 Oct 2026 13:38:37 +0200
Message-ID: <20261003113837.4008405-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 11:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247157

From: Peter Marko <peter.marko@siemens.com>

Patch [1] mentioned as commit fixing this CVE in NVD or Debian reports
is fixing code adding new feature (route advertisment processing) which
is also mentioned in the CVE descripiton.
That was introduced in commit [2] which is v10.0.7 (>10.0.6)

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/708b4a56bae080a5b18c2e0c4c6fbe103131a2b0
[2] https://github.com/NetworkConfiguration/dhcpcd/commit/f1cf924ad691bc1e6bf33013407fbf838fa40fbe

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index e6854e1c7f2..c32db0adf5d 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -62,3 +62,5 @@ do_install:append () {
 }
 
 FILES:${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"
+
+CVE_STATUS[CVE-2026-56116] = "fixed-version: vulnerability was only introduced in v10.0.7"

