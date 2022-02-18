Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4D3C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9085.1645178798028664448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aQTMaCkQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id k1so13632974wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kxcv53gL+SCfvq14d+AXQKLa9+TdEQmDoRhOBfRruOw=;
        b=aQTMaCkQGQm8bBs9ebfeDPqj07jg1UHqQdh0PPkRN7dDvdH9Gjh9hCVDg+2PElK7KX
         3IB/MbKlwElCBooD+6GQkIpL+4Vlh3iaS9c3uPcL8ZHxf0Q8PybKlmtxOoefw9EfvxU+
         1b3vrvtNAuMIsdldGm83c6dUu5hZZfQijraAJzHxEp/39zxrIlTmAXmXnPlKdgWKThAZ
         VHaB1f+vqDe81PKK85yZYuXnHAAUBxPwq1gdkihzD3OoQleqhjV5Gs6LHUu0g/bb7mXm
         0EGfgs8aoINz7WQ8segIXot5RW8bcm1ZLwGMDjDdjHXm1i9fmOe2O2aDRAW0hBVnz/17
         5bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kxcv53gL+SCfvq14d+AXQKLa9+TdEQmDoRhOBfRruOw=;
        b=IXXlyuc3HzZksHZceU+4IOLZpC2iiHT/ATgn49VsKAwnHPJX/PjQNarSDkPxpJUbtj
         nEUy1EmUybOrVeosSMq9m+MVYMjPm8bXp5H3jWyJWI2OGeAlPDiFHM9A3O0AbJ4Zftla
         VvdZGUNWMcMd5bQuJkNkn0gFAgp5Y41bVUb4ZbqBefwbjPzCAZd4JAidbFE3luRJmBvV
         QoKIx9fzskPiAms9Rw4ynSZ8z5f0IdkbOveY9UQMWrb9m8nLbHs1rxI1Pc7hmAMf9UQ8
         1iwyO2pRM1mcrIqlVhnD91ySs8LdlHA58Leh7XYUFN1oMqS0WrKhCveesXhIGl2v58dq
         7Ltw==
X-Gm-Message-State: AOAM533hXca6wVle6GO7P75OD0/T/i43kw1X4MiVl3KCTPzuoGDFHWnh
	GRhNSb+UmCyySUT4JKmf864=
X-Google-Smtp-Source: 
 ABdhPJwfFAm4lAAWlN8YtDKccQN+dZahS4Hw2GH0VQ8U/huHjPEmwggQKxHvioHTKH2LdQ9s13SJUA==
X-Received: by 2002:adf:f644:0:b0:1e3:bfed:6eb5 with SMTP id
 x4-20020adff644000000b001e3bfed6eb5mr5458255wrp.654.1645178796499;
        Fri, 18 Feb 2022 02:06:36 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:36 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 19/46][dunfell] grub: fix an integer overflow
Date: Fri, 18 Feb 2022 11:05:27 +0100
Message-Id: <20220218100554.1315511-20-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161907

This patch fixes a potential overflow in grub's disk/cryptodisk. It is
a part of a security series [1]

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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
2.33.0


