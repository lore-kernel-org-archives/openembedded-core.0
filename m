Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435DDCF6493
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 17:58:56 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.18141.1727546327156485973
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Sep 2024 10:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=lhqgIAlR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20240928175843e27183a008fabae113-cu0fru@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20240928175843e27183a008fabae113
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Sep 2024 19:58:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=RlLpqmBQYkTR/9rHWzZQLqv79Szn/6iarSa6/D4A8YI=;
 b=lhqgIAlRxpRnvDli/YBXRsY1+gThsKx304WtlFnmPgd3M50UpEEqG3NkrxLMjuUbyQ02py
 2IvXXsw8fRlcATjU4Df7hY1CTILXdD3U2mZYrJdJrMjU7cOweCc2EzJiTwtNsW8Tqm108U3r
 HaSe8yfPwIYnITLI4oepdpx9TjCMpKe/I3Av9TQcRFV/x7pW73gKvbOT7UV/9zGN/Bypl5b3
 wseGyB4NjBHMHu4mUz5wcEKSermev53BMS1cRh8fS1cFvVZR6POveGeFxZnX+8o4cY9djnvK
 He3tVQH5uQ1CZVK5YlGhZQ/OjZ23RNK6KIqSS9eODdmyouLsCHQsJeug==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/2] wpa-supplicant: Ignore CVE-2024-5290
Date: Sat, 28 Sep 2024 19:57:41 +0200
Message-Id: <20240928175741.3750357-2-peter.marko@siemens.com>
In-Reply-To: <20240928175741.3750357-1-peter.marko@siemens.com>
References: <20240928175741.3750357-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Sep 2024 17:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205049

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
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 70f1fd6fc9..696176907c 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -31,6 +31,9 @@ SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7
 
 CVE_PRODUCT = "wpa_supplicant"
 
+# not-applicable-platform: this only affects Ubuntu and other platforms patching wpa-supplicant
+CVE_CHECK_IGNORE += "CVE-2024-5290"
+
 S = "${WORKDIR}/wpa_supplicant-${PV}"
 
 PACKAGES:prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
-- 
2.30.2


