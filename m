Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A492C35FF8
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 17:17:41 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.58602.1742231857903289454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 10:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=USu2BcfL;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39143200ddaso2976392f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742231854; x=1742836654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exFxammm7h1GSlNHT0SgFjyNmwY3/hGCPPFbw4TLDZY=;
        b=USu2BcfL7z2NJ2Jx49ezG8CKn9mEbXS1r+YSri4QEkSfwjGTEzSXMV0Kwy1t8lEjMI
         iCKKqE3nPHglJ14tL0k61rRuITmHLc5HYcIMTuWJL1QnuBSsAeFkYZWiH6W0cNXaytK+
         VNSxqDrmx8a25r4p/5kpB1pvie2CUrNEDMmwwkSwaiLZ8T0U8ISsLENT1vfiV4qOkdiC
         hhT+sGcyNBCYbtKRLULclENWYaDw83zrPlg9uknTnQs1WRYUEZ3qmOcodw+Tl1+IyKPH
         G8pFG6EIV60pbl9w3cPQVP+HypOrH+3apZCJVlei5x2gV7d8G8smc1z8W2iyRi6oHBpL
         0w1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231854; x=1742836654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exFxammm7h1GSlNHT0SgFjyNmwY3/hGCPPFbw4TLDZY=;
        b=hW9FnVvWa8ThnsOPopZn0LSvSYmSglvD5ato1peGLjCr1ZaFr/grKV7GqWWtz9yzRU
         /jeaU4JW2OptI/yIc7W5NBTusT8EW7UsboA1kQYVpvAHlhn/Dn2gMU/AS2ipFX5vIa6w
         Kr56LAilSrEKaQkY2dQKKcw6W5uOVJqpRzsvxoamVcHPePHjSp9rJWmmTCn+aWQJTasc
         oB5I4bKJKBzQIMlBz5RFK1q7XNxt52gDT6OmdNQU/hJGNix0XdPpnB6jjzmDxVVTNVvi
         6VDmXHbJCbx9PrRw9ZBXCVdTpXTQmtEHLdn9KpMOTiMw33R0/zg1xUcM7eNxN7D7B31l
         zVsw==
X-Gm-Message-State: AOJu0YzRUYnLghxnjlZUpF3IMo4P+rGME5dFCEhsIbddUvtBFGcox7yK
	64J8Zag9qdkbqiHrSDSY8RSQ3qZG5WGqEzy1xfDM/ZIhR+jOEYt9ak/E1w==
X-Gm-Gg: ASbGncv71QifbyBfK0b4R/pFAvpZui82D7QFZoJv7xuPAlMsI/sXnGQORR+e9RXO/yv
	s00MgK+6NsBIHbGCdA+Jo9oWsQizPqL2Aqs+BClt54R6ZlJCyAYhLdIjoh0JKDEbi0Q92TbFwxS
	STzEGxe5z+jHF67wqF9vWmNK2UnbQfH2+OMp1JVsBV1f/AkOpbB6/VmcFSX3lK+GaUTJV5LsBV/
	w7OHb0fKspWgC/WawjSEZYkO53nalIMWeBMwzdlL7a3FIWLLcPzh+T6A4YOemTG/ahl5mTwkK3v
	mqL7halHowv5+lNXxQrlln03HULqMMe+DGkr1HL067sri6FxAOWxvZFB8ljld4ni0BQ=
X-Google-Smtp-Source: AGHT+IFTbuEmIyLYcQQslrB4phyBvepP3Q+54PCorVd5bM3yBMgNWx5SsKwB23GNJKtNRHJq6F3RRw==
X-Received: by 2002:a5d:6c63:0:b0:391:27f1:fbf8 with SMTP id ffacd0b85a97d-3971d1362dcmr12253634f8f.4.1742231853864;
        Mon, 17 Mar 2025 10:17:33 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c255bsm15255902f8f.23.2025.03.17.10.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:17:33 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 1/2] oe-selftest: fitimage improve bb_vars access
Date: Mon, 17 Mar 2025 18:13:55 +0100
Message-ID: <20250317171720.963083-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317171720.963083-1-adrian.freihofer@siemens.com>
References: <20250317171720.963083-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 17:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213120

Make the code slightly more robust by using e.g.
bb_vars.get('UBOOT_SIGN_ENABLE') instead of bb_vars['UBOOT_SIGN_ENABLE']
for variables which are potentially undefined.
This is a general cleanup but also a preparation for additional test
cases.
Log bb_vars in verbose mode.
Drop one no longer used log message.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 721628d8e73..666c4678efc 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -56,10 +56,10 @@ class FitImageTestCase(OESelftestTestCase):
         # Define some variables which are usually defined by the kernel-fitimage.bbclass.
         # But for testing purpose check if the uboot-sign.bbclass is independent from
         # the kernel-fitimage.bbclass
