Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8161CD8C8D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6131.1780698860014996954
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MSdNI+08;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so19845115e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698858; x=1781303658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzrB7tTF/l+zWrGvBK/zJ9ARoMXlFIkZL0ZaVrGEDws=;
        b=MSdNI+085PsYVSBBZOcNxU26C3iYUok7DE6rOCVtoq/TpdBZzt9Y+COJW5hQHQGhJT
         0IjkZ/rKSeqnOZPQ8D8xvAmGcx9eurcWcGAsDWnAgwT0bwuk4zB2UtHCeZNk+Cs6eEr1
         020hrsinyDgM6W1kQQiO77IZY4WL7uF+D4t5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698858; x=1781303658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CzrB7tTF/l+zWrGvBK/zJ9ARoMXlFIkZL0ZaVrGEDws=;
        b=lQGqijw8g7TnJaNB9llC8A1XuXjLadvhZwX2paSeVbVNTkbUS9RAceeI1QtOQ6WAvH
         f7chGVhBMDC4Toqi6QwGT7x5mKP8yiHD7ptFOpD/+tiTovh0O/QPy1esZsQNO9RjkAgc
         BIqQLqCkno1+WE0derRHbdU1c8Qs5zZnSdBQSvh1z6HD0QQDtm8LLux4p92z3jL1lnxU
         0rlSI56XNXtLufLtSuCppwSY3ioS/sn0xvSkIRB3DPoyCTZWgGmJbM4fK+oQOspU2hD8
         Y2K5VnrH8Cawl/riCD+TnEygFtD1E1328beaK2wbwYgCE2xt9KZEd4ZKnTvTm2fC5l80
         bRNA==
X-Gm-Message-State: AOJu0YxHgMCRlbwGMN4FUsZgqO2FGW+Qact3qlRB97O3tAPrtqU6E1PS
	Pzm0xx46ATKfI52VcdrjF7qhep3AaLv01WcQj+KecRErNlcOLoPjhRdvGBWGfuL6JXw/9ZXc5LG
	Pxa1f
X-Gm-Gg: Acq92OGLqZLsiYuyDz9BLD+N3cFBElKf+LAFbfX7nC7gl8jQlaO6saCRyMcqQYlGbco
	FaSpq/5c1V4VISDX2l22W1OuCbwxh6sWpBOVLq2yvuMSY4JBOnx9YRj4JbgqSyzvlbngPVYw9Aa
	XN5ISYesZF4/IRZUzOCacjFjqV6v0+qra0JG3RW2Jd2WNyq5dkx5ag3llkvasktPMqRAd/Nkfq8
	cFbdvHRrb2zOXhGGhp6pKQArjnbZcIZ/db3P8SAgNmWSCXm1uQ5ko6HdF6+Z3vKIpPY0Zgg827c
	COxtAGXVkHvvc50xVv0v9nmGfymzIXRiQcRIy1VhaUDIm+wARC4pojLxs9dZ0h4lSpragw5FBws
	ysKKHaPCZkaMOExXQuImIcVd9W9KUmSxailq+O3sjZtZhlAA5nZKZY1DeFaT+McO9lMv6g1VO+9
	r08exyYH8Z3FYc82N6nOo9bx4mt+lNNEbv0eLdCS5lUPhJJs8aeW+Z3++MXTsOkcb0bX0/Aa/VG
	j8ULiBSpTmKQLsWjZlPWHxIkDbpJzukeaObonBCfYRb6jfeOQ==
X-Received: by 2002:a05:600c:6219:b0:490:388f:1c0d with SMTP id 5b1f17b1804b1-490c2591fe3mr89897475e9.5.1780698858254;
        Fri, 05 Jun 2026 15:34:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/25] libexif: fix for CVE-2026-32775
Date: Sat,  6 Jun 2026 00:33:54 +0200
Message-ID: <b825582edd8b05be2d3c5ca48d6d7c620628d69b.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238196

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://github.com/libexif/libexif/commit/7df372e9d31d7c993a22b913c813a5f7ec4f3692
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-32775
[3] https://security-tracker.debian.org/tracker/CVE-2026-32775

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libexif/libexif/CVE-2026-32775.patch      | 86 +++++++++++++++++++
 .../recipes-support/libexif/libexif_0.6.24.bb |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2026-32775.patch

