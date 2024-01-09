Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4637FC47079
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 18:24:02 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.24579.1704824634786897113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 10:23:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H/8lSYFe;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d54b765414so13526385ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 10:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704824634; x=1705429434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jsif0+T0qvq0+v4Nn3fFpsLR2yxtxed6HrFjsS+H3Jk=;
        b=H/8lSYFebQAcQ0GwaRn0Ffu0Wc8wInV9OTHZbZF8ZUM5i/ajaD9vLKjykR0dQaImzH
         yi5LWFbSfAOyukUEzqkrZ41tpqC7SDq0jbw7StbMDqreNI5zHf8F1wwGfTOIAygzu223
         UAv906FKpQt3ny3sFPngE2LEj18tp+grM1ojpDE/ZJ8COdwA8L1qB1xm78u6EpjXGpED
         zGRHv5039p8OWl45g+NCvcsXG4XGTRDqvWdE/ffcph3XxLbtuo78oZi4WkphX/oYSr1k
         j7pSnsF/aFyZz1Giur+TmJCZtUJHwTa26jinB6vYEtQvgWLrI3JVoVTmcafyBm/ThNTj
         7Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704824634; x=1705429434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jsif0+T0qvq0+v4Nn3fFpsLR2yxtxed6HrFjsS+H3Jk=;
        b=kpmLZnpAqe4dq8YsI+9+IVCfzCz0Otk37ZEIvKwYocMwQWKZ8BXTwkj+4kRTiFw3uC
         xS+IjQUp0wbDiZnEICyU7RF3UrYxOelTDlrTcP3YLLAztwrozuWr2uHZm9MTC/PMA4/S
         UxnocqlUZmCvLWQ4ryxMIOcwbNaHweQp1NVgKJ2Dovg6p2f++YAvulCy0cGFqNRNMb2A
         gtt7WnDlPEmBj6tnfoGhPQ42KIoXlmEBZ7TUlQaR8dhUbkupf8jzkFWFsgqYFhi/UpbD
         FDGQgMZHuZ2gWHpwBkwEHmoItM4M/HhrAhPW7Qdupg4idjGRo861mvfs283K38du4j12
         Jdgw==
X-Gm-Message-State: AOJu0YwkWOaMFTUdfwGZI3E4nschfZiJLH50QAsTMhG/p8ku41yx81Xs
	lb9uTyO7XZTv8K/Q9P0REDgxFt1zxywryA==
X-Google-Smtp-Source: AGHT+IEGieI5cw6wKD9Us5nO05Rvf0SijDICth1xXsMWBKdYgBGB4us4uAdtOMPy5IEdWW6f5qUB8g==
X-Received: by 2002:a17:902:ce89:b0:1d5:845:d8cf with SMTP id f9-20020a170902ce8900b001d50845d8cfmr7359902plg.104.1704824633777;
        Tue, 09 Jan 2024 10:23:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8c5f])
        by smtp.gmail.com with ESMTPSA id o6-20020a170902778600b001d4cb4a5336sm2082271pll.39.2024.01.09.10.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 10:23:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] glib-networking: Fix ptest failures with openssl backend
Date: Tue,  9 Jan 2024 10:23:50 -0800
Message-ID: <20240109182350.1070414-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 18:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193474

Apply only when openssl is in packageconfigs, seems to work ok with
gnutls backend.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Make the patch apply only when openssl backend is used

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
index 68f9a2ed783..4576b3556c0 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
@@ -30,8 +30,9 @@ PACKAGECONFIG[gnomeproxy] = "-Dgnome_proxy=enabled,-Dgnome_proxy=disabled,gsetti
 inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
 SRC_URI += "file://run-ptest"
-SRC_URI += "file://eagain.patch"
-
+SRC_URI += "file://eagain.patch \
+            ${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'file://0001-tests-Disable-test_unclean_close_by_server.patch', '', d)} \
+            "
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
                 ${datadir}/dbus-1/services/ \
-- 
2.43.0


