Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB845C71130
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:38:39 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.95884.1749584313532804057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z4F3zhNu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742c46611b6so7410033b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584313; x=1750189113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9pkqILmneTRVudU3G+pjLKGvOiuRA/0W/YmLZubtDY=;
        b=z4F3zhNuDSdt/zRWrDrQFv0L6GCtTCjVYW2/Qwx1G9F6AJhwhR96A1+k8+k8NKeYSY
         XzyuDQmboaPLiNSv/LbFS1RE3/o0A3iUvQ5UrI5ySWRcfloDkxPnt3x0n4+Evdi8+vDj
         r3N1il/79Ppow/DAPg3kph7ZkmNY6dOOsex3QtdDC07quOFM4JzVEZvxPdtqB9BsMryE
         lPAtMPVmkxqa8PJffWWxEG8MlxI+JjucforSdrnzsbXJeS1yjcs/TiW5uLU1MJpti+5b
         grwtJkfCeBGsCSOVRkF1H8T5iQz7SzXGQUw41/ZA0gOt1ejBgH+qTTpwZsX9JXtOvFWv
         KZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584313; x=1750189113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9pkqILmneTRVudU3G+pjLKGvOiuRA/0W/YmLZubtDY=;
        b=mPTZbq6897xlIIEeOP6pVjbPQL9c7VpkNEtnbdQgeA6P8R1f0mc7tCu3L1L/Z4krab
         8MhfQc6sLGh8Wi9MIl2IExKyI8d4hMjWcjk7pxn8Kv098VHETvPksqBtoFA/TkATJAUX
         PX7Ok4btto5pM41KlAcCSiel0SHCFW3rowg/Fmq0ear0iDpjq0OzIIyi9orJUEpe7Arz
         PpcYtEAjpZEpHhbebwqQPeU1uQqC7bbfprUcAnpCRJ261WSJk4nnv/dR02Wl8H3S3Tn3
         QtRVJoD+UBj3WRflrZMgs+MKw3uPtpzypaUIMRs+WCBmBFSGt9W/svcvz7le1yN/Qu9f
         SSHA==
X-Gm-Message-State: AOJu0YwLgYKU7TNKEHQLfkHbohWy6q7Z1QPADuTbsGYcGAvJeDLbQ0u5
	hn2nyjE+4cH1VXFpYvgtOvQfxzuYWSrtfHi+oJT4tZVkfwwvOZ+3dOGV76FVPhCv88H5RGEpgy0
	Gv8/f
X-Gm-Gg: ASbGnctu3Hf6j2GPrLTiQdoZywVlMnKhVVnWtiy9Ps3YQ58D9vA+3I6olAZ5vlyEos+
	Mi5RZSxPFnbjI8HJl3Id6ZUs1ke6ziXw57SMdPonYteecK5CFMlk+FVAxRpp7qdlQa9dHDC7deR
	aOGxV3zmAfAgqiHZMSRe+4JS8DmDUweKXpLVL7Gz8l3aO/oygOQWrsoqXpL9zyJAeH714F+8DjP
	+rv6A93D5azEvN8+fsDwH7h8pPg9Mi9pvGlFRZuWn0LdenXl0m+xugR1j6+NnSc99MLLIpbDePw
	cR1uR0s1V44gcQqGOuPE7QhONUnau2qM9Xljk8c1Ut2vsCEQAT6hWA==
X-Google-Smtp-Source: AGHT+IHXDObIiIkTKEdXPPbcVGL7jj0HCkdVY4UYkP/Vf1m0U0msx4pgBRbk7ANQyDnj6tekdBfK6Q==
X-Received: by 2002:a05:6a21:8cca:b0:20b:a75e:fa32 with SMTP id adf61e73a8af0-21f89129cbdmr15074637.40.1749584312710;
        Tue, 10 Jun 2025 12:38:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/15] libsoup-2.4: Backport auth tests for CVE-2025-32910
Date: Tue, 10 Jun 2025 12:38:09 -0700
Message-ID: <05d14768b5edf41c89b05725e06fd86b5376e6fd.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218425

From: Vijay Anusuri <vanusuri@mvista.com>

libsoup-2.74.2/tests/auth-test.c:1554:39: error: unknown type name 'SoupServerMessage'; did you mean 'SoupServerClass'?

Fix auth-test.c compilation failure caused by CVE-2025-32910 patch

