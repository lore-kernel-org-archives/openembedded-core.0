Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027541125838
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 14:13:26 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22566.1773238404100157930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 07:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JQPD05XB;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: aehs29@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35984cd0335so432423a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 07:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773238403; x=1773843203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dY0TWOwK3weNKAIgmhv17nJM9mBZ8OEBfowAZR9oUFY=;
        b=JQPD05XBR3qTAxqMBV9lCy7cjrfwicabziEtypscdEcur2Ypbp60ixvQGfoiFH9YFE
         BbcCDbtsbaC/iIT9sbCtYZrAKbXi12ZZ8GJkCmoRooa1xD45NhMPbyF3Ecq3awYyniAs
         XT81Im8vO+ldN3TH4an6eKoIycNwpZ1D+u5KsKjMIgvWROhSVg7ch2jxi8lcgJ8TNudq
         Eb/R2KomjsOqmMHk8Tc9HjfrFD0Z+udAMmc8RLvPrQoDOMFOa97LbRG84/6UFhN5Dk3f
         Bv20IPMkcb+TxCrPTUG/j203QZ/qe/oyWTYW7kd2O16DkMZ/5AS3OvM56/Qxbu1hFj5b
         JXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238403; x=1773843203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dY0TWOwK3weNKAIgmhv17nJM9mBZ8OEBfowAZR9oUFY=;
        b=OPD3hejFQw7o4GlRmnAgJKoblUmLA7MCkKftpmmedNgD2kbLb8trXIvTjyrC0v8Eqb
         /kPOE080GRedt4S1fFNymMGoM0Y6U7NJBP7nlZQvZnwdTBj1QJjLQDJFJWqsIjQOqfZt
         jYoFQjQe7OtLcThq4OEyGuUC+WD9fuVCPpBtTx7lWumpgO2P25iF6H0+D9y3TKxr77x4
         tH3rZecXUyQn3W2Ix8eLD+1dcLTBFHamdzCNHD2auE56dSA+zbuksfz126MsbEswQNLq
         XvtnVcnuNuZ700wuv6Ea/3dBzgD/+/s0y8KNauRYq8w009OgDBKcO8M7zPO4D3UfkcjW
         e+3w==
X-Gm-Message-State: AOJu0YxnxfmuMbEbsUjKPv+DCH+aZwkMTEn0izyW83WWJ3/0I4PzVOJ5
	MUstIz12QKpdZKTPl+/2wMvTggYE/pH1KGQUBubB3Kiaf1ukOsVxp0XHRbOrSdU2
X-Gm-Gg: ATEYQzyTXdkc+xfxyFWa5ZUwEw7gT1QlCabba1k/NbAVXkDAFB2YN/wWaM8k5kvu1gY
	/lsoRIQBaVRFsHbzg3N/V33t5wH9oNZbzsiYm/KkBBRevHD/QBYQkhWE+llB2vOmMa3jm43X4kl
	4yCDNHEVI+ZOrwx3KZ6uZfxlpPmHDG2io9tzkAMCwyxVCwI7+7n4LxClBvOaEajQvXgH+zgRwNZ
	H36rlUMUAimNaBYYUh8bSP5ZEd999stREbdYmSFVbDsDcRcat+i/nZfTU3aNdFHnWaeJ7o2H5DK
	wFPj+tWTEXYFJvhsH0K12NBpcGcwCq5o9U9zFO9FvSFoO10DjQs0pHY+kCeGHYUinrki9Cafz/2
	4lYfcynXvOxygWemIbThTEKhJdX2YDt+YJK5hWHb6pOdGmlkzDcAWObBgMCg5NAtj7VnXdIWiTk
	iR6tUQduzNUzxJ6Sxy0L4XDwXIDWA=
X-Received: by 2002:a17:90b:2e52:b0:359:f5f4:7740 with SMTP id 98e67ed59e1d1-35a02830179mr2135690a91.17.1773238402901;
        Wed, 11 Mar 2026 07:13:22 -0700 (PDT)
Received: from DL-ARCH01 ([192.63.190.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e196fdsm2427107a91.2.2026.03.11.07.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:13:22 -0700 (PDT)
From: Alejandro Hernandez Samaniego <aehs29@gmail.com>
X-Google-Original-From: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH 2/3] newlib: Upgrade 4.5.0 -> 4.6.0
Date: Wed, 11 Mar 2026 08:13:13 -0600
Message-ID: <20260311141313.306496-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 14:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232890

    License changes:
    - Adds BSD-2 for m68k-atari-elf target

Tested to work on qemux86,arm,aarch64,riscv32 and riscv64 variants:
https://dev.azure.com/ahcbb6/baremetal-qemu/_build/results?buildId=21709&view=results

Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 meta/recipes-core/newlib/newlib.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index a8794dd1d9..56e9eeb099 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -8,16 +8,16 @@ LIC_FILES_CHKSUM = " \
 		file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 		file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
-		file://COPYING.LIBGLOSS;md5=faa6f6ad545714df2a7d1276ed899f15 \
+		file://COPYING.LIBGLOSS;md5=069b617d6628c1502d7dc2d43d7c836e \
 		file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-		file://COPYING.NEWLIB;md5=61255563bbcda142f581b94591b6a589 \
+		file://COPYING.NEWLIB;md5=31bee4d729ae1a5423048cc181a2f1ad \
 		file://newlib/libc/posix/COPYRIGHT;md5=103468ff1982be840fdf4ee9f8b51bbf \
 		"
 
-BASEVER = "4.5.0"
+BASEVER = "4.6.0"
 PV = "${BASEVER}+git"
 SRC_URI = "git://sourceware.org/git/newlib-cygwin.git;protocol=https;branch=main"
-SRCREV = "5e5e51f1dc56a99eb4648c28e00d73b6ea44a8b0"
+SRCREV = "8ba4275b83ec27529f67e0d477611fa6d8d6e6bd"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/cross-cc"
-- 
2.53.0


