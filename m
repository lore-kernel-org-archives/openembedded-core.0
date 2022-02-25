Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCF7C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:53 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.6900.1645799272848162178
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ORfXhnpd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso8568068pju.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mT+RrHO+HGc69wyWwuuwhbYFrcGBZZ9vJtHTzqxpw+0=;
        b=ORfXhnpdYoiP/K1TY1wefbjyEO1e2nF0qhmwLc3WZp4zDwvaYoGJGsakVt51qwXdEZ
         q0JdinJQIt5/bJS5DfAFNr4oqm86SV0zB3/6Me1e+A0oQerGyF18fsVOzHA9lRBLZKI6
         zV9loS4vfU6mIqEt/GBqq8VZsf1yeIEVNwByw/d6Z1/L5Gz7QNiUuWbjCe/lGhUovN7J
         sT2H0oKRE7rhwUJPl5x5fwuppji/cxl7g1fl8jg3N6SF2sDbOnprZ04hD1pPf8s5SaZy
         z6+BPsMZF5aEgi0dAQo+EAlaYI2obHADpzXn46JyopdaywFZkXtepUWaPen4G4XHwDg5
         glfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mT+RrHO+HGc69wyWwuuwhbYFrcGBZZ9vJtHTzqxpw+0=;
        b=sg0Z8eSH8eHK83iAiBFcQlS+jxhVljc8f/t8nQPSl/cwqSCzoNMfVcFR20leM/Kk52
         UW201orh0jW9roIhYYVrLtDh35/W5ak6SVUKyGPSsuG5edTVF2JjK5MEP5SaF8BpmodJ
         M9NL2VsgSH3dVF0dbSFEGf32Jn/fh+EW/M9g+gMy8QNHeesv91XsZqT3YssypYMG76Kc
         cA+kADAqr8Y5PlHUXa8qXj/oIx9u0Ms/FpVKWvAYIbgAI8fNR1czC/+TaZqenvHoEhA8
         eEYb52Y3eHKXYtONj2iYYXkQyOH6WtSBF5ZYrBH5ZmVuCHKA7tYJLqcczRzOCvznb9gx
         6D8Q==
X-Gm-Message-State: AOAM530gVF0ietINZUZGFu4PtDrMgTl++iceTXeIOh3dLyrGpq3DP0BQ
	u4b86QY2LicRI1MHwyekpUSSxF3W3XGDndtp
X-Google-Smtp-Source: 
 ABdhPJwxWEg0I5ai7HK/HU04Qua0knB4u7jnIIb9Cz58pjit2pizyWoh/KobpHZi99XR0IxgspT+Fw==
X-Received: by 2002:a17:903:2041:b0:14f:b0a6:18f5 with SMTP id
 q1-20020a170903204100b0014fb0a618f5mr7834159pla.50.1645799271756;
        Fri, 25 Feb 2022 06:27:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/50] grub: fix an error check
Date: Fri, 25 Feb 2022 04:26:08 -1000
Message-Id: 
 <ec842684b572e5fe940762e1b5b4339e6ef6a0ba.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162374

From: Marta Rybczynska <rybczynska@gmail.com>

This patch fixes an error check in grub's zfsinfo. It is a part of
a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-a-check-for-error-allocating-memory.patch | 35 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0024-zfsinfo-Correct-a-check-for-error-allocating-memory.patch

diff --git a/meta/recipes-bsp/grub/files/0024-zfsinfo-Correct-a-check-for-error-allocating-memory.patch b/meta/recipes-bsp/grub/files/0024-zfsinfo-Correct-a-check-for-error-allocating-memory.patch
new file mode 100644
index 0000000000..555dc19168
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0024-zfsinfo-Correct-a-check-for-error-allocating-memory.patch
@@ -0,0 +1,35 @@
+From b085da8efda9b81f94aa197ee045226563554fdf Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 26 Nov 2020 10:56:45 +0000
+Subject: [PATCH] zfsinfo: Correct a check for error allocating memory
+
+While arguably the check for grub_errno is correct, we should really be
+checking the return value from the function since it is always possible
+that grub_errno was set elsewhere, making this code behave incorrectly.
+
+Fixes: CID 73668
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=7aab03418ec6a9b991aa44416cb2585aff4e7972]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/fs/zfs/zfsinfo.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/fs/zfs/zfsinfo.c b/grub-core/fs/zfs/zfsinfo.c
+index c8a28ac..bf29180 100644
+--- a/grub-core/fs/zfs/zfsinfo.c
++++ b/grub-core/fs/zfs/zfsinfo.c
+@@ -358,8 +358,8 @@ grub_cmd_zfs_bootfs (grub_command_t cmd __attribute__ ((unused)), int argc,
+     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("one argument expected"));
+ 
+   devname = grub_file_get_device_name (args[0]);
+-  if (grub_errno)
+-    return grub_errno;
++  if (devname == NULL)
++    return GRUB_ERR_OUT_OF_MEMORY;
+ 
+   dev = grub_device_open (devname);
+   grub_free (devname);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 9158fc7f50..a660c069db 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -70,6 +70,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0021-zfs-Fix-possible-negative-shift-operation.patch \
            file://0022-zfs-Fix-resource-leaks-while-constructing-path.patch \
            file://0023-zfs-Fix-possible-integer-overflows.patch \
+           file://0024-zfsinfo-Correct-a-check-for-error-allocating-memory.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


