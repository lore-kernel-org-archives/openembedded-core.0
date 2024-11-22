Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F207E6919E
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:26:58 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.35401.1732310815157442494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BXnEO7lE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-212884028a3so15887425ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310814; x=1732915614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUIPeel9q6rTb9NBV0RW6duJ36y8MFQX6IU0vwuvl9E=;
        b=BXnEO7lEYO/sSxAUfgYE9nziKBElm2aUlTJ3uLQss6SkUmMv0JgroTYfj6PRKPr6c6
         FK9rcSVbQQzEwp/8ppP8OfD4lG2C3NkbyYZoLhf7qaoVsWsA+EH25zl2aQcsYe0nixnY
         WLaQSJmsngeyc5s1cnCFtxMZp3b0b19b1/6rJtCJECbQj40TeS2P0kU2QSI+NIoAgEgI
         POeflL7vQwlCVfQ4zIBxUUTeuhIg252m6+qCrcnkF09jOqvAH9FbWkSv+JoapWHrsLDG
         1iGkGXOMFVQC4OGhj9lkAxryCxyFlW87aHw1DpAUMYGS41AjhdlVZSr7TIsW+EBBXZQA
         RPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310814; x=1732915614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUIPeel9q6rTb9NBV0RW6duJ36y8MFQX6IU0vwuvl9E=;
        b=TdO+O2Ny+UFqmgRqqUilJDk4iVIPkI7qdJ7I0r2wy+Sqy7WlOSyq9bqUtdNkQG6O11
         tnhA8cM+CsmfvF+xD5ltpN+BTcy92j+qsh5PwKWjsnVnw0ECnduslIKnSQp6X5j1j2N2
         lRgXavY9b5HvhhmsVnFyOLOVnu+nR+N61vBBrrwl5NoPpJtO1TGBmMYegY8iKeSlFqY3
         XDZV02oiLsFcIfQaG1aL8zAyPf19hwyCMvN5YHLuGBGx6PTQ0TA+wu5v/7cKlNlwyMIV
         OenId2sLlxKPeyTNK6EYCdDOJZsgj55go2ldxMpuHSXZPz0Cjf9K2vaFrjokQrnkVnCd
         wW8w==
X-Gm-Message-State: AOJu0YwgxSYu6YeS9KoWugKkMCoGy6Ha+16vcAIzuaJo/fp4l4WZk1O3
	iEzKVP3OvXtmcmlXsnwpOYBbjRpaTebB42xqZt5KRlRSxX9bGD9m1FLOb6be1Xl6sVkXGDWYaEU
	p
X-Gm-Gg: ASbGncvICmEnt7sddjOaBB1TwfQYYXnFY8PeSRRX3aFmJocyvYcTRfshgo5T5MPfVI6
	r+5HvAyEMvAVwA6zGlmBxBtKWWLb3NGOlt91YqCsJN370muLAE0mnhrHBPiFoGzOoH8PbnsWb7V
	sAgVn/7LOkTZHcEiogYaIqOoGLXrYEGIz32E4IpD6QdfBqg7JZHHcafv71sYMRjSKcEVIUNZD+F
	qBK/klP5YcbrMdNALGd9xq9Sin0tanTXy6F4zE=
X-Google-Smtp-Source: AGHT+IEq2Rtry3U1NC+InMkhfOjCqwi7n5T8dCiX/KlisKRBO1GR39vR7MOmUbfHRcZehEEdcEX3LQ==
X-Received: by 2002:a17:902:eccb:b0:20c:7196:a1e9 with SMTP id d9443c01a7336-2129fe38761mr65976225ad.13.1732310814401;
        Fri, 22 Nov 2024 13:26:54 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.26.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:26:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/19] glib-2.0: Backport fix for CVE-2024-52533
Date: Fri, 22 Nov 2024 13:26:23 -0800
Message-Id: <c7ecdd6530e18efd651e2ea57565481f66f7b1cf.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207654

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/glib/-/commit/ec0b708b981af77fef8e4bbb603cde4de4cd2e29

Reference: https://security-tracker.debian.org/tracker/CVE-2024-52533

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/glib-2.0/CVE-2024-52533.patch    | 49 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch
new file mode 100644
index 0000000000..3a06a9d782
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch
@@ -0,0 +1,49 @@
+From ec0b708b981af77fef8e4bbb603cde4de4cd2e29 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 19 Sep 2024 18:35:53 +0100
+Subject: [PATCH] gsocks4aproxy: Fix a single byte buffer overflow in connect
+ messages
+
+`SOCKS4_CONN_MSG_LEN` failed to account for the length of the final nul
+byte in the connect message, which is an addition in SOCKSv4a vs
+SOCKSv4.
+
+This means that the buffer for building and transmitting the connect
+message could be overflowed if the username and hostname are both
+`SOCKS4_MAX_LEN` (255) bytes long.
+
+Proxy configurations are normally statically configured, so the username
+is very unlikely to be near its maximum length, and hence this overflow
+is unlikely to be triggered in practice.
+
+(Commit message by Philip Withnall, diagnosis and fix by Michael
+Catanzaro.)
+
+Fixes: #3461
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ec0b708b981af77fef8e4bbb603cde4de4cd2e29]
+CVE: CVE-2024-52533
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ gio/gsocks4aproxy.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gio/gsocks4aproxy.c b/gio/gsocks4aproxy.c
+index 3dad118eb7..b3146d08fd 100644
+--- a/gio/gsocks4aproxy.c
++++ b/gio/gsocks4aproxy.c
+@@ -79,9 +79,9 @@ g_socks4a_proxy_init (GSocks4aProxy *proxy)
+  * +----+----+----+----+----+----+----+----+----+----+....+----+------+....+------+
+  * | VN | CD | DSTPORT |      DSTIP        | USERID       |NULL| HOST |    | NULL |
+  * +----+----+----+----+----+----+----+----+----+----+....+----+------+....+------+
+- *    1    1      2              4           variable       1    variable
++ *    1    1      2              4           variable       1    variable    1
+  */
+-#define SOCKS4_CONN_MSG_LEN	    (9 + SOCKS4_MAX_LEN * 2)
++#define SOCKS4_CONN_MSG_LEN	    (10 + SOCKS4_MAX_LEN * 2)
+ static gint
+ set_connect_msg (guint8      *msg,
+ 		 const gchar *hostname,
+-- 
+GitLab
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 239099d568..8007de0613 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -50,6 +50,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2024-34397_17.patch \
            file://CVE-2024-34397_18.patch \
            file://0001-gvariant-serialiser-Convert-endianness-of-offsets.patch \
+           file://CVE-2024-52533.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.34.1


