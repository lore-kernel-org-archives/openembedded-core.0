Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC96C77B73
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 13:36:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.34152.1683380215105394553
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 06:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=V5mRUgvr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f41dceb9c9so1798515e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 06:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683380213; x=1685972213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b2HeO9DQUQZGbAJSt4osnMENkpMnO1e30iTDIl4DSCk=;
        b=V5mRUgvreD8xshgIbsJ5II1qS2X9sgA5WlQNJfZ2KL1VamxXmrU5hjS3T9KdVCj5cD
         f86pAN9fG+25ehKrRRBVl0HV+WbFotfxfHLjdU5jhTizSOW3u7/I43osLIpkGySjIz0l
         ueBydFk6D4u6th+DLJfpWUHqsuF2T59mMecgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683380213; x=1685972213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2HeO9DQUQZGbAJSt4osnMENkpMnO1e30iTDIl4DSCk=;
        b=l6k/QaO2hzDvAb4kwIHpcVOB1z81m1+EDktj0G1Vh9+K98v6iiHGtpmiwXB8S5FRcG
         G+TpXQmLlkHhxDKFc6aXgqrYiDIzd0jGyn/NOM0H+w7UdF1pXwXD1MCy2eFOXYCeIwOq
         GcrxOY2a1yNl615rcLDpe0Rzjwulzk+3IoKAUnfU03wBK396de0CD3dgEEexadLzkmcY
         I/r+JHihfwGZFFbbes+HTYAR1wchEgMblqHJUG2+IbLLEWZfPBzseaK3jnNH29YDww58
         E2A4lnjNs1FN164hCVoMGLFXjR46i4J5YkTFLTPkQ+MN4TIcLZE7GzCkiwJTifgDRs2Y
         stfw==
X-Gm-Message-State: AC+VfDxzaNQrLJomq8XQshMCXnKxokuedjZVFmxpm93kvoLB/e0aD6qi
	cDPBLrQZEfXDlwlvnuXsJNZZ7MKbkAkzzgKXZ84=
X-Google-Smtp-Source: ACHHUZ6PeXVRdxsXOaa7Qk/zvSQ7lDMvrnDVgI4s3vh08rr0MIsK67dmsUjvHHTaKbqTnhFmxWMTPQ==
X-Received: by 2002:a05:600c:2909:b0:3f1:6ead:34fe with SMTP id i9-20020a05600c290900b003f16ead34femr3278274wmd.26.1683380212563;
        Sat, 06 May 2023 06:36:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2bbd:abfd:72d0:529f])
        by smtp.gmail.com with ESMTPSA id l2-20020a1ced02000000b003f19b3d89e9sm11011371wmh.33.2023.05.06.06.36.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 06:36:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-networking: Add test retry to avoid failures
Date: Sat,  6 May 2023 14:36:51 +0100
Message-Id: <20230506133651.3205199-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 13:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180982

In autobuilder testing we regularly see glib-networking ptest fail with a
"Resource temporarily unavailable (g-io-error-quark, 27)" error.

Add a patch to see if a retry can resolve the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../glib-networking/eagain.patch              | 29 +++++++++++++++++++
 .../glib-networking/glib-networking_2.74.0.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/eagain.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
new file mode 100644
index 00000000000..6dfbb2736c8
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
index dc0be23357f..b3a88aca8db 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
@@ -24,6 +24,7 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
 SRC_URI += "file://run-ptest"
+SRC_URI += "file://eagain.patch"
 
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
-- 
2.39.2


