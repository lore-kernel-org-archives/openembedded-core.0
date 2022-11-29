Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8E7C4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 03:58:54 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.140796.1669694325797920541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 19:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JRzGu///;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so12117216pjj.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 19:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=21KaVKPVh76E7x9B7o66M1HAdjRdVL/7ZR4O46JQoe4=;
        b=JRzGu///eVjGQRkIixIqY+7toURfUyb9sPc7r7qfPj+F1KMforHh/DYi6kgN5SQlMs
         FRk7riYuFn77PFb/tDW43VLXLEMG99B2Ey7Ne9k+L6FXOwc/3aBduKOSpUumeT6NCpaC
         8KxBQkcma1FRZtMfx4+xPxJ/qcOwYkF+j0QRzXaeL/KNVjyP5YvTeUiag29PO9/uTL2I
         ZaWagvVa1/qZfsJbQmrMs+1JhDhgV5hahZv4oRtBOWTVDjcrlty68mYiqA7S8/QX6JhD
         6ReLS0sGqqhuLxnmCgaLu9EDGp8/DMSn6tWEcq10U7uyfMNz+B9C7y+7HEgUhpMvzFVe
         0Y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=21KaVKPVh76E7x9B7o66M1HAdjRdVL/7ZR4O46JQoe4=;
        b=qq+UpEElu9voOCS75p3ON77q4YH87/iYqyG8VAF2Dyj/yYjMrj1Jf2zwrwjijTiEHL
         JS3a3nry+4c3mKNbwiT1x45l1V2FMc0XbG/DgnyHXlVuAT2YI4TJZmMdAGb8vQdJl6JH
         Qu5oll4683VSr3Vxp5J9QHxAyjyI96mwv7ZM9bMYmjHs7E04w0aEFlpxAZ3b+TdepKSg
         wxHpz4cELcYuvEWW5tpr4nVFfoqsRmGP+ansBTNy3AjjO8PGLt2Y8spJdzYQFfr0FmDk
         hBHr1M8Zr1cWt4Zg7kq0nBjz1qpwUjKjNi9Gz8ziZCIV+ifvLFV7dHjUqYfUcn8+aH0a
         kHyQ==
X-Gm-Message-State: ANoB5pnDcNaUQSU7Etk5ubRhGZE12mLY5Z7IjrnnTWUS9FQxCs8ZHbD+
	h7jJG+DsuUk1sDhgSDpS8rxSN0M51Kc=
X-Google-Smtp-Source: AA0mqf5UaCEzKpkRk+7nuP6wbM8g2HGMTM1Xn877xUPEAV7Mf2HvydfRJdVEKRTdqEsqaFZ/22B1ww==
X-Received: by 2002:a17:90a:8d13:b0:213:c15:6f08 with SMTP id c19-20020a17090a8d1300b002130c156f08mr56725723pjo.134.1669694324940;
        Mon, 28 Nov 2022 19:58:44 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f26:1387:97d:de1f:a2d:f4b0])
        by smtp.gmail.com with ESMTPSA id x8-20020aa79568000000b005633a06ad67sm8783651pfq.64.2022.11.28.19.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 19:58:44 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH 3/3] curl: Fix CVE-2022-42915
Date: Tue, 29 Nov 2022 09:27:19 +0530
Message-Id: <20221129035719.9207-3-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221129035719.9207-1-bindudaniel1996@gmail.com>
References: <20221129035719.9207-1-bindudaniel1996@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 03:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173957

From: Bhabu Bindu <bhabu.bindu@kpit.com>

HTTP proxy double-free

Link: https://security-tracker.debian.org/tracker/CVE-2022-42915

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../curl/curl/CVE-2022-42915.patch            | 53 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-42915.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-42915.patch b/meta/recipes-support/curl/curl/CVE-2022-42915.patch
new file mode 100644
index 0000000000..0f37a80e09
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-42915.patch
@@ -0,0 +1,53 @@
+From 55e1875729f9d9fc7315cec611bffbd2c817ad89 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 6 Oct 2022 14:13:36 +0200
+Subject: [PATCH] http_proxy: restore the protocol pointer on error
+
+Reported-by: Trail of Bits
+
+Closes #9790
+
+CVE: CVE-2022-42915
+Upstream-Status: Backport [https://github.com/curl/curl/commit/55e1875729f9d9fc7315cec611bffbd2c817ad89]
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ lib/http_proxy.c | 6 ++----
+ lib/url.c        | 9 ---------
+ 2 files changed, 2 insertions(+), 13 deletions(-)
+
+diff --git a/lib/http_proxy.c b/lib/http_proxy.c
+index 1f87f6c62aa40..cc20b3a801941 100644
+--- a/lib/http_proxy.c
++++ b/lib/http_proxy.c
+@@ -212,10 +212,8 @@ void Curl_connect_done(struct Curl_easy *data)
+     Curl_dyn_free(&s->rcvbuf);
+     Curl_dyn_free(&s->req);
+ 
+-    /* restore the protocol pointer, if not already done */
+-    if(s->prot_save)
+-      data->req.p.http = s->prot_save;
+-    s->prot_save = NULL;
++    /* restore the protocol pointer */
++    data->req.p.http = s->prot_save;
+     data->info.httpcode = 0; /* clear it as it might've been used for the
+                                 proxy */
+     data->req.ignorebody = FALSE;
+diff --git a/lib/url.c b/lib/url.c
+index 690c53c81a3c1..be5ffca2d8b20 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -751,15 +751,6 @@ static void conn_shutdown(struct Curl_easy *data, struct connectdata *conn)
+   DEBUGASSERT(data);
+   infof(data, "Closing connection %ld", conn->connection_id);
+ 
+-#ifndef USE_HYPER
+-  if(conn->connect_state && conn->connect_state->prot_save) {
+-    /* If this was closed with a CONNECT in progress, cleanup this temporary
+-       struct arrangement */
+-    data->req.p.http = NULL;
+-    Curl_safefree(conn->connect_state->prot_save);
+-  }
+-#endif
+-
+   /* possible left-overs from the async name resolvers */
+   Curl_resolver_cancel(data);
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 4d49ac33eb..b0192143fb 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2022-35252.patch \
            file://CVE-2022-32221.patch \
            file://CVE-2022-42916.patch \
+           file://CVE-2022-42915.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.17.1


