Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67034C54E5E
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.14860.1709739724673179975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M3LS+Jgf;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a293f2280c7so167180466b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739723; x=1710344523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7V3YSgYZSiyiM+ijRInFXmY1zcpFxEsqN+rsppLI6UM=;
        b=M3LS+JgfmbsrBIMQiyZxpyGKFlWf1c66oIr6IKuSYoji7meo/4IO52E2tnGBvv2K+i
         hZzJpI8RQUJpZ09iWkNdCu9+U84QKRo4tFzsBChyJFvrsTnzM1ldvoADZ6Vg4epXEUH9
         0HPmDknqAI6aUYtDwp4/lha9SMFZfcSSDmMUgyjFSAknReL4msLyKYcZDP+l63XJacN5
         u8r5u2VLWZIYTw44zbq7HKKzhTjjF6eOaFQFtY1e4OiJVnIDnRu2ygvDQNlx/fy/fHN4
         kOp6uDoC1egjET8RN/Y8YM0VBgrjQZLdKN4YVPmGkdjybxN6J/oA7K6qkhwTzmE3mcpt
         Lvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739723; x=1710344523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7V3YSgYZSiyiM+ijRInFXmY1zcpFxEsqN+rsppLI6UM=;
        b=KAwdZaB0cqwwQP3ECELs3KupY/cVCsjILCGD2HV5FXYITp9vHykFWL1Kl/lVPBMPVi
         nxb/5cDXT9LvF6xaHtBKx0L0BWWZ9kwUSIGRol1CjaSJx1zm2ZZFFS7/qPbQU/nuZ78j
         OGsSLJqKW6pQV3lCqjNobj0TTqDeKB9lvgcsqO9iyqGOnNkjLQBLdPoBFD+BkPMbyxLl
         28VBjER01nQNNWjM3Yp1yxn6wbJsJBt4GaIKxZOJ7cib+XC3x6vvJbFeFxQWPUQhHSwe
         C2uIs8sLtUsqVXKONiE6vvlvRC5/IaN2Gb1vZr+WDPREilBFrLrCWS50qM+TjCcFPalY
         TTKA==
X-Gm-Message-State: AOJu0YxaKwk/f6E8ntcmhNHgNlkjAl8bX3lF1+3oB3I+LHmCF+UBLajk
	P1+zRBjmkZrNYt5SSfy87ixV3g7xhcm9hjeTQ0y1re6TSzbDTYikKurDTg53
X-Google-Smtp-Source: AGHT+IFQ6S1DIx/4JHBz2t41rGbSNZ7Ri+EXgs9VZE+Qruyfb7ouuI6KyspO8HqaEgLwlAWLfTpUlA==
X-Received: by 2002:a17:906:f2cb:b0:a45:a814:1cac with SMTP id gz11-20020a170906f2cb00b00a45a8141cacmr4190111ejb.5.1709739722959;
        Wed, 06 Mar 2024 07:42:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/47] diffoscope: upgrade 253 -> 259
Date: Wed,  6 Mar 2024 16:41:10 +0100
Message-Id: <20240306154151.3741709-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196689

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffoscope/{diffoscope_253.bb => diffoscope_259.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_253.bb => diffoscope_259.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_253.bb b/meta/recipes-support/diffoscope/diffoscope_259.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_253.bb
rename to meta/recipes-support/diffoscope/diffoscope_259.bb
index a1fc63efc34..eca2c208fcb 100644
--- a/meta/recipes-support/diffoscope/diffoscope_253.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_259.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ca3d826b691f4998d6de28a016b3555d56a7283b97ad92944ce643ea6e7eb614"
+SRC_URI[sha256sum] = "c1f14452467f84c4be804a3725cbfdd5eadf977ece7ad463be8b647d1a87fb42"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.39.2


