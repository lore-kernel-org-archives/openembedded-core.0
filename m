Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A37D7977D
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 17:34:39 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13568.1769880875537577836
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 09:34:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fOOX8Jbx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2026013117343332e6c9443300020712-gzz7i6@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026013117343332e6c9443300020712
        for <openembedded-core@lists.openembedded.org>;
        Sat, 31 Jan 2026 18:34:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=WD4TsMUGG5fDn8OJ8WYN3/+2ZxE0P47AGK3sl0rKVKs=;
 b=fOOX8Jbx6fRQbuzTMTXEB5dJJhzH+FhJsTxjH+xijlOTfILHlXxMAEnaVmhQvoPb45YV7w
 u5pxpLv+saydV4LAMO2KUOLEhdiDjkBldqQxxRth2xiRzzBmgkqTc1Z/Qmxrc1Qm3yY3WdfC
 07ky52DiJ6MyAN7w/bl03I773fKAjVcv9OQZYThqKOUaJvs1Wi8xNeiFoIDRqRLYg7lLvMaS
 QCZ9vkT7RIKtLk0eAbKc/6ML/CdGkdWqiC7MKKPMPNLq4ZtBqsx0oYE7wgtQclbTQqzvefni
 i1AP+3ofAPmb3w/30tG5VgYo/99YFz2u0AGKMqRTXvQZm1Iz4m6jq76A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] expat: patch CVE-2026-25210
Date: Sat, 31 Jan 2026 18:34:29 +0100
Message-Id: <20260131173429.3433167-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 17:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230245

From: Peter Marko <peter.marko@siemens.com>

Pick patches from [1].

[1] https://github.com/libexpat/libexpat/pull/1075

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../expat/expat/CVE-2026-25210-01.patch       | 27 ++++++++++++++
 .../expat/expat/CVE-2026-25210-02.patch       | 37 +++++++++++++++++++
 .../expat/expat/CVE-2026-25210-03.patch       | 28 ++++++++++++++
 meta/recipes-core/expat/expat_2.5.0.bb        |  3 ++
 4 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-03.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-25210-01.patch b/meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
new file mode 100644
index 0000000000..cdd5f13338
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
@@ -0,0 +1,27 @@
+From 7ddea353ad3795f7222441274d4d9a155b523cba Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 2 Oct 2025 17:15:15 -0700
+Subject: [PATCH] lib: Make a doubling more readable
+
+Suggested-by: Sebastian Pipping <sebastian@pipping.org>
+
+CVE: CVE-2026-25210
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/7ddea353ad3795f7222441274d4d9a155b523cba]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 8cf29257..2f9adffc 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2977,7 +2977,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             tag->name.strLen = convLen;
+             break;
+           }
+-          bufSize = (int)(tag->bufEnd - tag->buf) << 1;
++          bufSize = (int)(tag->bufEnd - tag->buf) * 2;
+           {
+             char *temp = (char *)REALLOC(parser, tag->buf, bufSize);
+             if (temp == NULL)
diff --git a/meta/recipes-core/expat/expat/CVE-2026-25210-02.patch b/meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
new file mode 100644
index 0000000000..d690a6e8fa
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
@@ -0,0 +1,37 @@
+From 8855346359a475c022ec8c28484a76c852f144d9 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 2 Oct 2025 17:15:15 -0700
+Subject: [PATCH] lib: Realign a size with the `REALLOC` type signature it is
+ passed into
+
+Note that this implicitly assumes `tag->bufEnd >= tag->buf`, which should
+already be guaranteed true.
+
+CVE: CVE-2026-25210
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/8855346359a475c022ec8c28484a76c852f144d9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 2f9adffc..ee18a87f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2966,7 +2966,6 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         const char *fromPtr = tag->rawName;
+         toPtr = (XML_Char *)tag->buf;
+         for (;;) {
+-          int bufSize;
+           int convLen;
+           const enum XML_Convert_Result convert_res
+               = XmlConvert(enc, &fromPtr, rawNameEnd, (ICHAR **)&toPtr,
+@@ -2977,7 +2976,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             tag->name.strLen = convLen;
+             break;
+           }
+-          bufSize = (int)(tag->bufEnd - tag->buf) * 2;
++          const size_t bufSize = (size_t)(tag->bufEnd - tag->buf) * 2;
+           {
+             char *temp = (char *)REALLOC(parser, tag->buf, bufSize);
+             if (temp == NULL)
diff --git a/meta/recipes-core/expat/expat/CVE-2026-25210-03.patch b/meta/recipes-core/expat/expat/CVE-2026-25210-03.patch
new file mode 100644
index 0000000000..d8b3887428
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-25210-03.patch
@@ -0,0 +1,28 @@
+From 9c2d990389e6abe2e44527eeaa8b39f16fe859c7 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 2 Oct 2025 17:15:15 -0700
+Subject: [PATCH] lib: Introduce an integer overflow check for tag buffer
+ reallocation
+
+Suggested-by: Sebastian Pipping <sebastian@pipping.org>
+
+CVE: CVE-2026-25210
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/9c2d990389e6abe2e44527eeaa8b39f16fe859c7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index ee18a87f..d8c54c38 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2976,6 +2976,8 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             tag->name.strLen = convLen;
+             break;
+           }
++          if (SIZE_MAX / 2 < (size_t)(tag->bufEnd - tag->buf))
++            return XML_ERROR_NO_MEMORY;
+           const size_t bufSize = (size_t)(tag->bufEnd - tag->buf) * 2;
+           {
+             char *temp = (char *)REALLOC(parser, tag->buf, bufSize);
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.5.0.bb
index ae661947c3..c22dad2bbc 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -31,6 +31,9 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 	   file://CVE-2024-50602-01.patch \
 	   file://CVE-2024-50602-02.patch \
 	   file://CVE-2026-24515.patch \
+	   file://CVE-2026-25210-01.patch \
+	   file://CVE-2026-25210-02.patch \
+	   file://CVE-2026-25210-03.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"

