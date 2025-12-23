Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EB7E6C5F9
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 06:41:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96334.1766472002894682813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 22:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KXBvi8XD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: shrkum@qti.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2uKvJ2199035
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 06:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pTzQ4c7KNbapwx3Cnii+71
	EH8xkK3VIIgNh5ab6Sf40=; b=KXBvi8XD+g0dl4WJeZ5vPgLr+qQRRFfMqS3TrT
	uvJBeXbeByKIeH1g3hxMDvQmgh47XK1ke47hWdHgtqE6LcugSDCSuAIiD9xfhOGf
	+kBkHLEPK4NQrg7i1z2VlB228agKbEmiDVaW0Os426BCR9Do6h3eEWxlOQ1afpuo
	/87lTjl9xuuRMGFYdd5FiGrV+WdZtZI20bS/2kwGMVqsBBVVY4oJ9G/K9zdOv7bi
	qbvUeQnLXebKjjcIQM1o4Mg5QEw36sf5/UEAyQ7BIa0clunE+EkJsgu2ObxP/oAq
	Kxth1qewfLu/MDXAZ58i/gI9tUjHY3nKkvkRdW11NBRRCaIg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwu1yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 06:22:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BN6MEOg017585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 06:22:14 GMT
Received: from hu-shrkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Dec 2025 22:22:12 -0800
From: shrkum@qti.qualcomm.com
To: <openembedded-core@lists.openembedded.org>
CC: Shravan Kumar <shrkum@qti.qualcomm.com>
Subject: [PATCH] efivarfs: Backport patch to update file variable store on SetVariableRT
Date: Tue, 23 Dec 2025 11:50:01 +0530
Message-ID: <20251223062001.1889274-1-shrkum@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a3517 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=_7iPbHPSEhwI4OvfJyMA:9
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA1MiBTYWx0ZWRfX1V2B7y6YxSzE
 DRWDHYbc5R0kGOj3IxUaQL4VyXaoiNQd33Wk3rzkdp/B+pjWfjRlcOGMs/mhz1ezO1TBSxaAQz1
 R7qBUi7zmisREBXUhfyecapNAiF2iB9tPTZgmYAADzzLIeg1LtpYEnnluK7NLwUhp7Bvyn/W4Zz
 3BB5fwlYnyTl/V7qXC0zsftyW2x3ZOf1uLvTq5MKoCERr+lOO3tJgEo5znBx6PYrGh6EcxspQ7B
 RVK4jjfXVO8UPmMkGyfreELkPT9rtlbwZEyyjm23Uuc3KRT2yDLMCl6C6FhI6/iKJycRp8L6Odj
 smxDdh63srqbJeQkW9GkL90QWfGNWpBjY8r79nCZHXpwATrXBsfSlxnxJd2UlwWYM7vIEn3nn8X
 PSc3CIEF8pu6/lJyba3NxYgtYK8GpWwl6TWKP5IqmoQz4XpiL7T+gJTZI3SMAwTEFS4AD4iCW+5
 Hm3ngLRJ9pQH7MbPeOQ==
X-Proofpoint-GUID: 03vu920-N6w0VD4KUVXH91tFU6tn1xGK
X-Proofpoint-ORIG-GUID: 03vu920-N6w0VD4KUVXH91tFU6tn1xGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230052
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 06:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228449

Backport upstream commit 68daa04654ac to enable persisting EFI variable
updates when U-Boot provides SetVariableRT support via efivarfs. This
addresses limitations on embedded boards that store EFI variables in a
file on the ESP instead of NVRAM.

Upstream commit:
https://github.com/rhboot/efivar/commit/68daa04654acbe1bbaa17ebfc23c371b39e69c6b

Signed-off-by: Shravan Kumar <shrkum@qti.qualcomm.com>
---
 ...file-variable-store-on-SetVariableRT.patch | 239 ++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_39.bb          |   1 +
 2 files changed, 240 insertions(+)
 create mode 100644 meta/recipes-bsp/efivar/efivar/0002-efivarfs-backport-patch-to-update-file-variable-store-on-SetVariableRT.patch

