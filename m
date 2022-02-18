Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7460DC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.8970.1645178784054249511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o8a0OJxC;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso8200983wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lavZ0HhfiDzzi83m9ev0wzuGsdpwkqKjGPTXbKr2R7A=;
        b=o8a0OJxCRo8T+cFXLL4K2EJcbjJ+DAkiqjRtUzFX+PZtYOYxdJF6RJPnFwZAAFT+U4
         uhwLpZSbhq918KnCYmN/Og2lsAJBkVtdy54eFnSBqdwGvIK5bIgMsIQeyTHXVo/xVZGj
         gN+XPlU6jY7AxN/vHRWwvnJ4xsQyXFprbymgS2irPUvws59c1kKjEno/d+N+Y2O9P7Qu
         PTzLbjCyYxCSazGNqunpuyuVECNCKXrbhBwmLjMRBG73M8l2xyul3isvPDyJFyuw6/uI
         RJCFjBb95OJTWgBJhmu6gzF0yt83uIihm6dJBRJ0+ozkver2iYkouSMJjGxHMbcVi3aS
         WLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lavZ0HhfiDzzi83m9ev0wzuGsdpwkqKjGPTXbKr2R7A=;
        b=vhBsklxIfazGor02ImTfNorx2XzPaP1w9iZVsb5UYCj8NFwjrXRKG2U+lADPrpLK4x
         ItTh113/k9dYGjkqX/zHTA5drQFtF0dyfNo6dbYLUvnb5cPdF1lt7ioiOcmD96XbZxYB
         baxWGU+uK0j151M6JCEnzPuPgJVIXmzXmgg6WgGvxd3MeldOyGpnSJxnrgrSia3beMKi
         BOY9WVJpuoLTzWivsYZv+2ZS2TOfX+DSxNgnKmA8dh+kjlkagy7/SeYZDDBSvedm3Eec
         B78Ewu61Mk2jzvLqIyCkJci7JsWYYDrgFJynE4neHsMKG+4nE0UmWu9VatCUoR5pzWwG
         EDIw==
X-Gm-Message-State: AOAM530vSdey+gdKmyj8IzSQVu0CXr2COhe/nzJGfD5kujolrqp8BjEv
	0KZNAQP/baDcuiFafAZeOtU=
X-Google-Smtp-Source: 
 ABdhPJxGEeJEsyZsUtW12PNwxTXzyrxPO1eYEY3AWoIGrgf2PPiml//UX086vepxSC4OilraZ0d18g==
X-Received: by 2002:a05:600c:212:b0:37c:919b:3eba with SMTP id
 18-20020a05600c021200b0037c919b3ebamr9912750wmi.119.1645178782529;
        Fri, 18 Feb 2022 02:06:22 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:22 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 06/46][dunfell] grub: fix memory leak at error in
 grub_efi_get_filename()
Date: Fri, 18 Feb 2022 11:05:14 +0100
Message-Id: <20220218100554.1315511-7-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161894

This change fixes a memory leak on error in grub_efi_get_filename().
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...-kern-efi-Fix-memory-leak-on-failure.patch | 30 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0006-kern-efi-Fix-memory-leak-on-failure.patch

diff --git a/meta/recipes-bsp/grub/files/0006-kern-efi-Fix-memory-leak-on-failure.patch b/meta/recipes-bsp/grub/files/0006-kern-efi-Fix-memory-leak-on-failure.patch
new file mode 100644
index 0000000000..9d7327cee6
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0006-kern-efi-Fix-memory-leak-on-failure.patch
@@ -0,0 +1,30 @@
+From d4fd0243920b71cc6e03cc0cadf23b4fe03c352f Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 5 Nov 2020 10:15:25 +0000
+Subject: [PATCH] kern/efi: Fix memory leak on failure
+
+Free the memory allocated to name before returning on failure.
+
+Fixes: CID 296222
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=ed286ceba6015d37a9304f04602451c47bf195d7]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/kern/efi/efi.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/grub-core/kern/efi/efi.c b/grub-core/kern/efi/efi.c
+index 6a38080..baeeef0 100644
+--- a/grub-core/kern/efi/efi.c
++++ b/grub-core/kern/efi/efi.c
+@@ -415,6 +415,7 @@ grub_efi_get_filename (grub_efi_device_path_t *dp0)
+ 	    {
+ 	      grub_error (GRUB_ERR_OUT_OF_RANGE,
+ 			  "malformed EFI Device Path node has length=%d", len);
++	      grub_free (name);
+ 	      return NULL;
+ 	    }
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index f7f2aa892f..04ed8b7b23 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -52,6 +52,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0003-net-tftp-Fix-dangling-memory-pointer.patch \
            file://0004-kern-parser-Fix-resource-leak-if-argc-0.patch \
            file://0005-efi-Fix-some-malformed-device-path-arithmetic-errors.patch \
+           file://0006-kern-efi-Fix-memory-leak-on-failure.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


