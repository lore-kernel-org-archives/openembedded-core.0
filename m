Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7038ACD8C88
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:25 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6272.1780698860396246477
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3IC4BYUB;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490af320e2aso27619365e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698859; x=1781303659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsVM+GRR4zqA0MzNZFGLZJN5mpft0FN+JPRFIYOJMiQ=;
        b=3IC4BYUBnpixlrI5Pr24rNRSrxHjT4FcSAediIvCM52vKtgpaXxk05ujDlwOT1v4lc
         HCXa8CM3P/bQJTLwi7C4XP+mD/29OsonGJFOPyWzEG09SoUDKO7igrSspwqBJDCW2C47
         BRxVAgyRHRlF+RrbHtnwuCbfOvgR7vLEI/gqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698859; x=1781303659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JsVM+GRR4zqA0MzNZFGLZJN5mpft0FN+JPRFIYOJMiQ=;
        b=qBDgEUMxesvtOczGZ4usSkAh615MkJwBdGx0KKbsHVQs9MvmnJBmwGnT9iuR5kU3m8
         HuMYiQE5OIwBdFbrBI9fRLGnM+OhDiPOXDx0pmYQWt895IIc3gOJI+cwfsIkYY3xZT6i
         kDhUWkhcefXdg2s3QgZjEBlGwSSWtYnvUY2z1Onoz80Rj091wQcYFdP5W5ITwFdxYS84
         N450CMzVsgTs5HgbcE2usr0EAZccaCYw2RrMsa8EgKfT6EIgtrNMPQ50BLcuNQdJn3xd
         K548/IowYJ/q29pXi4RE3Zgttb2dpR9b5c14IesxSYUADEhd0hM40BlrOmHLj/3vJsHD
         p1Mw==
X-Gm-Message-State: AOJu0YywtSjbhS+yUPJblAHP57OYOuECIe1W44DbahxLyvG2KrbjbOUK
	EQL9btpdT9IP6RtOOVGvEsjh9xLwIPlW5Sj6ZqDlnFHJHa19/KOijYc5QpwT8sZl40kMWmamlaq
	L9+OK
X-Gm-Gg: Acq92OHLds9wN1/xIcY4YjH8wJQVULCt5LfUHS+GfnwVH2pbuOgAf8cQbYt0k91+kl7
	5+dfRemCymJjRaMslw5T0txS2VQh53qp4WGNu+cHyNK/fieurkZrgsB2K/TXJDaTY0j8KFJ0t6K
	XNSOa42WDlQXD2cdVWGdAEGA0vM3Omc1Wnmdf+m9epRehGzWb6m1Jr0ZvChgoKcRE/Rg43H+OXN
	ZkOolXzQycOBB7DdWoYsEj3HI9zVjO+gT17BVM1SighM7WwtqBNqlHijxJ5uv0qjO9IdFg7qjxG
	VcF03NopBMQH0wyIG8V2Sbq1Sal2J7WMkoHmBGtYRxO9L/4QpaV52ijOb7FlSIwoozFLCcGQAfk
	kZKytehe/TTzc9JtNes3YZC1htjOsMa9MNYnoIPYEymTuzLORTNUH9BwpKb1Y26MXc2vZlv56fT
	RVo0GZbEny2oiPWyC1pCLG7l1CBG3cTN2wEzjGHRBtQojay5nr9kFMxbaP9zOhD8eXlT5TMnPMJ
	BIBH/KHZwiX0To2aoNGStPqnkEkgQq3OBERu2A=
X-Received: by 2002:a05:600c:3e0a:b0:490:b724:dbe3 with SMTP id 5b1f17b1804b1-490c25a07c4mr89260935e9.8.1780698858737;
        Fri, 05 Jun 2026 15:34:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/25] libexif: fix for CVE-2026-40385, CVE-2026-40386
Date: Sat,  6 Jun 2026 00:33:55 +0200
Message-ID: <9175f776404a1f4536e0320495c446e80a281172.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238197

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] & [2] also mentioned at Debian report in [3] & [4]

[1] https://github.com/libexif/libexif/commit/93003b93e50b3d259bd2227d8775b73a53c35d58
[2] https://github.com/libexif/libexif/commit/dc6eac6e9655d14d0779d99e82d0f5f442d2f34b
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-40385
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-40386

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libexif/libexif/CVE-2026-40385.patch      | 35 ++++++++++++++
 .../libexif/libexif/CVE-2026-40386.patch      | 46 +++++++++++++++++++
 .../recipes-support/libexif/libexif_0.6.24.bb |  2 +
 3 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2026-40385.patch
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2026-40386.patch

