Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360DE105A596
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 12:58:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20589.1773320323984100113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 05:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gAHWj83z;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=UmFe8AaW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9Spr91756007
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 12:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2pQlc4Sa4eRuUCWKk5noJTDhikTk7Ph3aOT
	PJawYIy4=; b=gAHWj83zyQm4fwCuGw9+I0a6Bdf80N4QFo783q8I+n4Mm0eglCj
	Y/DPNU1gJQL8VA8vTMbM/9qEA4pGjq1y89jOJZf9BibYRdmcL8B5m3p1bRLA/iem
	HJ8QSCHJnKDGF8eXtvQUINRjCSJQFP18a5udO3V4mcDBLhDu2RhP7kPj5NW8gn8n
	OEjcdGP08kUY1V0ui9YLPvdDfak0jsQ3TlX3AXW+l41SWbq6CmWktbteoKPi0FeF
	mNzMfPF0LKDtVcgMjavhE/SWQT4e3+YGSxJE92p/o0PbNDLR5/A6aEM+Oxzr2WT6
	LFIhtTYKXEJW4l59QkMvJQqMTAeX+I5W29w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53j42p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 12:58:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7385e8fa73so516967a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 05:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773320321; x=1773925121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2pQlc4Sa4eRuUCWKk5noJTDhikTk7Ph3aOTPJawYIy4=;
        b=UmFe8AaWmj+rVOU2akeQqqNq7p3eJdbabj/rB9sr3Z2oQr3loCJ0CgGbCXv+U1LD5o
         ohnVsHYc+nhjA99E5voD67I0PN4iuynM2TSB6gb2JoPvu06wSdP21VqLlTbZtAs72P9n
         ZIf7HeqNdmZnJY8TQmloy6wbdtCOQ4UBGvGzRlPh7SFpCQ0qW6wRFjx01McS3tYxlNrG
         euZUkOC+pKEExLyhx1LNL1zqRwL/czvhdqAhR3yMxXtqTCExqGteGKwu0FX+kPCHC9hm
         tQ92uprlBeYD3jx4hXGb8/aR2ygxySBcpE+enEUI2P5A3BBxWSVxShFP3X/UxxKvpHyu
         zqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773320321; x=1773925121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pQlc4Sa4eRuUCWKk5noJTDhikTk7Ph3aOTPJawYIy4=;
        b=dO97BT3aZjN2mPC1kYawa1kZ1ofZiCfXWqm3mcNRYcofSb1D4gHFJIRMyEj+ySAXI+
         /olpVynO6wOc+sGrSwWXZDY8ddjmc1DPiG5C7Q/932N6+Yr+zeItE1Sgl4vFz8eDykdG
         9wUiil8Viqvy77E5GHL+wkIlZ6wBCL5Cw79ifcYGvi9305PCC4GFQHFPcv9j3BJ2ZQeq
         libwl7G4xZpg25x6TeTPS5Rk2kwOQocwDGqXIs6VCiAgRNd5FnFqCtzOQkvIDF2dVu8B
         A314OC+OyXriGGKRxegVPVDGCJ0dVz9hfZtgoclOsZZXj17s5sLoMjLX6XKyMCzRojWt
         IsEQ==
X-Gm-Message-State: AOJu0YyuqyG9feqjVWoWR/Ni+rPY1SQCA7I4X+73WqtxKyXNjNgxle3S
	QogwsgXfDgngNxdGtWUQDkwY9Cc7Sz0HLTaskbdCUmvua1rtZv99dbZuhXqaxVw8R0EIHcyPNta
	UT6dD1oAIjGkzxva9rr35a3e/+5UOZmmILQyqxLnB6OMHZfplYHyqvS0Fg5QJRBBlapHacMFA51
	VLV1/O86GOFx4gkgQ=
X-Gm-Gg: ATEYQzyGAT0UuHul54Cj6eHmgF9gZdqMAXQQIa68BHs8cSbTd+RFJrK8KhH8rwtaqln
	J31PVeJHVpbSANu4vupFfxQGQjuPXfUpPX5Hgf68CqLei5H5SPdmVw8vGOvn9XhmPkOmF3cK6WM
	F5VFrnEpUvMH+xmqIZqPFRjOwW3SuD5/pBAODEmtjt/XgXbtcWTcUz63SjW1FCqKGoECeaujT0g
	SNm15RNDpUiWg+yG5Xvk+TKnOaH6a64upH3gfxKb8IK5HTxJzTUR+xWNbZZAdhzaLrBVDtNXb3W
	E8w/MTi7loEiH9qRU/EsCZXmOgbG9TpWCoyXO3YC5Tc6dbZ9IhkxxkV6mNE+OFsImUT6rmC8gQu
	j00ciFOrBoVCnyabJnwlKm6NuKFm6QEiWra3JQMx8dPvbP55l8r3gLBowtktn+dDpZIFRyQCXj0
	NjQgkjLngzD42fRGtF
X-Received: by 2002:a05:6a21:a8e:b0:398:7796:ddb8 with SMTP id adf61e73a8af0-398c61591f1mr5761693637.60.1773320321424;
        Thu, 12 Mar 2026 05:58:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8e:b0:398:7796:ddb8 with SMTP id adf61e73a8af0-398c61591f1mr5761669637.60.1773320320918;
        Thu, 12 Mar 2026 05:58:40 -0700 (PDT)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf9f4f3sm5535926a12.25.2026.03.12.05.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:58:40 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH v3] uki.bbclass: make DTB packaging optional
