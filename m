Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D14C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:40 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.6938.1645799260016664588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=f75lo3Su;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id i21so4786810pfd.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MNiFk+E4qJ7JRG2Vbbp5YSM8ZZsr/4/KtS9YxCMdlvg=;
        b=f75lo3SuTqeMof8I6kjbgaJOlM1Et+IyFvdE+x+SWwR8AYgTbdn7eJ9cntGcAiazxi
         vNGFSKbJS3k7Fc0wAEqCjronBz1UzWvkTjy0+KmF+qeWqDX1dgPkIo9syx3XhXaA09bW
         WlrtpDZangBintoO0ILtrrnRZMIOKod1gEpAV8pPg7sCh7glTK2aCTYKExIgkDvhmnl0
         B/pXWm8bBNSHPMNQEUDEM9Q6NMFg1eV3LRond8dr9XWAyYAoruomrkAesgf3F0KB/42l
         9L8pHQtRbHg7Twg5lNEm8pR0/r3eHpjpKJoDpfD+BcDpfXhfikI6J3Z4aiLgz+TB+qRb
         FW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MNiFk+E4qJ7JRG2Vbbp5YSM8ZZsr/4/KtS9YxCMdlvg=;
        b=kJDRcbUHZydFJuel2GgoH3x/ScII8YjYftwuvAVpXrxC2P0fzxkKaYRB6g389SK65T
         n08TqWfp5EkbP+/Yl1/mYkKaWzqfIT3svWbgxTAHr5DENgIV4shc0hQROIB1lU8Lboua
         ZFYc6JRSrYkiZrb5NUC7+khPTeJZopv2W42CGzqYSHYnEFTkdZ3k0uKnzR79SUJfyL/m
         Gpqd+oFaUgWCRBUWTcqqiIWZgv85RAVECTok/8iJ+Hi4CzTdRzZPh2OsAoYZC9+byis/
         O+/OmCsFouFaZrzzGmgF9ZWzvoWl5x+3w2d6c7fmwp0pKUACzf/9Z0Xpx3KfpR93rn2J
         joXQ==
X-Gm-Message-State: AOAM532tRf6H+c/LauazF9l1rzsW8cuOOvnUGW/BoEn1W0R2dAe6+tQk
	dmv+i2qJcSV2Rl2lRXOB8uXxYPB5NomTaiXp
X-Google-Smtp-Source: 
 ABdhPJxyTsejdHzJLkA2mG9Ln+GA15tTfXk33KnWI9i6k6OwnLbFOYL9u5RdR1Hy5Xyp3CIilVwx+g==
X-Received: by 2002:a05:6a00:24ca:b0:4e1:cb76:32da with SMTP id
 d10-20020a056a0024ca00b004e1cb7632damr7734925pfv.81.1645799259088;
        Fri, 25 Feb 2022 06:27:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/50] grub: fix an integer overflow
Date: Fri, 25 Feb 2022 04:26:03 -1000
Message-Id: 
 <85405f0d3a4b844f7bbb34717bd5f88b81acb074.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162369

From: Marta Rybczynska <rybczynska@gmail.com>

This patch fixes a potential overflow in grub's disk/cryptodisk. It is
a part of a security series [1]

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...odisk-Fix-potential-integer-overflow.patch | 50 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0019-disk-cryptodisk-Fix-potential-integer-overflow.patch

diff --git a/meta/recipes-bsp/grub/files/0019-disk-cryptodisk-Fix-potential-integer-overflow.patch b/meta/recipes-bsp/grub/files/0019-disk-cryptodisk-Fix-potential-integer-overflow.patch
new file mode 100644
index 0000000000..dd7fda357d
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0019-disk-cryptodisk-Fix-potential-integer-overflow.patch
@@ -0,0 +1,50 @@
+From 2550aaa0c23fdf8b6c54e00c6b838f2e3aa81fe2 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 21 Jan 2021 11:38:31 +0000
+Subject: [PATCH] disk/cryptodisk: Fix potential integer overflow
+
+The encrypt and decrypt functions expect a grub_size_t. So, we need to
+ensure that the constant bit shift is using grub_size_t rather than
+unsigned int when it is performing the shift.
+
+Fixes: CID 307788
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=a201ad17caa430aa710654fdf2e6ab4c8166f031]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/disk/cryptodisk.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/disk/cryptodisk.c b/grub-core/disk/cryptodisk.c
+index 5037768..6883f48 100644
+--- a/grub-core/disk/cryptodisk.c
++++ b/grub-core/disk/cryptodisk.c
+@@ -311,10 +311,10 @@ grub_cryptodisk_endecrypt (struct grub_cryptodisk *dev,
+ 	case GRUB_CRYPTODISK_MODE_CBC:
+ 	  if (do_encrypt)
+ 	    err = grub_crypto_cbc_encrypt (dev->cipher, data + i, data + i,
+-					   (1U << dev->log_sector_size), iv);
++					   ((grub_size_t) 1 << dev->log_sector_size), iv);
+ 	  else
+ 	    err = grub_crypto_cbc_decrypt (dev->cipher, data + i, data + i,
+-					   (1U << dev->log_sector_size), iv);
++					   ((grub_size_t) 1 << dev->log_sector_size), iv);
+ 	  if (err)
+ 	    return err;
+ 	  break;
+@@ -322,10 +322,10 @@ grub_cryptodisk_endecrypt (struct grub_cryptodisk *dev,
+ 	case GRUB_CRYPTODISK_MODE_PCBC:
+ 	  if (do_encrypt)
+ 	    err = grub_crypto_pcbc_encrypt (dev->cipher, data + i, data + i,
+-					    (1U << dev->log_sector_size), iv);
++					    ((grub_size_t) 1 << dev->log_sector_size), iv);
+ 	  else
+ 	    err = grub_crypto_pcbc_decrypt (dev->cipher, data + i, data + i,
+-					    (1U << dev->log_sector_size), iv);
++					    ((grub_size_t) 1 << dev->log_sector_size), iv);
+ 	  if (err)
+ 	    return err;
+ 	  break;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 2fccdc2d62..130f32551b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -65,6 +65,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0016-disk-ldm-Make-sure-comp-data-is-freed-before-exiting.patch \
            file://0017-disk-ldm-If-failed-then-free-vg-variable-too.patch \
            file://0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch \
+           file://0019-disk-cryptodisk-Fix-potential-integer-overflow.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


