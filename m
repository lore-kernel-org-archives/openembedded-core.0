Return-Path: <jason.stasiak@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F007CC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 16:12:45 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18133.1791994357576835436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 09:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pA/T/C9I;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: jason.stasiak@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1171139eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791994357; x=1792599157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mV8Dsm79UjSmL3f8YDP76bnQScpCWf/U8RehHSr8qFA=;
        b=pA/T/C9IJSKn8q0e3UA4yG4wr2EYibk0NSuUDaDWabiv/h+8snrUkEBy1/GATTfM5K
         GDE5lCQZFb9Os7JPuOhVUymtCxvtkjkO/MNTCVeiCOSBw6bkqMsiSQ8YTEIbl+Tz0EZc
         nx+UZY+7Q5FpDhCv+SWY+CsM9GVlvudyO+Erdyq6magGpJs2Q4PQB86CnhYneaMHIa6X
         RpxHAhnVUsK/83h1GuKJ0BA3uFY9DLD8dLNwCaowdDr2HGL8FMzGt9Mn6OpcKGKdReDc
         WYIUn/kypU1rEnrruY1hmgLCA0phHm3gg+ZpD7g+wj/c+3pI9xZiX7bv2GDb863fm0JZ
         kGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994357; x=1792599157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mV8Dsm79UjSmL3f8YDP76bnQScpCWf/U8RehHSr8qFA=;
        b=rvSnWIHibVvKeYrUHXqomepv08QLJzf/mxANmF8qhcg7zG4IPYfPZtCxTaVtzrc2dK
         +KdDv/rg6/hbcGEsbghRl6rIFbGKXl2aY7dpeBHy7AaJI2CXsqeJkGkb6cUlZ9KyjV9a
         ShecrKuoWBMPfwJqA5HDFYH9IdAActIr8tn0f4sPMx4A/g5C6PWqXroSMO3ylH1WoFi8
         ijZ7Qz5Rhcw/Gzmi2JwE9b+pU3bXGixh2bKFx+cGso+iNlPi3iU8S4BAueCseHDvSLsN
         f/bVufBEsOwlwlK3RvLX9adbz10RAq93bKs47GYRoxRbHCPxWTC3gQ3Q3dmUOJcU3LTS
         27cQ==
X-Gm-Message-State: AFq9FYKMAj0vgnkrQpGPAKRi7CljH18dlbrlsKGv91mK8cLnsa3eKeYj
	DJW1zj4X1/CrFaOdcQZwvP+NtNtzQz0Xso95h4cqJsmu7CwBKX7f4PRHzqvSdA==
X-Gm-Gg: AYBFou0pUN+ZpVog/B33oe6toNR68CmUKOH1DFgo2iFujMjDXOq2Gp6k/BV8zpxU0qn
	u+5xvMSdEJAm/+LwTUQ/uGiewoLf7c5CZc3kmzoxGWjQy7UgXG3SrJHXcL2F7ee4y2dyV/BXZaD
	jawU9QddLfJxkIg0nSixFqo1kNjttNCfPHqjidbQULCODG6c5pnhqqKszeXSBmmkIr/HuxmP7YD
	Ca320TRrdh9i7jr2iuS6+i4TrCw6vmxig7jPo1VYFn6NE6gd7I5XmotYkQyHoiSkNJZyikHMxVH
	hmqceWOvysaqhHIL9Qy6flVR6aD97CaN4rWbd5/gXDjwBFJvjkWX/qSkjffVEPgtTwg8VTH0zsq
	5YqCXiaex+2vwTdsp2BHyuwNQrV8KZKCNKYecNxaWNsOfqxiHok3unSJT0uCipnFjlUK2o9JV6P
	KjwqM1wP12aXCOT4jTKTULjeDEBftcSw43+Gc6s7WRfGFV9cdIi8SmzuJY01XjTfyyQreCOtO5Q
	u99tRUWo7xQf7hx+Yft
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id a92af1059eb24-1784ab70e5cmr10284602c88.37.1791994356509;
        Wed, 14 Oct 2026 09:12:36 -0700 (PDT)
