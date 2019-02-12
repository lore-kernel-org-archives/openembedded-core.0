Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id BD11F7C445
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 05:48:01 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id h1so751084pfo.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 21:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=s8Of4ant40YGob0kjeYQ1/kt/nJgfkUNFQrF74QlVU4=;
	b=QYIsAUyiAGhLkcGUu0ojHo8GYnj5cTqs5aKUM1AcXQAeskfUpDA1HCPBhbZSPuaE/R
	X/ZLo011nrE42u3mGqtO8f3uryeZqOAr6bXEx97POT+cIiyVkFh2uTChPRZDnJgB1rNh
	JZvGu/EU8XuZepeZXeSLuDYzZKaJ6VZv9NOWY6JbcfkKVxOZyNVIts1f+zS73WA/62u8
	gYvm6eHqulXoPnq7B2g+RR0Mou+cpOOusiuQwfpA3gNLM2xulwPANatxDpD9LSLFje2f
	/XckMWuzzZVlKsiTNQfh5u8IC532tmniTk4N3iCxO7LyzGn8mea1JsOIAlyzRIwuQwdE
	7RoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=s8Of4ant40YGob0kjeYQ1/kt/nJgfkUNFQrF74QlVU4=;
	b=Rj9cmy8jGtIa02xy/RcPfebsQhmqACGpkNjyDBja6+vOebJJVti8achgtgLjhynF/3
	5cmOU6p2oRpIpX5CAr2V62qWhxUH8TxS7rrds8XgP0hVKFTj+b69zbg4JdiruKdC5xZA
	Eh53u0KOSmpEmFq2caRwz7HrtuOY45A5pEhk0m2ZtEelqUU5uW4zi+pyky5Rv2o3m0YP
	Es4O1Jn7qSoIV+eAh/qm8C63waW9OcDZ4tkMFanbSJArusLCS1a4nIHLFgVXES3rTlFH
	jnJaywCk1P3Q2kgnLg3J3vMb8r0yPmZAJbIHP4N5wdmMq9HSD+aFRvHzY8jQSqsQ1JZj
	l74g==
X-Gm-Message-State: AHQUAuazRhyc9wSndA3vNenYSPNpG1jTcbYKTQZvXIIEnGTO4ZMcUqrG
	yLd469BlX6vnlX/sCJUZFWxZq1XY
X-Google-Smtp-Source: AHgI3IY9qXMjTHbOE994M2I63rkd3KJa0IylpyzCuQCCgl87fI0odH2E6nnxfPRNgOExDusQOvy4AQ==
X-Received: by 2002:a62:a1a:: with SMTP id s26mr2253366pfi.31.1549950482422;
	Mon, 11 Feb 2019 21:48:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	b15sm2020017pfj.44.2019.02.11.21.48.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 21:48:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2019 21:47:54 -0800
Message-Id: <20190212054754.2801-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190212054754.2801-1-raj.khem@gmail.com>
References: <20190212054754.2801-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3 3/3] image_types.bbclass: Set memory usage limit and CPU threads for xz
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
X-List-Received-Date: Tue, 12 Feb 2019 05:48:02 -0000
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
v3: Use ${@oe.utils.cpu_count()} in place of BB_NUMBER_THREADS

 meta/classes/image_types.bbclass       | 9 ++++-----
 meta/classes/package_ipk.bbclass       | 2 +-
 meta/classes/populate_sdk_base.bbclass | 2 +-
 meta/conf/bitbake.conf                 | 3 +++
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index ddca5b624e..f9890581b3 100644
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
@@ -319,7 +318,7 @@ CONVERSION_DEPENDS_base64 = "coreutils-native"
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
index 21fd93e58d..6e063dc14d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -791,6 +791,9 @@ BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
 # Default to setting automatically based on cpu count
 PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"

+# Default parallelism and resource usage for xz
+XZ_DEFAULTS ?= "--memlimit=50% --threads=${@oe.utils.cpu_count()}"
+
 ##################################################################
 # Magic Cookie for SANITY CHECK
 ##################################################################
--
2.20.1

