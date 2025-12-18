Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA02D6ACE9
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 11:31:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39852.1766057473030638350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 03:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EcGsFiq5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9HAeg527626
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 11:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ATpVZI61gPbQdn41oIMCjE
	1Ua3nFQPNGg2JUSvKVbUw=; b=EcGsFiq5a/Jqzv922ipEpg2M5vau2sj4qGjcPm
	bEU35wFnIYDBU9721C7SOekfnigD9sWKpkeGv4gzPemSo0ybwIOWJamEPxrkiVHT
	jfyhNzVabVc7KOlJHdrnUeKU6LCGz/6SCXHEv6zzMw4b8nPO97uJd5r3ZJf29bou
	4wRCIo23liZ5zwV2j8EoM+8bY4mtPUIfgPOX/dSnYXr9ASzsiZms81t6U5i+UMQI
	M8rP/+2xnb3ygydZ+xVmcXjYI6WCJEotqTc0NBP+gEVIMu+MwoO/7np/Tm19dstB
	bLhcI/225TUEM5RKokZi+m8hFPgfy6D29dh4HptVUEEUB1HA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43mb2e43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 11:31:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BIBVA1i000376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 11:31:10 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Dec 2025 03:31:09 -0800
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [PATCH v3] fitimage: Add FIT_MKIMAGE_EXTRA_OPTS for flexible mkimage arguments
Date: Thu, 18 Dec 2025 17:00:53 +0530
Message-ID: <20251218113053.2520095-1-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qLZ8TY1oXUi45TsxBdhAINt8Ey-YeLMD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5NSBTYWx0ZWRfXxKTyxg7lRZzB
 bFNdrmchhCLm12sT98plVdgC/mtHXgxTMEsuyPxWd5Pe+K/DGKeNlBlizRfJZ2MY+vytE3gIzvz
 es90Dk33U2Kuw2kFkbCkcPHfDSXfM0IPRerPsj3ABwVp6zld8SEp+VkGVhdP+kmxYPLPglPXuyt
 YGhX4dPWVNfrGskxSLIrVdJ86iSJzLyBwmtEVQDPZ2K+jo9AoEDkagjKR+z2t866qK05ZkxKZKV
 AjUz0bO7Lf8dciSjcFOaVqVpludC+ny0vITyvrIG4c56hl7Kv82fGCDzqF+i6yAjryVWmzKSwLK
 fdgQRwWnRH9aOy9w/BUcsC6gC5BQOidbg/71yCSYCO0X8SSswd4NI1t/YaxeVp80NnslJIpoJYN
 KUfsONgf2JcYKVqHU5AQvc8TBqtgag==
X-Authority-Analysis: v=2.4 cv=NPHYOk6g c=1 sm=1 tr=0 ts=6943e5ff cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TlCpYMT3hOQbURhLKdoA:9
X-Proofpoint-GUID: qLZ8TY1oXUi45TsxBdhAINt8Ey-YeLMD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 11:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228112

Currently, mkimage options in U-Boot recipes are fixed, which limits
flexibility for platforms that require additional mkimage arguments.
Introduce FIT_MKIMAGE_EXTRA_OPTS to allow passing extra options to
mkimage during image generation.

This is a generic need because different SoCs and boot configurations
often require mkimage flags beyond the defaults.

By exposing this variable, we provide a clean and extensible mechanism
for developers to meet hardware-specific and security requirements
without hardcoding options in recipes.

Example:

UBOOT_MKIMAGE_EXTRA_OPTS = "-B 8 -E"
will result in the mkimage command being invoked as:
`mkimage -B 8 -E -f fit-image.its fitImage`

- `-E` enables external data in FIT images, which is essential for
  modular boot setups, secure boot workflows, and reducing image size.
- `-B 8` enforces 8-byte alignment, ensuring compatibility with boot
  ROM requirements, improving memory access efficiency, and supporting
  predictable offsets for multi-component FIT images.

Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 1 +
 meta/conf/image-fitimage.conf                | 3 +++
 meta/lib/oe/fitimage.py                      | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index fd0d21ceee..66c766e90b 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -56,6 +56,7 @@ python do_compile() {
         d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar("FIT_CONF_PREFIX"),
         oe.types.boolean(d.getVar('FIT_KERNEL_SIGN_ENABLE')), d.getVar("FIT_KERNEL_SIGN_KEYDIR"),
         d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
+        d.getVar('FIT_MKIMAGE_EXTRA_OPTS'),
         d.getVar("UBOOT_MKIMAGE_SIGN"), d.getVar("UBOOT_MKIMAGE_SIGN_ARGS"),
         d.getVar('FIT_HASH_ALG'), d.getVar('FIT_SIGN_ALG'), d.getVar('FIT_PAD_ALG'),
         d.getVar('FIT_KERNEL_SIGN_KEYNAME'),
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 090ee148f4..ae1e79ecde 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -44,6 +44,9 @@ FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst
 # DTBs are provided separately in a FIT image.
 FIT_LINUX_BIN ?= "linux.bin"
 
+# Additional mkimage options for FIT image creation
+FIT_MKIMAGE_EXTRA_OPTS ?= ""
+
 # Allow user to select the default DTB for FIT image when multiple dtb's exists.
 FIT_CONF_DEFAULT_DTB ?= ""
 
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index f303799155..bb19d92c8e 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -156,6 +156,7 @@ class ItsNodeRootKernel(ItsNode):
     def __init__(self, description, address_cells, host_prefix, arch, conf_prefix,
                  sign_enable=False, sign_keydir=None,
                  mkimage=None, mkimage_dtcopts=None,
+                 mkimage_extra_opts=None,
                  mkimage_sign=None, mkimage_sign_args=None,
                  hash_algo=None, sign_algo=None, pad_algo=None,
                  sign_keyname_conf=None,
@@ -177,6 +178,7 @@ class ItsNodeRootKernel(ItsNode):
         self._sign_keydir = sign_keydir
         self._mkimage = mkimage
         self._mkimage_dtcopts = mkimage_dtcopts
+        self._mkimage_extra_opts = shlex.split(mkimage_extra_opts) if mkimage_extra_opts else []
         self._mkimage_sign = mkimage_sign
         self._mkimage_sign_args = mkimage_sign_args
         self._hash_algo = hash_algo
@@ -483,6 +485,7 @@ class ItsNodeRootKernel(ItsNode):
     def run_mkimage_assemble(self, itsfile, fitfile):
         cmd = [
             self._mkimage,
+            *self._mkimage_extra_opts,
             '-f', itsfile,
             fitfile
         ]
-- 
2.34.1