-        fit_sign_numbits = bb_vars['FIT_SIGN_NUMBITS'] or "2048"
-        fit_key_genrsa_args = bb_vars['FIT_KEY_GENRSA_ARGS'] or "-F4"
-        fit_key_req_args =  bb_vars['FIT_KEY_REQ_ARGS'] or "-batch -new"
-        fit_key_sign_pkcs = bb_vars['FIT_KEY_SIGN_PKCS'] or "-x509"
+        fit_sign_numbits = bb_vars.get('FIT_SIGN_NUMBITS', "2048")
+        fit_key_genrsa_args = bb_vars.get('FIT_KEY_GENRSA_ARGS', "-F4")
+        fit_key_req_args =  bb_vars.get('FIT_KEY_REQ_ARGS', "-batch -new")
+        fit_key_sign_pkcs = bb_vars.get('FIT_KEY_SIGN_PKCS', "-x509")
 
         uboot_sign_keydir = bb_vars['UBOOT_SIGN_KEYDIR']
         sign_keys = [bb_vars['UBOOT_SIGN_KEYNAME']]
@@ -145,7 +145,7 @@ class FitImageTestCase(OESelftestTestCase):
 
     @staticmethod
     def _get_dtb_files(bb_vars):
-        kernel_devicetree = bb_vars['KERNEL_DEVICETREE'] or ""
+        kernel_devicetree = bb_vars.get('KERNEL_DEVICETREE')
         if kernel_devicetree:
             return [os.path.basename(dtb) for dtb in kernel_devicetree.split()]
         return []
@@ -281,7 +281,6 @@ class FitImageTestCase(OESelftestTestCase):
                     key = key.strip()
                     value = value.strip()
                 except ValueError as val_err:
-                    self.logger.debug("dumpimage debug: %s = %s" % (key, line))
                     # Handle multiple entries as e.g. for Loadables as a list
                     if key and line.startswith("   "):
                         value = sections[in_section][key] + "," + line.strip()
@@ -377,6 +376,7 @@ class KernelFitImageTests(FitImageTestCase):
             'UBOOT_SIGN_KEYNAME',
         }
         bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), "virtual/kernel")
+        self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
         return bb_vars
 
     def _config_add_uboot_env(self, config):
@@ -441,7 +441,7 @@ class KernelFitImageTests(FitImageTestCase):
         fit_uboot_env = bb_vars['FIT_UBOOT_ENV']
         initramfs_image = bb_vars['INITRAMFS_IMAGE']
         initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
-        uboot_sign_enable = bb_vars['UBOOT_SIGN_ENABLE']
+        uboot_sign_enable = bb_vars.get('UBOOT_SIGN_ENABLE')
 
         # image nodes
         images = [ 'kernel-1' ]
@@ -475,8 +475,8 @@ class KernelFitImageTests(FitImageTestCase):
     def _get_req_its_fields(self, bb_vars):
         initramfs_image = bb_vars['INITRAMFS_IMAGE']
         initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
-        uboot_rd_loadaddress = bb_vars['UBOOT_RD_LOADADDRESS']
-        uboot_rd_entrypoint = bb_vars['UBOOT_RD_ENTRYPOINT']
+        uboot_rd_loadaddress = bb_vars.get('UBOOT_RD_LOADADDRESS')
+        uboot_rd_entrypoint = bb_vars.get('UBOOT_RD_ENTRYPOINT')
 
         its_field_check = [
             'description = "%s";' % bb_vars['FIT_DESC'],
@@ -506,6 +506,8 @@ class KernelFitImageTests(FitImageTestCase):
 
     def _get_req_sigvalues_config(self, bb_vars):
         """Generate a dictionary of expected configuration signature nodes"""
+        if bb_vars.get('UBOOT_SIGN_ENABLE') != "1":
+            return {}
         sign_images = '"kernel", "fdt"'
         if bb_vars['INITRAMFS_IMAGE'] and bb_vars['INITRAMFS_IMAGE_BUNDLE'] != "1":
             sign_images += ', "ramdisk"'
@@ -901,6 +903,7 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_SIGN_IMG_KEYNAME',
         }
         bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), "virtual/bootloader")
+        self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
         return bb_vars
 
     def _bitbake_fit_image(self, bb_vars):
-- 
2.48.1


