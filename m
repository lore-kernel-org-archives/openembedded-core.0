Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0775FD4662E
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 21:26:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1242.1768512410207962065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 13:26:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=b6+9WH5c;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Wvbr56g5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYDJf1910065
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 21:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VmMaZvNYbs5
	4IGcUFQYMqcwGZx/Mzs7Qc744UP6Wgmo=; b=b6+9WH5cNXrYQNW77RSPAF17X53
	HKFPzOHunRPW/23JtrFPdmW+0itoL4LFbZ63GjNfksHxYbQfSfSuejZYiuBPqQa5
	aitk52NF6nJyKIiF4QwahVeZGWHWteCTySuHbNGYYFCi6zPSItdHV7KRTT9sOQAV
	qk10lQNEYgZUzvVDHrNHj5RgWYaxsjIZ/vXeo8rKb0z7DyjuJKBHBzCYoUESWg30
	IeoO3FJ4yRpWizXd6pdI/l1GY4MWTcYiO147mMGJplKng2nT+CdhiHH2K+/P64EQ
	T5ifl7QxdVbWAIZ08yQ9XvcJOOE1zDnfDaPDYC1KWSe/RT6j83PWaFhRQ6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxgn1tn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 21:26:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bbe16e0a34so368208785a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 13:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768512408; x=1769117208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmMaZvNYbs54IGcUFQYMqcwGZx/Mzs7Qc744UP6Wgmo=;
        b=Wvbr56g5hn8pR8nglaq0SV+HMNT5in21iIKsG714GqFeEykjPK/CvvpIvAuiYXe2sQ
         cX5l00e1ddI2GejiwOgk4w6SUa3cKsddvIlSCwKUJ2Cj/YOp1oKTl6Ig0Rf71whyeh8y
         B/RZUTInPGw/PohBk2i/WPQ6a3BhL4Dmwwe76IqaP7DsbgAJksp1omIrXCdRXKwyN0kl
         PuTezWDikpa2w/+0saBJA7qeuYvvBuJO+vvG+di6A4Ls0PDg28SmpNwgtoNu4YSNbp3Z
         G+a6us3HbODVy/wqhQV9yw2FeO0hDetgCIy1I0aPaJFCLK2RuBz442rUt86hvr8wifMw
         e+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768512408; x=1769117208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmMaZvNYbs54IGcUFQYMqcwGZx/Mzs7Qc744UP6Wgmo=;
        b=ZLmrDLg7N8nlR+uZD03hu7hl1tKtdI2gIdzTv/9feUJ9m9mxS2RIiQEMn/MPOsj4gX
         cesnFiImppEY+IbNfL3ATnEF6VYOE3bLgIGD2osKbATB6W122F5IRKKjNHE57LhO2DMA
         ZF7igjwqYIagNusSawurGECFdg5Sk4NUqtcQEXKhELxSp1X5oMAGke22sTB3BvXnNmGC
         wSniPL5d9ouMl9A1mRn7s1zdV9IfUGbCL127ajLoDo4ohIC3PGv+zAuLWjzNzNtLrtGJ
         HkGmeK/FNvk++W5WNtFduDwC0mSjcaA5jgpCb0+Qt2L0MyyCGfq/+F93u7p1+sH11zzc
         D1ow==
X-Gm-Message-State: AOJu0YyhYKpg0XHTgjf48aSh/Zs9RT7KExx1DlBkUWEwNbGNzwXBUSvU
	e1zLncPPsJyak4DY65ldmuGh3QODpm2w2U4KVo8b9Syx9NrysEsd9v2yB6K4hopsMijTYz4xlIb
	7BJvniedAuimGsRHc/zoMzeue9GHKc0eGjwH2LseBV7lcTwaPo3YVbpLiEtv4a9QfDOeNDzustn
	jXDUH7mF4J/mcENBk=
