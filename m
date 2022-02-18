Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9ABC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:07:04 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.9119.1645178823266241028
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fg7WDI6L;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so8222569wme.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MCtne/RIUcrQpxCr80pxg7X2Nd2iOmLu+TFr1nJtrG0=;
        b=Fg7WDI6LfL+mEOcQQvRxoWpXa5OPpY5BUG2NA6/YnnqL2hgPUnYYxv0X/tSTPssQC5
         +H/YsXAqyn2f2kis2X8157+7uWhPvPynlgUemxujrwPfX5YW7xNX1o4L7B25l1l2+omT
         2r8IBfHWM14+ObJNrlUSNdUV7DW2UR2tSJr2j7IpaKGtR5lOs9ol/ZBB4f3tG+tFn6Mm
         jzbFkWbz7HsKhRVHLJ+n+f1dpRSJH4LmbScl7GCxYfGWAHK4l5DsZrulKwrv2D2sLUr6
         1pV42HabfZutpxjOvdWcHhcfFBtBC1JoP5YDfqPhQ1TIAE+rKlDU0mvgHZuRSv/B4/dN
         T+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MCtne/RIUcrQpxCr80pxg7X2Nd2iOmLu+TFr1nJtrG0=;
        b=k7zOq6heHfXQRwrcpN1t0ZS+nH5hx392TJKhxtBU1062P2j8RWgVD47YGjaPQUO5bA
         PnY6wwWHduxvnF1XTFaZ/9rYGBakYURsLpMYpemyLt6PbH/zVHvzI+3QoZRh2lLk+sD8
         +U20H8AoCuE4y3mAM+U9CU+o5Dx3gasuojhP5tKQ68aqiHzxl1UQBPEkFC2c7STpQA9p
         1g9M4QPS34D4Fe6Ls3PaEmhfs+Spyz8Q2INJ2qAXCw6asdKWW1J5rQMtDEHZzGgE5OM2
         NkbiP/hGdp6Ti7jF2/N7QVk/TvmJDfuBQ4m7afLS2sTHeUmWz73w8kWiIF1toLJsmgrL
         0e4A==
X-Gm-Message-State: AOAM5334eoSyBKsN0qcXVdpBeW4n/yiZUI81RY3ALabywqGCzsFD8PsA
	ss8cDh/yyS9QQU0Qv16oRTE=
X-Google-Smtp-Source: 
 ABdhPJyjG8uLMy87rQ4PXgeV2yJyNHKdAXAPRaSiq2b8zz4X10MXX2qpgJ0DIHBXVtejeDValuxjFg==
X-Received: by 2002:a7b:c192:0:b0:37b:c6f5:4df0 with SMTP id
 y18-20020a7bc192000000b0037bc6f54df0mr6498964wmi.79.1645178821792;
        Fri, 18 Feb 2022 02:07:01 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:07:01 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 43/46][dunfell] grub: fix incorrect use of a negative value
Date: Fri, 18 Feb 2022 11:05:51 +0100
Message-Id: <20220218100554.1315511-44-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:07:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161931

This patch adds a fix for an incorrect use of a negative value in grub's
util/glue-efi. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...x-incorrect-use-of-a-possibly-negati.patch | 50 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch

diff --git a/meta/recipes-bsp/grub/files/0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch b/meta/recipes-bsp/grub/files/0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch
new file mode 100644
index 0000000000..66d7c0aa42
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch
@@ -0,0 +1,50 @@
+From e301a0f38a2130eb80f346c31e43bf5089af583c Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 4 Dec 2020 15:04:28 +0000
+Subject: [PATCH] util/glue-efi: Fix incorrect use of a possibly negative value
+
+It is possible for the ftell() function to return a negative value,
+although it is fairly unlikely here, we should be checking for
+a negative value before we assign it to an unsigned value.
+
+Fixes: CID 73744
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=1641d74e16f9d1ca35ba1a87ee4a0bf3afa48e72]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ util/glue-efi.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/util/glue-efi.c b/util/glue-efi.c
+index 68f5316..de0fa6d 100644
+--- a/util/glue-efi.c
++++ b/util/glue-efi.c
+@@ -39,13 +39,23 @@ write_fat (FILE *in32, FILE *in64, FILE *out, const char *out_filename,
+   struct grub_macho_fat_header head;
+   struct grub_macho_fat_arch arch32, arch64;
+   grub_uint32_t size32, size64;
++  long size;
+   char *buf;
+ 
+   fseek (in32, 0, SEEK_END);
+-  size32 = ftell (in32);
++  size = ftell (in32);
++  if (size < 0)
++    grub_util_error ("cannot get end of input file '%s': %s",
++		     name32, strerror (errno));
++  size32 = (grub_uint32_t) size;
+   fseek (in32, 0, SEEK_SET);
++
+   fseek (in64, 0, SEEK_END);
+-  size64 = ftell (in64);
++  size = ftell (in64);
++  if (size < 0)
++    grub_util_error ("cannot get end of input file '%s': %s",
++		     name64, strerror (errno));
++  size64 = (grub_uint64_t) size;
+   fseek (in64, 0, SEEK_SET);
+ 
+   head.magic = grub_cpu_to_le32_compile_time (GRUB_MACHO_FAT_EFI_MAGIC);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a1fbc5e644..2f230065b2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -89,6 +89,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch \
            file://0041-util-grub-install-Fix-NULL-pointer-dereferences.patch \
            file://0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch \
+           file://0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


