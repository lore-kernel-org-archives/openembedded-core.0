Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EB0ECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 13:34:05 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.4057.1662471242032908790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 06:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=JWSXVox4;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662471242;
  x=1694007242;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wvp++C/xsrVte1GOmhAQdIRrc1vkTrT39TV7OJ2ELrA=;
  b=JWSXVox4K46RcehpGlaryG+QEAZekpI9pFRcPZSga1av+Io1ZMO8TnI3
   ZxJnsvH1m9a4HiqY1WC3hLApC6edlOfwgKv41BeFTkDRfqLZwk79tmd25
   MVH9nEsYn5vhyZq5ss1H/WmC1Nvbu5229dtZ1Y8Hf3zh7nzXJBlbYFG0T
   lOLZnqlZ6TYfNUW4KXwLumQMTNefPEkSGAsOe1TkgHjD5MJTdJ46FhqgO
   kJmebNQEy90sst9Wmhwbgp2oU9Po2+QbB4skkoGoJRv7nbCkjLGcLbOaf
   OHGsIxETeFsC3lo87XLwGou1w348PNCgo7bMAih6UyxExal2hxVCnO4Xs
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cairo: Adapt the license information based on what is being
 built
Date: Tue, 6 Sep 2022 15:33:54 +0200
Message-ID: <20220906133354.2608366-1-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 13:34:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170353

If the "trace" PACKAGECONFIG is removed to disable cairo-trace (the
only part of the code licensed as GPL-3.0), we can adapt the licenses
for cairo-dbg and cairo-src so that they do not include
"GPL-3.0-or-later" and thus they can be used also when, e.g., GPL-3.0
is blacklisted in INCOMPATIBLE_LICENSE. Also drop the GPL-3.0 license
text from LIC_FILES_CHKSUM in this case.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This applies the suggestion from commit f763b906 (cairo: Add missing
GPLv3 license checksum entry). I have verified that when disabling the
trace PACKAGECONFIG, then there is no trace (no pun intended) of the
GPL-3.0 code in the -dbg and -src packages.

 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index 67081bb8cb..ffb813d290 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -17,9 +17,13 @@ LICENSE:${PN}-doc = "MPL-1.1 | LGPL-2.1-only"
 LICENSE:${PN}-gobject = "MPL-1.1 | LGPL-2.1-only"
 LICENSE:${PN}-script-interpreter = "MPL-1.1 | LGPL-2.1-only"
 LICENSE:${PN}-perf-utils = "GPL-3.0-or-later"
+# Adapt the licenses for cairo-dbg and cairo-src depending on whether
+# cairo-trace is being built.
+LICENSE:${PN}-dbg = "(MPL-1.1 | LGPL-2.1-only)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPL-3.0-or-later', '', d)}"
+LICENSE:${PN}-src = "(MPL-1.1 | LGPL-2.1-only)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPL-3.0-or-later', '', d)}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77 \
-                    file://util/cairo-trace/COPYING-GPL-3;md5=d32239bcb673463ab874e80d47fae504"
+                    ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'file://util/cairo-trace/COPYING-GPL-3;md5=d32239bcb673463ab874e80d47fae504', '', d)}"
 
 
 DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"

