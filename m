Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B00FE92FFF
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 23:08:16 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53841.1767049686361120352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 15:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JLNvcaxQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so7024057b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 15:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767049685; x=1767654485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQX8JCTy5Qi2l4o33YRQ6g4rKFoDlJakafklbNwH6OY=;
        b=JLNvcaxQwjPBj+qX4GILMHNfcoXJ6H5p8JqLnQz2/dsuQLfM3i9HojnVGj9HZ3akZH
         KKMnTEkMnMaF3Bolj4Ba72iok870tGlhuPUFHvR/VEZ6Cy3r+kUcd4JYAFv35gma/Bkw
         NV6q+Lv005whB0vd0+cW9sVV+wGzmB8DGtj53/TIXqde8jHqKeiatJB/CK5Tzxup0Ms0
         ZYRwvJrB2s8JBJaZX7rZhoU1pqWwwkJBtlQSKmJIb8UQvH/1Ktm4JbTgWmMV71KyivGs
         rhz+9Y5RBWYqDcUt/o5MNU3eazEVJwq6zR9MBIcgNTqjwbCFrd2yxmTVmi1ZfW6RvqS6
         AeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767049685; x=1767654485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BQX8JCTy5Qi2l4o33YRQ6g4rKFoDlJakafklbNwH6OY=;
        b=PifIWQrRvgANxZzwkSXrywA26fcBuIkluCG/GN9uBOg+36Uxf/zkj4tKaRz7eq7G+Y
         OVeGSQkISuiO1Tf+DpvpW5pp6FuuTncdR0twW8cvLmECtl8BYPfjxSFgU9uAwbOCk7DC
         YWQenTguWYOfO5YYgwmXjLKWyZsvUNoETm/ViZmsU3m2OjTj4xlDsZKxGWXaY2xFi0rx
         U0Bs05zRb84ZKbT+bBfKGvZbKtxKJo5SeRUKAePq3vKVOYzkOxMMJPeS6OKLM5TV+FQ0
         bqbEveiw0MbBx4QfacGso6oI1di1a+MUlFcLNSd+h161/m7uvSc8URaqotR0kWQpBnEb
         82iQ==
X-Gm-Message-State: AOJu0Yz1pjLC19jfeEzMQ8kbvsWXw7mC4/DhwLe/wZnOghQ1WsaGy5iN
	1sjY+8qfQwyyp4L6/+OJuseA/B3qDb2MvI8UfbLihKky22IFlUX7d10EPOZTr/PBPgh/vtYKKbK
	U4oDR
X-Gm-Gg: AY/fxX7WZU3eA7UKbo0ON6ldZxSxQbkHWm3+wKFOqjUt9UtvRBH1pXMrNdUhoCCz8iW
	ubtNCZrK3YTN0BiUqrTXvPvEACiCtPXQkLtaCtW+Q3lz4Xyl6Ksa0/9MGmYkE0sTM/OKKlrTe3z
	A5HjlxBMGYMNXh2kLPw3AL4UjczJGWXd4IuK5mzegJvRHtflOzC+ntjLhwC7rPYsjwCiHzHMOH7
	fjItUA6zluet1QNDcvAIBCtd4cJ1Nv+AC+DB4g20TGJAcFlUa9k5FnNC7sRyJKx1GWw1FOjtuDC
	KwjI0s7hdDz/CLGscgmbh7SDRzOSE0fiCj25BERf13yELWoqA1RGlREYNDXSS6EeboOzUQLONNS
	oeuTC4o7wbICTCnJaqLdEsjrob8D0u3rH4Yb3zZO5VusegEhYErGktIqsjIdGXnTvEUJwEcjpEp
	tRsQ==
X-Google-Smtp-Source: AGHT+IHIEGcjRtXeVCl037RPnf73SK8aWqRY/nGj7SW5WVEry0+viK0NK0H3jO9sMxMk6L4aT7+Avw==
X-Received: by 2002:a05:6a00:3286:b0:7ee:f5d7:cd9a with SMTP id d2e1a72fcca58-7ff6725628cmr24336895b3a.46.1767049685554;
        Mon, 29 Dec 2025 15:08:05 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c013:8f5c:baf3:22c3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm30340938b3a.50.2025.12.29.15.08.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 15:08:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/5] libsoup: fix CVE-2025-12105
Date: Mon, 29 Dec 2025 15:07:36 -0800
Message-ID: <1ac9ad3faf022684ae709f4494a430aee5fb9906.1767049440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767049440.git.steve@sakoman.com>
References: <cover.1767049440.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 23:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228623

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/481

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-3.4.4/CVE-2025-12105.patch        | 34 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-12105.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-12105.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-12105.patch
new file mode 100644
index 0000000000..a460554d6f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-12105.patch
@@ -0,0 +1,34 @@
+From 4cbb31f5bf083442325692ff16559fed73f3a6cf Mon Sep 17 00:00:00 2001
+From: Eugene Mutavchi <Ievgen_Mutavchi@comcast.com>
+Date: Fri, 10 Oct 2025 16:24:27 +0000
+Subject: [PATCH] fix 'heap-use-after-free' caused by 'finishing' queue item
+ twice
+
+CVE: CVE-2025-12105
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9ba1243a24e442fa5ec44684617a4480027da960]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-session.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 9f00b05..649902f 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -2822,8 +2822,10 @@ run_until_read_done (SoupMessage          *msg,
+ 		if (soup_message_io_in_progress (msg))
+ 			soup_message_io_finished (msg);
+ 		item->paused = FALSE;
+-		item->state = SOUP_MESSAGE_FINISHING;
+-		soup_session_process_queue_item (item->session, item, FALSE);
++		if (item->state != SOUP_MESSAGE_FINISHED) {
++			item->state = SOUP_MESSAGE_FINISHING;
++			soup_session_process_queue_item (item->session, item, FALSE);
++		}
+ 	}
+ 	async_send_request_return_result (item, NULL, error);
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index f64d0d6745..c09b06fec2 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -45,6 +45,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4948.patch \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
+           file://CVE-2025-12105.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


