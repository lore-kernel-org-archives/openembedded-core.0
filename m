Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73481C05024
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:07:21 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.19021.1713269232631489985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 05:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bgozIaY/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ee12766586so2836806b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 05:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713269232; x=1713874032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+9bbveoC7rSTTHlajzrvbTrsN7fVUcbo++vCDvghQc=;
        b=bgozIaY/SHcJQ2vk1eDy7MHzveDsP0k/xXD+fDDF239IHbnqbGaijKoi+J3vdkY9Ey
         1lZHSa7QmvB70F64h87INazC2V60Zqb0iiC3nBAoNoUx/I4aT5yd8B2vO40aJbM4/8jJ
         elXzhMBZTOGyoGEG4DPHFNYHwyd3vVkDwZFDU6V8puCjCJ0GBFA9+QqZwV35gsrcEa1k
         xbLv1OxjTB3ZNqMHokYSlHb8nTs6j/ydwLbpSxecgZmxZ0IpMK2AH2xQxHo1JhIXMIcT
         sLafSvgpfboLY2aSRbUMjFckspmLk1Xw4KBRULhGjNjpv4I+rLCEGU9sm4YUptNJfU9i
         cioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713269232; x=1713874032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+9bbveoC7rSTTHlajzrvbTrsN7fVUcbo++vCDvghQc=;
        b=Nmu7j4yo2uVlzNbRBxH1fOd/qO5++HkQqDsiPHDTGXl/gAYpMO4RJwpH5dGIJsZAcP
         cKwcMvp2CD3tIu+CtVM/RHP0U83qbolm5DPoSnnMP8zGa3fHG0y4OHrNNxylb8LjTjiu
         1uiIMCvxbYZyECXqePqRG/hYpu+LH9cyszn88JjYvOZix8OS4W2cVC2eaZ+jiTyshspo
         NcCmDkshuEfM3W4i6Mj5eXhAHk3+ARZlQU2qfR0HM8wjHJ5b+KGTqCcfB8hQjiBa4Wy9
         sXj/Zl9j0l0AYCwvCYGGqXOBcAZThgHKc3Lv938Wc6+4/Ebst0P6cKF31hoGhi0A+iLS
         Kyrw==
X-Gm-Message-State: AOJu0YyMvu8bHBRzk9te8nI77M111Vz/+umwWT2t53hmTEZlyFptCjvJ
	0cTK5/MqHx3HvpaqCscn/ayZocxn0+E7Eu0XdxX9m5VU7/qYd57oWBrbBC6vyq0x7lGy1OVcZet
	Pgf4=
X-Google-Smtp-Source: AGHT+IE3G96olE57nF8Eu/kfvp1fVTEE7Yn4VZH9apSVJaKXN43crFNLnLiAQYszK3Xbpif2lHrbvw==
X-Received: by 2002:a05:6a21:3e05:b0:1a9:11e5:2915 with SMTP id bk5-20020a056a213e0500b001a911e52915mr2456356pzc.27.1713269231846;
        Tue, 16 Apr 2024 05:07:11 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id j5-20020aa78d05000000b006edd9339917sm8746111pfe.58.2024.04.16.05.07.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:07:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/10] openssl: patch CVE-2024-2511
Date: Tue, 16 Apr 2024 05:06:52 -0700
Message-Id: <42fc40198dfcbb5e96d7f2af7fc134e2b021d82a.1713268959.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713268959.git.steve@sakoman.com>
References: <cover.1713268959.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198442

From: Peter Marko <peter.marko@siemens.com>

Patch: https://github.com/openssl/openssl/commit/b52867a9f618bb955bed2a3ce3db4d4f97ed8e5d
News: https://github.com/openssl/openssl/commit/daee101e39073d4b65a68faeb2f2de5ad7b05c36

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2024-2511.patch       | 122 ++++++++++++++++++
 .../openssl/openssl_3.0.13.bb                 |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
