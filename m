Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1CFC83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 18:52:46 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.4937.1752087156328809847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 11:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=cCRA1itB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250709185232d470ab3d5d1e76e5c9-biakfe@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250709185232d470ab3d5d1e76e5c9
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Jul 2025 20:52:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1gomhveCJnJEAKnUCe1jK6ADk81k8CLiYL4N+Hg5bDU=;
 b=cCRA1itB2qp5H0QjEif97MVdNujAOiAvUozPTEB1cxSHp9dd2DiQ2lhM0GOW2NNJ8KUrGI
 YAjuPh/RuKEYX43b/ImJvldbmvbLr2hlj8AtabvdtABQuRLfvM2W4YQsbuoIzRXw/x/bWeRv
 0J5h1JucrnQq65izCHc2eSIPv5Y0RGBZ/cuBMKzPUZ+Pp0r46zlaks6DFjwq9zoLEazy57Tq
 Zsi4ruxzTRoOrSGXYVGI79HELzrksHyIyTHGL6m/vTEDhJSrzzgo24+HrAf5ifIUFpr+/Zi8
 5PuFG5idI0ZEUkipvooBj6ZVRcdU6ujhuDLsQFLPNbwP6VnseqSTvXUg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] python3: update CVE product
Date: Wed,  9 Jul 2025 20:51:41 +0200
Message-Id: <20250709185141.1990416-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 18:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220107

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
 meta/recipes-devtools/python/python3_3.13.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.5.bb b/meta/recipes-devtools/python/python3_3.13.5.bb
index f9ae534213..dde03dc0e7 100644
--- a/meta/recipes-devtools/python/python3_3.13.5.bb
+++ b/meta/recipes-devtools/python/python3_3.13.5.bb
@@ -41,7 +41,7 @@ SRC_URI[sha256sum] = "93e583f243454e6e9e4588ca2c2662206ad961659863277afcdb968016
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
-CVE_PRODUCT = "python cpython"
+CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
 CVE_STATUS[CVE-2007-4559] = "disputed: Upstream consider this expected behaviour"
 CVE_STATUS[CVE-2019-18348] = "not-applicable-config: This is not exploitable when glibc has CVE-2016-10739 fixed"

