Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22007E9A053
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 17:22:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19505.1771521759902964472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 09:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hm847Mp3;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JH2EDTP2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JApxUJ3133093
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 17:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oBLwsEGJJBCL20Yan9XIPpBYs40c9C2YfRJ
	GkZAmOmA=; b=hm847Mp3lSDqdiOPm3/LokCvNDxlJsE3flSGkcuQeOGrHpeDsVJ
	mDtvH/YyFOMuhE7+fzKnAagrPgzSAoTQNqgoppwrkZC1vXnTfY7mZvNKRKtB3qmM
	kdX/s3j976zLnnH0W+gCoggr1jmyI4RglNW6pMYsGUJrzGeDccmdbRl8cMTOrmJe
	7bjipvhE9cRSjW6SCkROvD+btPxh19XDMEo6mHKgMIDTdKsLpD0fFgduxxFD44PQ
	973qQU953RkUR3+hiru4eM5Q3gOC6gE00m/RcKwIdQ9w0q7ojHNM0FwKmS/22drD
	fZCvTGpcNHOcMA/qvI1iibyF+l0wROKYiwQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdmxvu12u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 17:22:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a92a3f5de9so7045435ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 09:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771521758; x=1772126558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oBLwsEGJJBCL20Yan9XIPpBYs40c9C2YfRJGkZAmOmA=;
        b=JH2EDTP2nszy1KR1e52DMZV4bgjc2aWpuAuk7xqMAxHgq98NqqrBgafe5yCGCaRiCa
         kT22Ft3zfd5d/XYfR7nDXvkY0hBvgFJH2VvFmVD+mrgGpeGXyHFPboBzVKbtExl+4TZS
         L0sL96/HlarmOC9rWKdsl0JXFs7qcLG0CBvMtbpNz6APd6DY6GuRMhE69Qvd/SgoTQLE
         VCXaazJFQXJm+v3NxfokK/sFHg2Jdh72cEU8VBflppo/aeCdqVi4AKuZnRBmZG0PfmDK
         mPNWFZ32hcV2U8Tyqi2gruoajDM4zfphrCrMjtwqk2rLVJ0tvTTPggqL7/TvpNkwXG82
         8MHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521758; x=1772126558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBLwsEGJJBCL20Yan9XIPpBYs40c9C2YfRJGkZAmOmA=;
        b=MwAWEc+faA4LpzJ9FraSBqYd032diRfHwo3ko6m7um/IEOxILazAgcmudRa+4uBYIF
         L0Rd648RZ82AZDFYah58KBGtDMQZjnnBUXv0Jxcn8OdD5vmBrw3XlmA+UtfJ5O+8eOrH
         WIKFwuh22igdPW5EBk+dbF8+X+gHBJ79B1R5GvSMXZTx8vv6UTxI7v6awCkC1Aw4H0zK
         3+b6+DwSwcX3Th2/R/AXyDuMNxscJIqtR0iZh48Ssewa5fWtlw0z6CtpGZxM72/lZGLp
         wV4XDA/AHkupLpqvON+j6cogUW3tnF4sWURHZcavG/rb9U2YGfrJk3WcSfJiKBuJhXWH
         gkIA==
X-Gm-Message-State: AOJu0YydFH4DvpRUut3IT3AiVOAq8aWknwTXNv7zFyxtqQeQkBanIgTu
	yEmcCdXhgpnKuzuz832DHwQcNXCRG5Iy12BrmDQAdEOQ8rMn4ZpRjH4krDdh+9cMKeUz/QfY08U
	hzd5dt9gJ6Zy5jtkzoJGRhmpxaHPxh9fl285j8K4dGZ54iWjJixJ9QkRqNoUxLlFRuCPSodSSF8
	hpP2AMPvFByPI6Tj0=
