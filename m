Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5275DC10F31
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:14 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.4572.1670539386398613815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 14:43:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=DYrkhGGd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so3069721pjd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 14:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5Nw+wEhoQK/p1xvO6usCiVlTbpSoQD9mquABkP4hJ8=;
        b=DYrkhGGdQYHp8NezJqPjUE6cM1dJhz4KH6/2ArD7gvz3T/2UtgHAwq5gsXZpcq9z7J
         btlKM9FXTtoA8rmfOECK8Kzrj65oVWkphDbu1szdsiievO31N6Am28K8RJYRjvdBcrGz
         1Kn+BxBphE4hcxlwJoOyfDqnX7CDRvw133EX9yw6mYrNsNIVP7NfqntDeMOvNbYrKXl3
         TcSNs4jHCUkhb0e4wifEqZbnDio8KhuQFm55forA6J9ZuESuyzyndo0e74B8ZXPTg/AH
         K8NMSTghJJPrlj4kjRhm+fOIZcInaSZu95pWjvmGXM4ltY6H5nVubZ5N3J/osCTt5fhF
         vjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5Nw+wEhoQK/p1xvO6usCiVlTbpSoQD9mquABkP4hJ8=;
        b=mQ/PCGKwsCYpc6e4gEWtSMlY7LDb39xJdHuBFOPwk2E0qZQKdo0gVMqfOEtT0sC0+H
         qHg/z7By+ltgs2ZQ9w/lDM8erT3rlpwHZMuzbT/XbxMyRQHNQVOlwcpQ+ueWLIE9VFTI
         rW3yZlupe0+x1wPN86/GbRLSxXby1MEvsEoKXAPKLntCEu1qpt+s8Z0iaePgIhaqh/T5
         ZS59W6/iJNQlizuWjnWqxC4PnZMEahGuALAhzRkMk7shJNxFy0ImJYJR5VH45Gl5W5GT
         KRtFo01Bhdu12hOX+pj5LhfiIqSbwrfEto/+mbuS5ejUos12hl8DEWGgAGYkdLGTb8mI
         RvQA==
X-Gm-Message-State: ANoB5pmb8bzJqKW7BlFRXPTHBgC316eV1zbaQniZu+xQnpkghYWH9HCv
	iznJdUxf3EwHorc9v6ZnleqUAyXXIME4lkwic7g+Yw==
X-Google-Smtp-Source: AA0mqf4l1usMxVtL5gUANhUmlz+MZ3vJPxMxxRrkDDKy9rZjH5cPWxt5ZnKK/oJpErikWPcTBzYAUg==
X-Received: by 2002:a17:902:eb52:b0:189:c253:3625 with SMTP id i18-20020a170902eb5200b00189c2533625mr3471758pli.11.1670539385412;
        Thu, 08 Dec 2022 14:43:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b00172973d3cd9sm1675980plb.55.2022.12.08.14.43.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 14:43:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/12] libarchive: CVE-2022-36227 NULL pointer dereference in archive_write.c
Date: Thu,  8 Dec 2022 12:42:43 -1000
Message-Id: <e723e791b4faa3d5c755b4669b0901ebd0c368c9.1670539236.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670539235.git.steve@sakoman.com>
References: <cover.1670539235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 22:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174415

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2022-36227.patch           | 42 +++++++++++++++++++
 .../libarchive/libarchive_3.6.1.bb            |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
new file mode 100644
index 0000000000..d0d143710c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
@@ -0,0 +1,42 @@
+From b5332ed6d59ba5113a0a2c67fd82b69fcd5cde68 Mon Sep 17 00:00:00 2001
+From: obiwac <obiwac@gmail.com>
+Date: Fri, 22 Jul 2022 22:41:10 +0200
+Subject: [PATCH] libarchive: CVE-2022-36227 Handle a `calloc` returning NULL
+ (fixes #1754)
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5]
+CVE: CVE-2022-36227
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com
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


