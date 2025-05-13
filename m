Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253CFC3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 09:04:01 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.71672.1747127039784535432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 02:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QHBq/vf8;
 spf=pass (domain: mvista.com, ip: 209.85.215.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b1396171fb1so3566199a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 02:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747127038; x=1747731838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRetbm5um+AXKYFHSA10Fqy/el5klRJT8IwRKaYvTqs=;
        b=QHBq/vf8ev0qotKAqcM6JD2ydcNTfcoM2N2ZSltenf+SVTJYM/YMVBmFSeIwDXR107
         dacOAyHKcMtuIsEtI01KZYqh/c0+/mfkIBZA+RopBYvh8yHfdjYvG0w5kn/Vg26ATXpM
         HbfP/7JjgtIkRS39IHyui8etdOzzoxJldP2DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127038; x=1747731838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRetbm5um+AXKYFHSA10Fqy/el5klRJT8IwRKaYvTqs=;
        b=A6LkAm7OEGaaQMBeVnE0vooARDRxEP+QeNRjhc87cNxXNKQHTOJ7oBeIORH4qMqLfx
         u+iOBRFvzt3Z7fV8OdnizKfunJEy6BWNwldG+7sQEAmIn6bpTytjjmZQOOW22QsZM46N
         IRINksvi5itc0mp+ReIDc5ykfOEHEG4o6WGOORq9DMPV3HXeh9lgefZsTfRQklqd5P3s
         svcftGbRvj/e9Q0+U9UTAkEX9n5zj2ta/QT93YkbUc3Vm6YGuXWSjUgXXdPfjiXT7CjU
         0IPTSelPxojfqKqB1ueb4NYlGRjtLjPLWY67cnVe9d+scynoCMg2js0NDszfhSx7Duvq
         tLNw==
X-Gm-Message-State: AOJu0YwBdaud5152GIGETbaNykd9eu34beLnUKyqykdLSTk3uSQW/s7T
	gStXGwvcPFhgr+tnr5YQQWYaGunJQlHhRrJ/6TbIkM0PhKc9iONYJ3lYhfW98SIinjXe4S6gcfh
	5wpw=
X-Gm-Gg: ASbGncsbQ/iuW8gnFn04YfStH09Is329gGRW8gv9bSjHK+Fr6r5ktNox6JqR9/DhZHV
	ASjTt0FZ2fAHl1CYg0KfU2VIqJgasXqP1K2Nwq2ZTrpB7wcfsBFUCP9VS23wGwLRmH174rCcbmz
	5ls+MTAEMorGs+PjDcw6lbVilCSK502ThACyCnCrRqobaZ+B/QpwPYh+th5VSX5sehCqNz86Tov
	TVhxhW7lw45THtzKN9qvaRf+pXEMrOmu47jg5rI4MFIk2e9E99V2V3FsDdrditKfACMLQ9/WMAx
	swpCK7fSC0vL3xooQMT7jMz7nCdHa9HiBC5gtdLBiTQwqk8Jdt+BQ2G1urUNUPoCo7yGLf84AA=
	=
X-Google-Smtp-Source: AGHT+IEOOQub5e2calpwSOK0dEOHOBHBGq+IFIZW7eS2qAtBNucH9rG6JBif8HeE7r0FIrdVDOS5nA==
X-Received: by 2002:a17:902:c94b:b0:224:216e:3342 with SMTP id d9443c01a7336-22fc917e22emr258451045ad.43.1747127038237;
        Tue, 13 May 2025 02:03:58 -0700 (PDT)
Received: from localhost.localdomain ([49.207.220.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829f388sm76574885ad.214.2025.05.13.02.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:03:57 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 3/3] libsoup-2.4: Fix CVE-2025-32909
Date: Tue, 13 May 2025 14:33:40 +0530
Message-Id: <20250513090340.2209255-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513090340.2209255-1-vanusuri@mvista.com>
References: <20250513090340.2209255-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216405

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/comm
it/ba4c3a6f988beff59e45801ab36067293d24ce92

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32909.patch  | 36 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
new file mode 100644
index 0000000000..046f20203f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
@@ -0,0 +1,36 @@
+From ba4c3a6f988beff59e45801ab36067293d24ce92 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 8 Jan 2025 16:30:17 -0600
+Subject: [PATCH] content-sniffer: Handle sniffing resource shorter than 4
+ bytes
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/ba4c3a6f988beff59e45801ab36067293d24ce92]
+CVE: CVE-2025-32909
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-content-sniffer.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
+index 967ec61..a1f23c2 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -227,9 +227,14 @@ sniff_mp4 (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ {
+ 	const char *resource = (const char *)buffer->data;
+ 	guint resource_length = MIN (512, buffer->length);
+-	guint32 box_size = *((guint32*)resource);
++	guint32 box_size;
+ 	guint i;
+ 
++	  if (resource_length < sizeof (guint32))
++		  return FALSE;
++
++	  box_size = *((guint32*)resource);
++
+ #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+ 	box_size = ((box_size >> 24) |
+ 		    ((box_size << 8) & 0x00FF0000) |
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index f409816fc2..00f7fea41a 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52531-2.patch \
            file://CVE-2025-32906-1.patch \
            file://CVE-2025-32906-2.patch \
+           file://CVE-2025-32909.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.25.1


