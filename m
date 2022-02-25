Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75783C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:14 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.6927.1645799234045712812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=b3U15PLY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so4985141pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0aGud+Az9S6DmdzzrcVTYI3LQYlzdBksdwSJdqP096c=;
        b=b3U15PLYzix7v43yF0LKe2EQb63KD/lB8qbHLe3jsjEzhQaf5/tSe/vGrRiv11pJNy
         GysNSWmXQCq6JCdssxD4AgX7oh05K5cM2Hcrg6RnSkZHKp3dtnvwwgsu1S2hT2MuGim7
         rk1ceiIeLbn2wUzjTXFYgBJN3ZRBiD09IrZ5AETlITT0btI9f5EStgp8Xjf+iTLPoHsp
         r6l+FnVe/srQvQk3irpcDXcG8poVTgsnITJL3oHh07CkQP/l0webhMe06EbJCJvVsmKW
         9JDxQzDt7x2QGX5XYo0i90MSpEC3CyQVcZfEcZZmamXKnqf5YkCvGtXVRmVw3CwPC/Wz
         F/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0aGud+Az9S6DmdzzrcVTYI3LQYlzdBksdwSJdqP096c=;
        b=QwC68/jl6vyaUerjTpH7SM0ZJV4ONS3W6P0j9nY09w8QQbUG3KJU2tm1uAZzk2tTe0
         4CXeTpM6hsfiHE1k6pzWCrotNfObpT6yY8G3RgTIcNzWYZWqbwFZtBOKjBRS8H8hxEzN
         wVfIlsS3iLc5MkkhsJx0IqAg4+GaI42tUkYsMOG58E33vmM1kzgOkHTBfFnKySMzv/JP
         fRGyPOIIErQY3lJLbAf90uXjWS5YrJKectS3DSvJ4XSCeSrL9CjEUQlfn3Mhy/3/uw/9
         VOAhaiKNkkjIFrXI2jE1by0TF3gFVVFRU9/G1Ggqa4dJjfq4JrpwZTDwv4jYyLU8Dtxf
         ULJA==
X-Gm-Message-State: AOAM5318ikG+Q3AAuKavySwLQ+9RGchlYVswg5xRXrBufv2dLzlFloiR
	9MvNrq7KmIuk9cpN/a7eBhs0M6VXWCFfYBHF
X-Google-Smtp-Source: 
 ABdhPJztDxhm3TWgk3bldCLRKYHs/fjE2Kw9e5hiuTLxUyelG988+6n5Nk9fiw/7tdV42hsvBlqUTA==
X-Received: by 2002:a17:902:9a47:b0:150:27e0:abc5 with SMTP id
 x7-20020a1709029a4700b0015027e0abc5mr3664671plv.109.1645799233102;
        Fri, 25 Feb 2022 06:27:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/50] grub: add a fix for a possible NULL pointer
 dereference
Date: Fri, 25 Feb 2022 04:25:51 -1000
Message-Id: 
 <a49ffdd81e020224ea3e94a266e49d40ebb7198a.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162357

From: Marta Rybczynska <rybczynska@gmail.com>

This change fixes a possible NULL pointer dereference in grub's
EFI support. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


