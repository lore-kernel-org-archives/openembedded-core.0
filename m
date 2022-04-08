Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0B8C43217
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.1118.1649445927583765509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=kJX+c8+1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id e10so4012990qka.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6egCTBH+jS9Y2oibg9ycOOWcNaygz+fMAeU2zMR9at0=;
        b=kJX+c8+1JT8GB2w1AdEflzMLfYybImDvRA7vCMdKdKxUyxIMSv9PqiTFmvvs3n35Vb
         R43ahNrDEHgM1GYc5kmTOkBE58dnVCstwk8Sb9gPsGG5HB3KtcNBQP6YqzsBN2uumy9U
         q8wHDMvBbyiiXA2SBlChkEO7eQNSqIdNEANYxOyorl0V8hvLu/GOii82UNeq5mW6/tjR
         /5QuomwsskbzoCR3iZvRPDN2qiTOSDVJycGhHHPmjdI4AEedZvzqtAqccz7R7Od+GATA
         DfQpqYVgqxgEmc8TbkZqdvjNKDw9m3AivRapSvnDCnWVMZSPIeuwJyuyrdBr6no1AUJ9
         dQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6egCTBH+jS9Y2oibg9ycOOWcNaygz+fMAeU2zMR9at0=;
        b=UiWN90pqBPhRYD5JYRYQPmWw6cjUfFoDpCLXlEzSN0KlwKHu4zX7UKEx1Y1PbS3YQH
         rkzBLZv3It01N2ELh5aRb0UcrdIZAcDa7U90FD5T/7mN4pYKD0Xh6vY4x/j37n/Wzdnh
         D7hxTtWC21XQN5QqnTrjlan1paZcvId5cHAszUFZTkldq8UdSg2VgCg0XCyNmWJChe1u
         q2R35huXHy2EVezAdOeACU5RujcdVW9whQ4O1zIh/q8jhbgaJW5octcEXsU9hee1amdB
         +4z97sXwXhASpkgeZ4EYfiirRdnOsQabDWiH9g+31tBHI8bB+tMkdWZSV4KK58kB4y0p
         fbjg==
X-Gm-Message-State: AOAM531LgHCd0uPIZ9JFEGIQ0Dc5ls3k0/tN8wg6g2u/bDD2z+mm3J3h
	4Fe+SGqQ4bNG15MVwyw87Z26sUwpdjKPYw==
X-Google-Smtp-Source: 
 ABdhPJzjOCJQjc7kJdqnHTOll4/dRZKi8vfCOP0VyLB7gA4Uac0bg2Uszw5f8lc4RYR48urNjzYWrg==
X-Received: by 2002:a37:b906:0:b0:67e:4497:c3cc with SMTP id
 j6-20020a37b906000000b0067e4497c3ccmr14153878qkf.260.1649445926510;
        Fri, 08 Apr 2022 12:25:26 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a025400b002e1dd71e797sm18630227qtx.15.2022.04.08.12.25.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 12:25:26 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 6/6] poky-tiny: enable qemuarmv5/qemuarm64 and cleanups
Date: Fri,  8 Apr 2022 15:25:21 -0400
Message-Id: <20220408192521.1608764-7-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408192521.1608764-1-jdmason@kudzu.us>
References: <20220408192521.1608764-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164168

Add support for qemuarmv5 and qemuarm64, and remove qemuarm specific
entries, as it should be generic now.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index d8ce5dc518d5..43a5ad728a5d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -1,5 +1,4 @@
 KBRANCH ?= "v5.15/standard/tiny/base"
-KBRANCH:qemuarm  ?= "v5.15/standard/tiny/arm-versatile-926ejs"
 
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
@@ -15,7 +14,6 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "cc9e92e826af229b841fcaf8c645e638a86eba43"
 SRCREV_machine ?= "c3d54a67cbf3fb8e6df2d88c80e9d2c74f69aba4"
 SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
 
@@ -24,7 +22,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5"
 
 # Functionality flags
 KERNEL_FEATURES = ""
-- 
2.30.2


