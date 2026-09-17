Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC01AC982E7
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:28 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1695.1789682899349705927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XSlQKLXU;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so840975e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682898; x=1790287698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RTDYOGo1DFVuvQSs89yWnCEF2bGlL8qBuIFdAl57Now=;
        b=XSlQKLXU4ggvY04pvaEaK9rU+k7Hd7b+HTvJgUtj8rfJs5PzV9ZaL8NfmQFjnIOgUb
         PGZCRqsmTD3s3ugye5OaUkirTMp1kGIQiY070S8IPjFB4Jd7TQaIQjSVjcIjKGEfTmBg
         HwyA9jZqol7CqRU9DFd7Rm/xzfzKzsZj/I/aQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682898; x=1790287698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RTDYOGo1DFVuvQSs89yWnCEF2bGlL8qBuIFdAl57Now=;
        b=ZrXaru9pLlAfJD1Jv+ACp0aZvIwE0nq4CA8fEkMK6eH5yMhuVWH7JmxVqlGEgdOvHT
         OzTid4fqP5YLeTu3ypzUR55k5DXYB//pA2kt+t8hJ77mqKGMsRzqu1/HyYavjoGN9PoC
         ryrPCP7ctcQzKJhKPSUdWpwY9azXlael3yYAj5cNpcmispPLNZldApGuQ3dtVMu4PO+6
         dWTVcOWKXSJmZtUvwzI9JKoQPQ+4+kZQI5VPuaGeptTUelVz6N+NXwXOaGB53vIxagNa
         c/lZoQa3VAqX3Lmv/ZAYp2UXP7pJewVxyQv59BSZ2J9DBNxMAIll/YoAEp2YPKP04bLi
         Ircw==
X-Gm-Message-State: AFuF++n0S47HSWxcSO2FuCMChIJJJ1bYaafJ78BnAQXa2qm5eYjEZ60q
	cuXNESk5etgNkuuiNnFPQ6k6gyEmXWh/B+Hu+RMUEVzW2h31eqStOYyUNxOMra7Kg1Lf7nK18Ug
	4QuJ/sIo=
X-Gm-Gg: AYBFou0IK3qrPSz/f+xwU/JM+qGMmpqfynYlimqlb9sV3PfqbkEeZRj9T61VTabGWQo
	3zrfq/vTh77EJwMQ7je8gAnkiCpG0T9Vi/9E94Y5yEZ2k5YX0sPkLcCzQcWz+oRw53d+usczO83
	B+swGeFeh6+loMszSkmnD4vxsordPah4Nd90hGjxecTKx2CYJoYOpciiDaXAYlufeEjZXenoNYW
	E2ozGpZX8+rCTAHDUIJmq9GFBqlhUi84RDQBlWOka/8lr5lCvJ7rkVAOjLz16jRmoOEK5DaqZsv
	kkiR2hpC+Oa9zn6n9lGS6S+RBsC2yUPx6qvLkUrl1Z53AqaHCXlGDZxw5oUxlCDIm2Y6OYRPrpD
	Zk/vFA6B6jgg8kR8l4IObpfCT7/6cVAKH4/M3jm/2PLMnGtiwOix/BBjNAegIH5GQ3Jh8q0G+M9
	D5E1aFLjEYIbOStFvpeNlxc+4oX4hdoc0Mk9RkdHK0kjLhWBTHsY+c4HzEir7zFrrFxaNqLX+d+
	0XchEGNrFhbKqFWhBn+jDyyeb89evME9IiGCnvqh62iUKzF3O8FyM18OusiK1h329JXRq/AzcM=
X-Received: by 2002:a05:600c:4e4a:b0:49e:6e94:7cae with SMTP id 5b1f17b1804b1-49fc5741495mr2853085e9.28.1789682897627;
        Thu, 17 Sep 2026 15:08:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 52/79] curl: patch CVE-2026-8925
Date: Fri, 18 Sep 2026 00:06:37 +0200
Message-ID: <e1b4c3cba47e8894fede985947b5683c1f9902ea.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246146

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2026-8925.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-8925.patch             | 57 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8925.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8925.patch b/meta/recipes-support/curl/curl/CVE-2026-8925.patch
new file mode 100644
index 00000000000..da486e6ac16
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
index 2a27fd4d5bf..bed11141ea6 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -30,6 +30,7 @@ SRC_URI = " \
     file://CVE-2026-11352.patch \
     file://CVE-2026-11586.patch \
     file://CVE-2026-7009.patch \
+    file://CVE-2026-8925.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

