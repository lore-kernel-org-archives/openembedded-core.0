Return-Path: <Yash.Shinde.oss.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF55CD4F5E
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 17:22:32 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4215.1779211350242380826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 10:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ijHzIwO+;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: yash.shinde.oss.dev@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bab2548e8bso16901555ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779211350; x=1779816150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrzUZ2mNVnSNjY7EY+NfKgDf+5II+VeTZR3ClfAMLBE=;
        b=ijHzIwO+AcBsRGi/02dZr4JNmrt3qi6nlQEjz1Q8429qHA84MwZlAwdHAxKc3vuwpZ
         VVBWCRUotWn7thnHR92s1FPawd+agZOn5EzdtnRbAfNzY8D8Hi8mMZ2c0+S0BJiTw+0i
         yWspBCJZGCfceNjAz+B0dH5Hji68NK6MxNfyd7AUjXvG4flMHf7ALyr5Z7O9PC0YYB/Z
         GkdhlipfQ9884n2n/iVfAn1ItPWA+Vfn37tBI5wdKd2/DmvcINAXr68DkJEVRovXr5Rc
         puN8vm52w85x6yyxBhpsWeV/XGtrW6jgW1DHANpBMS2RLbAV/n7kGRlwVg62nxO4XA95
         RRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779211350; x=1779816150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qrzUZ2mNVnSNjY7EY+NfKgDf+5II+VeTZR3ClfAMLBE=;
        b=fQOpGzr5s37Kmampy5mEHMfoVwTHLpLGN6ExPw3MKw/r+MCF6RdJk++HTa2qV74nNt
         ot2fFKJXkr5IsDxy6zIBpsaONzIH4cmxD84F3Sp8KOru73yUVPravBFlY6MbNeoPpkQB
         zpyQsLt2JfVG5cRDkpPbnNkvhcbjAy+LEPJbGoxO2dPt6HOJAzrxZkiveRFHl2c0AYk0
         WddCZGy5uwqlsOgtIOlgM4oYoQucnfOmb7ZZ1EaBoFtmgt901l1oJTLKiFny8upcsBpr
         5AijC/Zp+UF3I1VJhagisEE76k4TEe1LMsAZoKjrv4Fhl1d3cEs1hgTEg2BCDQtba8an
         R99Q==
X-Gm-Message-State: AOJu0YwU4uCJ8w980/cxNqlAsBNHWX6B3tp9m/NkaIjjJZxIkPvYuUqB
	ja36rd4RhkHn2KcBEgOXWl6noStp1ZhLUsfBJzkRe8uzkG+DrClC4nTk2Kb5sH7B
X-Gm-Gg: Acq92OGgq8ndzkAG0r1gK5lW4BDK6UUj9C9UuLUcTwCWMZn8KO1EzOzMVu3Tlks1hNo
	Uec9+y3/nwVS8eiTz/w+/irmHdEq27p/imBQGn738AHYA11cyu7gN2Z8jnChpcmwmTYLomaaWHe
	s3EOSKTxjINyoVLefj2HHGbGfT3+ZVgHX2b/WH/KrDIyE8Md8o/dj4Xt7jECPF/qUhF+ZgxK+h6
	RdzOjlupeKbL5zgWY/6d2ilX8DSnLDIHLNcZxhHw/6o1R/LZ/qG41DQCsG4weAdRmPtEsSd4joG
	Zt70WMOVEduQOXGqLronEahLwa1fhfJDcPuAMBqpb/jPkQL8wtyBbNAOajhhDMRfxPFyzE/0YV7
	2UAlNqeM+xDMqc97DLeqq/yPdeG2G8/JE9hK5cqGSJFpkCG1PQlhUtLYm0WYevUXk7a4kUm8zD6
	wD/nZuBHjDeSysENSIHfddlppkugTAW0Rpe058cqJYT08pAslkoG5aQizboA==
X-Received: by 2002:a17:903:3d47:b0:2b0:5795:9ead with SMTP id d9443c01a7336-2bd7e410cd1mr152463605ad.0.1779211349555;
        Tue, 19 May 2026 10:22:29 -0700 (PDT)
Received: from QCOM-V9bhWph2GA.qualcomm.com ([103.172.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bdc58575dfsm107910735ad.20.2026.05.19.10.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:22:29 -0700 (PDT)
From: yash.shinde.oss.dev@gmail.com
X-Google-Original-From: Yash.Shinde.oss.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
Subject: [PATCH 3/7] python3-numpy: upgrade 2.4.4 -> 2.4.5
Date: Tue, 19 May 2026 22:52:01 +0530
Message-ID: <20260519172205.274641-3-Yash.Shinde.oss.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519172205.274641-1-Yash.Shinde.oss.dev@gmail.com>
References: <20260519172205.274641-1-Yash.Shinde.oss.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 17:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237339

From: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

https://github.com/numpy/numpy/compare/v2.4.4...v2.4.5
Release Notes: https://github.com/numpy/numpy/releases/tag/v2.4.5

Signed-off-by: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
---
 .../python/{python3-numpy_2.4.4.bb => python3-numpy_2.4.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.4.4.bb => python3-numpy_2.4.5.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.4.bb b/meta/recipes-devtools/python/python3-numpy_2.4.5.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.4.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.4.5.bb
index a8995b08df..56446eb666 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.4.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            file://0001-python-sysroot.patch \
            "
-SRC_URI[sha256sum] = "2d390634c5182175533585cc89f3608a4682ccb173cc9bb940b2881c8d6f8fa0"
+SRC_URI[sha256sum] = "ca670567a5683b7c1670ec03e0ddd5862e10934e92a70751d68d7b7b74ca7f9f"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"

