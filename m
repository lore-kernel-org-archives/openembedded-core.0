Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722A9D3C52B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 11:05:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12984.1765364706552842916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 03:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YuPTOTcm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA8e0DW1917966
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 11:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pfeMH12EP3iA5jsqMTksvJ
	Tvk60av/JCfp/8jLbQKqY=; b=YuPTOTcm3Amc737Ufthu7QgEUEOgGn0z6XVFZu
	C//+K7lf+Pb1qOUwB+rKOjd0sc9LlHhA1JpgolOPIwh8TU/5L7Dl0bGonfi1nqIo
	XMu5av31rf4JdbAQVL/0qZzrI9VkqeKI9pBqQX5asVUseqauk9rLkMvCOOCH92dX
	sNwJuV0bvxz7stR/QBgsbSCd1G7rONvXaBp2b/kgq4XRbmj0/v6FJR7T8FHth8FN
	VvMLpbCkuOsOjaKjX9jurqYDcKvOh8MkydJhLyoNy0hu5xwJX9jpkb60lDCvAYPZ
	5SNwO7n5DEyU6sz/rvaa9+QD006ILrlze4VZF4HJO+KQxVAg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp153t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 11:05:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BAB55Vl022392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 11:05:05 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Dec 2025 03:05:03 -0800
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [PATCH v2] fitimage: Add support for UBOOT_MKIMAGE_EXTRA_OPTS
Date: Wed, 10 Dec 2025 16:34:43 +0530
Message-ID: <20251210110443.3230272-1-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NyBTYWx0ZWRfX2gB9TJ8A+VYH
 mwngTtknI/np8f4hgjMVAV00oiBXkWguA/5zXnmfsAolYdEiCc9v+ATpjeAEwCnrZG23uJ9Lc42
 13gvhWquyZZokzZ3zrWQGAvRL6o5Dk+MLiCnDAou6IdLUSeIOo71AcXYOJI4kuEtKz4oUWXsJhM
 ToCkCwW4O0wPXYfsdJBkdfrjF5q3KQUGJUSfK6y2no7U7kh7IK/YpvbS8Rt6Ce+QoMG6j96XyM8
 UpyTD+CixR29lDQ1dHR5X6B1kBnbLDtU6QOGUNxqgY7XOak3lgZgfwORuaUuywsrIRvJ/YqJa/D
 ovnUgZdvbayhEvax56bn7mUdiBqxYdUv/2raOP9FNNSFQE0btfcil7wGiXVv6Aa4SuR0es8MCrF
 W6h50yG0DIOqbnABNAMmZHYi8XaqsA==
X-Proofpoint-ORIG-GUID: ftIS93ImaLwY2CXQoDsAZgM5EmYydJIL
X-Proofpoint-GUID: ftIS93ImaLwY2CXQoDsAZgM5EmYydJIL
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=693953e2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TlCpYMT3hOQbURhLKdoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 11:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227471

Currently, mkimage options in U-Boot recipes are fixed, which limits
flexibility for platforms that require additional mkimage arguments.
Introduce UBOOT_MKIMAGE_EXTRA_OPTS to allow passing extra options to
mkimage during image generation.

This is a generic need because different SoCs and boot configurations
often require mkimage flags beyond the defaults. For example:
- `-E` enables external data in FIT images, which is essential for
  modular boot setups, secure boot workflows, and reducing image size.
- `-B 8` enforces 8-byte alignment, ensuring compatibility with boot
  ROM requirements, improving memory access efficiency, and supporting
  predictable offsets for multi-component FIT images.

By exposing this variable, we provide a clean and extensible mechanism
for developers to meet hardware-specific and security requirements
without hardcoding options in recipes.

Example:

UBOOT_MKIMAGE_EXTRA_OPTS = "-B 8 -E"
will result in the mkimage command being invoked as:
`mkimage -B 8 -E -f fitImage.its fitImage.itb`

Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 1 +
 meta/conf/image-fitimage.conf                | 3 +++
 meta/lib/oe/fitimage.py                      | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index fd0d21ceee..5456311f00 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -56,6 +56,7 @@ python do_compile() {
         d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar("FIT_CONF_PREFIX"),
         oe.types.boolean(d.getVar('FIT_KERNEL_SIGN_ENABLE')), d.getVar("FIT_KERNEL_SIGN_KEYDIR"),
         d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
+        d.getVar('UBOOT_MKIMAGE_EXTRA_OPTS'),
         d.getVar("UBOOT_MKIMAGE_SIGN"), d.getVar("UBOOT_MKIMAGE_SIGN_ARGS"),
         d.getVar('FIT_HASH_ALG'), d.getVar('FIT_SIGN_ALG'), d.getVar('FIT_PAD_ALG'),
         d.getVar('FIT_KERNEL_SIGN_KEYNAME'),
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 090ee148f4..e470adad5c 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -47,6 +47,9 @@ FIT_LINUX_BIN ?= "linux.bin"
 # Allow user to select the default DTB for FIT image when multiple dtb's exists.
 FIT_CONF_DEFAULT_DTB ?= ""
 
+# Additional mkimage options for FIT image creation
+UBOOT_MKIMAGE_EXTRA_OPTS ?= ""
+
 # length of address in number of <u32> cells
 # ex: 1 32bits address, 2 64bits address
 FIT_ADDRESS_CELLS ?= "1"
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index f303799155..15a36310e0 100644
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
+        self._mkimage_extra_opts = shlex.split(mkimage_extra_opts)
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


