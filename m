Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D52C98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 09:00:09 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33376.1790499605733257858
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 02:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=qUOZaDUB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202609270900034cc9cec8b100020709-k4ndla@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202609270900034cc9cec8b100020709
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 11:00:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=stOcbp2JH2ZcgWFn2leDmu58t97ZiZvJ/Gk0DuxWy1U=;
 b=qUOZaDUBSLFOXtWBgxNbNpYTPVzTlswPpvo0nKMJ91Ts04R0AVsktE/fI2rkMSHdRVdIqQ
 D7Ve9Az+K7zwOsXoNGRzrk6aeLcWrfUk6avftS/njAkHdU2TgdX2DlsViq8Ed6CElWaW0yKO
 3nnxx0rRZ2vPMXowwYp9ZLjgKFilFCMQ9SArwqbgYL2J8p++iZiqsD3Eu8bJzcJ6UoudK+mV
 EQwjAKLVYdvhe4gqtOWpYxyOdwH4SW+pKcgDB5B5TS8HmZsrXLCj70dRsneiQw5yxMQTLXYL
 tEA8fOXr+tsGNmTvOAjZafdqK7pFyd7qGJZTs/toBkzh48UiSN5vul1g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 3/8] libarchive: set status for CVE-2026-4424
Date: Sun, 27 Sep 2026 10:59:31 +0200
Message-ID: <20260927085936.114900-3-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246681

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

These are RedHat CVEs listing version-less or distro versions.

Release 3.8.7 notes [1] contain reference to pull [2] from NVD report.

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.7
[2] https://github.com/libarchive/libarchive/pull/2898

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 4359d85f9dcb0a6d188859f1ae0200352668b9cc)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/libarchive/libarchive_3.8.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
index afc06f85d4..c0a2921143 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -89,6 +89,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest += "bsdtar bsdcpio"
 
+CVE_STATUS[CVE-2026-4424] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-4426] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5745] = "fixed-version: fixed since 3.8.6"

