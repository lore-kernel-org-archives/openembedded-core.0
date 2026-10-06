Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D06CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 19:37:21 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3554.1791315439233089299
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 12:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lg8G987B;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202610061937165739737cce00020778-aeu9cd@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202610061937165739737cce00020778
        for <openembedded-core@lists.openembedded.org>;
        Tue, 06 Oct 2026 21:37:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kecg8rKM/mVNzYqH692WmOxnJoBSAct/XxNE9CQHdVQ=;
 b=lg8G987B25aaemMfdkbKCeiX9MHihu/2F7OaYrj5c40QeJ0kx6/pYA+tpe0syTCPBbDtcU
 +Ql4Uf2z9k5M8ZoT+DlWn5914Wjj9L3axWkn1AdjtmOLa5UMsMZUHEfvpk+cNYiuX+d97yi9
 J0Mw7Bv0Lsen0asS8Xc4bxuVM3iyJxZaoTr4Qs6Qi5CCAZCehkp0V6PLoRaHmwTbb7uiGeIy
 9xW+qXJOloP1U6zR6HwsmBCPjbJ4e5a4qIkmiY1cjI9zCjyl59tPMr4wMbrjydrwRaY64GD3
 I1LzU2Q9bCNOi7Dh7W73RKmAJo7TUGUYfR1gaQpMJIQQnop37kxddlBA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/6] expat: patch CVE-2026-76956
Date: Tue,  6 Oct 2026 21:36:34 +0200
Message-ID: <20261006193638.2018393-2-peter.marko@siemens.com>
In-Reply-To: <20261006193638.2018393-1-peter.marko@siemens.com>
References: <20261006193638.2018393-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 19:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247321

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-76956

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../expat/expat/CVE-2026-76956.patch          | 26 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76956.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-76956.patch b/meta/recipes-core/expat/expat/CVE-2026-76956.patch
new file mode 100644
index 0000000000..96d9b68ee7
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-76956.patch
@@ -0,0 +1,26 @@
+From 40daa9996d616e66a75dea41ed2b18f2c3901b9f Mon Sep 17 00:00:00 2001
+From: Sorrachat <32319737+Sorrashut-K@users.noreply.github.com>
+Date: Fri, 14 Aug 2026 17:29:50 -0400
+Subject: [PATCH] lib: Fix inverted getentropy() return in
+ writeRandomBytes_getentropy
+
+CVE: CVE-2026-76956
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/40daa9996d616e66a75dea41ed2b18f2c3901b9f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/random_getentropy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/random_getentropy.c b/expat/lib/random_getentropy.c
+index d258df6a..ad8b1984 100644
+--- a/lib/random_getentropy.c
++++ b/lib/random_getentropy.c
+@@ -54,7 +54,7 @@
+ bool
+ writeRandomBytes_getentropy(void *target, size_t count) {
+   errno = 0;
+-  const bool success = getentropy(target, count);
++  const bool success = (getentropy(target, count) == 0);
+   // MSan does not understand `getentropy`, so explain its effects
+   if (success)
+     MSAN_UNPOISON(target, count);
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index 5d30a844fa..c3c9f73845 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-66046-01.patch \
            file://CVE-2026-66046-02.patch \
            file://CVE-2026-76641.patch \
+           file://CVE-2026-76956.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

