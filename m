Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC06C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:39:14 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29446.1787683151933547217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 11:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=hC2wKIvq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260825183909d937895d17000207bd-o67wgq@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260825183909d937895d17000207bd
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Aug 2026 20:39:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=lE85eNcoopGHw+Hr4Hkrnm9MKnxOukfBiCHfT5kHUB0=;
 b=hC2wKIvqWLXKxN0craq75K+ato0TH4I751Uqk/ednUPUuLrATbw0cb/vPkojAvE2bqoazD
 jLfr/C3mEvd2OdFpNbliwaGt3rUVVmLcH1oG7kVaKUL+2uUBIvKZJKHy2HxneSAxutuBQ61X
 7wvaf4cQkQmRKZs6QuToNLy22qPAGk1CnvDV0o4pt86rVBSn+U1FhD2hHgVNsu8uN9G6e/Bh
 rTSwRigueHrqssrHX9IwyGh4Lt2q2UHZzwBBbnurfiuQPLU5mJeR7XoAYoM7UVgNkj9zNa95
 IBNcmcIDCblJZgpeJUEdTZQSvX7t7CTQt0Y2zmX0zDCRUF6HAUMsIGsw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/5] curl: patch CVE-2026-8925
Date: Tue, 25 Aug 2026 20:38:50 +0200
Message-ID: <20260825183853.1017950-2-peter.marko@siemens.com>
In-Reply-To: <20260825183853.1017950-1-peter.marko@siemens.com>
References: <20260825183853.1017950-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244257

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2026-8925.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2026-8925.patch             | 57 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8925.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8925.patch b/meta/recipes-support/curl/curl/CVE-2026-8925.patch
new file mode 100644
index 0000000000..da486e6ac1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8925.patch
@@ -0,0 +1,57 @@
+From 3da249e1f0716c06644ed3522a37a8bf81808012 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Thu, 14 May 2026 14:35:21 +0200
+Subject: [PATCH] gsasl: fix potential double free
+
+Also:
+- require libgsasl 1.6.0+ (2010-12-14) for a `gsasl_finish()` that
+  handles a NULL argument.
+  Ref: https://gitlab.com/gsasl/gsasl/-/commit/b550032df8488a9ceaa3cfd4c634947d8f219717
+
+Reported-by: Joshua Rogers (Aisle Research)
+
+Closes #21609
+
+CVE: CVE-2026-8925
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3da249e1f0716c06644ed3522a37a8bf81808012]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ docs/INTERNALS.md | 1 +
+ lib/vauth/gsasl.c | 5 +++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/docs/INTERNALS.md b/docs/INTERNALS.md
+index c145690a2c..77f2e43735 100644
+--- a/docs/INTERNALS.md
++++ b/docs/INTERNALS.md
+@@ -30,6 +30,7 @@ We aim to support these or later versions.
+ - c-ares       1.6.0 (2008-12-09)
+ - GnuTLS       3.6.5 (2018-12-01)
+ - libidn2      2.0.0 (2017-03-29)
++- libgsasl     1.6.0 (2010-12-14)
+ - LibreSSL     2.9.1 (2019-04-22)
+ - libssh       0.9.0 (2019-06-28)
+ - libssh2      1.9.0 (2019-06-20)
+diff --git a/lib/vauth/gsasl.c b/lib/vauth/gsasl.c
+index 3ea77eecd1..10a83fdb09 100644
+--- a/lib/vauth/gsasl.c
++++ b/lib/vauth/gsasl.c
+@@ -32,6 +32,10 @@
+ 
+ #include <gsasl.h>
+ 
++#if GSASL_VERSION_NUMBER < 0x010600
++#error "requires libgsasl 1.6.0+"
++#endif
++
+ bool Curl_auth_gsasl_is_supported(struct Curl_easy *data,
+                                   const char *mech,
+                                   struct gsasldata *gsasl)
+@@ -47,6 +51,7 @@ bool Curl_auth_gsasl_is_supported(struct Curl_easy *data,
+   res = gsasl_client_start(gsasl->ctx, mech, &gsasl->client);
+   if(res != GSASL_OK) {
+     gsasl_done(gsasl->ctx);
++    gsasl->ctx = NULL;
+     return FALSE;
+   }
+ 
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index ca01e35dcd..6ad1bfe55f 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -26,6 +26,7 @@ SRC_URI = " \
     file://CVE-2026-11352.patch \
     file://CVE-2026-11586.patch \
     file://CVE-2026-7009.patch \
+    file://CVE-2026-8925.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

