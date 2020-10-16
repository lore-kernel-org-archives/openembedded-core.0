Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.11591.1602841247433073480
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qldn6vt0;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id o18so1630131edq.4
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PJasHjXcjl8fiUp8aDnawsJfvWdcdx+7bFjpgGByTmc=;
        b=Qldn6vt007mS/Ba0RMN47fiV1XIj6ir3XyqWoRrM4iSSXNqrlI8h4XiFW3MOe0gMSf
         vszvEuBbTdThtz2XiarFICxITpSKiE1eO8TSnIFvLkbg/2c315GO1B4ecaFBn52FqLD5
         UKza6bse8Hc7Vh8L4/cJLjXqhVdMaMGSH8yV4UfkY0tpSbZFyYIvDvvEed+stOo/Vpun
         2mcEhsczM1jCQHr7m0wqap5wFbwAhiiy36juNV/qkpKR6BKoSGVlj77CZszPd15RZ8Z9
         fI5y08WBuLTpKmpIBJ3SkSH7hptUiYJKJL+93YFkqe2VPtAmTKWSinFnGA/Ns1VioBI/
         antg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PJasHjXcjl8fiUp8aDnawsJfvWdcdx+7bFjpgGByTmc=;
        b=klGbI13f5YbAGq+rwkE51QDUsPOCUPPqlbdlsrTXxq0aXzyIgir0dS/T8Y9MzrkspT
         M8nszCbGNXIFTf+AGAQBTdcfkl4iDCz5YshhMcYWMJ7kip5C6sS9lC/HPWJDZJhDqr6r
         WDLsgMiY1hWKmJ5BSl385cKQD0as646VOAalfyObN5mZeQXnzaOq2fKWwm/v1Pb1KoqF
         Kh3dny+qK2wm5pCBQ6wfUnXCm7uCCYdS+iELxLzWiKWskOTOLqFlU2m/bLejme/yW7c8
         6iKK9DBAz329yzE/bazK+rNgAj3flXdTuF13XWrjMllNqiyLa/zQd6/NZdTC8b80ABL3
         Dq+w==
X-Gm-Message-State: AOAM530CENKHKD1/W2klIRlVK+zWoubar7ldXhJANY6iP4qzsWqI+iW+
	sVgP+ceLLkgetBBTbqJ9SR69MCwOVZs=
X-Google-Smtp-Source: ABdhPJwlhzXp6ZxC1KDR+TSnxhTEvR+eNd5n4SWz6OGTAGAqw+GcOgUs4H1HzvM+Ya0EJdU+GSf7iA==
X-Received: by 2002:aa7:c458:: with SMTP id n24mr2840692edr.189.1602841245412;
        Fri, 16 Oct 2020 02:40:45 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w4sm991752eds.83.2020.10.16.02.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 02:40:44 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCHv2] arch-arm64.inc: don't append _be to ARMPKGARCH for tune-aarch64_be
Date: Fri, 16 Oct 2020 11:40:40 +0200
Message-Id: <20201016094040.3865296-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* the _be suffix is already included in ARMPKGARCH with:
  ARMPKGARCH_tune-aarch64 ?= "aarch64"
  ARMPKGARCH_tune-aarch64_be ?= "aarch64_be"

  and then it was appended again through ARMPKGSFX_ENDIAN_64
  TUNE_PKGARCH_64 = "${ARMPKGARCH}${ARMPKGSFX_ENDIAN_64}"

* broken since:
  commit 08433cc58abf0cf3e42b22d20870a50287cfb8bc
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Tue May 26 16:10:37 2020 -0700

    armv8/tunes: Set TUNE_PKGARCH_64 based on ARMPKGARCH

* fixes:
  scripts/tune/log.fake-cortexa32.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa32) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa34.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa34) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa35.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa35) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa53.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa53) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa55.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa55) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa57.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa57) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa57-cortexa53.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa57_cortexa53) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa65.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa65) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa65ae.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa65ae) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa72.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa72) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa72-cortexa53.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa72_cortexa53) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa73.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa73) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa73-cortexa35.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa73_cortexa35) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa73-cortexa53.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa73_cortexa53) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa75.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa75) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa75-cortexa55.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa75_cortexa55) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa76.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa76) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa76ae.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa76ae) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa76-cortexa55.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa76_cortexa55) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-cortexa77.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa77) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-neoversee1.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_neoversee1) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-neoversen1.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_neoversen1) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-thunderx.aarch64_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_thunderx) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
  scripts/tune/log.fake-thunderx.thunderx_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be thunderx_be fake_thunderx) for DEFAULTTUNE (thunderx_be) does not contain TUNE_PKGARCH (thunderx_be_be).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

RFC because I'm not sure what the original intention was and
I'm not using any of these tune files (haven't even run another
tune/test.sh with them).

 meta/conf/machine/include/arm/arch-arm64.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 142342298f..eab3323ec6 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -10,7 +10,7 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'aarch64:'
 # Little Endian base configs
 AVAILTUNES += "aarch64 aarch64_be"
 ARMPKGARCH_tune-aarch64 ?= "aarch64"
-ARMPKGARCH_tune-aarch64_be ?= "aarch64_be"
+ARMPKGARCH_tune-aarch64_be ?= "aarch64"
 TUNE_FEATURES_tune-aarch64 = "aarch64"
 TUNE_FEATURES_tune-aarch64_be = "${TUNE_FEATURES_tune-aarch64} bigendian"
 TUNE_PKGARCH_64_tune-aarch64 = "aarch64"
