Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE5BE64027
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:31 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.10468.1732226066046755067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ce62wZKj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-724c50c832bso1138898b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226065; x=1732830865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcCPBv3GRg3FfHKVGIAKp2+AXMuJ7EQniFSm8PL0nk8=;
        b=Ce62wZKjaOBshil7FwHqJp/ybNAZyz10SHeuSL2RWBU+3/574i4AzGBWz4szooWZiu
         EkOnhJKiJKzNHo5TV4tJaF3DQN81rOPJDGYqGiLUoJ4K0zplAxbk05JZWBqgTU2ucZrG
         ky7zhF3Fcv0QscrRJLHlv/wVxNcDS6V5tIV6PRewuok2QGbNLGV7hyzNdXx/D2J0rOjW
         CUvLNBu1wrPW+GJXLvBy+POEENFOAcWMsonDxAGeiHv7wKPTqBQFe3OFxvgIEr7o74jJ
         MZZ3LsCN5aQIgHvLorAfWpl21i83eHu4mHn7xCew52dVRP46665SEZed5Kf+llsh2anh
         Z6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226065; x=1732830865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcCPBv3GRg3FfHKVGIAKp2+AXMuJ7EQniFSm8PL0nk8=;
        b=mQviTcd2dApid3yI1b7yHxFVC422oCvgu6MlSAAehc1B85sOtfw6P0yfCRSGyyskze
         i4+VxzNYhLXn82J4Zi4KjMBWu2oJu3hBsSiBBFIBadTnDuCS/ZEvrES122tRRoSHCC8r
         L6LQQP5lcWzOhphJ1w98uzZ3eppY2lYVYhqYDfwq3wtKXZ+t9d96A2pZfi0HjJH9KUc9
         AweJQ/1TY0wi73wTaxNKyCcm6mNTTDE8uj4JJuFueGQ2vxzvRkDIJWbumSQZi101jqdx
         9J92QWQ+xetPs0PmG6XuLF9F7TwCDsXeXT27/Bwyic3BDD76FveCyQoaAnrITpub8xV1
         nBHQ==
X-Gm-Message-State: AOJu0Ywa+jkHO5twOzq1+zjRsLSjd5S4QmGBQ8/q/fefzm2cEmQkYZ/7
	kKBCo0FloyOCkyoyZBwPdTcohuz0TGlqS7934S+UTqJCIllC2auxZcPOOL36KKKLjdCIvWRZsjW
	Q
X-Gm-Gg: ASbGncsqhEexMlUSecl0l0+OBZNYycRC8Zvsgy5Y4QMydkvfr3l5uPcR4h9fkmTBgok
	1VFnYcbhtLMCxgjpmCfDL6N15rqqMCGr1fkWZcxDMk9eZhLE+PtrWXl7Xfl3LyneBMMmSorguI9
	L2dEB7eTr//Ah6NS6n2q/GjDvJjgjzW7McAcI3sBCniLw0ULw1QfvJ/kMGZDsUNBkDCcGHDidaz
	QLfGrTt52pwIO5MP5UQi49y6GkjzbB3zaF2YYk=
X-Google-Smtp-Source: AGHT+IFdC4jn3EDQoRdZl0rpvmZ7+7muT8km0Pu6fB2sdYYVsYb6tzW1j8G60/VC3tQvoTLZCnK6DA==
X-Received: by 2002:a05:6a00:22d1:b0:71e:4ba:f389 with SMTP id d2e1a72fcca58-724df5d61e2mr765488b3a.10.1732226065350;
        Thu, 21 Nov 2024 13:54:25 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/27] glib-2.0: Backport fix for CVE-2024-52533
Date: Thu, 21 Nov 2024 13:53:52 -0800
Message-Id: <61e270156015be8c09d45a5065deed5f7b1fde96.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207557

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/glib/-/commit/ec0b708b981af77fef8e4bbb603cde4de4cd2e29

Reference: https://security-tracker.debian.org/tracker/CVE-2024-52533

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


