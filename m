Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39FBC5CFC1
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 09:44:59 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5939.1786787092669035537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 02:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e50kvTFD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956242332dso18911305e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 02:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786787091; x=1787391891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d3PqyK6n6PGz8HW4X0I4fExnlMHPrH7GR4gVTX6UAPc=;
        b=e50kvTFDJezmQiaC6DoBgWaDAkDNlceSZLJzZAuvTB+L3tzvWJ34oOCYK9tThQq/ja
         lZjv9L5tlNw7JVS7HS8LgLpvdm03ikMWyt6JWg1E8splLx+9ntpROwwXkXcmi15Mb23b
         G0F+tWE0WhvjN+1rojXRvloBZ/vBqFAkXjf9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786787091; x=1787391891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d3PqyK6n6PGz8HW4X0I4fExnlMHPrH7GR4gVTX6UAPc=;
        b=ktkm6IZHxnxAN+yIb5PWIKADty8IhzFLvzpGXSRfWybfRKnP1BNkw2DWaXWkf/Fq9r
         R78gbFqq7S8yOvz+jgoSIEusP8FnY8ciC9QUFjBgTExon7+gT7lPrsjaJeYydmdUuWBQ
         H9dyATceShKnOjzwBRoUioX6PEoOeZWtyF6AoM7Tzkxs9EI+RgbMnFy14iU1ADrfmlPS
         2jNwR0XqGvSBCfSBPGkxUPM+RKCC2Kgx7scbQnuQWtczf4LOlD9y1Lf8AClTQKhvICKQ
         sQtG9ilxniaTsn7ZM5sD93HH5Hg48jWMRKPx/8OCV1FaIx6tlXpcXN4oFN6fILdlFY63
         iRHg==
X-Gm-Message-State: AOJu0YyzB0D+J7x2YaZ/+Z6G4YW8HPI1gsSeXIOxhOCO7PJfv2zwJ3Pg
	uE1d+n+dolYYCwB+lYcXNZMFVM8NnLpVywxRfjoHLHLkxa6WHW53nUtjgxAcoJYX08z3EP/oxb0
	7x8j+r6Y=
X-Gm-Gg: AR+sD104ijO73VUQ4gSKki2vZ5uME2X4cwcI7Wy39/Vqr8vhtCVix+G8Ks4qIzJuOI0
	BdsdObU8UjHOWxHHNT3doOK+pkE8vl1DQs56J9SmBEeKrNx5lQ1HHSw6Ej7HFqg/ihTpU2Wg3nj
	VAuMV+9sIf+codROkIteHBDbJxHKGe4nXLeXSqQQRYg0HmF5DAmBK8BF6iyX3NSOkoyRx2Fsac8
	zzH1Rwp5sUjh4gOOVZbB3vGieEc61+mcd4fz/S4zc3seljwcIh3SsEc5ilTQWgDk2tAbw6KqoEo
	0ja0snPT+aMltSqv8Dev6oNa0SX+oHyPiuI7jDsUC5pYVatqhUMGRIxD5IfFbAwt1mryazPWF2M
	+syfOoAOb13YiYdGCKx4/ao7M185dgITpdabfqnAXziygkwD9abXeaGLOQw/5n5CnkMO9YiTjft
	Ys9NzDwmN8yFeY0T38OiuYONJwvIxE1Yzf/QBGBW/Sx+5SivSsHzLgKAIFg7zYCuIycV9s5Yedw
	rfoXoLuEvN918i8EGYPfHXjcaM=
X-Received: by 2002:a7b:c4d2:0:b0:499:8191:62c7 with SMTP id 5b1f17b1804b1-499879b38dcmr136558105e9.18.1786787090506;
        Sat, 15 Aug 2026 02:44:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:76a9:d146:8f01:f2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998777d428sm77233055e9.0.2026.08.15.02.44.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 02:44:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meta/meta-selftest: Further trailing whitespace removal
Date: Sat, 15 Aug 2026 10:44:48 +0100
Message-ID: <20260815094448.3475188-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 09:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243477

Remove some further trailing whitespace

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-test/govendor/go-vendor-src-uri_1.0.bb        | 2 +-
 meta-selftest/recipes-test/postinst/postinst_1.0.bb       | 2 +-
 meta/classes/go-vendor.bbclass                            | 8 ++++----
 meta/conf/machine/include/arm/arch-armv4.inc              | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb b/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb
index 6f0364b7dae..481aca71ea1 100644
--- a/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb
+++ b/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Selftest fixture: go_src_uri parameter variants"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302" 
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 # Parsed via tinfoil for its GO_SRC_URI_* variables only; never actually built
 # (it has no real SRC_URI, so do_go_vendor would fail).
diff --git a/meta-selftest/recipes-test/postinst/postinst_1.0.bb b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
index b936c4f44be..27ed201365e 100644
--- a/meta-selftest/recipes-test/postinst/postinst_1.0.bb
+++ b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
@@ -60,7 +60,7 @@ pkg_postinst_ontarget:${PN}-delayed-b () {
     touch ${TESTDIR}/delayed-b
 }
 
-# This scriptlet intentionally includes a bogus command in the middle to test 
+# This scriptlet intentionally includes a bogus command in the middle to test
 # that we catch and report such errors properly.
 pkg_postinst:${PN}-rootfs-failing () {
     mkdir -p $D${TESTDIR}
diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 5bb4e8e876a..538b7cec67e 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -5,14 +5,14 @@
 # Handle Go vendor support for offline builds
 #
 # When importing Go modules, Go downloads the imported modules using
-# a network (proxy) connection ahead of the compile stage. This contradicts 
+# a network (proxy) connection ahead of the compile stage. This contradicts
 # the yocto build concept of fetching every source ahead of build-time
 # and supporting offline builds.
 #
-# To support offline builds, we use Go 'vendoring': module dependencies are 
+# To support offline builds, we use Go 'vendoring': module dependencies are
 # downloaded during the fetch-phase and unpacked into the modules 'vendor'
 # folder. Additionally a manifest file is generated for the 'vendor' folder
-# 
+#
 
 inherit go-mod
 
@@ -87,7 +87,7 @@ python do_go_vendor() {
 
         destsuffix = fetcher.ud[url].parm.get('destsuffix')
         # We derive the module repo / version in the following manner (exmaple):
-        # 
+        #
         # destsuffix = git/src/import/vendor.fetch/github.com/foo/bar@v1.2.3
         # p = github.com/foo/bar@v1.2.3
         # repo = github.com/foo/bar
diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index be5761fb20b..918996bb094 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -4,7 +4,7 @@ TUNEVALID[arm] = "Enable ARM instruction set"
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
 TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4${ARMPKGSFX_THUMB}', '', d)}"
 # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
-# maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does 
+# maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does
 # checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
 FIX_V4BX_ARMV4 = "${@bb.utils.contains('TUNE_FEATURES', 'armv4', '--fix-v4bx', '', d)}"
 FIX_V4BX_ARMV5 = "${@bb.utils.contains('TUNE_FEATURES', 'armv5', '', '${FIX_V4BX_ARMV4}', d)}"

