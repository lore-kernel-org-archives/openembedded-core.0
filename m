Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFFFCF8558
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 08:25:24 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29846.1763627121989586073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 00:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=J9+YOcQ5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202511200825186562fd02cc000207f9-7qqnlr@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202511200825186562fd02cc000207f9
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Nov 2025 09:25:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=SoMyr/jA2YbJ4H2cxI7a96fjCpHAGFFzGsUIiY2wea8=;
 b=J9+YOcQ5ohYLh6gR0CvD7dNCFtupsb4KIJBXxX/GbN5gNlAz15jnHSeelyx0jYBGbmQirh
 ZiDPHYCNUdNohuSTQIW6N8bqOg71ePf8nFr2pAvEKWLdBIyQdSasXG8eCdy6AE13FniUY0H/
 Amay0hes5a8eifBMwnJVrbqi9qYr30IDDl01QgdhPq70qFsJJPmAJJh2cdRvR9SXYh+77hxw
 C4GEv0xy1BfeI3KmenxJd8W+sd0VMMsjYHRemfABt/t/1kiSwYtTrnCCoJxzPdMJt01z9DtT
 3dBoZwPz1xH33B2za6qto64OeNsqRL1mhYBfx0gRXAkgQkA9O6amK6dw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] oeqa/sdk/buildepoxy: skip test in eSDK
Date: Thu, 20 Nov 2025 09:25:11 +0100
Message-Id: <20251120082511.408915-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 08:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226606

From: Peter Marko <peter.marko@siemens.com>

Currently meson inside eSDKs only works with fully populated eSDKs,
but our testing uses minimal eSDKS, so skip the test if the eSDK is a
minimal build.  A bug has been filed to resolve this.

This is minimal change extracted from OE-Core commit which has this only
as a minor comment: 575e0bf52db0467d88af4b5fe467b682f10ca62a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/sdk/cases/buildepoxy.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index 5b9c36fcecd..2f21210c793 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -10,6 +10,7 @@ import tempfile
 import unittest
 
 from oeqa.sdk.case import OESDKTestCase
+from oeqa.sdkext.context import OESDKExtTestContext
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
@@ -22,6 +23,9 @@ class EpoxyTest(OESDKTestCase):
         if libc in [ 'newlib' ]:
             raise unittest.SkipTest("MesonTest class: SDK doesn't contain a supported C library")
 
+        if isinstance(self.tc, OESDKExtTestContext):
+            self.skipTest(f"{self.id()} does not support eSDK (https://bugzilla.yoctoproject.org/show_bug.cgi?id=15854)")
+
         if not (self.tc.hasHostPackage("nativesdk-meson") or
                 self.tc.hasHostPackage("meson-native")):
             raise unittest.SkipTest("EpoxyTest class: SDK doesn't contain Meson")

