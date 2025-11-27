Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D41D116F1
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 03:00:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10245.1764212427005783436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 19:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RuyDZRfa;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GbpQxgDR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQMjeXe1849221
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QZPQF2sY3Mw
	knCuH3CRU+c4e5YlnDVMQvxYD1BBEr9Y=; b=RuyDZRfaswQkQpcGxublWP1U6//
	HhXWYiJIiYWvF2iLi4Im2/pHz7iGGzZ5hjt6j/Zn/QE03NmjX/jA3ZYR1HIcg9nA
	cE7lXOxbHhoPT84FigPfuVfTfAJOLDP27MYSxSmY02Mm6c+KwbOQPQMTahQjLQa9
	W2/PPrxffHHkF3Gc+S1Aunl7DRlZnTiUbkBlx1TDltpMUyKxmvMCAoWSkIhOHEwn
	wsn+kaTBEB9YHSzuNYCiIVb327Byuscgy08RbANF9MExGef9MY+uR1N8COp9X4gh
	S8J2xKdjGznUL1zow3pPLVHM0jUcG07q4073+OpQhg9fTx4RLO9FfYYpJEw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0mst6se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:00:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29846a9efa5so9061375ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 19:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764212425; x=1764817225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZPQF2sY3MwknCuH3CRU+c4e5YlnDVMQvxYD1BBEr9Y=;
        b=GbpQxgDR0sFTq2B/hEz++80tQgpEqLiT/STPrAWLWsQ3tyltpl59W7mnpndWPpA+fq
         lrg5g73evP03tpM4WsYNkzx1KUW5OoIpLORn3sbYOLspS00xzsFavVqi6eJcHNDyb5L6
         m4jZiu3ubo61eP0VbvymgNMB7v0XY1crJqJmyAPfEYbDJ4UcPVd8uSDPpTQA1qUJKRnt
         0cm0Ateur/E1Ob+RutGhzlJnQ737aBcF9MoCiKvqL6OQQntLEImIcIWDTFk09XiOo50N
         d/O/sLYM2qdVQglAPJzRo9GtPcL14B88B0oAozsPcO0EQxGVRfzHGHsu6WgzwATHZL7q
         jfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764212425; x=1764817225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QZPQF2sY3MwknCuH3CRU+c4e5YlnDVMQvxYD1BBEr9Y=;
        b=MROi86I0UrRN6uXzcBMRE2sqFmrMWbceFcDDDMXbthrJxNi1Eu0l0UNt9403GFWaJU
         xdgK6tRVa7dL3MefYPywhAcQt6Ey6ybC/COtmxCK6VkzVLcxPnrnsdajBxRCgZWQ8HY9
         fzWbdXR0Zeq1ZGnYJkDTpylnEwfnwnxhLL0fm7eAVVrQYlnhDDaMYK4/LUvjEoD7KOrg
         P5jdhe3fr66vVJQl/vZ6lRuzGxPMSQ6ACjWv7RhInHyE7EqpQKqP8XHt8/XploiiGMvE
         ch9TwjdCqV4J+fhd+vREyRQNz8/bgHHcvSF8E9vyz3pGAlQrU/NV7f2vmcz7XXKpWHC7
         mY3w==
X-Gm-Message-State: AOJu0Yzl1RX0/V4HKwxx7f9LE7xLG+Qqz5fuJ6OPObP7KPSNzVCPG6jJ
	Nuy5u+8cX3BovZRJrq/zJpq5xgmc8kgi2iszxPeNmtmNMP3gg9LFHZS4PcBYRzIT4yBx3qkEs32
	8sG4hJG+VauGw74mRmuFtYqZokaAF/tmgJ29ddzAPlCJ6MGbnP8EZRvd7zOr1b0diw4borabpIP
	8A09lrgI+SFW9+n65S9Q==
