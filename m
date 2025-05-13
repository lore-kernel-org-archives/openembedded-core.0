Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D36C3ABD9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 10:52:01 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.72961.1747133517447546364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 03:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VWrjOq+z;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b268e4bfd0dso3159699a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747133516; x=1747738316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u62Cxxl4mgtX/mI9zGrHRd0U7K/rK8oCMQVMIUTggII=;
        b=VWrjOq+zXjSHI2vlfFjhwJ5sO+aYvinXLU/sgGzk79w5t++ecb8LJ6iuYapDJadVDJ
         135/RPMeWDSKthg8hm7Lrn9CXuPar7JQ2AZVAzBNrCOyPEtiTNVIE2tWY0kQEFEbr4jH
         jS1V//Uhu08AxvPBiFAalAKe+Gjfd0Ock7UuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133516; x=1747738316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u62Cxxl4mgtX/mI9zGrHRd0U7K/rK8oCMQVMIUTggII=;
        b=e0uyFcG8h1G4HvQnezhBPUqF/zo/51HTFPV5QycdQrg6L/HGUbAyBij2w+vfsvQR05
         F7YC2nS3aCIUSg9O6fmZ5qjStXTMEMEWAOYkcWDXfvTkoyv7JY5vMSQVBQ+UEMEp2ZSy
         TjHgH0c/PxEL3LPTQ+2BkRsb/ocLlectJk1E0Z8ERrKoLDAoVkSmv97I02rp9Fg7DtNc
         +1lb/AzW74nywfERwGuaO2IGEqifFRMkTNNiNzbVDh0fT9b94kbP3IuCjL0ftPloc2GO
         ovLr4EkBsMiqBNbBTVXMJD0kl9r7hze0wqZQSsBV5E48sJVT1DSXQhH+o59pfKzLP6VT
         c6GQ==
X-Gm-Message-State: AOJu0YxgmXkVYUwkknc2lEf4RnRpjCMr6HEWeKCzmsvrjiFsiw/q7oPT
	yGicsBRojR/6J3DsEzA0FRj9Jq/2vmvFR5G5yi+5eScQfAOplz3KEVelbwtSJP1vJOcdomplTUY
	NGTc=
X-Gm-Gg: ASbGncu4cSpPy361yef2oA6VGapT4nSrMjLEWe0Iq49NEIE/J+vuUVohZvoHj6po/0d
	82HKIfqi0GFX6bVdMnmJAMVXJgOe0AMmbIJO/MxMz7DVRJq2pj4/ZO+Dyc0rmbk1vgbnEh4E17g
	yjq8+lYb8WiWWyyLHp/ALmiGltYAEYIffZvvQnQK8iR/Cn8mqwtSXDiJTu3CidwAFYlXecGApgV
	8MvpwlvbeMHHaB46R2eMo0whGmiWazJxaPt3R5h+Hl6F1GWQmCrPXjSYxXF0qtVDcBGcT7QGZ2i
	NqZb9ZCBW0znLe8Jg2mNQTTz7dHr+48kNId+1CpKgP9yY8wbCN3lmslwYOmLdrrWTzhonaZbBQ=
	=
X-Google-Smtp-Source: AGHT+IGP6izHoVQ3uu0U+02DhNJh/LgbqG4MJ11bd8SiKc0iRFsCgpwmo1YwAYNR5KLUWbRJjmEPSg==
X-Received: by 2002:a05:6a21:2d06:b0:1f5:8cc8:9cc5 with SMTP id adf61e73a8af0-215abcf3b47mr27861701637.34.1747133505304;
        Tue, 13 May 2025 03:51:45 -0700 (PDT)
Received: from localhost.localdomain ([49.207.220.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3d861sm7796759b3a.147.2025.05.13.03.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:51:44 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 3/7] libsoup: Fix CVE-2025-32909
Date: Tue, 13 May 2025 16:21:25 +0530
Message-Id: <20250513105129.2284690-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513105129.2284690-1-vanusuri@mvista.com>
References: <20250513105129.2284690-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 10:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216416

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/comm
it/ba4c3a6f988beff59e45801ab36067293d24ce92

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup/CVE-2025-32909.patch      | 36 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32909.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32909.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32909.patch
new file mode 100644
index 0000000000..8982da58f1
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32909.patch
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
+ libsoup/content-sniffer/soup-content-sniffer.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index 5a181ff1..aeee2e25 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -243,9 +243,14 @@ sniff_mp4 (SoupContentSniffer *sniffer, GBytes *buffer)
+ 	gsize resource_length;
+ 	const char *resource = g_bytes_get_data (buffer, &resource_length);
+ 	resource_length = MIN (512, resource_length);
+-	guint32 box_size = *((guint32*)resource);
++	guint32 box_size;
+ 	guint i;
+ 
++        if (resource_length < sizeof (guint32))
++                return FALSE;
++
++	box_size = *((guint32*)resource);
++
+ #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+ 	box_size = ((box_size >> 24) |
+ 		    ((box_size << 8) & 0x00FF0000) |
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index a5b6c2f039..4fa8fce1c4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52531-3.patch \
            file://CVE-2025-32906-1.patch \
            file://CVE-2025-32906-2.patch \
+           file://CVE-2025-32909.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.25.1


