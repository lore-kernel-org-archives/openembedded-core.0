Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA1ECF6491
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 15:44:45 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.15888.1727538282605408537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Sep 2024 08:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Ulm56p0N;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20240928154438b9d71416dd16039340-jrm5ex@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20240928154438b9d71416dd16039340
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Sep 2024 17:44:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Kt9lrfEnzLWoExQaijN4GZtxukgMrLlRxVU/6+fIPsk=;
 b=Ulm56p0NYZx1cOXFASeUcx7vbbbF1xRo+ad3o8jX5JD6KBSRheDFTaoRhDshVe2EaiUCEF
 TamfbkBoXlrW7bG+2m9tlkCnb1gZSBR4n23eYOe6oF+dWs5/LEsbZmVltuWCU5eb0WpFAziF
 uodJAave4RLjQZxkyLBrAxkh7VYmRvDcCYV+Up8Yln0rmNuAy3ajNyqKQb5e4puekJFhf2LB
 YcYHtB9EhyS5OskEmvUuca2sXENryOR19Mq9RI4noDA0c5ARIWD7r7rqZBMm4Ak7bTrEPck5
 pYOANOM/124RB59q2pfE9A4uXc8MASNYJpn35lG/qr664CHQVTG+Ms1w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] wpa-supplicant: Ignore CVE-2024-5290
Date: Sat, 28 Sep 2024 17:43:48 +0200
Message-Id: <20240928154348.3746891-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Sep 2024 15:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205044

From: Peter Marko <peter.marko@siemens.com>

NVD CVE report [1] links Ubuntu bug [2] which has a very good
description/discussion about this issue.
It applies only to distros patching wpa-supplicant to allow non-root
users (e.g. via netdev group) to load modules.
This is not the case of Yocto.

Quote:
So upstream isn't vulnerable as they only expose the dbus interface to
root. Downstreams like Ubuntu and Chromium added a patch that grants
access to the netdev group. The patch is the problem, not the upstream
code IMHO.

There is also a commit [3] associated with this CVE, however that only
provides build-time configuration to limit paths which can be accessed
but it acts only as a mitigation for distros which allow non-root users
to load crafted modules.

The patch is included in version 2.11, however NVD has this CVE
version-less, so explicit ignore is necessary.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-5290
[2] https://bugs.launchpad.net/ubuntu/+source/wpa/+bug/2067613
[3] https://w1.fi/cgit/hostap/commit/?id=c84388ee4c66bcd310db57489eac4a75fc600747

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 257ef43b6e..ac99d0db49 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -29,6 +29,8 @@ PACKAGECONFIG[openssl] = ",,openssl"
 
 CVE_PRODUCT = "wpa_supplicant"
 
+CVE_STATUS[CVE-2024-5290] = "not-applicable-platform: this only affects Ubuntu and other platforms patching wpa-supplicant"
+
 EXTRA_OEMAKE = "'LIBDIR=${libdir}' 'INCDIR=${includedir}' 'BINDIR=${sbindir}'"
 
 do_configure () {
-- 
2.30.2


