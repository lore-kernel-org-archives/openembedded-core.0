Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE61C7EE23
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:31:57 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.69675.1684081914501391518
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MAFq3pZi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-643bb9cdd6eso9624807b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081913; x=1686673913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEYNd8UfCfgPwvDr6yuvJFCD4MrycDcfiDWjTBwER2E=;
        b=MAFq3pZih/gytDEzpRGnS5NFSXj1+tBKof+cb9Qb8etfKJa+1WqQ2jo0f1NzSRSdj7
         qbenhlYbtPS0GvrLAUtOBZMtxiRB8ZRDh2f/X3P3VdFtSP0RY18qbis8Ra+/gaZxMC57
         Bu+vD6HURD+4d+wNokUNh0BNEsLPBN/ah9Df0kp+zU6fQVQ8EnKLr2/6f5G1DYSZpUxU
         m55gRxlqZCrCt1q3BmDRWFYN6tWBBVDe1QKb6yZiENWEtR3Kt+WSLXRRzIQeuOZgNuPY
         vpJEoyBaNKj/++i5YP3WClR39PH2gEAkxzT4o+X7njhN1o6/ExnQK55yrl6Q1zlBKGTd
         HJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081913; x=1686673913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEYNd8UfCfgPwvDr6yuvJFCD4MrycDcfiDWjTBwER2E=;
        b=VOTgbZkGV2L/7NUHyVefy4rz1oQGQO0plb1+lKW+LuWX6mwYv7PEaNjaIJrFOSJv15
         UArArv7BAvuLpkmU08leJAirUPPRQE5bK4d1q2D07DIpsuVIOPnK2d1IDlCFzKUMicEY
         sclTKBtGtuTNhcdyVUZIyh4M+4HI4Y0K7FZG5gEQ2V76edcewYPxdVjbCM9r5KoyHOG8
         SkmqvXmoBKi6tLcJtTi9O4psoLcMsfSgBf/OGdQNFf/uMtmrBr/2utrBZwA5gepCanHj
         fC1QjM6Ttsmcv20g2ue4KcV1t7vikprg+/9Xe9EXFtOnn75u6HKPxk6TSJFhol7LK4mA
         4QDg==
X-Gm-Message-State: AC+VfDzXyaR+CiuunsCi7KQvAU1amLHyo1FL2eZ68+VqvZ5IuNfQorRD
	LX2AXbADmoQ6x6YTdqBgaAvNcTh2ERLAdWHVCNk=
X-Google-Smtp-Source: ACHHUZ5hhViUXMnE/RsvhB0BF5vParfAMw/FoYwVhhQRe1T14YQa44WD+8UlMigIl/IumAEjC2LRRA==
X-Received: by 2002:a05:6a00:15c6:b0:647:7ee8:6251 with SMTP id o6-20020a056a0015c600b006477ee86251mr25535820pfu.21.1684081913343;
        Sun, 14 May 2023 09:31:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.31.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:31:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/15] glib-networking: Add test retry to avoid failures
Date: Sun, 14 May 2023 06:31:29 -1000
Message-Id: <6282f64a6673bcd9b0a6cedfcb8cd3d1a6de1077.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181205

From: Richard Purdie <richard.purdie@linuxfoundation.org>

In autobuilder testing we regularly see glib-networking ptest fail with a
"Resource temporarily unavailable (g-io-error-quark, 27)" error.

Add a patch to see if a retry can resolve the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4deb03ee5af8fcf7c2b1c81c686839341cf753c4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-networking/eagain.patch              | 29 +++++++++++++++++++
 .../glib-networking/glib-networking_2.74.0.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/eagain.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
new file mode 100644
index 0000000000..6dfbb2736c
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -0,0 +1,29 @@
+In autobuilder testing we regularly see glib-networking ptest fail with:
+
+GLib-Net:ERROR:/usr/src/debug/glib-networking/2.74.0-r0/tls/tests/connection.c:1944:simul_read_thread: assertion failed (error == NULL): Resource temporarily unavailable (g-io-error-quark, 27)
+Bail out! GLib-Net:ERROR:/usr/src/debug/glib-networking/2.74.0-r0/tls/tests/connection.c:1944:simul_read_thread: assertion failed (error == NULL): Resource temporarily unavailable (g-io-error-quark, 27)
+FAIL: glib-networking/connection-openssl.test (Child process killed by signal 6)
+SUMMARY: total=4; passed=3; skipped=0; failed=1; user=0.9s; system=0.4s; maxrss=10708
+FAIL: glib-networking/connection-openssl.test (Child process killed by signal 6)
+
+The test should probably retry in this situation so test a patch which does this.
+
+Upstream-Status: Pending [testing to see if patch resolves the issue]
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: glib-networking-2.74.0/tls/tests/connection.c
+===================================================================
+--- glib-networking-2.74.0.orig/tls/tests/connection.c
++++ glib-networking-2.74.0/tls/tests/connection.c
+@@ -1941,6 +1941,10 @@ simul_read_thread (gpointer user_data)
+                                    test->buf + test->nread,
+                                    MIN (TEST_DATA_LENGTH / 2, TEST_DATA_LENGTH - test->nread),
+                                    NULL, &error);
++
++      if (error == G_IO_STATUS_AGAIN)
++          continue;
++
+       g_assert_no_error (error);
+ 
+       test->nread += nread;
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
index dc0be23357..b3a88aca8d 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
@@ -24,6 +24,7 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
 SRC_URI += "file://run-ptest"
+SRC_URI += "file://eagain.patch"
 
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
-- 
2.34.1


