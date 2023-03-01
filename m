Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0808BC64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 10:32:27 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.18862.1677666737444653787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 02:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eCPEgi0T;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id x34so12939829pjj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 02:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vN/cJr3XCQqYbYBa46RUmrqaAhd8GTmQ9qFOTsWRKis=;
        b=eCPEgi0TtBG36B3iRuPW7A66Iuqctre39RObKcXXpnlkWRyjim6PH+A4sZ9pScsD0G
         C/fw8gd64XHUAVe3mKVnHHqCvoh/SaHJ6og51KkaLHIcz75aPws/IInTCGm8zaoVqHnE
         htwnW4HL83VQouYm1umj5his4betBpkBzV/dbdyPp1WbhLMVOkpmLtV/YlJj9Tp9cNXs
         tq7uP82s5pZYU6+38QMgPrpx/uA4o2765j0XZil+7KDsadoRc6dwvWlYcLa4POfrY7FS
         6n744LpeaYe3BpISg3Robqj2x0N5XSJtdjFEQeW+MSYwO46Q1IR4PBCBGsXE9HRZPg4/
         Tn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vN/cJr3XCQqYbYBa46RUmrqaAhd8GTmQ9qFOTsWRKis=;
        b=jqv8HojGHCE2eaO67y6CDEzPGonnra9tTGav8wOlnjD7wE9o8Z1dtrTgXoGkcpcVEk
         jcqOs+B0JTzD/00nlJqUBNSOrCUpRw06ERbuV0jQsowo0ckUTxmK3jHrM0WbfZ1lG5/o
         pMe/Ma+rw1qHm1/OApg+Zks14fsDMLXtPJ5pBi3Zm4F+HgaD4CYUUVOiSIgoJnG3Ktdv
         //DUSVbTsO3WhgjSvJI/D6GjFtwycvPzWd55dz9N2sLR+9Nppgrf6sCamFdVa8ytwAzH
         0MjemhULMIkexfAK4Z5AdezUVIvrYBGxc1i0l2YbhhZayvn7XrWyh68XJ20B7sutAV95
         UidQ==
X-Gm-Message-State: AO0yUKXjTHUaRe/ZRIgQVp1MCGZn4wbaDYiKeU7l+/WcRlj104S95HHa
	yBEJ0iHwGt1CyAlfC9rxGAA3F5cO/bQ=
X-Google-Smtp-Source: AK7set9Rq4oO6l2wZ57vo8eItlwgm2U/FwamSpZg4GOhFPUo4AToHqPMqk7mBD2uGVesClsz0r9oeQ==
X-Received: by 2002:a17:903:2301:b0:19a:ae30:3a42 with SMTP id d1-20020a170903230100b0019aae303a42mr6431470plh.21.1677666736307;
        Wed, 01 Mar 2023 02:32:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902ee4600b00199023c688esm8126718plo.26.2023.03.01.02.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 02:32:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] opensbi: Upgrade to 1.2 release
Date: Wed,  1 Mar 2023 02:32:13 -0800
Message-Id: <20230301103213.4176237-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 10:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177883

Here is list of changes in this major release

https://github.com/riscv-software-src/opensbi/compare/v1.1...v1.2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/opensbi/{opensbi_1.1.bb => opensbi_1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/opensbi/{opensbi_1.1.bb => opensbi_1.2.bb} (97%)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.1.bb b/meta/recipes-bsp/opensbi/opensbi_1.2.bb
similarity index 97%
rename from meta/recipes-bsp/opensbi/opensbi_1.1.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.2.bb
index d3a6296533..a088fef419 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.1.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.2.bb
@@ -8,7 +8,7 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "4489876e933d8ba0d8bc6c64bae71e295d45faac"
+SRCREV = "6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8"
 SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


