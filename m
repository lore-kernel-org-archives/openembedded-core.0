Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDCBC3DA79
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 21:17:26 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.30733.1671657438307240519
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 13:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GtZfcxvt;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id w15so16182915wrl.9
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 13:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/bcoh8mrr5x0qx9JKuQrmbDQU5745WgEa5whVlg5mw=;
        b=GtZfcxvtVbu8IqeTEqkZ7zyQGh9VS/45lgC3Woc8UYdmXpWVspaLsxS2x5+d2Hi/Qa
         6L4/9qD7q3GYVwojjyF0UXk/3xSQYAtbc3898iL0FiE4divVCXcc+o+Z2pXOtJMWD4gj
         OWJzrDerqPjDf0665qeBLA9XzZLcKrJk0AUyQCDebbnNe/1VKKOEC4PlZOb+G+R9iy+c
         Mb07rPpfXIozlwxeth6i53fbhVgqyJNNcNu4OeaI7gqhpD0idaDH/Z/xSWEISFYeVux2
         2YcbMtdsp7iZX0Uqp3p3MHiBuEvr/2pygrutHyPjGsp74Pt2RvZHvsv2xYcwAo/4PvvR
         duow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/bcoh8mrr5x0qx9JKuQrmbDQU5745WgEa5whVlg5mw=;
        b=0cCQtQUxDiIgOxDGmvnlKfFwo4zP6t7mAIlepePL6SFsUk5ntnwUYBzxyQegjB3ZNR
         9gVWCECKHRNOhwgh+w8+2a8jOkqZeUMFj+bePcALT42+EFOUuoPoIY27+5ttfuCHfZ64
         JJLjrhB2a8YtTZgyDug7t90gKmuaR7dlz9xeMxCazGxNkn+hHzmgOGliT3B2/a4Khm8c
         E5baHIIldB09f+q1GEALysdZLXfHTrLlSV8B8a+mUejhqM4IOSeWl/k9q3Zdo9hO7Fzp
         fHPS0EH/TLU00ExX9EotzrIlqVKuHV3fbBwT8hSf4OW3RG+KxoxwPz2YQ2tMb/WyZdFP
         QGZA==
X-Gm-Message-State: AFqh2kroFjrbdpd46nGvfOCjMLZ6nMfwUkTtwoMLY68xoXuG9rApc5PE
	A4xBmh8LbLz9yoNb7UDIU06zUrNGlaE=
X-Google-Smtp-Source: AMrXdXsuwp7dnczODGK0SCe/TJ0ZUL/CRfkQyd+YDTpgzEsTmJV/ez3S3md2XZqsZPwuFmTEu/Si0A==
X-Received: by 2002:adf:e409:0:b0:242:45e7:db17 with SMTP id g9-20020adfe409000000b0024245e7db17mr1863159wrm.66.1671657436693;
        Wed, 21 Dec 2022 13:17:16 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bx25-20020a5d5b19000000b00225307f43fbsm16312442wrb.44.2022.12.21.13.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 13:17:15 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 03/10] libstd-rs: Move source directory to library/test
Date: Wed, 21 Dec 2022 21:16:59 +0000
Message-Id: <20221221211706.25347-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221211706.25347-1-alex.kiernan@gmail.com>
References: <20221221211706.25347-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174943

Building libstd-rs from library/std omits proc_macro from the sysroot.
Using library/test causes that to be installed which then allows cargo
to build (https://github.com/meta-rust/meta-rust/issues/266)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/rust/libstd-rs_1.66.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
index 6c5a979f4f23..8802e9790ce4 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
@@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=92289ed52a60b63ab715612ad2915603"
 
 require rust-source.inc
 
-# libstd moved from src/libstd to library/std in 1.47+
-S = "${RUSTSRC}/library/std"
+# Building with library/std omits proc_macro from the sysroot. Using
+# library/test causes that to be installed which then allows cargo to
+# build (https://github.com/meta-rust/meta-rust/issues/266)
+S = "${RUSTSRC}/library/test"
 
 RUSTLIB_DEP = ""
 inherit cargo
-- 
2.39.0


