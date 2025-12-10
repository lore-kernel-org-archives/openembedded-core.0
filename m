Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC5ED3E769
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:59:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2291.1765389536370367407
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VwuYbcKL;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=j4g7MHKL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAB65Ox2419637
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gUcCcgua+/f
	i1mBRg8hxKfkoDB7ewqNY4VT2BqDjqvY=; b=VwuYbcKLxcFXk6xSUEE9VugPhEp
	xy2Y0jDFOD7jKZOSxIGbqjlJILE6T5IvzpdUbjAlk475RH3CmBiMiXyezTtNUgc5
	lamDg1dvtYI2LJFG2GwgAZ3jq/ZwWOci5nXuC8dFjBo1DQPxP0oA56yNn0w5TzZw
	u1nEm3lysshsIqRpYvpDdmczdth0NQoFItUj0W2YjoZr9E/omSE9X/861aahauYI
	kqslEWU6Bqy5KFIvxnkAwUJC4kes5vWNLSIqXZtWnRgQoJea9WMbM5Z+OG30rVaF
	OXBmNFMQVjpFMoo3WJar3V+PvsVhGD6bAzpW+1z5UWSWApweEBgINft0B4g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay7pp1bby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:58:55 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-55b0c14580fso98980e0c.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 09:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765389535; x=1765994335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUcCcgua+/fi1mBRg8hxKfkoDB7ewqNY4VT2BqDjqvY=;
        b=j4g7MHKLi8LYkKPEV+Y6tcIRriWgudLYYtBPEs+zJrgkDJOKmjWdFzlTZZsUQyIO4W
         bw0FuZ9dokOz/GcUfJAOmaxa5W/rkXNTObbqczujIWaEFq18cFvMJUCyZ2yaY+WJcUeu
         NJIe1gGtMl3pwid6hG2zhjsbdSAJeXTRYfP4X4+17It8/gsz5sO3gmAELDZrds4/7LDf
         XyiGwrRFONUsjbUPcXL1Tu6KNOG4WxBRRD8L+eBSCNlqwmcem4n4yNePiDrp8uqeDt2C
         kN3ZWb8IyEzS/dnkVy1CCe4BTDEYjaGoQETAfh8y8vLMv86UJ4L38BSvVT0WLzsNc66t
         k8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765389535; x=1765994335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gUcCcgua+/fi1mBRg8hxKfkoDB7ewqNY4VT2BqDjqvY=;
        b=MtCQ9++HvnaWiEZHQeh/QrzkA/HD4hARII4VbJPHoWWTIyddUXehzpY/gs4u+hpBTH
         uLZkmtT2XWyyuZb1CQQQZfj6RK1g+BzPlzv7O5R3VB1klnLWhuvI/HuAEuy+x74TS5y4
         1uST7JC+FXkkTuqKDSrsXRh7Fy64ltpuywqmG6R+mBYxQKeYK1XoN2x0nfqPS3prxeoS
         sqVehHtKUMToccmWWy3u8PBOKS6bBQ397whehDBZJPR6MM+V6Hr+TpwfW+KljHhAZVbd
         8S6IANaC7ZHL0r8labNk/DG2PnAHcNqNLAR3vol0c2hUlxLE/KdNnXCAMBusSneTtvPy
         IlaA==
X-Gm-Message-State: AOJu0YypdxrPAv9eMBbinfWrwaq/MSAtGoddxEFStqI4gd225cNLAhBn
	H09sUsnQW+hjoSqJf9wbtuAqs8whFmRK55JjB/1BqtxwyyGPGP1KPViSg8u3XJYI6GoF6kVvsvW
	bSwIfKORvmP1pXO1wajWpkuxgM+KoTm5i1yMXpoJDyE3YVsayUiI2yQqzXlutdm6fkfn0+OJPnF
	RrV1uMvwALTwW5yA0=
X-Gm-Gg: AY/fxX4XPi9hoOnCCmfkEWYzwsaSdKYQ7Bn0JRIyUTLf/pgjYZWDslKeVMW/SvDzXnh
	0PjMiHurAs03bcfdTcioNlcw/PWKUVFUroY6y6yvIvs4IrlXlamZ2G00Fck4xvXa39nTY6vW96X
	kDRb4VnsHPZmaRZdNI2YRiYQ1vmAJxwpEZhXPxDeZde54je7RECRmC3LJpOsA4oFAI470Q06SCs
	TXmOaxBgU3SiSKKrs1X4Mhe0fFRjm1GZL8/kizZN4HAkA1sMzFrpm/lsb6TNDqrcqdfEmDDGlIR
	BM3K0frJ2R9mc7vDJPhu9aYoSPvA/fmEZc98oh0LO8nfCRgj5esZvrRq6brsAHGljmZwUSL8zXc
	4Ex01dXWgIsx/ZdLFiw4oOhsjpuL/qbnKra0rgcnUe8Zz5zalfzBENHuq9vs0dZKZbh19KkoDLP
	d31yQuLfS1meL3mx6yFnJHXLw=
X-Received: by 2002:a05:6122:a07:b0:544:93b6:a096 with SMTP id 71dfb90a1353d-55fcfb38cfbmr994943e0c.8.1765389534731;
        Wed, 10 Dec 2025 09:58:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqjrWbxc7kKFpzGVxu1zX9Z4z7hYjWO9WEwMm64dokEylLJKrRjyEzEjT9oG0+QdlUtvuzYA==
X-Received: by 2002:a05:6122:a07:b0:544:93b6:a096 with SMTP id 71dfb90a1353d-55fcfb38cfbmr994937e0c.8.1765389534259;
        Wed, 10 Dec 2025 09:58:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbca98bccsm221771fa.50.2025.12.10.09.58.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:58:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/4] mesa: enable hasvk Intel Vulkan driver
Date: Wed, 10 Dec 2025 19:58:48 +0200
Message-ID: <20251210175849.1989610-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210175849.1989610-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251210175849.1989610-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TnLmFpwU0O2uaLl58zATmzsm87hfcTir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE0NiBTYWx0ZWRfX6tx9PRTTiFxl
 02HoVMGbAfhsUGPfXofhPxPBMVGjXmuLhzSyzIaFZxi0wCRycosi2mL+eOE2OCbKJakJrmX4y3F
 yvXKgg0SA5CXKgLIp0nus1Qxsode8RxfWfXqLLLq6FQBJSGPfz3agEYaxkRl9MClzk+2pLONs8a
 TA3fNZP+cSmZqIgoSRrQN10QgOr6X3TTh1IFZt6iHVasNw1K2fBddahhc1BidZQ9PXnd9LMu574
 8yiDVr4HYKO3z74MPlVeqemm8IjuUeUph9jEd+1hEAJ5sVfj773jzLKCQ4WdqGCmhV0w48Cceft
 B8vbWGNoxkxGOlkX6nLnijEok1R7G7WRNL58vkEm6Jaa3PjemkfRGvb9z/4VVSyGV17rnbAVFTj
 QHcpRp3GIZHrqVVr99i0+1F3rjNFfg==
X-Proofpoint-ORIG-GUID: TnLmFpwU0O2uaLl58zATmzsm87hfcTir
X-Authority-Analysis: v=2.4 cv=WaMBqkhX c=1 sm=1 tr=0 ts=6939b4e0 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=-xNO0lgTA5BIskMkYwIA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227491

Enable the iris_hasvk, Ivy Bridge, Haswell and Broadwell Vulkan driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ac6038873a72..6edbcb7da5ce 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -136,6 +136,7 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedren
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',intel_hasvk', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', '${VULKAN_DRIVERS_VIRTIO}', '', d)}"
-- 
2.47.3


