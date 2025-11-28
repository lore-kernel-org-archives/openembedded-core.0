Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D96D111A8
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 01:38:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6995.1764293898390205756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 17:38:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=l36zrZ5r;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XbSmj4b+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARIet5o2388046
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cyecsarF/Qv
	hHuvrrp1UoOProX4bE2EUd8rVNKZqgwg=; b=l36zrZ5rkvvkojNGV+Wn53u2WJk
	0vuXdG3E3XiKQpjmRs7LcGmRGN/yxW3816IPMiKaT9Hf45FlAHQCZ0vRoV2klUm+
	fVF/2pFoX0G6u90PZo4OOwXQyIJBeixay8cXdAwgPalc6k4hKoMqsVY8UKe8FIXX
	VBBjvLiMgZB65EGIWHQXVEQ/J5lhIIaHEY37L1gOn66LvFrzppz6OYk4Kx+3SBEX
	lvbz16bYW2NuqvQ1tEh9BE4sz5l+oPdwOmj4cCwOzZzvqR6xAbVovU08YOSs+RTj
	XG7rTpKFtV0SBeHohNk+uo5eIl9XD6coAjSkRgN2xRIlu/iFV888KdGIGcQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n8ksyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:38:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340ad9349b3so1981269a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 17:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764293897; x=1764898697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyecsarF/QvhHuvrrp1UoOProX4bE2EUd8rVNKZqgwg=;
        b=XbSmj4b+Yr9eUQbo+aoVkowe2Pk3FPym8B5xM8sNHkNAdSwqFY/zv50oyliBW0G7Hp
         hfALEMUpnZv8lJqcBrkxRV+GQLPHKxj7YZxqMvpOr+5m80wJn+08Dan0UP/ghAiwoucR
         OIBHlxCmvvCAVmoOIbr4M5EHpqPHgAEv5i52smOD+HEWojjg/w+LR3JzKaFADZEFAww6
         nh+kUqC8j6rgfiY/TJHkcHOCwJ0JLzji3SnKp4uezrqXTosD3zxjPZyi6gVz6LjCA/qB
         vkN+nPVXkFSEuuBLhFIn6dLrTEcqJ7n5SmRCRj2SEjzz48dpAwv2NE4iVbvEABNmU54U
         IeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764293897; x=1764898697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyecsarF/QvhHuvrrp1UoOProX4bE2EUd8rVNKZqgwg=;
        b=rLL7DYfjGcWuXrtkw4PqpUCr//X8ypbN7afKVQBDfAmK0hdZEkTbYTTBbbvQ9R/0dv
         GTrSirxqfbaep+rcP2yO0Q+ZIrL9ae+HplHsdeTdy+qgFSB8rhCQNkcFydoV0Dsv8hwB
         HcQSm90PGOXSqT34mpipNlD9yFI7gBfmney4wyIGDHw9G/NyYSvmJRnn/cMh+3Ts4sOl
         Skk7Nl8V8FVNB8cCr/rEcImr26fguc5eATy7MV7ujYMyGyqRUY1PVpTUB9POYGPEQVxR
         uuwCq7/rsvSrtRbNlAt9e6GydD70JaK668bIg1wcosdCWpPvoisHAL2HQJS16upnw15A
         ZTcg==
X-Gm-Message-State: AOJu0Yxcc6MWXi0g8iQeTd189Ji8YtBMK2Nevlhp9sOyA4t7sWp2uE3E
	XKgOgv3wt2J1akHoj0VMrgQo0KxnBl+6xzrqdX9ZLNErN5DUzEAqlkO1AoNXU/jyD54UCDZ7qzj
	mCTtowtu3jYHdaXy5SfOE2aU1mhgZF/pIgb77swTI+y+EzEaxb7PRc6mOdEYA2uxpkFKE0MUUP5
	0BVKP+MKb2aGLCLL5qXw==
