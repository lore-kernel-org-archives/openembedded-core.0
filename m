Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F05CF6D34
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:24 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.6943.1727874801670756148
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PREpAxoH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6e7b121be30so4413758a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874801; x=1728479601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5KlF2vXDP9SqISda84a/3Wr88esLFCwTArXfKaYPgA=;
        b=PREpAxoHATLUJQS8G1wuc0bmJV8EYXyplk5qKmc5oVsiezihJYu8Dr1GDTyDtz6G9n
         8ZkP8AtuG6kpYRFLlADPn/PRq/ZUS4ycAO79CHqoFixcG6Ngew1tCklw5ifAA9M3jfeN
         T2wMHQjTP1AqZKqD2CCJJyW4srLKyFf/dq4mhW0pmwGI8DmAeTsJqNDA5RbILTmOcPTZ
         /93g0MtYNq7CftmqnZe0UHyhbnQ6PJAZJMT/A/KybwCaomHOF7ZeRMYs1vDqBQeSLScr
         eMBHUEIbfl8kS0GaLNoBx5+pW+JJseWHIy1JQK8J7/lMYz3acYMxttAyuip1gc7Q8g86
         elBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874801; x=1728479601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5KlF2vXDP9SqISda84a/3Wr88esLFCwTArXfKaYPgA=;
        b=KaxrOkinAu5DTaHSf7nWlbzt1sIxFDjm9L6e7QtsGr9lBm1A8C5FMINqSO9Asjpntk
         LJ7LQKfTlBlhm3idIvvqMlw4uynoyTsKjue8fEGRqjFhRyr5BXIyiQgYVCxZbLmnPlv8
         YuxhrlK95QOQpzOVbKhO+/EYEmf8ZOaHknLRPWwHSgLD4Tm5tZYlRNNrJAzCZT5oYHIu
         +loj9uCJjfy9WTQxALlk1Unn6w2PJuzvhlvY4UpmnJZo3svnxNxeTJNqr8fCPU1sNVt1
         WJmUypp/FsDhZtjEjDFWOl99mwTFGDLCIm8ErUS9f1ofZFGHKKFG27o7DoFU1k8SB0x1
         kcwQ==
X-Gm-Message-State: AOJu0YziheEUw3Cl5s0/G6FCPZ/YDPc+PirXBVznX9SXG8UgfDj4zvp7
	A+luYsLs9WEmhaY1PaJScHADH8Mdo4Wu4txU4IJLksU0lNGqDjUYQ0hYiwMp9SyvrYxwhOpPXjS
	fZ6w=
X-Google-Smtp-Source: AGHT+IHvVPfCarzLApzeDx+2GDLKC+yXPEezEJ5427gsy94j7ePCxIZb6MJ/ebjdEHl06RK1JN69rA==
X-Received: by 2002:a05:6a20:d049:b0:1d5:1260:fafa with SMTP id adf61e73a8af0-1d5f1b62d38mr3693433637.50.1727874800869;
        Wed, 02 Oct 2024 06:13:20 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/16] curl: free old conn better on reuse
Date: Wed,  2 Oct 2024 06:12:50 -0700
Message-Id: <fbb820cdfc480e2481d51b9a1057454832f02b23.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205194

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to free old conn better on reuse to
fix the memory leak issue [2].

[1] https://github.com/curl/curl/commit/06d1210
[2] https://github.com/curl/curl/issues/8841

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...01-url-free-old-conn-better-on-reuse.patch | 95 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/0001-url-free-old-conn-better-on-reuse.patch

