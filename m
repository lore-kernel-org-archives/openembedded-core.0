Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D52C56203
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 17:29:25 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1092.1785950952828829887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 10:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=djBOKtbQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202608051729144def2b647b000207ca-ebv96w@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202608051729144def2b647b000207ca
        for <openembedded-core@lists.openembedded.org>;
        Wed, 05 Aug 2026 19:29:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=dKJIaN9CJiePbEDoPks5oBhii1Jo01za3clW2gBJOG0=;
 b=djBOKtbQe/mjSBLrkXZNa900oZZBqRUIiofKUFsPo2ccSpKwaHaf7N81Qz5XDeJFGTmfGA
 wg6cMVeYpncaBQ//7N5qttl66dOqCTtG4YZaAC1cD8Zhyf3nfjbr2H1uwTpUVklMyyCEHjST
 xfA9Ue/aA6XE9f9rmzz/xcmo1+nTUYxb9kFKvtDf5VV/NYPm/a35OSprShcxzBYNYXa4k3ui
 uDUTQJmYqZILjWPItAmzD4iwf61LcH44DAp1OJx0/WjKq1oWURCKxWvbGsoEf7t/NuotrPNw
 +znlTrB4SazbmO4WOySztMQmScoSUJ759/VgQGnUtvrfT/Ql6W63ivWA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/7] ovmf: set status of CVE-2017-5731 and CVE-2019-14584
Date: Wed,  5 Aug 2026 19:28:36 +0200
Message-ID: <20260805172840.202825-3-peter.marko@siemens.com>
In-Reply-To: <20260805172840.202825-1-peter.marko@siemens.com>
References: <20260805172840.202825-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 17:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242882

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

OVMF has a generic problem that version is encoded in different ways.
Both CVE have their fixed version in NVD CVE reports encoded as
YYYY-MM-DD...

CVE-2017-5731 additionally predates tags in vurrent git repository.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index ab276bad1f..660aefcf46 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -31,11 +31,13 @@ CVE_VERSION = "${@d.getVar('PV').split('stable')[1]}"
 CVE_STATUS[CVE-2014-8271] = "fixed-version: Fixed in svn_16280, which is an unusual versioning breaking version comparison."
 CVE_STATUS[CVE-2014-4859] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2014-4860] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2017-5731] = "fixed-version: fixed since 2017-11-07"
 CVE_STATUS[CVE-2019-14553] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14559] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14562] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14563] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14575] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2019-14584] = "fixed-version: fixed since edk2-stables202011"
 CVE_STATUS[CVE-2019-14586] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14587] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2024-1298] = "fixed-version: fixed since edk2-stable202405"

