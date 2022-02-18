Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799FEC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:07:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.8981.1645178820347762707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iWtJzHIZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id c192so4884802wma.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4gJLTulEAeKLnRuADRou7LbAOhwqbOMhlq9+PmPGm1s=;
        b=iWtJzHIZYRbr8wxZ7i18EQI8l1M1T6dTIr/X1sT0D3HY6RoyaN4qFy2bEry+VngfW1
         NM5+KnPUdro/7aq92CmA0/c0mp1EhRUw0Axgl+CpuDGQ8UJdSShocu51wOf+w8LdF68C
         GLa5DV1DQlWpWeRbE4JAT0DdmQbr97WQVB5bfIDyd9GaFyFKEVFsW4EnW0bPeC40+5zr
         IQVbnimtvcYk3Tb0TR2+LjWcWXfDPD2sR8AqdJHjmECswN58E6pbbvQ0V66OdtN3ehJ1
         5nh7OkDiKTWRvG50ccHPPZAujDYxu3oAWi26nsUWJxgUN3NLcNV/bBQwHv/R11Ixq/by
         DK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4gJLTulEAeKLnRuADRou7LbAOhwqbOMhlq9+PmPGm1s=;
        b=Pg3iJg3bDVAbrRqwGBUWFWFTeXv8tBX0wJzGTfoDF/CbsX+CdSX/31Z9Rfrj2pdduT
         viZQDG4x0DsdT+LNn48dgYERQ+J33Nyfrx1WG6a10oM+yId23x/E760HXkfuzOj6KBUv
         +QVd9yjgHz1uURwo/QAMzNZlsMRI1g3hEgq4l8Cd2dfT82x/cZ//hHoN0FkCTAUaYp+y
         7q220M62u8uVSMZVWKDSV2Rtzx9a/n1kqWuYPv0lz1rfQ1S+b2cZTp9rMVx38RbJfDOA
         45X/rQDKZ3soBGsFrSZYSdDFwd0LJqnYFC9FgDvYcf8YY3Nmx0Ka0kIuYDahV3D63rYU
         QtKw==
X-Gm-Message-State: AOAM530YlClbHgozZLhto9rkRptCBeSm9oF+eVRO2m4YrXtaxhi07etW
	4lDtKulTcE1mWLQ037Ak3OI=
X-Google-Smtp-Source: 
 ABdhPJx+hdErfyWdwaq8eN4GcF6yNG1QlcEQP8EpEAUhUVgt1P4DBz/Yb7ZAqzLsVWVcOgjA4qn7Rw==
X-Received: by 2002:a05:600c:1c1a:b0:37b:ead2:8e6d with SMTP id
 j26-20020a05600c1c1a00b0037bead28e6dmr10196313wms.94.1645178818876;
        Fri, 18 Feb 2022 02:06:58 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:58 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 40/46][dunfell] grub: add a check for a NULL pointer
Date: Fri, 18 Feb 2022 11:05:48 +0100
Message-Id: <20220218100554.1315511-41-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:07:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161928

This patch adds a check for a NULL pointer before use in grub's
loader/xnu. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...k-if-pointer-is-NULL-before-using-it.patch | 42 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch

diff --git a/meta/recipes-bsp/grub/files/0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch b/meta/recipes-bsp/grub/files/0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch
new file mode 100644
index 0000000000..8081f7763a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch
@@ -0,0 +1,42 @@
+From 778a3fffd19229e5650a1abfb06c974949991cd4 Mon Sep 17 00:00:00 2001
+From: Paulo Flabiano Smorigo <pfsmorigo@canonical.com>
+Date: Mon, 30 Nov 2020 10:36:00 -0300
+Subject: [PATCH] loader/xnu: Check if pointer is NULL before using it
+
+Fixes: CID 73654
+
+Signed-off-by: Paulo Flabiano Smorigo <pfsmorigo@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=7c8a2b5d1421a0f2a33d33531f7561f3da93b844]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/loader/xnu.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/loader/xnu.c b/grub-core/loader/xnu.c
+index 39ceff8..adc048c 100644
+--- a/grub-core/loader/xnu.c
++++ b/grub-core/loader/xnu.c
+@@ -667,6 +667,9 @@ grub_xnu_load_driver (char *infoplistname, grub_file_t binaryfile,
+   char *name, *nameend;
+   int namelen;
+ 
++  if (infoplistname == NULL)
++    return grub_error (GRUB_ERR_BAD_FILENAME, N_("missing p-list filename"));
++
+   name = get_name_ptr (infoplistname);
+   nameend = grub_strchr (name, '/');
+ 
+@@ -698,10 +701,7 @@ grub_xnu_load_driver (char *infoplistname, grub_file_t binaryfile,
+   else
+     macho = 0;
+ 
+-  if (infoplistname)
+-    infoplist = grub_file_open (infoplistname, GRUB_FILE_TYPE_XNU_INFO_PLIST);
+-  else
+-    infoplist = 0;
++  infoplist = grub_file_open (infoplistname, GRUB_FILE_TYPE_XNU_INFO_PLIST);
+   grub_errno = GRUB_ERR_NONE;
+   if (infoplist)
+     {
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index eebe9a7233..fad7415e0d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -86,6 +86,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0037-loader-bsd-Check-for-NULL-arg-up-front.patch \
            file://0038-loader-xnu-Fix-memory-leak.patch \
            file://0039-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch \
+           file://0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


