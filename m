Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417FAC3ABDC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:34 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.84428.1747163308145817011
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ogxhSG3W;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ae727e87c26so4154519a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163307; x=1747768107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1692rcHiepkJ4rqtA9kz8K3huzxoUoBmGAtj0Hpu+Y=;
        b=ogxhSG3WYPbuvD5YRV1oX9omrfo0GR78TyE+8Kx0AqQsoVxiotI/0DE8FLddtGXIpD
         LSXZAhleunL0/O3+sSQWjrEvdrNcjZW+Q6MnsTfc6433r7zQK4CR2aMmG/mIEAn7HPTO
         uUm1z1Yxpzh34gZtZXGLSav1uRNWx37bUATV06uEnSs7sCy7DujkyIeJ+9DJYu65zMDq
         u8z4cKP3aoIqWiB5jpNTQxu5TMz4s+d2C6jMkzKUAs0WjRquKyxqgjg9UhcAay8UhBxv
         DDFaw7K5MCMJeMyQtMASKHtKeD5YGf59aIVjsHBAUMbqbvd1vdW54RIz3sJlhSk7xD9e
         Dh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163307; x=1747768107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1692rcHiepkJ4rqtA9kz8K3huzxoUoBmGAtj0Hpu+Y=;
        b=PSfLo0QTvYKqUT1I1P3cbd85nqRpyzqrzFrWTkpFbkj4jYbVwEJnVdNBfbnh/7OBAg
         j8t+fn6ClbzBgIk5/ZKMDR6ytFxSThiC1p13G/r1ff28kkJDN8JS+xEX/ah03IvrAO8q
         r1+8yKYyvewYj9tY9Fba5RIs1qnHzntmw1LdzIrzKWsAtdX6KuA6O3I59iERE/AylgbC
         NDjlMEq6NPJU3va266yTK59ud54WVvbAsjPsNrO9spGdYsruR4ctDOjAlLHSCdBykR4P
         a+Y8eCNqy7PpMxlKrnrfxWg2bIz5wal50ZS0sx6ygZ6dtnAez/S4B5JmpUDSb9zq3e6I
         QyPg==
X-Gm-Message-State: AOJu0Yw55JClg42k3/7oPuZ95OkT4IvVAoi36YxvppM6juovzVwes32k
	/8xKPebwEVn91EA5bosrjE26Y6KJJkrBM/g/ZYCw4ilYmKaQfbuhDALj3HX3b1Rb8kkMVkwzV/N
	Q
X-Gm-Gg: ASbGnctgqH2lwILXK4IhDwSXR4C+GwLL4TemvBFrj99EUkEjWpB/VXI3wLC2y0Qrk1D
	1vfMX2zXQpKVWijAfvqpFDkBskX7HY6vjowG1lDlU3g4i8EfxUN/sq+FGf27rY17/Q6uP6sKpQ1
	mwUxGiP2AE0Ip/t8C74g6G/gS+xeovi6U6ZxVX9OHhrd/jS6U1kwBlqfW+dZhGsmL2mNOxq20XC
	5XxMC2aa9Q6NEEkBzDEqP9qHlK7u9+IUaC/x7BBuVGhG6jcMZPmBJM1qnEXiELUJWtxIXLfxH/Z
	ATQH0vnUJ8oh0ixlOb2wTzlo4sQ//1SBsSuyYkHBnno=
X-Google-Smtp-Source: AGHT+IF/yJ89UntIwQlJzH0ZcIQrsam1mtm4QAooXlwisbUv+5p6wpZXCYY+39qkO04PodfBUoX9hA==
X-Received: by 2002:a17:902:d550:b0:22e:6bb1:f717 with SMTP id d9443c01a7336-231981c05d0mr7830845ad.41.1747163307382;
        Tue, 13 May 2025 12:08:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/15] libsoup: update fix CVE-2024-52532
Date: Tue, 13 May 2025 12:08:02 -0700
Message-ID: <caf0ac894d029aaac7d746fe87db1aa0e8c3c93f.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747163155.git.steve@sakoman.com>
References: <cover.1747163155.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216438

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