X-Gm-Gg: AY/fxX41sd8ah7g+DKj9XYTua9sKvE25/er3+5uKgQ9h1r9ULPB0efEO3JMC0TiiGfj
	9Ljn0bnOixn1TWzKUgX1KehPXRB6NyVi1hBPRjg1sgN0/Kj1h6AiPGMIDrFRiIIc2d2OPbJvZjX
	dp0YaJIuTAphODimG98VIm2CMWzZLoBTBqw6Xg7qkCFUcHP2pY5KHrizKBrMZuIpgvSeK4lYUDo
	0yUXUDYBkqCLsC0pzPnvdY8S4VQ3uC/fYZJZAEjDmM/01G8ggFny1+Zif/fKtMWv9kAoFh0Tkjy
	v2SPpTAQxRr/utmDEnJnL9QaaEpgJe+Dp57fVNbd1/x/LEHVDttn0k4s2ABuHli3A7Gia+vLIM4
	COUF4fgPZdQ+xIP9RlbuyPrLBaDe5Fir0B9i2k+sU+z2SQPzsOIBEAX362Mf6WBn+zB8MPrU//o
	NCSaDO2BwSP5pI9y4iG+I9LzE=
X-Received: by 2002:a05:620a:170b:b0:8a3:90cb:9224 with SMTP id af79cd13be357-8c589b853aemr596949285a.2.1768512407728;
        Thu, 15 Jan 2026 13:26:47 -0800 (PST)
X-Received: by 2002:a05:620a:170b:b0:8a3:90cb:9224 with SMTP id af79cd13be357-8c589b853aemr596945785a.2.1768512407204;
        Thu, 15 Jan 2026 13:26:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb8ff0sm1676591fa.45.2026.01.15.13.26.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:26:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] mesa: upgrade 25.3.1 -> 25.3.3
Date: Thu, 15 Jan 2026 23:26:41 +0200
Message-ID: <20260115212642.932690-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115212642.932690-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20260115212642.932690-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QFWUVbxAGMTlq-2nafq2rWee3WaXiQvx
X-Proofpoint-ORIG-GUID: QFWUVbxAGMTlq-2nafq2rWee3WaXiQvx
X-Authority-Analysis: v=2.4 cv=ANDFHcx+ c=1 sm=1 tr=0 ts=69695b98 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ZpVaWaFtAAAA:8 a=EUspDBNiAAAA:8
 a=VAGHLSkYOi_0krsDwucA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NyBTYWx0ZWRfX0Ee00VVt7Tmo
 6J/8RUoC+xIVBJ9tz+PZDspL3ZdkuQXcj/0KQxyDfkJEqIaekowQJlGBvEYocp4IdEOaFp96bPj
 tf66GiaJxrxUxE9iNDl6k9qUliT9CsdtCygMkGpUAnS8hvxIhI2HQleRqTbk23VttIjuj2x+Zhi
 c6gi2gxZF17LE4Ufzo0H3CadneD9jFyrWsFNKNmH7mJdw+Y6KTBnPCRWIJm/AKRJryDEXIw9e5R
 CAFYJDQngyewJXi2d5sL7i37WZBKLAB9ev6YsvyO0o3M0loLqYpL+64TNxh4kpvK9+DjdYh5ECH
 0KuwHnQSngB47ihzAdKU+FRvTCip1/Z0xNvBgTJrVo7ql5i2JThApHqJIIy5vHY53tYn+xJLNyd
 9Ocwxyg5PysbB1DtHbcq8Amgivy9nXQgRtwXArPjyzo0AevNXhTEuz3Q3gw1md/73Fs1xyZd8Na
 JLzuSIH8g31ZnzvT+gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150167
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 21:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229440

Upgrade Mesa to the latest stable release, picking up several fixes
(mostly anv, radv and pan/panvk/panfrost drivers).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a82bfb613549..1607fddd4bad 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0002-rocket-drop-file-names-from-the-generated-file.patch \
 "
 
-SRC_URI[sha256sum] = "059d0d985622f49588f01aa29152804f4da8ffe6add046e00a52923379c2d8da"
-PV = "25.3.1"
+SRC_URI[sha256sum] = "05328b3891c000e6a110a3e7321d8bfbb21631d132bf86bd3d4a8f45c535ef6b"
+PV = "25.3.3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.3


