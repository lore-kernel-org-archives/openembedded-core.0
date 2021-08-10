Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.7162.1628598772230380947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 05:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 933F4C0003;
	Tue, 10 Aug 2021 12:32:50 +0000 (UTC)
From: "Thomas Perrot" <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [PATCH 2/2] oeqa/selftest/fitimage: update tests to use two keys
Date: Tue, 10 Aug 2021 14:30:13 +0200
Message-Id: <20210810123013.943078-3-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810123013.943078-1-thomas.perrot@bootlin.com>
References: <20210810123013.943078-1-thomas.perrot@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Other keys (UBOOT_SIGN_IMG_KEYNAME) are required to sign individually the images
nodes, and these keys must be different from the ones used to sign the
configurations nodes (UBOOT_SIGN_KEYNAME), then fitimage tests need to be
updated.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 815ee48c0541..184c8778d23f 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -114,7 +114,8 @@ KERNEL_CLASSES = " kernel-fitimage test-mkimage-wrapper "
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
-UBOOT_SIGN_KEYNAME = "oe-selftest"
+UBOOT_SIGN_IMG_KEYNAME = "img-oe-selftest"
+UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 """
@@ -173,11 +174,11 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 
         reqsigvalues_image = {
             'algo': '"sha256,rsa2048"',
-            'key-name-hint': '"oe-selftest"',
+            'key-name-hint': '"img-oe-selftest"',
         }
         reqsigvalues_config = {
             'algo': '"sha256,rsa2048"',
-            'key-name-hint': '"oe-selftest"',
+            'key-name-hint': '"cfg-oe-selftest"',
             'sign-images': '"kernel", "fdt"',
         }
 
@@ -215,7 +216,10 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         self.assertIn('conf-am335x-boneblack.dtb', signed_sections)
         for signed_section, values in signed_sections.items():
             value = values.get('Sign algo', None)
-            self.assertEqual(value, 'sha256,rsa2048:oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
+            if signed_section.startswith("conf"):
+                self.assertEqual(value, 'sha256,rsa2048:cfg-oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
+            else:
+                self.assertEqual(value, 'sha256,rsa2048:img-oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
             value = values.get('Sign value', None)
             self.assertEqual(len(value), 512, 'Signature value for section %s not expected length' % signed_section)
 
@@ -266,7 +270,8 @@ KERNEL_CLASSES = " kernel-fitimage"
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
-UBOOT_SIGN_KEYNAME = "oe-selftest"
+UBOOT_SIGN_IMG_KEYNAME = "img-oe-selftest"
+UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
 """
         self.write_config(config)
@@ -348,7 +353,8 @@ KERNEL_CLASSES = " kernel-fitimage test-mkimage-wrapper "
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
-UBOOT_SIGN_KEYNAME = "oe-selftest"
+UBOOT_SIGN_IMG_KEYNAME = "img-oe-selftest"
+UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
 """
@@ -592,7 +598,8 @@ KERNEL_CLASSES = " kernel-fitimage test-mkimage-wrapper "
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
-UBOOT_SIGN_KEYNAME = "kernel-oe-selftest"
+UBOOT_SIGN_IMG_KEYNAME = "img-oe-selftest"
+UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
 """
         self.write_config(config)
-- 
2.31.1

