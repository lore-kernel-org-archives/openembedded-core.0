Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A3AC98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 09:00:19 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34131.1790499617059631814
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 02:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KU39fdEt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260927090015339155fcff0002077d-22at8y@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260927090015339155fcff0002077d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 11:00:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7wPgnp8FK98eSr9A2/sGnI0vtW0vgfM/5GrSRC6dg7Y=;
 b=KU39fdEt9X6TSTlHsam7SzFuiYRyqVN8ngzqZoPj1mOcae04ITC9kyaoQdSgFCg3Cj694M
 3qixNhsBxXPFLas9ykIWIb8jxlp8y/L9LmIRJsbcP2t3UHb064Bc7yhhLmsRRRx9dNgUdebg
 pWGHbVCmY4r6DQbBYNLEgC9W8Pqi9qpZvDkCZoHlBha57ts/AemUl1vQ8Vml1uQ310DYTqGu
 cFosdr2hr5c3510xddhTbYNLS17AFQI/hsiDswFQ4nB7Aotd2+pR4DUwYpgViyGEg/fS4AIu
 XiXDLg5Jnjbin/SAqbuPggwm44ZXtRLHkXnzkh/blTxVCgou5q+2/ctQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 5/8] openssl: set status for CVE-2015-3216
Date: Sun, 27 Sep 2026 10:59:33 +0200
Message-ID: <20260927085936.114900-5-peter.marko@siemens.com>
In-Reply-To: <20260927085936.114900-1-peter.marko@siemens.com>
References: <20260927085936.114900-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246683

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

Per [1] this fffects Red Hat specific patch.

[1] https://security-tracker.debian.org/tracker/CVE-2015-3216

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 0353d7f67e6fedfc10e9ca56a6bf5f3ca9e215e8)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssl/openssl_3.5.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.8.bb b/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
index d8cae41291..71446e62e3 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
@@ -301,3 +301,5 @@ INSANE_SKIP:${PN} = "already-stripped"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
+
+CVE_STATUS[CVE-2015-3216] = "not-applicable-platform: specific to RHEL patches"

