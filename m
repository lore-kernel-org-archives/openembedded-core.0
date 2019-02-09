Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 487A37C5E0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 18:58:29 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n2so3036994pgm.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 10:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pD1obns3jwmmk4gxCGMnvNPa91xWQSNSo0VKJ6hLzrY=;
	b=cAiyBPXOoMWHGBR25+JceFM899ZKkWeQ+DOUrW48w4DEX7HRokRErQQtcixUD/47/7
	L934cuVsEmrI6Xcr1acuPqtrPeINh/VLU6bieQyw8j0v6tjAjYdpJ6uQ+9zlRK06zMy2
	V9lqF0uWNwWv/NcDyHC+igtClKTAYnEIHWlf0tsg6B7moWrcRh3RFpA5yrFTrjY0djMV
	egzWNZqjaKJNrFkz+Vl8Ao41fEiIHh9WyPwywwksnLCWAl7JTpdsV/j9k/yUIrPyF9Sq
	ncPz5yeDAKNfSjSMUgqdV4IIoIc4HkBBp1/WgHVtCfXsK6l9ka2IzRxE3GPWaDmzmcGE
	cp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pD1obns3jwmmk4gxCGMnvNPa91xWQSNSo0VKJ6hLzrY=;
	b=Jdo240zAjUJ1VpzVYJjq8m9HgHlgpLzpq4bW4Tv9ulYZN1SFiZq04OLOhfYszj2tYC
	rUpO1PLyyGR26amaczFyHjI0vcoXEstEAL9YaFbneA6dp/k2hznPPUP8tHQaawy1KgPf
	0jiaXMsm4WaZTxc1FVyezF1Um0w85sUc2BlMRDgTH6C+X7VI4krH8i/EBJ/AC2M0NLPT
	Koioib5sVriaWeTHpPzgKUNXMg2sabtU8yvNmbGyYRMNYEhyOO8dvLfnDC4bZt0JCNyN
	GOhs4c210+vHXKImdqDZKjmWWirUVBFIDEJy9mp8TCKpwAjq+c3Es5yLLDmD6NxrihzJ
	VK+g==
X-Gm-Message-State: AHQUAua+i105l4Uau9eHx5tQMUdHrkkH7Ih89NnZBL2NHn2CTlBbt/DP
	QUW750w5FZLaDBnK9KnU4kba122e
X-Google-Smtp-Source: AHgI3Ibde9JAB/MCtpVXmLy+/laZh5oYXGTaWTtL4B56KjBBld/rQ+yA/u34RMkf9vwVBIfqiJ1awg==
X-Received: by 2002:a65:6150:: with SMTP id o16mr24397470pgv.434.1549738709990;
	Sat, 09 Feb 2019 10:58:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	x23sm18351816pfe.0.2019.02.09.10.58.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Feb 2019 10:58:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Feb 2019 10:58:22 -0800
Message-Id: <20190209185822.19934-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH V2] image_types.bbclass: Set 70% RAM memory usage limit and -T for xz
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
X-List-Received-Date: Sat, 09 Feb 2019 18:58:29 -0000
Content-Transfer-Encoding: 8bit

when building with opkg backend and huge packages e.g. chromium/llvm all
going in parallel, memory pressure causes xz to catapult with

do_package_write_ipk: Failed to create package, opkg-build failed with: xz: (stdin): Cannot allocate memory

since there are many tasks going on in parallel, xz adds to memory pressure
and it wants it all, put an upper limit for memory xz can use

We add a variable XZ_MAXRAM with 30% of RAM limit and can be customized
if builders have more memory one can set it like

XZ_DEFAULTS = "-M 0 -T 0"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Consider all locations of xz use

 meta/classes/image_types.bbclass       | 9 ++++-----
 meta/classes/package_ipk.bbclass       | 2 +-
 meta/classes/populate_sdk_base.bbclass | 2 +-
 meta/conf/bitbake.conf                 | 3 +++
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 70bd315306..b12420310f 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -56,7 +56,6 @@ def imagetypes_getdepends(d):
 
 XZ_COMPRESSION_LEVEL ?= "-3"
 XZ_INTEGRITY_CHECK ?= "crc32"
-XZ_THREADS ?= "-T 0"
 
 ZIP_COMPRESSION_LEVEL ?= "-9"
 
@@ -152,12 +151,12 @@ UBI_VOLNAME ?= "${MACHINE}-rootfs"
 multiubi_mkfs() {
 	local mkubifs_args="$1"
 	local ubinize_args="$2"
-    
+
         # Added prompt error message for ubi and ubifs image creation.
         if [ -z "$mkubifs_args" ] || [ -z "$ubinize_args" ]; then
             bbfatal "MKUBIFS_ARGS and UBINIZE_ARGS have to be set, see http://www.linux-mtd.infradead.org/faq/ubifs.html for details"
         fi
-    
+
 	if [ -z "$3" ]; then
 		local vname=""
 	else
@@ -284,7 +283,7 @@ CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha25
 CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_gz = "pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
+CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
 CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
 CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
@@ -317,7 +316,7 @@ CONVERSION_DEPENDS_qcow2 = "qemu-native"
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
 
-DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso" 
+DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
 
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
 # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 508b7dcaff..d1b317b42b 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -8,7 +8,7 @@ IPKGCONF_SDK =  "${WORKDIR}/opkg-sdk.conf"
 PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
 
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??= 'opkg-build -Z xz -a "--threads 0"'
+OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
 
 OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 80fa443e4c..ebc30d39b3 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -226,7 +226,7 @@ fakeroot tar_sdk() {
 	# Package it up
 	mkdir -p ${SDKDEPLOYDIR}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	tar ${SDKTAROPTS} -cf - . | xz ${XZ_DEFAULTS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
 }
 
 TOOLCHAIN_SHAR_EXT_TMPL ?= "${COREBASE}/meta/files/toolchain-shar-extract.sh"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9452d5ac4f..3f5d84d348 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -791,6 +791,9 @@ BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
 # Default to setting automatically based on cpu count
 PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
 
+# Default parallelism and resource usage for xz
+XZ_DEFAULTS ?= "--memlimit=30% --threads=${BB_NUMBER_THREADS}"
+
 ##################################################################
 # Magic Cookie for SANITY CHECK
 ##################################################################
-- 
2.20.1