X-Gm-Gg: ASbGncsNc4tCGOHCe+y3Yxw6TiEEX2FaMLxWWu+x+3bs9X2x5qJj4cn1PN0EC5xh7+s
	aXaj7pVr+swdapKmJUefa0fo61igIM/izydnkHWAHAd7TG+2tBAO4HYsfKR81DXVd77kI9lkrw4
	mNWsw9T4nJvbF6SJDtw7G/xla3DKyGSlU8pJO5fvRBVSV3IReA/em8gB6xqEKAlR+cLHVfUuQ03
	9jDBMeWfu0YoqW/n2NFGhztn5YjPrL1QtkhcndybwkUExE1tMe0Fp6vAB4ncj8WNs3ShK1yPj9d
	/3f7uXgUIBaK/SlWmNHr4ULpW1YlERJO0r1I6qR51VUrZ1d/x28jRU7NHN77oBDuHMK75X7xqMI
	agmZY2iUlBBt8mRSedgp4rzbF5mSdMZ33K8BP1NfHqUoXiqFmuoarzUHmV1DutSEiHIOb
X-Received: by 2002:a17:903:37cd:b0:297:c0f0:42a1 with SMTP id d9443c01a7336-29b6bf77fe1mr214277815ad.44.1764212423151;
        Wed, 26 Nov 2025 19:00:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgqFI0buNiA5b7abD9ZVijIlPGQ9xWnSgab23p1YmygpBFlXPd3jvhoIRyG+GHv0rcjlcFAA==
X-Received: by 2002:a17:903:37cd:b0:297:c0f0:42a1 with SMTP id d9443c01a7336-29b6bf77fe1mr214275315ad.44.1764212420961;
        Wed, 26 Nov 2025 19:00:20 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce4415b1sm648025ad.22.2025.11.26.19.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 19:00:20 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v2 3/4] wpa-supplicant: enable 802.11be support
Date: Thu, 27 Nov 2025 11:00:07 +0800
Message-Id: <20251127030008.1421302-4-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251127030008.1421302-1-miaoqing.pan@oss.qualcomm.com>
References: <20251127030008.1421302-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ICio9PTC9Epii6rSpYbv3FNjqxfWQzp1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDAyMyBTYWx0ZWRfX0sQigS66OUW1
 fChxSNtkMVEmqA+xIJZYOO/WFj7Z8clFv3fvIHfiKxdK353PYZD3qG6KjaBRO/iWTT/uy/LycBj
 7KcGhdAgobrl1AJbwkamcQIf0GsOKNe6lT3vnxyOYq2juCpwb+WmSWTbdYkgHNC+tUXKalthDEH
 dNd20nj5/0IM+7j56Q6NZZdnvhYo4A+sFhHH/AR80LckCg9zssYnTYE6UqJdIWLYQU2lYvuU3VY
 zkmijLEJ9doxGBFN+Sup3ti8AVqIpsHh1WgmLao6LjuPrwnHNLsu2mfDjQWzxBezxkWGeqEK/NE
 Zi0PxWOq6fk2xeEz+2B3e0hDNh8mlZfKHctL00FDL/T/PMiD6nmY1vTlyYVQVw2PjrS5ZIU/3cO
 HobXh5P/lO+FTlXOOdgcFt0Zz2MS3Q==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=6927beca cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TNsu8Qfd1aDV9B-InT4A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ICio9PTC9Epii6rSpYbv3FNjqxfWQzp1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226824

wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
years. With growing market demand for Wi-Fi 7, it is now an
appropriate time to enable IEEE 802.11be Extremely High Throughput
(EHT) support, mainly for AP mode.

This implementation conforms to IEEE Std 802.11be-2024, which was
approved by the IEEE SA Standards Board on September 26, 2024 and
officially published on July 22, 2025.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../wpa-supplicant/wpa-supplicant/defconfig                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
index 52befd8f15..e313894ecd 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -510,7 +510,7 @@ CONFIG_IEEE80211AX=y
 # Note: This is experimental and work in progress. The definitions are still
 # subject to change and this should not be expected to interoperate with the
 # final IEEE 802.11be version.
-#CONFIG_IEEE80211BE=y
+CONFIG_IEEE80211BE=y
 
 # Wireless Network Management (IEEE Std 802.11v-2011)
 # Note: This is experimental and not complete implementation.
-- 
2.34.1


