Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F025E77361
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 15:08:42 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.122214.1766588917078413080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 07:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=gBVLtJoq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20251224150834f5611a5d16000207fa-i4xywm@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251224150834f5611a5d16000207fa
        for <openembedded-core@lists.openembedded.org>;
        Wed, 24 Dec 2025 16:08:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=fB57HXVUhOmdIMSXbhvKNIjhimDTgyAtzOLwVdmDY7k=;
 b=gBVLtJoqfdXpAq8Y4/RuqK+H4YQd/wDIhX8b+tb1f4R+tT4WhQkXE4aOsCNtyZyMP3Fhxu
 qfhjXrBSYUeo+yAbqgbxs6sqNMKvV/oO+Rs03MLxN/l5WCZ5bM3DoiCFmbaWaz8UoIoxJOvU
 81VuRUo2R0CJNxY+P9Nwfwkj43quDhh/T5KNn1yjtNJO9BM6Acj6QkxNM3QpwtgG0lwINicM
 CVo2CE7iBeT01CPaK5p8Jh8+7cdtYLD5J1UGFxGDAPqYXTDBgNHr4VC5aLDSG3g8Docd3hUe
 SS/WRbBorShLRDJlx6P4/Tra7dhdwsiUzTwPxV9zaqow55fPdLU+2K0A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/2] oe-setup-vscode: improve bitbake-setup compatibility
Date: Wed, 24 Dec 2025 16:07:40 +0100
Message-ID: <20251224150805.3312684-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 15:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228541

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This series improves VSCode integration for bitbake-setup projects by
addressing workspace visibility and configuration issues caused by the
different directory layout.

The first patch fixes "bitbake not found" errors by dynamically locating
bitbake using which bitbake. The second patch detects the bitbake-setup
layout and moves the .vscode directory to the workspace root, bringing
all layers into VSCode's scope and adding refined file exclusion patterns.

There will be a third patch going to bitbake-setup itself which calls
the init-build-env script to set up the environment properly already
before VSCode can be started. This will ensure the .vscode/settings.json
is created with the correct paths even before the VSCode Bitbake plugin
creates an incomplete or even invalid settings.json.

Adrian Freihofer (2):
  oe-setup-vscode: improve bitbake-setup compatibility
  oe-setup-vscode: improve VSCode bitbake-setup compatibility

 oe-init-build-env       | 16 ++++++++--
 scripts/oe-setup-vscode | 71 +++++++++++++++++++++++------------------
 2 files changed, 54 insertions(+), 33 deletions(-)

-- 
2.52.0


