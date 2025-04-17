Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC15C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 10:43:27 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.5733.1744886601730641643
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 03:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Gyf2TfLh;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227cf12df27so4860835ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744886600; x=1745491400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgZzUlbfjgXZ1QwLW7Puql2/KzFt/e7maHjYeDDsSWI=;
        b=Gyf2TfLhDbwT1/ySQPeq1WO9gD41h9dl++su4ff+jVywVPhtL2QRaEAgkXz60fB2q7
         U6HZZODjSj+ed5GRpkfbSiJsxL+F2QTzpqzVb5nA2GWBUP7fvk9Qq8FWrkwjA5J7lZss
         TLS92VP/Cei40kl++Es2NjES+jEwAfTMIfyOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744886600; x=1745491400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgZzUlbfjgXZ1QwLW7Puql2/KzFt/e7maHjYeDDsSWI=;
        b=kErxjvgUu8t/z4JHhjrpzt63A9pPUkNX1nqECk8vT/dhx7qJnUzkJ58mhddiaUkgV3
         WrkJzXofCSX4POcZ/rvrXH3k6npLnBa1MQmx5jERmdrN8xvz46JNz11jlhP4nNHIljfb
         6dtg+bGY1sCqop2WPqDpYfMY1MynFgVUaFnaGSzFtrZzDxm7mKUEOySgH6pwGdX7EuCM
         lQB2pnZsTtGRrp6JWurnKUfNlEaNp8BomubbKXRc1oNinlfIMyoqA669T0qDJTOXS7Jo
         7+gml1NNmerl4L/i6gxCXvyY7o9KWNtMDzUY1cZ6MgzKXdI89ird9BhnEailbkWZ+XTv
         jy+Q==
X-Gm-Message-State: AOJu0YyDNGvLrhIw52KzBVMGIKhgFKZVTMnoRbWFg4DLtkpOC7G3xzo0
	G0o3hfMQRlv5q5wSbBdF7ZmLHszuXVnvR/DmHp+n1FVFvcue4i2EO2onmPXNN/q6qZSjoOO5FCi
	B9L4=
X-Gm-Gg: ASbGncuUDnXEBIu/yLAiMIyeaHf7ktJyyoqfEoJyCspfmvH5g7cqlLmlV+JSyvZysKH
	wFX1s3r3SdkULjRo74RNFYL0+rhGFHIPmQYJmcPh7f0sb1tZ4/l/L6oS2N8ukP90vW5OJquYurL
	PN/RriHiok0hPFJd13HUPxnkkouSULz9ynRgEmhVcsV0quAl5A4lOHcVywqYqzhQtsktDT+UzP/
	pED9l6Z2iEofeCvUnDJzJ606hZypji7cCxJdZ7a4J3wmqKnP0fuxawdCqHtxJliwCIuxg/M4hvI
	0JNEd1f0/exgYc/zgSSeDjCGBBPB/iMUVc3SmBKT+DaTc7XLZrgZ
X-Google-Smtp-Source: AGHT+IHA1hzks3JKz4uJ/hDmRHjXx5XEi6qjwEM50YAS+CJSBTYjmWfheQIls1EV26la3DSTlZfjPg==
X-Received: by 2002:a17:902:d587:b0:223:607c:1d99 with SMTP id d9443c01a7336-22c41b65eeemr40044985ad.0.1744886600334;
        Thu, 17 Apr 2025 03:43:20 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.223.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef1025sm30346605ad.39.2025.04.17.03.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 03:43:19 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH v2 2/5] libsoup: Fix CVE-2025-32909
Date: Thu, 17 Apr 2025 16:12:55 +0530
Message-Id: <20250417104258.64180-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250417104258.64180-1-vanusuri@mvista.com>
References: <20250417104258.64180-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215060

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/ba4c3a6f988beff59e45801ab36067293d24ce92

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-3.4.4/CVE-2025-32909.patch        | 36 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch
new file mode 100644
index 0000000000..8982da58f1
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 757e6432f7..ec3305aed7 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52531-2.patch \
            file://CVE-2024-52531-3.patch \
            file://CVE-2025-32910.patch \
+           file://CVE-2025-32909.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.25.1


