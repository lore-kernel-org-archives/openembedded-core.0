Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6F1C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 16:23:26 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.235.1706631797630711152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 08:23:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SB1gwtPL;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6e11b331e72so1931376a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 08:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706631796; x=1707236596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cYcaaW0IjTYsyeQNPZFpyIipLZk2W0aiOaWhow5EOw=;
        b=SB1gwtPL8Ir/Tub8Pl0qvDgXjg7dTzWEDUNSkod3f06l0o8fFmCsPPqJHTAIRFHiTE
         kyTYnmpm/sHgfCHAIVkE9Hz9GsTUimrePIMCeEaF/9o+tyf9Qil/A/jyMEHfn/GQb3Lu
         vyJmU6rfyJ9AwA/clfWwYEUQE33mvJa1/zQT9paVaCgml5kx+uyJAjSGOwfAzavxDnXe
         jrzofHP133AHRAjGuhA+uAj3VkiPpit+8TkubTPl+wLPDh1jhTixm9fHpPKLtHmXK1mg
         radUj3wZGNWjpLX3OUvxe4/cPm8ooEsBioNQ+VAp8+IS4tj3zYyUG/OFtcp6A2eEeWbP
         xGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706631796; x=1707236596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cYcaaW0IjTYsyeQNPZFpyIipLZk2W0aiOaWhow5EOw=;
        b=kA4VcMLCJ1mJATh715Ghlsb+dOP1ZwIE/f3Ai3Hrwr3wW3u2EVDMW3pNO4sVqZkrlu
         8Db9IfIS38zZM6NWq4e6atsVgkPYXBZsqXzY8vU13xI6oYFzaHNOUA3Ybjg7lAjxSNku
         K+Xd9iv1VafnWy0ESzo5zSmz17pCwbZIdB5suNbE4qroXoznOG6izz9/AlIdbFbx6VcI
         7TVh/ku82cCRLQC6cErV6q2rZcS1B4cI85L2VaJFlqWTNRHigyMNBLlZCfjBRvynSV/o
         DYotFvpW4ArZQY275Q95yL7LoKPC0RjhGDBWgEAGTwxZEaSCZGqKw1irkdOiMCoRy6xA
         7R/A==
X-Gm-Message-State: AOJu0Yx7EVy2KFZgWlKLjRbecTE0tlQdBQcH9GSPEkeEM3rJrB2Edj4y
	rs6LJl7TSY3gQapUcmYcDEMfBVbvo64mczmTmkPrkTcK8wduFxi0w4BewUIyvCU=
X-Google-Smtp-Source: AGHT+IFNcI5iTMdu63tatC/YNlIAqhbRZd9QLte6oY4GENsRp+JK1TEZNk8iahcl4djYrq5CbQiXBw==
X-Received: by 2002:a05:6358:58:b0:176:7be:3022 with SMTP id 24-20020a056358005800b0017607be3022mr5978034rwx.44.1706631796539;
        Tue, 30 Jan 2024 08:23:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3f31])
        by smtp.gmail.com with ESMTPSA id l18-20020a656812000000b005d0796e779bsm7300014pgt.12.2024.01.30.08.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 08:23:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu-native: Use inherit_defer for including native class
Date: Tue, 30 Jan 2024 08:23:13 -0800
Message-ID: <20240130162313.2020553-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 16:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194498

This helps working with native qemu recipes with devtool, since devtool
inserts an internal class called devtool-source resulting in

ERROR: QA Issue: qemu-system-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes i
nherited after native/nativesdk: devtool-source.bbclass [native-last]
ERROR: Fatal QA errors were found, failing task.
ERROR: Parsing halted due to errors, see error messages above
ERROR: Command execution failed:

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-native.inc b/meta/recipes-devtools/qemu/qemu-native.inc
index d9acc613f95..891dc5e2a10 100644
--- a/meta/recipes-devtools/qemu/qemu-native.inc
+++ b/meta/recipes-devtools/qemu/qemu-native.inc
@@ -1,6 +1,6 @@
 require qemu.inc
 
-inherit native
+inherit_defer native
 
 EXTRA_OEMAKE:append = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
 
-- 
2.43.0


