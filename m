Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C47C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 17:29:35 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1101.1785950966791872879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 10:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=kGmT45PY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202608051729254bb2040d9e00020702-8ttjcf@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202608051729254bb2040d9e00020702
        for <openembedded-core@lists.openembedded.org>;
        Wed, 05 Aug 2026 19:29:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9wdb+Ytz79oUEfX36Af+zx6TaZzk0LQNrOpJuLyaqoc=;
 b=kGmT45PYHiPsQsvx07GwfydHZ9if+fFwxEM3IP1w8FrukAzQKMwNgx3XyyFm58bjPKJPrU
 +7fCowCIVYaBrQ5cZQgw2o/bFNePH4ospYWTQfpS2+7NF4aU5sImAiKjIEiOASqruotqWK0o
 ewN2f3ftSH8yhGSTFpCbr18w3HP82DQuv6qMkInFtRjSJVliCmNIFtZ0m5zOI80eovfj+4Ox
 8Pj9NGUWVsdCOTb1JpDsvmp7nuyzhxYA1DdldyN+MasnDGt4x4qoJl22aUNo2H4sXakKoC/T
 eLbLX70+444DzTQ6g84IgICwfHTA3yy+EhHawa0zDvdj7KHyt02uzu4A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 6/7] openssl: set status for CVE-2015-3216
Date: Wed,  5 Aug 2026 19:28:39 +0200
Message-ID: <20260805172840.202825-6-peter.marko@siemens.com>
In-Reply-To: <20260805172840.202825-1-peter.marko@siemens.com>
References: <20260805172840.202825-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 17:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242885

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

Per [1] this fffects Red Hat specific patch.

[1] https://security-tracker.debian.org/tracker/CVE-2015-3216

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssl/openssl_3.5.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
index 212879dfa3..04b2b3de92 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
@@ -296,3 +296,5 @@ INSANE_SKIP:${PN} = "already-stripped"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
+
+CVE_STATUS[CVE-2015-3216] = "not-applicable-platform: specific to RHEL patches"

