Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30C4D6B6BF
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 18:50:50 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.22999.1730314242802994591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 11:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=G1FmafBR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20241030185039a5e38cbc55d584b594-jeje2o@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20241030185039a5e38cbc55d584b594
        for <openembedded-core@lists.openembedded.org>;
        Wed, 30 Oct 2024 19:50:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mO35adh1jySqg7IH6F9d2KOHY+xuk7TRxAHpIgaWRV8=;
 b=G1FmafBRn0ghBISscxSWmH6wNkvdKxZ5kANK1vfIMp1WRgKbHeaqWQWxjjWHqfsE+VjTQ8
 4Ci/rPnn+nItFZ479NEO5khVoD85MKBSgwUeQXrVb4kDuKENoAJlr6sJ7GXMgJrBtweLenXk
 tbItzbFKMM1u/VtLCCekKzOb21PdPfwVmnQPaGN3dd1JihWvvf3J+d0AvUKo06mnZRKYHBe7
 LeFVLgtIKizWMt0bMs3ILPfapNYBTH5xViB+94fATaDRwHiPhc3br0o+Xxosns8JhTs5aPby
 65O+YTLMTQCd6tT2r7mDSgt5Ns9kU741sJobEGSyNV6nTmTjiS6bfccw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] cve-check: do not skip cve status description after :
Date: Wed, 30 Oct 2024 19:49:50 +0100
Message-Id: <20241030184951.82977-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 18:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206559

From: Peter Marko <peter.marko@siemens.com>

Correct maxsplit parameter from 5 to 4 to not drop text if
description contains ":".

Example:
>>> "detail: cpe:vendor:product:description:cont".split(':', 5)
['detail', ' cpe', 'vendor', 'product', 'description', 'xxx']
>>> "detail: cpe:vendor:product:description:cont".split(':', 4)
['detail', ' cpe', 'vendor', 'product', 'description:xxx']

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 487f30dc25..268adfb528 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -239,7 +239,7 @@ def decode_cve_status(d, cve):
     if not status:
         return {}
 
-    status_split = status.split(':', 5)
+    status_split = status.split(':', 4)
     status_out = {}
     status_out["detail"] = status_split[0]
     product = "*"
-- 
2.30.2


