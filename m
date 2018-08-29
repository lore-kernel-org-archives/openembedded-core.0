Return-Path: <texier.pj2@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7A55860807
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 22:18:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m27-v6so6227708wrf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 15:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AzAL++5Toc/v8KsBo2oJe+0wQ5IoeOgxOqrpT0181U8=;
	b=FZJ7zHJL0WT7GGFWcqB3MXrPs1YYPuPpxAbPRi3x4q1wK2e+hCKwYoirweT4j97oiA
	efTYzjtA0pXZlW0LNdb6+AFBdOW0q1r7/JrRz9cv8lIxqRIOvJJemQB6a2hD2OXnrVLJ
	nA7/FTTWS1JSar7iqexgZ6mK5Ztlaa6Y1G0hsXEZ3IfLDeYe3WGwy3h9c6HUd2j+IlTl
	HuZ7Gf0yKwRj0/q245J8JOScNXaLq2yc3tF/WzL70KhNirDzWRFUMhiR3lQ/ZFGERFLV
	2d1NdF1cdfD8HuItl2cxZ1hyWuSz91e0DTmWhTbkunwajkcV3qmul4psz1GangV5kIx8
	s7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AzAL++5Toc/v8KsBo2oJe+0wQ5IoeOgxOqrpT0181U8=;
	b=UgFMC6oAyphCfO854ItHQLw9rjee2pJDkna9CSMt/rBb84oijjpASxpFkFvkOIoPej
	ytCsHrG801Ntdpog7p2QIzAvr4gHWNO4iPD03AaNN3CSml6vjwuI08bwpy5YTCwSk8+z
	CbOPJYuqVF7iqTvxbGIAST7jwdCvyfMSGR5IZ8ODtiv+38dCxf4qc3Xi3joNOI4fkbdB
	VLHUIluG9MvwO3DtwV/6K/TIgPY/6qw08BqKqoEjdL35y3myXbAuvqTjk+UqxRwwNbrY
	9yr331CKw6iTl1mRP6fl/chjFkHUX1ll+4qvTOCJpIEKss0+Jtsp08TgUfWBvaF0SoG9
	ExQA==
X-Gm-Message-State: APzg51Ce/g/n6IgZmXDPgn/7EdHYcx7IffFl3rMNvlhM240ukKBNSzVM
	K2hsf0coYFci71efVnLYlCcxnwTo
X-Google-Smtp-Source: ANB0VdaPWNnupAYqeyPViCFfv4SsF9dz/yy8SCrMEoPP5qtv4d0cgx7ayDmsR95tHtsn3bXoCjWeMg==
X-Received: by 2002:a5d:438d:: with SMTP id
	i13-v6mr5856762wrq.156.1535581085037; 
	Wed, 29 Aug 2018 15:18:05 -0700 (PDT)
Received: from menoah.home ([2a01:cb19:190:c500:1198:c038:2f3f:1b47])
	by smtp.gmail.com with ESMTPSA id
	q200-v6sm545673wmd.2.2018.08.29.15.18.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Aug 2018 15:18:04 -0700 (PDT)
From: Pierre-Jean Texier <texier.pj2@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2018 00:18:00 +0200
Message-Id: <1535581080-9010-1-git-send-email-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel-fitimage: Fix no reg property warning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2018 22:18:04 -0000

The DT specifications demands a unit-address of a node name to match the "reg"
property in that node. Newer dtc versions will throw warnings if this is
not the case.

Fixes the following warnings:

