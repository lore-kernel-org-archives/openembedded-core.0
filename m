Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD7AC25B0E
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.6700.1659705193015844321
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P6ctC4t3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id z16so3172332wrh.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=8375xG5KIqTBCOvn00jcoIS+CjFWQyKYw8uzqmJ+4kU=;
        b=P6ctC4t3sr2qo3an4tMMqKbZosuMk60ZNk3eDfbhQAWv7kqZSRmgOC8hC6l27XJMan
         4Fq7n7pAsrpLVpWjxm1+2OrXYQdV5BRAw0Q9R8+PKaqbl5EQuk2JybCrjmpmjvaGxK7B
         dOjgLHgg8/KskQEhDBwsgtjOIYyVSaRkGeRVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=8375xG5KIqTBCOvn00jcoIS+CjFWQyKYw8uzqmJ+4kU=;
        b=SjVWuLg0kVWaznIRkyvH0/70+g/ztFQAtt6RcTtVKCDSQTGHR6qlOAPAZs6mEOm7L7
         m9GQc9vpXFtDc9N/+Jy2POrlen89jcO/0H1IvfcpzS78Eci8jjNqTaBqxXQhN3oqo5zP
         Vnx+/eKg5J3aB1grCMIiEcpo46cbpls7yk1c2Ey7Z/lhnvQnbqT8SEMFH6Rsi6gOWGYH
         sJVzn6RoMDoRuH/DVCZXcjxynZ/uQTcdXJMK9gjkMoOziFa7EIpBYW26WyONSPb4mh56
         C7PNOl3mDmEd6p+vUvxMq1229XJM4TNj2Nf20rXYhxh6/9/uUcmztm8KfaIlmd+tVuOy
         gBng==
X-Gm-Message-State: ACgBeo3ETyK9UNxuN3WKEyGMw62MJ/Da1CqxyRcLRJnTmTIe3k54NxPr
	+kMVgV4+FDkq0I38j4xAbitS4xTwegDu9A==
X-Google-Smtp-Source: 
 AA6agR5QlS2hBtO/hrYoYm3NYzzTwfKs1TCVy54KknwjdlgnSasr/oT9x8T/zjUt8NmFPJ26KUTcRg==
X-Received: by 2002:a5d:6241:0:b0:21e:f97f:d0cb with SMTP id
 m1-20020a5d6241000000b0021ef97fd0cbmr4376017wrv.37.1659705191178;
        Fri, 05 Aug 2022 06:13:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/29] rust-llvm: Enable nativesdk variant
Date: Fri,  5 Aug 2022 14:12:41 +0100
Message-Id: <20220805131252.3706794-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168952

The allow nativesdk variants of the tools to build, enable a nativesdk
variant of rust-llvm.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-llvm.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devtools/rust/rust-llvm.inc
index 9baad12dc8e..625eb570416 100644
--- a/meta/recipes-devtools/rust/rust-llvm.inc
+++ b/meta/recipes-devtools/rust/rust-llvm.inc
@@ -47,6 +47,13 @@ EXTRA_OECMAKE:append:class-target = "\
     -DLLVM_CONFIG_PATH=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config \
 "
 
+EXTRA_OECMAKE:append:class-nativesdk = "\
+    -DCMAKE_CROSSCOMPILING:BOOL=ON \
+    -DLLVM_BUILD_TOOLS=OFF \
+    -DLLVM_TABLEGEN=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen \
+    -DLLVM_CONFIG_PATH=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config \
+"
+
 # The debug symbols are huge here (>2GB) so suppress them since they
 # provide almost no value. If you really need them then override this
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
@@ -68,4 +75,4 @@ FILES:${PN}-staticdev =+ "${libdir}/llvm-rust/*/*.a"
 FILES:${PN} += "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.* ${libdir}/llvm-rust/bin"
 FILES:${PN}-dev += "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${libdir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/cmake"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


