Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B37C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:25 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9177.1645178784860673619
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CJTFrrqq;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id u1so13612191wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zoK6QWrvubnTcrQPfuqquiWx/1qYluZBBobtf31i32I=;
        b=CJTFrrqqbmiMZDcDdOqWAyTep08cice3puPRsi95nR+h+3GVdO1hBS7hzguUnfl9gs
         hlBTC07Os3y1M7uO6AhWryDTSUo0BKLFN+30gH04T8okPqmgMXpc7Beb7ZEJvxBWyCuP
         bIgCr3BcClX3Y2uLVCvhslXHDoSORDhvcxx0MLJvi2jmKzT/UPFXuTMbJjcZlhLMpBfC
         Ng50V57IF547X3cEn6+vftsVhdSAUCO4sRd0xmFvpdbDfP6aIbRIoeJcJOssxVnBpFTG
         V6yrt8jUduXIQLCFrp8X+pMmymTsa+H5wqic1JbZyX/LMBO+R6RI+/lCQANsdNvl0itf
         sfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zoK6QWrvubnTcrQPfuqquiWx/1qYluZBBobtf31i32I=;
        b=Luh0MCxP8T9M1julcjVgS5eq137/1ZODVeiBYihQ6CTbNT+euOs89KsisJT/1QZWGT
         B0B6KUnhP35m8eIWuqgJYgtCLtAPCvAI0ZgQWi+nyY5PGZBz/8MdtllklfyebsZ1hCi1
         AQcK6M1eI7YFx2DN861KrLsDd+PodrXhd3UUEbdqlo/bzgibNTTNhGQ0KL4KcdSY8swI
         4s+0v3lMzchhkjuUUtA9VMzb/DdpLafo1HsaV3WrYYhEt8liq1wi12WQXgrL+XUJed+d
         4qH+gHPrzJlPP5mGRL2pdQOTv1ktBCiVJVUfxh+vkyJw+JqDnz9OetmXjupbg1xwJqFj
         FzcA==
X-Gm-Message-State: AOAM533o+0nkIP8ma8gYC9fq1bbBP3hvGkX7l/lwGh5UbWrT+Jo8OC2t
	I+B3jrf6z4LQDhyAq2CC+qY=
X-Google-Smtp-Source: 
 ABdhPJy9e7cJvEWcn0lvS9AAL+rMjs6QB8diSihQSJWc1Lw1fdyKvv3oYNHgN4DPw6iUDobAEe7Q8Q==
X-Received: by 2002:a5d:6f0a:0:b0:1e4:a354:a7e with SMTP id
 ay10-20020a5d6f0a000000b001e4a3540a7emr5368586wrb.423.1645178783434;
        Fri, 18 Feb 2022 02:06:23 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:23 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 07/46][dunfell] grub: add a fix for a possible NULL pointer
 dereference
Date: Fri, 18 Feb 2022 11:05:15 +0100
Message-Id: <20220218100554.1315511-8-rybczynska@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/161895

This change fixes a possible NULL pointer dereference in grub's
EFI support. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...ix-possible-NULL-pointer-dereference.patch | 65 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0007-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch

diff --git a/meta/recipes-bsp/grub/files/0007-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch b/meta/recipes-bsp/grub/files/0007-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch
new file mode 100644
index 0000000000..d55709406b
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0007-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch
@@ -0,0 +1,65 @@
+From be03a18b8767be50f16a845c389fd5ed29aae055 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 11 Dec 2020 15:03:13 +0000
+Subject: [PATCH] kern/efi/mm: Fix possible NULL pointer dereference
+
+The model of grub_efi_get_memory_map() is that if memory_map is NULL,
+then the purpose is to discover how much memory should be allocated to
+it for the subsequent call.
+
+The problem here is that with grub_efi_is_finished set to 1, there is no
+check at all that the function is being called with a non-NULL memory_map.
+
+While this MAY be true, we shouldn't assume it.
+
+The solution to this is to behave as expected, and if memory_map is NULL,
+then don't try to use it and allow memory_map_size to be filled in, and
+return 0 as is done later in the code if the buffer is too small (or NULL).
+
+Additionally, drop unneeded ret = 1.
+
+Fixes: CID 96632
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=6aee4bfd6973c714056fb7b56890b8d524e94ee1]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/kern/efi/mm.c | 19 ++++++++++++++-----
+ 1 file changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/grub-core/kern/efi/mm.c b/grub-core/kern/efi/mm.c
+index b02fab1..5afcef7 100644
+--- a/grub-core/kern/efi/mm.c
++++ b/grub-core/kern/efi/mm.c
+@@ -328,15 +328,24 @@ grub_efi_get_memory_map (grub_efi_uintn_t *memory_map_size,
+   if (grub_efi_is_finished)
+     {
+       int ret = 1;
+-      if (*memory_map_size < finish_mmap_size)
++
++      if (memory_map != NULL)
+ 	{
+-	  grub_memcpy (memory_map, finish_mmap_buf, *memory_map_size);
+-	  ret = 0;
++	  if (*memory_map_size < finish_mmap_size)
++	    {
++	      grub_memcpy (memory_map, finish_mmap_buf, *memory_map_size);
++	      ret = 0;
++	    }
++          else
++	    grub_memcpy (memory_map, finish_mmap_buf, finish_mmap_size);
+ 	}
+       else
+ 	{
+-	  grub_memcpy (memory_map, finish_mmap_buf, finish_mmap_size);
+-	  ret = 1;
++	  /*
++	   * Incomplete, no buffer to copy into, same as
++	   * GRUB_EFI_BUFFER_TOO_SMALL below.
++	   */
++	  ret = 0;
+ 	}
+       *memory_map_size = finish_mmap_size;
+       if (map_key)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 04ed8b7b23..46d65d8609 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -53,6 +53,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0004-kern-parser-Fix-resource-leak-if-argc-0.patch \
            file://0005-efi-Fix-some-malformed-device-path-arithmetic-errors.patch \
            file://0006-kern-efi-Fix-memory-leak-on-failure.patch \
+           file://0007-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


