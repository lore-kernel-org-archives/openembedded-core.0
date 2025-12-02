Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F18D116FF
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 00:50:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7150.1764636597813068194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 16:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=iDsyHsmv;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=MaCatSJ7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1Ir527979040
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Dec 2025 00:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yZ2QKvqvXRb
	/lzcuT9oP1geSXw3hu6klEB1f09As/Z8=; b=iDsyHsmvLlAqUh0xHNzw3iNaUec
	wufZhQ2xbiSu3pFQva7F/R8VWPbcrinS9vx7fH+gNP4VJZhkNsIk/fj/+hm/lh8k
	QGjkfcJaWUNf5Y4kP7sN3+l/ILmnXS1tadF7bApYNezPtjGRrlFc+tNIJ5p5Bab/
	Cur+S2FfCvmPFkopkW+fRV72lawjKwCbZM+9/nrUYQ8kZwUg5uf6RxLe7jJeQ0EG
	Rwf+u3qWRWgbbKn6VXR/uK0Qa+A5D8ZykpjWqb2J7qguN5YmUB9bNKXi6GTQkccU
	FSw9UYqWb+DW2HBNke0Tpy6UngUbnlSZi/P2bkQSqQKvl8N/xpnEFweO6aw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asgpks42b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 00:49:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b286006ffaso865056785a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 16:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764636596; x=1765241396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZ2QKvqvXRb/lzcuT9oP1geSXw3hu6klEB1f09As/Z8=;
        b=MaCatSJ78rh1+1DvDFmTOScI6yzhUJ4tASpU/UCDwGNG4nbA/5lZlP4u86bk/dzyIo
         DYp5LzEAT0RZkhvr+BtrNO/iACXdF2MPTDZVIFhnpZ2OwP5dc7ZiyiFqabDjy4/R7gnU
         c/N2iEx80KZtPf1OIboUzsgPx9ZfXs0uOMxOVChmZMaNY7U5kIvdtSZ0CAFw/dbGlAe8
         We6lzO8h56i0lJrF4y7/mGtn167OJL9gUZNRfH2iUi78fFeEyUN8zMVwFctqYwsJcBFS
         Horerdcfu/yhFgPpvCpfJUjj2si6bbev1FJBjM2a1HkkZkoeuPzllwMOAIo3oOQOCOW8
         SaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764636596; x=1765241396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yZ2QKvqvXRb/lzcuT9oP1geSXw3hu6klEB1f09As/Z8=;
        b=j34z+VrX7NzVNVkP/1GfF1F5FVU68KedTbRLs8PbPBoLEAtFtElMg/cu/wcYsQIv/U
         x9OHMrdiihkvQE2F60bXqk4H0XVWExb45uzwtWWC0GKqlipO2lChtLyDjm8ver417Til
         mN0wBfAkQ3WOKZunkYlGDjB936d5M4F0xyTkDkfpY5tX5cZIuhrYdMNQ3Mq0NKELJY8h
         nRibJ8cumqVB6BG8LsOGrOO/mBBk+4KGnKnv648uBUEQwbiVWh5E9EQkZgyxdcsdB6Aj
         u8vrN1E1N2/ifAPymadObb7khp1a5wym+VcPIp3NkwDL9j/3dhszygNFBKINKxIOuRBm
         0S9A==
X-Gm-Message-State: AOJu0Yy3xYP1d64khQ14SsQeF2MMFdH5On5c9gSm9O1ucD9O0Xi+x2zD
	8nYL/AczJiip/USUMm+lGjhv67LielPGIzq1c3eawopPKP+qdWhG7zAYa3AKC8kyAt5R9fX0Xs7
	GemHrLY0y9LE9pvnoFVYp3DIqAupEyvdtHF1vPaEnZZkT1USqcCOSJEXr+uzxqMqjHt9BRMbpbV
	QBkCMIvzdircznZac=
X-Gm-Gg: ASbGncvXE6yi25AwasUzBD0XelSwQAp1Mj9ZqSV2QA+k3OJtLMTNLf1NScStvNyWtik
	4KAJoD+N67V5EXZSuKiqEqcWrAPfcSKgpizhL0gihLuYMu9+ozIHFReJ7U+U44z9U3SyRrAgF6R
	12a6KsP9AZsd4rMSo6GQt1o/fuhS/bnxC0V6M8JZ+FOYwVwSxnjZhi1RxWMdMlhCv0FtNEkC+sQ
	RhQWgg3pzH7CjiFP0e6syoSmyhRvEvpmScNppSfqlRumT8ynnWhQ1SfP6pIjsXam/lmkrNQWYBl
	bsm5FbtFsXrz1qqA5deIxx/ZE4L+doKIiby5rlpieRWDqfEaHVV5WqpISoh0Os0cIrOpMauQ6b4
	uk7EBp1YljVnoC/YEDUxVWLYk5ATT4Ak1psz1v/4EaayQgGImw9Fh6ov7ZvlehnN+HOF8Ux17t6
	rIl4hooQX2jBZ3xpfWpLz0VpQ=
X-Received: by 2002:a05:620a:3711:b0:891:3606:7f3a with SMTP id af79cd13be357-8b33d268179mr5229733685a.45.1764636595870;
        Mon, 01 Dec 2025 16:49:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIz6lc5Q+TpelmgoKbK9d8ytilKTQEMolh7f4YkBel2FbPjRdUS3g39SAm2b+2EKUyevNVSQ==
X-Received: by 2002:a05:620a:3711:b0:891:3606:7f3a with SMTP id af79cd13be357-8b33d268179mr5229730785a.45.1764636595341;
        Mon, 01 Dec 2025 16:49:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48d67sm4058173e87.74.2025.12.01.16.49.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 16:49:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] mesa: enable hasvk Intel Vulkan driver
Date: Tue,  2 Dec 2025 02:49:50 +0200
Message-ID: <20251202004951.2358784-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251202004951.2358784-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251202004951.2358784-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kjGiDGvUSBWQ96gOIZWeeGtHLF1KZSTM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAwMyBTYWx0ZWRfX8+45a0Ssb8yD
 sSvVDUbNqee+5Rl34trSECf5sArUqNqXOUBONnX0j6ZdX+vrq4kHJcebtDU+hKXTYN9F1i2BkOq
 L8+ZLtGYIBXGo8o4v7Yh2g5VWWiebirri9OJNkaaKCmOZOc51FlOz3aGhIC5+bWOM98ritChpR+
 VJNqWpsRBtCHKRcZaw16bWXk5qkc/Jd3yPijjh2vR5euymsA8kYrPFm81ere39vpuBhe2iPtzFQ
 s8UkwiQ8ilKRrisebDYuf30cjDDiGNvd2HvVydAIT+1O1L6twsej9WW3j//fq1LTPPac5qbDR2H
 vd+KJUdOqfLMk+v8fJr46UjRkm8b0FlkkX6PVZy+ezYstvTfyF+QQHYg+2BHh0e/Vdj1+5yidJA
 LbvzAu9Sl5DPWyhzb5tnewYhVVIbjQ==
X-Authority-Analysis: v=2.4 cv=Vcf6/Vp9 c=1 sm=1 tr=0 ts=692e37b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=8Zmk7997ObV-toGhOKcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: kjGiDGvUSBWQ96gOIZWeeGtHLF1KZSTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 00:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227143

Enable the iris_hasvk, Ivy Bridge, Haswell and Broadwell Vulkan driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 07be1fa12a3a..420ba2032b67 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -131,6 +131,7 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedren
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',intel_hasvk', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',virtio', '', d)}"
-- 
2.47.3


