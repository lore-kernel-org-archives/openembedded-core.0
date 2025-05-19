Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E48C54E92
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 11:09:03 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.48705.1747652938056963512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 04:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=e+fNN591;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2025051911085518558470c0ec986207-jcann8@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025051911085518558470c0ec986207
        for <openembedded-core@lists.openembedded.org>;
        Mon, 19 May 2025 13:08:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+8Z+cK8S3g8PYZggIErXPEt0hlYFD4qCXnJB7qt4N4s=;
 b=e+fNN591zheN/pUiGzfLG8DppvvHwIdBiVb+zniKOWKL1rRfLcrmTCeHHlkmxz7aC3/gzP
 HI37mDoVQ6Mvkt183+At9pKZAblHRVWY1EcCcbpyX6LbtKd7uGlbZm8W3g+BGxE1NncubRwl
 WOq9ZKs6xumAjyp3M9jsmbve/OlhAkqGIs7mInvrIEScEuACluSoM5R7OC9pqVmHlvYcFPhW
 tfcyUcrc/gm+XhJeXKE0BDA2o7L52HQGaz3C8EK6g2eVOtk4UDO1Hf8h02iSHKGhIwwdrx9P
 8iPMOW3Oy9pcc3hbsGN0vygMsyFVmAhBQchy1I4dr40sVxiEamXLo3Cg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 06/16] kernel-fitimage: refactor order in its
Date: Mon, 19 May 2025 13:07:50 +0200
Message-ID: <20250519110838.82978-7-adrian.freihofer@siemens.com>
In-Reply-To: <20250519110838.82978-1-adrian.freihofer@siemens.com>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 11:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216838

From: Adrian Freihofer <adrian.freihofer@siemens.com>

When the ITS file is created, the mandatory properties are written first
before the optional properties are written.
This is not really useful for the current implementation. But it is a
preparation for a new Python-based implementation that will expect
mandatory properties first. This change makes it possible to run the
tests with both the old and the new implementation.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 20 ++++++++++----------
 meta/lib/oeqa/selftest/cases/fitimage.py    |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index f5f02f30f0a..8e66f326766 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -128,11 +128,11 @@ fitimage_emit_section_kernel() {
 	cat << EOF >> $1
                 kernel-$2 {
                         description = "Linux kernel";
-                        data = /incbin/("$3");
                         type = "${UBOOT_MKIMAGE_KERNEL_TYPE}";
+                        compression = "$4";
+                        data = /incbin/("$3");
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
-                        compression = "$4";
                         load = <${UBOOT_LOADADDRESS}>;
                         entry = <$ENTRYPOINT>;
                         hash-1 {
@@ -177,10 +177,10 @@ fitimage_emit_section_dtb() {
 	cat << EOF >> $1
                 fdt-$2 {
                         description = "Flattened Device Tree blob";
-                        data = /incbin/("$3");
                         type = "flat_dt";
-                        arch = "${UBOOT_ARCH}";
                         compression = "none";
+                        data = /incbin/("$3");
+                        arch = "${UBOOT_ARCH}";
                         $dtb_loadline
                         hash-1 {
                                 algo = "$dtb_csum";
@@ -215,10 +215,10 @@ fitimage_emit_section_boot_script() {
         cat << EOF >> $1
                 bootscr-$2 {
                         description = "U-boot script";
-                        data = /incbin/("$3");
                         type = "script";
-                        arch = "${UBOOT_ARCH}";
                         compression = "none";
+                        data = /incbin/("$3");
+                        arch = "${UBOOT_ARCH}";
                         hash-1 {
                                 algo = "$bootscr_csum";
                         };
@@ -252,11 +252,11 @@ fitimage_emit_section_setup() {
 	cat << EOF >> $1
                 setup-$2 {
                         description = "Linux setup.bin";
-                        data = /incbin/("$3");
                         type = "x86_setup";
+                        compression = "none";
+                        data = /incbin/("$3");
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
-                        compression = "none";
                         load = <0x00090000>;
                         entry = <0x00090000>;
                         hash-1 {
@@ -301,11 +301,11 @@ fitimage_emit_section_ramdisk() {
 	cat << EOF >> $1
                 ramdisk-$2 {
                         description = "${INITRAMFS_IMAGE}";
-                        data = /incbin/("$3");
                         type = "ramdisk";
+                        compression = "none";
+                        data = /incbin/("$3");
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
-                        compression = "none";
                         $ramdisk_loadline
                         $ramdisk_entryline
                         hash-1 {
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index c3554d4499a..47fb8534b37 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -509,11 +509,11 @@ class KernelFitImageTests(FitImageTestCase):
         its_field_check = [
             'description = "%s";' % bb_vars['FIT_DESC'],
             'description = "Linux kernel";',
-            'data = /incbin/("linux.bin");',
             'type = "' + str(bb_vars['UBOOT_MKIMAGE_KERNEL_TYPE']) + '";',
+            # 'compression = "' + str(bb_vars['FIT_KERNEL_COMP_ALG']) + '";', defined based on files in TMPDIR, not ideal...
+            'data = /incbin/("linux.bin");',
             'arch = "' + str(bb_vars['UBOOT_ARCH']) + '";',
             'os = "linux";',
-            # 'compression = "' + str(bb_vars['FIT_KERNEL_COMP_ALG']) + '";', defined based on files in TMPDIR, not ideal...
             'load = <' + str(bb_vars['UBOOT_LOADADDRESS']) + '>;',
             'entry = <' + str(bb_vars['UBOOT_ENTRYPOINT']) + '>;',
         ]
-- 
2.49.0


