Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED696D637D3
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 12:39:18 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.35966.1731587956225000929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 04:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iUhtgc/X;
 spf=pass (domain: mvista.com, ip: 209.85.215.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7f12ba78072so396198a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 04:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1731587955; x=1732192755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E/wnMEvY/zQKd0OyGb8AK3rY1h8a2tGBiiZg7ElTqN0=;
        b=iUhtgc/X+Ss/bS7g/s6UBtlhuyy+r8uir5YOlXE2f5/mhdxhldBnod6WRwWo9SxSMN
         Gqbt2o4LIdupskZeUDOTsWd7NkuQ2grCkAhu+tQ756vMOeRo48k7kmmHhyYL3ecu3379
         4OkcFVroDa5LSgXAXGKI84zn8WT90x+p+F+Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731587955; x=1732192755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/wnMEvY/zQKd0OyGb8AK3rY1h8a2tGBiiZg7ElTqN0=;
        b=Y7Wv0nmAB6VSayvKr3YzGwPU/cfa8p/tKgNwt0RrUekSEIuhLF6+qZHPuapKZUW8B/
         khlI+mkPrXsQT9V0KXiO8AecRRK9k+/dmlQwaWy+wKtRhxLkAk3SX317neIvQWwn9b5y
         +sGSkxIcrZWf4IMi4mMAECSr1C7ikFF1DWJAmT7DEOt4hgUsK8Yqkcsg+fAIjjsYOnLa
         +oFheN6LTeqmo2qsUCjdocRDBagY98JK+lPMU1gNTf/mzVtqSfoe+kukH7yyMR8Ckcsa
         NksMqNh6deJm2i1GBKw9ptgOmcu20Us19hhYTLE1F1bUz00BmZbYVEaxiRu8NzEur50f
         lDXA==
X-Gm-Message-State: AOJu0YxiSJ4qrNm7JViMwu0/5D8Ccf+qqPikmLv+zW7TuiJzst5q1Ul3
	imLwKEXyL/rV7fXlKv8UcImQF4bOWhvXUJ+6cY4/sEfcjTdg06I2iHWvZEvraHv17DVrHkwLURI
	pDrY=
X-Google-Smtp-Source: AGHT+IE2INykOojqjV2l5y10UgUAR+50OT3lttMLoWlyB1QG9LISyLyVOoT7X5fpbKB7BIZuijlxLA==
X-Received: by 2002:a05:6a20:a124:b0:1db:ef5d:48ef with SMTP id adf61e73a8af0-1dc22937e05mr30525760637.14.1731587954727;
        Thu, 14 Nov 2024 04:39:14 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882c:4c21:71dd:eb14:29e9:677])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7246a5ced45sm1135138b3a.33.2024.11.14.04.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 04:39:14 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] glib-2.0: Backport fix for CVE-2024-52533
Date: Thu, 14 Nov 2024 18:09:03 +0530
Message-Id: <20241114123903.5013-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 12:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207156

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/glib/-/commit/ec0b708b981af77fef8e4bbb603cde4de4cd2e29

Reference: https://security-tracker.debian.org/tracker/CVE-2024-52533

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
index 35b51a3ec9..c628ac19af 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -49,6 +49,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2024-34397_16.patch \
            file://CVE-2024-34397_17.patch \
            file://CVE-2024-34397_18.patch \
+           file://CVE-2024-52533.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.25.1


