Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FD5C677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:08:57 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.90686.1749571735586542519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DbWT6k+r;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2363e973db1so3988985ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571735; x=1750176535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nCALkXuQ5LD1toiMVuGOga+9phGrzMKhTyHcE3R5ZE=;
        b=DbWT6k+rze/HZZZvAE+JC9vugK3rF5qHie974CfFY0CL4qun+OSoYHLY2+cQBIlQbQ
         mInBPgtaYqeDqOOr4uG1SPx7gvSFCO4m2MlKNRUARLPLGp/06yG42J6rhU8m73FpwImn
         mGm6K4B6WmrLDVbaf/x9OPRkxLVeQMHBOUb03EmpHY3K38J3plYVXFc6iJq5Q+xaYuf1
         7xtNeb8av1QkssUHKsF2XWb9dxY2nRqzUfWlzlDkb3NepYocI3oRRPMQabUiQFVLUSQY
         xy4E4elfSYl4Ly1zhuPJBgWBP88ZEJEuWkL4CA484vO65BBkeyuT/X2fU3fQWTxPk501
         +a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571735; x=1750176535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nCALkXuQ5LD1toiMVuGOga+9phGrzMKhTyHcE3R5ZE=;
        b=wU21VbrD/srWFs6dacSYSMUXDYWChjkPu9D96JyHPpLTCRclWszz5yk+GSN2/1KOen
         tR73Kb8/xxmicE0AtiR/4eY6UdwRObU8P4Rkn2ts87jFFxPoVE2nPNDHDamTnUU5qsor
         kbH1auGtsmCv5+BEvOy4LPLfP3gBNfHUD94G/BagcHvkoRvPSTtpe4agIz89jKhW01n+
         qY3xWLXh4iz5KK9RJ9Ur7mLWs09U3e565Vcz+gQqgEN315UDX92UtQ+Wyu5qKJtN07o9
         yQ3Eq7wC4rHG0XQMRVcywyY/01pbqiVLWsRnnShYPw5teG+14WORyd/nJLJeWSA5dQgD
         +amw==
X-Gm-Message-State: AOJu0YyN39yjf11OfaKPaSB1gfwG94RhL2jaQBo+RHJ935aq/f62n6KO
	d+0mIxeubxfmprv+fgoRDJZd0ua8dWTQnIXlgEZb/ENdQY+r0cSJH+QrqjXYWdUz/3eQNIRgTL2
	c7rIl
X-Gm-Gg: ASbGnctAAKlHcmphUzSnCQTZiuttOv92qQYz4gtG2gccI9KboFAXWMFUpbnInTOe/P5
	HgoMH6cnp8MszCTo4YweiGKLENmonb9PtZFddrz4dOr+SijAn8SRPcGhNzt7BduY+PNmBVTWJ4U
	hQ8Gj9vFE50T0XJiCMq52Hv7EJWxafnTHffsiEpchYXpEhj2uRUas/uthOII+wQflprqGQF/Dub
	Szh/JJ33g32EgmVLa5MQAMZiGqProYPSJPKm52+2k+BJftKU0hIiiEDbV+JB2CO5qPMese7i4aV
	DQmpgi8s/dS+H4zBVJwT7KPueu/EaO2dKG5Q0SGLxfQnBOFhkbrDjQ==
X-Google-Smtp-Source: AGHT+IFW65GRXyWBqWqFQeW9gl1Nz628w/l2a5vccHQlqS95Ey6UrCC5R69IurDJRj8lonaNoFAmgw==
X-Received: by 2002:a17:903:1a4e:b0:215:58be:3349 with SMTP id d9443c01a7336-23635bdaa89mr70707595ad.14.1749571734674;
        Tue, 10 Jun 2025 09:08:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.08.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:08:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 03/32] libsoup-2.4: fix CVE-2025-2784
Date: Tue, 10 Jun 2025 09:08:16 -0700
Message-ID: <1d00d1aa58b15adefb9f6ef5e85517018377aa63.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218372

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/422

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   | 56 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
new file mode 100644
index 0000000000..106f907168
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
@@ -0,0 +1,56 @@
+From 2eacbd762332795e00692ddab2515c6da23198d3 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 14:06:41 +0800
+Subject: [PATCH] sniffer: Add better coverage of skip_insignificant_space()
+
+CVE: CVE-2025-2784
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435/diffs?commit_id=242a10fbb12dbdc12d254bd8fc8669a0ac055304;
+ https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/442/diffs?commit_id=c415ad0b6771992e66c70edf373566c6e247089d]
+
+Test code is not added since it uses some functions not defined in
+version 2.74. These tests are not used now, so just ignore them.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-content-sniffer.c |  9 +++----
+ 1 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
+index 5f2896e..9554636 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -612,8 +612,10 @@ sniff_text_or_binary (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ }
+ 
+ static gboolean
+-skip_insignificant_space (const char *resource, int *pos, int resource_length)
++skip_insignificant_space (const char *resource, gsize *pos, gsize resource_length)
+ {
++	if (*pos >= resource_length)
++		return TRUE;
+ 	while ((resource[*pos] == '\x09') ||
+ 	       (resource[*pos] == '\x20') ||
+ 	       (resource[*pos] == '\x0A') ||
+@@ -632,7 +634,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ {
+ 	const char *resource = (const char *)buffer->data;
+ 	int resource_length = MIN (512, buffer->length);
+-	int pos = 0;
++	gsize pos = 0;
+ 
+ 	if (resource_length < 3)
+ 		goto text_html;
+@@ -642,9 +644,6 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ 		pos = 3;
+ 
+  look_for_tag:
+-	if (pos > resource_length)
+-		goto text_html;
+-
+ 	if (skip_insignificant_space (resource, &pos, resource_length))
+ 		goto text_html;
+
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index b42a8f9520..f66ea6105c 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52532-2.patch \
            file://CVE-2024-52532-3.patch \
            file://CVE-2025-32053.patch \
+           file://CVE-2025-2784.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


