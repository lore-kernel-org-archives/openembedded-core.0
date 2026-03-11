Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A5B1062889
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:25:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20188.1773231916665768061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 05:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PSSubMsI;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=LG6U+iqH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7QBKI2030967
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tfX/CXpJK+e695UdTsvTD0rheiwQFdDSK6V
	4LtiVXRY=; b=PSSubMsIkqcuD7q8R7Pb5y9lAxOiXo3g9JIAuzivU72qkUicoTQ
	3L2c6+lWVFqx4cfRTnW8RdgRbLW4xBUJI+VzkDp/0W92/mrwx4g+6F+byN2Ultzl
	6h2cwUq0t3dJBF/Ddj1joI+Gh3DanL60s6h128529IwyQrPX2bBjAX+hHu9L/Msj
	xfjdls1ezf9CIXYYWLnFgk7RNV3TWyBNCbzZ5C254UmHI9lWdPg41HkNq79MPFEe
	5tIBBBvcdnFu3oNga8n0kLh/fnBWv/GnTY3iN4zaL4NKEslRsP8/2Jl9aVelrB8i
	qoeg4fp7Psk7JMhFoAAGZ4d+clHZGrsjaLA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h13rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:25:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70dd30025fso52389238a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 05:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773231915; x=1773836715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tfX/CXpJK+e695UdTsvTD0rheiwQFdDSK6V4LtiVXRY=;
        b=LG6U+iqHgpn/FTk0JqQYOebdLuY1C/lOdNrdGMhHQGdUZVHkyt60duN09OWM2EV2PJ
         HuPQniJXDn0dkn6xVRaE9Skp4tvbqSylP2uLm44s5f7pkTChRtueY4yH+wKsxEx4xuvH
         735lY50TyZCMyF+XbYr4/fF+4s3UzRaubSojIe9waU9O3/Vdp25wMQBHXKkoU1kSmHpP
         SEmeCPq5oZtZ1D6nkXcXPp7TRFdFYwDogotFwWxocKggkVsCRww3BBbyon2PEphhAfRe
         rVX6uDk1CGhLqbshM5+LkvAUPt2enH2BdYb9BevL5AXenUulCy6SHiN1HxKGdCEKrQmo
         H95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773231915; x=1773836715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfX/CXpJK+e695UdTsvTD0rheiwQFdDSK6V4LtiVXRY=;
        b=wrpTzFJm9d8sIsT2GRARwdC9WMasXno/J5DF/IPJB5n+vw5pcPEkgthltwGmf9KD+J
         QuU8UocQJirR8C8pT3K2KlPHVOmKYKt4IRw2AXC/SXOx6uw2ACp8CSuN/6lLrXrUO0v/
         xYXNnWEMb9j6Y0DvQD0yEbo9KgdeesxTkZqPA6ZdFo/VEXEbXs/r4U7SfmQ1XpoiWqvO
         I8hMZJBQUuh9LqsyDN2PyIVHJeK0HQ0wgtWOAgzfLzE9+RfSbKS8RniyFrW5Ggs08ggi
         S5oMIZZWMp4JoeHYq/Ka6KN0tdNQIUKT5zTQKey12vMaM/dtBfP7wAkLgw+vqE396iVt
         jrqw==
X-Gm-Message-State: AOJu0YymI2GV9yKOuiVcSvfYh97if9GInR7XDG7klLu2x0kfTLTrqIVS
	cJ2FTJKodj066X0a8ypY1QYtPfa1XsQljwGbnxdBHB5vh8H3rOmd8kwRCbSulpu0GmKR9LSacMz
	XtwJ+fkea2oGE20uZyUsrmtohIFgWLJmX6+tJmhMnTi6t8tGfLhc9pwg7nT26XO/4TRbLUGjEX/
	Os4pKMbkUKceDU/rQ=
X-Gm-Gg: ATEYQzzS/3MjjsSfnWCwx6zyF6IKT4XiPyZzsqcA33YRZETPIkxS4ABu6+TMt2mTy3H
	gtr0NGDW7CwJky3O5kFnYCzWHVe22i4N5ja0AvEqW1v2xcZEV8XBjRvijg/8nRIdXPw77Z5SZMq
	MI7t0HjYfYKFtN0iO2F1yahQLJy3EvzJIwmgQzet/iHhNd5VnLXlEnXRjto7ggfs31BVn2ILF+Y
	xHrdsKpoPAveRl2zGD0jCLKiHnHneHabbnG7VtF77rnyAx1Htetlb+cTYiP/WDDrjq1y/nBUnKG
	kG7fE1dy5PsHHUAUbvR8pt1ozjK9Pbh+KTwMQtEuybTJAXSG+2nmJJeENznBCld9HmzPy1PDgeF
	pBTY52ZNFp1sVXGwo7lByr0ZEgx1il4tzOhvu1iGfVWyqa8tXcOye02c11fKrmLyo1AuKYVQEkq
	lEq2F9sUp23LrGtOgm
X-Received: by 2002:a05:6a21:3396:b0:398:a71b:a0cb with SMTP id adf61e73a8af0-398c5e5a256mr2746804637.5.1773231915269;
        Wed, 11 Mar 2026 05:25:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:3396:b0:398:a71b:a0cb with SMTP id adf61e73a8af0-398c5e5a256mr2746767637.5.1773231914756;
        Wed, 11 Mar 2026 05:25:14 -0700 (PDT)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf254acsm2365113a12.11.2026.03.11.05.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:25:14 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][meta][PATCH v2] uki.bbclass: make DTB packaging optional
Date: Wed, 11 Mar 2026 17:55:07 +0530
Message-Id: <20260311122507.2121997-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNSBTYWx0ZWRfX1oOk+c9FSNt2
 dOdYBdc8lOy6AN8jL02AVTRmtSu42D8xjPFFu1CCXPKtt0iMC+fBSz3DIrEd0DN0gy+WRQc64NQ
 7PkPWgeuMJlA0fiq2OZISS3FB0pLvr3sBvPnnxBG2TLrNnlLpHEUL8oy95EKktUj5c/RGHed9Ty
 C/LlDND5HS24nXTvk6iKeRPpCayqxVpyaCq2Mm43n3dtgSsL30Q+AAIQ7N0ZlYFAZo7FRGCkuJV
 IMYwqIRSHN9otWFCrMic+sywIq1m0B7bFgRNOlfxZmcty8cvDvjMFNUVvkQMmlZsc4YN3Vblzj4
 Tahia4KqVihVcdarmFNbkdEoLtdaSr/+AGiNoMoNvAuiypdTZKhi8ONu/gZ5gbUj7raoOWaMTIv
 CeHZ0MVu4YdaeLb3lwQRbPWcDOOmJusZbp0F1wmep1Aww5Gekq6A3woYSwWEdL29sEBIO9rvKVN
 GvJVx7zjKCoPCoG/xFw==
X-Proofpoint-ORIG-GUID: dhnl4aPTPzub912nwplg4Bd9c11iViby
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b15f2c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=nv23E9fyAAAA:8
 a=EUspDBNiAAAA:8 a=pGCm3i_11eki85_XzS0A:9 a=x9snwWr2DeNwDh03kgHS:22
 a=ehkDpipTsgk7cDPTKqUC:22
X-Proofpoint-GUID: dhnl4aPTPzub912nwplg4Bd9c11iViby
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232871

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
 2 files changed, 10 insertions(+), 2 deletions(-)

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
 

