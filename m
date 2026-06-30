Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD40DC44508
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 21:04:32 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31375.1782853469077652625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 14:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dfUCNGJb;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e94c26f9e0so2101146a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853468; x=1783458268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waIApA8CKoqWc6fn9yVioceYwa5ih4oqavBz9ivHhtQ=;
        b=dfUCNGJbLajohNrGkTYWzA5Ii34ttH+z3jgu6iW4iNHRhNdMzLJOB8tj+QCxvFlA5U
         17Bx2mCbivDlNuuV+mTWUdRGfnLRVXzbiT3iMPwn+vYMziqWtu8AUFoF4nliyeMfvvfk
         gDQOxcW3FF7BzxDHe2s9egfPk3upEjmws5G8ZnM/2V/cb2p9D+7VwD3fEQ1Cbyde+f04
         zbT9qMb3rGWSgczHdaR4F6l7XOCjVvIPmZkvXecHkEiwv4r1E/6sZfruYK0wNP+FQ2Q0
         EbiIVFIgCnDrR800cnV8zC9O8qhu5QU+s6oPzF9ElokJy3TTRc3Kau90G2qemDXsZ0vM
         NVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853468; x=1783458268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=waIApA8CKoqWc6fn9yVioceYwa5ih4oqavBz9ivHhtQ=;
        b=DRHPwxL8PxIytAYa5rsFiDVMXak93cK9IaaejM0UZ+IWEw+x5D0rYCaCYR4dy0Oj2C
         Uj7zBUUmc3MAQGI0StBo5MA10wGzmQLGxQ59fqrRCer3GuDK2j+2OnOSM6GkiNbE4aEL
         9Q2z+QtQLl/oxRe+6ROcSpALJsyuei9p53a2Ih9IBfMO60v7UNeWXHeP7XpjDWM8f4i+
         vTCKBWdKBI/h2CNtKt8VdYMF7rMM6yFz+oh0+GDCnBJdPuxjDKzSfFmX/I+y4AgnroAG
         DHt2noA515BKb22aV7RL3UpMj+3J4Vp5WvCUUnxBVcFQd+/uLts7AmZPpnn6lK6dTGHZ
         kCkg==
X-Gm-Message-State: AOJu0YyjlmZuiNeCwoXLnu9hR4+g41ZAmjWPdK3QP60BblUDbXi7WwQh
	621pnQH5oa4aw0F/iv0rL8JZ8qEDHow9tTpwOiJVpK/h0MPj07iJcyG4qjWYlA==
X-Gm-Gg: AfdE7cnDQRui7hQRIdB28tRiAbj43lsaIp02MrnLd08yClbvK3BBotJg9lGloMG+BDd
	m2YAy3vSqnG+1S25yI0CkwdGMUgRdUGRgmJ/tc3ryhltidch5YUTBcWkhybxYCTzxD6HD4Q+mXV
	BUHRRGdfusPVZULdcTxuqFnfYKRwmqDwuHlhWATQbUbfgDeotLbV+bzeAMseYtxzwntq6uIydWZ
	Zvi/o7d1vHI+s82kfPjtkEn+6SenfTXUT41YxazWSYdJbeA0xkQ+WbSa7Aa7fOk1K86SpKk/IwG
	veixrnP41c8EYKmKiP+XitIHR35DiswekCofxpyfv0YWT0biJsUD+r79vRC007BDwx+ksAwbLkk
	7rslhq43dDgUSF0o0seZoq+bFfoKD+BVvFmsCemgqu8ZVhDyKx5DojVTwrRlgH/mwR2U6sVHnt2
	Eh3SQcoupEDvEfzy+nCHjE
X-Received: by 2002:a05:6830:411e:b0:7e6:d384:459e with SMTP id 46e09a7af769-7e9ec587146mr4355613a34.3.1782853468153;
        Tue, 30 Jun 2026 14:04:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::3cfc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebfd01cdsm3248143a34.8.2026.06.30.14.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:04:27 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 05/10] Add SPDX deploy tasks to various recipes
Date: Tue, 30 Jun 2026 15:01:39 -0600
Message-ID: <20260630210422.1903245-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630210422.1903245-1-JPEWhacker@gmail.com>
References: <20260624141706.2164567-1-JPEWhacker@gmail.com>
 <20260630210422.1903245-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 21:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239920

Adds SPDX deploy tasks to many recipes to record their output when
consumed in an SBoM

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/barebox.bbclass             | 1 +
 meta/classes-recipe/devicetree.bbclass          | 1 +
 meta/classes-recipe/kernel-fit-image.bbclass    | 1 +
 meta/classes-recipe/kernel.bbclass              | 1 +
 meta/recipes-bsp/grub/grub-efi_2.14.bb          | 1 +
 meta/recipes-bsp/opensbi/opensbi_1.8.1.bb       | 1 +
 meta/recipes-bsp/u-boot/u-boot.inc              | 1 +
 meta/recipes-core/systemd/systemd-boot_259.5.bb | 2 +-
 8 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
index 2411fb5caa..60437c1ad1 100644
--- a/meta/classes-recipe/barebox.bbclass
+++ b/meta/classes-recipe/barebox.bbclass
@@ -158,5 +158,6 @@ barebox_do_deploy () {
         fi
 }
 addtask deploy after do_compile
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index ce9d008aac..35c2499bdb 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -164,6 +164,7 @@ devicetree_do_deploy() {
     done
 }
 addtask deploy before do_build after do_install
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_compile do_install do_deploy
 
diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 448a88ccb1..02dd245d97 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -248,3 +248,4 @@ do_deploy() {
     fi
 }
 addtask deploy after do_compile before do_build
+SPDX_DEPLOY_TASKS += "do_deploy"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 50cef17f69..8d0cb91688 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -842,6 +842,7 @@ kernel_do_deploy() {
 do_deploy[prefuncs] += "read_subpackage_metadata"
 
 addtask deploy after do_install do_populate_sysroot do_packagedata
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_deploy
 
diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
index 6354b43989..e535d99710 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
@@ -97,6 +97,7 @@ do_deploy() {
 }
 
 addtask deploy after do_install before do_build
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 FILES:${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
                ${datadir}/grub \
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
index 0a9652c283..93646a97df 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
@@ -45,6 +45,7 @@ do_deploy () {
 }
 
 addtask deploy before do_build after do_install
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
 FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index a75948dfc3..acc2bf9819 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -471,3 +471,4 @@ uboot_deploy_spl () {
 }
 
 addtask deploy before do_build after do_compile
+SPDX_DEPLOY_TASKS += "do_deploy"
diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/recipes-core/systemd/systemd-boot_259.5.bb
index aa5e57d3dd..9e61dfa3c6 100644
--- a/meta/recipes-core/systemd/systemd-boot_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_259.5.bb
@@ -69,4 +69,4 @@ do_deploy () {
 }
 
 addtask deploy before do_build after do_compile
-
+SPDX_DEPLOY_TASKS += "do_deploy"
-- 
2.54.0


