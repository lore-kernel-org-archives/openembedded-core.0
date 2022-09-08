Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6155EC38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 18:42:46 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.443.1662662565206647255
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 11:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ox4RzTh7;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id l10so5528869plb.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 11:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=5NpirNjCDT6HlhQSXvrlxRgH4eqqBhPYAJCAgTe2Zio=;
        b=ox4RzTh7YLIR9WnRppJU0qgjZKFJlPJeMSU1wDQ27VIJUYTVeBm55dSVXZ+o5cjnol
         YpTCBcWgh8K+Xt4bsMQrx1DlnbhUzDuBJXvk7N3wQuhHWTJLvfL3vnNF7Rk2P2+6niv2
         ClSjslik5EZ9nkXmOzOeL2sbXNcivAFAXaGcJLWJkzipmveR1M06p2Xk5RpCQJHUNDnL
         luoCSpV+tu32r7mwVRydYiomiEa+qTQSBXINnseTYvEjTAn1vBaSQXr3xcjlJHt0ubqn
         +q91LCgN1hQ3hcqvty61d1Ahgu4aySX+jcWXj72OfABYPbEoQKxVZZ/rJmdSChWjwL3E
         M3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=5NpirNjCDT6HlhQSXvrlxRgH4eqqBhPYAJCAgTe2Zio=;
        b=WQ2LfS+V1Ur5wMvbL+pl/dZ2MfTHEbzaanLRt7IidN5sXmwftAcjC2l/zwbHPmEewD
         N0DDIwHvIMsq1nTmdzP2PL4S0KZqy+Nkp/BkUa4sB/Ygsduz1U5+tmLFTeF7z45IxA7R
         wKmLk7O4nypw4CzbSLzeqO5jp9nDb6/jEzV3EacetpND2RObHyohFr8U6qIpTk+x3NzD
         Rn18cmBfchmuOR8efRkCqLG5S4IfAjVuBi3+IYB7Le70g5e3FXCiY2v/ZJXWnlcNIYxb
         VDgzlEF7Woe1cLFAi+eWVIX0sVQtGVj5kEfBV34UZvfeGTpKeye/kSErDD83iDi+RQ8H
         6CPg==
X-Gm-Message-State: ACgBeo3o+nMpsOuNfIpJtqTkvF8T/P9XGbXiSn1LuwmI5sa0RhGbVSwh
	spwQFGb3X8GcImYfaDfbZELICcqoZXNuwg==
X-Google-Smtp-Source: 
 AA6agR4/5FWtRq//zgpm4ckjfiuYtGqeZI9jtftnUWUY4Iwcss8KpeCLnrmMOq1H7Mnv1T/q3+Mk8w==
X-Received: by 2002:a17:90b:3807:b0:1f4:ecf7:5987 with SMTP id
 mq7-20020a17090b380700b001f4ecf75987mr5355333pjb.13.1662662564316;
        Thu, 08 Sep 2022 11:42:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 n10-20020a170902e54a00b00176de47a499sm160075plf.223.2022.09.08.11.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 11:42:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] rust: Use variable to specify extra tools to install
Date: Thu,  8 Sep 2022 11:42:42 -0700
Message-Id: <20220908184242.3578145-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 18:42:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170466

All architectures may not support same set of tools, therefore use a
variable to specify this. E.g. on riscv32 rustfmt is not buildable
right now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: fix typo and only exclude rustfmt on rv32 since thats what does not
    build

 meta/recipes-devtools/rust/rust_1.63.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.63.0.bb b/meta/recipes-devtools/rust/rust_1.63.0.bb
index cf6468d212..3de6eea0c1 100644
--- a/meta/recipes-devtools/rust/rust_1.63.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.63.0.bb
@@ -62,13 +62,15 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/manifest*
 }
 
+EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
+EXTRA_TOOLS:remove:riscv32 = "rustfmt"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=1
     rust_runx install
     unset PSEUDO_UNLOAD
 
     install -d ${D}${bindir}
-    for i in cargo-clippy clippy-driver rustfmt; do
+    for i in ${EXTRA_TOOLS}; do
         cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
         chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
-- 
2.37.3


