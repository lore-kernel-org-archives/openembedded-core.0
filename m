Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221F0C47077
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:38 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.151004.1703864730385702879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1djBrqVV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d44200b976so19278105ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864729; x=1704469529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zb7vhbythagDLpgEOnJn5vR8QoTlXnCGHXZI7+r7bl8=;
        b=1djBrqVVTt7paNDprSxv5ws4b7+ZgCMJZE0KyFLcvDuzJGI9qKRGS1PbeyCFsBBza9
         ocXs28fklFU5w+4Rhr0ignT2uTfv4qw4K9ptW9RplYl7juImYJOmXgKWOVLCNzfFBPou
         nJTEUW13MrPULXsql1q0AkAU7c/E3VyJEu4yWAlnrDgYyCsZEc2C9Vb+y/vxCNXpTva+
         J8WzH0CSH4nxEr6p2nP/Oc2ISs8qUu/uZ2cYiDKG6fuqsyhnPNX5XYqPBn6hDOp3wE0/
         8H6Coy5/OLHrTRlp/kuc1wTawnSuonRWJDbXefuSIL6/fd04XsYYBGgerUnumeEJJh9W
         X8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864729; x=1704469529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zb7vhbythagDLpgEOnJn5vR8QoTlXnCGHXZI7+r7bl8=;
        b=UPgL1djs5qOJIG31EZ5tZ0csOgRjSphiw9bBgQsOyK/GuGM26s/t5L8CTPzQrSEWZr
         9K2rFH4MnpESpl6yaTJ4L0VjsMpgnyDIGRuJ0eyCLHY/jvc7uP7gs0JDjaFIDPZhxvpW
         NqwTYKNN6g9ykL6cOPtGmXVfxfzkFNzQAkVa83bEkmrokjQ8+Uz+Ms28BsA9YC8LiAak
         dsEe5z7C/CMnJskibpUOMzAHzIT6lsCs5vFRyShEm1+eC38giC1ohgWOvUewJlyUop8r
         aWwPAerCFpL/Q1NK4m99EceN+Wae57dXhJzgV5DUKXe46CMHDLWnDnVlW5qFTvOCmjYW
         +GbA==
X-Gm-Message-State: AOJu0Yxffgosk4p2fd07mkZzZSZJXDybxL3/J+w2cdSMxZv3qHHj3DSm
	d8I0ZSV1/uUlMYh/TCqrz5UhbinVHNpttHAg+JJ5X8H4MvWYZw==
X-Google-Smtp-Source: AGHT+IF02a66Ez6Ly4XjIXdhHx4WSpsproNmZFutWjir0MwrkE9VDtldq6c1aiQMc1jHaBsW1H9NmA==
X-Received: by 2002:a17:902:fc48:b0:1d4:6730:4373 with SMTP id me8-20020a170902fc4800b001d467304373mr5046602plb.96.1703864729086;
        Fri, 29 Dec 2023 07:45:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 13/41] linux-yocto/6.5: drop removed IMA option
Date: Fri, 29 Dec 2023 05:44:27 -1000
Message-Id: <0f8eaea3a46c9f6e3c99fb59e689e2a3843979d0.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193030

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Paul Gortmaker
    Email: paul.gortmaker@windriver.com
    Subject: features/ima: drop now retired IMA_TRUSTED_KEYRING option
    Date: Wed, 6 Dec 2023 09:15:38 -0500

    Unfortunately linux-stable backported this:

      Subject: ima: Remove deprecated IMA_TRUSTED_KEYRING Kconfig

      From: Nayna Jain <nayna@linux.ibm.com>

      [ Upstream commit 5087fd9e80e539d2163accd045b73da64de7de95 ]

      Time to remove "IMA_TRUSTED_KEYRING".

    ...to all releases still being maintained.

    stable-queue$git grep -l 5087fd9e80e539
    releases/5.10.195/ima-remove-deprecated-ima_trusted_keyring-kconfig.patch
    releases/5.15.132/ima-remove-deprecated-ima_trusted_keyring-kconfig.patch
    releases/5.4.257/ima-remove-deprecated-ima_trusted_keyring-kconfig.patch
    releases/6.1.53/ima-remove-deprecated-ima_trusted_keyring-kconfig.patch
    releases/6.4.16/ima-remove-deprecated-ima_trusted_keyring-kconfig.patch
    releases/6.5.3/ima-remove-deprecated-ima_trusted_keyring-kconfig.patch

    So now when someone uses the feature, it triggers a do_kernel_configcheck
    warning when the audit runs.

    We added this file way back in 2019 so this fix will be needed on all
    active branches that are using an LTS linux-stable kernel listed above.

    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d575b2822c1779077177deb177bafa94ab975bfc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.5.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index 62020312f8..fccf0252d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "1d89cd73350cad73ecf330ad3785e6d8bdec092d"
-SRCREV_meta ?= "867a6bdef9701f378f5a9ce66a713daa22598649"
+SRCREV_meta ?= "3b1f87ec237ec3ad9acffb3d75c55efe958085dc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index f57bc47b37..b63d5ad893 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "95753fe2a7d507646224fe973e2a4fc48cb7694d"
-SRCREV_meta ?= "867a6bdef9701f378f5a9ce66a713daa22598649"
+SRCREV_meta ?= "3b1f87ec237ec3ad9acffb3d75c55efe958085dc"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 1233140f8e..984940d24c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
 SRCREV_machine:qemux86-64 ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
 SRCREV_machine:qemumips64 ?= "ff5efc72e961cf345f935ac14cdcaa9843ec5b23"
 SRCREV_machine ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
-SRCREV_meta ?= "867a6bdef9701f378f5a9ce66a713daa22598649"
+SRCREV_meta ?= "3b1f87ec237ec3ad9acffb3d75c55efe958085dc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


