Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63721D41D6F
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 08:52:45 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.82281.1731401558555969664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 00:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NE5QDNj0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2024111208523470556ac7bcca660ea3-ji7s9i@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2024111208523470556ac7bcca660ea3
        for <openembedded-core@lists.openembedded.org>;
        Tue, 12 Nov 2024 09:52:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=HkKxFst9A3ZaKBRn8D6/l4eRnwYn+n8vuFGoDYLpqBU=;
 b=NE5QDNj01HsM5soSRizSqEtZh6BK6A51xeE0nG0P77h7B7RxbuXB2QH6o88sYpvxQLkZE6
 89GuHUQdIT/YrtkqNqWQJAfXALkL/Gqt0Px5t+9ZZg8LCwV/yWoNrnRQXVTr+3gZCnVfTzXH
 j5hk5LcXQPG+JVDYlBIYAhIQwtD5SikAwGUtpD96A6oyErL9zH03Pt25d/tT14XEneAyDsA9
 kL9qNKSAaJLBH7uoQkh5onHbpWyKWdS1IEwJK5d09kU7ggEwhWflLenqYTfHFZa1kEgpPA1q
 KOx9mYD9I8gFHQRgG5KNSD6mV82rPnrP3kep0UfAFe7NkzpFdot0vwnQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH v2] expat: patch CVE-2024-50602
Date: Tue, 12 Nov 2024 09:51:29 +0100
Message-Id: <20241112085129.11176-1-peter.marko@siemens.com>
In-Reply-To: <20241111190447.56468-1-peter.marko@siemens.com>
References: <20241111190447.56468-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 08:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206987

From: Peter Marko <peter.marko@siemens.com>

Pick commits from https://github.com/libexpat/libexpat/pull/915

Not picking test is suboptimal, but test structure was changed meanwhile
so we'd have to invent new code.
Skipping tests was already done in previous expat/kirkstone CVE patches.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: fixed upstream patch lik in CVE-2024-50602-01.patch

 .../expat/expat/CVE-2024-50602-01.patch       | 56 +++++++++++++++++++
 .../expat/expat/CVE-2024-50602-02.patch       | 38 +++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-50602-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-50602-02.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2024-50602-01.patch b/meta/recipes-core/expat/expat/CVE-2024-50602-01.patch
new file mode 100644
index 0000000000..18dc392f67
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-50602-01.patch
@@ -0,0 +1,56 @@
+From 51c7019069b862e88d94ed228659e70bddd5de09 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 21 Oct 2024 01:42:54 +0200
+Subject: [PATCH 1/2] lib: Make XML_StopParser refuse to stop/suspend an
+ unstarted parser
+
+CVE: CVE-2024-50602
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/51c7019069b862e88d94ed228659e70bddd5de09]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ expat/lib/expat.h    | 4 +++-
+ expat/lib/xmlparse.c | 6 ++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/expat/lib/expat.h b/expat/lib/expat.h
+index d0d6015a..3ba61304 100644
+--- a/expat/lib/expat.h
++++ b/expat/lib/expat.h
+@@ -127,7 +127,9 @@ enum XML_Error {
+   /* Added in 2.3.0. */
+   XML_ERROR_NO_BUFFER,
+   /* Added in 2.4.0. */
+-  XML_ERROR_AMPLIFICATION_LIMIT_BREACH
++  XML_ERROR_AMPLIFICATION_LIMIT_BREACH,
++  /* Added in 2.6.4. */
++  XML_ERROR_NOT_STARTED,
+ };
+ 
+ enum XML_Content_Type {
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index d9285b21..fa02537f 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -2189,6 +2189,9 @@ XML_StopParser(XML_Parser parser, XML_Bool resumable) {
+   if (parser == NULL)
+     return XML_STATUS_ERROR;
+   switch (parser->m_parsingStatus.parsing) {
++  case XML_INITIALIZED:
++    parser->m_errorCode = XML_ERROR_NOT_STARTED;
++    return XML_STATUS_ERROR;
+   case XML_SUSPENDED:
+     if (resumable) {
+       parser->m_errorCode = XML_ERROR_SUSPENDED;
+@@ -2474,6 +2477,9 @@ XML_ErrorString(enum XML_Error code) {
+   case XML_ERROR_AMPLIFICATION_LIMIT_BREACH:
+     return XML_L(
+         "limit on input amplification factor (from DTD and entities) breached");
++  /* Added in 2.6.4. */
++  case XML_ERROR_NOT_STARTED:
++    return XML_L("parser not started");
+   }
+   return NULL;
+ }
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/expat/expat/CVE-2024-50602-02.patch b/meta/recipes-core/expat/expat/CVE-2024-50602-02.patch
new file mode 100644
index 0000000000..e714daade5
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-50602-02.patch
@@ -0,0 +1,38 @@
+From 5fb89e7b3afa1c314b34834fe729cd063f65a4d4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 21 Oct 2024 01:46:11 +0200
+Subject: [PATCH 2/2] lib: Be explicit about XML_PARSING in XML_StopParser
+
+CVE: CVE-2024-50602
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/5fb89e7b3afa1c314b34834fe729cd063f65a4d4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ expat/lib/xmlparse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index fa02537f..983f6df0 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -2202,7 +2202,7 @@ XML_StopParser(XML_Parser parser, XML_Bool resumable) {
+   case XML_FINISHED:
+     parser->m_errorCode = XML_ERROR_FINISHED;
+     return XML_STATUS_ERROR;
+-  default:
++  case XML_PARSING:
+     if (resumable) {
+ #ifdef XML_DTD
+       if (parser->m_isParamEntity) {
+@@ -2213,6 +2213,9 @@ XML_StopParser(XML_Parser parser, XML_Bool resumable) {
+       parser->m_parsingStatus.parsing = XML_SUSPENDED;
+     } else
+       parser->m_parsingStatus.parsing = XML_FINISHED;
++    break;
++  default:
++    assert(0);
+   }
+   return XML_STATUS_OK;
+ }
+-- 
+2.30.2
+
-- 
2.30.2