diff --git a/meta/recipes-support/libexif/libexif/CVE-2026-32775.patch b/meta/recipes-support/libexif/libexif/CVE-2026-32775.patch
new file mode 100644
index 00000000000..24935884430
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/CVE-2026-32775.patch
@@ -0,0 +1,86 @@
+From 7df372e9d31d7c993a22b913c813a5f7ec4f3692 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Mon, 9 Mar 2026 10:02:53 +0100
+Subject: [PATCH] check maxlen to be at least 1
+
+maxlen-- on 0 will become a high value.
+
+Fixes https://github.com/libexif/libexif/issues/247
+
+CVE: CVE-2026-32775
+Upstream-Status: Backport from [https://github.com/libexif/libexif/commit/7df372e9d31d7c993a22b913c813a5f7ec4f3692]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libexif/apple/mnote-apple-entry.c     | 2 ++
+ libexif/canon/mnote-canon-entry.c     | 2 ++
+ libexif/fuji/mnote-fuji-entry.c       | 1 +
+ libexif/olympus/mnote-olympus-entry.c | 2 ++
+ libexif/pentax/mnote-pentax-entry.c   | 1 +
+ 5 files changed, 8 insertions(+)
+
+diff --git a/libexif/apple/mnote-apple-entry.c b/libexif/apple/mnote-apple-entry.c
+index 6740d8e..337e51b 100644
+--- a/libexif/apple/mnote-apple-entry.c
++++ b/libexif/apple/mnote-apple-entry.c
+@@ -43,6 +43,8 @@ mnote_apple_entry_get_value(MnoteAppleEntry *entry, char *v, unsigned int maxlen
+ 
+     if (!entry)
+         return NULL;
++    if (maxlen < 1)
++        return NULL;
+ 
+     memset(v, 0, maxlen);
+     maxlen--;
+diff --git a/libexif/canon/mnote-canon-entry.c b/libexif/canon/mnote-canon-entry.c
+index 52a7077..372fcdf 100644
+--- a/libexif/canon/mnote-canon-entry.c
++++ b/libexif/canon/mnote-canon-entry.c
+@@ -559,6 +559,8 @@ mnote_canon_entry_get_value (const MnoteCanonEntry *entry, unsigned int t, char
+ 
+ 	if (!entry) 
+ 		return NULL;
++	if (maxlen < 1)
++		return NULL;
+ 
+ 	data = entry->data;
+ 	size = entry->size;
+diff --git a/libexif/fuji/mnote-fuji-entry.c b/libexif/fuji/mnote-fuji-entry.c
+index add7086..dd33900 100644
+--- a/libexif/fuji/mnote-fuji-entry.c
++++ b/libexif/fuji/mnote-fuji-entry.c
+@@ -199,6 +199,7 @@ mnote_fuji_entry_get_value (MnoteFujiEntry *entry,
+ 	int i, j;
+ 
+ 	if (!entry) return (NULL);
++	if (maxlen < 1) return NULL;
+ 
+ 	memset (val, 0, maxlen);
+ 	maxlen--;
+diff --git a/libexif/olympus/mnote-olympus-entry.c b/libexif/olympus/mnote-olympus-entry.c
+index 679fb50..d5eb60e 100644
+--- a/libexif/olympus/mnote-olympus-entry.c
++++ b/libexif/olympus/mnote-olympus-entry.c
+@@ -284,6 +284,8 @@ mnote_olympus_entry_get_value (MnoteOlympusEntry *entry, char *v, unsigned int m
+ 
+ 	if (!entry)
+ 		return (NULL);
++	if (maxlen < 1)
++		return NULL;
+ 
+ 	memset (v, 0, maxlen);
+ 	maxlen--;
+diff --git a/libexif/pentax/mnote-pentax-entry.c b/libexif/pentax/mnote-pentax-entry.c
+index 32b537b..d3c96f8 100644
+--- a/libexif/pentax/mnote-pentax-entry.c
++++ b/libexif/pentax/mnote-pentax-entry.c
+@@ -315,6 +315,7 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entry,
+ 	int i = 0, j = 0;
+ 
+ 	if (!entry) return (NULL);
++	if (maxlen < 1) return (NULL);
+ 
+ 	memset (val, 0, maxlen);
+ 	maxlen--;
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/libexif/libexif_0.6.24.bb b/meta/recipes-support/libexif/libexif_0.6.24.bb
index b407ee52de0..b3ee15a37f9 100644
--- a/meta/recipes-support/libexif/libexif_0.6.24.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.24.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
            file://0001-Add-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
+           file://CVE-2026-32775.patch \
            "
 
 SRC_URI[sha256sum] = "d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae"

