Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C75C98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 08:59:59 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34123.1790499593780954019
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 01:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=S+StSfVZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260927085950b027403f7a00020721-qjkcsi@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260927085950b027403f7a00020721
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 10:59:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=td0wZLays808QaIPu/laWBSJcM7q6kgNJyy+NhPUEmQ=;
 b=S+StSfVZ/7rhts2/m8JuINsidBhaVzH8Z2VYkaMsqs+QnC0yGE1lW/Vit+akpncJWkD4RF
 Q+d68N8wExr/ywcWNsTe6ZXiU9iCT7nc6zLez6Ew3Ip2rez63c9OSLpiDmLKnbf6nfYcNKbc
 HeEqwHIJEpPapWSAJyit5adTLeF3AAXriUIgkT6ncxfZEO/zMoOMZ633Rw9vT9uXytxtBu93
 UlvpnpWnRl5KKM1Xjsl5ULnDSbY2ouWcUswiOUZ0RvhgZCnjIc0hT1Ycnw+dxBt0bVQ3qcQG
 TC4inBoblrMZVe4qLdOdYVIwp15L/jTrdbMM9y2kVpqQ3usKdhkT+CnQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 1/8] glibc: set status for CVE-2011-0536 and CVE-2025-0577
Date: Sun, 27 Sep 2026 10:59:29 +0200
Message-ID: <20260927085936.114900-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 08:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246679

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

* CVE-2011-0536: CVE desciption says it's related to RedHat patches
* CVE-2025-0577: [1] linked CVE report says it's related to RedHat
  patches and no upstream release is impacted

[1] https://bugzilla.redhat.com/show_bug.cgi?id=2338871

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 85babe3703588b00a03f7087c54440243a993ee5)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc_2.43.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index 9f3a3814d0..5c21223b55 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -16,6 +16,9 @@ CVE_STATUS[CVE-2019-1010025] = "disputed: \
 Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, may allow \
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
+CVE_STATUS[CVE-2011-0536] = "not-applicable-platform: specific to RHEL patches"
+CVE_STATUS[CVE-2025-0577] = "not-applicable-platform: specific to RHEL patches"
+
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438 \
     CVE-2026-4046 \

