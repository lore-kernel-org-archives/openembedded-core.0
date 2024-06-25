Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24464C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:12:54 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.166490.1719303168556952711
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=S0XZWMok;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20240625081245916b5738aeacb98fa1-_fkvo7@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20240625081245916b5738aeacb98fa1
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Jun 2024 10:12:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=E0dcFaBb0t5J1RqUjSzWPkoxGBQcj2qwfURUbkHmrac=;
 b=S0XZWMokWq6S5QvXBCIsdrYYWxiEZ7pR5O84ndX3badiTPltlmb3AX5trpGnppzPAHB3Co
 P1s/1Zq7pWsatBR5AizVmc45+F5sfhBSXDTOA9LdW5LDKUTNW/ZgjcPU8oUYF/uHuXgP48rt
 fsF68RCak/DdJX8YkDYEQhSKnvnfc=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][scarthgap][PATCH] flac: fix buildpaths warnings
Date: Tue, 25 Jun 2024 10:11:48 +0200
Message-Id: <20240625081148.1785443-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 08:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201120

From: Peter Marko <peter.marko@siemens.com>

Generated documentation (html) contain absolute paths cources
using buildpaths warnings.
Replace them with relative links.

The file with root path to sources is in my build
/usr/share/doc/flac/api/dir_c122f5d6544f32779f55e8358fb78605.html
which does not looks as stable name, so replace it in all files.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/flac/flac_1.4.3.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-multimedia/flac/flac_1.4.3.bb b/meta/recipes-multimedia/flac/flac_1.4.3.bb
index d4e463cda5..87b67bee1f 100644
--- a/meta/recipes-multimedia/flac/flac_1.4.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.4.3.bb
@@ -34,3 +34,10 @@ PACKAGES += "libflac libflac++"
 FILES:${PN} = "${bindir}/*"
 FILES:libflac = "${libdir}/libFLAC.so.*"
 FILES:libflac++ = "${libdir}/libFLAC++.so.*"
+
+do_install:append() {
+    # make the links in documentation relative to avoid buildpaths reproducibility problem
+    sed -i "s#${S}/include#${includedir}#g" ${D}${docdir}/flac/FLAC.tag ${D}${docdir}/flac/api/*.html
+    # there is also one root path without trailing slash
+    sed -i "s#${S}#/#g" ${D}${docdir}/flac/api/*.html
+}
-- 
2.30.2


