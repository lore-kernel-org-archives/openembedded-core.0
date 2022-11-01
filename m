Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07004C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 20:10:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.114.1667333450145145095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 13:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FcE4V8U4;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id h9so21701076wrt.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 13:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hlx6J41AHiBIn8oi7fQjyY+xQ2itJr/CHdKMQL7GfaI=;
        b=FcE4V8U4oCSJuBDT9f5k6BIN0BTE8HVyLNgPY7LgaDd1bMjOCxxyZFOPkpJXZlgcMV
         QvNtd2hbE5bVuyIXPVF9fh88QcrJb2gqZujbIVmXePPSwNhPy0eY0PE/C78+ACkoqh5n
         JT7JiUrMCSyPavkxcyUco833yX40B9i27RCT04wINuxGBIEGrBYh0J1rhzKny0LfO5Ar
         bFt3RSQNPFP7jlow1FL/c4oz4USwDzY+5LT9MOL/aLy/t7kEUsK2BxJNsnHYtPxhntXg
         Qbt/nrpEyn8PP86zzPn7e3MF0fddcYpyD/NG/diOA9v9PIgINimHzMhSGbEM0Z5HL6XX
         tgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlx6J41AHiBIn8oi7fQjyY+xQ2itJr/CHdKMQL7GfaI=;
        b=z74Ez97puUY2oLHZf/GXRhOfVu+8FApWQkrUUlCH1LFhCVC6vM1VCm3VD777Ct0vQZ
         6fv1hYmEzQnq5vselKo8hN5oAW04h1A3RSN43seNagtkPi80q8tH+Zxx0V1p+Df0BPdz
         UkinOjtE20NxyKkmwzI2t7hXCjGgtPak806Pzo0IVztdlnDfUQN46fpcqUYoG8Mv5NnW
         U3loeb/hs/K9hoD47wvKkaLFcW0XEsKYLlxTBFIEbiH/XQJpv6Nb1qQFYCo3ww4rud2l
         kU/Ogb9jYx4KYbMwZB3yEETqYYAzgCEvCT5DL8FM1vw2afTjepzGR568ZQuCZTBhMB4L
         td6A==
X-Gm-Message-State: ACrzQf1w5FMtsby86L4kDXOwu6FmHjox2ME4tZXThCeOEV74982Lv6Bx
	PNXfAUrbOOfucck/BzujNz+dNBdwqf4=
X-Google-Smtp-Source: AMsMyM6GvxhCP9lNvDGT4dxswPcXluJEpbYfn68EdLN8nkXK+yAG0e6Jbfr11zRRoCpZVGkrDnrfyw==
X-Received: by 2002:a5d:5d11:0:b0:236:e5a2:4c80 with SMTP id ch17-20020a5d5d11000000b00236e5a24c80mr3002622wrb.250.1667333448418;
        Tue, 01 Nov 2022 13:10:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a21-20020a1cf015000000b003cf78aafdd7sm4740510wmb.39.2022.11.01.13.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 13:10:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] rust: submit a rewritten version of crossbeam_atomic.patch upstream
Date: Tue,  1 Nov 2022 21:10:44 +0100
Message-Id: <20221101201044.1034019-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172384

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rust/rust/crossbeam_atomic.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch b/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
index 2f3f985243..13719ee9dc 100644
--- a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
+++ b/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
@@ -14,7 +14,7 @@ Someone with more rust knowledge could split up the triplets in no_atmoics.rs
 and compare against the architecture/processor, or replace -unknown with a glob
 to create a patch that upstream might accept.
 
-Upstream-Status: Inappropriate [OE Specific tweak  but could be rewritten]
+Upstream-Status: Submitted [https://github.com/crossbeam-rs/crossbeam/pull/922]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Index: rustc-1.64.0-src/vendor/crossbeam-utils/build.rs
-- 
2.30.2


