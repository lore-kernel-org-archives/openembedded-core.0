Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377EDCF6491
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 17:44:16 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.17882.1727545446699082845
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Sep 2024 10:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Kq22Wdif;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20240928174404c6d920b3740f9fc805-8rr4wv@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20240928174404c6d920b3740f9fc805
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Sep 2024 19:44:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=fdpGvjcLsTj8pY/FFsPCyVf0Ad52yz0X77OIxlInhf8=;
 b=Kq22WdiflQFttKm993paFZu1Adf/GHafIR9P9gG+bnCkYbo2Y7pNswU5PCoFfFith+Q1fr
 P/0spUUxDkLQNf1bVn6tbUAbl/lYjPu2qVqw6Wjy6o3JaaiIiOUIKSUwndsgVPs8nuDtjtIc
 5HiYXVJ7gliGt3SUrS8CiYdCxSWYKNhIhMuGmaalOD3Bu0Zj1A6zougW/MXdm8bF8JAahgbJ
 kUMkXybhGeayIxwRFnPV/Js1iqqv0+hkHMbxd6CORKyww0S/8OSfZD6ASfWiWOGD/VtI6OOH
 yxUP8s/ZnMYo0d2nlhyxdQyPCzulJ2xhj/bDf6DZwrBHTc9MXudgr7aw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 3/3] wpa-supplicant: Ignore CVE-2024-5290
Date: Sat, 28 Sep 2024 19:42:23 +0200
Message-Id: <20240928174223.3749001-3-peter.marko@siemens.com>
In-Reply-To: <20240928174223.3749001-1-peter.marko@siemens.com>
References: <20240928174223.3749001-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Sep 2024 17:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205047

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

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-5290
[2] https://bugs.launchpad.net/ubuntu/+source/wpa/+bug/2067613
[3] https://w1.fi/cgit/hostap/commit/?id=c84388ee4c66bcd310db57489eac4a75fc600747

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 22028ce957..01dc72b385 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -32,6 +32,8 @@ PACKAGECONFIG[openssl] = ",,openssl"
 
 CVE_PRODUCT = "wpa_supplicant"
 
+CVE_STATUS[CVE-2024-5290] = "not-applicable-platform: this only affects Ubuntu and other platforms patching wpa-supplicant"
+
 EXTRA_OEMAKE = "'LIBDIR=${libdir}' 'INCDIR=${includedir}' 'BINDIR=${sbindir}'"
 
 do_configure () {
-- 
2.30.2


