Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796ABC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:52 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.9091.1645178811015539915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U3P6uww5;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso5985129wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U87pmDD4vvJeIKOvGJEwsi58NrLj2TWBh+WDe+8WcDM=;
        b=U3P6uww5nnCQ7xALaF1oyngtAfqgdxuv4KOBIuS96RgfcJXJ2wpflxjgNr7kQn+otf
         KEi+FYIt1yahnzDkvl8ZPch0NosXFfJhhMdrm0HVICJF1NJUAotDobNKpZsH82jKKBxL
         IjjzEUoSGYcJH22yJXHidrE6nSldHfLHfSTkwWn0IBkNG5RrWHoJdkiYV8N9EylquANH
         vHNY0FzG63enCbfWC6upodn8h5w2c//Y+9GIueJHsnvgc44pyKmGfu3OZEYxRG8WgaZn
         gUa/dMMmmaz+vEH6hN3Vnu934etO5Dq9BHwsOWExDIkOC1o6MfzUlcjd8+Z9X4xJyIAa
         IaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U87pmDD4vvJeIKOvGJEwsi58NrLj2TWBh+WDe+8WcDM=;
        b=0S0scOErA/Oo4KTDUFyv67+DizB+pFqlr7koI6wj1Dpw7W8FDiARnO5gNKb3hPOazZ
         VOUlwrBZA8uF7DRfBJBkf/xuOjlaKRgv1eUiulf8u8DsEB/paWvRO6fORPcx75vVY4Bh
         27n3crdfH39DwG/ewVfUe0s5vcnzR3wz7S1K2xBk4UJCbtXaHaDMF/MQRsgLjH4UoSIb
         5ZTFLHbIZpcrPnYWVjG44scjcX7i6gg9JeG19HLXz6sCao+Aq6YOczJH2t8eT0HZatxl
         CxZzcmw3TqaLhIm0vnNo1TKNcGjn98RvtU3lJVZax0Hnkmqqxu23CfdYPIGbAlL3ZRtg
         Oc0w==
X-Gm-Message-State: AOAM531WNbE9b7BqbzCIOdQCNm4AVAG+lWDIkNW4DLeZdb9wZa/5BQic
	7i6ecakHXDiLs/bfWHa4cqI=
X-Google-Smtp-Source: 
 ABdhPJyuhFzbbEHDinhonO3mXPvjq4EGg9aNH3/2YA0DbzdXHpjRcWj5dBxtKjQ2ZljxNlowxynjNQ==
X-Received: by 2002:a1c:7419:0:b0:37b:b96e:81a6 with SMTP id
 p25-20020a1c7419000000b0037bb96e81a6mr10040441wmc.8.1645178809556;
        Fri, 18 Feb 2022 02:06:49 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:49 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 31/46][dunfell] grub: remove unneeded return value
Date: Fri, 18 Feb 2022 11:05:39 +0100
Message-Id: <20220218100554.1315511-32-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161919

This patch removes an uneeded return value in grub's (static)
grub_video_gop_fill_mode_info(). It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...move-unnecessary-return-value-of-gru.patch | 94 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch

diff --git a/meta/recipes-bsp/grub/files/0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch b/meta/recipes-bsp/grub/files/0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch
new file mode 100644
index 0000000000..7e4e951245
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch
@@ -0,0 +1,94 @@
+From 2a1e5659763790201a342f8a897c8c9d8d91b1cc Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Tue, 8 Dec 2020 21:14:31 +0000
+Subject: [PATCH] video/efi_gop: Remove unnecessary return value of
+ grub_video_gop_fill_mode_info()
+
+The return value of grub_video_gop_fill_mode_info() is never able to be
+anything other than GRUB_ERR_NONE. So, rather than continue to return
+a value and checking it each time, it is more correct to redefine the
+function to not return anything and remove checks of its return value
+altogether.
+
+Fixes: CID 96701
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=fc5951d3b1616055ef81a019a5affc09d13344d0]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/video/efi_gop.c | 25 ++++++-------------------
+ 1 file changed, 6 insertions(+), 19 deletions(-)
+
+diff --git a/grub-core/video/efi_gop.c b/grub-core/video/efi_gop.c
+index 7f9d1c2..db2ee98 100644
+--- a/grub-core/video/efi_gop.c
++++ b/grub-core/video/efi_gop.c
+@@ -227,7 +227,7 @@ grub_video_gop_fill_real_mode_info (unsigned mode,
+   return GRUB_ERR_NONE;
+ }
+ 
+-static grub_err_t
++static void
+ grub_video_gop_fill_mode_info (unsigned mode,
+ 			       struct grub_efi_gop_mode_info *in,
+ 			       struct grub_video_mode_info *out)
+@@ -252,8 +252,6 @@ grub_video_gop_fill_mode_info (unsigned mode,
+   out->blit_format = GRUB_VIDEO_BLIT_FORMAT_BGRA_8888;
+   out->mode_type |= (GRUB_VIDEO_MODE_TYPE_DOUBLE_BUFFERED
+ 		     | GRUB_VIDEO_MODE_TYPE_UPDATING_SWAP);
+-
+-  return GRUB_ERR_NONE;
+ }
+ 
+ static int
+@@ -266,7 +264,6 @@ grub_video_gop_iterate (int (*hook) (const struct grub_video_mode_info *info, vo
+       grub_efi_uintn_t size;
+       grub_efi_status_t status;
+       struct grub_efi_gop_mode_info *info = NULL;
+-      grub_err_t err;
+       struct grub_video_mode_info mode_info;
+ 	 
+       status = efi_call_4 (gop->query_mode, gop, mode, &size, &info);
+@@ -277,12 +274,7 @@ grub_video_gop_iterate (int (*hook) (const struct grub_video_mode_info *info, vo
+ 	  continue;
+ 	}
+ 
+-      err = grub_video_gop_fill_mode_info (mode, info, &mode_info);
+-      if (err)
+-	{
+-	  grub_errno = GRUB_ERR_NONE;
+-	  continue;
+-	}
++      grub_video_gop_fill_mode_info (mode, info, &mode_info);
+       if (hook (&mode_info, hook_arg))
+ 	return 1;
+     }
+@@ -466,13 +458,8 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
+ 
+   info = gop->mode->info;
+ 
+-  err = grub_video_gop_fill_mode_info (gop->mode->mode, info,
+-				       &framebuffer.mode_info);
+-  if (err)
+-    {
+-      grub_dprintf ("video", "GOP: couldn't fill mode info\n");
+-      return err;
+-    }
++  grub_video_gop_fill_mode_info (gop->mode->mode, info,
++				 &framebuffer.mode_info);
+ 
+   framebuffer.ptr = (void *) (grub_addr_t) gop->mode->fb_base;
+   framebuffer.offscreen
+@@ -486,8 +473,8 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
+     {
+       grub_dprintf ("video", "GOP: couldn't allocate shadow\n");
+       grub_errno = 0;
+-      err = grub_video_gop_fill_mode_info (gop->mode->mode, info,
+-					   &framebuffer.mode_info);
++      grub_video_gop_fill_mode_info (gop->mode->mode, info,
++				     &framebuffer.mode_info);
+       buffer = framebuffer.ptr;
+     }
+     
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index d18e329b96..24a269d90d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -77,6 +77,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0028-syslinux-Fix-memory-leak-while-parsing.patch \
            file://0029-normal-completion-Fix-leaking-of-memory-when-process.patch \
            file://0030-commands-hashsum-Fix-a-memory-leak.patch \
+           file://0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


