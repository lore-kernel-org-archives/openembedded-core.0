Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90DDC71130
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:49 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.95774.1749584083908840615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XbTLLH7Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31329098ae8so170887a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584083; x=1750188883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMIKSHOSEUMhG/R/J6bRm7XZ3P1gqOpIV0xpRf+DZ6E=;
        b=XbTLLH7QxjfVuKX4N6DdN2AZjuOq5Z4jD5lk+O/Epg/mApGXZuib/WxwHLNWEVluNc
         w6TirYLR4CZ2/tr2PjMfY2geN6If7F77m+rMWXweeXrT7o1XtFgynZbj0XvwFHcjeAnk
         9lcGOVvJms7C/dOKQgslw/SNbaHBQTbtJRGqyAQJlMDqCpZfuh5EH6RMk9HED0P8OdML
         Rp3qAVOXipYSdvwKkdZnP/pkZsmSwxvmojP0riaakyqBsj6rnysNLZSlcSQ4aHejHXZJ
         y81Qq962aT9rvcA82zhHxIEywOTQTMRv6gEmHiu0mjZEMEDlQH5ZKS9+Hd/Gy1ri3BMV
         Na6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584083; x=1750188883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMIKSHOSEUMhG/R/J6bRm7XZ3P1gqOpIV0xpRf+DZ6E=;
        b=m9CaX8G/ab6ydcox8fpTSr+3mu4TTNFKNIi5DSbhU9qIFRIQgCWQLj4PVjwDAeHXbI
         IyD/GyhonP3+3tSlncwNxnPQbCsIsywfcrHWs8p5U4pUjGZizpihp32b+rsOi+zRl8bu
         fLSJjdjOqAa0Ij6h2Z5Mtt5+MGrtaB2f7Yo5XuB0w2J1eJNup+wi3KUesoHJ+TH3M4hw
         okjhP9NRnkoNZHSuq5UPKC+uJzpt9raDIW1GLqz1OZXDX1isDr4mAUF3FEtr1EZwVXQn
         mv+1UPnXMKJI57D19Qcq71vyZQzB6thY/dG16OQiRyMJuFPFYVKaB1EYIoYf9o3WNOBQ
         jXBg==
X-Gm-Message-State: AOJu0Yz5Q8z1PmFrkmVuS8Fxfg8qBDsk9W0Dz616NkgFC7QnfaJw/DgG
	ZtbtKVOHCOUEYL1GxDPXO/5ILMEMHY2YHAo93+LZixwek6V9JZ9I7rDmAX9WECezRPkJ0BNzZCK
	VmuN+
X-Gm-Gg: ASbGncvuJ0+0v9Xuo8w/aafgD3vdxiblM6gwuPklDR2GOoWhzl1OJkNg9Gpp8VHjUGE
	K58cjDiuVIs30R5bQHuBGezvXqRJaTA8zaITuljD3lmn4KtyzVNu107CPj42qbU073+qZTGAu6j
	/tqHPPR1oZHGM7DXOAfvOADp7v71851FkX13sxKp0irGsVTEb715EkJVJzKkvJfmlovnPC78GGW
	djF7PMFkwxlsMnWpjzj5r7Z3YW0ATVyrHoqXXLy2idMno/nG2Ub8SJ+I4+B2vXGMQmGve6PydH3
	eBLlDpbW9lkoC85k01wSkHqSi1MgoU+hxHGncIWHyZX5FP+gJrZhvg==
X-Google-Smtp-Source: AGHT+IFdGVgMCsTxbISRXRTywq2z0ipi6TYTyKGyQffey2F2FOZSnmKIa8C9Gc6/yl86Sevwy66vxg==
X-Received: by 2002:a17:90b:4a8b:b0:311:482a:f956 with SMTP id 98e67ed59e1d1-313af83e755mr817211a91.5.1749584082945;
        Tue, 10 Jun 2025 12:34:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/16] libsoup-2.4: fix CVE-2025-2784
Date: Tue, 10 Jun 2025 12:34:06 -0700
Message-ID: <9c014c1b96f4ebeb0f6f504b6c7c0d8063b6a6b7.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218416

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
index 8f0b706276..0da309ebd8 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -39,6 +39,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
            file://CVE-2025-4476.patch \
+           file://CVE-2025-2784.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


