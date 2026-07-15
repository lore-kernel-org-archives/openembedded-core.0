Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C025C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 21:03:08 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1120.1784149386550446891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 14:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=adZjy12q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260715210304f880a9b65b000207c7-rraend@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260715210304f880a9b65b000207c7
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Jul 2026 23:03:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=YvegS1lMde1a+XstXjo8HRoVbIEyF3xZR5xnXLbGlog=;
 b=adZjy12qtvMS1dYALT7fJN6ZLXL95nlHZY52N00Fd4ykTq9MR7zUTot0QWQX+kRLb3jHtA
 qRZ5mV2yv2suryn/SCGq/SO3JYb0EIJGwvtdFXKhHzZ3P805YF2sj+SzAEeaF3acxpeg/Ipp
 6fMGCOjuxxBlo6bt4PpCX4W6BvAy0s0s/yy+ep2q7GcXKDSOuYOuqp5nTXsbpmEFtr0GAfxk
 MGiRA50fPxcoFro/hZeHBfp0H45AA3DAvmmJPaC+t7DpARRScKFnOkNv9/TMhGG066s3d1Gk
 DzGQ3keIfECtIotNJ0fuvWwzStrkTC4R2tpph1vXzB8S3rUmdsgwM3gg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 1/2] flac: fix buildpaths with doxygen enabled
Date: Wed, 15 Jul 2026 23:02:40 +0200
Message-ID: <20260715210241.5032-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 21:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241040

From: Peter Marko <peter.marko@siemens.com>

When documentation is built, buildpaths errors occur.
There is one path to S and one to UNPACKDIR.
We can have a single sed rule to fix both.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9905d3d66c13045e2c422a36cafc8ce11db37c01)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/flac/flac_1.5.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
index 2f43b4e84b..a667ea9f62 100644
--- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -44,6 +44,6 @@ FILES:libflac++ = "${libdir}/libFLAC++.so.*"
 do_install:append() {
     # make the links in documentation relative to avoid buildpaths reproducibility problem
     sed -i "s#${S}/include#${includedir}#g" ${D}${docdir}/flac/FLAC.tag ${D}${docdir}/flac/api/*.html
-    # there is also one root path without trailing slash
-    sed -i "s#${S}#/#g" ${D}${docdir}/flac/api/*.html
+    # there are also some root paths in API titles
+    sed -i "s#${UNPACKDIR}#sources#g" ${D}${docdir}/flac/api/*.html
 }

