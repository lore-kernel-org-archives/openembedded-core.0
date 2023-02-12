Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738A5C636D7
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:13 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.21040.1676236269127637805
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FPggSeUi;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id bx22so10136597pjb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgAfpkQNqOJLtH47c74CM9wyFZJo+Fo3fzgcj/IUiww=;
        b=FPggSeUis03qgYnRf96mz8dQdzpW3BAvXAKBLIxa1ARDjWqL4OT87moCS++kPtDNVJ
         3q0rIfDRCcZcG1eLcdsSMslm1GL9uriPhKd9gbfxuTN13W9F+xOuwfyfgrHQdLJracpR
         BTb/RXIC4vU4SZ9NsHWMKjfR0ymkwUJLqrd8uzGV2+v65dM+EYZ6O7+xOl/h51A93btC
         +TYqTxpgF0TTWGUUq+OW/3s/3wIvQravHqxaMFKkRElhWmvzxfmJaMxW/biB9x6WrSGo
         09KwrywsXqSdIiVtxyZO+UtXFMiATWLC1QuX4vYsVgd9Va/Lo4u3unbPj7YDwCcgf2oO
         enPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgAfpkQNqOJLtH47c74CM9wyFZJo+Fo3fzgcj/IUiww=;
        b=sp2khTYPPwsHJcyFHKS0mKKd6wars5Z5zBeMPoiHAz88I/ucj01D2PrlBo3E1Lponl
         F+GtPu3NbEt9pU553wc8kBoIYyqVQpgeCRuXp+m+uPOlPP1fjUVwWBn8fQCsrx4h/+mA
         GUaM80USjvZdxl9EaBBMywP/jTuAaDgKHl0/d88S4lPUbL/nymH6mqdUr6kNBRiTFnzs
         B+UmRukjGYkAB7knoWmtHpV1fBr7mpHN8r0dqwIlKFRmdv1ff/O94w6tOxlIILpawxuA
         UcbI5Ax5+P7HBdZjHCNvEvkjC4BDhH8uiVJu+mVWnvpoMu2qwxRIWqVoAHBOT6jSyGSr
         +2sw==
X-Gm-Message-State: AO0yUKXyKdnBE4Wq0rcW48h7ikSkFU+WY11qIH7OW5alNR4ERYMpCNPc
	xB4IeL7pv/aEN/7qH4tZoRqAVg1lyFzsQwf4nQo=
X-Google-Smtp-Source: AK7set88MmaBgFNJUskyDm9MzksI7dLwHRIOk3/MlZDYE2bW6FYArMx41aaetQ6yy+KHCr6tFY4ZXw==
X-Received: by 2002:a17:902:d2d1:b0:19a:6ca0:d06 with SMTP id n17-20020a170902d2d100b0019a6ca00d06mr12457789plc.37.1676236268250;
        Sun, 12 Feb 2023 13:11:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/27] kernel/linux-kernel-base: Fix kernel build artefact determinism issues
Date: Sun, 12 Feb 2023 11:10:25 -1000
Message-Id: <4c302827365903b99a517651c2a14661ce78f79b.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177053

From: Richard Purdie <richard.purdie@linuxfoundation.org>

With the 6.1 kernel we've seen reproducibility/determinism issues where the kernel
seems to rebuild headers referencing the hostname or local user. kernel-devsrc
building after the kernel seemed to trigger it in some cases.

Moving the definitions to the bbclass used by all the kernel recipe code including
kernel-devsrc seems to be the best way to ensure this doesn't happen.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 60681baa97daf4f3856453c34d6be08b6771a81b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass            | 3 ---
 meta/classes/linux-kernel-base.bbclass | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 54b006550d..df740af41d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -204,9 +204,6 @@ PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
 
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
-export KBUILD_BUILD_VERSION = "1"
-export KBUILD_BUILD_USER ?= "oe-user"
-export KBUILD_BUILD_HOST ?= "oe-host"
 
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linux-kernel-base.bbclass
index ba59222c24..73a6fe36d9 100644
--- a/meta/classes/linux-kernel-base.bbclass
+++ b/meta/classes/linux-kernel-base.bbclass
@@ -37,5 +37,9 @@ def linux_module_packages(s, d):
     suffix = ""
     return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
 
+export KBUILD_BUILD_VERSION = "1"
+export KBUILD_BUILD_USER ?= "oe-user"
+export KBUILD_BUILD_HOST ?= "oe-host"
+
 # that's all
 
-- 
2.34.1


