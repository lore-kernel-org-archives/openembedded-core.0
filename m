Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C44D3CCA7
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 03:25:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28087.1768447508078075852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 19:25:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dKBfKbY8;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=A/2B/JC9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EMso452736164
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 03:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VmMaZvNYbs5
	4IGcUFQYMqcwGZx/Mzs7Qc744UP6Wgmo=; b=dKBfKbY8seM6Ae9c7H0+YKnP7cg
	tjIizYsJ+kbr0Q3UzwmulHtm63Nz+lYL+MoeJ/WPNXr+L2FXBXaSMmKSItHoWN/j
	LAjasuVMBNz6r+jG6PaP1Y5yFcIADqHwk+4WVyh27/meo+mqs3rIomcGwXShmFiJ
	l+KdV2AL8Yc7cPhcXTs7SPt31CGjdRIpkB/+EDuo9VW7CAzckKOhQJr3yofBl1/V
	r6l6Is3fvpi1TRoBb+TvBOoeyxTR8QYmNk1JybcadvU6EnTAlDXGRVds6S9T1bMU
	osYjGVTj3JOPDKgJmWB7itGTJW83R7l1O7nvg1nzPE/9p1aQOYPtea03e+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5jf47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 03:25:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5e166fb75so123865285a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 19:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768447506; x=1769052306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmMaZvNYbs54IGcUFQYMqcwGZx/Mzs7Qc744UP6Wgmo=;
        b=A/2B/JC9Veh9pCP3NC55eKwhNKdzTCsueC4DMLThUK9HOTLxELzuL53eya9lHkUWJM
         aQVaydmTeojURV4/1qUvV4i8i7NsNj+kTRnzvMPQ/wfegTnFCn4DXw8nqApzYVr4/XMc
         EU4CICFzCM419iQp2EVjPqdLqa7EuxtTJ9xDJepSTzVpNhL5G6DlfblXLxsE6apMMFSQ
         6iLYLavRNkQdD11lbcJKevVOCEFxWe0vNodknRpZ4uZXW4TNu8sW9fhml8sKa75OS7mA
         NPZKOXnuATN9DnIsUNMI4ZHi2IpRuSxFyYl6AVdfb6gxJt5C9WibBHPr9oOONk2GctYd
         f/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768447506; x=1769052306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmMaZvNYbs54IGcUFQYMqcwGZx/Mzs7Qc744UP6Wgmo=;
        b=hWjnJvhEWid8CWAH9A8MxqnJAgk0YvI9UEhA/vKBbxt3QuXxpvt1NXeFBEFhq5rmtF
         87ZPJ1WadU+0095s1LVGHt3Zvm5wnUfg6rs68ByPIQPHEqirQM3xCEiwFmp0BaEqpOyG
         BMffp6JfR7FEpG3HNBOHOJ2j0hJbetFqQFo1cyZ8p6sUrs2jYATk0rcpyYjxVQaVCcEW
         9jvlQqw8uWe0ahUhJFfEHEAoS/tAvLvFC9/HxkRMeLV1/UKbGaFc2rHseB4B+qwk9dFm
         qlnF2zKLsa84q0nNrfOEa/XVhbas9UdfiPWisl3rnhMb6AgEPTt57GZh5i32rQKAIQ1E
         /BpQ==
X-Gm-Message-State: AOJu0Yzl4qXbR9okRvYXU6XI9vG17H4W+NQ2BXm7pRdfaFGqfI/fZXa7
	3v3dXolyoZJ9GuIVk5Ra7FtMAMmIyN/0EPMcQ45qW7dRJpZQchco8dwqwauQrRlhSE18pGVNvqO
	2D0FTdZknOj6Hw7YPIE35lqHDVWA/piS1va+1b4aMH1nQ/BSWwPTuvLGqS6OkyZyWh14gIR95J7
	8A4Dpm34SNpHpkWHA=
X-Gm-Gg: AY/fxX7/OUdqKHfx+JaAhp5pWKu2kZLelbYwxPESc0usvQcgCYvUWQIjXNDn711qGd8
	Z6yLYujHlH2eSfn59izVHQxUrPZK0q+hLBJPHdDSUc8DzKavHQtOH3qMs8unAAllqCp6bmoJGQA
	E0BUWTmlIhPbId1GRitNi6avc24AGmFqYVTiziY2FasGOAfkukoRF4DU//C7PwAzdEz68r/pRjW
	muQBM6vh7rHB8a59ZnhbBKwttqSf0jX6FpGagB5JQCsJ386LB3oN8Vmp0PdwLRqXqGI50Wk7jvf
	PQBBP1x8Lf5cm0OKEr/fp7+kD5hY/d+hIimXvIxX318XFWn/Nu/sg5dAPTTbRWOrxHyl4SdfHgq
	sCowi2KIntreVJb7i7OX5ZYGgprpxa9CHChXO5uyi2b39A2Y9J5E+ELuDVShlJnIgcUvudalXjR
	f70SlYgA3aNzfTdUbAd/8bxxY=
X-Received: by 2002:a05:620a:190e:b0:8b2:6b9e:5396 with SMTP id af79cd13be357-8c53181a3b1mr512263685a.83.1768447506148;
        Wed, 14 Jan 2026 19:25:06 -0800 (PST)
X-Received: by 2002:a05:620a:190e:b0:8b2:6b9e:5396 with SMTP id af79cd13be357-8c53181a3b1mr512262485a.83.1768447505699;
        Wed, 14 Jan 2026 19:25:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382f494946dsm48277491fa.45.2026.01.14.19.25.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 19:25:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] mesa: upgrade 25.3.1 -> 25.3.3
Date: Thu, 15 Jan 2026 05:24:58 +0200
Message-ID: <20260115032458.2775110-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115032458.2775110-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20260115032458.2775110-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDAyMCBTYWx0ZWRfX6mPGH7+r++UB
 4L6aMFshIrwo6JLFwJ4bVTVnw45bUQr3MnE/oYDlMUYeO+7QLJr4bY72dNr4Ki21VQM/4NwsWXL
 B2XO/QGTQSLFsnxQ/2X7mnL7QlicOTkjw/eLEuhy6VajPelLEQxlk1ODb0ceA8FwYx3dMhdOZuO
 bk1dJznfWR3si2JThnr7865O5BRbWIWCKfWsb9TKsOBqgY4HtF7MPvOAmP9W1qBQIEsdf1PRL0r
 dbFB2C36P44AtU78RQjyzoS405h4L1rl3Kp6ernvcNC1AuZmGQGLTJf4D74oQSOYkzr24DZS2PT
 wiVGU8Mfxi9sCYIx2PnWM+zE2KnLZ5NHTSiGJzF5ypzUY2fBZ5DiQz5p9A+q99JU265HIomLx1U
 t0Vs1iuFkNnwp3AkOhxyMcixWZbWReGYGvG+hfBxjOzhD8P2Dna+nVYrXV0DGcZNrjARoqZIjne
 02oLyx/xWNY8vi0C4fA==
X-Proofpoint-ORIG-GUID: YkmTbSi3ddxW8-pqUrkazhfoS28gCTgM
X-Proofpoint-GUID: YkmTbSi3ddxW8-pqUrkazhfoS28gCTgM
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=69685e12 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ZpVaWaFtAAAA:8 a=EUspDBNiAAAA:8
 a=VAGHLSkYOi_0krsDwucA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_01,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 03:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229384

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


