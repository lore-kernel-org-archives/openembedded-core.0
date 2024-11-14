Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D61D65C4F
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 06:42:17 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.31710.1731566532371759850
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 22:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WMZnp7Bf;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-210e5369b7dso2199155ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 22:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1731566531; x=1732171331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GdnnMJDG5sx7V0iXzSk5WfiA4+rVtT1w3ubr5uZySv0=;
        b=WMZnp7Bf0ivARxvqA8PJ88tuGYIPZQAkR5wECsmsU6WFRCx9sOjHYMF59p3E4E76vt
         FJ0fkIXDxuiTwxxjdPFuYTbguo14w0khSOCvrSHhOGmAbEfXXTGmJd0Cp3WttPKbHC0q
         HeWuiAxvHJ1OnMjMwRt+OfL/mGvjLDHc/m/Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731566531; x=1732171331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GdnnMJDG5sx7V0iXzSk5WfiA4+rVtT1w3ubr5uZySv0=;
        b=re/fLeeKz840FBfpMCD9xuawbZARk9sDaQoohbT9jo8aoWUsJOMfgYupMRB5VPBMyl
         piP3Owbc/na7gk1D9qS+4KIn/RRl3T5MEwKBvImGbwU1FrkiJRBgFLP2pI6wiR6HNBOF
         aTM44WvA9Kq9lEVxelKIXGmUyHDYzvoWyXbLAZyn9db/XOIuHwSg9RpZb+MOmP6rY2Xe
         aYhRmfsanDKlcubx0+sgNXp7QcaYxDNSSwfyTRiLLVe/e/6+tLkuB4QEpJtxqa9I0u+Q
         HFnMTVn/af8C6gXy8mGa1M6YUfsDjqi1SCK9AMNkC1tE3cSvuEaqkGAzkfgUCCnsgI4i
         Gg5g==
X-Gm-Message-State: AOJu0YynJSb5B7iFBjRxmJggwhZTTKob/46i2xfra0Hg+g44sLu1eHwz
	5H+NaB73A+LpmdN4kgTpTcGhuTEdSZsku2w0XLrizCWNMuruj+W83VTtSBTvIbn+Tb051N0o+aG
	s6Iw=
X-Google-Smtp-Source: AGHT+IEJnrO2fhK/CHzbtLHD7WJHw5grGXc1FHk9jqy3RY4n239Yx6k4EhDN62yhqfrxXYO8ZbbUGA==
X-Received: by 2002:a17:903:18a:b0:20c:a189:c006 with SMTP id d9443c01a7336-211c50ce276mr9767615ad.45.1731566531138;
        Wed, 13 Nov 2024 22:42:11 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:882c:4c21:4b4a:db10:9f52:6358])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c29a1fsm3865255ad.45.2024.11.13.22.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 22:42:10 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] glib-2.0: Backport fix for CVE-2024-52533
Date: Thu, 14 Nov 2024 12:12:00 +0530
Message-Id: <20241114064200.1186601-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 06:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207140

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/glib/-/commit/ec0b708b981af77fef8e4bbb603cde4de4cd2e29

Reference: https://security-tracker.debian.org/tracker/CVE-2024-52533

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../glib-2.0/glib-2.0/CVE-2024-52533.patch    | 49 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  1 +
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 1a4278b1bc..506e72bd4c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch \
            file://memory-monitor.patch \
            file://skip-timeout.patch \
+           file://CVE-2024-52533.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \ 
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.25.1


