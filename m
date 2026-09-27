Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB88C9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 09:00:09 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34124.1790499599790435357
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 02:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=uAF3wZOG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202609270859581e41e72c7d00020754-f5faui@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202609270859581e41e72c7d00020754
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 10:59:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=i0l0m/PnEooPZEZm/l+C/bprhl6Hyl0sFH8Bp7j2m/4=;
 b=uAF3wZOGLGpQlvjsR3nI3s4Z2rtaZvDSUv/miYDKufUHBlz9qtDjrZoK1HHH8wgezTUz5B
 3FqpuYfv96Lua9RnC4ee+asSDCUqYsPrto4/qjsry3/CU8zCe7WxcygtnmtkNwZfx2OHb1Fz
 UyuR88XyHjthRUIgclc/x/vXDeC6Qc6pWMzL6cyxel4BL6G6TwzFvXaoWzznldAnfVZAPDpO
 IpRQgrGX8iaDHtDAMOqKxoqHXrUIBuDRDPpTkTu338ikd+YpdUwts3eODoyEj947tZffye2T
 zjrDVTrR6zo8zrhQVwqSdtcUXohHC1nt/pORDtFJZTv8EZ/QSJfKFcvQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/8] gnutls: set status for CVE-2023-0361
Date: Sun, 27 Sep 2026 10:59:30 +0200
Message-ID: <20260927085936.114900-2-peter.marko@siemens.com>
In-Reply-To: <20260927085936.114900-1-peter.marko@siemens.com>
References: <20260927085936.114900-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246680

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

Per [1] this CVE was fixed in v3.8.0.

[1] https://security-tracker.debian.org/tracker/CVE-2023-0361

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9d9b944d390efdf45196e53e4283e3ec2acfd0fd)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 538fd9c9e0..92854eeaf9 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -123,6 +123,7 @@ pkg_postinst_ontarget:${PN}-fips () {
     fi
 }
 
+CVE_STATUS[CVE-2023-0361] = "fixed-version: fixed in version 3.8.0"
 CVE_STATUS[CVE-2025-32989] = "fixed-version: fixed in version 3.8.10"
 CVE_STATUS[CVE-2025-32990] = "fixed-version: fixed in version 3.8.10"
 CVE_STATUS[CVE-2026-1584] = "fixed-version: fixed in version 3.8.12"

