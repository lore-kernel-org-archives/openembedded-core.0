Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79684C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:44 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.7071.1645799263553326301
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Y1GwIoXb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so4986168pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DxxDZiJkw/acCsQwZeJVkECaLUvPDldCVJ4FHBLZonM=;
        b=Y1GwIoXbzTYPH1c+dBhIt7jIVHVIaIjXL4c1igKhYquVrAdSrp5LvRAFM/FuUCyCxe
         30D36ymGHVCsb7VFT5EYKx4a22PudnjXJFlHwb7gob754PIu9pYQz7jVA162edsMPs47
         0z8sKApSYMo8hdyxg40VmwR+7+uCUDDZrRkfxOfgoTc0z18eicZRu6ITbHY8cUiImfT3
         9SdyWsPj0dcG1L9PY9kJ/NM0eqMlktJkQfbPkcnvRJLU9XaNPfzd1vHSk+TkazCJSiVp
         5b17PH2PFaz/eGoRLt1tJj7ouhXE1EfiykWtX16Q7fL2peE74wIR3lWrKIv44YfhwJ9u
         /e5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DxxDZiJkw/acCsQwZeJVkECaLUvPDldCVJ4FHBLZonM=;
        b=dcX04Y4KLJFKSBO0pt+namMLCalzaMsazRkldNYcJHjwGm/GBrnpSBjl1O30XXL57i
         9RpA9VmHU1FyeOE09XkWsPjCgRpUJjuE7cLy8XpfRt+9XmV5iF67MBsxfzQmy5U9FN7h
         4jdTtz34nD0a1aZ+wQE7MS2o8g6kk3S1TUN49Yujit6Wd+dX83QPyBk3BoEQpMOZZAWI
         343afF2fXq1X4LIFZgLEUZatJgdcLdGvTw5JfphM5jj2w3glklJGcpdx4zSt/ut1HEdP
         YivKRNbWWNQTep6aQTLjuXU4SYfLyrpmqvd4c7oymKVc5+yIpUyAwpHGIyfEBZ5kkxcq
         zqUw==
X-Gm-Message-State: AOAM531cOhPfysUyDRls+GpJAJC/4uRW3bQYCz9ybJD4sWOHSfXS5vW1
	oKkZcOLauAQK9kYpYF+tcyYs1e+PutFiMBPn
X-Google-Smtp-Source: 
 ABdhPJyqZZjPQBqjyqZbiKXoAh5+2yyvexk371RakQILgldweoSt+vdQvFxbVwavy3g9/C2AO8qp+Q==
X-Received: by 2002:a17:90b:1713:b0:1bc:3eca:627c with SMTP id
 ko19-20020a17090b171300b001bc3eca627cmr3398754pjb.144.1645799262452;
        Fri, 25 Feb 2022 06:27:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/50] grub: add a fix for a length check
Date: Fri, 25 Feb 2022 04:26:04 -1000
Message-Id: 
 <29470a74b944921641cd5d84b88c359acba26ad4.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162370

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for a volume name length check in grub's
hfsplus. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...that-the-volume-name-length-is-valid.patch | 43 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch

diff --git a/meta/recipes-bsp/grub/files/0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch b/meta/recipes-bsp/grub/files/0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch
new file mode 100644
index 0000000000..eb459c547f
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch
@@ -0,0 +1,43 @@
+From 7c1813eeec78892fa651046cc224ae4e80d0c94d Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 23 Oct 2020 17:09:31 +0000
+Subject: [PATCH] hfsplus: Check that the volume name length is valid
+
+HFS+ documentation suggests that the maximum filename and volume name is
+255 Unicode characters in length.
+
+So, when converting from big-endian to little-endian, we should ensure
+that the name of the volume has a length that is between 0 and 255,
+inclusive.
+
+Fixes: CID 73641
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2298f6e0d951251bb9ca97d891d1bc8b74515f8c]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/fs/hfsplus.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/grub-core/fs/hfsplus.c b/grub-core/fs/hfsplus.c
+index dae43be..03c3c4c 100644
+--- a/grub-core/fs/hfsplus.c
++++ b/grub-core/fs/hfsplus.c
+@@ -1007,6 +1007,15 @@ grub_hfsplus_label (grub_device_t device, char **label)
+     grub_hfsplus_btree_recptr (&data->catalog_tree, node, ptr);
+ 
+   label_len = grub_be_to_cpu16 (catkey->namelen);
++
++  /* Ensure that the length is >= 0. */
++  if (label_len < 0)
++    label_len = 0;
++
++  /* Ensure label length is at most 255 Unicode characters. */
++  if (label_len > 255)
++    label_len = 255;
++
+   label_name = grub_calloc (label_len, sizeof (*label_name));
+   if (!label_name)
+     {
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 130f32551b..3c5274fd96 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -66,6 +66,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0017-disk-ldm-If-failed-then-free-vg-variable-too.patch \
            file://0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch \
            file://0019-disk-cryptodisk-Fix-potential-integer-overflow.patch \
+           file://0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