new file mode 100644
index 0000000000..8aea686205
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
@@ -0,0 +1,122 @@
+From b52867a9f618bb955bed2a3ce3db4d4f97ed8e5d Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Tue, 5 Mar 2024 15:43:53 +0000
+Subject: [PATCH] Fix unconstrained session cache growth in TLSv1.3
+
+In TLSv1.3 we create a new session object for each ticket that we send.
+We do this by duplicating the original session. If SSL_OP_NO_TICKET is in
+use then the new session will be added to the session cache. However, if
+early data is not in use (and therefore anti-replay protection is being
+used), then multiple threads could be resuming from the same session
+simultaneously. If this happens and a problem occurs on one of the threads,
+then the original session object could be marked as not_resumable. When we
+duplicate the session object this not_resumable status gets copied into the
+new session object. The new session object is then added to the session
+cache even though it is not_resumable.
+
+Subsequently, another bug means that the session_id_length is set to 0 for
+sessions that are marked as not_resumable - even though that session is
+still in the cache. Once this happens the session can never be removed from
+the cache. When that object gets to be the session cache tail object the
+cache never shrinks again and grows indefinitely.
+
+CVE-2024-2511
+
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/24044)
+
+(cherry picked from commit 7e4d731b1c07201ad9374c1cd9ac5263bdf35bce)
+
+CVE: CVE-2024-2511
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/b52867a9f618bb955bed2a3ce3db4d4f97ed8e5d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ssl/ssl_lib.c            |  5 +++--
+ ssl/ssl_sess.c           | 28 ++++++++++++++++++++++------
+ ssl/statem/statem_srvr.c |  5 ++---
+ 3 files changed, 27 insertions(+), 11 deletions(-)
+
+diff --git a/ssl/ssl_lib.c b/ssl/ssl_lib.c
+index 2c8479eb5fc69..eed649c6fdee9 100644
+--- a/ssl/ssl_lib.c
++++ b/ssl/ssl_lib.c
+@@ -3736,9 +3736,10 @@ void ssl_update_cache(SSL *s, int mode)
+ 
+     /*
+      * If the session_id_length is 0, we are not supposed to cache it, and it
+-     * would be rather hard to do anyway :-)
++     * would be rather hard to do anyway :-). Also if the session has already
++     * been marked as not_resumable we should not cache it for later reuse.
+      */
+-    if (s->session->session_id_length == 0)
++    if (s->session->session_id_length == 0 || s->session->not_resumable)
+         return;
+ 
+     /*
+diff --git a/ssl/ssl_sess.c b/ssl/ssl_sess.c
+index d836b33ed0e81..75adbd9e52b40 100644
+--- a/ssl/ssl_sess.c
++++ b/ssl/ssl_sess.c
+@@ -152,16 +152,11 @@ SSL_SESSION *SSL_SESSION_new(void)
+     return ss;
+ }
+ 
+-SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)
+-{
+-    return ssl_session_dup(src, 1);
+-}
+-
+ /*
+  * Create a new SSL_SESSION and duplicate the contents of |src| into it. If
+  * ticket == 0 then no ticket information is duplicated, otherwise it is.
+  */
+-SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
++static SSL_SESSION *ssl_session_dup_intern(const SSL_SESSION *src, int ticket)
+ {
+     SSL_SESSION *dest;
+ 
+@@ -285,6 +280,27 @@ SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
+     return NULL;
+ }
+ 
++SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)
++{
++    return ssl_session_dup_intern(src, 1);
++}
++
++/*
++ * Used internally when duplicating a session which might be already shared.
++ * We will have resumed the original session. Subsequently we might have marked
++ * it as non-resumable (e.g. in another thread) - but this copy should be ok to
++ * resume from.
++ */
++SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
++{
++    SSL_SESSION *sess = ssl_session_dup_intern(src, ticket);
++
++    if (sess != NULL)
++        sess->not_resumable = 0;
++
++    return sess;
++}
++
+ const unsigned char *SSL_SESSION_get_id(const SSL_SESSION *s, unsigned int *len)
+ {
+     if (len)
+diff --git a/ssl/statem/statem_srvr.c b/ssl/statem/statem_srvr.c
+index a9e67f9d32a77..6c942e6bcec29 100644
+--- a/ssl/statem/statem_srvr.c
++++ b/ssl/statem/statem_srvr.c
+@@ -2338,9 +2338,8 @@ int tls_construct_server_hello(SSL *s, WPACKET *pkt)
+      * so the following won't overwrite an ID that we're supposed
+      * to send back.
+      */
+-    if (s->session->not_resumable ||
+-        (!(s->ctx->session_cache_mode & SSL_SESS_CACHE_SERVER)
+-         && !s->hit))
++    if (!(s->ctx->session_cache_mode & SSL_SESS_CACHE_SERVER)
++            && !s->hit)
+         s->session->session_id_length = 0;
+ 
+     if (usetls13) {
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
index 5e43fdc2de..3b253ddde0 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://CVE-2024-2511.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


