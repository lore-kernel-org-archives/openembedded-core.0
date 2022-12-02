Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30B9C4167B
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 06:20:39 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.68753.1669962031812121988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 22:20:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VShfIvg2;
 spf=pass (domain: mvista.com, ip: 209.85.215.170, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f170.google.com with SMTP id v3so3614752pgh.4
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 22:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eh1V0ZszRfACKAQN0VR1oAWsYCC+bE27WfpBF/FI6jo=;
        b=VShfIvg2/QiZfjSVi/K8rpI6fy1BAfV3vhc31dbLvpil3ZiUyY5g2a8O0Svs5Kcc6M
         OkAKnX1+Dt0dt3b/XzcMAlbx9UgNZuzAEiDuSUELstTrKV3AyHC0u9nuOWG82bq26XJQ
         ZsOgtO7VJm+xva+yLxnrXhka2bwxkFqGuaLdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eh1V0ZszRfACKAQN0VR1oAWsYCC+bE27WfpBF/FI6jo=;
        b=0NgXHav5aATgN8b4mLq+13L+hMWdNOeW0DaHfuapjKIVdP66GT8K5U0herMfQP/dEU
         JLN7GKWGO98US/rS+rMnAJn8wFjU26ggsa8uSOZCxQ3xOLpjOJvD4SICZ1hfdBlyJatL
         UNj3tPTqcqXgKfsyKMXcKv4+jYgaRqysATSbwgZZdCzCrCipWaXBl9UW14pbQ6N3iD/l
         Ca2mQS1qaHe/8TeBUa9exN8Apy343DlGkw3+xvW0f/S4kV+lUPGkl34uHa8RqEbg5FaH
         t31ui+0TlN41uToTDH+KIK+RwVomOACXKYx767uH0niElAdc7aqL6XyKNqmz10sf73fP
         skgw==
X-Gm-Message-State: ANoB5pnpwjVaYH4e/9Sf4daC0eWm8ucxJVSkUUxHLFd6APPhnrn8NJXe
	CN3ROZqKfYMIYW2l52jGd69MuFodaoCpOx63
X-Google-Smtp-Source: AA0mqf49ArBWRd2NyuiojHAkv4oKZ1HGg636/IcfpHEW5JpRz7zU4/2m7wwJqDPaxJ1zoPnkycWwgA==
X-Received: by 2002:a63:2144:0:b0:470:8a45:32a8 with SMTP id s4-20020a632144000000b004708a4532a8mr60880599pgm.543.1669962030845;
        Thu, 01 Dec 2022 22:20:30 -0800 (PST)
Received: from MVIN00024 ([157.32.66.92])
        by smtp.gmail.com with ESMTPSA id c7-20020aa79527000000b00575a74d84dbsm4295802pfp.63.2022.12.01.22.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 22:20:30 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Fri, 02 Dec 2022 11:48:14 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libarchive: CVE-2022-36227 NULL pointer dereference in archive_write.c
Date: Fri,  2 Dec 2022 11:48:12 +0530
Message-Id: <20221202061812.62788-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 06:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174223

Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libarchive/CVE-2022-36227.patch           | 41 +++++++++++++++++++
 .../libarchive/libarchive_3.6.1.bb            |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
new file mode 100644
index 0000000000..99242fc826
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
@@ -0,0 +1,41 @@
+From afa85b75607649f3a89cb4d17cf3f003738d3576 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 2 Dec 2022 11:22:39 +0530
+Subject: [PATCH] CVE-2022-36227
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5]
+CVE: CVE-2022-36227
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libarchive/archive_write.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
+index 66592e8..27626b5 100644
+--- a/libarchive/archive_write.c
++++ b/libarchive/archive_write.c
+@@ -201,6 +201,10 @@ __archive_write_allocate_filter(struct archive *_a)
+ 	struct archive_write_filter *f;
+ 
+ 	f = calloc(1, sizeof(*f));
++
++	if (f == NULL)
++		return (NULL);
++
+ 	f->archive = _a;
+ 	f->state = ARCHIVE_WRITE_FILTER_STATE_NEW;
+ 	if (a->filter_first == NULL)
+@@ -548,6 +552,10 @@ archive_write_open2(struct archive *_a, void *client_data,
+ 	a->client_data = client_data;
+ 
+ 	client_filter = __archive_write_allocate_filter(_a);
++
++	if (client_filter == NULL)
++		return (ARCHIVE_FATAL);
++
+ 	client_filter->open = archive_write_client_open;
+ 	client_filter->write = archive_write_client_write;
+ 	client_filter->close = archive_write_client_close;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
index c795b41628..df9df5e0a6 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
@@ -32,7 +32,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
 EXTRA_OECONF += "--enable-largefile"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://CVE-2022-36227.patch \
+	   "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
-- 
2.25.1


