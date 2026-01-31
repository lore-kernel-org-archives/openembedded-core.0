Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E79D7977B
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 14:53:28 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10130.1769871199332439593
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 06:53:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=P4fkMiwo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260131145317f08b724e65000207ab-pjn8zb@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260131145317f08b724e65000207ab
        for <openembedded-core@lists.openembedded.org>;
        Sat, 31 Jan 2026 15:53:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=UhDcfy5bQ1bDRKDGsUznn9RtHFrF5lOtatX61nD02YY=;
 b=P4fkMiwoFeXUMusHumIlWp8ly/lBCJzRKM/ZaHQTunqdMEzjjsQHTV4IrGs36d/R+wQm/B
 TyPMbHQYzgGt2C5o2GIs4YsE83QGfZLDfSU4/I71ZXzPt6gP/+alKBoiO8HN06vfwbWAUNQz
 mMBXw2Dy/duTvxah2N3/gY6JACuy26YOiolKjFqZTTE9UKXZkX/FEs95v1+dX36PpvdVbtNt
 Kd/JHYgf0+6bwc6IVdKdw7iCtkpE3Cp0WsEA66W2nBlKwDY0T9ANK3EsPilENZy0nJ9HBZDK
 XxeMn/A5JmsKg+3zlHWtwaOjBKuQOvhTuSEL72Mx/noqvWBxINFQd/gQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] expat: upgrade 2.7.3 -> 2.7.4
Date: Sat, 31 Jan 2026 15:53:15 +0100
Message-Id: <20260131145315.3770996-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 14:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230242

From: Peter Marko <peter.marko@siemens.com>

Changelog [1]:
        Security fixes:
           #1131  CVE-2026-24515 -- Function XML_ExternalEntityParserCreate
                    failed to copy the encoding handler data passed to
                    XML_SetUnknownEncodingHandler from the parent to the new
                    subparser. This can cause a NULL dereference (CWE-476) from
                    external entities that declare use of an unknown encoding.
                    The expected impact is denial of service. It takes use of
                    both functions XML_ExternalEntityParserCreate and
                    XML_SetUnknownEncodingHandler for an application to be
                    vulnerable.
           #1075  CVE-2026-25210 -- Add missing check for integer overflow
                    related to buffer size determination in function doContent

        Bug fixes:
           #1073  lib: Fix missing undoing of group size expansion in doProlog
                    failure cases
           #1107  xmlwf: Fix a memory leak
           #1104  WASI: Fix format specifiers for 32bit WASI SDK

        Other changes:
           #1105  lib: Fix strict aliasing
           #1106  lib: Leverage feature "flexible array member" of C99
           #1051  lib: Swap (size_t)(-1) for C99 equivalent SIZE_MAX
           #1109  lib|xmlwf: Return NULL instead of 0 for pointers
           #1068  lib|Windows: Clean up use of macro _MSC_EXTENSIONS with MSVC
           #1112  lib: Remove unused import
           #1110  xmlwf: Warn about XXE in --help output (and man page)
     #1102 #1103  WASI: Stop using getpid

... and additional docs/autotools/cmake/infrastructure changes

[1] https://github.com/libexpat/libexpat/blob/R_2_7_4/expat/Changes

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/expat/{expat_2.7.3.bb => expat_2.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.7.3.bb => expat_2.7.4.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.7.3.bb b/meta/recipes-core/expat/expat_2.7.4.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.7.3.bb
rename to meta/recipes-core/expat/expat_2.7.4.bb
index 069254e13c..95a1ed52c4 100644
--- a/meta/recipes-core/expat/expat_2.7.3.bb
+++ b/meta/recipes-core/expat/expat_2.7.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "59c31441fec9a66205307749eccfee551055f2d792f329f18d97099e919a3b2f"
+SRC_URI[sha256sum] = "e6af11b01e32e5ef64906a5cca8809eabc4beb7ff2f9a0e6aabbd42e825135d0"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 

