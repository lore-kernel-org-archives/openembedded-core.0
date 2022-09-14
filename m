Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FB8ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 07:21:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3475.1663140064686532025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 00:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s2o8ldx1;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=62563eda0f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28E6VaIw019358
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 07:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=OVb8johjyIV3W3jfGg/DjyyqFM+KtUFIVy8nWdkhdlc=;
 b=s2o8ldx1U+JE+vESrTv2yzH6drCP6AGXzolxj6bdNiGX4W4607gmEDBeyT06NFWbk47P
 3/Zc4TYtYIwtGqOHJogSqmDFaarBNzDdIoRaudH6MHrM0NWcvL6RnKVK6SxsBsCZIZBJ
 k57lI7LKvobsrw8ptU/a693KtO5eHK8M/SR01pcyr/+Zpv1CuIci2xn7KLBQI6ArDd14
 R0zwL3MGGj7T8yQ8xwydrfh3wMStBWY/RejHw27d3zTLY/01hyJWBvDyGpSdAVRGb+Rr
 AYM6ZCBhuQ0sqWIdqI/0sVpEAoCp6ypvik+GiRzE5hN8XkkNbqaNgkMN+d6g7KeImvOK 3g==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4v787br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 07:21:03 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 14 Sep 2022 00:21:00 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 14 Sep 2022 00:21:00 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH v2] busybox: add devmem 128-bit support
Date: Wed, 14 Sep 2022 15:20:59 +0800
Message-ID: <20220914072059.3509603-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <17149C4A25D72AE1.21543@lists.openembedded.org>
References: <17149C4A25D72AE1.21543@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xUFQQSx-vroWgbVfVO1fOIBo8Xx8I9Cr
X-Proofpoint-ORIG-GUID: xUFQQSx-vroWgbVfVO1fOIBo8Xx8I9Cr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_02,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209140035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 07:21:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170637

From: Mingli Yu <mingli.yu@windriver.com>

Add devmem 128-bit support [1].

