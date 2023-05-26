Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D79DC7EE2F
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:41 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.77.1685068172711843750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=QWbvI4hU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-528dd896165so157880a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068172; x=1687660172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SokiEDlC0iCqk4PD7QN4n5oKTvjiooa8OusbefO9Lh8=;
        b=QWbvI4hUw8ef0x31Mbdt79iBcgGvWzhKGBuaRWHeD+O87lV8PYw9y9hhF+JcXX3Qpl
         HIrYnpf9gYqBZGA2pn5fWDu1Q09s6AlSqpkcEcsjaDcQ6wALBIjMr2nXChmJBS7veuY8
         +RSbhFx7F8D6v/NQi89yjHbBFNjYIT18lBpPy56ZvBgAExelDKtzE/l6elIruQ2Cz0nQ
         yRl0sCuE6T5so8g9ACtmQS4OF4JHuMdmPrv9N6ZJa8nRDniaiJhV281qj6GHqwPCVNWZ
         wEgsnPjODxf/fDjKIAJqqHWms1MpGSSVZeds3IleMVRKYmZjd+z1DZ36fxMLWbTzSdiK
         KChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068172; x=1687660172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SokiEDlC0iCqk4PD7QN4n5oKTvjiooa8OusbefO9Lh8=;
        b=e+yuKoaER7FRagohHOR+VAXruANv4Lyd2zyfpbHJnpoAtZMekNvC2GloPuhCDimFU1
         crcZJjG2t/1kdDqizJ9pwJtbtJcWp0GUBjkde6II+Ev2s0hOGjt3sdjx8ZB9sgCRpWLD
         vVJiab5EEiHH7MQbc0/w4a2rVT/n9vuw3oIft9bNoc8ZnQQh3f5MkMl3U8yWmK5HiIMt
         TKY8SeREaIbi69rzxrmUlDCPMyUtxTcZoyi732Em43quBMHEPu9644kviQtVmgl8aGrR
         VdaKYFRZsJ5KE1TbMwp5tSsk5b9NUBxjStLeicTw38ASHgx+y9/JM5Ub4iHZ4FONvkTb
         wlQA==
X-Gm-Message-State: AC+VfDwprelXLhGttQSSKIrs0EGTBf1HDbUk+g6tNgRb3oa/d0EjnGfi
	7Igd6cSUyAdVDN35odOtR92cgnpUH2QfaIOveUo=
X-Google-Smtp-Source: ACHHUZ4ks4ExHJjySl14b/LicsPgEydcqZ5KB/R/NZhhisYpkPBTs2ET/+PBOr5EKk+GvYTRj2yLPQ==
X-Received: by 2002:a17:902:f693:b0:1ac:aac1:e344 with SMTP id l19-20020a170902f69300b001acaac1e344mr1004208plg.36.1685068171722;
        Thu, 25 May 2023 19:29:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/21] cpio: Fix wrong CRC with ASCII CRC for large files
Date: Thu, 25 May 2023 16:28:53 -1000
Message-Id: <8320097487cc46045482f5d0d41ad799a2435bce.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181737

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


