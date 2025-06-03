Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46CBC5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:46:56 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.6639.1748940410096237787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BOMRIjej;
 spf=pass (domain: mvista.com, ip: 209.85.215.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2c384b2945so4189071a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1748940409; x=1749545209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wjLFKUWROIRvC7/fXUyez2HUlNt9skhjfOvF6eo90o=;
        b=BOMRIjej46bvy6TrfeY3fCfAMMAig869AhN1bPpV9JvPjVJtPLdtEbtR+NOWNakwc5
         6utGWPFyXNYHuyviB5qoO64IixVBdy7OYRYy+/9KiQNPUcIKdkXIcAACfFx1aXUWT3Ha
         /79XFXigfgPQD6dZ4kpGlau+3OutCveLW5bwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748940409; x=1749545209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wjLFKUWROIRvC7/fXUyez2HUlNt9skhjfOvF6eo90o=;
        b=LHVtx7iDvWRrrfBgaWvLWC5/AdtFIjaxABj3xvZsSqNYlPnH41Iph2DixBr8Xnb9G4
         pVcGuUkzVigXHrCBuIbP6zaTSMNkYRZ54tUVmDVWHxKv7fxCBksluZk8Wg4eyhtXl7Gv
         8avyaPXPj5DUdjq8wwpIp63qojPNeeXm/Z2eeS03NHJOuVqpzNjzfNocAvjWHeExluF6
         ospFrKXCIFd9viLCJRH/MuC3eqOrTxtI4aE9Dezhd15TWLHHiTQhRM+c2H53fCxF689Q
         LBNe9xJs94Fc33JqVSYxxt7JFYooqyExgC0wlAJKmsJ7UQQoSsNbnq7PAomP2H0J9Z3f
         aRiQ==
X-Gm-Message-State: AOJu0YyJDByABoMm5A+5h8YZEU+ovPzkMy6PmTE/rB1lkvTGUbV8DJHn
	59fvM/lKgi/j2Jpxn4f2R3a/reqcEwsuJm+zPLaFI2IrlJtZk1KN3A6fJda5UadG5sGh8Ivly3b
	S+1v7kv0=
X-Gm-Gg: ASbGncsoFSv9N3NqzmsMUW4RDB9oymyMtCBj2T4MAtviZCiAZUE8qUdUWRZ6HxJA0lt
	1zyDuIlZi5dD/GDv9DomFSLaOSKevwHiCIVXfK6rIdfpAbQUdf8eOtr5ywyfDksYxyEmzJg6Wib
	y4tUIA1uTgUHIqfZ/FHMigsWat9clOaBMlN4xHxj7URB/Ak0CuKqZCcnXG4O53pKyzuotO8XgIf
	vmVO15+K+Cik3BT8ytpxzcZDVwDB9j7uirArGLxXMJxtuviF3SdQ2Asb+x0Wd69hkfpch+bs12K
	gPZEvRGaDhQ6a6lI1ul742SIULv7Dx/yHKAYmonthZHRBPZm37Iy3vGepTyd7g==
X-Google-Smtp-Source: AGHT+IF2bkJqWsZ0lDqJuTQc2lc75vgbS1V1agINuvznDQYyi7iq9a5i5qsmuqjCFFW0b8ds9xBCIg==
X-Received: by 2002:a17:90b:17c3:b0:312:1c83:58e7 with SMTP id 98e67ed59e1d1-3127c6a9c1fmr15693960a91.1.1748940408704;
        Tue, 03 Jun 2025 01:46:48 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.192.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd9650sm83612375ad.127.2025.06.03.01.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 01:46:47 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libsoup-2.4: Backport auth tests for CVE-2025-32910
Date: Tue,  3 Jun 2025 14:16:38 +0530
Message-Id: <20250603084638.29934-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 08:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217784

From: Vijay Anusuri <vanusuri@mvista.com>

libsoup-2.74.2/tests/auth-test.c:1554:39: error: unknown type name 'SoupServerMessage'; did you mean 'SoupServerClass'?

Fix auth-test.c compilation failure caused by CVE-2025-32910 patch

Link: https://gitlab.gnome.org/GNOME/libsoup/-/commit/9af7d0fc751f7afcd8b03bc827a4d3af0c4556f8

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


