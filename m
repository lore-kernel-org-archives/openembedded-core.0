Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9D3C77B71
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 13:58:18 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.80367.1682431094658936424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 06:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=d0reEf1z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-63b51fd2972so4628390b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 06:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682431093; x=1685023093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPJ10ckE/ullj51TBJGaXV21L68dtVS+Bb+Au1J4Z28=;
        b=d0reEf1zUDR7DHXur52RGxZK49n0e/C8dnIyndAMyrHP99/8d9EPJV+FdGLzoARSJn
         hc4+kQC0YYCqbI8ynydawhGmgSiJOe4PvKTwXiNzHsPEZ5gGdzhXIU/4GQq45dOkPW0I
         thD7hqDGOd9OfNTsa7xEdKvv5GphtOiTddyv0XDzHoHO/XMTLofB4SglzLm9iGirJrHD
         FNaWDNfYXAmbdjUkxvPCF+huLBpGRS3rZ5zIGEJiIlpeo/cZB+/uPhlKolzCuj/Xz3MM
         7TmWc5j9cs15gZg8zUNRN91nIIebhFfNVxfULVseEG7Tcp2oFaNszYznzSxmJpU2ZFEC
         hG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682431093; x=1685023093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPJ10ckE/ullj51TBJGaXV21L68dtVS+Bb+Au1J4Z28=;
        b=kIfPmJJngRvq7YVLbl8ES79oEno7YqiaSob381YuQruibvQacoMl0FLUAYQCThWi1l
         pe9q+Rv4XEW0KcLIpDZNNET4cbKBrUY6ghCWs/dgRmJaSl2zH7uxs1hHZrWY3AFHAIVS
         6RpBcmLimE1rQxAUKZPq10hA7Fr+71XywjNxRmuMvDtQmfNZe1uJGxRPTOBz05ZdErcH
         AzfrQ5X7SQ0flU9eGSuPzVYd4QvmOSRvSCmd3X5Lu2syCsTngJLlP1G7E4YYEtoZWLVJ
         ffMktuoS7DhOUpcKtYIK2ygZXVNjoiKrKNSh+nxh+b2RIljjtScEsyDfWDntMzXMyEYN
         /ILA==
X-Gm-Message-State: AAQBX9fnI3a73e6TPlmQHEJ+gQzg69oDTQ44piyj+/1wRw5VymYaXoYr
	qBC1s4qJ771LL0THDmXVKGyoRgTJJpkXo8gpN+U=
X-Google-Smtp-Source: AKy350aumBlbRFYl4Idbm5gCL9+m4Kro88WNFsns47rcQWkgXqxv+iLUa3VDpXEx2dnOfpzW0JzZJg==
X-Received: by 2002:a05:6a21:3286:b0:f0:302a:ccd1 with SMTP id yt6-20020a056a21328600b000f0302accd1mr22603782pzb.8.1682431093547;
        Tue, 25 Apr 2023 06:58:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b0051b930b2b49sm8229117pgv.72.2023.04.25.06.58.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:58:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/10] cpio: Fix wrong CRC with ASCII CRC for large files
Date: Tue, 25 Apr 2023 03:57:41 -1000
Message-Id: <bdd1d3c8a0ef1e2086ea15e5c1b38628cfda5121.1682430831.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682430831.git.steve@sakoman.com>
References: <cover.1682430831.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 13:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180385

From: Marek Vasut <marex@denx.de>

Due to signedness, the checksum is not computed when filesize is bigger
a 2GB. Pick a fix for this problem from CPIO ML, where the fix has been
posted for 5 years. Since CPIO upstream is effectively unresponsive and
any and all attempts to communicate with the maintainer and get the fix
applied upstream failed, add the fix here instead.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bfff138af4bdd356ac66571e6ad91c1a5599b935)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...g-CRC-with-ASCII-CRC-for-large-files.patch | 39 +++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch
new file mode 100644
index 0000000000..4b96e4316c
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch
@@ -0,0 +1,39 @@
+From 77ff5f1be394eb2c786df561ff37dde7f982ec76 Mon Sep 17 00:00:00 2001
+From: Stefano Babic <sbabic@denx.de>
+Date: Fri, 28 Jul 2017 13:20:52 +0200
+Subject: [PATCH] Wrong CRC with ASCII CRC for large files
+
+Due to signedness, the checksum is not computed when filesize is bigger
+a 2GB.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-cpio/2017-07/msg00004.html]
+Signed-off-by: Stefano Babic <sbabic@denx.de>
+---
+ src/copyout.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/copyout.c b/src/copyout.c
+index 1f0987a..727aeca 100644
+--- a/src/copyout.c
++++ b/src/copyout.c
+@@ -34,13 +34,13 @@
+    compute and return a checksum for them.  */
+ 
+ static uint32_t
+-read_for_checksum (int in_file_des, int file_size, char *file_name)
++read_for_checksum (int in_file_des, unsigned int file_size, char *file_name)
+ {
+   uint32_t crc;
+   char buf[BUFSIZ];
+-  int bytes_left;
+-  int bytes_read;
+-  int i;
++  unsigned int bytes_left;
++  unsigned int bytes_read;
++  unsigned int i;
+ 
+   crc = 0;
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index e72a114de9..dd3541096f 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0002-src-global.c-Remove-superfluous-declaration-of-progr.patch \
            file://CVE-2021-38185.patch \
+           file://0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch \
            "
 
 SRC_URI[md5sum] = "389c5452d667c23b5eceb206f5000810"
-- 
2.34.1


