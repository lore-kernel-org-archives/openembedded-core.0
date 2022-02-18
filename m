Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755F6C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:44 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.9183.1645178803307073628
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cO0gVtnx;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id k1so13633371wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c0bF28jMT2FUs1tth6oo0AxFZMx1WUzgqCwYvooCrVk=;
        b=cO0gVtnxgYVYJGWGGzlw+rky3hlpHF8NbVviqwl6pnX7C0bdqsqlRLoTLahWNVIl2j
         D7T+ZKM3aVkHZzeYTegYgg/i8BOZIJZOZf7hFeepfA3nSSc4kPfxatgONcCnqZ44WYIy
         QyW4uCkn4rNLQfVg5f2OL9wqjwkp3e1qJxStbrdEcifHwKX/iVC/Y7sbYPER3PdM+BQq
         kQHzbK2QerW9gY6iU/NVaMP7AfzmynUd2LFbMJobU9KO9lOGaK296I2Cjvy0u5XjNaOT
         C5ez5RF7AMvu6POvmTNyt951gS815sCIyQ7y+EPWJpBSiVqmNi+DMyVvxkJDBEsq5ATZ
         WX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c0bF28jMT2FUs1tth6oo0AxFZMx1WUzgqCwYvooCrVk=;
        b=7x+q5kuVXYfvbPD2gUUSOVisRxvH011yzxLkxaVOQ1ilNXU8BYiAQuD1wkzvPcnY23
         6mbzMtv1L1/BlgZVR7Wn8PGoIuXP/kGOTX+LnPuoaiuy+1PWpDaPdQ3GeTtwel66nFJ8
         qhicWxTV98TnRYV3bvOzkdkMRpHJfwfvyXZifvb/hdx5u0scNslDXnOJ7G50XEKrNPcg
         Hnk1CSR+0/NNREBatTB/fRoD4qk1n+kFEwEg8V3MktIdnk94AuTHt5DOSTq/9fN8BJFW
         0hSn89sJ9Fw64OWObQagCPKf9BXsWlFDZWSbZuCUbiByT5S3g+h/cx/sIDVdV+y0iQqd
         oVYg==
X-Gm-Message-State: AOAM533RQeXvig9Vj3Hop9Gfd7dc/YpGUS3QlRZZvkxBe5KulqnLX5lU
	6+sFq9IlJ4Qxc3QVBQxj8C4=
X-Google-Smtp-Source: 
 ABdhPJwZE0SWCzfT9/jTHujM0Ok4E681BllwxwffzNLPURbCbi/ih6FGGpGV2NGnX4UQ05BFI0fz6g==
X-Received: by 2002:a5d:6701:0:b0:1e3:3ba6:d2e8 with SMTP id
 o1-20020a5d6701000000b001e33ba6d2e8mr5379633wru.221.1645178801847;
        Fri, 18 Feb 2022 02:06:41 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:41 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 24/46][dunfell] grub: fix an error check
Date: Fri, 18 Feb 2022 11:05:32 +0100
Message-Id: <20220218100554.1315511-25-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161912

This patch fixes an error check in grub's zfsinfo. It is a part of
a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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
2.33.0


