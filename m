Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6732DC5AD49
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 21:43:11 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.45928.1749418984922827858
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 14:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Eg4rtt1R;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20250608214302c6e66249d0cab31937-5hto_8@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250608214302c6e66249d0cab31937
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Jun 2025 23:43:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=tRLYWhYeSt7RFZBZQhGSbtf1FVvd/ZJ0CefsN6kuej4=;
 b=Eg4rtt1Rhj4HVxaIr4aEKa0UbnXVrEv56CffhSacpVpHbNzF1Al99PMYu0ivJiPrTo3izg
 qCMfEOcPr3SF9XGFQqyuxOmVtsQzAIvxM8Xc7EYr2s9Mas/8w6moz588DCyBoWXWSTQW++0I
 hs5zChRhQqBEgBA1hCEEVcrVTLe/b8ARVjnmF+Yq2nO0YsHyRgFJxD2Bahn3Opix1it9+mWx
 l7q+7flpZPxsS1AlX79rhPd1KItd2U35rF/Rgu2qCQcS+k9IrMnPHf+ywjGtlwi1SEQapAzR
 yd62VdTTquyBH9kEtvjFpxgsvAdtP0YeIJDR7WrIMSf0/LfAIhlGPCpQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][walnascar][PATCH 1/4] python3: remove obsolete deletion of non-deterministic .pyc files
Date: Sun,  8 Jun 2025 23:42:09 +0200
Message-Id: <20250608214212.2427283-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 21:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218227

From: Ross Burton <ross.burton@arm.com>

These .pyc files were non-deterministic because they used frozensets[1],
but this has been fixed in 3.11 onwards.

[1] https://github.com/python/cpython/issues/81777
[2] https://github.com/python/cpython/commit/51999c960e7fc45feebd629421dec6524a5fc803

(From OE-Core rev: c8c391ed3e0598a3bea7bc0981126d870315063d)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.13.2.bb | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.2.bb
index 7c36fd92ed..0f0505c66c 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -235,20 +235,6 @@ do_install:append() {
                 $sysconfigfile
         cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
 
-
-        # Unfortunately the following pyc files are non-deterministc due to 'frozenset'
-        # being written without strict ordering, even with PYTHONHASHSEED = 0
-        # Upstream is discussing ways to solve the issue properly, until then let's
-        # just not install the problematic files.
-        # More info: http://benno.id.au/blog/2013/01/15/python-determinism
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
-
-        # Similar to the above, we're getting reproducibility issues with 
-        # /usr/lib/python3.10/__pycache__/traceback.cpython-310.pyc
-        # so remove it too
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.cpython*
-
         # Remove the opt-1.pyc and opt-2.pyc files. They effectively waste space on embedded
         # style targets as they're only used when python is called with the -O or -OO options
         # which is rare.

