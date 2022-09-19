Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79392ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 03:31:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.16185.1663558296917038005
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 20:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LllyXesg;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6261a9894b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28J3Urid024633
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 03:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=6MULbnK6UrQeQF4EsWJ8NTa/E84lgshVBoCpgdnuXwE=;
 b=LllyXesgsIqfVCeSvVb8wok32vEazsdGbOiSDIUvfzGNJQiJRjMu87DZ8I26KKcMVUpF
 fu6JUjs1or79xbrmLAVwCaCRrBz+fyrl3sWWvuhSv096SpzRzCQNRE4F5CySCSxUT+Jw
 4fL6QikgVCr2g+i4FbOa59eubcOuZOYl4187RPD/i2HyesxZophU6F4nLDvXv8DYKDYv
 QpdYoVine7r20yRrdXhQbC//8QKUSDmVoCLkHQSc8RvC79ex9J7bc7G5rxl1L8vInyDs
 rtmeRAyx5FSIqHIoAR63ug3keNgZFGckkiz4EvWRkivV8NpfTJEU9ePmOOnUqzpoUWnk VA==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn57a19q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 03:31:35 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 18 Sep 2022 20:31:33 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 18 Sep 2022 20:31:33 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] busybox: add devmem 128-bit support
Date: Mon, 19 Sep 2022 11:31:32 +0800
Message-ID: <20220919033132.482693-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7vNuED8amD99DLpBDHPweRW0RcO0FjDi
X-Proofpoint-GUID: 7vNuED8amD99DLpBDHPweRW0RcO0FjDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_01,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209190023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 03:31:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170854

From: Mingli Yu <mingli.yu@windriver.com>

Add devmem 128-bit support [1].

[1] https://git.busybox.net/busybox/commit/?id=d432049f288c9acdc4a7caa729c68ceba3c5dca1

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-devmem-add-128-bit-width.patch       | 128 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 2 files changed, 129 insertions(+)
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


