Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45D4C77B7F
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:50:57 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.4088.1682502650205021916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OMZRi5s2;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-2f4214b430aso4247578f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 02:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682502648; x=1685094648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GxyhcY/w6ZDDpAo67rOhVDy0EsBfqgoBM3DQs6tBz8=;
        b=OMZRi5s2LF2FsidXC4kDMAjrIL7otJEMwSkMnUmmXVcvJNEta8OelLdyAI+sL64m6I
         Kw/zuKGk2m6tzY10cUdWkGvbgNge2GD7ozPCYkWuLs1ayh+dq4y/HM8FFXs3aVKLoLfB
         DZv52F9blBUZZGMsk1hVM5aSWYMn7kimpqJPxqNsdoZfk3TSVuCXjBi1HhaPlEiQEkvB
         AWcH/89PmnhtRbwLHI95oi6sJsqbJA1KnzIagjcG80v7RpX8rmdXEi3T/mO1nHVhDOwj
         8EG1YL5TKJXhieLQf0T//qhPA9ApJKorzfGtpbnAtDT+X0Ro1zWHfNOFjfE6X/DaW4t+
         lOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502648; x=1685094648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GxyhcY/w6ZDDpAo67rOhVDy0EsBfqgoBM3DQs6tBz8=;
        b=hD4a3ZvcsUPHNQPyKs3E3nYCIROUGXAP8M1PI5AB5SEg7Mw7JmEdnY1X7wZGl2BSfh
         UxSWEiUoWzBhLulLqtDgJMZF1Dwv0smb3JPh8ahp9cSoeQuD1Zj6/6FvrhZIGRb/tGb7
         7NRxMz0gCW1Ww6YIDB9El/fzOFcmURtw2StMT1HKXpFvToiZIM/Zsz9iuAwF/zBPTf8Q
         cvZmtKgUUqjH0yoMPGckqlXjVIxnTfSSgmIVSV7CNlVDaoYoHnnZY+fzLuyRJsKcIO/Q
         0OgjCHoPo4+79rl5BTN4ipkfeMLmzDdrbBRZeWXgfA6ghazx12INfN4ZU8HsJN2lSZsh
         KQyw==
X-Gm-Message-State: AAQBX9cQgYyqc8VngJ4+8fKx7eelI6iPp2eItfO4uH1P7/PsC1lOPr6Q
	XIrI/ly9vzSZpzxHlRIY7izG/lxjK5E=
X-Google-Smtp-Source: AKy350ac8cjmLbMo8r+YME6jCbf9vnOPNfZrc6qVnb73St5pSOqHWEsk05KF88/X3C0hmFaVi40DtA==
X-Received: by 2002:a5d:5488:0:b0:2f7:be02:e977 with SMTP id h8-20020a5d5488000000b002f7be02e977mr13990147wrv.19.1682502648616;
        Wed, 26 Apr 2023 02:50:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o22-20020a1c7516000000b003f18372d540sm17242867wmc.14.2023.04.26.02.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:50:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/11] insane.bbclass: enable 32 bit time API check on affected architectures
Date: Wed, 26 Apr 2023 11:50:36 +0200
Message-Id: <20230426095036.2632847-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230426095036.2632847-1-alex@linutronix.de>
References: <20230426095036.2632847-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180429

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 8788f58fc5b..38126d89a58 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -44,7 +44,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
-            patch-fuzz patch-status-core\
+            patch-fuzz patch-status-core 32bit-time \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
@@ -512,6 +512,11 @@ def check_32bit_symbols(path, packagename, d, elf, messages):
     """
     Check that ELF files do not use any 32 bit time APIs from glibc.
     """
+    thirtytwo_bit_time_archs = set(('arm','armeb','mipsarcho32','powerpc','x86'))
+    overrides = set(d.getVar('OVERRIDES').split(':'))
+    if not(thirtytwo_bit_time_archs & overrides):
+        return
+
     import re
     # This list is manually constructed by searching the image folder of the
     # glibc recipe for __USE_TIME_BITS64.  There is no good way to do this
-- 
2.30.2