X-Gm-Gg: ASbGncuYuUdw7fZdMqVKl3HYLj2M1XbQnv7JkRkI5+9JYNCFCCG613y3S5WChgbNp+o
	5SQMS7C7Baro+60em5t31XgWB9SPNHdItrGF4Mo1B7FFJY246Jp9WQhzcAhB5uQZ09TsZmQoZpu
	XboIgdbVw5al4l/ViCY/vkr+uG2oINgAb9nVrMnFpbJceejQMZ3sqAL/t+Ye18g9H4K6C4FLpGV
	4Z/f2DQtwt2STxA8YZYkC0+muHecYY33tNFphbmF6AzAEH6rAxNZcuC57EfXopxvmcFBofbb5pP
	6nBYEzVOoqsyq0oDHwxNNfh9DK0lUVTR0b72/7XGAcRIzOpkwhC/wVNDIu0GKmNJeP8i0+CdqKT
	C8EKg20NAgNbb68HZSQ9b6A+nzLjFzwj6bwWqU2gv4NZLrGEaWyKxvGWQ9/C5tkr6h/14
X-Received: by 2002:a17:90b:3fc3:b0:343:60ab:ca8e with SMTP id 98e67ed59e1d1-34733f14df2mr30009603a91.17.1764293896908;
        Thu, 27 Nov 2025 17:38:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+oX3T5P1Ix8bpfOdefyFZ72u6XJSwZsjkIq23c555Aaay9BccpRgbpY1eaWij+4K/4Dh5WA==
X-Received: by 2002:a17:90b:3fc3:b0:343:60ab:ca8e with SMTP id 98e67ed59e1d1-34733f14df2mr30009578a91.17.1764293896396;
        Thu, 27 Nov 2025 17:38:16 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b732e5dsm2943858a91.10.2025.11.27.17.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 17:37:54 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v3 3/4] wpa-supplicant: enable 802.11be support
Date: Fri, 28 Nov 2025 09:36:27 +0800
Message-Id: <20251128013628.2187455-4-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
References: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ROpmnaA67oxPZef0LF_tZKn-y8URqGX2
X-Authority-Analysis: v=2.4 cv=AufjHe9P c=1 sm=1 tr=0 ts=6928fd09 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TNsu8Qfd1aDV9B-InT4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ROpmnaA67oxPZef0LF_tZKn-y8URqGX2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAxMCBTYWx0ZWRfX1RhNHCJy/igU
 tHIIcwWd76UgvsZDlxK96zs7yPN9KLp9Cr4LlETO+vRWeLySS16YNJpiyPwbjyZLITrSRmEGh5v
 51RyAzOeNxlF8N8HzJ28i0yEZoaLQ2rewbo4M96la1NIsFpk4hJR6zzVlYuUVvYcMmWvg8hB8YX
 QWRbIBOYskufuD1YcLPHOPLuWgVkeLU4lTHzB7yuwUhNkstTJGdrggJSTs4YoGFcd4NfsxzcC6h
 0shxaLslVOWpXbTyqhGk4WeSd+LjvyHC0Y5AGeTd+OtZ4+Zz4ry9ExYM3VY0bkhALp8SoNymeNt
 WZNLcfeRkC0Hg4TFIRJkh8UTU/a0bDJcOafb9t7oQC4eumsKNrFhJHJ6ZLioohRfxwqZqYNZY6d
 bfAxZYitRoCLuMBIMxAPJ3ihEz13GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226876

wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
years. With growing market demand for Wi-Fi 7, it is now an
appropriate time to enable IEEE 802.11be Extremely High Throughput
(EHT) support, mainly for AP mode.

This implementation conforms to IEEE Std 802.11be-2024, which was
approved by the IEEE SA Standards Board on September 26, 2024 and
officially published on July 22, 2025.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../wpa-supplicant/wpa-supplicant/defconfig                  | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
index 52befd8f15..1dd7540574 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -507,10 +507,7 @@ CONFIG_IEEE80211AX=y
 
 # IEEE 802.11be EHT support (mainly for AP mode)
 # CONFIG_IEEE80211AX is mandatory for setting CONFIG_IEEE80211BE.
-# Note: This is experimental and work in progress. The definitions are still
-# subject to change and this should not be expected to interoperate with the
-# final IEEE 802.11be version.
-#CONFIG_IEEE80211BE=y
+CONFIG_IEEE80211BE=y
 
 # Wireless Network Management (IEEE Std 802.11v-2011)
 # Note: This is experimental and not complete implementation.
-- 
2.34.1