diff --git a/meta/recipes-support/curl/curl/0001-url-free-old-conn-better-on-reuse.patch b/meta/recipes-support/curl/curl/0001-url-free-old-conn-better-on-reuse.patch
new file mode 100644
index 0000000000..520fd01b5e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-url-free-old-conn-better-on-reuse.patch
@@ -0,0 +1,95 @@
+From 06d12105c7aa883a62802e36eebb76d5303247d0 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 14 May 2022 18:04:46 +0200
+Subject: [PATCH] url: free old conn better on reuse
+
+Make use of conn_free() better and avoid duplicate code.
+
+Reported-by: Andrea Pappacoda
+Fixes #8841
+Closes #8842
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/06d12105c7aa883a62802e36eebb76d5303247d0]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/url.c | 34 ++++------------------------------
+ 1 file changed, 4 insertions(+), 30 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 631e49696..c2d9e78f4 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -3498,17 +3498,6 @@ static void reuse_conn(struct Curl_easy *data,
+      **established** from the primary socket to a remote address. */
+   char local_ip[MAX_IPADR_LEN] = "";
+   int local_port = -1;
+-#ifndef CURL_DISABLE_PROXY
+-  Curl_free_idnconverted_hostname(&old_conn->http_proxy.host);
+-  Curl_free_idnconverted_hostname(&old_conn->socks_proxy.host);
+-
+-  free(old_conn->http_proxy.host.rawalloc);
+-  free(old_conn->socks_proxy.host.rawalloc);
+-  Curl_free_primary_ssl_config(&old_conn->proxy_ssl_config);
+-#endif
+-  /* free the SSL config struct from this connection struct as this was
+-     allocated in vain and is targeted for destruction */
+-  Curl_free_primary_ssl_config(&old_conn->ssl_config);
+ 
+   /* get the user+password information from the old_conn struct since it may
+    * be new for this request even when we re-use an existing connection */
+@@ -3539,20 +3528,17 @@ static void reuse_conn(struct Curl_easy *data,
+     old_conn->http_proxy.passwd = NULL;
+     old_conn->socks_proxy.passwd = NULL;
+   }
+-  Curl_safefree(old_conn->http_proxy.user);
+-  Curl_safefree(old_conn->socks_proxy.user);
+-  Curl_safefree(old_conn->http_proxy.passwd);
+-  Curl_safefree(old_conn->socks_proxy.passwd);
+ #endif
+ 
+-  /* host can change, when doing keepalive with a proxy or if the case is
+-     different this time etc */
+   Curl_free_idnconverted_hostname(&conn->host);
+   Curl_free_idnconverted_hostname(&conn->conn_to_host);
+   Curl_safefree(conn->host.rawalloc);
+   Curl_safefree(conn->conn_to_host.rawalloc);
+   conn->host = old_conn->host;
++  old_conn->host.rawalloc = NULL;
++  old_conn->host.encalloc = NULL;
+   conn->conn_to_host = old_conn->conn_to_host;
++  old_conn->conn_to_host.rawalloc = NULL;
+   conn->conn_to_port = old_conn->conn_to_port;
+   conn->remote_port = old_conn->remote_port;
+   Curl_safefree(conn->hostname_resolve);
+@@ -3572,15 +3558,7 @@ static void reuse_conn(struct Curl_easy *data,
+   /* re-use init */
+   conn->bits.reuse = TRUE; /* yes, we're re-using here */
+ 
+-  Curl_safefree(old_conn->user);
+-  Curl_safefree(old_conn->passwd);
+-  Curl_safefree(old_conn->options);
+-  Curl_safefree(old_conn->localdev);
+-  Curl_llist_destroy(&old_conn->easyq, NULL);
+-
+-#ifdef USE_UNIX_SOCKETS
+-  Curl_safefree(old_conn->unix_domain_socket);
+-#endif
++  conn_free(old_conn);
+ }
+ 
+ /**
+@@ -3930,10 +3908,6 @@ static CURLcode create_conn(struct Curl_easy *data,
+      * allocated before we can move along and use the previously existing one.
+      */
+     reuse_conn(data, conn, conn_temp);
+-#ifdef USE_SSL
+-    free(conn->ssl_extra);
+-#endif
+-    free(conn);          /* we don't need this anymore */
+     conn = conn_temp;
+     *in_connect = conn;
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index a613e93780..ba3abadac9 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -61,6 +61,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2024-7264_1.patch \
            file://CVE-2024-7264_2.patch \
            file://CVE-2024-8096.patch \
+           file://0001-url-free-old-conn-better-on-reuse.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


