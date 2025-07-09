Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE6BC83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 18:55:06 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.4947.1752087300060665971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 11:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=esxTkLI5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202507091854589fb5a619ab762690b5-9ulp1r@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202507091854589fb5a619ab762690b5
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Jul 2025 20:54:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JZfvfGIyXGwl3hQkLQ10auWRQvazqRNz+1WAVnVGBHY=;
 b=esxTkLI5+svnqE5FmedbFIf0vy6x3pv0gCVOkkOxu3ys7aIwCBX9+4WfIWkWupCcTJpOCG
 XtQa8c9tjayN1HDN3iaf5GmMQotMrOb/VsuvBzu2Ir45i5F9x219migXX9uuBjx1lx1I2x8k
 MRleqaF1tVPEsuGSHZvGRjBrengRmUeSQRIrAVXSBz+3CbVzFMw5G5geR3mlvp3LM/Ybtw3D
 Vr9vId9Vb9A2CXIAAfAT0p2WG30xwe1UcLy1NIoaOaKj55Fztu8FIknenmsWSx57VUH9T+5l
 jM+QtRkZtNkaBxrtwcEMnzSgAUNDzVh2l+I6UpVZWJ1PlnWU0Hl53mQg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] python3: update CVE product
Date: Wed,  9 Jul 2025 20:54:09 +0200
Message-Id: <20250709185409.1990717-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220110

From: Peter Marko <peter.marko@siemens.com>

There are two "new" CVEs reported for python3, their CPEs are:
* CVE-2020-1171: cpe:2.3:a:microsoft:python:*:*:*:*:*:visual_studio_code:*:* (< 2020.5.0)
* CVE-2020-1192: cpe:2.3:a:microsoft:python:*:*:*:*:*:visual_studio_code:*:* (< 2020.5.0)
These are for "Visual Studio Code Python extension".

Solve this by addding CVE vendor to python CVE product to avoid
confusion with Microsoft as vendor.

Examining CVE DB for historical python entries shows:
sqlite> select vendor, product, count(*) from products where product = 'python' or product = 'cpython'
   ...> or product like 'python%3' group by vendor, product;
microsoft|python|2
python|python|1054
python_software_foundation|python|2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3_3.10.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.10.18.bb b/meta/recipes-devtools/python/python3_3.10.18.bb
index 0b57a0ebee..875b52cde9 100644
--- a/meta/recipes-devtools/python/python3_3.10.18.bb
+++ b/meta/recipes-devtools/python/python3_3.10.18.bb
@@ -51,7 +51,7 @@ SRC_URI[sha256sum] = "ae665bc678abd9ab6a6e1573d2481625a53719bc517e9a634ed2b9fefa
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 UPSTREAM_CHECK_URI = "https://www.python.org/downloads/source/"
 
-CVE_PRODUCT = "python"
+CVE_PRODUCT = "python:python python_software_foundation:python"
 
 # Upstream consider this expected behaviour
 CVE_CHECK_IGNORE += "CVE-2007-4559"

