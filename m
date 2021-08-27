Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.9384.1630076749944383564
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 08:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H8IGxeCN;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id v123so5904450pfb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 08:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XmZ8PI5K2ssJYGCXm2judbX9C7BLgC1J2PZVQMTX4V8=;
        b=H8IGxeCNN8LFu9PgX9zw4k1BBmf6hBgF3SjtCivyxM3tf6wPlSZpu1/YYm0q9WrMGi
         D2FxT7HO/dn2sx9Nls3flvy9bYB74hH1YRlumbNdb7j68NB+aMwe5iGR6USocmZPl9Kc
         Ah82bypzhwWYEKJ8kh9AVHEbssBO9L324oqkcQEpBJhPUMhWSSTUajPbfaH3GgNc6qe8
         IHeHVDZEPcBFMl2QdY32at6Uwc8Y9ar0eZi6fFO33djy3uwExCfnEOu94SrPcHzhX6OE
         axZnM4+6r7D49N9SM20RHmtrSqr/5wqziE+ZAIKUgoUYHA+bsJTh1l9dcPcVnef1/zK/
         PsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XmZ8PI5K2ssJYGCXm2judbX9C7BLgC1J2PZVQMTX4V8=;
        b=Wb5eeveys+U2DOI1CvtahjzOZJmf+0Gs8xwK0oSYLWbQsdmfq6/UlDP/j9SOuU6PTx
         x46GgsxlkNcG3Jpua81El/8t9fL4SyWIvFdJXFPIPGaVHE3RTXdvD6TPuslmmUb9GaJP
         5vHap/CVoiJjqpp/vemta/O+4WwOdpbPCwWE2UuwppBmPNOR3tNqXL4NmUlHNIWweC9l
         /+tKdYWED1VITgpwAQH+BoLBTOScW/LggP9ge7cUI8ZgAXy16g/OXd0ZWhNcDluNOA4e
         WLDUeTOkeCHrR4flLCCl68hRacqpsoCt51A07IxnnthpQafaoeZEa58SfYx072tejkKq
         kDEg==
X-Gm-Message-State: AOAM5323h4CHtdJYJyx/tKBjmVfICb2Jg3iOHvkiTK3TJ9dS+BC+u2OT
	m1+G+i+Iy/xkVwO+6VIxMo8l92lKMiQ=
X-Google-Smtp-Source: ABdhPJzMHVm4OPVcZcMSHh5wSbfY47sOXMMLL3FBq3FoXXDpXb1Ws9dnMUmZ6VgAjR6yb7yp0wJc8Q==
X-Received: by 2002:aa7:90cd:0:b029:333:baa9:87b7 with SMTP id k13-20020aa790cd0000b0290333baa987b7mr9475863pfk.23.1630076749119;
        Fri, 27 Aug 2021 08:05:49 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::47f3])
        by smtp.gmail.com with ESMTPSA id r10sm6465719pff.7.2021.08.27.08.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 08:05:48 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH] rust-common.bbclass: export RUST_TARGET_PATH
Date: Fri, 27 Aug 2021 15:05:45 +0000
Message-Id: <20210827150545.2924074-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running 'rustc --print <foo>' in -c devshell environment
the target specifications are not known, unless the
RUST_TARGET_PATH (absolute path to rustlib/) is defined.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/classes/rust-common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 8bed60f2ce7..e1bc0193c3e 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -8,7 +8,7 @@ RUSTLIB = "-L ${STAGING_LIBDIR}/rust"
 RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ?= "libstd-rs"
-RUST_TARGET_PATH = "${STAGING_LIBDIR_NATIVE}/rustlib"
+export RUST_TARGET_PATH = "${STAGING_LIBDIR_NATIVE}/rustlib"
 RUST_PANIC_STRATEGY ?= "unwind"
 
 # Native builds are not effected by TCLIBC. Without this, rust-native
-- 
2.30.2

