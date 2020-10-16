Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.11687.1602840413633327926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WNE3v49f;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id h24so2130193ejg.9
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=alvaXQ+KB52H0IEGs06EJfUZu+cv53uHoTpVUNyqOdk=;
        b=WNE3v49fTMEL03fgZtqyOznp5TWGYxKYHT/zA+Ahb386WYFCAhpOpPEy3SvxDjq83w
         3d+TNaWt4IuQy5/4MUnaGZiu+BAw6K+AQPrgLhrnlUICW8Tq/7nGCSXren/RVNCfXhAr
         g4AwalOrkRbm1uYxve+bTwzwKshGuGUkL3CLRlHMhqAW3F5O7KagCguw04Fj1g0L/zmt
         QE+XPBseivvaDe0a7MOXk6pji6vra2TU2S12Qu7hBrN69CM4PnKGGfUNBbuU/nBsAp7L
         ommrAPXBzUTszR79mG4YwfWIJ557TmSuI5qC5+8zBdj3tBYYkoQeKlby+WwCai/RvXEv
         4mQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=alvaXQ+KB52H0IEGs06EJfUZu+cv53uHoTpVUNyqOdk=;
        b=IRDgzv8LR9H9MPOzQGbtSs1mGoJqyJe91g0bjiBOA4VcnqfVs1wWThgyaKsc8PTzFO
         6q1bc6sfa+0S419dtWuxKtm2r0uPr/AiYeB3Aw9j+/seh0F1lL2SKQYvyuHL9cfo3KKr
         Lt0bCotQsVo7lmsWhIlqxHdq50Yb6X5WKCqfCuLOiOUle/UrASfD8zN6eIeEjSgRNHv4
         OzetKviiJLgK4WbtCcLee597VrfqQSmr8SZn2KQD5RqwMgH5AroP7OaANtMhWPb2vYFs
         SE4HxqMAN0hspcGNz0P1Pd0piBI45vs+bofEn9KV0Ad3mGNyz6n0HsMWaS9FugNbVJ5P
         n8YA==
X-Gm-Message-State: AOAM5330ygMHNGqJ5iifxKXnxEiwpjQeqZajuBor0HGn029/bBqq2uEq
	Sc1oveZ3bg5TLEyr+79COtnjDyt38iw=
X-Google-Smtp-Source: ABdhPJwopVpZmE2oFV2yIrkX/p3qcW7xHL7nTFu1Sk8FZANN+fMlWespi+sIMzofwmTcTcX0zvFuuw==
X-Received: by 2002:a17:906:c43:: with SMTP id t3mr2650303ejf.219.1602840411784;
        Fri, 16 Oct 2020 02:26:51 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x22sm1155438ejc.102.2020.10.16.02.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 02:26:51 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH][RFC] arch-arm64.inc: don't append ARMPKGSFX_ENDIAN_64 to TUNE_ARCH/TUNE_PKGARCH
Date: Fri, 16 Oct 2020 11:26:41 +0200
Message-Id: <20201016092641.3860384-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016092641.3860384-1-Martin.Jansa@gmail.com>
References: <20201016092641.3860384-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* the _be suffix is already included in ARMPKGARCH with:
  ARMPKGARCH_tune-aarch64 ?= "aarch64"
  ARMPKGARCH_tune-aarch64_be ?= "aarch64_be"

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

 meta/conf/machine/include/arm/arch-arm64.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 142342298f..499318241c 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -22,8 +22,8 @@ PACKAGE_EXTRA_ARCHS_tune-aarch64 = "aarch64"
 PACKAGE_EXTRA_ARCHS_tune-aarch64_be = "aarch64_be"
 
 ARMPKGSFX_ENDIAN_64 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '_be', '', d)}"
-TUNE_ARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
-TUNE_PKGARCH_64 = "${ARMPKGARCH}${ARMPKGSFX_ENDIAN_64}"
+TUNE_ARCH_64 = "${ARMPKGARCH}"
+TUNE_PKGARCH_64 = "${ARMPKGARCH}"
 ABIEXTENSION_64 = ""
 TARGET_FPU_64 = ""
 
