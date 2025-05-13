Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5C7C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 09:03:51 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.71659.1747127030478181959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 02:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=E7na/J9j;
 spf=pass (domain: mvista.com, ip: 209.85.215.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b268e4bfd0dso3084139a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747127029; x=1747731829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4v/ZMSWX6rrF2AuHq5LQW2550m6i3Y63nk/dwv7R6k=;
        b=E7na/J9jCQqOdrPmTv53WIgd21H46fk9sG0U+mRslbQrfmBm3qKsLQs/xpphEvKrRd
         LvTFGlRLGWFiU/I90zYmJ58DZEtAXgBlEWaiWWgvDR5I8qLmv8ndofw9nTm2kslefi/Y
         5CxlZIYE0IKGmsSblNULE1sBae6s7w5wIC5nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127029; x=1747731829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4v/ZMSWX6rrF2AuHq5LQW2550m6i3Y63nk/dwv7R6k=;
        b=FB56rmdOFCs0mp2LCBM+23KjAAZMgL4XBnt9x0ycb3H9h4vR50BptCULC3b9yaJCn5
         wBIH0PWzRqumjr1LGLqq+RIkjiiOm+oPTvdhJImxOag6mSOVul7GqYmhQTbmAnJTajD0
         jmtfN/utCNrXTA/dfCWMACl8K0M75hjKn7RnZLOQVuxOCrJAOT9e4/WOIh+5O4ZvTMap
         /NGfgeYbmx24RsrQHfIeNucVwWRqngtPSEDnOSqStbg/8p7/dzXe0JW+gz360JlOGG/4
         cYMmbGkFqpHKirOnWhRTQfGsb8TbvIRLj8vq9/j0okw9prOHE2BKGZusOd88Lq6pL+AI
         KL8w==
X-Gm-Message-State: AOJu0Yw4itt+9R5UG4UsNU/bJH3X1tJDOgM9Pinalv/5/LG2UuSbqoks
	k0tsO75Sey9zB/Ild5tbiaSlBhlcY5Cob9ZpFcJat+6qZUhaY1gHr9eqvOLloxgYjoV0aBmk4mG
	71h0=
X-Gm-Gg: ASbGncs317X/4WtHDfWqALqBHgWdVUqDOqhIWs6dA46EOwuV3Axe9qWsDn6NTreM2FT
	GFToUPC0r6tOHIJ9Nu+6nrJIwG3MAhiu8KVzt1Y4cybh4Ju8DxDbV2xwveB10L6bMcbn1jB0SG9
	TEyaz1iTSVR98qVyHCz/UT9qhB14Dx8iwMlqCL8RbIHgyM7jUPWlDi4amiR37Q5oPV/adLUPrLQ
	4SDfH8bgE+X63b8M7ZCdTgrfP9jWev816MdpV8DlEbTS71TPAeahv1tDvPCjm2dry2elANX0v3b
	TXZ4QFm+DsAEXK2sOzSZ4SuMgWZGJXAZV/dqCMmBOsKDVHzLd8NVWBrs3uaj6Oo=
X-Google-Smtp-Source: AGHT+IHqbGCVqXmJ2zIioAJ5DGurBpEOSF7gLGNDQYcNLXh3qILcQwO3xtN5/WYBv28lX/bCxWc5sQ==
X-Received: by 2002:a17:902:ce8d:b0:223:5a6e:b16 with SMTP id d9443c01a7336-22fc8b3d56emr277697895ad.5.1747127028699;
        Tue, 13 May 2025 02:03:48 -0700 (PDT)
Received: from localhost.localdomain ([49.207.220.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829f388sm76574885ad.214.2025.05.13.02.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:03:48 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/3] libsoup-2.4: Update fix CVE-2024-52532
Date: Tue, 13 May 2025 14:33:38 +0530
Message-Id: <20250513090340.2209255-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 09:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216403

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-2.4/CVE-2024-52532-3.patch        | 46 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
new file mode 100644
index 0000000000..edcca86e8c
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
@@ -0,0 +1,46 @@
+From 4c9e75c6676a37b6485620c332e568e1a3f530ff Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Wed, 13 Nov 2024 14:14:23 +0000
+Subject: [PATCH] websocket-test: Disconnect error signal in another place
+
+This is the same change as commit 29b96fab "websocket-test: disconnect
+error copy after the test ends", and is done for the same reason, but
+replicating it into a different function.
+
+Fixes: 6adc0e3e "websocket: process the frame as soon as we read data"
+Resolves: https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff]
+CVE: CVE-2024-52532
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tests/websocket-test.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 6a48c1f9..723f2857 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -1508,8 +1508,9 @@ test_receive_invalid_encode_length_16 (Test *test,
+ 	GError *error = NULL;
+ 	InvalidEncodeLengthTest context = { test, NULL };
+ 	guint i;
++	guint error_id;
+ 
+-	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++	error_id = g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
+ 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message), &received);
+ 
+ 	/* We use 126(~) as payload length with 125 extended length */
+@@ -1522,6 +1523,7 @@ test_receive_invalid_encode_length_16 (Test *test,
+ 	WAIT_UNTIL (error != NULL || received != NULL);
+ 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
+ 	g_clear_error (&error);
++        g_signal_handler_disconnect (test->client, error_id);
+ 	g_assert_null (received);
+ 
+ 	g_thread_join (thread);
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 88d08ad0ec..b299fcf6de 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52530.patch \
            file://CVE-2024-52532-1.patch \
            file://CVE-2024-52532-2.patch \
+           file://CVE-2024-52532-3.patch \
            file://CVE-2024-52531-1.patch \
            file://CVE-2024-52531-2.patch \
           "
-- 
2.25.1


