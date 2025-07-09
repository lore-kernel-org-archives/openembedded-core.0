Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD858C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 18:54:16 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.4983.1752087251745414751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 11:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Gl+mm7DV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202507091854099cc0cdab0f9b2b5083-pbku_j@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202507091854099cc0cdab0f9b2b5083
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Jul 2025 20:54:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MmOtpcYz+i58kM/EiDNyABd7GVurfLNzPZPBqQd7pG0=;
 b=Gl+mm7DVL9w+90GsbqutqIllFPK6hmdJgWjF7eesOUU/pU/Qrb7EkQKXoa+iFw4q6IoFM0
 7xap1iX24spY+IRlBwpxoZUeVDe35wd7699gIeiOS3bCHws/Rs8qsqtF8HyHKthPYP41XKqA
 qYw62/VTyx+FskL8d22HHG/24JCSr/67fAwHgNBBwknhJdXPbzS+P+6jBJJSEcFsUbA1r1tB
 XZAhQWceydn6vjd993+RgHEmYQQsrAYw9n5eAlsQWW77VdyZXa837/7ekLjk97Y/ebQ2KhzD
 +ml3jjtPa+REnnkffsTZx5+A2+4IduDOT6SQoKKzOpEARnexA4tVBGoQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] python3: update CVE product
Date: Wed,  9 Jul 2025 20:53:21 +0200
Message-Id: <20250709185321.1990668-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 18:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220109

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

Note that this already shows that cpython product is not used, so
CVE-2023-33595 mentioned in 62598e1138f21a16d8b1cdd1cfe902aeed854c5c
was updated.
But let's keep it for future in case new CVE starts with that again.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3_3.12.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.12.11.bb b/meta/recipes-devtools/python/python3_3.12.11.bb
index 706dabb5cd..84c4f74158 100644
--- a/meta/recipes-devtools/python/python3_3.12.11.bb
+++ b/meta/recipes-devtools/python/python3_3.12.11.bb
@@ -45,7 +45,7 @@ SRC_URI[sha256sum] = "c30bb24b7f1e9a19b11b55a546434f74e739bb4c271a3e3a80ff4380d4
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
-CVE_PRODUCT = "python cpython"
+CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
 CVE_STATUS[CVE-2007-4559] = "disputed: Upstream consider this expected behaviour"
 CVE_STATUS[CVE-2019-18348] = "not-applicable-config: This is not exploitable when glibc has CVE-2016-10739 fixed"

