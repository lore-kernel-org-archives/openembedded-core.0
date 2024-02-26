Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB14BC5478C
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 22:35:06 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.7235.1708986906562659075
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 14:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tpi5rRbW;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-42e4f706847so18949351cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708986905; x=1709591705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fR/BFnrqZ4FoSnQ7PPz/R+ChXdpkYgpoN2SyqhdZa9o=;
        b=Tpi5rRbWBdnpVYNrSn0q613D+L11NoI02fRFBPKFSVGKhA9Pm5D7pwoVpJZbUN7oZX
         dqvn0w45KsAPOIZRMJruv+I4GzFS6UnSr2cmT3tMKiGGAuOE6cQ9i1eKmw6erS0tUlUk
         ZlC5lpmNQvzeihmYeBM63RUF3Zy+IhifxDOCa6a3yWGs+D/op1x69QARUkzN2AMe7UoM
         zPVuB4hSaqcoDFyZRZGbzP1aPIQsOebElKEqETTmY3nVZorY4l1dt5Rl45uWxtTQ2KtC
         9Y4SnF+LrOja+ZnfFwmw1wb25odI4Umk7Imnt96Ik8xRpjCvGpLBCR4UPpjiKanM/G1w
         itgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708986905; x=1709591705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fR/BFnrqZ4FoSnQ7PPz/R+ChXdpkYgpoN2SyqhdZa9o=;
        b=ALxtjqMt953k58mB9KtTiYKA+dwYBHVrVZAvuPl/sZNA8tdRCla2IcdaMuoQHqsQJQ
         pFIsDsggZs4LB3OVilTD9vO+6uVffxNvF545xHyaGALWabz0fx2quVtQ4TLPQn/YTNxv
         x13lUTlc73c18FAbNlo0LIHtFJSU4jLgekEYBilpSW9dIifnYeEt+UeHVDT3HUekOXSJ
         OSWOoMU5qrlMYPkarcdiWKi/ushd1+mMXIVj6i3RNr1GyHGhRxHoNLfjjIFQRaQdIma6
         yw3xPD3p28sX122YnXEG3EjW10gk+G7krLdoct8B0cr89ft/whG1HUuQkq1VxKiddkeF
         hBIQ==
X-Gm-Message-State: AOJu0YyET5GKR0stHutrNQ3i8HhVh4SbnTN0oZHFAAxmuLQm7Pztyg6V
	vdVe5kCAwaIkYFZ7vj+kNVcnYTjBTuhvK6fLt8dPx/0mpUdPI05lw90FaT6m
X-Google-Smtp-Source: AGHT+IFYDicfEP0NlSOz/QV9cnRy389RHBC/vTlfSt6kMbId91VG80hx79Y4X3PCferQqFObaKtKDQ==
X-Received: by 2002:a05:6214:cae:b0:68f:8ddd:aad3 with SMTP id s14-20020a0562140cae00b0068f8dddaad3mr609620qvs.20.1708986905562;
        Mon, 26 Feb 2024 14:35:05 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id qj24-20020a056214321800b0068f9fd1d688sm3422091qvb.21.2024.02.26.14.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 14:35:04 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/6.6: genericarm64 configuration/definition
Date: Mon, 26 Feb 2024 17:34:51 -0500
Message-Id: <3bf7215ebbf5e8a7167322dc9944ce564a15d7a5.1708986570.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708986570.git.bruce.ashfield@gmail.com>
References: <cover.1708986570.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 22:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196228

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/3 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: features/numa: remove CONFIG_NEED_MULTIPLE_NODES
    Date: Mon, 26 Feb 2024 12:10:12 +0000

    This was removed in kernel a9ee6cf (5.14 onwards).

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/3 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: features/cgroups: remove trailing whitespace
    Date: Mon, 26 Feb 2024 12:10:13 +0000

    Otherwise the audit will notice that "y " was requested but "y" was set.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/3 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp: Add initial genericarm64 BSP
    Date: Mon, 26 Feb 2024 12:10:14 +0000

    Add the skeleton of an initial genericarm64 kernel.

    At present this has only been boot tested on a BeaglePlay and is missing
    some functionality, but it does boot via EFI from SD card successfully.

    Future work will organise the configuration fragments more neatly,
    move more options to modules, increase functionality, and add support
    for more boards.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 3b85917506..21f47cb7c0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "f0a5daf40acf2b457445f9b4f97f9eb2a3d1508a"
-SRCREV_meta ?= "1a7881cb61f28deae2a90a93648a76fd4e1b0cc2"
+SRCREV_meta ?= "9141b18f231628a8605b899e836ba4abc7c43f09"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index a2234c4f57..ef81caaa9d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_meta ?= "1a7881cb61f28deae2a90a93648a76fd4e1b0cc2"
+SRCREV_meta ?= "9141b18f231628a8605b899e836ba4abc7c43f09"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 141e1e4529..c89f99787c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
 SRCREV_machine:qemux86-64 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
 SRCREV_machine:qemumips64 ?= "7c478488b642339d97ac55fd8b1acfd086e95c5c"
 SRCREV_machine ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_meta ?= "1a7881cb61f28deae2a90a93648a76fd4e1b0cc2"
+SRCREV_meta ?= "9141b18f231628a8605b899e836ba4abc7c43f09"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


