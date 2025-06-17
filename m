Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7FFC7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:54 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.31416.1750195248116790568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tWYq88Lf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748e63d4b05so43091b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195247; x=1750800047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vL17hYzMkC1jVNUju5pERinJecamZ/+ZyFPSDrpX1YE=;
        b=tWYq88Lfbi7rLh5ffgxeLuzo1QGCQv1ii4hjjCF/KL7AUdq+1cu/6ed3syOoAeDueZ
         pTid6fRycujrnb/unrqfo/VIn17TcKY/mPZJ0aNkMSRBn3mCxzHfpIpz5AebGQX+uEBU
         MTok9erMEpKarv0Ahri76bmIpWQr4G5ux9aMmNyvIZsA7hIPN86w5nNKp7J0OOGO6BsO
         +BFmWquHitwbhf66tZotdoiFRDYlx8Zo09U5zIYy4ThMba5N0UWR2xjLRqBEYVGi64O1
         33zgQ1y0+ugXV1zM1UbM5Ae25Ky4M7afE0udgMo89kbFlzhf80yf5ihbe0e1gApKmDqj
         F0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195247; x=1750800047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL17hYzMkC1jVNUju5pERinJecamZ/+ZyFPSDrpX1YE=;
        b=bJfildfT84lL4yNEEs1xj3tTVEwDEQ94jF7gNLFQHInFCMRpk/F1yUI2LFLh4GdfZv
         4F9VWYLr4ABrGakstZ3xLDI3PZytiXz++L8q9VNttMAdk4E89qpPBy6Ved1wd3AeJd70
         ig2TlIGhiMbZ/pXSGxOZN8WQRJtaxOzjposUnsFlSmbVjProPDR9azOzUzHAqL8geEOD
         U3iHsJXWtLq6rMlJZIxUdlg8kS6+PK/thwLkDIgyA6fKszTxzNhK49BAIPWQPCPJcJzA
         Ov8WeT6fAki2o9SzpJus3ubHg9+KYOorbOTxzas44UFcfLSRYAOGm1BbJ2YhOAQdDVk2
         j0Zw==
X-Gm-Message-State: AOJu0Yxhuy6OBAYmvxjgJsqcibUWdqjJ3LyFhBYnIAdPk98s69UqgZK9
	QTTacUJ8J5LBkba8o7kGowOZA2sQ6F2Sc8RfBwcMHIDMYBj3ofEfF9JXzIVrrn0RKUiDpEqUVY1
	It/fi
X-Gm-Gg: ASbGncvrJloKOyEJ3UIYDcsPbirm8W96WklG0YXw0vhw+5uC3pAfNJuv5NnhYhzTf5A
	43nqQA4lSQ+Qyrxr+zv510UeOQAlCSSOInI3fHfcI/z8C8Q4raeuCxZdEDWu22s8hDUXv7Kt0uG
	7rzOpVQ4QnV85izaW3SAubdUnjKS4mgnzXj59zZveci+Rf9Kg5TT9u0PqCF5tII0Ggyr9iyxdVL
	zkkQcngfJgYHzNtOlqYNwugPesIiOObWKascKm8TNgsQGuGWHGYBw+YCMP+kdPfvtuu669T8L2E
	YOl/4NPNANvjzrfo4mjVF4bTpoc1yx0X+8T3nTzPHC+x4tIk3pVk7w==
X-Google-Smtp-Source: AGHT+IHUrfv75cwMxJS4SD+uCBXS1zxDH+t1qFDbbzlvf+XZug1T0LaKlRaR/H5rboDBNagcPgcCUQ==
X-Received: by 2002:a05:6a00:4646:b0:748:3822:e8e0 with SMTP id d2e1a72fcca58-7489cfd5dbemr20084242b3a.13.1750195247252;
        Tue, 17 Jun 2025 14:20:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/27] libsoup: Fix CVE-2025-32052
Date: Tue, 17 Jun 2025 14:20:06 -0700
Message-ID: <f1e94b33fac8a1587aacfee13935587dfc6c147a.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218926

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc034050510da20c93256c4fa9652]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-32052.patch      | 30 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32052.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32052.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32052.patch
new file mode 100644
index 0000000000..fca43e24ac
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32052.patch
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
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 27aab1468f..26fe52937b 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -33,6 +33,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784-1.patch \
            file://CVE-2025-2784-2.patch \
            file://CVE-2025-32050.patch \
+           file://CVE-2025-32052.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


