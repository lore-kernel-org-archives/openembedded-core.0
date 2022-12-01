Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F07C4708D
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:27:52 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.44919.1669904865204756937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EL7Hrtw+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 136so1821000pga.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VT1W5GfD4PDlJGRmUXNwX4MDsURCLc6v5FhsgV7vzpg=;
        b=EL7Hrtw+F9Vv5l/HHu7ehbE+QtzzaT0oOShsH2OUAlIMMrDkDeVEL/jSVeZc307yNL
         5tLfLs8H/NCYXbnirSHxtL4OCBfxI11a2Lz5NxUVhdjr1UO96DVDjPq//YySLmQXGxIC
         wSXUwuorUf0bOJG07to1dwfWq9Yj5364ldXYWlxhxbKpJ4sZAJ5DeocD5T6dJyPnqr67
         t31nnug1YW2XWevEQocwInO5v8UoCzU4nBP/qJTQNVXTW7JDtl3ZX/BpYTYP99ZWx+jK
         /iEifdkawnLbzBJAXRjHAq3A0b/gkVPTmulemg12rcxgzcGJ5B2EpP4AsosZEaI0adpu
         +rXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VT1W5GfD4PDlJGRmUXNwX4MDsURCLc6v5FhsgV7vzpg=;
        b=x1JRLPcE+xaZdEOjwDK6xpQhrHBHVLu8HHs8XnJ/vJ98ISvsdieygb3kEfmEsJzW7Z
         MTP0y2YmlkFRSNfQ6XbcAbi4kSVG2Cpig78bwuOdu3TdV8G1iZhyDQ1YVtmrI5Ety8qd
         wVUCHwPnd2XFeIJXBg0ebnySjbtyvwf3KoVsrGHtMRvAeIOWLSjczoWZWWJKOiIHrJoX
         HeJfEp6mxJ008pn70BIi93/9f9MxFAMfPUrcilQ5AVcpyKrdW0rboz4nkpMNqkrKdziO
         pPX7jruTRS/vV9W7Uw0vdaFve7n1ThtmljuZzaA88/bX+msvfVZC1QU7NahEnIocvMjs
         3Zlg==
X-Gm-Message-State: ANoB5plEqwIARnx7fmvGrKHnMU5lCUQQMo8JiXwLZUim7h8U36R0nnO4
	dgRXVFarucXj+xNxoPvgE/TjOvCgRjjwpSEwzF0=
X-Google-Smtp-Source: AA0mqf6rlrGH9W+DgZSmkbZDoEZrKD4qqev+heXPug/WdVREcdW0/ezL89fOWt7grVtbAbE9aBj29Q==
X-Received: by 2002:a63:fa12:0:b0:456:d859:2145 with SMTP id y18-20020a63fa12000000b00456d8592145mr44994398pgh.56.1669904864188;
        Thu, 01 Dec 2022 06:27:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.27.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:27:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/23] curl: Fix CVE-2022-42915
Date: Thu,  1 Dec 2022 04:27:02 -1000
Message-Id: <4754f33d7ec96f72351853463540c8b1a3f4bc0c.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174094

From: Bhabu Bindu <bhabu.bindu@kpit.com>

HTTP proxy double-free

Link: https://security-tracker.debian.org/tracker/CVE-2022-42915

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index a3e29a583d..87f4cd13aa 100644
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
2.25.1


