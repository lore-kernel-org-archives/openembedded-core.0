Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C2AC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 03:14:11 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.1453.1657163643369582543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 20:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F9T13Iic;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id g4so16090707pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 20:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ilGOG8XRQSZQVGX7vib4N4mUIlu0WBgRxnxXqSg4DrI=;
        b=F9T13IicNTEvX3QNiC3ZotAaXBHWSIpfMffTXgSpwvBl6gGug0tovJN/L3DvoZkTaB
         DdIL4lGm5zioHBeDW0pOWm7D/zgoPZ3VW5YrmqxF7yvgf263TrjzfRzdkMwOhhx8TBec
         DIaQob17Nix3HcIq6hefhx//jMEWoKe6dgsiT4ln4uVSrvXhnQZHAzoF32mggaONV6T8
         1IPez+gdEHLZ1ejJxBMighhz8qC5SWYBfJiIKkhCWGqMf8I2olX7FM9SQkWdWw0RXGEI
         BY4nKc0KplcM1VcGGWLJLCvn1nd/APJrg3AdX+6S4bhm0FVTW7bgxAURFfvkMCosdZqN
         vi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ilGOG8XRQSZQVGX7vib4N4mUIlu0WBgRxnxXqSg4DrI=;
        b=lHNgWgQSt+TEmXDViOQb/zGqGHxzz1cO3Dgl45PsxONx3Ql7+VzFjFghySQfe+py+o
         YuX9rXUoIh99b3jQYpxVkWWjj3yxKGdvjq5yNZh5UExFzGutDCeL4YaI/G8I6DZQHb/H
         uScRkaz0+5Om+uPjqIZkdLaHMSGYWs5RbGeX6SHIjcrXldzfczXtpmJ+h/apz/+kiS1N
         wN9K6s2fcjXcnN1r5vdbSZjKeQZgSxxvJp4ZVTWYqNxrGRIQ9jhzHOlNO/actbgtMtj+
         J3DZtctsffgRKyM1bnuOKGzbjeh6P52rH/3ou8u5mcGgZjnWf+LGfHLsos3BHW6B7rVk
         z54Q==
X-Gm-Message-State: AJIora/g+5V5n+WgF+ED287QxgTgOP3cjeHx3OpyWZ8fUrdOFIKlD9SM
	uYpBYZC4DnAmLXHW1eURMeYEoxm1Tvcn9Q==
X-Google-Smtp-Source: 
 AGRyM1svvTEz2JhYs0/+Tmcw5wBqGwyrezSfIg+L0kyzcupC1OdSnxqKflpPjH8l2A0Gk2D/EtnV3w==
X-Received: by 2002:a17:90b:3ec7:b0:1ed:ded:abd1 with SMTP id
 rm7-20020a17090b3ec700b001ed0dedabd1mr2362117pjb.56.1657163642525;
        Wed, 06 Jul 2022 20:14:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 u13-20020a63454d000000b0040d2224ae04sm24737040pgk.76.2022.07.06.20.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 20:14:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libmodule-build-perl: Use env utility to find perl
 interpreter
Date: Wed,  6 Jul 2022 20:14:00 -0700
Message-Id: <20220707031400.440162-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 03:14:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167756

Fixes
ERROR: QA Issue: : /work/x86_64-linux/libmodule-build-perl-native/0.4231-r0/sysroot-destdir/work/x86_64-linux/libmodule-build-perl-native/0.4231-r0/recipe-sysroot-native/usr/bin/config_data maximum shebang size exceeded, the maximum size is 128. [shebang-size]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
index e2c79d962be..881d5e672e6 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
@@ -37,6 +37,7 @@ EXTRA_CPAN_BUILD_FLAGS = "--create_packlist=0"
 
 do_install:append () {
         rm -rf ${D}${docdir}/perl/html
+        sed -i "s:^#!.*:#!/usr/bin/env perl:" ${D}${bindir}/config_data
 }
 
 do_install_ptest() {
-- 
2.37.0


