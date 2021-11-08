Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C820C433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 06:32:46 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.41451.1636353164810941802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 22:32:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h7B+Ak0/;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 w9-20020a17090a1b8900b001a6b3b7ec17so7911547pjc.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 22:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dphXqxClRiCt77Ud1ZPlRuwpO5fK5aX95dcdCyOyhJQ=;
        b=h7B+Ak0/vav6+V/qHgSfuHntMMY+KuQo8rCeAUN0Bau4xtFtDkjb8LOcYpu4zmBVBb
         AJgqtED1kGaWOsi+vX//zawW0n82Yko4TaTOSG3vnErjvbJbKIQ49H2QgPxieJiapVDy
         cClHmINfsreLHO45fOnRLUKpIW+RP15buaShkLwY68LueuAb/6Nh3MXRi+6/EXcBDfsY
         sJwTSCLFzK4XXOKHLIQ2w5ddJ0a4DAFLn2fh6K805bnOYAXY84OD3kP7pMzHdDAytNd2
         1OZI90LNEOxRkz90ksdMoOpQj4JV5lFJH7H4edTtmb+s4446aQo2R5Uvt9hnreMbpuf4
         yzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dphXqxClRiCt77Ud1ZPlRuwpO5fK5aX95dcdCyOyhJQ=;
        b=BtdS5dvcXrjS0uP2Xs6ZxaABYEnUiupf8H/Ewq2At+8XMs3aglTk8HrZDYFL1jm3xo
         tANR2WSMRDgtNvn/yjAt+EkDlk8SKznJDQ6gni8S4gLIxCIXufqsoCOb0qICgdFAcgpk
         DPHRaLVYZduz7eCI+Vg2//IF/VfH4t+2QK0lfc8sMukPnskqOW9FpKAS8l7LSYXNBo3P
         uoYXgAcGZl6oHwZty+isVLfxv/Dles6enMgY+dJt9r5DR+N/2E1aLczXeUabloE/lhqQ
         nadq46tqmkZ11XqdjfgIE3oGKL621KckHfDdtknSBx1eZMKYaBAYI36maLFQYbo6Zg1A
         BXbw==
X-Gm-Message-State: AOAM530MFDgdLzBqkxVTtlnURQKUMJHU+5BXaSgXKSLw8eL2mWrqmSv4
	labyRcqpb4ABVxT3Z5RgV+bWF160siI=
X-Google-Smtp-Source: 
 ABdhPJzMLunL7l6mUlC9Wdjsmn4AHsOepG428WW45FueYmp7AAbxXVAnmuyDRa5PU0d3jP8mg/Nz3w==
X-Received: by 2002:a17:902:d703:b0:140:125b:40a5 with SMTP id
 w3-20020a170902d70300b00140125b40a5mr68701392ply.65.1636353163922;
        Sun, 07 Nov 2021 22:32:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 t11sm11424703pgi.73.2021.11.07.22.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 22:32:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Build on musl targets
Date: Sun,  7 Nov 2021 22:32:41 -0800
Message-Id: <20211108063241.162874-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 06:32:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157964

This has been disabled for the given compile error which has been fixed
over time, qemu for target builds fine with musl now a days

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_6.1.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu_6.1.0.bb b/meta/recipes-devtools/qemu/qemu_6.1.0.bb
index f8a816b12b6..017a054d5d6 100644
--- a/meta/recipes-devtools/qemu/qemu_6.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_6.1.0.bb
@@ -2,10 +2,6 @@ BBCLASSEXTEND = "nativesdk"
 
 require qemu.inc
 
-# error: a parameter list without types is only allowed in a function definition
-#            void (*_function)(sigval_t);
-COMPATIBLE_HOST:libc-musl = 'null'
-
 DEPENDS = "glib-2.0 zlib pixman bison-native ninja-native meson-native"
 
 RDEPENDS:${PN}:class-target += "bash"
-- 
2.33.1


