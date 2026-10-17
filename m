Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80954CCF2C1
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 17:06:02 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.449.1792256752594033783
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 10:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QM0azkNC;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535a54bed9so1185835eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792256752; x=1792861552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZnUYvktl6dmVgrBeVV7x+bpYUEQeqwHpr84FKN8UG6E=;
        b=QM0azkNCdYWFV2jfNGkA9feYqWdZ7ja/noBDcbHiTJ/LPkB5tcLL3ksavWyPKZWVSA
         4fIR7BOSHaPRmJbZ2U/CwCuiAJvZlR4uRJa3v3mO72cpuf6Z1xkR/q8LYAR0UxJCv94y
         mBamkkanw5iWU5HlMroOVDituzjZUKk/XiWPFJd1Kb1R1BxcUVzVRRsFJFI3aQCyjZY+
         rHy+V59Nhg1CiSqp10pl8zMmdz8o34iyoWI2KFU5oLiJev11QdmkOyfvPuEsga/6YCo1
         U7Pn8rojNFXK9QkPorHSkic7rFUZoEGN9uvId9KdxJWXsNbNg7Ur4/2yT5ByNV/W9oVQ
         5VBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792256752; x=1792861552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZnUYvktl6dmVgrBeVV7x+bpYUEQeqwHpr84FKN8UG6E=;
        b=EOspcsrENW43mumunNJfhEPQUgReohmDQs8y2EgIU9tOCMjssP5U9pxMiLdsEmIDfQ
         62hAOwu2cUA7vGfwIKoWmIMsptchGRcLRaDBOW+4CfuniOE7dn0AUnJbEMrt/5DPFLsr
         tdH+VJEhnG4esFw0e4z4nkpaJvLSdOAOh3/iuHqTfPrlzoV1OgdoggtIMOdULAQz3Jhm
         du/gSHeq1uxk4U/XTB2NwJSHXOne3hMYgalXl1IyIZCPVH9pNs7z6IK9rHw9G7aNXUBd
         U+gE8guBWapQS/11NGIpn0vYPIJbVSCW3XDyfvjkzMXPxi451jUpPGQuKgRZbuDaAI1t
         huxg==
X-Gm-Message-State: AFq9FYLYMnjW9n8p3nfDV+CMl8a4gwkAKo9WkHRiOxsoZMOwAzyB5E1z
	ItEUx8GzzExgmOfXj65UHru8yCHBH5N9ksxqATWWsG0kiWfll+kQgAC6limV3VO+kxA=
X-Gm-Gg: AYBFou3tfEBnZIO+IHJ3iDhss3SfXhpesHoBSXyxl5N64dnjpSd9I503Zc/nl+WY9OZ
	4QVxMxnjP72ZiLC2+fq4kk1HQGxV4xGnA8t4oqOye2kmlR1Fi0IOXLjU8Wi4vS4jx/3vN87Yds7
	wDPRGUmiNCbnVMs2hJPQpPDL9S9OFmVXFszEKBiNDUGaTQTFjMsQkNXkDuOGUWrfvxW2RXv+/vM
	nfD1Rs2Y+zCZ49gfXAa8R8y+WQwWQ94bRQnZMuD71BiVEqymta1/UV6l+8j8Ga2b1S01Rc6oUgq
	D1hOQ0II6CZ6+pu5x28Vz+maP1xzaFdB8UH8chTUp/l9Uf6e+By2NNAowy284o2ape55OoyFsAh
	T+S47GcJoSNhbuan+ZDgNmqUwPl+J9BZEar6xYNoUDheXADOdN+OO2BEHS6ET5K1QaB9COoXgql
	Qw14dbypL9s4gG4IOc96FsSgDRUn56fn5Ln7AhS/qZ+eI3KOjL0ITgeNjmfl3AKq/e0K1jZXfvn
	F6+L0Z1+sKzklYPYV9FUc6QAWBb0grtF1i0VOkf3Hmj0MOBRAqgus7fW1CNspVyMg61+ulpRFZo
	C2xy30jk9GbSyYCbegPtCI3XBUoBTurp7JWl4TgO+9OC9B+eKuebLqzUcn0dUNJ0CqdBVOyqDU8
	8sEBL/4YmfiVMywnzH9sxlIrKSYYfWHxgeTYBXgwTVj2OwP1cFmbSdq8jTi7d5TeSwu+8t3jPfj
	ehFTg0kSWg2nqQTpfDlOlygbDzYMWmWuEpsmPx9wzdgHcDQw==
X-Received: by 2002:a05:7300:de41:b0:35f:71bf:131a with SMTP id 5a478bee46e88-361a234f0b4mr4152594eec.28.1792256751568;
        Sat, 17 Oct 2026 10:05:51 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm21649697eec.20.2026.10.17.10.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:05:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] packagegroup-core-tools-testapps: Ignore gst-examples for rv32
Date: Sat, 17 Oct 2026 10:05:47 -0700
Message-ID: <20261017170547.2302543-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 17:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248092

Not buildable yet

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../packagegroups/packagegroup-core-tools-testapps.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index c47010f05c..a572d78acf 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -31,6 +31,7 @@ GOTOOLS:riscv32 ?= ""
 
 GSTEXAMPLES ?= "gst-examples"
 GSTEXAMPLES:riscv64 = ""
+GSTEXAMPLES:riscv32 = ""
 
 X11GLTOOLS = "\
     mesa-demos \

