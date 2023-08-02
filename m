Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B326C001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 03:41:36 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.6971.1690947692074804440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 20:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WCAi7WEj;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-563de62f861so3808315a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 20:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690947691; x=1691552491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cOFTREfiuNVmGEtvR8bs1mOt1+dmI5LQg1fOiGhtaes=;
        b=WCAi7WEjfET99zcAtBMJDo2YA0tCmZU3JSOeQGvnU/PrBD6sI3e3u1v06v42iva/7k
         PnxHjyH65U16FcD+V+oVhDMRY2hWzB43MJSxQ4d4CMnUIG7x5tVR6QdzGb84uzUD1jzF
         NYAIEG0PETi7seT4JdbCtGHiyokNxtb3AhrR4Lnn6soQ1VVUP/f3KZK8WllhZ1ROmEvP
         K0hgqIZQo/H1e9TQo+2cxIkjha8+wMzcm4RF4+RJxytnMxbuZDLZTSOK+50fG8O/omRr
         423heWr5qiopElI0IKpatAp+VvWJTZTg9niuNBY8G198E6iIiAdTWSK1xNHaVec3UGG4
         4ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690947691; x=1691552491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOFTREfiuNVmGEtvR8bs1mOt1+dmI5LQg1fOiGhtaes=;
        b=T3kpZYOPm8jn5p+YfuQr3Taq0ZlgyipezonKjR72kUa8izvP6yLbz6lhqwQ91moldi
         MEEcuTtfwccW8C8IxS1ryFxKbQgYHgKsgvJvpsUfpOZ7v6REWOZUni/XoCNhz76rnb3W
         CXCCJMAuprlvPs0G28+z3hhEGuj7G6UUptzgcUVLzi41ooZaKX/yszoApnl87MYMpg/d
         5t2HIGhd8qx8mgx515+hbPIxtYmLdhcSEUupZojb4YXMo+GlrmEW8EEwdW2Mjghz9q62
         14vRUhYg/mAuVNAKSbIRKT7HlC8rgLSgGSzT8/d+qIjJCgVnpPOmoHPSqKmoM1PGWVGb
         fBLg==
X-Gm-Message-State: ABy/qLYpsO0FeXeqvtf9MNCYqz8ACKZ1O1CKAzTgksCihjG4p1AnRgM3
	N4Ug49FBRtf6D3FSRzhYZybeucEiQ4TDTg==
X-Google-Smtp-Source: APBJJlFmiVbh3N9Gg3JNXeaiVJ0iRbDoTARrCgUubzNSBtcYQZKVv4vx3CKlDUA9Z0C866B710f30A==
X-Received: by 2002:a05:6a21:7888:b0:121:ca90:df01 with SMTP id bf8-20020a056a21788800b00121ca90df01mr17739033pzc.40.1690947691145;
        Tue, 01 Aug 2023 20:41:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902e75000b0019ee045a2b3sm11147464plf.308.2023.08.01.20.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 20:41:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Upgrade to tip of trunk
Date: Tue,  1 Aug 2023 20:41:27 -0700
Message-ID: <20230802034127.3511206-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 03:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185371

Brings following changes

* 83b858f8 fix rejection of dns responses with pointers past 512 byte offset
* a4ecaf89 dns stub resolver: increase buffer size to handle chained CNAMEs
* 40834f6c printf core: fix gratuitous integer formatting buffer size
* 3a23cd06 all printf variants: fix argument type handling for %c and %lc
* fa4a8abd fix public clone function to be safe and usable by applications
* 0c277ff1 fix broken thread list unlocking after fork
* 4653b987 mbrtowc: Fix wrong return value when n > UINT_MAX
* b90841e2 configure: replace -Os with equivalent based on -O2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index b4c2b1f8980..0e87a6b49eb 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "718f363bc2067b6487900eddc9180c84e7739f80"
+SRCREV = "83b858f83b658bd34eca5d8ad4d145f673ae7e5e"
 
 BASEVER = "1.2.4"
 
-- 
2.41.0


