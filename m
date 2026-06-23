Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680E1CDB466
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 01:28:15 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11643.1782178088776723650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 18:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MK6rHxhi;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9159f631656so67944485a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 18:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782178088; x=1782782888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5oPlCjdMqn/9Gtoju1iM9htHc0YGcZTv+cIQRWwLkCc=;
        b=MK6rHxhiKOrb4G1ObzmrKBtjSp7jKuA25+9knRd1VpcmK78DzyylP0JpY7F1Brfa2L
         Q+LzrjOCD6twK5L8KPQo7lguSPrvk9kLBskzWUkrxfN4SnhiXx1fIKQus+1h2OqU7EjI
         NjOiIvUHUXNrzMGKPsLTp6HKsth9JswDEfJ3XIhvsyIFMrD/NQ+AvDmU99hIASthcaGM
         d6GNcjAwzqF7YUCRkGSO9R13IMsan53bt/EV69XJuMmEX4KY+Fpf5H1kmE145ENRXVpN
         pbBNilDK9mnvwOFXErEkUtcdEGVqGRYFT9TfnBSqKUIPzd9HF1ys2V52YyjblTvTKqVH
         fdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782178088; x=1782782888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oPlCjdMqn/9Gtoju1iM9htHc0YGcZTv+cIQRWwLkCc=;
        b=jDogUGP8pGXyqPnw3DwAqg2H0W1+pNnTSd8mtAztbo4yHmDQ6iLnu5VGo5SDTWvXkJ
         D/AIPVmFbb6EbYF0COHry+r36CEwuzIlRnylpio5Mc8Cvglbuu+siSlbHn0hp9jh1Kau
         +a/Bs4O7PXWWrQEaNHTg/6uLjK+0FLzaaFaOuu99E9lF1yMHwXlIzkyDtHUk2KKDlU7t
         wC8uLHHflI1N/cegy7jO7LDh5hC3rDSLQqzEMCgf2WAXs/ttgnR3ldAGhphx4pyTilbl
         sM2GxSnXpDkFptUJ5siuyWb7PJjDMPb4TtZhoUceeQbb6TqB0kWEmwmAvbcQeyxGUSVm
         VENQ==
X-Gm-Message-State: AOJu0YxPOqMbvzWgQVZtKx+Zy+6sypfrdUN0Tv3xxTBX6vfFBUtq4GWg
	yQ2ORT94H7HDhh+cz8mMcbZKi4oAb1d1DylekuF566LZIpqgM3FHSYce
X-Gm-Gg: AfdE7cmcHCLB/ZrtC0fUU4kCdvzx9BMlVOXF9E3SjYijbAgKx3dH2EZGN6d33N92R2q
	j1dcLVrjxm7bOA/UMMgdiPvKsI03vK+2f9sLK36gUouFMlNT1k90Y8U0vmzYgUzDF6CHM0RAd5k
	/caIjmUIu9eKMSt1ul8bym4AjchhbVaFw2u3S5i9z4GzkLOUirka9puef5AZVFp9laabnjpB7Ll
	vkqTio9tD3gfgLVuqFUeGU3JfO2MvifADo09IBmwDXWBzK/J6V4v3OUE44XYPOQDtWF6Q9DPnph
	+T8v2w3m9iDuMPK2yUiw0UPfgFVWIXZBqaNTBF0PqT9urLitOG/wA5Bz4/raY8t3BOAStIdOBXs
	1mc2G+YJrQabEmOky1tiQZ2bVqpp4mca507v9PV51DiVBP56TguunlpVGkimdvkLtTXNSqnYnSQ
	PIFxgt1AkihZTwiuDYU9ZlTz/FJxTiFTFbNw7Sy0p4/HUc96leJXOEPkKMKrGLRc3q64uoRWOsa
	nB4/NOLkcGGZ2c4f7wdjF4u11OGHwHrFwhBYS6ZM4vxpFGmtdg+CgI7pv4ek2ndOE8poGmfI90p
	ZfN0Lm+85pwEDsI7rtJV/K3ydWndr3/lnw==
X-Received: by 2002:a05:620a:4693:b0:915:6433:24ee with SMTP id af79cd13be357-926004ab490mr327292185a.8.1782178087479;
        Mon, 22 Jun 2026 18:28:07 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-925fd391075sm133228385a.4.2026.06.22.18.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 18:28:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 01/01] kern-tools: bump SRCREV for conditional 'depends on X if Y' support
Date: Mon, 22 Jun 2026 21:28:04 -0400
Message-ID: <20260623012805.1526221-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 01:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239324

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Pull in the yocto-kernel-tools fix for the kernel's conditional Kconfig
dependency syntax (kernel commit 76df6815dab7, first in v7.0). Without it,
do_kernel_configcheck fails on v7.0+ trees once a config uses the syntax
(drivers/hv MSHV_ROOT):

    drivers/hv/Kconfig:77: error: couldn't parse
    'depends on HYPERV_VMBUS if HYPERV_VMBUS': extra tokens at end of line

This SRCREV also carries the symbol_why.py/kconf_check audit hardening
(surface parse failures instead of swallowing them) and the new hermetic
Kconfiglib self-test.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index bd90316050..2e13e4ca31 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS += "git-replacement-native"
 
-SRCREV = "a4a362d9f4f0abc8ab145a8673166b9bd875731a"
+SRCREV = "96a8d58bcd260f104c193a81b727818424d7b263"
 PV = "0.3+git"
 
 inherit native
-- 
2.43.0


