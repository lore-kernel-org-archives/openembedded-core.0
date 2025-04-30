Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3D2C3ABAC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 16:57:14 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.36.1746032232510165837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 09:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jGjdBlmi;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2243803b776so1512685ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1746032231; x=1746637031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VDqZqlUbCOUWYnu2EbnlRpMLBnMvnCDhinpPD8hLlQ=;
        b=jGjdBlmiKbsg5sF1wLMKtxNmjZgBo7Ma/smaC1lIoVc8hOH+uYS2+ZW3+J0qRJuiyM
         iTgNcLSKn6yhB0ZYEITZ/mZKw/l8vPg/jd+6lZny9W0g4lxcQc6uL51JVsumgc9pPbqx
         g7zgLGDkk1wml3b4u4AbfYMGYdfHBb2Kvejs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746032231; x=1746637031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VDqZqlUbCOUWYnu2EbnlRpMLBnMvnCDhinpPD8hLlQ=;
        b=UTrsKDk1qwIN4WKhvdUi1zRnWG6qs6SwzJWyhEh+aPn53zdNW4jAN9lRooH88emVrt
         9xlQPVgwVmhWiUeeVMwu4Do9qPOkGTnv0faOzdLntC5RB5dfCHtcI3CKzYtrExBDQ+WX
         otXYqnFY1cJI12c2GXwTcWuRcOJfVzny9atxIOhAJ/rLqlzL370ux7q541h05qFeSboQ
         XSyovSBAMkbn+kRLEQ7YP9La7e16RPOm+6Zr4wC4l+kJ2ssH9lNBjpYG8N/rvRWlNUOU
         6V5TvZl6WaPNH3ijr0MIXbGR3VlR5baisW2LRK7+zHLBTNrJgX99A2T8glyEpJS1L8h3
         AYtQ==
X-Gm-Message-State: AOJu0Yzz3mlinECs3zmjF98no7rqEFPVKq41/JOXDgZDBoq2Wwe9k0/v
	xwbUD6GJ5rD2eInPSUVmiQpK7lqvVwvaK4vSmKGTQIx2FrxBiaFjxtpSUjO0yJ4xtswCDQNsQkP
	lJdo=
X-Gm-Gg: ASbGncuffKqe8alx2Yp9L5kRUsig4B+dbRxG5dknLqnBqYdrtpP1M4HM6OO1HzeoBEf
	or5pz8nL4aCxEB71gx0hxO2tgqBba3cDFWmLBKk8GDHnWQ94mD6Jg4h26PL4mYWfrDs+TGO7+GB
	Rxi/UpLX+hwzNpRMXSXVEpvt3E+53W6wZhFsKbRg1mbkm5fLxsspsoCyk0+G5NbzpsmM3bmYnc/
	z/lnZJXDYAAXjskp3x9ncLiG4pbCxDQQF1Lfb0DWU9hLuAvi/M07gKJJXzaqQ+XZGn/m1r7AmY7
	byRSVc6TnPNkH9wUbxTPrqV1sZ8ZqXWtI19OfW63AjpGXgbX
X-Google-Smtp-Source: AGHT+IF0B9UzdZBNycGQa3P+TDAsChTcFO3digrqHhaUDbcIihdObhpur0/SzM57iWuN9NLELpwR2Q==
X-Received: by 2002:a17:903:2ac5:b0:224:584:6f04 with SMTP id d9443c01a7336-22df35097bamr56207385ad.18.1746032231459;
        Wed, 30 Apr 2025 09:57:11 -0700 (PDT)
Received: from MVIN00043 ([2401:4900:1c31:7ae:8a0e:9596:827c:a9d6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4c132b7sm124697395ad.0.2025.04.30.09.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 09:57:11 -0700 (PDT)
Received: by MVIN00043 (sSMTP sendmail emulation); Wed, 30 Apr 2025 22:27:05 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][scarthgap][PATCH] libsoup: patch CVE-2025-46420
Date: Wed, 30 Apr 2025 22:27:04 +0530
Message-Id: <20250430165704.1391854-1-asharma@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 16:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215755

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/c9083869ec2a3037e6df4bd86b45c419ba295f8e]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../libsoup-3.4.4/CVE-2025-46420.patch        | 60 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46420.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46420.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46420.patch
new file mode 100644
index 0000000000..37ab16dc05
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46420.patch
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
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index cbb098908d..63e9afa6fc 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -28,6 +28,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32912-2.patch \
            file://CVE-2025-32906-1.patch \
            file://CVE-2025-32906-2.patch \
+           file://CVE-2025-46420.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


