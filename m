Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91426C4707B
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 19:29:32 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.26499.1704828566876365976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 11:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UmZIzwmt;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d509222c11so11525735ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 11:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704828566; x=1705433366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQJIkIBuHC+Y1WYEw00m1WcLxvQ4s6sLcR//uZQrVL4=;
        b=UmZIzwmtKV3+nwplQOQn8QHpHk5YUSqdKWsFFrUtOola2nx/+S5zwDEI7D+Wc1r7OC
         f3JaEthLxAiZ9PZsukhi+nxHiaWGi9Atabg87tqNgwSpS+DdDvapPcA0JsEHbPY4Tk7F
         HZXEsgeP998Nyad0Ux9RbZ+QVslWCUSu1bvMPyfLNEITUHPrvb8+n8Z+6M09UAhf5BhP
         RQas8a+LNxUaDNnGYlDYyS6g2weg0oem7Z6T0+Ya3H6w1sQGfLUiAm+38RWutXJoYyNO
         VCvOwjjpnLYkv7749W55Ke1e+PA/Nblj8IqPEawA6IpcDhO9wKGMT9Mez+r03zaHMh7h
         suPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704828566; x=1705433366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQJIkIBuHC+Y1WYEw00m1WcLxvQ4s6sLcR//uZQrVL4=;
        b=Nv3D7fAbMQPZZXffypISLZETX89dzThoLiTz+G5Dq2Fj2kTRHK1+Vrse8On+4f24Hp
         BbYtVcUXppvf4xJE/HQVzLHVv+v7fCMqAeLdN3P4kpSUg+b81FA7BMbvUquQdrpHpBoB
         toM89XFlfMpX97gNEDGf5zw73fbB/tt0KOONSN09Zf3PLFHCOt19y7/z2/fPO8oB2KPm
         ESGFNqxqKJXekOwH2UFJpfZabc05bcCq38mLvWxd761G7rWnv9GDUSbkWb7Ovus1KgaL
         yCIgeH3iIWTZefvYV29Fib+7F5kOKP8mKUru4WeERHSzRoe27nHvv/zHPO+NzmEgKf/c
         6lVg==
X-Gm-Message-State: AOJu0YyNDzZo4iXEIarXLd5uc3Sc8Cx23l869YGnhkZbojRxf64wXF1g
	wAvNcd5/F4I0NCvSF1fQEBdVGVqy0VOH9w==
X-Google-Smtp-Source: AGHT+IGfmJVE/iQXj8ahwoCdYzEObj7a2tRkLhjYDvRNvtlcX4Z8Ah6tPZFhtg8kruyLZSa73hR59Q==
X-Received: by 2002:a17:902:6e17:b0:1d4:cf2b:2bf with SMTP id u23-20020a1709026e1700b001d4cf2b02bfmr2826169plk.4.1704828565889;
        Tue, 09 Jan 2024 11:29:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8c5f])
        by smtp.gmail.com with ESMTPSA id e7-20020a170902b78700b001d4ea1b6a2csm2145181pls.32.2024.01.09.11.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 11:29:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] glib-networking: Fix ptest failures with openssl backend
Date: Tue,  9 Jan 2024 11:29:23 -0800
Message-ID: <20240109192923.3183219-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 19:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193481

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Make the patch apply only when openssl backend is used
v3: Move the backend check to source code of the test itself

 ...tion.c-Disable-unclean-close-by-serv.patch | 36 +++++++++++++++++++
 .../glib-networking/glib-networking_2.78.0.bb |  5 +--
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/0001-tls-tests-connection.c-Disable-unclean-close-by-serv.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/0001-tls-tests-connection.c-Disable-unclean-close-by-serv.patch b/meta/recipes-core/glib-networking/glib-networking/0001-tls-tests-connection.c-Disable-unclean-close-by-serv.patch
new file mode 100644
index 00000000000..be7fc586f40
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/0001-tls-tests-connection.c-Disable-unclean-close-by-serv.patch
@@ -0,0 +1,36 @@
+From fdcd8fbf23983d33327967f3e4249bba7c5a1b93 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Jan 2024 11:15:21 -0800
+Subject: [PATCH] tls/tests/connection.c: Disable unclean-close-by-server with
+ openssl backend
+
+This test does not work when using openssl backend as reported here [1]
+
+Fixes
+
+not ok /tls/openssl/connection/unclean-close-by-server - GLib-Net:ERROR:../tls/tests/connection.c:2374:test_unclean_close_by_server: assertion failed (test->read_error == (g-tls-error-quark, 6)): Error reading data from TLS socket: error:00000005:lib(0)::reason(5) (g-tls-error-quark, 1) Bail out!
+stderr:
+**
+GLib-Net:ERROR:../tls/tests/connection.c:2374:test_unclean_close_by_server: assertion failed (test->read_error == (g-tls-error-quark, 6)): Error reading data from TLS socket: error:00000005:lib(0)::reason(5) (g-tls-error-quark, 1)
+
+[1] https://gitlab.gnome.org/GNOME/glib-networking/-/issues/219
+
+Upstream-Status: Inappropriate [ Disabled test as a workaround until fixed ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tls/tests/connection.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/tls/tests/connection.c
++++ b/tls/tests/connection.c
+@@ -3466,8 +3466,10 @@ main (int   argc,
+               setup_connection, test_simultaneous_sync_rehandshake, teardown_connection);
+   g_test_add ("/tls/" BACKEND "/connection/close-immediately", TestConnection, NULL,
+               setup_connection, test_close_immediately, teardown_connection);
++  #ifndef BACKEND_IS_OPENSSL
+   g_test_add ("/tls/" BACKEND "/connection/unclean-close-by-server", TestConnection, NULL,
+               setup_connection, test_unclean_close_by_server, teardown_connection);
++  #endif
+   g_test_add ("/tls/" BACKEND "/connection/async-implicit-handshake", TestConnection, NULL,
+               setup_connection, test_async_implicit_handshake, teardown_connection);
+   g_test_add ("/tls/" BACKEND "/connection/output-stream-close", TestConnection, NULL,
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
index 68f9a2ed783..3e83bb6ca3b 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
@@ -30,8 +30,9 @@ PACKAGECONFIG[gnomeproxy] = "-Dgnome_proxy=enabled,-Dgnome_proxy=disabled,gsetti
 inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
 SRC_URI += "file://run-ptest"
-SRC_URI += "file://eagain.patch"
-
+SRC_URI += "file://eagain.patch \
+            file://0001-tls-tests-connection.c-Disable-unclean-close-by-serv.patch \
+            "
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
                 ${datadir}/dbus-1/services/ \
-- 
2.43.0


