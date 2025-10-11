Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6047CCD183
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 09:50:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.8058.1760176241128440490
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Oct 2025 02:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MjOjfNY5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B4ds6S002894
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 09:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ukswoSiKReq4FCluhrC1YQ
	HzYiRDtwEEYMNLGS8aKX0=; b=MjOjfNY5HrLsxhSIWoQqCEewaJCSyX+jxsOxrA
	vlNd6XWQJfkAIZCIcM+5fwGULpkJpfvJfbrJD3q/XivC5/sjnvfpr+X0Xj699nl3
	Z2u+zBWeoNpKajrTNP5EY9P8xF227MAs1afq8qgHXzBue/+MyqBsXfmwrigeoBrc
	lvNMHYrDM91r32RgPXaQGNqKOVTtJtHJDIAZ9yh0JEWBd5iVse9jaEmBdWNPBbtK
	3vv7Rw5qmHsBszMzQgyJ2a2WWW1Z51TyqhNM0s+WgIOi4JtFOCXZIHm5NjZjK+WE
	tmzjMU/XRXlLLtleCwp3IghK25gTuvffF5UcIBT17Gnw9OXQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfrca8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 09:50:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59B9oeWs028856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 09:50:40 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Sat, 11 Oct 2025 02:50:38 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [PATCH] kernel-fit-image: allow passing additional options to uboot-mkimage
Date: Sat, 11 Oct 2025 15:20:22 +0530
Message-ID: <20251011095022.950420-1-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfXzWdD5I26yLo8
 ++1iTZpXozT67x/kC1yFqd9o68i0XAxe4c6KA2f/jOqA8/WxXrrOe8vL0Q20XWTU4rwArjqMikh
 cJrX/46zk8zdFWdLEJzWEEMbwl3gyOTzTh/N8EP4qNDSwlTskJdQXuq5oUkTPV1C7nIz2CbBDxe
 +xw2RioRISzAHTiLEE8CXwxMJ4MeVeiHZBVGm2IHn2kxEcWZxDULNHimavVa6vlRPGvvX7Hg/JZ
 Pt0bDhfnv1OHGxBhQO3e+AxSFySLQcfkM/iu6+fIGHpsTdexCAlrVC0bSMNSkplP3GLKfqMB89o
 HflYqpkKt7IclsnkvlB8swuQcsvzdQ/s2utlK4uiLh+DDjKMUT28nYnFDzVV8nSeJr/vNqqXS//
 /ZnEMtDT32r7QuFrR2EAIT918d22tw==
X-Proofpoint-GUID: 2DB1hvorGxSZHbW68vo5s0jvm4qPOIJW
X-Proofpoint-ORIG-GUID: 2DB1hvorGxSZHbW68vo5s0jvm4qPOIJW
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ea2870 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=HuXApjWiZoqF13bc12sA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 09:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224715

The uboot-mkimage supports various cmdline options such as -B, -E, -t, etc.
which can be useful for customizing the behavior of FIT image generation.
Allow passing these additional options to uboot-mkimage to provide
flexibility for platforms that require specific mkimage flags.

To pass these extra options, define the variable UBOOT_MKIMAGE_EXTRA_OPTS
in your machine or local configuration. If this variable is not set,
the default behavior remains unchanged.

Example:
UBOOT_MKIMAGE_EXTRA_OPTS = "-B 0x00001000 -E"
will result in the mkimage command being invoked as:
`mkimage -B 0x00001000 -E -f fitImage.its fitImage.itb`

Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 1 +
 meta/conf/image-fitimage.conf                | 3 +++
 meta/lib/oe/fitimage.py                      | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 7850d565fc..c1dbd8076d 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -52,6 +52,7 @@ python do_compile() {
         d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar("FIT_CONF_PREFIX"),
         oe.types.boolean(d.getVar('UBOOT_SIGN_ENABLE')), d.getVar("UBOOT_SIGN_KEYDIR"),
         d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
+        d.getVar('UBOOT_MKIMAGE_EXTRA_OPTS'),
         d.getVar("UBOOT_MKIMAGE_SIGN"), d.getVar("UBOOT_MKIMAGE_SIGN_ARGS"),
         d.getVar('FIT_HASH_ALG'), d.getVar('FIT_SIGN_ALG'), d.getVar('FIT_PAD_ALG'),
         d.getVar('UBOOT_SIGN_KEYNAME'),
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 86948b6bf3..a23fd9b767 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -44,6 +44,9 @@ FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst
 # DTBs are provided separately in a FIT image.
 FIT_LINUX_BIN ?= "linux.bin"
 
+# Additional mkimage options for FIT image creation
+UBOOT_MKIMAGE_EXTRA_OPTS ?= ""
+
 # Allow user to select the default DTB for FIT image when multiple dtb's exists.
 FIT_CONF_DEFAULT_DTB ?= ""
 
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 98af4aad14..384d7dcad6 100644
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
@@ -485,6 +487,7 @@ class ItsNodeRootKernel(ItsNode):
     def run_mkimage_assemble(self, itsfile, fitfile):
         cmd = [
             self._mkimage,
+            *self._mkimage_extra_opts,
             '-f', itsfile,
             fitfile
         ]

