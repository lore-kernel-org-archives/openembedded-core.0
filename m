Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B43C7114A
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 05:45:28 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.3307.1749793524498676240
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 22:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QxTqa65g;
 spf=pass (domain: mvista.com, ip: 209.85.210.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso1639708b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 22:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749793523; x=1750398323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qP4Bbid2OGfEsoHMvRCNLYIk7baWGsyN/3OaoiEexsc=;
        b=QxTqa65gv5CF8Fc5guGWm8C8ZhEMuWR/yAt6gkSgJZusfqyKwGc5j0suK86s+LZagd
         fqerLU7O/nU0jBEKVJlY/moObVNb8gU2aomoMhyrCsBxLp0HDpW6HvBFpsPYLdRdTwHZ
         DPQjPEZHXl26+y1BKYfCqC9Xo0v/2s04unAjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793523; x=1750398323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qP4Bbid2OGfEsoHMvRCNLYIk7baWGsyN/3OaoiEexsc=;
        b=sepXGus1J8tPyxzzBEpavZcO2MxRpx9JZkIFUpvQkFEXbJC41/YDRoa4mdGtbDVXm3
         dKo2VtSSEeYV/Vq1DILlNaMlq9iKryG5BhKMsTDVlPdPa49qplbpkQ65PSxKxfRWPiDI
         bFMImRfwtNkUTIIkAz5hhO6sXB3RoVmv7XB+E3znL2pLjhB8tB3RuJZNRC7zLD1LrSlZ
         Wgmu6r7yYXQJavqR5eDW/VuMsUZiWzGPPnHgX4R04U9ezvd/Kr+acUuNzYA1K2r5+15z
         icgD8UYLUyL52radZ3JYx+brUjST8nSJ1ZYkntVjAhqgThmBFSyXQMzPN1d0wZbdb6ed
         mssA==
X-Gm-Message-State: AOJu0YxbltkOInEfWoQEEupW/qFk1Bj+BLSJRBYFbCkSinBc0/Fek5Z0
	qFi21mQiz/KS4kUWGs0klUzYj5fDXfbRAOtZdxduFXe5zH/cNXgD8k6P4LsPMPObf3LiA43SUi/
	z06bk
X-Gm-Gg: ASbGncvf/fvajK7Hfy4uJ0VpR49+p4lgFIEGGnMSDMSCGzbojhJd+L48dIpRNTSa4bt
	tdgzvQE6zv0S1Mw3xqXNWq45rpNHdh/PBB3cnLKsrrCLJkokogoBpFJBcOxk3Aj+i3WmqN21K22
	a9wOEQRX2S22G5NOdhsoQg/b/n79II2d1jcOAhwBx/PDTwX8uin0Oah/uTSDkAkSxbD2g6s9U8h
	v3AWk5wKkrRq9KM9aNx2MnM4ZpoOVjyj1+34tzLM6wNs0gLCVIDCamqIyI8bLKnT1jZWhOhJF55
	NFsVH1Bytg1JcOoB0UKK2L2bqqXiSreEy71M9Yt3vP2RHUDIR4xKcJwZY6TrQOfFPimoQieQ
X-Google-Smtp-Source: AGHT+IGcw80ylsehpMPwasQnLbBlEYDexecSexn0fPWSo85IQGeVPGblJhn0ymiY2ImgUbyrRgB/pg==
X-Received: by 2002:a05:6a00:188d:b0:742:a77b:8bc with SMTP id d2e1a72fcca58-7488f6e4af2mr2675494b3a.2.1749793523539;
        Thu, 12 Jun 2025 22:45:23 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.197.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ad24csm764910b3a.109.2025.06.12.22.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:45:22 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 5/9] libsoup-2.4: Fix CVE-2025-32052
Date: Fri, 13 Jun 2025 11:14:50 +0530
Message-Id: <20250613054454.112590-5-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250613054454.112590-1-vanusuri@mvista.com>
References: <20250613054454.112590-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218580

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc034050510da20c93256c4fa9652]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  | 30 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
new file mode 100644
index 0000000000..152b70fd9d
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
@@ -0,0 +1,30 @@
+From f182429e5b1fc034050510da20c93256c4fa9652 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Sat, 16 Nov 2024 12:07:30 -0600
+Subject: [PATCH] Fix heap buffer overflow in soup_content_sniffer_sniff
+
+Co-Author: Ar Jun <pkillarjun@protonmail.com>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc034050510da20c93256c4fa9652]
+CVE: CVE-2025-32052
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index de0985eac..b62e48889 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -524,7 +524,7 @@ sniff_unknown (SoupContentSniffer *sniffer, GBytes *buffer,
+ 			guint index_pattern = 0;
+ 			gboolean skip_row = FALSE;
+ 
+-			while ((index_stream < resource_length) &&
++			while ((index_stream < resource_length - 1) &&
+ 			       (index_pattern <= type_row->pattern_length)) {
+ 				/* Skip insignificant white space ("WS" in the spec) */
+ 				if (type_row->pattern[index_pattern] == ' ') {
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 6b227b0503..f9358773e4 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -35,6 +35,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784-1.patch \
            file://CVE-2025-2784-2.patch \
            file://CVE-2025-32050.patch \
+           file://CVE-2025-32052.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.25.1


