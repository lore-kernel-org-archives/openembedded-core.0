Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458ABF532F6
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 08:45:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15180.1774341900958986444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 01:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FuruQnDQ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fA7JkjSK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3UnIr1761751
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 08:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NqAqueeFktu
	BO6Ux/A4d5aVSAHC3CFzL9FK3hMHkg+Y=; b=FuruQnDQXjFHSjR2PE+Kh/9snlz
	s9JNnmLBzz5yqFf8C7y+AYXju0RpF9OU+E74fq/0TMMfdL957WPsbrcYdbzpJRIt
	HWuaKsnRuniTrPIue5aA0bOSdxAWowZKZ13BSayAffMpzVPDz/DcMxByDHkh1G39
	1CA0V3BkVIILtw2Fceb6oTPSDr+pCb9eq02Rke/pnunZY2mahpBueQSq/mx5b0Wn
	Ucni4uhXL1HdRes6zhksscOtQfoCgQCL7fda2tVwO62bop78MgTCd7m3HRIkus6u
	6GQS8X8PzI4vbFuqfqJfpEQQbsfPQL4HQKdt/rcb39Qf5Au4/ARp+jzw+Jw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0bn8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 08:44:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937cf66b5so229890841cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 01:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774341899; x=1774946699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqAqueeFktuBO6Ux/A4d5aVSAHC3CFzL9FK3hMHkg+Y=;
        b=fA7JkjSKX7w9o52ThVeV2Y5pETMWsZItqDS7Mvkas4QdJuIuC5cLNxqJcS9eCVNQnD
         Q7kFZ+aREWsw4wQ9aEhQ4NaHuO4uOJhPb23W+Wn/1AKsS4bHHh/1pffD7d1JpbWwbNlK
         oqYW12PaixS76cxGE56Sr5Dz7wUqNbCc+UFfVisAnj1vddb8YP8NMqXFMQMc7wX1sAUT
         1xmKLjQ6cWT9feydaX9APvdU0OiZSPEwvXPgZ7BKeR7t80OpPushjP7kcr3b2CxVD9Ns
         eyfpashPc8o4CKeKOOTNqJ0kYoV49L1jV6lDIDd/VGRt9uWcpaGMCifSYHW/Z+ej344G
         Tu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774341899; x=1774946699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NqAqueeFktuBO6Ux/A4d5aVSAHC3CFzL9FK3hMHkg+Y=;
        b=FUpZywQnOiASLPJNp/RuYK5OIfhBg56ecApCfRpL0msxL7/xm4mUJ9Kavqi/HR8wJD
         +KunSkzFPKFp4XBJnH4E6gwU393+2RHGwrJhQ5H/ZXNpblBSBvFR4lvzDXLcO1uyOwSo
         GvkYAYXaI3DTitjUH1Hz/GiAbISeB6O5SsAlkT/pMmiAjsdWsE+IAM69Wiz6PtjnTxq8
         gpDgy1ugoJmb06byeTo3R7KqJgZ8OUT3+ULdHxHCMDlrWhNagOC9UzTO9ZFWqRUfYgZL
         N9bYPhQOhBjUmL5KtkjMyQGAbcdwNmXWiBB7FN1zERHRqTUUiMd50NxqLVFi15H8WmTx
         CLMw==
X-Gm-Message-State: AOJu0YzlGVw0NwSNij4N+8doHmlYRtiHEPDMw23sEZ630Ftle/odUsct
	HqfjivkMoBrj5xRV8nz0hn3sQE4Y1ZHoPDOYRWs73+74brrGpuzhEQJX6gJ98Cykz7O2QxiAE6i
	wS/P0Imh9ZoPlJhLQrRhz4tqIgIW7p4hFaRx0Ryj0tYgqysZWvXeRdWYwrWxnqiABsdwbETYwyG
	PZibmC3jKWadSQIY0=
