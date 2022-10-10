Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20B3C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 21:38:25 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.282.1665437898925343874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 14:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LLdIVKsW;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so11385588pjo.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 14:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEb8uemKYuYmjxvGFkePXE0NgU28jKcvqQrI++ss4xY=;
        b=LLdIVKsWOFhzycVaia+iNnrM7yl15ToUUb/s9fMgqqzEK9xoC1XwA+j0poicQKtKth
         NYwnKiFEvTXMpZu/xBrf7Ro/ovxxRPJ67KWVyjjAp+tbDtOqvLmcTNFL4kAqOiea+lc1
         H9ckpt/JKryIB1fzJv1vTKDZEEQGKURsY8Pn+Ki1GclMh1RvtcJgNSvIzbfh9pdC9gx1
         5KqAp+zznUZpkYvHFTGvav1afT+RzT3YGWYteFXi634WbeC3ZBrfmaiaN0B7pI7IsPmf
         cOpvzLDcJIhlpBXBDB5vl9r2VlYhEbWwuOahajIBY9s/9O0ruIKI/5BrAdwl4X1vfHAS
         O8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEb8uemKYuYmjxvGFkePXE0NgU28jKcvqQrI++ss4xY=;
        b=GzZHJb9Hqb82Y8fLInmcLup6SAN07qoHGcaYCU+jJuKTj2RlKkcT5D2OT6n5x0oknh
         NXKE+VwMcTyGp8xBF5x7v9QK06m4eTpEzRCwlK0IXc2ft6Z3+pq3HZMXULYY1N2R53w3
         MOQSKUM17sA6RR9EHJa/J0r+wGMIJR64ivR7Mku36rnx7fMWaARfB4TyQy6PFwspG5MT
         448EpbCeMXtMWxmOPjULLTtZVsFtVWGwEfx8XU1ajy3ehmg4UStT6y1OPvuwxHj/3dA5
         P3EWLLoIgNNS6S0LTBYgwlJFoZnIAAKpPd+5Uq0839wrIlK4UHFCoitTg0S98+l5E7kt
         K6kg==
X-Gm-Message-State: ACrzQf2yWFzDt0xcza3VWghUeNCzfAx4QDrWLUgOTGBcvrljg3f1ikmx
	/0apFGFRSZFK9ph74K+W42x8IxyI/yPHaw==
X-Google-Smtp-Source: 
 AMsMyM5ogTuGWWHbA3BMKXXAz31eLHYVIf1urb1GTucqLpprN4XIzd7b79S8eYrnpXVSXp6aK5mnxA==
X-Received: by 2002:a17:90b:48c9:b0:20a:f2f5:45c8 with SMTP id
 li9-20020a17090b48c900b0020af2f545c8mr30443301pjb.18.1665437898070;
        Mon, 10 Oct 2022 14:38:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::32cd])
        by smtp.gmail.com with ESMTPSA id
 o9-20020a170903210900b0017f7d7e95d3sm7076967ple.167.2022.10.10.14.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 14:38:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] ptests: Mark ptest-runner as rdepend instead of rrecommends
Date: Mon, 10 Oct 2022 14:38:14 -0700
Message-Id: <20221010213814.1678227-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 21:38:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171585

This ensures all runtime deependencies eg. perl-modules recommendations
are added to dependencies correctly

see [1]

[1] https://git.yoctoproject.org/poky/commit/?h=master&id=4705dd264681d908f144dd4d9bf1f6175f68d8b9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/ptest.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-recipe/ptest.bbclass b/meta/classes-recipe/ptest.bbclass
index 0383206a6d..36266ec161 100644
--- a/meta/classes-recipe/ptest.bbclass
+++ b/meta/classes-recipe/ptest.bbclass
@@ -23,10 +23,9 @@ PTEST_ENABLED = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
 PTEST_ENABLED:class-native = ""
 PTEST_ENABLED:class-nativesdk = ""
 PTEST_ENABLED:class-cross-canadian = ""
-RDEPENDS:${PN}-ptest += "${PN}"
+RDEPENDS:${PN}-ptest += "${PN} ptest-runner"
 RDEPENDS:${PN}-ptest:class-native = ""
 RDEPENDS:${PN}-ptest:class-nativesdk = ""
-RRECOMMENDS:${PN}-ptest += "ptest-runner"
 
 PACKAGES =+ "${@bb.utils.contains('PTEST_ENABLED', '1', '${PN}-ptest', '', d)}"
 
-- 
2.38.0


