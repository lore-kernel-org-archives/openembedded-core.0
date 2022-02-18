Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798AEC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:07:02 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.9093.1645178821292198270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jgzq4qeQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 k127-20020a1ca185000000b0037bc4be8713so8219320wme.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YbgwM5ePXoPYVfm7W2uZRRtjOKUuCVh3Wjfh0qSzu/E=;
        b=jgzq4qeQP5VdDRHLIoToh0czxDZCWPaiQedYHLvyRCJhs21/s3W0/ab0cGwPqn4Mfm
         0kAuCC1wcfNB0SXMzWmitaSXPJ8l9Mz8n6qz/s/3jnYYfhVruIj+nS5CXdiQh6GbKmYF
         tHD9+ujgJa/PcOjZio7vQIy/LV7dxU4uLDVrn0tTR99cidJpu8Oqs2e0jaD6/vusizJC
         WjnL+0y/+mC7jvlGxdfT+9iEh66X9Wq43f938SqqsoaWIkVDzeQdvwHzx62QEecI9aNw
         drV/a8l9enb8Kp72LFxy7yLMKlEGBUWchAyt3WFZ+qCuAlfdNXUS+e5Yg88oL+vx4ts2
         CiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YbgwM5ePXoPYVfm7W2uZRRtjOKUuCVh3Wjfh0qSzu/E=;
        b=E0AFueqtQZfPR1UjGR4AO9IROfHCaNk7NeiKD1TzksB+HMJbRSfOawYzDNo3CFdd7B
         X9sKzhiMkM9AS2RQx5Csb6S+RoUa4rHUE5UHj+r96kahEy6m80VdafWzhrwshE5dPQ8C
         +4yxZIvdp8Oe2c0102RHFSvX4B5PWsfRiZUlFm7p9s4BYVinmLgvPMBIkGwiF4SNu0Ym
         QrhmkxcJ7Qxs5zRhyT06bke+6hNb3CPfQzRwjFZkrk+4UFWAh/oWF+z3frsGyExwVsRV
         ehxDirABpIf9x9khokhHDKBVDpVQKRGCKbXRv9q5qgiIcMgny7ma0AOBqgfXXUHBZWuQ
         gYoA==
X-Gm-Message-State: AOAM531ZH+5Ej7FsV9rjgEaJYTZY0XxydIpwx/JhcNm+Ul1reK48mgBZ
	OFGln3YCbSyj2ZtikRGa5X8=
X-Google-Smtp-Source: 
 ABdhPJwlxGywdVwNqEyTIp30qClRZxeu9ZHKY85pvjNcnu+ukrC9GolR/1VUmKosfmcQ9oz0BapQMQ==
X-Received: by 2002:a05:600c:4f90:b0:350:d962:8944 with SMTP id
 n16-20020a05600c4f9000b00350d9628944mr6369322wmq.48.1645178819844;
        Fri, 18 Feb 2022 02:06:59 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:59 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 41/46][dunfell] grub: add a fix for NULL pointer dereference
Date: Fri, 18 Feb 2022 11:05:49 +0100
Message-Id: <20220218100554.1315511-42-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:07:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161929

This patch adds a fix for a NULL pointer dereference in grub's
util/grub-install. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...nstall-Fix-NULL-pointer-dereferences.patch | 41 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0041-util-grub-install-Fix-NULL-pointer-dereferences.patch

diff --git a/meta/recipes-bsp/grub/files/0041-util-grub-install-Fix-NULL-pointer-dereferences.patch b/meta/recipes-bsp/grub/files/0041-util-grub-install-Fix-NULL-pointer-dereferences.patch
new file mode 100644
index 0000000000..ea563a41a0
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0041-util-grub-install-Fix-NULL-pointer-dereferences.patch
@@ -0,0 +1,41 @@
+From 5d2dd0052474a882a22e47cc8c3ed87a01819f6b Mon Sep 17 00:00:00 2001
+From: Daniel Kiper <daniel.kiper@oracle.com>
+Date: Thu, 25 Feb 2021 18:35:01 +0100
+Subject: [PATCH] util/grub-install: Fix NULL pointer dereferences
+
+Two grub_device_open() calls does not have associated NULL checks
+for returned values. Fix that and appease the Coverity.
+
+Fixes: CID 314583
+
+Signed-off-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=8b3a95655b4391122e7b0315d8cc6f876caf8183]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ util/grub-install.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/util/grub-install.c b/util/grub-install.c
+index a82725f..367350f 100644
+--- a/util/grub-install.c
++++ b/util/grub-install.c
+@@ -1775,6 +1775,8 @@ main (int argc, char *argv[])
+ 	  fill_core_services (core_services);
+ 
+ 	  ins_dev = grub_device_open (install_drive);
++	  if (ins_dev == NULL)
++	    grub_util_error ("%s", grub_errmsg);
+ 
+ 	  bless (ins_dev, core_services, 0);
+ 
+@@ -1875,6 +1877,8 @@ main (int argc, char *argv[])
+ 	  fill_core_services(core_services);
+ 
+ 	  ins_dev = grub_device_open (install_drive);
++	  if (ins_dev == NULL)
++	    grub_util_error ("%s", grub_errmsg);
+ 
+ 	  bless (ins_dev, boot_efi, 1);
+ 	  if (!removable && update_nvram)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index fad7415e0d..7ca0b469e9 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -87,6 +87,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0038-loader-xnu-Fix-memory-leak.patch \
            file://0039-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch \
            file://0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch \
+           file://0041-util-grub-install-Fix-NULL-pointer-dereferences.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