Link: https://gitlab.gnome.org/GNOME/libsoup/-/commit/9af7d0fc751f7afcd8b03bc827a4d3af0c4556f8

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ckport-auth-tests-for-CVE-2025-32910.patch | 76 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/Backport-auth-tests-for-CVE-2025-32910.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/Backport-auth-tests-for-CVE-2025-32910.patch b/meta/recipes-support/libsoup/libsoup-2.4/Backport-auth-tests-for-CVE-2025-32910.patch
new file mode 100644
index 0000000000..2c23f57ccf
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/Backport-auth-tests-for-CVE-2025-32910.patch
@@ -0,0 +1,76 @@
+From: Andreas Henriksson <andreas@fatal.se>
+Date: Sat, 26 Apr 2025 20:09:29 +0200
+Subject: Backport auth tests for CVE-2025-32910
+
+Upstream-Status: Backport [import from debian https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/patches/Backport-auth-tests-for-CVE-2025-32910.patch?ref_type=heads
+Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/9af7d0fc751f7afcd8b03bc827a4d3af0c4556f8]
+CVE: CVE-2025-32910
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tests/auth-test.c | 28 ++++++++++++++++++++--------
+ 1 file changed, 20 insertions(+), 8 deletions(-)
+
+diff --git a/tests/auth-test.c b/tests/auth-test.c
+index 548ac94..f582033 100644
+--- a/tests/auth-test.c
++++ b/tests/auth-test.c
+@@ -1549,14 +1549,26 @@ do_cancel_after_retry_test (void)
+         soup_test_session_abort_unref (session);
+ }
+ 
++//from upstream commit 9af7d0fc751f7afcd8b03bc827a4d3af0c4556f8
++static gboolean
++on_digest_authenticate (SoupMessage *msg,
++                        SoupAuth    *auth,
++                        gboolean     retrying,
++                        gpointer     user_data)
++{
++        g_assert_false (retrying);
++        soup_auth_authenticate (auth, "user", "good");
++        return TRUE;
++}
++
+ static void
+ on_request_read_for_missing_params (SoupServer        *server,
+-                                      SoupServerMessage *msg,
++                                      SoupMessage *msg,
++                                      SoupClientContext *client,
+                                       gpointer           user_data)
+ {
+         const char *auth_header = user_data;
+-        SoupMessageHeaders *response_headers = soup_server_message_get_response_headers (msg);
+-        soup_message_headers_replace (response_headers, "WWW-Authenticate", auth_header);
++        soup_message_headers_replace (msg->response_headers, "WWW-Authenticate", auth_header);
+ }
+ 
+ static void
+@@ -1567,7 +1579,7 @@ do_missing_params_test (gconstpointer auth_header)
+         SoupServer *server;
+         SoupAuthDomain *digest_auth_domain;
+         gint status;
+-        GUri *uri;
++        SoupURI *uri;
+ 
+         server = soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD);
+ 	soup_server_add_handler (server, NULL,
+@@ -1586,16 +1598,16 @@ do_missing_params_test (gconstpointer auth_header)
+                           G_CALLBACK (on_request_read_for_missing_params),
+                           (gpointer)auth_header);
+ 
+-        session = soup_test_session_new (NULL);
++        session = soup_test_session_new (SOUP_TYPE_SESSION_ASYNC, NULL);
+         msg = soup_message_new_from_uri ("GET", uri);
+-        g_signal_connect (msg, "authenticate",
++        g_signal_connect (session, "authenticate",
+                           G_CALLBACK (on_digest_authenticate),
+                           NULL);
+ 
+-        status = soup_test_session_send_message (session, msg);
++        status = soup_session_send_message (session, msg);
+ 
+         g_assert_cmpint (status, ==, SOUP_STATUS_UNAUTHORIZED);
+-	g_uri_unref (uri);
++	soup_uri_free (uri);
+ 	soup_test_server_quit_unref (server);
+ }
+ 
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 46b9e10ac5..bb15e8b926 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32910-1.patch \
            file://CVE-2025-32910-2.patch \
            file://CVE-2025-32910-3.patch \
+           file://Backport-auth-tests-for-CVE-2025-32910.patch \
            file://CVE-2025-32911_CVE-2025-32913-1.patch \
            file://CVE-2025-32911_CVE-2025-32913-2.patch \
            file://CVE-2025-32912-1.patch \
-- 
2.43.0


