Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BC1C46CD8
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:25:20 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.52373.1703168715144328051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 06:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CxTdAHzR;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-78117e97becso41316685a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 06:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703168714; x=1703773514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rQ7Nd1RonWBga4EC3/T67A2G33Kp5uUWr7ez2Nd77Y=;
        b=CxTdAHzRb4yxLOI+hfBpRBUAv9vwtbVkG9yRYKm6yVqtM5UEEsooNucAek5tFa5Uh1
         NuOeglFMnAifFAasq4hPOxTANLelEQ6ibWeNjuKqgCIShmOdkFkcMfNQeI9PVHRupG7y
         dy3AfrRguHZpoZdCSWI24af5h8MhqkvGye3xX+9ixEx5WjW1pmeLPP6/utmX21Htv4uc
         CNUmBR0i28he+78HzgVlW8Tpl5DkWmhN58lzbEdVajpYwtQKuhzvYSAey/DHJ4zF6Uwp
         PSzQdQmpY5eEgQj6EW8wg+NyVZvD2QZ4GDkMdpQ9NaT+ikUBwdCnePaINHvoCuLf+fys
         QrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703168714; x=1703773514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rQ7Nd1RonWBga4EC3/T67A2G33Kp5uUWr7ez2Nd77Y=;
        b=tqw/N/Q34kgoZshnA8RMeilqRVGPAGgQHzvO165R4SIIU7UZqmxWOgiHLPEq3UR7sB
         jDrpuJGARIaqIy+QE5pwth/bCuDqS6K2m8bCttd+RGWE5BZsifhCr+VZwDX0d369kW/U
         3v3N+U+gPJfvO9Nq1hUdj5WkOr+nMfouAaSvdLbKo1ws7+Z1O3WMchYraUj2VFEAZ5d/
         Z1ido/2qWRGu/QCTnFmbIcOonwh08ZXMs54JYwSs4cAobQS3PFAcBXddEVwFw3yeOaRN
         Try6daFUSS+Sohr7zWgDoSNkdTCrYFPL+TYj59mfML9eow0VWIf6jPGUMDJMzsXPzME2
         QTHw==
X-Gm-Message-State: AOJu0YzkzkOHW2kS6URCRCa3lYXOsJDYdnHAtOvhKHMxoU/lvosHj4YQ
	cczrVcVr8ZJKaELywdeNXn5id2xgM8D0rkAH
X-Google-Smtp-Source: AGHT+IFnXGg9Hyz0qqDTmcZOwJ9ABqDSmZC1fvyyJmtud2NIXs7G7h0C9I2tYpULUxNNic58BQzBVQ==
X-Received: by 2002:a05:620a:1114:b0:781:1b3f:ced1 with SMTP id o20-20020a05620a111400b007811b3fced1mr1684133qkk.98.1703168714021;
        Thu, 21 Dec 2023 06:25:14 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g4-20020a37e204000000b0077eff6eece8sm679490qki.62.2023.12.21.06.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 06:25:13 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/6.5: drop removed IMA option
Date: Thu, 21 Dec 2023 09:25:04 -0500
Message-Id: <c6b15714bfbaaa815dcc3b7e8e402fccb5635cf1.1703168370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1703168370.git.bruce.ashfield@gmail.com>
References: <cover.1703168370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 14:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192831

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
2.39.2


