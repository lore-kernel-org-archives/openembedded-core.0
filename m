Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBFCCCA480
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:23:42 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.27117.1656606211880564986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jGVUHv2x;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 145so4854956pga.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jlT6NQjuwdquyiNXIDO43FGAnHnQlbT2OlJeGzBn9GU=;
        b=jGVUHv2x47/0WNehh4XLGBh8s6Sv5L/uu9s35Tdrh4EQramSKlQHtDxo8YDWQ4CD6M
         zal+lEKh5DrVZgAZda70WsBUKUFNQ37N9DMXCrTjVkG4wgyvqFUsIOKkx/6INEmqo/62
         jGlwD4P8llsS5lvdo0JWMO/xrOQ1kNMS6AVjVKmB+Yj197/wDz1Jz7EZ9YIAF+1NNYPp
         4GLar6/kp6BgZg6zeJjCgOscEcu02sy/awhXBHuN7giHVmBNjcXMMq4mHNFNSeVXYKnA
         +0pEUjdUMF12SZm0QxtHswqlluew9QSKhAxWvksgbjnU3CI+xouj+54HRQq8+vmuEkVE
         ++tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jlT6NQjuwdquyiNXIDO43FGAnHnQlbT2OlJeGzBn9GU=;
        b=ukjRUE3PNQzCbKnHbeaIKLCsoPg+flxGQCJYBe4Am3tN2UAhovlSpBpKH1KfTuxHce
         7qKwlt3UIUtVkv2H1FQNP5b+xpMisqYE4yutggDf+D59At4r02K0A7+RuM7OGdHyHBA7
         i/ZkPTRKRoh/bfR/wHwdphMiypfUGkvCUzt5S/Vabs+qKbvO4UPFlqFQUkAp4ktnRVXT
         EfJd6+ji4tecm+hKzw9hguJI8PrIV6TpvW4gJbRH7EmsU2/94V4wmMpiRlLbch7M6r2s
         n6mzy3Vhj8PjVA2UK+wzKMbCvf9AixwCeaX35AdmdbdsebbnxWJAYi0pl/4vrxbKgzF5
         eocw==
X-Gm-Message-State: AJIora/dpafOaqDNtLwJr2VsOTdLbHTXqInk8p6FgaJZg/TG8MkmWYOT
	qijZEOqd6OwOBuCmctjZWnLvSKbDAn8px1oo
X-Google-Smtp-Source: 
 AGRyM1vYIBRBQMndmZ7iZL0W0I5RmTyoWjy5i+zjv+7L39ai3g8xclSdrJ0pHqx30rVSxvm9NzR+fg==
X-Received: by 2002:a63:6947:0:b0:40d:9b49:12d6 with SMTP id
 e68-20020a636947000000b0040d9b4912d6mr8359523pgc.149.1656606210723;
        Thu, 30 Jun 2022 09:23:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t129-20020a625f87000000b005259578e8fcsm10517611pfb.181.2022.06.30.09.23.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:23:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/12] unzip: fix CVE-2021-4217
Date: Thu, 30 Jun 2022 06:23:03 -1000
Message-Id: 
 <357791da82f767ad695e4476aa12fea3d7db5e04.1656605800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656605800.git.steve@sakoman.com>
References: <cover.1656605800.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167419

From: Joe Slater <joe.slater@windriver.com>

Avoid a null pointer dereference.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 36db85b9b127e5a9f5d3d6e428168cf597ab95f3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../unzip/unzip/CVE-2021-4217.patch           | 67 +++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch

diff --git a/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch b/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
new file mode 100644
index 0000000000..6ba2b879a3
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
@@ -0,0 +1,67 @@
+From 731d698377dbd1f5b1b90efeb8094602ed59fc40 Mon Sep 17 00:00:00 2001
+From: Nils Bars <nils.bars@t-online.de>
+Date: Mon, 17 Jan 2022 16:53:16 +0000
+Subject: [PATCH] Fix null pointer dereference and use of uninitialized data
+
+This fixes a bug that causes use of uninitialized heap data if `readbuf` fails
+to read as many bytes as indicated by the extra field length attribute.
+Furthermore, this fixes a null pointer dereference if an archive contains an
+`EF_UNIPATH` extra field but does not have a filename set.
+---
+ fileio.c  | 5 ++++-
+ process.c | 6 +++++-
+ 2 files changed, 9 insertions(+), 2 deletions(-) 
+---
+
+Patch from:
+https://bugs.launchpad.net/ubuntu/+source/unzip/+bug/1957077
+https://launchpadlibrarian.net/580782282/0001-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
+Regenerated to apply without offsets.
+
+CVE: CVE-2021-4217
+
+Upstream-Status: Pending [infozip upstream inactive]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+diff --git a/fileio.c b/fileio.c
+index 14460f3..1dc319e 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -2301,8 +2301,11 @@ int do_string(__G__ length, option)   /* return PK-type error code */
+             seek_zipf(__G__ G.cur_zipfile_bufstart - G.extra_bytes +
+                       (G.inptr-G.inbuf) + length);
+         } else {
+-            if (readbuf(__G__ (char *)G.extra_field, length) == 0)
++            unsigned bytes_read = readbuf(__G__ (char *)G.extra_field, length);
++            if (bytes_read == 0)
+                 return PK_EOF;
++            if (bytes_read != length)
++                return PK_ERR;
+             /* Looks like here is where extra fields are read */
+             if (getZip64Data(__G__ G.extra_field, length) != PK_COOL)
+             {
+diff --git a/process.c b/process.c
+index 5f8f6c6..de843a5 100644
+--- a/process.c
++++ b/process.c
+@@ -2058,10 +2058,14 @@ int getUnicodeData(__G__ ef_buf, ef_len)
+           G.unipath_checksum = makelong(offset + ef_buf);
+           offset += 4;
+ 
++          if (!G.filename_full) {
++            /* Check if we have a unicode extra section but no filename set */
++            return PK_ERR;
++          }
++
+           /*
+            * Compute 32-bit crc
+            */
+-
+           chksum = crc32(chksum, (uch *)(G.filename_full),
+                          strlen(G.filename_full));
+ 
+-- 
+2.32.0
+
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index af5530ab38..3e253afe65 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://CVE-2019-13232_p1.patch \
 	file://CVE-2019-13232_p2.patch \
 	file://CVE-2019-13232_p3.patch \
+        file://CVE-2021-4217.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.25.1


