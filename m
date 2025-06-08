Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8577EC5AD49
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 21:55:41 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.46130.1749419733785799149
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 14:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WWqAkJBX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250608215527cd52e9d25ff55e250c-axac7x@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250608215527cd52e9d25ff55e250c
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Jun 2025 23:55:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nrr7wplwLO6OdywNghHZd5ya4Rg/ItmKF1YY53GKKTU=;
 b=WWqAkJBXgPcFbRvadCwRT/O/pHkwGqInTKbm4PTwrIdI1n4rDA94SSTb8oWLZz9uHAsxOC
 vKe5K21lSO3qMCwqJJ2u/Ie37qbyEKWGk+7g2CPyE4HAGvgfjkZ8Ul+RfonIXohdmfrucJ1a
 cgV669pxLZ47qnHzssFrZKH0zkQN8xdIPOKUDzGw5YpOkTKk3oBkTih5Ra3LRBrXBCTa+EWm
 fe2jtqMV1bbDnxd4wltk7+CoKXz5GTaufq8Bj42sAnrwtOGEP5LQZkwPRUuZN/pBKBAxbStL
 UVwTiGRxR5VN9PeFnAXqV+EmOySk1jf8BnD9/szfxY0kLcMo85p3WV7w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH v2 1/4] python3: remove obsolete deletion of non-deterministic .pyc files
Date: Sun,  8 Jun 2025 23:54:33 +0200
Message-Id: <20250608215436.2428591-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 21:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218234

From: Ross Burton <ross.burton@arm.com>

These .pyc files were non-deterministic because they used frozensets[1],
but this has been fixed in 3.11 onwards.

[1] https://github.com/python/cpython/issues/81777
[2] https://github.com/python/cpython/commit/51999c960e7fc45feebd629421dec6524a5fc803

(From OE-Core rev: c8c391ed3e0598a3bea7bc0981126d870315063d)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
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