| <stdout>: Warning (unit_address_vs_reg): Node /images/kernel@1 has a unit name, but no reg property
| <stdout>: Warning (unit_address_vs_reg): Node /images/kernel@1/hash@1 has a unit name, but no reg property
| <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek.dtb has a unit name, but no reg property
| <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek.dtb/hash@1 has a unit name, but no reg property
| <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek_pda4.dtb has a unit name, but no reg property
| <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek_pda4.dtb/hash@1 has a unit name, but no reg property
| <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek_pda7.dtb has a unit name, but no reg property
| <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek_pda7.dtb/hash@1 has a unit name, but no reg property
| <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek_pda7b.dtb has a unit name, but no reg property
| <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek_pda7b.dtb/hash@1 has a unit name, but no reg property

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 50a91e1..491784c 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -109,7 +109,7 @@ fitimage_emit_section_kernel() {
 	fi
 
 	cat << EOF >> ${1}
-                kernel@${2} {
+                kernel-${2} {
                         description = "Linux kernel";
                         data = /incbin/("${3}");
                         type = "kernel";
@@ -118,7 +118,7 @@ fitimage_emit_section_kernel() {
                         compression = "${4}";
                         load = <${UBOOT_LOADADDRESS}>;
                         entry = <${ENTRYPOINT}>;
-                        hash@1 {
+                        hash-1 {
                                 algo = "${kernel_csum}";
                         };
                 };
@@ -136,13 +136,13 @@ fitimage_emit_section_dtb() {
 	dtb_csum="sha1"
 
 	cat << EOF >> ${1}
-                fdt@${2} {
+                fdt-${2} {
                         description = "Flattened Device Tree blob";
                         data = /incbin/("${3}");
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
-                        hash@1 {
+                        hash-1 {
                                 algo = "${dtb_csum}";
                         };
                 };
@@ -160,7 +160,7 @@ fitimage_emit_section_setup() {
 	setup_csum="sha1"
 
 	cat << EOF >> ${1}
-                setup@${2} {
+                setup-${2} {
                         description = "Linux setup.bin";
                         data = /incbin/("${3}");
                         type = "x86_setup";
@@ -169,7 +169,7 @@ fitimage_emit_section_setup() {
                         compression = "none";
                         load = <0x00090000>;
                         entry = <0x00090000>;
-                        hash@1 {
+                        hash-1 {
                                 algo = "${setup_csum}";
                         };
                 };
@@ -215,7 +215,7 @@ fitimage_emit_section_ramdisk() {
 	esac
 
 	cat << EOF >> ${1}
-                ramdisk@${2} {
+                ramdisk-${2} {
                         description = "${INITRAMFS_IMAGE}";
                         data = /incbin/("${3}");
                         type = "ramdisk";
@@ -224,7 +224,7 @@ fitimage_emit_section_ramdisk() {
                         compression = "${ramdisk_ctype}";
                         ${ramdisk_loadline}
                         ${ramdisk_entryline}
-                        hash@1 {
+                        hash-1 {
                                 algo = "${ramdisk_csum}";
                         };
                 };
@@ -249,7 +249,7 @@ fitimage_emit_section_config() {
 
 	# Test if we have any DTBs at all
 	conf_desc="Linux kernel"
-	kernel_line="kernel = \"kernel@${2}\";"
+	kernel_line="kernel = \"kernel-${2}\";"
 	fdt_line=""
 	ramdisk_line=""
 	setup_line=""
@@ -257,32 +257,32 @@ fitimage_emit_section_config() {
 
 	if [ -n "${3}" ]; then
 		conf_desc="${conf_desc}, FDT blob"
-		fdt_line="fdt = \"fdt@${3}\";"
+		fdt_line="fdt = \"fdt-${3}\";"
 	fi
 
 	if [ -n "${4}" ]; then
 		conf_desc="${conf_desc}, ramdisk"
-		ramdisk_line="ramdisk = \"ramdisk@${4}\";"
+		ramdisk_line="ramdisk = \"ramdisk-${4}\";"
 	fi
 
 	if [ -n "${5}" ]; then
 		conf_desc="${conf_desc}, setup"
-		setup_line="setup = \"setup@${5}\";"
+		setup_line="setup = \"setup-${5}\";"
 	fi
 
 	if [ "${6}" = "1" ]; then
-		default_line="default = \"conf@${3}\";"
+		default_line="default = \"conf-${3}\";"
 	fi
 
 	cat << EOF >> ${1}
                 ${default_line}
-                conf@${3} {
+                conf-${3} {
 			description = "${6} ${conf_desc}";
 			${kernel_line}
 			${fdt_line}
 			${ramdisk_line}
 			${setup_line}
-                        hash@1 {
+                        hash-1 {
                                 algo = "${conf_csum}";
                         };
 EOF
@@ -306,7 +306,7 @@ EOF
 		sign_line="${sign_line};"
 
 		cat << EOF >> ${1}
-                        signature@1 {
+                        signature-1 {
                                 algo = "${conf_csum},rsa2048";
                                 key-name-hint = "${conf_sign_keyname}";
 				${sign_line}
-- 
2.7.4


