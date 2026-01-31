Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968DCD73EB5
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 17:34:39 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13562.1769880868781191339
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 09:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=HWKbUfGH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260131173425ec5ee41c3d00020763-x9lsvw@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260131173425ec5ee41c3d00020763
        for <openembedded-core@lists.openembedded.org>;
        Sat, 31 Jan 2026 18:34:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oLfBkDGYj2WeI8UdIdEzGwzdyuHPKFKB3jmtZivjhWw=;
 b=HWKbUfGHyvK5RNXq1WyUURyGGsscOB/sqY2It9Xu7iZNZWY1kqOBCDjh7tFeE+dwt3bwQQ
 1RrxbsZY7t5KYkd5bwvQv3nNH5g9Ar3a9iNhtulnANXciSH7dYPXQbp6bX3FH68S1NMQcWiV
 wA6o/+pHoRWNqM2tlPgvk9bf0Y6PXoykS1bcSvFtdlbdmCxmtyd2sw4aTHq39WbZUGpPxEei
 Z2wlqn74nniNfBNYAyBZbhHfd/6tA6kncap44A7xSZn6GBNfXjKxY2bQgwburr+tqHpsOJme
 YhETjQYtv0aU3g1/qDmCwkcSmuSjRy3+KUII5KfuMBL+EPvFhRYrt9YA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] expat: patch CVE-2026-25210
Date: Sat, 31 Jan 2026 18:34:23 +0100
Message-Id: <20260131173423.3433141-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 17:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230244

From: Peter Marko <peter.marko@siemens.com>

Pick patches from [1].

[1] https://github.com/libexpat/libexpat/pull/1075

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../expat/expat/CVE-2026-25210-01.patch       | 27 +++++++++++++
 .../expat/expat/CVE-2026-25210-02.patch       | 38 +++++++++++++++++++
 .../expat/expat/CVE-2026-25210-03.patch       | 28 ++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  3 ++
 4 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-03.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-25210-01.patch b/meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
new file mode 100644
index 00000000000..d56e8811915
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
+@@ -3499,7 +3499,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             tag->name.strLen = convLen;
+             break;
+           }
+-          bufSize = (int)(tag->bufEnd - tag->buf) << 1;
++          bufSize = (int)(tag->bufEnd - tag->buf) * 2;
+           {
+             char *temp = REALLOC(parser, tag->buf, bufSize);
+             if (temp == NULL)
diff --git a/meta/recipes-core/expat/expat/CVE-2026-25210-02.patch b/meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
new file mode 100644
index 00000000000..21bd6e4fd0e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
@@ -0,0 +1,38 @@
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
+---
+ lib/xmlparse.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 2f9adffc..ee18a87f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3488,7 +3488,6 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         const char *fromPtr = tag->rawName;
+         toPtr = (XML_Char *)tag->buf;
+         for (;;) {
+-          int bufSize;
+           int convLen;
+           const enum XML_Convert_Result convert_res
+               = XmlConvert(enc, &fromPtr, rawNameEnd, (ICHAR **)&toPtr,
+@@ -3499,7 +3498,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             tag->name.strLen = convLen;
+             break;
+           }
+-          bufSize = (int)(tag->bufEnd - tag->buf) * 2;
++          const size_t bufSize = (size_t)(tag->bufEnd - tag->buf) * 2;
+           {
+             char *temp = REALLOC(parser, tag->buf, bufSize);
+             if (temp == NULL)
diff --git a/meta/recipes-core/expat/expat/CVE-2026-25210-03.patch b/meta/recipes-core/expat/expat/CVE-2026-25210-03.patch
new file mode 100644
index 00000000000..46a1618e040
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
+@@ -3498,6 +3498,8 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             tag->name.strLen = convLen;
+             break;
+           }
++          if (SIZE_MAX / 2 < (size_t)(tag->bufEnd - tag->buf))
++            return XML_ERROR_NO_MEMORY;
+           const size_t bufSize = (size_t)(tag->bufEnd - tag->buf) * 2;
+           {
+             char *temp = REALLOC(parser, tag->buf, bufSize);
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index a61357e6c14..048093f010d 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -43,6 +43,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2025-59375-24.patch \
            file://CVE-2026-24515-01.patch \
            file://CVE-2026-24515-02.patch \
+           file://CVE-2026-25210-01.patch \
+           file://CVE-2026-25210-02.patch \
+           file://CVE-2026-25210-03.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

