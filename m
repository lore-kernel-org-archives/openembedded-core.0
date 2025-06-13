Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DCBC7114A
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 05:45:38 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.3311.1749793536965330044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 22:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YKAKk9vv;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742caef5896so1640478b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 22:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749793536; x=1750398336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+s2nC+Hm+6KINXb/aOd5OghlH3ucM/ZisS290/w0uA=;
        b=YKAKk9vv2cPXUXbzS2yzpb1MiH2pcNsp54ndxN95F5jd3q8CaJyGf305tZP++BC+Bs
         rl5jSkEMpoXM1fWDVrwVgwGs3sjgoMwt0XJX90bjlxtZkhe7ywIAG9MQnAscE3oqPfY+
         zk8wLpM/hSFva1Um1JTzoGpqC8KrHVEo0pYRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793536; x=1750398336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+s2nC+Hm+6KINXb/aOd5OghlH3ucM/ZisS290/w0uA=;
        b=pvcxt1rYziNwu7/+FS3V0/r5AXq+dyxlgSE4mbWgdyQvP2jGLmQVNb5cC4xm2CMjlT
         n80YZyaK9jJGxqGE6DT0VFgwstJAhzeCcRa/zcCQJNRMTX5YSyD6HG4AryvBSiQMGmLu
         69098Q1RLHzLjsxOi6GkcP0ZHQq2sJWmSb3fbOPFNUJWm46wQdhRbjx4FxGiXTdFYbEl
         Npl/XpMx7JFz32OIEw6WpKzlM85XMaSdHTGD8Co6oliwebRt9a9Op1vrxnjpO4bjjWtc
         kCkuaZYt7/+3EPbIOuqj45fToYJY9qeGGBolZHYQWihY0e1noFaB5xr8YbVvfyGit99/
         FiWA==
X-Gm-Message-State: AOJu0Yy53d236vS1OZlSCRz6xwvDLHYZl3OMCYIdxNTrdaE2Vx1KgJ9T
	KUV5N8SG1I+RsikH8eecGEp6ZXDrDiIyua84ic2qh4aeevpZxfH4pOckwmE3jhFyVZTpXisxCyb
	zlfcQ
X-Gm-Gg: ASbGncsWIpBeAdAvWfeeN8j+S31FSddocy4O/RHaMc5srJUUeP4kquALDoj84Drr/Et
	c1xBvJyNasmeXVBio4GH8OayyybKRSZZFe5faPlZ3X3A5FrnEf27Et0EfHOTXYlKEVdmoO7PMvi
	Yn4+3F3T/YExxX3RXTdl93MjNGaf1wGxAJbcOLh3L+9nNWfMo0cTuYbCViaQzepjptZzwmiK8tZ
	Rwx+tlFfmZl5wuv7eaL5rp2ZKMy+UyzhIjXk/5QEEX1P0VkqPuXMBYVawvbzPsjtoAwuFvuWSzn
	dASFQnitmbBkoShjJl/mqMF9zeKGVz6lxusxK0QJTuAKM446rL5xP7O5In7dyHsrr1GkPVNk
X-Google-Smtp-Source: AGHT+IGKHEiuURyCGzi0ONfQp7/KvAHxc2VDcMTwKnT0IugMT69BqZGW0C3zrU7DGECBmVjO6x3yww==
X-Received: by 2002:a05:6a00:4651:b0:742:aecc:c47c with SMTP id d2e1a72fcca58-7488f63e974mr2676688b3a.7.1749793535877;
        Thu, 12 Jun 2025 22:45:35 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.197.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ad24csm764910b3a.109.2025.06.12.22.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:45:35 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 8/9] libsoup: Fix CVE-2025-32053
Date: Fri, 13 Jun 2025 11:14:53 +0530
Message-Id: <20250613054454.112590-8-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250613054454.112590-1-vanusuri@mvista.com>
References: <20250613054454.112590-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218583

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup/CVE-2025-32053.patch      | 38 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch
new file mode 100644
index 0000000000..7860526620
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch
@@ -0,0 +1,38 @@
+From eaed42ca8d40cd9ab63764e3d63641180505f40a Mon Sep 17 00:00:00 2001
+From: Ar Jun <pkillarjun@protonmail.com>
+Date: Mon, 18 Nov 2024 14:59:51 -0600
+Subject: [PATCH] Fix heap buffer overflow in
+ soup-content-sniffer.c:sniff_feed_or_html()
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]
+CVE: CVE-2025-32053
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index b62e4888..5a181ff1 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -641,7 +641,7 @@ skip_insignificant_space (const char *resource, int *pos, int resource_length)
+ 	       (resource[*pos] == '\x0D')) {
+ 		*pos = *pos + 1;
+ 
+-		if (*pos > resource_length)
++		if (*pos >= resource_length)
+ 			return TRUE;
+ 	}
+ 
+@@ -704,7 +704,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
+ 		do {
+ 			pos++;
+ 
+-			if (pos > resource_length)
++			if ((pos + 1) > resource_length)
+ 				goto text_html;
+ 		} while (resource[pos] != '>');
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 26fe52937b..a90f683cb8 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -34,6 +34,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784-2.patch \
            file://CVE-2025-32050.patch \
            file://CVE-2025-32052.patch \
+           file://CVE-2025-32053.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.25.1