diff --git a/meta/recipes-support/libexif/libexif/CVE-2026-40385.patch b/meta/recipes-support/libexif/libexif/CVE-2026-40385.patch
new file mode 100644
index 00000000000..75f7fea6e4f
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/CVE-2026-40385.patch
@@ -0,0 +1,35 @@
+From 93003b93e50b3d259bd2227d8775b73a53c35d58 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <meissner@suse.de>
+Date: Fri, 3 Apr 2026 11:18:47 +0200
+Subject: [PATCH] Avoid overflow on 32bit system when reading Nikon MakerNotes
+
+The addition o2 = datao + exif_get_long(buf + o2, n->order)
+could have overflowed on systems with 32bit unsigned int size_t.
+
+This could have caused out of bound reads of data, leading to
+misparsing of exif / crashes.
+
+Reported-By: Kerwin <kerwinxia66001@gmail.com>
+
+CVE: CVE-2026-40385
+Upstream-Status: Backport from [https://github.com/libexif/libexif/commit/93003b93e50b3d259bd2227d8775b73a53c35d58]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libexif/olympus/exif-mnote-data-olympus.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libexif/olympus/exif-mnote-data-olympus.c b/libexif/olympus/exif-mnote-data-olympus.c
+index 3dbe1d3..a5ed7ad 100644
+--- a/libexif/olympus/exif-mnote-data-olympus.c
++++ b/libexif/olympus/exif-mnote-data-olympus.c
+@@ -382,6 +382,7 @@ exif_mnote_data_olympus_load (ExifMnoteData *en,
+ 		o2 += 2;
+ 
+ 		/* Go to where the number of entries is. */
++		if (CHECKOVERFLOW(o2,buf_size,exif_get_long (buf + o2, n->order))) return;
+ 		o2 = datao + exif_get_long (buf + o2, n->order);
+ 		break;
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/libexif/libexif/CVE-2026-40386.patch b/meta/recipes-support/libexif/libexif/CVE-2026-40386.patch
new file mode 100644
index 00000000000..3792aa02a6e
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/CVE-2026-40386.patch
@@ -0,0 +1,46 @@
+From dc6eac6e9655d14d0779d99e82d0f5f442d2f34b Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <meissner@suse.de>
+Date: Thu, 2 Apr 2026 13:26:31 +0200
+Subject: [PATCH] fixed 2 unsigned integer underflows
+
+this could cause crashes or data leaks.
+
+Reported-by: Kerwin <kerwinxia66001@gmail.com>
+
+CVE: CVE-2026-40386
+Upstream-Status: Backport from [https://github.com/libexif/libexif/commit/dc6eac6e9655d14d0779d99e82d0f5f442d2f34b]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libexif/fuji/exif-mnote-data-fuji.c       | 2 +-
+ libexif/olympus/exif-mnote-data-olympus.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libexif/fuji/exif-mnote-data-fuji.c b/libexif/fuji/exif-mnote-data-fuji.c
+index e3af4e1..3f295d3 100644
+--- a/libexif/fuji/exif-mnote-data-fuji.c
++++ b/libexif/fuji/exif-mnote-data-fuji.c
+@@ -68,7 +68,7 @@ exif_mnote_data_fuji_get_value (ExifMnoteData *d, unsigned int i, char *val, uns
+ 	ExifMnoteDataFuji *n = (ExifMnoteDataFuji *) d;
+ 
+ 	if (!d || !val) return NULL;
+-	if (i > n->count -1) return NULL;
++	if (i >= n->count) return NULL;
+ /*
+ 	exif_log (d->log, EXIF_LOG_CODE_DEBUG, "ExifMnoteDataFuji",
+ 		  "Querying value for tag '%s'...",
+diff --git a/libexif/olympus/exif-mnote-data-olympus.c b/libexif/olympus/exif-mnote-data-olympus.c
+index a5ed7ad..bdeb5a9 100644
+--- a/libexif/olympus/exif-mnote-data-olympus.c
++++ b/libexif/olympus/exif-mnote-data-olympus.c
+@@ -76,7 +76,7 @@ exif_mnote_data_olympus_get_value (ExifMnoteData *d, unsigned int i, char *val,
+ 	ExifMnoteDataOlympus *n = (ExifMnoteDataOlympus *) d;
+ 
+ 	if (!d || !val) return NULL;
+-	if (i > n->count -1) return NULL;
++	if (i >= n->count) return NULL;
+ /*
+ 	exif_log (d->log, EXIF_LOG_CODE_DEBUG, "ExifMnoteDataOlympus",
+ 		  "Querying value for tag '%s'...",
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/libexif/libexif_0.6.24.bb b/meta/recipes-support/libexif/libexif_0.6.24.bb
index b3ee15a37f9..8418b72c522 100644
--- a/meta/recipes-support/libexif/libexif_0.6.24.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.24.bb
@@ -11,6 +11,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
            file://0001-Add-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
            file://CVE-2026-32775.patch \
+           file://CVE-2026-40385.patch \
+           file://CVE-2026-40386.patch \
            "
 
 SRC_URI[sha256sum] = "d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae"

