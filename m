Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FE8C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 09:54:28 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.18359.1754646865239314910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 02:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PBf/+Fq2;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so3574382a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 02:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754646864; x=1755251664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BY0FPi5H1KH7Y5W+nXAGtip153yxgv5yrw4e3zHYfZo=;
        b=PBf/+Fq2FUL15OjejFduD8ZL+1hM9sKw4s328BS/xiqb5uJIn3yaRJjQPXIqVyocL/
         7Ka7asn8hKX5/U7mMwAY/qu9twCyLQxCRV7+ij9q9IKAU6VtJAKWMXvsWgkHIuKiRbPN
         Jev5oRuz9BqHua4XwxaYypsIHu6VJHCz3YzdExSNjXhjUAcXcQ8koZx/6i9JbtmRbX/E
         YBRsqqU7YXmWQAz/i4i+RujOhZXrjoDPvQYm20/Hxwhggdp3tFMRBXcMjAKOju1Po/ZY
         uFgJTg6tw7YEq1HlDV/AD+lU/kRP3aorElWrIIbFeoB/2NaKZhbWZcSVxTXx3XKjsIi2
         g+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754646864; x=1755251664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BY0FPi5H1KH7Y5W+nXAGtip153yxgv5yrw4e3zHYfZo=;
        b=GASxVF7XlkZtQhRv8eyIdy6hbPRrLA/Dx932dW+u5qEDU9S5Gq4PWC4nabtQW2AZxa
         ccwAWSstXQcsSokFHBEtsw/BeEQMjInMMkyJ0qN8ZxrAl01kp30c/MiCklNjJqMJ1ICK
         bt1zCZPkqiRhysi2D2/0MhdUmjNBdslc3D+RNUedvsBhpVi2T7w7igJq1Pe2Aisc6/Dk
         ZbrWr6Iv3WpoBoadrMYzHhe0wXuCwZjlJHVjoA/vdZplyb4Chxh+N1AJp/Xc9iWV3fer
         8ZKdu6XFDDmDU2DBHQUsxsC1SPRCdkcvIfENQJxEMH+GJJMzfAUth52+oln6QJCatH92
         XNug==
X-Gm-Message-State: AOJu0YxLxRSBgDcmnNlSF5JBjdIEssMeJcI5D5AZ5+30iLX68XrGN4F+
	ohXeoD6FxWsquq1Hs3JBNoK9eWzKeYgDmUuAB+fi5i0KGhkwamkrYE1HhyjtWA==
X-Gm-Gg: ASbGncvF/givKvhPZaRfWdeE7gi+oszDt4Gyt1z6tVW478IIBQBygUepG4JAxL51q4I
	D2N8OUPSPnhAVHo33AZuf1+4ZJomy1Ad6EJ6AmMiv2vrALW2LDZCz1Czpz+Vvejl4tSbR0J0PTN
	055gZJ7v7el1/sTVwXxysrfTvCJnYD+EXRol4SCm4Q2+qH3mg3ve23cgFz1JQa6MuA159CKbTRd
	ZZoG7y8UhK00WwBDvI219CLieY8fHVBGMxavhdv/UrXIwDa0D4DLH9f64ciuOKxBXaavdOEEqXi
	RP/w85HRIwAgKyhTD7AiKLIrD8MRQmX0VZWh8ng41w7zi+MAQP4DgZbfaSTxkzpIQaekh+APuk9
	g/2Rrieyex62s3X0EAQs=
X-Google-Smtp-Source: AGHT+IEXkHBcaB1cdBeqr6/ytmGP4Ih6+4j/I0g8P96ASnQcpbPGm3zUXbFgf2fBsQwDhT+anZW8pQ==
X-Received: by 2002:a05:6402:2688:b0:604:5cae:4031 with SMTP id 4fb4d7f45d1cf-617e2e7feefmr1897824a12.28.1754646863260;
        Fri, 08 Aug 2025 02:54:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615cc38aeccsm11719676a12.2.2025.08.08.02.54.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 02:54:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-networking: upgrade 2.80.0 -> 2.80.1
Date: Fri,  8 Aug 2025 11:54:21 +0200
Message-ID: <20250808095421.1472405-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 09:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221645

eagain.patch is dropped, as it is included in this release.

Changelog:
 - OpenSSL: fix crash in complete_handshake (!251, Dario Saccavino)
 - OpenSSL: fix invalid free in openssl_get_binding_tls_server_end_point() (!255)
 - TLS test should handle G_IO_ERROR_WOULD_BLOCK (!253, Richard Purdie and Alexander Kanavin)
 - Updated translations

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../glib-networking/eagain.patch              | 36 -------------------
 ...ng_2.80.0.bb => glib-networking_2.80.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta/recipes-core/glib-networking/glib-networking/eagain.patch
 rename meta/recipes-core/glib-networking/{glib-networking_2.80.0.bb => glib-networking_2.80.1.bb} (94%)

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
deleted file mode 100644
index 98974aa4e7..0000000000
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From f917ef5579257007bc02850e79769fe5ec48b2b7 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Sat, 6 May 2023 12:18:50 +0100
-Subject: [PATCH] In autobuilder testing we regularly see glib-networking ptest
- fail with:
-
-GLib-Net:ERROR:/usr/src/debug/glib-networking/2.74.0-r0/tls/tests/connection.c:1944:simul_read_thread: assertion failed (error == NULL): Resource temporarily unavailable (g-io-error-quark, 27)
-Bail out! GLib-Net:ERROR:/usr/src/debug/glib-networking/2.74.0-r0/tls/tests/connection.c:1944:simul_read_thread: assertion failed (error == NULL): Resource temporarily unavailable (g-io-error-quark, 27)
-FAIL: glib-networking/connection-openssl.test (Child process killed by signal 6)
-SUMMARY: total=4; passed=3; skipped=0; failed=1; user=0.9s; system=0.4s; maxrss=10708
-FAIL: glib-networking/connection-openssl.test (Child process killed by signal 6)
-
-The test should probably retry in this situation so test a patch which does this.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib-networking/-/merge_requests/253]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- tls/tests/connection.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/tls/tests/connection.c b/tls/tests/connection.c
-index 62a7fbb..3447c80 100644
---- a/tls/tests/connection.c
-+++ b/tls/tests/connection.c
-@@ -2210,6 +2210,10 @@ simul_read_thread (gpointer user_data)
-                                    test->buf + test->nread,
-                                    MIN (TEST_DATA_LENGTH / 2, TEST_DATA_LENGTH - test->nread),
-                                    NULL, &error);
-+
-+      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_WOULD_BLOCK))
-+          continue;
-+
-       g_assert_no_error (error);
- 
-       test->nread += nread;
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
similarity index 94%
rename from meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
index b080285b6e..a4396af39b 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "d8f4f1aab213179ae3351617b59dab5de6bcc9e785021eee178998ebd4bb3acf"
+SRC_URI[archive.sha256sum] = "b80e2874157cd55071f1b6710fa0b911d5ac5de106a9ee2a4c9c7bee61782f8e"
 
 # Upstream note that for the openssl backend, half the tests where this backend don't return
 # the expected error code or don't work as expected so default to gnutls
@@ -30,7 +30,6 @@ PACKAGECONFIG[gnomeproxy] = "-Dgnome_proxy=enabled,-Dgnome_proxy=disabled,gsetti
 inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
 SRC_URI += "file://run-ptest"
-SRC_URI += "file://eagain.patch"
 
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \

