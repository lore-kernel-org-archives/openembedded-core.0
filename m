Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DB0C3ABBD
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 13:06:58 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.28295.1746364017939619232
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 06:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=KTD3kXPT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202505041306551a4bf2494686c21ee5-mkymze@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202505041306551a4bf2494686c21ee5
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 May 2025 15:06:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=sfUJYt4gDjRBsgEKELMmVL77GaFWYba2RxQz29CUCK0=;
 b=KTD3kXPTekiZhI6PTR5NNZb4wjYr2L6xv8reoC9Sm807tY5B8s4J+BYqsZSMTXhLwkcf/3
 Xe3bjZif3TfiJq4IXtc9+eUpoLcXOPSm4FYUC8wJaBsnDfnA2KyF0/Gy8FV5S8phMOkZjpYl
 KAtxiJhzVAzmLvwOaXhg50LiRx9nN3K+l1/m5o73c4QKBd5Kxx74RbGBlMUwqZQVAhXOvyJj
 7ZFkb5hi9xrie1n4SNl6+to6+ru5GAOKjIVLOS2Uc8liOhHDSnnT9ylGHMzX5O+r7HziQEao
 lhJUIjJAGTVaI66tk5zwmBhElvDTcAHDz5tCyORNi95cX8opifYLAyYQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	l.anderweit@phytec.de,
	richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	bruce.ashfield@gmail.com,
	rogerio.borin@toradex.com,
	sean.anderson@seco.com,
	m.felsch@pengutronix.de,
	ejo@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 07/20] kernel-fitimage: refactor order in its
Date: Sun,  4 May 2025 15:04:54 +0200
Message-ID: <20250504130507.717954-7-adrian.freihofer@siemens.com>
In-Reply-To: <20250504130507.717954-1-adrian.freihofer@siemens.com>
References: <20250504130507.717954-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 13:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215951

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
index 765776a562b..1ef7b1b4483 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -125,11 +125,11 @@ fitimage_emit_section_kernel() {
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
@@ -174,10 +174,10 @@ fitimage_emit_section_dtb() {
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
@@ -212,10 +212,10 @@ fitimage_emit_section_boot_script() {
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
@@ -249,11 +249,11 @@ fitimage_emit_section_setup() {
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
@@ -298,11 +298,11 @@ fitimage_emit_section_ramdisk() {
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
index ba5adaa9b67..81585aa10b3 100644
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


