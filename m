Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A73C561E6
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 17:29:15 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1092.1785950952828829887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 10:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=jI/TnpKf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202608051729102ecd1cbd26000207af-rlyoci@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202608051729102ecd1cbd26000207af
        for <openembedded-core@lists.openembedded.org>;
        Wed, 05 Aug 2026 19:29:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=O6+ht7bNHNNOqG01nESA40vxs29yJI9mpSvf1MF6f8Q=;
 b=jI/TnpKfBekDICNNZqVdjH59pZRMR6Xoj/oqlJfwNbbQ309OSeBN0h8n3rQJkaq3ypGY2d
 OYmonoP8bxuVbamaPU9iAU1TWPRFwEthDxZgOuBsBif+BR9gdCKXxj6O0Kc+mKQm4mlDUdXe
 pilsLr2GaAATMi0got5PDISzJIC5KzPiuLamDG7S6w7Fvx6acSFMjq9cGaFAFoYKq5NJC7IN
 hNYRfnEj3kayaF/CI0vsupNxl5Gi5c/FLLa0fcg4HCd3Immsg6qbt6SI3eCU2C4vj9J7Kyq8
 x/vv1dDZEf4kVCVqvNxsW6LLJVx8J1Ps3wnr5A/LLaRSOl69PmKtazkQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/7] glibc: set status for CVE-2011-0536 and CVE-2025-0577
Date: Wed,  5 Aug 2026 19:28:35 +0200
Message-ID: <20260805172840.202825-2-peter.marko@siemens.com>
In-Reply-To: <20260805172840.202825-1-peter.marko@siemens.com>
References: <20260805172840.202825-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 17:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242881

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

* CVE-2011-0536: CVE desciption says it's related to RedHat patches
* CVE-2025-0577: [1] linked CVE report says it's related to RedHat
  patches and no upstream release is impacted

[1] https://bugzilla.redhat.com/show_bug.cgi?id=2338871

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc_2.44.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-core/glibc/glibc_2.44.bb
index c629b30827..36841e3308 100644
--- a/meta/recipes-core/glibc/glibc_2.44.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -16,6 +16,9 @@ CVE_STATUS[CVE-2019-1010025] = "disputed: \
 Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, may allow \
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
+CVE_STATUS[CVE-2011-0536] = "not-applicable-platform: specific to RHEL patches"
+CVE_STATUS[CVE-2025-0577] = "not-applicable-platform: specific to RHEL patches"
+
 # when upgrading, clear CVE list but keep the variables
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "\

