Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97FCC4450A
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 21:04:32 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31380.1782853472293294540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 14:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nbZJihat;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e6b5737bb2so5145627a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853471; x=1783458271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaARuynv5fIS2QfYYP0UxSlKrAAUXgQMwDNCMwdX6fU=;
        b=nbZJihat9RmvGUw9G4jDtJJ5RynYXz6GiDOhGpX4O3nabueKqwtrGdogefwAC4lK4A
         hs3fB/nhs7f+Q6o5xWPhpRjRkhbfVx7DsbHQ+18I3xdp2JIDpgrW4JC4uZ1LQVkAkeoJ
         xN3r3lIuLoE2SoqLhR1+4doqxTuwMv27WUdSguSyg4/O/1vUnP6RnMJh/ExTAU/76e7r
         +PxG8FKLRcmQp0vjOyk9zc1g6niXcaVB+0tyKWtkdXRF2hNT0N+gJSWvd0OH68j39Dxx
         T5yi83SzlmzeHnGSdSlwizT0XT5H4ayXwA2sEjSDmi7PsHDsrVGX4Go/YzCMoD9hl6gg
         BoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853471; x=1783458271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BaARuynv5fIS2QfYYP0UxSlKrAAUXgQMwDNCMwdX6fU=;
        b=fr9n2DXnZFGXEUv+SedeDjedZrPUZjJb954ZKC/+R/FxsDDL1oXu53y3LcJI8z5fB4
         m+jwKZfipaWIyILiHzWUAdrxf0P6JR8OVbjUKC6i3D8JuM99XLwwCCNcTdok4if2l3Ab
         I73rl2bhGANCiX5Ue2UJCeOIx8tS8N9PS9C8uJzz4dmiK/2JJDsuLb20xOQtjVmEpZQe
         cSS6ysn23vmbt1WVNyy0VPthZ1DAT47sAKWxXhGzdQ0+9aHnzyL/wnQ9xRoTuOp+UyDH
         glCUW7EQcgodNEmcE+vk2pKxyg3JYi+ceSvbZKC9W9jrEq1QlIMRacYPmAyHn4mxFYI4
         EaBg==
X-Gm-Message-State: AOJu0Ywddcuda3t0PKj1kiQWITOqBSyVMSU7dW0qpKc13LrkeLvZPlOU
	ibr6hy7dwPQYpO7f6x37xI4PFN3dkoPL8sytYUlaFl1/V+6MpgIOhMTrGVwz9Q==
X-Gm-Gg: AfdE7ckkFh/O2r+8iDIAdWPAVC94w/MSd7JDheUlQNf0xvB1dscaKpfKcZK01bgbH2Z
	XqYWtzXQDMjU3R93yEL0ZXNr7Gvk0ZbsG4Api4W71RRJpKsF7z/PlICnCSe6W6abMS4Gtnlkr9D
	099Hb6JlqemEDN/mIU8XiFkdTcel7qfVy8az2Dxx2ou5slZXz6X5iv0E7zdrlf5Zl+eMlq7uAu9
	AP3Fmuau8Fd6za5pqLTz3r9Eu+qVzhLrhE9+QyqHbIDNzqHTOCi4W3Jez3bmi/9Alj1UipJCdIP
	bP0AeMpnlTg/ZozcGCX3N1EVTQE8tWGEcfo5xs5b4cgAPO+Xe3kHqNCvEf29NFixR2AZ4EeaMRr
	jxUgDbDlnolE8JycvipFX9lhnTJn7Y0N1qwK+p/2VxI51PGePwmnoDds6rGTfcGbAgBlfC+U/Tk
	o9WAmxE0ToJQ==
X-Received: by 2002:a05:6830:6af7:b0:7e9:d3aa:e391 with SMTP id 46e09a7af769-7e9ec5cbbdfmr4056014a34.6.1782853471456;
        Tue, 30 Jun 2026 14:04:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::3cfc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebfd01cdsm3248143a34.8.2026.06.30.14.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:04:31 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 10/10] wic-tools: Change to MACHINE_ARCH
Date: Tue, 30 Jun 2026 15:01:44 -0600
Message-ID: <20260630210422.1903245-11-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630210422.1903245-1-JPEWhacker@gmail.com>
References: <20260624141706.2164567-1-JPEWhacker@gmail.com>
 <20260630210422.1903245-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 21:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239925

Changes wic-tools to be MACHINE_ARCH. This isn't exactly an ideal, but
wic-tools is attempting to provide a target sysroot that (potentially)
contains the EFI binaries for wic (and, this is the only way wic is
willing to find those binaries). Since the EFI binaries are
MACHINE_ARCH, wic-tools must also be MACHINE_ARCH otherwise it causes
problems.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/meta/wic-tools.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 45fb873dd6..823dbe6db6 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -17,6 +17,8 @@ DEPENDS:append:aarch64 = " grub-efi systemd-boot"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit nopackages
 
 # The sysroot of wic-tools is needed for wic, but if rm_work is enabled, it will
-- 
2.54.0