Received: from CHA-FQKPM83.ad.garmin.com ([65.175.40.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35a352d4b05sm36006426eec.19.2026.10.14.09.12.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:12:35 -0700 (PDT)
From: Jason Stasiak <jason.stasiak@gmail.com>
X-Google-Original-From: Jason Stasiak <jason.stasiak@garmin.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 5/5] libsoup-2.4: fix CVE-2026-3633
Date: Wed, 14 Oct 2026 09:12:09 -0700
Message-ID: <20261014161209.2227316-5-jason.stasiak@garmin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014161209.2227316-1-jason.stasiak@garmin.com>
References: <20260929205055.2403390-2-jason.stasiak@gmail.com>
 <20261014161209.2227316-1-jason.stasiak@garmin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 16:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247787

Backport fix for CVE-2026-3633 [1] and additional supporting patches
[2][3][4] from the upstream libsoup 3 repo.

[1] https://gitlab.gnome.org/GNOME/libsoup/-/commit/7f2013d874f005035f2245e382ec82823a439926
[2] https://gitlab.gnome.org/GNOME/libsoup/-/commit/0120f183ca2b74abeee8439f73abc8ab504fbccf
[3] https://gitlab.gnome.org/GNOME/libsoup/-/commit/05910f8cb577682d444b0abaef670b4eb028e2fa
[4] https://gitlab.gnome.org/GNOME/libsoup/-/commit/a90c442df5f980dd9a8108c9def3b06607662fc8

Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
---
 .../libsoup/libsoup-2.4/CVE-2026-3633-1.patch |  51 ++++++++
 .../libsoup/libsoup-2.4/CVE-2026-3633-2.patch |  53 ++++++++
 .../libsoup/libsoup-2.4/CVE-2026-3633-3.patch |  49 ++++++++
 .../libsoup/libsoup-2.4/CVE-2026-3633-4.patch | 113 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   4 +
 5 files changed, 270 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-4.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-1.patch
new file mode 100644
index 0000000000..37eeb24409
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-1.patch
@@ -0,0 +1,51 @@
+From 5d61da4e261fab02d07dc74bb3049bbd13535247 Mon Sep 17 00:00:00 2001
+From: Jason Stasiak <jason.stasiak@garmin.com>
+Date: Fri, 25 Sep 2026 10:17:05 -0700
+Subject: [PATCH 1/4] CVE-2026-3633: Make SoupMessage a private and final type
+
+CVE: CVE-2026-3633
+Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/libsoup/-/commit/0120f183ca2b74abeee8439f73abc8ab504fbccf ]
+
+Backport the introduction of soup_message_set_method() from upstream
+libsoup 3 patch to begin alignment of libsoup 2.4 code with that needed
+to address CVE-2026-3633.
+
+Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
+---
+ libsoup/soup-message-private.h |  2 ++
+ libsoup/soup-message.c         | 10 ++++++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/libsoup/soup-message-private.h b/libsoup/soup-message-private.h
+index c30361c0..ee73112f 100644
+--- a/libsoup/soup-message-private.h
++++ b/libsoup/soup-message-private.h
+@@ -179,4 +179,6 @@ gboolean    soup_message_has_chunk_allocator (SoupMessage *msg);
+ SoupBuffer *soup_message_allocate_chunk      (SoupMessage *msg,
+ 					      goffset      read_length);
+ 
++void	soup_message_set_method (SoupMessage        *msg,
++		                         const char         *method);
+ #endif /* __SOUP_MESSAGE_PRIVATE_H__ */
+diff --git a/libsoup/soup-message.c b/libsoup/soup-message.c
+index cc4f22b6..eae11eea 100644
+--- a/libsoup/soup-message.c
++++ b/libsoup/soup-message.c
+@@ -2394,3 +2394,13 @@ soup_message_allocate_chunk (SoupMessage *msg,
+ 
+ 	return priv->chunk_allocator (msg, read_length, priv->chunk_allocator_data);
+ }
++
++
++void
++soup_message_set_method (SoupMessage *msg,
++                         const char  *method)
++{
++	g_return_if_fail (method != NULL);
++
++	msg->method = g_intern_string (method);
++}
+\ No newline at end of file
+-- 
+2.55.0
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-2.patch
new file mode 100644
index 0000000000..c98a26ee6a
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-2.patch
@@ -0,0 +1,53 @@
+From ef7fb85f6bda553c37f50606205396b1a3b363a7 Mon Sep 17 00:00:00 2001
+From: Jason Stasiak <jason.stasiak@garmin.com>
+Date: Fri, 25 Sep 2026 10:23:14 -0700
+Subject: [PATCH 2/4] CVE-2026-3633: message: ensure GObject::notify signal is
+ always emitted when properties change
+
+CVE: CVE-2026-3633
+Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/libsoup/-/commit/05910f8cb577682d444b0abaef670b4eb028e2fa ]
+
+Backport the following portions of the libsoup 3 patch to align
+libsoup 2.4 code with that needed to address CVE-2026-3633:
+- Calling of soup_message_set_property() within soup_message_set_method()
+  for a method property change
+- Update of soup_message_set_property() which triggers the GObject::notify
+  signal when the method property changes
+
+Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
+---
+ libsoup/soup-message.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/libsoup/soup-message.c b/libsoup/soup-message.c
+index eae11eea..ff8aaab5 100644
+--- a/libsoup/soup-message.c
++++ b/libsoup/soup-message.c
+@@ -205,7 +205,7 @@ soup_message_set_property (GObject *object, guint prop_id,
+ 
+ 	switch (prop_id) {
+ 	case PROP_METHOD:
+-		msg->method = g_intern_string (g_value_get_string (value));
++		soup_message_set_method (msg, g_value_get_string (value));
+ 		break;
+ 	case PROP_URI:
+ 		soup_message_set_uri (msg, g_value_get_boxed (value));
+@@ -2400,7 +2400,12 @@ void
+ soup_message_set_method (SoupMessage *msg,
+                          const char  *method)
+ {
+-	g_return_if_fail (method != NULL);
++	const char *new_method = g_intern_string (method);
+ 
+-	msg->method = g_intern_string (method);
++	if (msg->method == new_method)
++		return;
++
++	msg->method = new_method;
++
++	g_object_notify (G_OBJECT (msg), "method");
+ }
+\ No newline at end of file
+-- 
+2.55.0
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-3.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-3.patch
new file mode 100644
index 0000000000..825d7f0436
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-3.patch
@@ -0,0 +1,49 @@
+From ac0de649ae76b073c8c405f141e6509eb624ee89 Mon Sep 17 00:00:00 2001
+From: Jason Stasiak <jason.stasiak@garmin.com>
+Date: Fri, 25 Sep 2026 10:32:36 -0700
+Subject: [PATCH 3/4] CVE-2026-3633: message: make soup_message_set_method
+ public
+
+CVE: CVE-2026-3633
+Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/libsoup/-/commit/a90c442df5f980dd9a8108c9def3b06607662fc8 ]
+
+Backport the portion of the libsoup 3 patch that transitions
+soup_message_set_method() from being a private getter to a public
+getter to align the libsoup 2.4 code with that needed to address
+CVE-2026-3633.
+
+Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
+---
+ libsoup/soup-message-private.h | 2 --
+ libsoup/soup-message.h         | 4 ++++
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/soup-message-private.h b/libsoup/soup-message-private.h
+index ee73112f..c30361c0 100644
+--- a/libsoup/soup-message-private.h
++++ b/libsoup/soup-message-private.h
+@@ -179,6 +179,4 @@ gboolean    soup_message_has_chunk_allocator (SoupMessage *msg);
+ SoupBuffer *soup_message_allocate_chunk      (SoupMessage *msg,
+ 					      goffset      read_length);
+ 
+-void	soup_message_set_method (SoupMessage        *msg,
+-		                         const char         *method);
+ #endif /* __SOUP_MESSAGE_PRIVATE_H__ */
+diff --git a/libsoup/soup-message.h b/libsoup/soup-message.h
+index 42379a4b..18066d35 100644
+--- a/libsoup/soup-message.h
++++ b/libsoup/soup-message.h
+@@ -115,6 +115,10 @@ SoupHTTPVersion  soup_message_get_http_version    (SoupMessage       *msg);
+ SOUP_AVAILABLE_IN_2_4
+ gboolean         soup_message_is_keepalive        (SoupMessage       *msg);
+ 
++SOUP_AVAILABLE_IN_2_4
++void             soup_message_set_method          (SoupMessage        *msg,
++						   const char       *method);
++
+ SOUP_AVAILABLE_IN_2_4
+ SoupURI         *soup_message_get_uri             (SoupMessage       *msg);
+ SOUP_AVAILABLE_IN_2_4
+-- 
+2.55.0
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-4.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-4.patch
new file mode 100644
index 0000000000..471df33ec9
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-4.patch
@@ -0,0 +1,113 @@
+From bd9d3c8c6af2783fed2745834f6623a2df70f75d Mon Sep 17 00:00:00 2001
+From: Jason Stasiak <jason.stasiak@garmin.com>
+Date: Fri, 25 Sep 2026 10:39:16 -0700
+Subject: [PATCH 4/4] Fix CVE-2026-3633
+
+CVE: CVE-2026-3633
+Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/libsoup/-/commit/7f2013d874f005035f2245e382ec82823a439926 ]
+
+Backport the upstream libsoup 3 fix for CVE-2026-3633 to
+libsoup 2.4.
+
+Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
+---
+ libsoup/soup-message.c | 32 ++++++++++++++++++++++++++++++--
+ tests/misc-test.c      | 22 ++++++++++++++++++++++
+ 2 files changed, 52 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/soup-message.c b/libsoup/soup-message.c
+index ff8aaab5..08f22c19 100644
+--- a/libsoup/soup-message.c
++++ b/libsoup/soup-message.c
+@@ -2395,17 +2395,45 @@ soup_message_allocate_chunk (SoupMessage *msg,
+ 	return priv->chunk_allocator (msg, read_length, priv->chunk_allocator_data);
+ }
+ 
++/* Validates that a method string conforms to the RFC 9110 'token' specification. */
++static gboolean
++method_is_valid (const char *method)
++{
++	const char *p;
++
++	if (method == NULL || *method == '\0')
++		return FALSE;
++
++	for (p = method; *p != '\0'; p++) {
++	char c = *p;
++
++	if (g_ascii_isalnum (c))
++		continue;
++
++	if (strchr ("!#$%&\'*+-.^_`|~", c) == NULL)
++		return FALSE;
++	}
++
++	return TRUE;
++}
+ 
+ void
+ soup_message_set_method (SoupMessage *msg,
+                          const char  *method)
+ {
+-	const char *new_method = g_intern_string (method);
++	const char *new_method;
++
++	g_return_if_fail (method != NULL);
+ 
++	if (!method_is_valid (method)) {
++		g_warning ("soup_message_set_method: Rejecting invalid method '%s'", method);
++		return;
++	}
++
++	new_method = g_intern_string (method);
+ 	if (msg->method == new_method)
+ 		return;
+ 
+ 	msg->method = new_method;
+-
+ 	g_object_notify (G_OBJECT (msg), "method");
+ }
+\ No newline at end of file
+diff --git a/tests/misc-test.c b/tests/misc-test.c
+index 0f9b0d33..afb7bb30 100644
+--- a/tests/misc-test.c
++++ b/tests/misc-test.c
+@@ -89,6 +89,27 @@ server_callback (SoupServer *server, SoupMessage *msg,
+ 	}
+ }
+ 
++static void
++do_method_injection_test (void)
++{
++	SoupMessage *msg;
++
++	g_test_expect_message ("libsoup", G_LOG_LEVEL_WARNING,
++	                       "soup_message_set_method: Rejecting invalid method*");
++	msg = soup_message_new_from_uri ("GET / HTTP/1.1\r\nX-Injected: evil", base_uri);
++	g_assert_null (msg->method);
++	g_test_assert_expected_messages ();
++	g_object_unref (msg);
++
++	g_test_expect_message ("libsoup", G_LOG_LEVEL_WARNING,
++	                       "soup_message_set_method: Rejecting invalid method*");
++	msg = soup_message_new_from_uri (SOUP_METHOD_GET, base_uri);
++	soup_message_set_method (msg, "POST /evil HTTP/1.1\r\nHost: attacker\r\n\r\nGET");
++	g_assert_cmpstr (msg->method, ==, SOUP_METHOD_GET);
++	g_test_assert_expected_messages ();
++	g_object_unref (msg);
++}
++
+ /* Host header handling: client must be able to override the default
+  * value, server must be able to recognize different Host values.
+  */
+@@ -1276,6 +1297,7 @@ main (int argc, char **argv)
+ 
+ 	g_test_add_func ("/misc/bigheader", do_host_big_header);
+ 	g_test_add_func ("/misc/host", do_host_test);
++	g_test_add_func ("/misc/method-injection", do_method_injection_test);
+ 	g_test_add_func ("/misc/callback-unref/msg", do_callback_unref_test);
+ 	g_test_add_func ("/misc/callback-unref/req", do_callback_unref_req_test);
+ 	g_test_add_func ("/misc/msg-reuse", do_msg_reuse_test);
+-- 
+2.55.0
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index c79bced69d..19a2d96b91 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -45,6 +45,10 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2026-1801.patch \
            file://CVE-2026-2443.patch \
            file://CVE-2026-5119.patch \
+           file://CVE-2026-3633-1.patch \
+           file://CVE-2026-3633-2.patch \
+           file://CVE-2026-3633-3.patch \
+           file://CVE-2026-3633-4.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.55.0


