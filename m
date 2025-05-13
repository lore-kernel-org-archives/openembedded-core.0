Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055E7C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:34 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.84424.1747163303978423712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2Hq0Ebmk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso4986654b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163303; x=1747768103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Hu/5gVRMlCHVbajWI1pBs+NbMvSqUtFlEgTwcpq5yk=;
        b=2Hq0Ebmkn2VwAPubna1PnFWQQlY142oGaAlijXS1g/JS366yGOj2ESGA+GTFJptH4m
         uqq4TGeAZEIi6WZUmtOwdBIe7Q2tttqjCJFxfvIve1APL2kt5kbP7gpcGCji7GU2Gbxv
         HC87zn4+QZSgi/ANgExC5fLa4ZoNoCxNwtYXF/zuuasgOvCMvAw0pA0TQ4Nzh8Rb7SwA
         8GxAeDDJMSdBnRe7+MJifHwEVrbl1bQRA2fG2t2MH4+r+0Qx3ROnmzVNqEH1AfZvYD4g
         MHPvrIvOUEE6y3genV3z8juMiU5CC0uuAx3A8GODH6GA+5e7sy6yX3FMaeZNiLEM49Gr
         LlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163303; x=1747768103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Hu/5gVRMlCHVbajWI1pBs+NbMvSqUtFlEgTwcpq5yk=;
        b=QkdEE/NfLwsBLmm15NwMGYUOOPKtWzRvZnkZPMg3rQDUZspqVliIdtKJdP+AiUV6UM
         3QDZpy8QKfJy7Q7HGevLh3kktk7NJlRaX0WTmWcuuu4QxM9c8o35QEO79OSqVYvwpNjK
         92RD5Zst4TqjbsrcMBDDHIPCeOFDZrWzlUy+IUYhfVbCBq+VZu6eRLLrkcgsqr2BZs65
         Na98Dy2TidJAwE88XVp1dPLxAnGWx1ls2Id2vxzCpiDR92xqDWKmqDS7OfvyLZQz0mT6
         BdycwoLAX1tigRi/IpyTMHCIQBHtGkIydqQHUDT8/lf1wJaBIWgVFLkV3OXYAliQBkOQ
         aoZw==
X-Gm-Message-State: AOJu0Yy3ATML70trqkd434IF1tcj+fkIU/XaBJ6bVbBmlETk+lKi/JC5
	nDDtW6GtLTIHitiMaQ9cn2bt7m+8VahZ9zCmG5aGWne4kHFITrEXu50HlSX4mDoZfu9KHXtZjXW
	U
X-Gm-Gg: ASbGnctd3iRg+j0VtcjH43AyPBhijyX1GZ8GiiDbFdQYdT/6VzpHY1Ahm22m80PZ5B8
	NcrzoOAKn/h+64S/+chdqY0dO/fk7F2abIxb7DR0sgVbGTyMTRh3kZGtNd0tDr5fAf/lJX713Jt
	arnc20qZdBO5pPF5er++OCCE9HKUxgfTtrtO6n3gKDSpKPP6fimmKfNwnIxcSyAKxriKv/Gj82E
	SXHG66qMGJAYehUNNtI7SWlLCgg9CQ7IryEuRMlCTT4xd7mpl1hQxf2fCZfiI0IN4F/eSlpZf8w
	QWoePe+V/hJCjedD8M2kwvaTnMtG49qJYw7Hw39HBO4=
X-Google-Smtp-Source: AGHT+IH44s/DuyUsYmkQtJcfrH65fb0zcatodlf6qmEh8ZM0rEU2Ulf/poDkKsi8YnxRbPdIbuztKw==
X-Received: by 2002:a17:903:3ba3:b0:223:3396:15e8 with SMTP id d9443c01a7336-2319810114emr8428915ad.22.1747163303200;
        Tue, 13 May 2025 12:08:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/15] libsoup-2.4: Update fix CVE-2024-52532
Date: Tue, 13 May 2025 12:07:59 -0700
Message-ID: <144d067ed5b98b8ca477a6a0e8c958c0b15e9643.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747163155.git.steve@sakoman.com>
References: <cover.1747163155.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216435

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


