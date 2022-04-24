Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F10EC38161
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.14469.1650775777738774417
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Apr 2022 21:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o4PJrFMe;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id s17so19842483plg.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Apr 2022 21:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PyfKQ5yNB4dlH2heRFTk5PUSIecj8SWN+oDOTW1aMeY=;
        b=o4PJrFMeV1Z2vzbaLr+ZTEtcO9Y8x4FsUMtWrTCFrQc6/AhGA5dBjCtF5tzAH6N+Wb
         0Iw5ksY5x16kxlWNRy+Mg07aK/xnv9BKODxCveI/rInaRNeFHaJ2+SFQuAM4CGVXSF5a
         frGZTGUSMyzN7/7+KdYS3Z8FW4vSi5EL56PYxwGm8UJ9LabAaIMoNPjjXwuReT7JHTLl
         Q+WzeabzO98dhuUKKCVepHUEJcfSe1WG/sv1lJvKPj7GNhxAEWp+Qb3wx++p6vzUCt0A
         wYTklV2iV8HUecdDnQUa0UxsvzAYmSlmcZYR/Lb1Eg+oFi6A0Pr+PyiYPHYAMNfAdaOp
         3guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PyfKQ5yNB4dlH2heRFTk5PUSIecj8SWN+oDOTW1aMeY=;
        b=qV1QfgOdcFyO34IH6fBs11AV5bx9fthcR4HdOL8D0fXOcsbRAV2uJAXOCGpCG9etsu
         RONe4eepYP4gFpEUyN07bUMg7GJTeXPOw3Ioa5S58OKpnn+OVIUfy284ChKIdGxwPCgi
         9AN+QsbAxw0m4TgBYHZG9B2iWz8r6GlUl0YJMATAUpYU4ifw513RTDCu6cYyBDyocvbB
         3A2qFz2KClhBKQ2f4+RZjqJEV1XQ3E71uwBjBONFUwMuWX0+GgIqtMN6lwn1AxXprp80
         Oewl/zk/z1pDq84kGt0qQxTwrH4feqAC8hN9hCzc0Smt9aARwcvIfslZVNQmlt1KlK/i
         C9AA==
X-Gm-Message-State: AOAM532mFFpvOjFU6dHsac9/w6L+H1LN0Bpo6UpMeplahXXLFoHYTKAU
	jLuxV16bAYmHPpaFp2st4w1kBc1JEmz+zQ==
X-Google-Smtp-Source: 
 ABdhPJz2vZ4BlmzOpsr3ggk4MOesgOOAp3sq+dFQYAzeYqq0bDG0lTfqIMywOUFrfGqGhHH0+24FMg==
X-Received: by 2002:a17:90b:1bc5:b0:1d2:699a:54e3 with SMTP id
 oa5-20020a17090b1bc500b001d2699a54e3mr24681085pjb.136.1650775777011;
        Sat, 23 Apr 2022 21:49:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm7502717pfu.120.2022.04.23.21.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 21:49:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu.bbclass: Extend ppc/ppc64 extra options
Date: Sat, 23 Apr 2022 21:49:33 -0700
Message-Id: <20220424044933.3553497-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164803

Some recipes are marked machine specific which need qemu usermode during
build eg. if they use meson build system, which means they wont get
right -cpu settings to run qemu-ppc/qemu-ppc64 and build fails, this
ensures that we set the right options when PACKAGE_ARCH is set to
MACHINE_ARCH on ppc/ppc64 qemu

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/qemu.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 01a7b86ae1a..7493ac34d4b 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -64,4 +64,8 @@ QEMU_EXTRAOPTIONS_ppc64e5500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc7400 = " -cpu 7400"
-QEMU_EXTRAOPTIONS:powerpc64le = " -cpu POWER8"
+QEMU_EXTRAOPTIONS_powerpc64le = " -cpu POWER9"
+# Some packages e.g. fwupd sets PACKAGE_ARCH = MACHINE_ARCH and uses meson which
+# needs right options to usermode qemu
+QEMU_EXTRAOPTIONS_qemuppc = " -cpu 7400"
+QEMU_EXTRAOPTIONS_qemuppc64 = " -cpu POWER9"
-- 
2.36.0


