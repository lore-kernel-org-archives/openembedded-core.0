Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3C1C67871
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 11:53:35 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.84246.1673610814140157763
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 03:53:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iAENMNRh;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id qk9so51780709ejc.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 03:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B9SolUm4XFTmtl8KyWu3sHmSsa8W6zjtI5T2alk4xyA=;
        b=iAENMNRh/L9hwbgrjv2TSGwVSWwSC3nLfTBxNu6h2/3rpcGl5wQGdqRslqi7yrFJCC
         /FSRN/SlXbixrxBkAgXKTK8pnufIeo87s8ssXi4xpFiM1LAB6kBeb14x9rtZWla3wDl8
         +ZbYBTtCLKLolpeRZOkX3WxIwNzbFP+Pq4HkaiyXOA8l8kqEYvKnyIuTQqrBacK9SGiy
         xHWocbXTP5Q7iuN2f5x8PSTDNlsGSGIemweLJwcMpHdusBZ9KAqkG1UMGrm7ovrJvF4j
         s9E7frq/dsDAUbihrkqEgwdMjvnRsPTjl9ofeFBEEUWv546WnOEQrWyafmuqP3AfY7z1
         zfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9SolUm4XFTmtl8KyWu3sHmSsa8W6zjtI5T2alk4xyA=;
        b=HfIy+wxsGwcF+Ta6ad3iy7t/m2ympRz8zGIuVulw+KcZHFFrAWs4c3lFejtSSSdwW0
         CPF20+mlO/NcQrd2C8j8EheO5N66R7jTDt7GISmY4FC9FMMrY9saaDSTAOIMXQg0R1Q2
         VkoU//SDZn0EzYkwqqLiJymEM1LA2UcJW4LMsi4fO3Ef3ad/CsLSOSxZZKIiG6zy2Ato
         yakQEgilEAQmKohBudJ03Y2GsqsAaOLkuTcC03/dpdbtSPc2ZQ7A68Zeyw8hZsWwSUnD
         fYfWwBnli/GeagwIow3o57IvUdqIOLFhohyuHQ9uwOPzAx3Vk5wDBaUznwMdm0loDVdi
         swNQ==
X-Gm-Message-State: AFqh2kqt04Yn0s7ZjpBTOI3WrPl0HafRhNkKkCQrCTw7ZG1E8VkRDrSt
	rmSaAeadczfe+P38k1Me8Ixu830bekU=
X-Google-Smtp-Source: AMrXdXsF6QzqtFFCwXfD92yA7PNjHhQEtjKVnmQiLgH9/6GqLsrOAObjWAa91Hv0hW4kli/VPwtdgw==
X-Received: by 2002:a17:907:c007:b0:7ad:f165:70c2 with SMTP id ss7-20020a170907c00700b007adf16570c2mr93700229ejc.27.1673610812220;
        Fri, 13 Jan 2023 03:53:32 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id hq15-20020a1709073f0f00b0084c4b87a69csm8431086ejc.153.2023.01.13.03.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 03:53:31 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 1/2] rust: Upgrade 1.66.0 -> 1.66.1
Date: Fri, 13 Jan 2023 11:53:18 +0000
Message-Id: <20230113115319.20746-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 11:53:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175821

Changes:
  Added validation of SSH host keys for git URLs in Cargo (CVE-2022-46176)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Add patch to drop redundant CARGO_VERSION
- Rebased

 meta/recipes-devtools/rust/{cargo_1.66.0.bb => cargo_1.66.1.bb} | 0
 .../rust/{libstd-rs_1.66.0.bb => libstd-rs_1.66.1.bb}           | 0
 ...t-cross-canadian_1.66.0.bb => rust-cross-canadian_1.66.1.bb} | 0
 .../rust/{rust-llvm_1.66.0.bb => rust-llvm_1.66.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.66.0.bb => rust_1.66.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.66.0.bb => cargo_1.66.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.66.0.bb => libstd-rs_1.66.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.66.0.bb => rust-cross-canadian_1.66.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.66.0.bb => rust-llvm_1.66.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.66.0.bb => rust_1.66.1.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.66.0.bb b/meta/recipes-devtools/rust/cargo_1.66.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.66.0.bb
rename to meta/recipes-devtools/rust/cargo_1.66.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.66.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.66.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.66.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.66.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.66.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.66.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.66.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.66.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 6f1df4561b29..22e97174a98c 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=${RUSTSRC} \
             file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c"
+SRC_URI[rust.sha256sum] = "07ac4e6c93e0d8ecfaf3b86c4c78bbbde3f5be675f0334e7fb343cb4a0b81ebe"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.66.0.bb b/meta/recipes-devtools/rust/rust_1.66.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.66.0.bb
rename to meta/recipes-devtools/rust/rust_1.66.1.bb
-- 
2.39.0