Date: Thu, 12 Mar 2026 18:28:34 +0530
Message-Id: <20260312125834.3046637-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b2b882 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=nv23E9fyAAAA:8
 a=EUspDBNiAAAA:8 a=Lby9I7hjc-63DjEmYVwA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=ehkDpipTsgk7cDPTKqUC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwMyBTYWx0ZWRfX0zfePRQ74gxt
 c/HNgMbhbMHZ+mf/ehNjrGY/O4VfLZFBd/jY5EA6/DAFr5iuz/L41e8RHnsaF3ojLSg9VhlSiWY
 9jYyrg7bxcNvhkTZjNZqCyTVyZiErexjhdXcLrZ37YUshJ4BqwhQLAiJHuxikdfsvbL2v4+EbzZ
 NPfaIE+ZY5kkCeXlEjLl3Fo2KFfGCdL95P+TR4qaWKTffgpMwPEJ5zNVzwGNGCf8z19zw0RR8cj
 HBOQXcTn9Uk8CAvBXn2d5fK2K/117xfkCtYcP7Hm1/7GhvmypelWc/KSErqrt0paNpcgYYZ5ADy
 5DsPvJxbPw2x2BkS1slATHnIQtySKmUtJUIBU4DkFWty1KP8zRNv2303xClmzuiKJbBaQ0ljIAI
 xJrNmXNNgwPjfKx5KXK2HmXrOUKxP1cw7/g57shO94qgbsNDJcH7FjKfFLBO82PV9G4+DKnHgc7
 tU+YQPWHN822d7/FwAw==
X-Proofpoint-GUID: sjd3Bnk9aHhHPMMfy1I2j-hpBqNfuoO_
X-Proofpoint-ORIG-GUID: sjd3Bnk9aHhHPMMfy1I2j-hpBqNfuoO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 12:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232948

According to the Unified Kernel Image (UKI) specification [1], including
a compiled device tree in the .dtb section of a UKI is optional. However,
the current implementation always packages device trees listed in
KERNEL_DEVICETREE into the UKI by default. This makes uki.bbclass
unsuitable for systems that rely on firmware-provided DTBs and do not
want a DTB embedded in the UKI.

Fix this by introducing a new UKI_DEVICETREE variable to control device
tree packaging. The .dtb section is now populated from UKI_DEVICETREE
instead of KERNEL_DEVICETREE. Users who do not want DTBs included in the
UKI can override UKI_DEVICETREE to an empty value from their recipes.

Update the UKI selftests accordingly, as QEMU does not provide a device
tree to embed.

[1] https://uapi-group.org/specifications/specs/unified_kernel_image/

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta/classes-recipe/uki.bbclass     | 6 ++++--
 meta/lib/oeqa/selftest/cases/uki.py | 6 ++++++
 meta/lib/oeqa/selftest/cases/wic.py | 3 +++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index ea449540db..326697a066 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -80,6 +80,7 @@ UKI_CONFIG_FILE ?= "${UNPACKDIR}/uki.conf"
 UKI_FILENAME ?= "uki.efi"
 UKI_KERNEL_FILENAME ?= "${KERNEL_IMAGETYPE}"
 UKI_CMDLINE ?= "rootwait root=LABEL=root"
+UKI_DEVICETREE ?= "${KERNEL_DEVICETREE}"
 # secure boot keys and cert, needs sbsign-tools-native (meta-secure-core)
 #UKI_SB_KEY ?= ""
 #UKI_SB_CERT ?= ""
@@ -149,8 +150,9 @@ python do_uki() {
         ukify_cmd += " --cmdline='%s'" % (cmdline)
 
     # dtb
-    if d.getVar('KERNEL_DEVICETREE'):
-        for dtb in d.getVar('KERNEL_DEVICETREE').split():
+    uki_devicetree = d.getVar('UKI_DEVICETREE')
+    if uki_devicetree:
+        for dtb in uki_devicetree.split():
             # DTBs are without sub-directories in deploy_dir
             dtb_name = os.path.basename(dtb)
             dtb_path = "%s/%s" % (deploy_dir_image, dtb_name)
diff --git a/meta/lib/oeqa/selftest/cases/uki.py b/meta/lib/oeqa/selftest/cases/uki.py
index 9a1aa4e269..4265a40e9e 100644
--- a/meta/lib/oeqa/selftest/cases/uki.py
+++ b/meta/lib/oeqa/selftest/cases/uki.py
@@ -47,6 +47,9 @@ QB_DEFAULT_KERNEL = "none"
 # boot command line provided via uki, not via bootloader
 UKI_CMDLINE = "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
 
+# qemu provides the devicetree at boot, do not embed a dtb in the uki for selftests
+UKI_DEVICETREE = ""
+
 # disable kvm, breaks boot
 QEMU_USE_KVM = ""
 
@@ -106,6 +109,9 @@ QB_DEFAULT_KERNEL = "none"
 # boot command line provided via uki, not via bootloader
 UKI_CMDLINE = "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
 
+# qemu provides the devicetree at boot, do not embed a dtb in the uki for selftests
+UKI_DEVICETREE = ""
+
 # disable kvm, breaks boot
 QEMU_USE_KVM = ""
 
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ecaee5a291..461cf8cfde 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1556,6 +1556,9 @@ QB_DEFAULT_KERNEL = "none"
 # boot command line provided via uki, not via bootloader
 UKI_CMDLINE = "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
 
+# qemu provides the devicetree at boot, do not embed a dtb in the uki for selftests
+UKI_DEVICETREE = ""
+
 """
         self.append_config(config)
         bitbake('core-image-base ovmf')

