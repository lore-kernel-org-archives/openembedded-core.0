Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A2BC88E42
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6447.1788939017290049919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XxwTcPpe;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d05d51553so31953995e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939015; x=1789543815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=35pAHGcfz7UHc1nksZQJw1xk7rZPR/HiqIJGUry6dxw=;
        b=XxwTcPpeo0g1O6vSL5Tun/3ymQVNcMryhD34hAI5h1NGGfFYHEBT79zZS3V/RHbvAo
         wK/sAOeg+IbCPsrDJ4dJIQkIyXtEPhE2cA6mkZyvmG9eGEcZrEjPMfuBl7pqtbIViiyh
         7am9NQ1yXOIdRwa+Z4UqtRmmUm7rNC06dtUtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939015; x=1789543815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=35pAHGcfz7UHc1nksZQJw1xk7rZPR/HiqIJGUry6dxw=;
        b=BOrWWsr4C30C03kmYMdK1PD5xVs7hoS7H+GaEPR8jA6HhMykRa+qqKFweBfXxEK0tS
         VSR8cWgVbqiXZMlqePol3Te3VIbrGG5zCFxuFAqx702eDu39iZZ1Q0zuRAqjPMTrdye1
         2G/hdbhNkC/Os+1QGebmxJ/aa0CKBhbckM9qcgO1DSCaQp4f7LSU3jY2oKjhY+eAVYyP
         6OyEuL67T3YZOK8PMEdDA8ZMW7DQoNWdfo0b9nDVoUxuOtgDKH67kHBnl9+hWwmePwoG
         Zg9pZ0uT5Ey0KW2DnFwf/9LyTyUSNd9/4+/4eNZlo2epRB3wxCmXiaH+6a+0xeTUIFd8
         Q5tw==
X-Gm-Message-State: AFuF++kPWMETu1IEx+RwV6KAF7jBufXqJEQ2r2TkCIpODiNWEABi5WdY
	hmFKeXZmJ4jUWqL17kwtbHJzsvgtXhG06j8Roqukb/w4hQ6QZOJAPW9Q552ii1yToS3NOt5yu+s
	DFx/liKA=
X-Gm-Gg: AYBFou2kFndkRUuYb1Az5W0B5Mg3ia1GTkdifXTiqITJ5gcE4bqULMZ/Pt8x+z+sNUd
	drw+eGdIf5T5hN29uNeCCf2pePgvAPmhuESKWKqAZMMlhW3IrjKV9DO6Hn5K0dZHfL99WKZXZ5m
	tv9Hlzv8ritwoBysY8Ev+jBDw2gt86vyKHrn2k1OK0lUp32nDu8Xhh3wXjvvfKrFxvauLqWuA0U
	pEPNOL721iMmRlI8G84pjneWYAOv3lWBuVvn4A4evU3HZd9elRjtWhQhqkH35DFQqW7e0hhN2fC
	4pfHkY9zmtAKrNWKs1TWRSRxXkjYyCvHw8KVS6r/YmiDC4Nyv5HABxVbZygW/6fBeVOmFBsS/BL
	/ihNoct1yhUXXZnJUzm1QPHAgAu9APJdGpDM4Uu57o6Ev422HgGcQ9vOnq9ioYcR3ejwigJp6n4
	63QHCaOJnNTX6Wqof0d5L0N9txLk6BsmcMQWxNYBiQx8+tM3psZMCY7rUL5NZ5toA4S4X6YTEPF
	j/UU/kOH6l1niZDcfuRI5hLLrp+p6RJ00fWqTR0j8o/xD/90/IFdFU4+ctbBM0XoxrCgauWr9Ub
X-Received: by 2002:a05:600c:1d0d:b0:49d:99c:3bd9 with SMTP id 5b1f17b1804b1-49d099c3fc9mr194483095e9.33.1788939015360;
        Wed, 09 Sep 2026 00:30:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 30/38] u-boot, u-boot-tools: Correct CVE-2026-46728 attribution for FIT fix
Date: Wed,  9 Sep 2026 09:29:29 +0200
Message-ID: <f1af38bc2ce232b80eea0d254c1cc1dfb1b3a3fc.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245439

From: Hetvi Thakar <hthakar@cisco.com>

