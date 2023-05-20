Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296AEC77B7D
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 16:05:35 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.13616.1684598724062426687
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 May 2023 09:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MylU7I5/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-64d2a613ec4so1799778b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 09:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684598726; x=1687190726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TP+UZepMZbwC0RsOPWX3s4EP+OC0tUTnX2IL4TnjtH8=;
        b=MylU7I5/nY1E35nmd50Io+6nhPck4fCH42uJgGIoetAYjnPelPggRVFJ1LPveQsU2e
         IQMs1+BWxr2mZh232RqIRlvN+EnDiiEz5vUkyMcb7P5BJ2ghzcXEVBGMeNxLGGheCHZV
         dvc0xwJgDG5GB38P3aJ2vbCeP1o2Wx18eXutMzbW7L7LD3Se7TxFIa758UqHK/4RPgTX
         I3YMsyy9w9subGwx8R+6gA+pRI/PA72fI/PH9MlE3JjMBOEry8V5TblTP19lZNIRBv/2
         Op9ft7ThAGGIB2kcZGMxyNgiClp34FUZzouQ7SyZ+20h+SljyuUlWAV+GwRpssHtCtbi
         w9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684598726; x=1687190726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TP+UZepMZbwC0RsOPWX3s4EP+OC0tUTnX2IL4TnjtH8=;
        b=WUct2YTCZMY6uaVucfVRx/u1IhJPuAMDm9iImsrza4PKJ2B+6XiCay66zyKEEEUFTn
         HL03IcBsFTipJdfEEbSUsGu2OTVnyr9g7Z3E9TpDCzmO/FRynv28EOwnV/iWQqCVO2zd
         GGbSXi1xRpLyWqrI2FFIpzaIqa0Uau/OG/0VibZjcg6UXSzYrMrSyYjPsusEno0jT7if
         RsC04/Rh1rHhE8oh+5BDMT1iPKOyFujCr/SowUiTEwPpTF2OUDTRfkC66xyE1cscVTRW
         hSePiKErnkFvkQGXPovnnPTZPDLiwStBmpNIy8u61/M95ATObJjzlXe3bvGbQN+droL9
         W6Fw==
X-Gm-Message-State: AC+VfDy1MZEd8H4m250OHePhJu1DyD66JhPurtxeCuVVVV2DDKoOGn93
	c17qDl+R8kNz3I0RSHW6ABTpxXXYXT2IyDmLp7g=
X-Google-Smtp-Source: ACHHUZ5Jpy/zGvmYPgLKgDFaTFCJ3KY+m+oc+mec9H+A07X/6XqnsM3Mdyo8ATSldDjbLLL3J4pbNg==
X-Received: by 2002:a05:6a20:3ca7:b0:103:e735:d157 with SMTP id b39-20020a056a203ca700b00103e735d157mr6094457pzj.59.1684598726442;
        Sat, 20 May 2023 09:05:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b00642f1e03dc1sm1457790pfi.174.2023.05.20.09.05.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 09:05:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/11] cpio: Fix wrong CRC with ASCII CRC for large files
Date: Sat, 20 May 2023 06:05:02 -1000
Message-Id: <0a8fb1c00e75e8434e0ef433d9074d54f038fba1.1684598568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684598568.git.steve@sakoman.com>
References: <cover.1684598568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 16:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181569

From: Marek Vasut <marex@denx.de>

Due to signedness, the checksum is not computed when filesize is bigger
a 2GB. Pick a fix for this problem from CPIO ML, where the fix has been
posted for 5 years. Since CPIO upstream is effectively unresponsive and
any and all attempts to communicate with the maintainer and get the fix
applied upstream failed, add the fix here instead.

(From OE-Core rev: bfff138af4bdd356ac66571e6ad91c1a5599b935)

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
index 7c8a465cd0..86527da744 100644
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


