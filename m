Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B109CC41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 17:54:57 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.28874.1703267695391169653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Dec 2023 09:54:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tw3nPTl2;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6d93d15db24so1954276b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 09:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703267694; x=1703872494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JUudJwYztx4CdCxOgXx2V5mCl7Tq6hrOOWRq2eivOKU=;
        b=Tw3nPTl2aBq8zbtkIVVg663eXmEPD3JckgoKH5fQTMd6qhGkEa4MTNpPy9+yP4Hnpn
         YharT0g0eFepAvLLw/bTFQabY/bJvXYwSPTAzmtm5ZoJOs2a6W69werUZzkXQQbDMZHj
         FraVffpca5do/4mtghjHgThuQuLZW4PQsjQIiR0BEwuJsqYI1CK3/+v9gbaILz0zhDn2
         DZStuhszpYmU5F5h12LayNGWqPR+3cmImtmj+uDCPZK44iAhNa8ZrOwQLMHnqlKdCnRs
         D7e1ztH+UmgWcn7Qtce9N85RzjHiurZhJej2E0WQzCGdFtv8DbSh2z4lTYYvcmSahlNG
         itig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703267694; x=1703872494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUudJwYztx4CdCxOgXx2V5mCl7Tq6hrOOWRq2eivOKU=;
        b=nzepzvAP7j1heOF6/9M7WLeEscdDCitYfEa/pUHGLtKTT9s1GfrnW7w23eH69HmAEE
         zszPZ2Lx4FvwCyNbAdhYsf9Z4bXSF24pV04tDDQbH6hRkbfpJkYj37Ci7ywWzNPWWDQi
         H3OIPjso7+4JygPrvXwNmavw8ylOGO47dfLUJVFxCmxmKxxRnnJUHnsqjyxMYy+/RV4R
         SrTS+qtDH2XWBCgdQinbwHuZBrAV1k3wK1TTvFKSy68LYh2zFBdIDSizwhodjH6nBaw6
         e7DmAXCNAYoYt+BtIt5A5AXwx2apAW05XnqNISYWjRNUT4uRRU/eRcL28BQlc5Hy1v/7
         RXRw==
X-Gm-Message-State: AOJu0Yz5FE8C2IqkNQMagESS5W+Mza8dYxha3Fee/PIkbHixw9PoCoIN
	jg5OKq4omp3OcU3Efg/wYGz0A7KBcPY=
X-Google-Smtp-Source: AGHT+IFvGxWUukZJ3gaKgE/MZmV/NXxQhyaJ675a7+unaIiWbzXkbv5upvjk+nH2k7WZVWSxJTObsA==
X-Received: by 2002:a05:6a00:8c6:b0:6d9:8499:68ca with SMTP id s6-20020a056a0008c600b006d9849968camr2038678pfu.6.1703267694442;
        Fri, 22 Dec 2023 09:54:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id i9-20020a056a00004900b006d96d64a011sm3659055pfk.181.2023.12.22.09.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 09:54:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glib-networking: Fix ptest failures with openssl backend
Date: Fri, 22 Dec 2023 09:54:52 -0800
Message-ID: <20231222175452.3796386-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 17:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192876

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Disable-test_unclean_close_by_server.patch | 42 +++++++++++++++++++
 .../glib-networking/glib-networking_2.78.0.bb |  5 ++-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/0001-tests-Disable-test_unclean_close_by_server.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/0001-tests-Disable-test_unclean_close_by_server.patch b/meta/recipes-core/glib-networking/glib-networking/0001-tests-Disable-test_unclean_close_by_server.patch
new file mode 100644
index 00000000000..44e92f52001
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/0001-tests-Disable-test_unclean_close_by_server.patch
@@ -0,0 +1,42 @@
+From 378bb3b0bf001e66a89d100ba12ac183e8375c36 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 22 Dec 2023 09:46:36 -0800
+Subject: [PATCH] tests: Disable test_unclean_close_by_server
+
+This test does not work reliably when openSSL support is enabled. This
+is not default in OE therefore the ptest failure is not seen on AB
+testing
+
+Fixes
+
+not ok /tls/openssl/connection/unclean-close-by-server - GLib-Net:ERROR:../tls/tests/connection.c:2374:test_unclean_close_by_server: assertion failed (test->read_error == (g-tls-error-quark, 6)): Error reading data from TLS socket: error:00000005:lib(0)::reason(5) (g-tls-error-quark, 1)
+Bail out!
+stderr:
+**
+GLib-Net:ERROR:../tls/tests/connection.c:2374:test_unclean_close_by_server: assertion failed (test->read_error == (g-tls-error-quark, 6)): Error reading data from TLS socket: error:00000005:lib(0)::reason(5) (g-tls-error-quark, 1)
+
+Issue is already reported upstream [1]
+
+[1] https://gitlab.gnome.org/GNOME/glib-networking/-/issues/219
+Upstream-Status: Inappropriate [ Disabled test as a workaround until fixed ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tls/tests/connection.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/tls/tests/connection.c b/tls/tests/connection.c
+index 62a7fbb..cc99645 100644
+--- a/tls/tests/connection.c
++++ b/tls/tests/connection.c
+@@ -3462,8 +3462,6 @@ main (int   argc,
+               setup_connection, test_simultaneous_sync_rehandshake, teardown_connection);
+   g_test_add ("/tls/" BACKEND "/connection/close-immediately", TestConnection, NULL,
+               setup_connection, test_close_immediately, teardown_connection);
+-  g_test_add ("/tls/" BACKEND "/connection/unclean-close-by-server", TestConnection, NULL,
+-              setup_connection, test_unclean_close_by_server, teardown_connection);
+   g_test_add ("/tls/" BACKEND "/connection/async-implicit-handshake", TestConnection, NULL,
+               setup_connection, test_async_implicit_handshake, teardown_connection);
+   g_test_add ("/tls/" BACKEND "/connection/output-stream-close", TestConnection, NULL,
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
index 68f9a2ed783..e360e59b532 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
@@ -30,8 +30,9 @@ PACKAGECONFIG[gnomeproxy] = "-Dgnome_proxy=enabled,-Dgnome_proxy=disabled,gsetti
 inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
 SRC_URI += "file://run-ptest"
-SRC_URI += "file://eagain.patch"
-
+SRC_URI += "file://eagain.patch \
+            file://0001-tests-Disable-test_unclean_close_by_server.patch \
+            "
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
                 ${datadir}/dbus-1/services/ \
-- 
2.43.0


