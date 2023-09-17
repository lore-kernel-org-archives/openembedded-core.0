Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35245CD13D8
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.27138.1694943551436301738
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TYm+aNEe;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99bf3f59905so464793766b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943550; x=1695548350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O28GYRbBsUT1LxVpkv2wZI7Fu9feuwCQRVk6m6/ofe8=;
        b=TYm+aNEe2umQubI49uh6xy/GxU1qZHTB34Uxn1wgZfU8VWDNoRG0syE+yKDfhZdVeA
         zmoMG146glySbFss+EVBHHRz+wlChYLdTeYkbW9FRJunQW21v+ebGRi8FWDhsyZEuTPd
         msZw9P2D2nYa06rgkrCuKwmBGwfiZXMBhJ/y6fhvdg9TMf+NYxuLWdcMr1yWEkBJSFBi
         0fEazzwAAdIU2nsytwxHME2+mvZ0VCEpCZIHKnnfV4+0MZbckQtyYrVntUvdqv35eF64
         KuxBI0C29olR6VSLxshFLfa/U2jpjeYqzyIcwz6px06OwdtOiOr6LbqE4SQP+uFeV/Qr
         dYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943550; x=1695548350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O28GYRbBsUT1LxVpkv2wZI7Fu9feuwCQRVk6m6/ofe8=;
        b=SnwBQxxm2b6/WnpQNOoJxFxRVsDLNx12Ade0HyYjbgS2AcSMGhC8v+4zTrOVLvSJ7R
         y9omrr9JTKMATUrq+R64Y9nPwMpRcvlPHojBoxntQNKA+JeVtwm0ClIkJ/EUmlIgPtX2
         thlgrU0fZ96fJOHQfvgddrT8HHe4WXAs6gLCCnVZoEZyVEidMOu9XaCoxNLvtymO7KmC
         dqErYgKMW2ed9Cwm4yspf1vfuZ+dsBCDD8i8RdZPBohzsvbK6mSDe5uCk6BLM0ArTo78
         zlX5imYTUMhTQ9sTlFIsAqbF1lmtVUNd5MqJIrqKI0bnQGe/Sn+4deQK+uWB1NgdnlDS
         kEEw==
X-Gm-Message-State: AOJu0YyO8L6PntbOJgPPS/JJSVWo7bgCW7v8ohufV2eeJZDnbdkoAZbK
	by2AKJG7fLVcSbXvPolzSx1RjWCGdLU=
X-Google-Smtp-Source: AGHT+IFbYO+oHUcOW27IctnbirRCn3vi9KjLiX78kBE7mNuNohWiZumytCsdh0dgk4zG/hrnYR9BZA==
X-Received: by 2002:a17:907:2716:b0:9a5:c5a8:a1a0 with SMTP id w22-20020a170907271600b009a5c5a8a1a0mr5342452ejk.49.1694943549823;
        Sun, 17 Sep 2023 02:39:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/29] strace: parallelize ptest
Date: Sun, 17 Sep 2023 11:38:40 +0200
Message-Id: <20230917093901.428214-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187781

strace is one of the slowest tests otherwise (can take 40 minutes or more),
and this brings it to under 10 minutes \0/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/strace/strace/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-devtools/strace/strace/run-ptest
index 86daed92201..1224229e8fc 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -3,7 +3,7 @@
 set -u
 
 export TIMEOUT_DURATION=240
-make -B -C tests -k test-suite.log
+make -j4 -B -C tests -k test-suite.log
 res=$?
 if [ $res -ne 0 ]; then
     cat tests/test-suite.log
-- 
2.30.2


