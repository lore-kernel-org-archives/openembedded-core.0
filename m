Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C4DCDB46C
	for <webhook@archiver.kernel.org>; Sun, 21 Jun 2026 10:12:42 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21672.1782036757693701590
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2026 03:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=PU69E1Gf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260621101234018850f1b10002070d-ydtpxj@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260621101234018850f1b10002070d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 21 Jun 2026 12:12:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=InPner1fS6tWMRb6WQEPqFbXMnoj3ilWSD+vhRnpgFA=;
 b=PU69E1Gf5HRWC/DQo/Am4TG/MV3hh6LN5zPKJq8/b0xEJORE4u2ECF2R74jrPaQxrr9xHX
 mdnsb2dpN33FPVckBUYg0S6okWHJMGx4yDFSigcl7KmG8LHJCzex95E5aur30I8I8qXLv75H
 ZSYjShOUcMps9wZEeBpEi/B9BCWjGypF5Lrz3qbhmmS+FT2GHqAT8M+V+a1vHJox4xlByFxG
 A8Dcbx3XzghbHEGmkynVFpvHCImkEkny/JDxWqc4vshXPjV2X2jIdSS56lXySnQJLMpLlrMZ
 U03vq1YC4trjOuyh3eAUxD7/OBBDVbxqUG6b94in02wwb6uqLhKrIIQg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/1] oe-selftest: fitimage: Do not expect kernel property in DTBO config subnodes
Date: Sun, 21 Jun 2026 12:11:59 +0200
Message-ID: <20260621101222.669557-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260621101222.669557-1-adrian.freihofer@siemens.com>
References: <20260621101222.669557-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2026 10:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239257

From: Adrian Freihofer <adrian.freihofer@siemens.com>

A DTBO overlay together with only a kernel cannot form a bootable result,
so DTBO configuration subnodes should not include the kernel property.
Update _get_req_its_fields() accordingly: skip appending
'kernel = "kernel-1"' for .dtbo files, aligning it with
_get_req_sections() which already handles this correctly.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 23d034517f..67b03c1d9f 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -924,7 +924,9 @@ class KernelFitImageBase(FitImageTestCase):
         dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
         if dtb_files:
             for dtb in dtb_files:
-                its_field_check.append('kernel = "kernel-1";')
+                # DTBO overlay configs do not include a kernel property
+                if not dtb.endswith('.dtbo'):
+                    its_field_check.append('kernel = "kernel-1";')
                 its_field_check.append('fdt = "fdt-%s";' % dtb)
             for dtb in dtb_symlinks:
                 its_field_check.append('kernel = "kernel-1";')
-- 
2.54.0