CVE-2026-33243 is assigned to barebox, but NVD currently also maps it
to denx:u-boot. That U-Boot mapping is incorrect because the U-Boot-side
FIT hashed-nodes verification issue is tracked separately as
CVE-2026-46728. A correction request has been sent to NVD to remove the
incorrect denx:u-boot mapping. The existing patch backports U-Boot commit
2092322b31cc8b1f8c9e2e238d1043ae0637b241 [3], which is the U-Boot fix
referenced by CVE-2026-46728 [2].

Rename the patch and update its CVE tag so the filename and metadata
identify the affected U-Boot vendor correctly.

Apply the same patch to u-boot-tools because that recipe builds
fit_check_sign, which uses the affected FIT signature-verification path.
The bootloader recipe already carried the backport, but u-boot-tools did
not.

[1] https://github.com/barebox/barebox/security/advisories/GHSA-3fvj-q26p-j6h4
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-46728
[3] https://github.com/u-boot/u-boot/commit/2092322b31cc8b1f8c9e2e238d1043ae0637b241

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../{CVE-2026-33243.patch => CVE-2026-46728.patch}    | 11 ++++++++---
 meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb       |  4 ++++
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb             |  4 +++-
 3 files changed, 15 insertions(+), 4 deletions(-)
 rename meta/recipes-bsp/u-boot/files/{CVE-2026-33243.patch => CVE-2026-46728.patch} (98%)

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-33243.patch b/meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch
similarity index 98%
rename from meta/recipes-bsp/u-boot/files/CVE-2026-33243.patch
rename to meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch
index c7086e183fb..4e582d529ea 100644
--- a/meta/recipes-bsp/u-boot/files/CVE-2026-33243.patch
+++ b/meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch
@@ -28,11 +28,16 @@ Closes: https://lore.kernel.org/u-boot/20260302220937.3682128-1-trini@konsulko.c
 Reported-by: Apple Security Engineering and Architecture (SEAR)
 Tested-by: Tom Rini <trini@konsulko.com>
 
-[YB: Removed a skippable condition in fit_config_get_hash_list.
-	This flag is not available in this version]
-CVE: CVE-2026-33243
+CVE: CVE-2026-46728
 Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/2092322b31cc8b1f8c9e2e238d1043ae0637b241]
+
+Backport Changes:
+Dropped the FIT_COMPAT_PROP condition because this macro is not
+available in U-Boot v2026.01.
+
+(cherry picked from commit 2092322b31cc8b1f8c9e2e238d1043ae0637b241)
 Signed-off-by: Yanis Binard <yanis.binard@smile.fr>
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
 ---
  boot/image-fit-sig.c        | 226 +++++++++++++++++++++++++++++-------
  doc/usage/fit/signature.rst |  19 ++-
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
index 5e2ed063868..77e086815c1 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
@@ -1,6 +1,10 @@
 require u-boot-common.inc
 require u-boot-tools.inc
 
+SRC_URI += "file://CVE-2026-46728.patch"
+
+CVE_STATUS[CVE-2026-33243] = "cpe-incorrect: NVD currently maps this CVE to denx:u-boot, but that mapping is incorrect for U-Boot; the U-Boot-side FIT issue is tracked separately as CVE-2026-46728 and is fixed by the included U-Boot backport."
+
 CVE_STATUS[CVE-2026-29007] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
 CVE_STATUS[CVE-2026-29008] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
 CVE_STATUS[CVE-2026-29009] = "not-applicable-config: tools-only_defconfig disables networking; net/nfs.c is not compiled into u-boot-tools."
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
index 6d9bc126a16..9610d9e8fe0 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
@@ -3,7 +3,9 @@ require u-boot.inc
 
 DEPENDS += "bc-native dtc-native gnutls-native python3-pyelftools-native"
 
-SRC_URI += "file://CVE-2026-33243.patch"
+SRC_URI += "file://CVE-2026-46728.patch"
+
+CVE_STATUS[CVE-2026-33243] = "cpe-incorrect: NVD currently maps this CVE to denx:u-boot, but that mapping is incorrect for U-Boot; the U-Boot-side FIT issue is tracked separately as CVE-2026-46728 and is fixed by the included U-Boot backport."
 
 # workarounds for aarch64 kvm qemu boot regressions
 SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg"

