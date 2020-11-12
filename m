Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.7880.1605202102242952917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 09:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=ghb5zSQF;
 spf=pass (domain: blade-group.com, ip: 209.85.128.51, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f51.google.com with SMTP id a65so6239581wme.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 09:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NvTlpTjD2uPnasUHLpQg4qCSkV4kDE8LjzWnJoCZHSg=;
        b=ghb5zSQFxRYxAJp5jYr1QYiiLlj7uqoG03QPaJU355GBcfSbrMK9L9AG1CoGE+J/PO
         JzXRLVVkE4GipukKcd+poma6w27w66xeWdBgqxCZzhSJIyRF4bn7KLamauK6EYmTuTOU
         3GLG3C7Y4NfAzv7LrVMyRPuHj2giIsYum+uutp55Rpj7VSHjp2BJhEhSoiuZZTugme78
         55U3/kOp3NXHNIVcqCrOLlsVXDBKs9LG1LNOuSU6JazMtkGqAel7qb/jrG1mTdpQ/pYO
         fD4uT0nTn/6RXqHih4tPErdsGGoH35VX9diHOCejV60ncXaqVIt16JcobHc/IsrOOCXX
         FWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NvTlpTjD2uPnasUHLpQg4qCSkV4kDE8LjzWnJoCZHSg=;
        b=AZsSfsWFn8xg9yl1Xlyf3WUvjKFs1TvKsCzFpZj9y2AFc3Ti2qN9MK4ai4m9wpZkMa
         5SJeFLLtuQWvEdp0+WIQuyV43knqkuLrm8lWU2iq3LKNnyCcRkCuVBeul+o0xgTSHSG8
         31Ub91Ixd8/GmtX+ZeBK6pZiyh+494rqZfA+aHC7K2AHOF8Cf1F23Do/uIk2wv0X5pkf
         O0r/P6yYIB2epoR24JKkOku6QQemem94rF42be3ZO7yCd1l/Khuj+a8CtBBf05qEbpxn
         uP3UwZxRJ2ZRO0iG7IX9lfUmYcQcrNuXlPdUb5ftnAEa4YcPX+adXVl/ZgYcS4umMGmc
         hBkA==
X-Gm-Message-State: AOAM5305IMaLMfIcMNLG8pLym/mxhJXiXofVmU4jkJ9EB1W6H9ZLC2sT
	qeDA3wqrXB2/nffEDSk9Om7yCBqw1HjV+g==
X-Google-Smtp-Source: ABdhPJycYy18bdgCk0yZkKyezlbMzEyG4YR1vU5yC291Y+EapQtYV2XKvgkw4c/H2bS8s3AplrgBKw==
X-Received: by 2002:a7b:c14f:: with SMTP id z15mr728074wmi.174.1605202100520;
        Thu, 12 Nov 2020 09:28:20 -0800 (PST)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id j15sm8198906wrm.62.2020.11.12.09.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 09:28:19 -0800 (PST)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2 5/5] systemtap: split runtime material in its own package
Date: Thu, 12 Nov 2020 18:26:16 +0100
Message-Id: <20201112172616.784945-6-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201112172616.784945-1-yann@blade-group.com>
References: <20201112172616.784945-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Note the _class-target qualifier, here to prevent a funky dependency of
systemtap-native on systemtap-native-runtime-native.  This possibly hints
to something deeper ?
---
 meta/lib/oeqa/selftest/cases/runtime_test.py   | 2 +-
 meta/recipes-kernel/systemtap/systemtap_git.bb | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 1bb1c4bee4..7189e4e6c5 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -384,7 +384,7 @@ KERNEL_EXTRA_FEATURES_append = " features/debug/debug-kernel.scc"
 KERNEL_EXTRA_FEATURES_append = " features/systemtap/systemtap.scc"
 
 # add systemtap run-time into target image if it is not there yet
-IMAGE_INSTALL_append = " systemtap"
+IMAGE_INSTALL_append = " systemtap-runtime"
 """
 
         def test_crosstap_helloworld(self):
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 74bf7cb35c..8dad5b15f0 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -36,6 +36,15 @@ FILES_${PN}-exporter = "${sysconfdir}/stap-exporter/* \
 RDEPENDS_${PN}-exporter = "${PN} python3-core python3-netclient"
 SYSTEMD_SERVICE_${PN}-exporter = "stap-exporter.service"
 
+PACKAGES =+ "${PN}-runtime"
+FILES_${PN}-runtime = "\
+ ${bindir}/staprun \
+ ${bindir}/stap-merge \
+ ${bindir}/stapsh \
+ ${libexecdir}/${BPN}/stapio \
+"
+RDEPENDS_${PN}_class-target += "${PN}-runtime"
+
 PACKAGES =+ "${PN}-examples"
 FILES_${PN}-examples = "${datadir}/${BPN}/examples/"
 RDEPENDS_${PN}-examples += "${PN}"
-- 
2.28.0

