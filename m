Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B3FCED634
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 12:10:00 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11090.1763467791938196676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 04:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TQ+WcVsZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20251118120949e074de0d9a000207af-mbvnxu@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20251118120949e074de0d9a000207af
        for <openembedded-core@lists.openembedded.org>;
        Tue, 18 Nov 2025 13:09:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=uPM9eul//hJkbv/AtCPXTujmUCg8oqDHOHi7DtFZTM0=;
 b=TQ+WcVsZhTq3ZDRlKFYMYX6xOq804FSj9scUsLcex7CYZdTxHD1iA60Cvm+UpoYwtC+26R
 Pd8X10n5PhVCvBVvAiQgHkIKm5Wk6G3Ro+Y1i8qrwWwGzHG2viCOvLUTVAJ80Wc5W8BefJvM
 Pms0QQLXoUAH2DoR67NiBHiuQ6YxuTreSb9sGmxgZvFuJ+V9feUXZU4HeiwBIiQW5LwgEOdT
 tojDkKCW1h4RlhPOe/liD3yXpzMcFsBQnP3nbsYcHJ6gJlfWcvF2sFzAOb3K1xAwzz7k5ayg
 voKEV1G4Ff+QHlaSb+Us9mUe7cifPTCnWNHJ5KzMjr6PUhcyYdXlds4g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com,
	jpewhacker@gmail.com,
	Hongxu Jia <hongxu.jia@windriver.com>
Subject: [OE-core][scarthgap][PATCH] spdx30: Provide software_packageUrl field in SPDX 3.0 SBOM
Date: Tue, 18 Nov 2025 13:09:48 +0100
Message-Id: <20251118120948.603640-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 12:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226521

From: Hongxu Jia <hongxu.jia@windriver.com>

Define var-SPDX_PACKAGE_URL to provide software_packageUrl field [1][2]
in SPDX 3.0 SBOM, support to override with package name
SPDX_PACKAGE_URL:<pkgname>

Currently, the format of purl is not defined in Yocto, set empty for now
until we have a comprehensive plan for what Yocto purls look like.
But users could customize their own purl by setting var-SPDX_PACKAGE_URL

[1] https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Properties/packageUrl/
[2] https://spdx.github.io/spdx-spec/v3.0.1/annexes/pkg-url-specification/

(From OE-Core rev: c8e6953a0b6f59ffca994c440069db39e60b12d2)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/create-spdx-3.0.bbclass | 5 +++++
 meta/lib/oe/spdx30_tasks.py          | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 044517d9f7..c0a5436ad6 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -117,6 +117,11 @@ SPDX_PACKAGE_VERSION ??= "${PV}"
 SPDX_PACKAGE_VERSION[doc] = "The version of a package, software_packageVersion \
     in software_Package"
 
+SPDX_PACKAGE_URL ??= ""
+SPDX_PACKAGE_URL[doc] = "Provides a place for the SPDX data creator to record \
+the package URL string (in accordance with the Package URL specification) for \
+a software Package."
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 8115088ab8..a2d316301f 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -632,6 +632,14 @@ def create_spdx(d):
             set_var_field("SUMMARY", spdx_package, "summary", package=package)
             set_var_field("DESCRIPTION", spdx_package, "description", package=package)
 
+            if d.getVar("SPDX_PACKAGE_URL:%s" % package) or d.getVar("SPDX_PACKAGE_URL"):
+                set_var_field(
+                    "SPDX_PACKAGE_URL",
+                    spdx_package,
+                    "software_packageUrl",
+                    package=package
+                )
+
             pkg_objset.new_scoped_relationship(
                 [oe.sbom30.get_element_link_id(build)],
                 oe.spdx30.RelationshipType.hasOutput,

