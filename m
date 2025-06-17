Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DD8C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:54 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.31263.1750195246528255317
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bN285Zfj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74877ac9d42so3880291b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195246; x=1750800046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LN+jkE6gbryzGPNXj9CiWETmKlz1SpTaPplLQc5H3JI=;
        b=bN285Zfj125zjpb2MinMgl0pBgm+YBOd3PJbbMwZsvrFtmjv/7zGNpO70bjJBzGHJR
         n1TXg/MmOD79zgck1CPNqti1f3ACIDa7/LTjAUFVe1ez/dQFhCM3DnbQB5cAvDoS1gL3
         dNClN1CIZL9KtdGTb+cKY5G7LYqTwyLFooSn5F8wt+FJbmY05sWWAiHyDQmiOG9tyG62
         HzaPX/xZ5QPsPiJfVAvkbrmbKkw2llaQcbxY1B+THkBdDgg1AxLrTnldiOtzh5IYlsEi
         BCclMgZxMdomqWqtif6uiFN6lnkoWCIxq3yDP1JuIRwIdjpVjstAPVaIiFC5sMQCsMf1
         t+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195246; x=1750800046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LN+jkE6gbryzGPNXj9CiWETmKlz1SpTaPplLQc5H3JI=;
        b=fH4L2EwWFu1jfGVzAFTDhf3hZIngyrjO92bnmQD7Mka5KF7Hiy7eWwWsI1BBqkqcNc
         lYyvJlbjtqi09spHKCcI3geozyvIzKuchhwf6TbneCgJzdQi4yC1lsKia/vwDFZyXAuF
         cPndaoTWO1TIzEtJXnMRb3Wm0G5ksPPI4MF+/w1qa5LwO10ZUZkCOOOpZJTQtfSaoihJ
         2/whJtJ59yYrQP3z2TogBynZ3YPr3ek6SFgP30Q1ihXyzTnUe4vySdRRABjwyv1wBO2Q
         As4xI0U5rGCPLSb/sR6eDw3I8hweRQa+9OqgS7YT2iDQW1eWLRwfjVqxL2/Do2nEucMR
         hFjQ==
X-Gm-Message-State: AOJu0YwLo7Ifk5FXs1DNtSqs9CEBrE4o5f7Lbfu2Szgq3fo2CiLuBES4
	asj9SpmzgHlfAdxQbydNv8CfRA0s3inIjUcZF9qaQl14Lr03miVBn+/4aoUT9fkAL4kW9CfhA/L
	/HCTA
X-Gm-Gg: ASbGncuxdQudQW0B3eHCSWaeADzna9FW0DkF2XyRv5vZl7O9ztD+SzcKgzz15pcsSgm
	TGPr9E39NkRCwLBAT3dft/qYb/DyrjXU7rRut/Imnru+bhtoziF+gXcUDU2R5kZsTeZ4Kq62kHC
	pwps9aM8rp5ZROq/LJTGajzjbhpa9E15bXoocbiHwvBFXAXeJsBzijR/UPwN3OU0VwHGufMZBOx
	gR0m+GwOOx2FuZ+f3zKp7zzPhi+6Z3CHQjNZWymoZpNd5LKU+SMz5KPNfSZPQAFJna1ns1PrCqw
	OVvoxtg2uykjAU4T7d5US7BSwTaImlTolAGGtcuoYVZZN03s67ddrg==
X-Google-Smtp-Source: AGHT+IGLnNvVXVcYbNTJVemjZQY5Nc+HRAUa9Z0IlBcE+5sEfP7XOqvbXHOw5rR+HNiMOtvUBc54Hw==
X-Received: by 2002:a05:6a00:a86:b0:748:2cbb:be45 with SMTP id d2e1a72fcca58-7489cfd5e2amr16878046b3a.15.1750195245721;
        Tue, 17 Jun 2025 14:20:45 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/27] libsoup-2.4: Fix CVE-2025-32052
Date: Tue, 17 Jun 2025 14:20:05 -0700
Message-ID: <ab4d381f1cfd8613c23da514a0786a7505579203.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218925

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc034050510da20c93256c4fa9652]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