[1] https://git.busybox.net/busybox/commit/?id=d432049f288c9acdc4a7caa729c68ceba3c5dca1

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-devmem-add-128-bit-width.patch       | 128 ++++++++++++++++++
 meta/recipes-core/busybox/busybox/defconfig   |   2 +-
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 3 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch b/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
new file mode 100644
index 0000000000..985e2bf1d9
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
@@ -0,0 +1,128 @@
+From d432049f288c9acdc4a7caa729c68ceba3c5dca1 Mon Sep 17 00:00:00 2001
+From: Aaro Koskinen <aaro.koskinen@nokia.com>
+Date: Thu, 25 Aug 2022 18:47:02 +0300
+Subject: [PATCH] devmem: add 128-bit width
+
+Add 128-bit width if the compiler provides the needed type.
+
+function                                             old     new   delta
+devmem_main                                          405     464     +59
+.rodata                                           109025  109043     +18
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 77/0)               Total: 77 bytes
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=d432049f288c9acdc4a7caa729c68ceba3c5dca1]
+
+Signed-off-by: Aaro Koskinen <aaro.koskinen@nokia.com>
+Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ miscutils/devmem.c | 68 ++++++++++++++++++++++++++++++----------------
+ 1 file changed, 44 insertions(+), 24 deletions(-)
+
+diff --git a/miscutils/devmem.c b/miscutils/devmem.c
+index f9f0276bc..f21621bd6 100644
+--- a/miscutils/devmem.c
++++ b/miscutils/devmem.c
+@@ -29,7 +29,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ {
+ 	void *map_base, *virt_addr;
+ 	uint64_t read_result;
+-	uint64_t writeval = writeval; /* for compiler */
+ 	off_t target;
+ 	unsigned page_size, mapped_size, offset_in_page;
+ 	int fd;
+@@ -64,9 +63,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ 			width = strchrnul(bhwl, (argv[2][0] | 0x20)) - bhwl;
+ 			width = sizes[width];
+ 		}
+-		/* VALUE */
+-		if (argv[3])
+-			writeval = bb_strtoull(argv[3], NULL, 0);
+ 	} else { /* argv[2] == NULL */
+ 		/* make argv[3] to be a valid thing to fetch */
+ 		argv--;
+@@ -96,28 +92,46 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ 	virt_addr = (char*)map_base + offset_in_page;
+ 
+ 	if (!argv[3]) {
+-		switch (width) {
+-		case 8:
+-			read_result = *(volatile uint8_t*)virt_addr;
+-			break;
+-		case 16:
+-			read_result = *(volatile uint16_t*)virt_addr;
+-			break;
+-		case 32:
+-			read_result = *(volatile uint32_t*)virt_addr;
+-			break;
+-		case 64:
+-			read_result = *(volatile uint64_t*)virt_addr;
+-			break;
+-		default:
+-			bb_simple_error_msg_and_die("bad width");
++#ifdef __SIZEOF_INT128__
++		if (width == 128) {
++			unsigned __int128 rd =
++				*(volatile unsigned __int128 *)virt_addr;
++			printf("0x%016llX%016llX\n",
++				(unsigned long long)(uint64_t)(rd >> 64),
++				(unsigned long long)(uint64_t)rd
++			);
++		} else
++#endif
++		{
++			switch (width) {
++			case 8:
++				read_result = *(volatile uint8_t*)virt_addr;
++				break;
++			case 16:
++				read_result = *(volatile uint16_t*)virt_addr;
++				break;
++			case 32:
++				read_result = *(volatile uint32_t*)virt_addr;
++				break;
++			case 64:
++				read_result = *(volatile uint64_t*)virt_addr;
++				break;
++			default:
++				bb_simple_error_msg_and_die("bad width");
++			}
++//			printf("Value at address 0x%"OFF_FMT"X (%p): 0x%llX\n",
++//				target, virt_addr,
++//				(unsigned long long)read_result);
++			/* Zero-padded output shows the width of access just done */
++			printf("0x%0*llX\n", (width >> 2), (unsigned long long)read_result);
+ 		}
+-//		printf("Value at address 0x%"OFF_FMT"X (%p): 0x%llX\n",
+-//			target, virt_addr,
+-//			(unsigned long long)read_result);
+-		/* Zero-padded output shows the width of access just done */
+-		printf("0x%0*llX\n", (width >> 2), (unsigned long long)read_result);
+ 	} else {
++		/* parse VALUE */
++#ifdef __SIZEOF_INT128__
++		unsigned __int128 writeval = strtoumax(argv[3], NULL, 0);
++#else
++		uint64_t writeval = bb_strtoull(argv[3], NULL, 0);
++#endif
+ 		switch (width) {
+ 		case 8:
+ 			*(volatile uint8_t*)virt_addr = writeval;
+@@ -135,6 +149,12 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ 			*(volatile uint64_t*)virt_addr = writeval;
+ //			read_result = *(volatile uint64_t*)virt_addr;
+ 			break;
++#ifdef __SIZEOF_INT128__
++		case 128:
++			*(volatile unsigned __int128 *)virt_addr = writeval;
++//			read_result = *(volatile uint64_t*)virt_addr;
++			break;
++#endif
+ 		default:
+ 			bb_simple_error_msg_and_die("bad width");
+ 		}
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 5e1e1f5638..58d393ad87 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -782,7 +782,7 @@ CONFIG_FEATURE_CROND_DIR=""
 # CONFIG_DEVFSD_FG_NP is not set
 # CONFIG_DEVFSD_VERBOSE is not set
 # CONFIG_FEATURE_DEVFS is not set
-# CONFIG_DEVMEM is not set
+CONFIG_DEVMEM=y
 # CONFIG_FBSPLASH is not set
 # CONFIG_FLASH_ERASEALL is not set
 # CONFIG_FLASH_LOCK is not set
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index edf896485e..e9ca6fdb1a 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            file://CVE-2022-30065.patch \
+           file://0001-devmem-add-128-bit-width.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.25.1