diff --git a/meta/recipes-bsp/efivar/efivar/0002-efivarfs-backport-patch-to-update-file-variable-store-on-SetVariableRT.patch b/meta/recipes-bsp/efivar/efivar/0002-efivarfs-backport-patch-to-update-file-variable-store-on-SetVariableRT.patch
new file mode 100644
index 0000000000..d5ec3d5419
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0002-efivarfs-backport-patch-to-update-file-variable-store-on-SetVariableRT.patch
@@ -0,0 +1,239 @@
+From fb90073d51dd8a9f726fbbfcf4fab4aa7781eea3 Mon Sep 17 00:00:00 2001
+From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Date: Wed, 18 Jun 2025 22:37:04 +0300
+Subject: [PATCH] efivarfs: Update a file variable store On SetVariable RT
+
+Embedded boards have hardware limitations when storing and managing EFI
+variables. Some hardware comes with an eMMC & an RPMB partition which they
+use to store the EFI variables securely. However, the vast majority of
+boards (using U-Boot), stores the EFI variables in a file in the ESP.
+
+This has a few limitations
+- UEFI secure boot cannot be enabled as it can be very easily
+  overridden
+- SetVariable at runtime is impossible to support
+
+Distros and capsule updates on-disk do rely on the that service though
+and U-Boot does implement a workaround.
+
+U-Boot enables SetVariableRT in the RTPROP table and creates a memory backend,
+so the linux kernel can naturally read and write variables via the efivarfs
+filesystem. Those reads and writes end up in memory though. So they are visible
+while the OS is live and are lost in the event of a reboot.
+
+At the same time it also creates two EFI RO variables.
+RTStorageVolatile -- Holds the filename  the variables are stored relative to
+                     the ESP
+VarToFile -- Holds a binary dump of all the EFI variables that should be
+             preserved (BS, NV, RT).
+
+By using these two variables we can persist the changes after reboots by
+doing
+dd if=/sys/firmware/efi/efivars/VarToFile-b2ac5fc9-92b7-4acd-aeac-11e818c3130c of=/boot/efi/ubootefi.var skip=4 bs=1
+
+So let's plug this functionality into the efivafs backend and enable it
+automatically if those variables are detected.
+
+Upstream-Status: Backport [https://github.com/rhboot/efivar/commit/68daa04654acbe1bbaa17ebfc23c371b39e69c6b]
+
+Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+---
+ src/efivarfs.c | 157 +++++++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 153 insertions(+), 4 deletions(-)
+
+diff --git a/src/efivarfs.c b/src/efivarfs.c
+index 034d6c19..2dea2525 100644
+--- a/src/efivarfs.c
++++ b/src/efivarfs.c
+@@ -28,6 +28,24 @@
+ #  define EFIVARFS_MAGIC 0xde5e81e4
+ #endif
+ 
++/*
++ * RTStorageVolatile-b2ac5fc9-92b7-4acd-aeac-11e818c3130c holds the name of
++ * the file we need to update relative to the ESP
++ */
++#define NAME_RTSV	"RTStorageVolatile"
++/*
++ * Namespace of the special EFI variables pointing to the file and data we
++ * need to update
++ */
++#define GUID_FILE_STORE_VARS \
++	EFI_GUID(0xB2AC5FC9,0x92B7,0x4ACD,0xAEAC,0x11,0xE8,0x18,0xC3,0x13,0x0C)
++
++static const char *esp_paths[] = {
++	"/boot/efi/",
++	"/boot/",
++	"/efi/"
++};
++
+ static char const default_efivarfs_path[] = "/sys/firmware/efi/efivars/";
+ static char *efivarfs_path;
+ 
+@@ -64,6 +82,137 @@ fini_efivarfs_path(void)
+ 	}
+ }
+ 
++static int
++get_esp_filepath(const char *filename, char *filepath, size_t sz)
++{
++	size_t num_paths = sizeof(esp_paths) / sizeof(esp_paths[0]);
++	size_t rc;
++
++	for (size_t i = 0; i < num_paths; ++i) {
++		struct stat buffer;
++
++		rc = snprintf(filepath, sz, "%s%s", esp_paths[i], filename);
++		if (rc >= sz) {
++			fprintf(stderr, "Error: Filepath too big. Max allowed %ld\n", sz);
++			return -1;
++		}
++		if (!stat(filepath, &buffer))
++			return 0;
++	}
++
++	return -1;
++}
++
++static int
++get_esp_filename(char *filename, size_t sz)
++{
++	size_t size;
++	uint32_t attr;
++	uint8_t *data = NULL;
++	int rc = 0;
++
++	rc = efi_get_variable(GUID_FILE_STORE_VARS, NAME_RTSV, &data, &size, &attr);
++	if (rc < 0)
++		/*
++		 * Return an error here so we can bail out and not try to
++		 * write the file
++		 */
++		return rc;
++
++	if (size > sz) {
++		fprintf(stderr, "Error: Filename too big. Max allowed %ld\n", sz);
++		free(data);
++		return -1;
++	}
++
++	memcpy(filename, data, sz);
++	free(data);
++
++	return 0;
++}
++
++#define make_efivarfs_path(str, guid, name) ({				\
++		asprintf(str, "%s%s-" GUID_FORMAT, get_efivarfs_path(),	\
++			name, GUID_FORMAT_ARGS(&(guid)));		\
++	})
++
++static void
++write_file(const char *filepath) {
++	size_t bytes_read;
++	unsigned char buffer[1024];
++	FILE *output_file = NULL;
++	FILE *var2file = NULL;
++	bool fail = false;
++	char *path;
++	int rc;
++
++	rc = make_efivarfs_path(&path, GUID_FILE_STORE_VARS, "VarToFile");
++	if (rc < 0) {
++		efi_error("make_efivarfs_path failed");
++		exit(1);
++	}
++
++	var2file = fopen(path, "rb");
++	if (!var2file) {
++		fprintf(stderr, "Error: Could not open file '%s'\n", path);
++		goto err;
++	}
++
++	output_file = fopen(filepath, "wb");
++	if (!output_file) {
++		fprintf(stderr, "Error: Could not open file '%s'\n", filepath);
++		goto err;
++	}
++
++	if (fread(buffer, 1, 4, var2file) < 4) {
++		fprintf(stderr, "Error: Could not skip first 4 bytes or '%s' file is too small\n", filepath);
++		fail = true;
++		goto err;
++	}
++
++	while ((bytes_read = fread(buffer, 1, sizeof(buffer), var2file)) > 0) {
++		size_t total_written = 0;
++		while (total_written < bytes_read) {
++			size_t written = fwrite(buffer + total_written, 1, bytes_read - total_written, output_file);
++			if (!written) {
++				fprintf(stderr, "Error: Could not write data to ESP '%s' file\n", filepath);
++				fail = true;
++				goto err;
++			}
++			total_written += written;
++		}
++	}
++
++err:
++	if (path)
++		free(path);
++	if (var2file)
++		fclose(var2file);
++	if (output_file)
++		fclose(output_file);
++
++	if (fail)
++		exit(1);
++}
++
++static void
++efi_update_var_file(void)
++{
++	int rc = 0;
++	char filename[PATH_MAX / 4] = { 0 };
++	char filepath[PATH_MAX] = { 0 };
++
++	rc = get_esp_filename(filename, sizeof(filename));
++	if (rc < 0)
++		return;
++
++	rc = get_esp_filepath(filename, filepath, sizeof(filepath));
++	if (!rc)
++		write_file(filepath);
++	else
++		fprintf(stderr, "Error: '%s' file not found in ESP partition. EFI variable changes won't persist reboots\n", filename);
++}
++
+ static int
+ efivarfs_probe(void)
+ {
+@@ -94,10 +243,6 @@ efivarfs_probe(void)
+ 	return 0;
+ }
+ 
+-#define make_efivarfs_path(str, guid, name) ({				\
+-		asprintf(str, "%s%s-" GUID_FORMAT, get_efivarfs_path(),	\
+-			name, GUID_FORMAT_ARGS(&(guid)));		\
+-	})
+ 
+ static int
+ efivarfs_set_fd_immutable(int fd, int immutable)
+@@ -312,6 +457,8 @@ efivarfs_del_variable(efi_guid_t guid, const char *name)
+ 	if (rc < 0)
+ 		efi_error("unlink failed");
+ 
++	efi_update_var_file();
++
+ 	__typeof__(errno) errno_value = errno;
+ 	free(path);
+ 	errno = errno_value;
+@@ -442,6 +589,8 @@ efivarfs_set_variable(efi_guid_t guid, const char *name, const uint8_t *data,
+ 		goto err;
+ 	}
+ 
++	efi_update_var_file();
++
+ 	/* we're done */
+ 	ret = 0;
+ 
diff --git a/meta/recipes-bsp/efivar/efivar_39.bb b/meta/recipes-bsp/efivar/efivar_39.bb
index fb6b6b3821..c0e8d52181 100644
--- a/meta/recipes-bsp/efivar/efivar_39.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -9,6 +9,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64|riscv64).*-linux"
 
 SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
+           file://0002-efivarfs-backport-patch-to-update-file-variable-store-on-SetVariableRT.patch \
            "
 SRCREV = "c47820c37ac26286559ec004de07d48d05f3308c"
 
-- 
2.34.1


