Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E48C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 18:39:26 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2665.1785955160187306663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 11:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CPYMhVLf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202608051839181ca39be5d600020737-evrmb2@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202608051839181ca39be5d600020737
        for <openembedded-core@lists.openembedded.org>;
        Wed, 05 Aug 2026 20:39:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=mJ1DvLn7u3Qgu9KFJK+GXdDyyuZdnpRm5MxYaYI/b64=;
 b=CPYMhVLfA3R87cC0bPbs54NSuqFhpU63FKI6NysyKCTbFbhMQRz2LUgwT4bVRwABaQ+I38
 IZ5nXp7wtZxQZTVp8NmmNMmefeTEkPyBMQILjSNp1xSzOUE/8fx8Nepb1wqdFAr7Ml/LTwAe
 YQgST0Xvc9kWWhXhObeDCMhkZ+/eDApd9A0RV3+2Lk7pQxKUfVkkqXtuiwVgw3+ZHM15dIjG
 Ovf4KgtVVJ3i7h05eXU5w1+ljPJ7lXx7R6qMUTnaF0quj82GejTHNJlFmBUyYfiM1+53kAc9
 RazWo4B8ykSyyd3h1f9A66EYiMgoJfl/a+ZMN0TQzjgQRUOPgVZz+dGw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/3] libarchive: set status for CVE-2026-4424
Date: Wed,  5 Aug 2026 20:38:45 +0200
Message-ID: <20260805183845.205950-3-peter.marko@siemens.com>
In-Reply-To: <20260805183845.205950-1-peter.marko@siemens.com>
References: <20260805183845.205950-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 18:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242890

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

These are RedHat CVEs listing version-less or distro versions.

Release 3.8.7 notes [1] contain reference to pull [2] from NVD report.

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.7
[2] https://github.com/libarchive/libarchive/pull/2898

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/libarchive/libarchive_3.8.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 63c66eea81..2f3f3b90af 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -90,6 +90,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest += "bsdtar bsdcpio"
 
+CVE_STATUS[CVE-2026-4424] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-4426] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5745] = "fixed-version: fixed since 3.8.6"

