Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B44C761AE
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:55 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.31418.1750195252990195053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZVGoTLCR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c7a52e97so5212737b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195252; x=1750800052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvstm/5o0G9BqzXl+W9wNYzAj/E1MN8duX9ZRWGCQ34=;
        b=ZVGoTLCRd+tqrhR78vXJlIR6PZw5RLGUi0plHX/RnXUrxFLKRl1rSrj7CGKhBxl7KK
         ah4oJyhYjVWN/SKdoBN8WVnSBOG9N75GALXuV/zoj7WAj1ALkwC4II5k+1SHP/4V+Yye
         9KrZuOjcIrzW8JEquOm9XvqlVxnt9XLAUz2LX5zjE6/PgMGmhE4oQohVBeHHhliUvs9s
         cHm+T2oD9QHJG6WEgA9nUA1rqB3GQ79Rd3mqFpRPiL7PShv2TKO+Vvha1CAZ+KhQd96l
         5OPBUViN2UTTS82YuJUx5yHjc6HESulY0kQ+aaayB/caErx2KbW0QZb7+jwdDzshRGrU
         lkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195252; x=1750800052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvstm/5o0G9BqzXl+W9wNYzAj/E1MN8duX9ZRWGCQ34=;
        b=NtHtw1XA6Mad5oUko+C01dif39OotKod7Pa4H5WD8An1TXvkWWSAUG/+XqjTuizsd+
         k/5w1oHmShtenRsfypyHG3PjxR/WLIC08CYLkSqxa5qfBiXXXvVBboP7Fwtr8sJ0oaeq
         dFGJ9XV6sDCRFgwTRpUmwyG2SLDNiQRcsr9d+hsKKi/w+nt4F2L6WmrL9MZFe/K3xedB
         J8MCJJxofmSfX7DBgENthGMlflSwjBtTD/ixGx/UFFlwaccjJz43I2n4rofQidOENBG/
         ylTlid5ENKt7Gr4wJaUs0TOJ6x3KNxolAfYSAWDmwU/x2Aedv0y4WGA8OipqeM5cmOcK
         ggkA==
X-Gm-Message-State: AOJu0Yyl1clpGYPI0SbSJWbSzzPh0rcUbJsLiXKgjG5j+1J+Oo6O7t6z
	9pJtdDHb2I6kZwqBgXIslB2Rsgh28iniljCOdM/fZJqitCltOFBDperpVjlBRYgr2vWW1a3ixlC
	Gjfoh
X-Gm-Gg: ASbGncuKUKPTbatRhekU3jtN/3IHv4hMZ62IGO8oSCUfv7uXxIVAOpiZuHWA/66bmYh
	R8062r1EXK0/PFVpKDwT7QKdpgbU3/HLm5ePuwxAWPu2VwA0Uk9b7kKyojiCBb4GGvXfeZwrDNu
	QSdFNAViVGMyNWnGEI/BK+tyKmSs1BZs/RhQKLYfvZ/fHgijYPM2grNsPgotBlxAlIPS7atdN3S
	z535Snpw6ffgUtgKMdVzpeFEMKJHLhmUySwN6fzDWsWRhf3I1RSoJGifB3kUIX/ylUTEnc37KR2
	DHwM8dkyCmn1M27SvPc7p0Fq633kVP0vX4fljWfg+Q67EQK7XNrVlg==
X-Google-Smtp-Source: AGHT+IGgJ/3suuSKpoCRzujmCAEFviU2acwnq2+UE2hpgEvkinL012EeDoLAqqokQ/7Sqxp7sKYVfA==
X-Received: by 2002:a05:6a00:21c1:b0:748:323f:ba21 with SMTP id d2e1a72fcca58-7489cf5c8c2mr20504024b3a.1.1750195251967;
        Tue, 17 Jun 2025 14:20:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/27] libsoup: Fix CVE-2025-46420
Date: Tue, 17 Jun 2025 14:20:09 -0700
Message-ID: <cb3a01ba6535b129608fb8d07261069f1fb4b84a.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218929

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/c9083869ec2a3037e6df4bd86b45c419ba295f8e]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-46420.patch      | 60 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-46420.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-46420.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-46420.patch
new file mode 100644
index 0000000000..dbaec12f7d
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-46420.patch
@@ -0,0 +1,60 @@
+From c9083869ec2a3037e6df4bd86b45c419ba295f8e Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Thu, 26 Dec 2024 18:31:42 -0600
+Subject: [PATCH] soup_header_parse_quality_list: Fix leak
+
+When iterating over the parsed list we now steal the allocated strings that we want and then free_full the list which may contain remaining strings.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/c9083869ec2a3037e6df4bd86b45c419ba295f8e]
+CVE: CVE-2025-46420
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-headers.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index a5f7a7f6..85385cea 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -530,7 +530,7 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 	GSList *unsorted;
+ 	QualityItem *array;
+ 	GSList *sorted, *iter;
+-	char *item, *semi;
++	char *semi;
+ 	const char *param, *equal, *value;
+ 	double qval;
+ 	int n;
+@@ -543,9 +543,8 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 	unsorted = soup_header_parse_list (header);
+ 	array = g_new0 (QualityItem, g_slist_length (unsorted));
+ 	for (iter = unsorted, n = 0; iter; iter = iter->next) {
+-		item = iter->data;
+ 		qval = 1.0;
+-		for (semi = strchr (item, ';'); semi; semi = strchr (semi + 1, ';')) {
++		for (semi = strchr (iter->data, ';'); semi; semi = strchr (semi + 1, ';')) {
+ 			param = skip_lws (semi + 1);
+ 			if (*param != 'q')
+ 				continue;
+@@ -577,15 +576,15 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 		if (qval == 0.0) {
+ 			if (unacceptable) {
+ 				*unacceptable = g_slist_prepend (*unacceptable,
+-								 item);
++								 g_steal_pointer (&iter->data));
+ 			}
+ 		} else {
+-			array[n].item = item;
++			array[n].item = g_steal_pointer (&iter->data);
+ 			array[n].qval = qval;
+ 			n++;
+ 		}
+ 	}
+-	g_slist_free (unsorted);
++	g_slist_free_full (unsorted, g_free);
+ 
+ 	qsort (array, n, sizeof (QualityItem), sort_by_qval);
+ 	sorted = NULL;
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index a90f683cb8..67aa180612 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -35,6 +35,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32050.patch \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32053.patch \
+           file://CVE-2025-46420.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


