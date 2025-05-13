Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FC6C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 10:51:41 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.72958.1747133498319430912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 03:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SWZ9UJjc;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so5423117b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 03:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747133497; x=1747738297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OnJNAMvByIXJIdPrX8aERCQD7n34IJG0ubAmNJng8iM=;
        b=SWZ9UJjcR7ATnCMvYA3j6zAbtOO5Rsc2FbSf7QxXVxfmiTFqGcSLbAh+A8L2KjdOvE
         K7pTgMOiZ2cGTvOJQr48ESD+iJlAq9ctWoXggzusZDyWj5dM93y7oUZ/nzNxPiZ+odut
         gp/Od43thxmYEjrVCn/8/aQ+0n/27TkIy5CW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133497; x=1747738297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnJNAMvByIXJIdPrX8aERCQD7n34IJG0ubAmNJng8iM=;
        b=LlDm3BIds2ucmQ9DzklO6PqZvNrmhM7EUddygzi06eRcbXgs3XcDmKATJL3IX9Vl5E
         zBJENf+R8hstpOL9f9W9hAL47GqxPkDGRluqhaH7tvqdugtU+VlkRgjuC8Ct7tGnyUUe
         n7DCOf1mU4NV4IU2dsyb8ixgskKgIIcB6VNDjon04OmyQa7EfkVgj9C0B/RkEP+r/CdW
         5YBK2MI/2DfZtlVFDutbj8uwHXTt5YdsVyQIP3FAbVcu2YxmU8GTwYtVPHapk5fWOI5K
         +ir3LtvbX/HNFjcEo3Pac9HHFljQMzpDiUHD8/qSqCuTh2FugvEu0Q7oqkMGauhW85rn
         z0iQ==
X-Gm-Message-State: AOJu0YykN86Tm/NLracP/XpbQZ6PB8pg9n2oNRjH4tu20jSkXwUqWhw+
	6LHrOxNOWCbkTt35hlh8x8wVNLKFlkDMc6Pa5qItZuu3YKzOuzDd/+Ly1Q3jrYyoPV1BRHr7OK3
	NDns=
X-Gm-Gg: ASbGncsaM8sx50fBotT9TFBtCXa86MsXcIYJogS/wXLPqiWPiiV+XauPGWFL53HSoKm
	Sbb4r5x0xPSiojjgOZSNzuM5XJFvKsnQ0yV1lGT/ngn5hzUfZRzvaXfwVh+Y1cGlE8sUcprVvdW
	Zxc+L8z4I9LZ79BSpsTO9Ht52ulm1IkWYr0iZHN9ijCbmxIpI4M52tPthlPngO0mUEMB/G1VpsZ
	viFFC06myc0Lu173WEt7Dq1rEVEpVtZfz1UevYasC7JF9FWdDf07vKVIBLPI+rBZwUfAgkmzQFh
	ise+KcVyRox1rL9Jr+r2QqsF+BPkgXz7M77js88SkDekmw5ZBqGpCRiWUuBDia0=
X-Google-Smtp-Source: AGHT+IFvzYyhoJxzdx88nFW3340Zk0Zkvc0A9GbiVKfieZrHktsY0fxjz7wJ+yBInfhKMznBq5tWgQ==
X-Received: by 2002:a05:6a20:7fa4:b0:210:1c3a:6804 with SMTP id adf61e73a8af0-215abc17ac7mr26153605637.31.1747133497296;
        Tue, 13 May 2025 03:51:37 -0700 (PDT)
Received: from localhost.localdomain ([49.207.220.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3d861sm7796759b3a.147.2025.05.13.03.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:51:36 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/7] libsoup: update fix CVE-2024-52532
Date: Tue, 13 May 2025 16:21:23 +0530
Message-Id: <20250513105129.2284690-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 10:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216411

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup/CVE-2024-52532-3.patch    | 46 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52532-3.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2024-52532-3.patch b/meta/recipes-support/libsoup/libsoup/CVE-2024-52532-3.patch
new file mode 100644
index 0000000000..edcca86e8c
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2024-52532-3.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 869f0f1696..4b723d3150 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52530.patch \
            file://CVE-2024-52532-1.patch \
            file://CVE-2024-52532-2.patch \
+           file://CVE-2024-52532-3.patch \
            file://CVE-2024-52531-1.patch \
            file://CVE-2024-52531-2.patch \
            file://CVE-2024-52531-3.patch \
-- 
2.25.1


