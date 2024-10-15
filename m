Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE147D1F9A5
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:10 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.4732.1729018267105590847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Y//x7S1o;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e681bc315so115511b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018266; x=1729623066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YwhNlzJc8qMT/DiFlMSRofKxh0gzarrgeqR3+1MKRY=;
        b=Y//x7S1oDxxi55kFwU1Ng2b0zwRt2IM8MzpvKlsQjwRAXhqEyNNV98ENtMLUQ0xHot
         ZubhSDAAGK+grS+0SiE2PWUB1zM4duTiIWb4YBYZeTxktt1637+q/x9uMZdkgpI7RYvz
         aGnIVg+FFhKYeaM+1dXiVk3ctiBIHvmXhpfYD9RZgO+HB7DDOnMsCer+CUDE6f8qicsy
         S+b9h5U6rzClYwlVWyJ86IBzlln+uzJSEb6tl6P06GE/0NrwrS1ReAXF8O6ZrQC1hvIf
         WYmOx9BSNXS2SPk1kN9aYWgIpuVcMN57kfVOqlwamYAZsE4V94Wrzb0O6gsYLfSuVbWw
         Jlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018266; x=1729623066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YwhNlzJc8qMT/DiFlMSRofKxh0gzarrgeqR3+1MKRY=;
        b=Yv1n7r2JP4kUNuc38sUnwTtAEba+l/IwmRlXR0/CerZMcsYeDblCwqHnLtrkTXD4e1
         HaLOcvIhACFOdKR2yGRORAVdk7VCbpIi6UbZ6p3cRG5rplFZvtasQbqMjYs7mGSV0ScN
         sLZv3x1rdtJXcmmYTVqXkyIEVRSl8BDZ0Sz0raNoXOIItXRyk8bttZgSRwBMolZC9gg9
         NTx9ljAkmD39khi0RnpZmBfkqqvbA8E3Jf0zah4XbUZYB3PL436yftcd70x9RrbL6Q+F
         cZDDKeXt+8sAEML02qUhbAjLnbZBcH2kC+DRLQ+AIYFqgj4WUR5aLeZiTg7fiizKeNWM
         JOhg==
X-Gm-Message-State: AOJu0YyJBg0zTve9n96iBTI4Eh3kYnnRuZGVXXAwTzWeoFLoBxx5kcSx
	oMiIsLCMEj85Q9799LNHTG3ot0wYgRQsW64QWvmexyyc3nIVz5a0fsTYvw7lXefuBtnnRfgMCGN
	2
X-Google-Smtp-Source: AGHT+IFTv/U7ZaG3u157qPovy8WGyL5M886PJK2VqzunK8+LTbi9Nh4eryjM+mp/YCVPQjhop9ZCxA==
X-Received: by 2002:a05:6a00:18a4:b0:71e:4a46:fdb6 with SMTP id d2e1a72fcca58-71e4a46ff66mr20345451b3a.3.1729018266164;
        Tue, 15 Oct 2024 11:51:06 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/18] libarchive: fix CVE-2024-48957 & CVE-2024-48958
Date: Tue, 15 Oct 2024 11:50:39 -0700
Message-Id: <8b520c3cea136591128f6601718c23334afd7a55.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205927

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport fixes for:

* CVE-2024-48957 - Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b
* CVE-2024-48958 - Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/a1cb648d52f5b6d3f31184d9b6a7cbca628459b7

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2024-48957.patch           | 36 +++++++++++++++++
 .../libarchive/CVE-2024-48958.patch           | 40 +++++++++++++++++++
 .../libarchive/libarchive_3.7.4.bb            |  5 ++-
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
new file mode 100644
index 0000000000..98877cf72c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
@@ -0,0 +1,36 @@
+From 3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Mon, 29 Apr 2024 06:53:19 +0900
+Subject: [PATCH] fix: OOB in rar audio filter (#2149)
+
+This patch ensures that `src` won't move ahead of `dst`, so `src` will
+not OOB. Similar situation like in a1cb648.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b]
+CVE: CVE-2024-48957
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libarchive/archive_read_support_format_rar.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 79669a8..95a91dc 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3714,6 +3714,13 @@ execute_filter_audio(struct rar_filter *filter, struct rar_virtual_machine *vm)
+     memset(&state, 0, sizeof(state));
+     for (j = i; j < length; j += numchannels)
+     {
++      /*
++       * The src block should not overlap with the dst block.
++       * If so it would be better to consider this archive is broken.
++       */
++      if (src >= dst)
++        return 0;
++
+       int8_t delta = (int8_t)*src++;
+       uint8_t predbyte, byte;
+       int prederror;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
new file mode 100644
index 0000000000..de266e9d95
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
@@ -0,0 +1,40 @@
+From a1cb648d52f5b6d3f31184d9b6a7cbca628459b7 Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Mon, 29 Apr 2024 06:50:22 +0900
+Subject: [PATCH] fix: OOB in rar delta filter (#2148)
+
+Ensure that `src` won't move ahead of `dst`, so `src` will not OOB.
+Since `dst` won't move in this function, and we are only increasing `src`
+position, this check should be enough. It should be safe to early return
+because this function does not allocate resources.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/a1cb648d52f5b6d3f31184d9b6a7cbca628459b7]
+CVE: CVE-2024-48958
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libarchive/archive_read_support_format_rar.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 95a91dc..4fc6626 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3612,7 +3612,15 @@ execute_filter_delta(struct rar_filter *filter, struct rar_virtual_machine *vm)
+   {
+     uint8_t lastbyte = 0;
+     for (idx = i; idx < length; idx += numchannels)
++    {
++      /*
++       * The src block should not overlap with the dst block.
++       * If so it would be better to consider this archive is broken.
++       */
++      if (src >= dst)
++        return 0;
+       lastbyte = dst[idx] = lastbyte - *src++;
++    }
+   }
+ 
+   filter->filteredblockaddress = length;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
index da85764116..6e406611f9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
@@ -30,7 +30,10 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
-SRC_URI += "file://configurehack.patch"
+SRC_URI += "file://configurehack.patch \
+            file://CVE-2024-48957.patch \
+            file://CVE-2024-48958.patch \
+	"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd96bfe7abb971d5e8"
-- 
2.34.1


