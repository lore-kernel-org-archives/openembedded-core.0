Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D1ECCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 12:02:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.7531.1760097722324162258
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 05:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aliDfYXG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6Wgmp027202
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PvMeZmlAxNmwjbglfcZ+ML4PWeD9YRSrkXg
	V0CfEk3E=; b=aliDfYXGlg1PZz7b7zeE0DzaVuZbIXJn4F//JJG5YWyTWFeiQEC
	0nu1sauX4VHfFkR5+quksYT53W7FZRz32ZWOTvL95MYeL3b6bgAwIXw0+IvOzhGB
	rU5G3F9meFSi/0IWY5RMBGNcM3Y/tmnHJIogw+Mnmks5e9vQLPZEYKOrcUN5flJM
	aTQ2FfFE1BinO/nyCZdWBDAdu7JiUCGkcLHLF+xmy78Zoy5ynkB4EnJ6AF6z+0pV
	VxoZXu9Eldmi6TLz0bQmLENy8hNVe9dRFQkF0PGBSKKq5bYFrIHfTC8u2sOycXhA
	9XjDsYrenLxcNI50k9fIXaDK2uXbRqX8ZPA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4np8s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:02:01 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-54a7c3c3157so1017016e0c.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 05:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760097720; x=1760702520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PvMeZmlAxNmwjbglfcZ+ML4PWeD9YRSrkXgV0CfEk3E=;
        b=AZughg8ETXrljq1BXDY5rNSV+cLepuK9covKtiUjFrlVILLAJe+OXinE3mCADl0j6k
         N9LKxuO6e8Q5sbV3jCkcPDwsm5Z3qYC2/QCINhHzmRKW2ytWG6L9L9Zt5QMp9SGY2oJD
         +IuGdk4WcWOI2Rq9vhchUg7jU/GdpKS3t3S9x1owmRjgfLqjJ+W6xxy7rONniXJ7Vebz
         w9W2IwdXRumzQhnJtG2eEWvnnBPRfUUdW9x5ZjrUn0khNYoxfKlEJue+fojgniukRlrR
         3kLHPubGZWb/tjIbgtmQkl6kGtPb9oXZ+QUnHniB/08d2Rpr3+CyLQDwO0V/6PNUSDMj
         VYsQ==
X-Gm-Message-State: AOJu0YzunrCcgYqK1h/USQytGEP1ehg/DYvJq5iLRZbEINBfh6tpEA7p
	wN+pBCaKti8kd4ryNVcsNHi9XjNufLcjLV8R19s7EBwPJjVKA5fHibViSTU+WTFLgVZqXTi6fgr
	Xt6vzZUgSIfZlOLOHMKbM2ti4hnDRHLl3A+uYlCGzUUQCa+6PdBeGRoxnts0klSee/PXgdAk6xM
	xMJr/CCW41WxqMOjA=
X-Gm-Gg: ASbGncuEEIutb5c/5Baq5Lc5/ggIzmr/6lA6DPcGwTCRTcLgU6ldbtAQN4C/y+mxjKa
	Ar4A18R5rcAlhSuChFXVXBqO0J/MWnT+ChCdIw0PXCiPpJq42dMmpTf4ExvlCoK/UOPgob7JJXt
	5EWmRdgpZUApoW5++STHWjVXd3fi+p6mrJrapwkLNcOg2Hys3nXReJz/FBi3P2dcP8Gkm0lkp4t
	rI6pAHVpQNSY+j7PpeC4Qq4/61IrZYaS8UBitkXzJDLDW3F2mJR5kIfqpkD0fi2UXdrjhbivBqy
	oOe1sl6stK8lEMiyJxIuEsH2jmilgSO2QKTl3hztWEd8xTQFoPJZyY3Qm5uECh/Tt+3+Cmd4llC
	ywHiD3K1gYvKW2He9EVYcRaxWr24lYjoBUcRfkwp+8EsA4EpG11Hu
X-Received: by 2002:a05:6122:1e03:b0:542:2912:664f with SMTP id 71dfb90a1353d-554b8c4f246mr4843321e0c.10.1760097700451;
        Fri, 10 Oct 2025 05:01:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm5fhh/1xnoJ668byar3JTD/wKUb2lL3+I6szncklLRqtQA1LNHD9ax4Oyzp509UAXg3nISw==
X-Received: by 2002:a05:6122:1e03:b0:542:2912:664f with SMTP id 71dfb90a1353d-554b8c4f246mr4839503e0c.10.1760097688694;
        Fri, 10 Oct 2025 05:01:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-376350710edsm3603321fa.1.2025.10.10.05.01.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:01:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] mesa: add opencl -> clang build dependency
Date: Fri, 10 Oct 2025 14:59:48 +0300
Message-ID: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXyt1a5eXGBaHT
 isRC4ctBgwbRVM+hOaolXPqtEgby05/iKhcQchRYV2mRtbIsyaCajFudJlwMnp9jAg/nS80N+Mr
 7B5YfkX3qtPl+7RJy2S7ZZ8K0kO3b1rWgfNbYa9Nd1aM+Xva+FLs2VnDxmrcMIBZEhZPBlyJRIv
 BLfJDQq5urjP3A2azG9/Qh6CZ2xtyCP+shO1zHu1ojgvfOXzy6fp7kjFVsgkI+oRFvgSdW92B+t
 9plB0sWWR9VXpXfVBNBXN977/dzp9/mJ8OgIsvzRhNUdjTebQcZVEMIHSFG83UILKZ6x5EoLJV8
 uDtrrgw5VZ0P0GLZ8aCUcuk0zIcxZm4LAS8NctBE4nWnGi4LPdp5xzD6H0B71BcEYI+q5x2+C+f
 W2gmryARUF2cKuVjNxYJR1kgzvxkNg==
X-Proofpoint-ORIG-GUID: UvdlTVDsDapUbiIOFt-OFtQTCcuPligr
X-Proofpoint-GUID: UvdlTVDsDapUbiIOFt-OFtQTCcuPligr
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e8f5b9 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=EUspDBNiAAAA:8 a=qdqgNLty4rKUrxxlkwEA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224683

With the commits 448f4a84cb22 ("llvm: add recipe for just the LLVM
libraries") and d76dc362c8e1 ("clang: use llvm recipe") the 'llvm'
dependency inside mesa.inc does no longer pull in the clang libraries,
failing RustiCL build as it can not find Clang libaries.

Add direct dependency on the clang in order to fulfill build-time deps.

Fixes: d76dc362c8e1 ("clang: use llvm recipe")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

Note, this fixes the build issue, so it would be nice to pick this up
even if there are review comments for other patches in the series.

BTW: would it be possible to enable OpenCL in one of autobuilder
configurations to spot out such issues? Or would it make sense to enable
the 'opencl' DISTRO_FEATURE for poky?

---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 7046deeb2b63..f299f9570284 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -128,7 +128,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
 # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
 # Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native"
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
-- 
2.47.3


