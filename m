Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2D7D4978C
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 18:54:33 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.156772.1733079271434279754
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 10:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=eRN8IEFY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202412011854277d574fba67380ea0d7-uifzzp@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202412011854277d574fba67380ea0d7
        for <openembedded-core@lists.openembedded.org>;
        Sun, 01 Dec 2024 19:54:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=T/+DbdRa9uYrr27ITv+7ZpLfcutFCgp32exwkSHidtY=;
 b=eRN8IEFYkxoSX3VGQ4SumUy7SeBbuc62cwzKFmT7HK1xeOO7q8iZaVA0crP+aXo/EZ06tU
 xBXXvUZVX9r4/5ctUdXPhxzXY3hRXOml7Rizxf5VHGZR6Ngd2RnhHGjZY9aN8JRoLsu1FSEx
 1XhhOJVeR3OHL/747M69wSq5QA32BER8VA4/28DDBWS6vYFk19qzz9S0sQHIpesYsn8W4Tsr
 sYmZInjRR9Vgcg4R29WaDoGWf+vqd3Ad9bPMYaJxmQ25W29EMkxQnY5lob1qH1CryTW7rcYG
 6/LTi6L8FhpBwNMtzWQx2QPBCztMJcM4KBMO2+z2K47rZxhrff/6ZD0g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/5] cpio: ignore CVE-2023-7216
Date: Sun,  1 Dec 2024 19:53:33 +0100
Message-Id: <20241201185337.2675566-2-peter.marko@siemens.com>
In-Reply-To: <20241201185337.2675566-1-peter.marko@siemens.com>
References: <20241201185337.2675566-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 18:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208118

From: Peter Marko <peter.marko@siemens.com>

Same was done in newer Yocto releases.
See commit See commit 0f2cd2bbaddba3b8c80d71db274bbcd941d0e60e

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/cpio/cpio_2.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.14.bb b/meta/recipes-extended/cpio/cpio_2.14.bb
index c0b97ee166..0fbab82cca 100644
--- a/meta/recipes-extended/cpio/cpio_2.14.bb
+++ b/meta/recipes-extended/cpio/cpio_2.14.bb
@@ -16,6 +16,8 @@ inherit autotools gettext texinfo
 
 # Issue applies to use of cpio in SUSE/OBS, doesn't apply to us
 CVE_CHECK_IGNORE += "CVE-2010-4226"
+# disputed: intended behaviour, see https://lists.gnu.org/archive/html/bug-cpio/2024-03/msg00000.html
+CVE_CHECK_IGNORE += "CVE-2023-7216"
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
-- 
2.30.2


