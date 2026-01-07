Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6682BCF6BEA
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 04:24:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8085.1767759832150438408
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 20:23:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZFGVL50H;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=eJ8771AB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6072nLLb731459
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jan 2026 04:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=97BK6ptDiwFvB1QfPO1BSb1Bkn4gpAkWDUj
	eqsVfaPg=; b=ZFGVL50H7I/J11o2IxmxJSSUB732hebnodkJr5NMT+t2jHkQyzq
	9BUH9PNl5wJHY6GgKU7Rk9lCyWBhJYxUcLX7MconApklvqpQw/NbaBaw7u0P4QOX
	k6D4xTHqmMTHg1IO96IgUXEYp69vrXUDy9clRfXWdySpO6aFQ1Ne/5lqyT9qNjMi
	SKRjf26sDoqSzkf2Rz4nafBLNiE+UcCM9J6lVu31E/kcWj3SWP5Da5iKTSm7P5nI
	On/OsfvOLP9isiBgib7DS17v2C6/zRd+o8/tohmybVqe88qtOpgQS1mNQuwxcsGS
	ihqG5MibE+cKfShz/WpgmybpNgThVpOsiYA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66mhvbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 04:23:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed7591799eso38714651cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 20:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767759830; x=1768364630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=97BK6ptDiwFvB1QfPO1BSb1Bkn4gpAkWDUjeqsVfaPg=;
        b=eJ8771AB8mbysLLj9fWkhj4QC+ALB1fDiLgatf7O+CF3RV+gF7osucC5oNkwbN3b+7
         RiYAEniAy5/g8PLcbR6uyZ/IU/p5BCU0JpBPngzl4eqJUSpiLbBxr//pVTYhA/NJIQKV
         kHHaYczFchZDjgxvRqQGBPtgdokE7GNn7A5kmGNUK+kcdy/wsSGp6ESqIMkWRzgnhjzu
         GVisQRx2OakAq0a6dBl98zKFQaVm3KqY258RBuu6b9bjl4A2ziXqV99gsueqd9h4TWxE
         +yO3bHp6hmuBz+sUv8FuRRPZdLANiQ9WpNT+pDN8zjlp6acWbYN0/Loyh7GO0P5dtCr8
         X4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767759830; x=1768364630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97BK6ptDiwFvB1QfPO1BSb1Bkn4gpAkWDUjeqsVfaPg=;
        b=NXZumiMPSiLtXbF6Idg5iqNPPztL6mPbKsb//Yuv+3+HfFFa7LYsY8oh3r3yhTVyi4
         ODUY0NGHQ+th+UThk9OWp1kaOQdxvR6kENyfiOjVRFZ7TOEZfnnj7/8CvvFMUIckhcvN
         DbMh0FaZc7fqn+yojsh4Pj2+pPGU+W/vzJA217IhYSl5yIr3Z6DBefGEaBBQ51ZH5mjt
         1QwgmlOfD5Wmlt7k6cgKUfZv/2VISagLH7es0F0e8QH/rX+RHs68+7X6UvpNnzGTXPP+
         xigIwAUIw5AjfZEMdYFSFkOGAXrM1ugdtaURkd031UL20Fcxzf8mSSn1pTEMD6x7Xk3n
         +Uuw==
X-Gm-Message-State: AOJu0YyWC1JzaxS8b/90RxV+45yuU5vV8QHqieQFeicaSwy+v9G1faN7
	k4mnhPdVSEeQHKqOTiHEDH9JhLFCvO5APTDnEUtllKbUMMbW1R6U6dE5kCAK8yeZyUPEPnwb1Vf
	iykKyHqHRIpV9oe2BeseKaMa4CoZhRJ1SHow2RMavK/8LFxS5be8+UKoK/0P5qcnmmeUYEuJBoQ
	svfXpSj65kORFjLj0=
