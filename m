Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA6EC28B30
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:12:19 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.50852.1742213531665283686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HpX1AwxI;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3913d129c1aso3479927f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 05:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742213525; x=1742818325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gYdWc6Bg9AD6kC4XQBqy4k5Vs4Jw8MX59dC6eRgREY=;
        b=HpX1AwxIOjh23H0tP/lEto+eceKigWUcU3jDr5DNZ7x/hza9bd/wgoRia11cG53Hn7
         RXiLbfd1z8iQr35ILSJFW8YQXwQgDNvhJBMYWlV9ZvOMDLoyrQmJJ41PBGCQ9mN/LOpZ
         41xC8vgG7pkVq09ujuXJK5s0guEVn/wdHhXNGX4mP2SoQJQA+jrwQVX38JaywvQ9snao
         Qxc3PE0WTI8mmd96Ys4YR8m/x7icpiZSHnTK3JI/2KtDRHxsk3D1rqoEkCYrGf9pIPwc
         O7cjjasncCMQ8oJpcs1dhBDLpa7hKrqYB5fmPhRB2FUV13d8R8bKjK2x3z7kTXSdDhJs
         uBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213525; x=1742818325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gYdWc6Bg9AD6kC4XQBqy4k5Vs4Jw8MX59dC6eRgREY=;
        b=NvVsCyCEs6oUkFksvj6yQkjMzjhgqMn8boIIaVwjr7bNyIUnfxzvBVg7XWseJhwmJO
         j3iS3CXqvlgIh5WNYZ658BOdjwspi50/nWK3M0JGHz7SrB18PzISwpZPju6s+QLlUWX/
         tOCOhcBsseVTB/FGQqJNR3jQTykOGL0cLYwvZiMw+T7AwISr8htLBJPxEMOqBTVT5UtX
         KAU5ZxIoOzAKdryCCI0kLb+4Zsghwmbd2Nrr45cglbnxQmMtC8VxAKw54K2/VAKBh45k
         K8OIif4K8QCZ22p2tRFCYw+uTl+T5X1kykXQoDhLNp4K0Q0dEGDN9qGXJZgnG2FSK51Y
         GsTw==
X-Gm-Message-State: AOJu0YwCDJgyk4Ff0fhGHxdxq+ywv9fliqhsvs0aCaEOgC3xuTxwAaFP
	trbu6M1a/C7cTQiFzZpeWQuNT7l11Kc73cTKW3et02SToGeRi5brw0krfw==
X-Gm-Gg: ASbGnctpSMq4cJShM2cmlDC26o80pn+h+lC63RZZx1l1RzFovC4YA8O7cyaM19avLjy
	3Jng/8FZUclDMGpCAetOI6Go3g6DdVnxl7vtHUDpuR7b6nwX7oMdWYWD3FWG9zJ8hoZkEjgccXp
	+0HSK9n2HZ0c52N7l7Wvt53UfWIuYfQ7160Ln0oZHOxSpNu9zl02fFDlxEKhsPbsAhCEiu3Vpxo
	fB6AfMm+ZEt2wyM1h77aj9KuliKRK1dMloEpbVN3otW0KU9DYYJCEM8IwepCQx4xbq6+sqj98pI
	wFUV0y20IUUJLhZgQbwRIZZvtk58CwsO0lQpfjO4RoT1pZJizFD2bnFiAyQr1UT+WTLlZPDSdJy
	u6g==
X-Google-Smtp-Source: AGHT+IHjhkk99wILcGvtwOa2qlQlLusPzw3RQuqBw+fr7emiodeI1fi9M6ynQsKam7EvHx87cEncog==
X-Received: by 2002:a05:6000:18a2:b0:391:9b2:f496 with SMTP id ffacd0b85a97d-395b7c44cbcmr13901281f8f.16.1742213525309;
        Mon, 17 Mar 2025 05:12:05 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3974d771160sm11066893f8f.19.2025.03.17.05.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 05:12:05 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 1/2] oe-selftest: fitimage improve bb_vars access
Date: Mon, 17 Mar 2025 13:10:13 +0100
Message-ID: <20250317121120.130476-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317121120.130476-1-adrian.freihofer@siemens.com>
References: <20250317121120.130476-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 12:12:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213080

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
index 721628d8e73..60c9406489e 100644
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
+        fit_sign_numbits = bb_vars.get('FIT_SIGN_NUMBITS') or "2048"
+        fit_key_genrsa_args = bb_vars.get('FIT_KEY_GENRSA_ARGS') or "-F4"
+        fit_key_req_args =  bb_vars.get('FIT_KEY_REQ_ARGS') or "-batch -new"
+        fit_key_sign_pkcs = bb_vars.get('FIT_KEY_SIGN_PKCS') or "-x509"
 
         uboot_sign_keydir = bb_vars['UBOOT_SIGN_KEYDIR']
         sign_keys = [bb_vars['UBOOT_SIGN_KEYNAME']]
@@ -145,7 +145,7 @@ class FitImageTestCase(OESelftestTestCase):
 
     @staticmethod
     def _get_dtb_files(bb_vars):
-        kernel_devicetree = bb_vars['KERNEL_DEVICETREE'] or ""
+        kernel_devicetree = bb_vars.get('KERNEL_DEVICETREE') or ""
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