X-Gm-Gg: ATEYQzw9mQ/j1pWtTCD1TQ3iwwVDuFB7vkTMLbBsZOpu9SNLM8+oyvTnfBS5T0/M3/b
	Klazv1cVpPJRG/5vbt7btT20kjwy4luHyy2E+9SIHfr4OSidwPnRMpDdZxyZON+8nqulTJDOgDe
	aiUlyaRFsC8hB3+1jNQwxC0uT5FxrOZ4SomhWrir+W8XDP3AQxKsvwKgxxAeFOFZXozmmgfSyvS
	nYWZtpq8cQAX7x+azOwrJ5/efqP2q4iUkqoyLNuyeg5wEoquuWSK6BPaoc4UduQHFKaBbs0Ot+8
	SZsOa7BlIgQBTaPBcv3St7coYPjHYxTbfF1BDi2wB14HWwL+kfn3qHI0bnZqlQrVdb3dbuOX2yP
	nvmB9h1HGVSarPeWKlyeNhIM+6njuW4618WGaB8qgEqxve7d7OPO542q/59l2wmfZCHHklF0jVu
	xuo+a/s+cYaI34oO3l7dmMjy+f1cWtTAQfhq4=
X-Received: by 2002:a05:622a:1804:b0:501:17a9:5ff5 with SMTP id d75a77b69052e-50b37422234mr243560171cf.21.1774341898844;
        Tue, 24 Mar 2026 01:44:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1804:b0:501:17a9:5ff5 with SMTP id d75a77b69052e-50b37422234mr243559961cf.21.1774341898399;
        Tue, 24 Mar 2026 01:44:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851a113csm3043849e87.23.2026.03.24.01.44.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:44:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] default-providers: use Mesa a a default provider for OpenCL and Vulkan
Date: Tue, 24 Mar 2026 10:44:54 +0200
Message-ID: <20260324084454.2971108-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324084454.2971108-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20260324084454.2971108-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c24f0b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=FViHxM9L961AEJHJRMQA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: bx55DYQC6Na-Z7f_bz9KzwrRdnuHSyiJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA2OCBTYWx0ZWRfX2PZXmFSiIK5c
 RI9o+cK/CoZ101qGgM5n1VdkreDn62ao7Xx71kzi5lUs64l1RUPLBop0bk9xbjdHLZHmi217rJy
 sVLxkEu852bKA+8f03F4ekOSY4DtL8Pnc/w5ra29X87H066+AGd3mQyK9nIt4wNBG4CGqzLGx0g
 sDzB9JoQ5/vxB4kbiy6RMpqNoEanNHXtZ4/ag9oxJ/b7f/KEJvbuqKfLNCwLhXkYqs17lOLA+qE
 3AF+GJBr5AYsxWjxiQeYcuFv8hftFRBCxcDPmRBCACnmP5/VbVHIkIjEB2ZWybsBb8o7mmXu4ks
 TRgeIXEGIlml7Y/hGzreytAcE4wz1AlFTzRSp/qqDcXBSMT+46EpnNCPmSQ+viUlt4n8xzAkdfV
 YXlROMfb00Sf/5J0MtT6HcpKScoWfpOBAIyXcDxn9jZqe0VzW+n+Rewa0LY34JgJFIMXtd0KSbz
 gVBZR1aXexaJzALW5PA==
X-Proofpoint-GUID: bx55DYQC6Na-Z7f_bz9KzwrRdnuHSyiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 08:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233778

Without DEFAULT_RPROVIDERs for the virtual packages OE behaviour is not
deterministic, it's not always obvious, which package will be selected
to fulfill the dependency.

Add DEFAULT_RPROVIDERs for OpenCL and Vulkan ICDs (installable client
drivers) and specify Mesa packages by default. It is a weak assignment,
so the distributions can override those settings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/default-providers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 883ea2f8af8c..aeff8afe0119 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -66,4 +66,6 @@ PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?= "nativesdk-libsdl2"
 
 PREFERRED_RPROVIDER_virtual-libegl-icd ?= "libegl-mesa"
 PREFERRED_RPROVIDER_virtual-libglx-icd ?= "libglx-mesa"
+PREFERRED_RPROVIDER_virtual-opencl-icd ?= "libopencl-mesa"
+PREFERRED_RPROVIDER_virtual-vulkan-icd ?= "mesa-vulkan-drivers"
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?= "rxvt-unicode"
-- 
2.47.3


