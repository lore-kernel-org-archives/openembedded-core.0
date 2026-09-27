Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA33C98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 09:00:29 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34132.1790499622975369038
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 02:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=HTb1Fkho;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026092709002115499bf8eb0002079e-zjqxsh@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026092709002115499bf8eb0002079e
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 11:00:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qEL585+6bgfGnA1HTorSivaDx4doFHVKeGmmkstAEIo=;
 b=HTb1FkhocozJbe1krS9qJgG0h7mzV1DeoYh6j43va+fJ/heOr9hzOSwIZwsdYNbzYXjxCV
 F+c+RKAAxXX/ZLi3fNyulAVB+SDhr12tc9uwS5znodElKFpryp8+q6mFuCVVfj72tlqiDZab
 mPUage7EfjOYJiiScrGLF5kXvP0xi9+RmthzMQXBAZpYJKwdxy9rPvg6TyrUfzKooNL7SSVP
 GPjloNswF1FYsg08OSMgX4f1tpay1aFRnc0VLNpfz44D3svQ2WR/bsFV7SolbKREv/kNw/5O
 aRoimcfQmYrJ5ReeJRY2gs/TgvQcKgcpr2J0Prfbjyk+ghAewfqJ+k6A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 6/8] ovmf: set status of CVE-2017-5731 and CVE-2019-14584
Date: Sun, 27 Sep 2026 10:59:34 +0200
Message-ID: <20260927085936.114900-6-peter.marko@siemens.com>
In-Reply-To: <20260927085936.114900-1-peter.marko@siemens.com>
References: <20260927085936.114900-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246684

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

OVMF has a generic problem that version is encoded in different ways.
Both CVE have their fixed version in NVD CVE reports encoded as
YYYY-MM-DD...

CVE-2017-5731 additionally predates tags in vurrent git repository.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 1ac5e07968d2dc23343ca3a7c1eab7c3788fff41)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 01f840c215..cd6a40a9d0 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -40,11 +40,13 @@ CVE_VERSION = "${@d.getVar('PV').split('stable')[1]}"
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