X-Gm-Gg: AZuq6aKw+vHresSXO+Rph8WWwu6d4WQePOpoDxxGMxiXwV2WDjYrvtCcfl57tpwfH1b
	ki9i9iK+7iAZfopvGnMmRcDSc9qq25ibsZDT88b5OYkT74siN7+8x0JDFNB8DQBm25pArEKOy2q
	sfaV/BHzoebKbUNsWiP8Cp61LXaO7yuUYL1Pb5kJb/gtLLs9YR4RBjN/teaE6GUlNEmopuN7IzX
	dFz2U42X/f7NdHgZzc1/Hk2/aBEQCIIRt5kIcvvKJKVLb1Cq3Z5+a+wq5N0LQBDUecBcz0e2tPs
	SNnBRga9q37Wf5APgn4waPbk4GLYhTlssltyqThNlEo2J7RMCtihIxxC/BT9AF0yiIHE+PUkivU
	NghHdfRKvzxo1MtZ5bKmE70Qu3gHEKqzm0srclY3GjDzmVCqw0iAaLWXieTAYjUk=
X-Received: by 2002:a17:902:ccca:b0:29f:1bf:6424 with SMTP id d9443c01a7336-2ad50eb1b32mr56716845ad.18.1771521757442;
        Thu, 19 Feb 2026 09:22:37 -0800 (PST)
X-Received: by 2002:a17:902:ccca:b0:29f:1bf:6424 with SMTP id d9443c01a7336-2ad50eb1b32mr56716495ad.18.1771521756807;
        Thu, 19 Feb 2026 09:22:36 -0800 (PST)
Received: from hyd-e160-a01-2-02.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aadd140sm177281305ad.72.2026.02.19.09.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:22:36 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][meta][PATCH] uki.bbclass: make DTB packaging optional
Date: Thu, 19 Feb 2026 22:52:20 +0530
Message-Id: <20260219172220.3848330-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MCR0576tEhFKi-cDLPUljI7PxHsgZb63
X-Proofpoint-ORIG-GUID: MCR0576tEhFKi-cDLPUljI7PxHsgZb63
X-Authority-Analysis: v=2.4 cv=XpX3+FF9 c=1 sm=1 tr=0 ts=699746de cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=nv23E9fyAAAA:8
 a=EUspDBNiAAAA:8 a=Rc8D2G7uKTYt0k-AzuQA:9 a=GvdueXVYPmCkWapjIL-Q:22
 a=ehkDpipTsgk7cDPTKqUC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE1NyBTYWx0ZWRfX6BqEyXGEOxRF
 IcNHUrvTSZPAK6wZwErMjcULsCLM8y8u/DuVlVQAGu85CAOCxOKWSlcPqTn/wGOtzA5/GrwhRVD
 lXOOVgODLSYXoQwxg4t8xmQXXbegRp2WvP8Kxj+nrgsW62Sd3jA106Pt5TJ0BCOsMxVI2pNzN0k
 gOkOrjmNdGdpn5HlwVQuh6ZEOAELxasJl/sxNfgYSa0IMGz9efoOYmKRj/c+kO9SWi3m0JnIU0h
 0lyUVk5HUotgFCH890Hvbu7wkZGsJDgWS0VxoyvXE8XPkhf0SMEp8iJVS6fRlhOdVFIA0Ei68HJ
 WkGySJjBQPe0TgItp1r0pFuB6ohKjDnuGxwTZIQv5QlNGyhcWUQ3s+dX/4wzRzPviDRMmjQRGH1
 hSDLjizQVgj+hySK3npbPhIWqWkF0q9qSm3LgttShXOjbMiIaC6QItElPyIJEB5wKSV1An6XpC/
 wgCxg9gqtnFRjQMEw8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 17:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231436

According to the Unified Kernel Image (UKI) specification [1], including
a compiled device tree in the .dtb section of a UKI is optional. However,
the current implementation always packages device trees listed in
KERNEL_DEVICETREE into the UKI by default. This makes uki.bbclass
unsuitable for systems that rely on firmware-provided DTBs and do not
want a DTB embedded in the UKI.

Fix this by introducing a new UKI_DEVICETREE variable to control device
tree packaging. The dtb section is now populated from UKI_DEVICETREE
instead of KERNEL_DEVICETREE. Users who do not want DTBs included in the
UKI can override UKI_DEVICETREE to an empty value from their recipes.

[1] https://uapi-group.org/specifications/specs/unified_kernel_image/

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta/classes-recipe/uki.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

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

