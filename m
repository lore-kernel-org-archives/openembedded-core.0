Return-Path: <texier.pj2@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 23BB678DC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 22:59:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w11-v6so6272203wrc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 15:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LpBiCxZQh5uTfk1Ha2qsAxQu7DwNyitmBhEoIArBZB0=;
	b=No8vsvfXk00XLYHJDprd4IPU1puzEpACcfx9vfCHsx8rVT4HelM1zHcEbgJkOaigwM
	NV/EseDJRWbauAuAHrxiEzInerZ8s3E2ELGAzMljmfdI2AfTPm+weuJ2UziStJ/KbXDC
	09lcbJi1gT1jvL02YYbsNSQbQTn9RYEJVk0cFVUf8mL2sZPIYuGDyXJ4LN8SIYBSfK0M
	5C6OqxGl05ooa0OyUG0C7gLp8m+PAy9ZyxluIlJ+Fg1d9vMS0TiFrrQISl0VqiIxd1+O
	hXmgPh2egUssfwv40wOMSmO2UK3CaSnOK5VZRmXOUIAwFpyK0bCwVYBpZy4ThurskDfK
	HPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LpBiCxZQh5uTfk1Ha2qsAxQu7DwNyitmBhEoIArBZB0=;
	b=CoAt27AQLW8plUGkCxqXVuSBKBj8uQoKGwfGlUj2Ap2OJ1j0yuch9LP9frYYr2Uncr
	y30Irtjh8I7TYaNNhvRIiFW0SpST1Dj1WUvCFQd7ZCmtRJgAQuI8fxBsuLx0fmKGRVoY
	wlIYexx52T8gGiY86yZEf5LcBDwuhHun/vZgNgqrrPaXIP7IlSLzu7jZEvcIpWXm3BlQ
	oCFuWI2ZyWFu1aWcuGaUHH3dx0dX70hKwYoyaJwUaMrlwKA7EOiqCOP4z4NdI3yss7c+
	PrspOeYo1290i4tok+h+kFwFAkBoB2nqEyPMm4kW2MWAl4gItX6yRJ+pwv+TGscDBI2V
	xLlg==
X-Gm-Message-State: APzg51B+BE4zFwqONtv1vuGKgbdGZ7rH1+XhGerUNaPecIfZ0VmSgQHH
	1LEBXWUqMdKad9Ucu2oJ9h7jGrMj
X-Google-Smtp-Source: ANB0VdaHgv0TZ1663KjOclWv4sLv+5BWMGPkVZDp9Dk0O9+1pOM6STXLqAVJpAh263ZmNdOeyDrBdA==
X-Received: by 2002:adf:81c3:: with SMTP id
	61-v6mr5848140wra.120.1535583565536; 
	Wed, 29 Aug 2018 15:59:25 -0700 (PDT)
Received: from menoah.home ([2a01:cb19:190:c500:9c9b:4617:b4b8:255a])
	by smtp.gmail.com with ESMTPSA id
	s13-v6sm3323179wrq.39.2018.08.29.15.59.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Aug 2018 15:59:24 -0700 (PDT)
From: Pierre-Jean Texier <texier.pj2@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2018 00:59:23 +0200
Message-Id: <1535583563-7807-1-git-send-email-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] kernel-fitimage: Fix no reg property warning
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
X-List-Received-Date: Wed, 29 Aug 2018 22:59:25 -0000

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
Changes in V2:
	- rebase on master

 meta/classes/kernel-fitimage.bbclass | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index a4d7aca..3d7800a 100644
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
@@ -145,14 +145,14 @@ fitimage_emit_section_dtb() {
 		dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
 	fi
 	cat << EOF >> ${1}
-                fdt@${2} {
+                fdt-${2} {
                         description = "Flattened Device Tree blob";
                         data = /incbin/("${3}");
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
                         ${dtb_loadline}
-                        hash@1 {
+                        hash-1 {
                                 algo = "${dtb_csum}";
                         };
                 };
@@ -170,7 +170,7 @@ fitimage_emit_section_setup() {
 	setup_csum="sha1"
 
 	cat << EOF >> ${1}
-                setup@${2} {
+                setup-${2} {
                         description = "Linux setup.bin";
                         data = /incbin/("${3}");
                         type = "x86_setup";
@@ -179,7 +179,7 @@ fitimage_emit_section_setup() {
                         compression = "none";
                         load = <0x00090000>;
                         entry = <0x00090000>;
-                        hash@1 {
+                        hash-1 {
                                 algo = "${setup_csum}";
                         };
                 };
@@ -225,7 +225,7 @@ fitimage_emit_section_ramdisk() {
 	esac
 
 	cat << EOF >> ${1}
-                ramdisk@${2} {
+                ramdisk-${2} {
                         description = "${INITRAMFS_IMAGE}";
                         data = /incbin/("${3}");
                         type = "ramdisk";
@@ -234,7 +234,7 @@ fitimage_emit_section_ramdisk() {
                         compression = "${ramdisk_ctype}";
                         ${ramdisk_loadline}
                         ${ramdisk_entryline}
-                        hash@1 {
+                        hash-1 {
                                 algo = "${ramdisk_csum}";
                         };
                 };
@@ -269,39 +269,39 @@ fitimage_emit_section_config() {
 	if [ -n "${2}" ]; then
 		conf_desc="Linux kernel"
 		sep=", "
-		kernel_line="kernel = \"kernel@${2}\";"
+		kernel_line="kernel = \"kernel-${2}\";"
 	fi
 
 	if [ -n "${3}" ]; then
 		conf_desc="${conf_desc}${sep}FDT blob"
 		sep=", "
-		fdt_line="fdt = \"fdt@${3}\";"
+		fdt_line="fdt = \"fdt-${3}\";"
 	fi
 
 	if [ -n "${4}" ]; then
 		conf_desc="${conf_desc}${sep}ramdisk"
 		sep=", "
-		ramdisk_line="ramdisk = \"ramdisk@${4}\";"
+		ramdisk_line="ramdisk = \"ramdisk-${4}\";"
 	fi
 
 	if [ -n "${5}" ]; then
 		conf_desc="${conf_desc}${sep}setup"
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
@@ -333,7 +333,7 @@ EOF
 		sign_line="${sign_line};"
 
 		cat << EOF >> ${1}
-                        signature@1 {
+                        signature-1 {
                                 algo = "${conf_csum},rsa2048";
                                 key-name-hint = "${conf_sign_keyname}";
 				${sign_line}
-- 
2.7.4


