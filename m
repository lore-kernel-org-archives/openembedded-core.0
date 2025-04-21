Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F79C369C2
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 02:45:44 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.8140.1745203537461268423
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 19:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aJIs7S0u;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c559b3eb0bso192042585a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 19:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745203536; x=1745808336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwpjeHeiY3BQIgpgJmEoSXH791qVO4FkI3cMycK6wbQ=;
        b=aJIs7S0ummnOJYsvoe9jvTw+gyhr2l6cfFeuKJNUbczAeFgYg3I0ENtztMe4zqnoB9
         nnhnToExTFsJs9V+bm85SYwi480mMjFMuBSBaKBAZObuDFfR8cnn/RitOkg5GRO58xvI
         19/27tTZ1NKoGI6iuqOTjFLGwe2h7ECk9O1/XIm9cnVr7vBUwgHtBiG9pDlTc8ma7tm8
         jKLA5dMjQpP0+iUkjoLECfi2RAYvG47ey2P5uZU/uIr+n3MYESdyhM+Why9AtykiqMX6
         MPlT8cDOIw4Ri8VCcwMi7MdXt4Fq+5Jk/CaXtCXJ19Z/MPRdgWY45BcHZkvLB+3r9vGG
         Y1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745203536; x=1745808336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwpjeHeiY3BQIgpgJmEoSXH791qVO4FkI3cMycK6wbQ=;
        b=ZvUwCsDps4nh5Uu2shYxEderj3CVWfHibglp889Z8DQrZWLaSTaM8W51IxowDAlrfD
         KrMjYdtSUiEnpHPlqw5+6+sWeqzSPyB0SiTadP3Kz+KdgL5TeVHVWSYY6Tv9WSnVoxR3
         Q6cyneovgTxgf7NqgXPUAmNf9BxXt7OzHUqlx4x85401mqFTZs/f6gG2lytY/w4S19Ex
         xniincD+RWQfmKxvfrH8Jxgvybi+HsHPzQukKfu20VxAC1R6c+9PXpH1VUm2kW+ssm1v
         0hehGapQbgjKEMNJKNmtWMg3+RgNgysHovZtrhM83W6AKUgDhpM4YZ9eyHECeL7nhkmC
         sNkA==
X-Gm-Message-State: AOJu0YyvOMklw0iH2wz+zx8ICnT/0lICJXtLpwGtNNh+xE9wE3fUo5Z3
	bkg3Vk6k9ax1FNJsfZ0n3/KlmzB6jeLtWI1b9N1KTNVowxe9f4I4
X-Gm-Gg: ASbGncvBy06PMeG9NjbGdjxN3XGcVxMuYBngBwIjDbgOU8AV6dLvj84PUtjea0PNeOR
	Xe/OPa3x3OPgRiwPnZUjDS7Y3ggUvRoZZOS02EeYSH4BHSCBbyF7DhbL1qSrnEqjc/nG4asSVld
	thebEBB8uL+5pSxVP8WWPqq3XLrjFqoUkPcS9BXIlE+0gDAo2rf3JWBNCDA2SBF5KZidZEtf8Br
	7X/+l24mK7Aakp28uOsbX2UZNCpeHd2B2HbNwQmwUIJaGVjgQMBpcFB1uL7mCLXPAw0+b5XyYyb
	Q/123zz6L7swd7L/VEmSV2lKEw9wlNzNllVIPMaXWrVq9/AwcoYGgUbguNtH64iL+UCWkDqw7+M
	9ZrUbhFV/vHlM1nkDKG6jo3x0ygQYcYY/oomZoGmN63+vs+Jvz2kD
X-Google-Smtp-Source: AGHT+IHJYY4yySZ3aRm1B8Zp2yrsrRA5B0ZxO5mjQL1TFSw6uYKq6luaQ7QmrlR8aNPq3heSv8CHDQ==
X-Received: by 2002:a05:620a:468c:b0:7c5:4738:8a11 with SMTP id af79cd13be357-7c927f9cb30mr1812422185a.27.1745203536250;
        Sun, 20 Apr 2025 19:45:36 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6e7casm370430685a.10.2025.04.20.19.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:45:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.12: cfg: fix iommu configuration for -tiny kernel
Date: Sun, 20 Apr 2025 22:45:32 -0400
Message-Id: <20250421024533.3660576-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 02:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215166

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: iommu: add config dependencies
    Date: Sun, 20 Apr 2025 22:28:21 -0400

    commit [cfg/intel.scc: Include iommu.scc for Arrowlake boot support]
    moves the iommu configuration to a location that is included by more
    BSPs and kernel types.

    One of those kernel types is the -tiny kernel, which uses a allnoconfig
    base. Due to the allnoconfig, there are missing dependencies to allow
    the desired options to be enabled in the final .config

    Those missing options throw configuration audit warnings

    By adding the required dependencies to the fragment, it is now
    standalone and can be included from anywhere without configuration
    audit warnings being triggered.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

Apply this after the existing iommu configuration update and
-tiny should no build without audit warnings.

Bruce


 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 774e828fec..44346445c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "8569a61bf30561b620c3171431906cd8ddb7d095"
-SRCREV_meta ?= "6d55bad30f3e379bf2ad98d971d1ada4f48e2eff"
+SRCREV_meta ?= "d36334a8b9597faf3978548085097c3b54d462d1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 50b1787db2..d9c62737a4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
-SRCREV_meta ?= "6d55bad30f3e379bf2ad98d971d1ada4f48e2eff"
+SRCREV_meta ?= "d36334a8b9597faf3978548085097c3b54d462d1"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 5472a8d79f..e45a8a61d4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
 SRCREV_machine:qemux86-64 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
 SRCREV_machine:qemumips64 ?= "8a34918e22d2fc3b37282d1929e760747762b74e"
 SRCREV_machine ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
-SRCREV_meta ?= "6d55bad30f3e379bf2ad98d971d1ada4f48e2eff"
+SRCREV_meta ?= "d36334a8b9597faf3978548085097c3b54d462d1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