X-Gm-Gg: AY/fxX7+luZA4DTYlQ/ixlkgMb/HIiy5TsgTbwlixHy80ni3yLpyO0ByBOOA+j5UGwk
	9sHxSqTIN2mYuWNLqUHPKG/KxabuqQ5RFCzesZPXpB7zJdNsQFAXIg4dm2OHLE8XhwLQcuTE8l0
	zzIHXCi2515V4BiDLbDn25yRoL6jvst8td2/ZcCXEu/lqufln4Pa+rtuUJAWROSNsObbZAwVrkF
	iGcQ3jImNPTar5AJ53WHajQi7M5NT3+fttx1h06fjWdY2GH40qOQnbNYdA5+FmlrJt0+0qGdXcr
	de69iIIyrLgbwZct7uQCD4vcaGEsnHnSJH12ZAdnN5qmmTBNH27mti9EAWTJcx23+sdS4DGNlmI
	2OU4m9z9/Wl9bi7AGPU6O30d4xwdUD5UDktSB58+1AjcRb4VB5JK9evD+G5yqXCEiCkfiE8b/xy
	drvbBa0QkRjcsFxRtlcx5Q5Lw=
X-Received: by 2002:ac8:5712:0:b0:4ed:bb39:9a60 with SMTP id d75a77b69052e-4ffb4a6dc38mr17255921cf.40.1767759829549;
        Tue, 06 Jan 2026 20:23:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhLNIrQ6ZwCLuwoxyumoopJa0tN23RUrrRAlBAOSFbQqNzL8NDb4wi66GdICXZf1e36cMpcQ==
X-Received: by 2002:ac8:5712:0:b0:4ed:bb39:9a60 with SMTP id d75a77b69052e-4ffb4a6dc38mr17255711cf.40.1767759829027;
        Tue, 06 Jan 2026 20:23:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8dadd1sm8195931fa.34.2026.01.06.20.23.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:23:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] uki.bbclass: fix building of UKI images with multiple initramfs fstypes
Date: Wed,  7 Jan 2026 06:23:45 +0200
Message-ID: <20260107042345.2264330-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sY9VpPyMKsy7-iU-rYVTo7bykJY1vz0C
X-Authority-Analysis: v=2.4 cv=PoSergM3 c=1 sm=1 tr=0 ts=695ddfd6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Uh5DYJVUAtPFtFGfTuwA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAzMiBTYWx0ZWRfX9Pg1lNmHyfC2
 KggPHTCmJGrD6DZrmM/mLNDUYiDcjserZXnsk4crAq9zs4Zzixbw3r6Zg7oHC7dt19oMA8fMbzz
 VQPtBa0lh9QOL+lrgKsmAuyQL1alVgF/hMkW4OJ9AFN2IeJpgvEmhhRSouJxE436RP1WgKWT9of
 PYxGNHB9E8/Q0/qVT49yKvndZWQI3CSJkNfIN5H6AW/yudLHbIgce5MTwo32Z63EskE+JQKC8S9
 H95vxI9Fi97riGDatqEwXBoclbOyPwgeIWY51VfNOFDSVEKS2FBzEgL43KAHSQSdrOOWaYXHzA+
 cMP4uziQ0d1Cdq22MpmoPrTN2CLyewtVCGMgcNgMVoSKe+4gg1T3KBt4DN9JJmrfAThrOA2cqaR
 C9KaAh+5UmDJlONiSK8eaTWMe3ubYo75rL1K1IaJmJPfNA5+EBhF5/sC4x9jPwqDlXoRcOkDLHN
 tr+TQo78qLXUgxojM3A==
X-Proofpoint-ORIG-GUID: sY9VpPyMKsy7-iU-rYVTo7bykJY1vz0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 04:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228943

If INITRAMFS_FSTYPES contains more than one entry, ukify build command
will fail as INITRD_ARCHIVE will contain extra strings. Use only the
first initramfs type, letting the user to specify other fstypes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/classes-recipe/uki.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index a2b1c8a82d6f..7457662f3f5e 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -73,7 +73,8 @@ require ../conf/image-uefi.conf
 
 INITRAMFS_IMAGE ?= "core-image-minimal-initramfs"
 
-INITRD_ARCHIVE ?= "${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}"
+UKI_CPIO_FSTYPE ?= "${@d.getVar("INITRAMFS_FSTYPES").split()[0]}"
+INITRD_ARCHIVE ?= "${INITRAMFS_IMAGE}-${MACHINE}.${UKI_CPIO_FSTYPE}"
 
 do_image_complete[depends] += "${INITRAMFS_IMAGE}:do_image_complete"
 
-- 
2.47.3


