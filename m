Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AC3D116F0
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 03:00:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10297.1764212422174469000
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 19:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=kSfheClk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=V6hHK00U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQN3JN93331955
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N7dzE72mm7E
	PeSTaoPphBQe3X8weP71qva/janqpAlM=; b=kSfheClkbCV11JH+bTkDGCqZa4r
	i6ybiV35LrSYP5g6bsBRHyVu2tVRE4ns0uPA6sfxPN/cMKcjxP3c6rwdyITX2099
	03mb6UZUt+IBrerBx3vqObJMPFDa9xHlEOZ1DZpC0CJcqbGr8EA0jMHsCeJHjb8L
	IEU1m+2y315OyXpJe9Began1fUS5NlxlzDjSTUJfpptUOUI//xQRW6VhCwA6zJY2
	EwPXj48A3hKyV9dXYJspZiY4eNHsLlewGfuddo1ABuhuWjIyjDv9mGN3qdBQ3/fT
	tHG1z9t/pnfRJiDhVrexUSgkkc/jAIxh47JE1QGeGdOqA29Ue40uX5nrSbQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apavs0eyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:00:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295fbc7d4abso5315305ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 19:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764212420; x=1764817220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7dzE72mm7EPeSTaoPphBQe3X8weP71qva/janqpAlM=;
        b=V6hHK00UZuqu3+PDUXxzEC2Ssui6zaMXakTG0XsO/KeovLPNyiCbDv1h3lXTMFDq/J
         X/LKQiJVuOebRgtoUxcpnwRF+27uFJwREqR6E+MAEQSyM06ANiERPEHZBlvioU4MVG4w
         qeE7APTLX8k5FsghSGcVG/hME6XTtQ7d/e3ahXwpX8hUB8YaPUFc5FnqlNK3jNNQIrEj
         G5h3ILGqNe9FkJVpUTr4KWyOt0Cf9oiWsQMFatP17NmRPA8aIf8ecKxzDwkZxcYfLMeT
         OxBhKAjTftSX8hoJ7Qt2igFzgMe/d3DZ5sG4hXfnTi7+LvtLWPngkCt2Wwf6UPNTvBAa
         scyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764212420; x=1764817220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N7dzE72mm7EPeSTaoPphBQe3X8weP71qva/janqpAlM=;
        b=l9ipW1Xwzai7J95qlbEBUQV7ZuX7IE3gZuGyfiSK2WyBHMl/k58nCoTyRs9+7mgozX
         qJoLh1dzAU9A0vvGqtUM3WYj8MwIpancEbNypy55VkTITsMjoiG5r/gj1EqS/sgjHyCi
         Bp3TJPvwVSQOfw+YPV/ctMOr0f+iL3IXk+hpZPUMkwz1aUKNGpFb7YrP0azVlPb4RLS1
         hbzAOSxURfF/LY11uMCAqoMyZTXkcEdle97K1VblIjHVwA8wU8vyicMpyXCWn4IQLlkQ
         xbnqXdRLRiMBX1jq+HPIkNBictB08mlM3bEENkGjnnLjacxFQFqzTha4JAJTQKQtn52B
         3NRA==
X-Gm-Message-State: AOJu0YxoKFIxj4K8RUtStYfv96sKDspdgJ3psI4Uw5WzE/IEMX9Janhm
	1SdIVqLnac7gUN/TMufZU3gfpEZGdL3GhrSnXPO9xJQ5utTOfQP34/xfpsnAoqmj8Z5LWudr3jv
	zDor3I2kqyWLpJ2uUfewxUeFylWpSng3tC243iGXHbsSOhRfsnkfnuNmBsgG+eSsY9aSwp7s265
	WO7yoQbdTHA4vmUTwz/A==
X-Gm-Gg: ASbGncsEOZPQ1ZH6A1lJEsXiq4ktIt26ineOZoqiy2TRmXUM2mWwpstnIqh2WnnStwr
	jDaB57p99hMmGJbPdXAkJxsRun1ZsWdPidgfYI/FLpBHU+NtysZjXJEO1Rr/bTK4gqjgrPSlBmC
	ZY8cm2W9Yb1a91DjPmEhbnx2CSk2MRD7nQcBwcspfnN3ULXW0esXVx+2KyJOOWsZWyBGh7V2KsW
	7tj7b860ov05R5A+6fg77DCPTc59X3WjXJC6c4qsoVxYEeisOv4jkn5E6f85AGGXnzXZqj/wALf
	ROEVrz3thNd1u41a4/g2/KVs+KK9E9OSIkePILNF6dcssgUz35pQWLDp8/01Uv6Pb3IBJ9qejoC
	WbGBj6Ei05bsbPjLDD1FKIuBkSXD5i90J6oU6AnNJ1rKfGNCUq0LrzkywCR3kJcP6xjat
X-Received: by 2002:a17:903:1ae5:b0:295:3a79:e7e5 with SMTP id d9443c01a7336-29b6bf3bd68mr242465215ad.34.1764212419677;
        Wed, 26 Nov 2025 19:00:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFU3c697wPpE1vIuQYwkRtZ0LAFAeV1k/RgDofC8cfdOEs5ojX/3Dopk6O6U6JkAqopvEONQQ==
X-Received: by 2002:a17:903:1ae5:b0:295:3a79:e7e5 with SMTP id d9443c01a7336-29b6bf3bd68mr242464215ad.34.1764212418809;
        Wed, 26 Nov 2025 19:00:18 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce4415b1sm648025ad.22.2025.11.26.19.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 19:00:18 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v2 2/4] wpa-supplicant: fix sed indentation
Date: Thu, 27 Nov 2025 11:00:06 +0800
Message-Id: <20251127030008.1421302-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251127030008.1421302-1-miaoqing.pan@oss.qualcomm.com>
References: <20251127030008.1421302-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BH2vrW_sk5OvrvvfTOK0iM8bmIW7KDJ1
X-Authority-Analysis: v=2.4 cv=PYPyRyhd c=1 sm=1 tr=0 ts=6927bec5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=646l1OQNd_mmeMfxMTwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDAyMyBTYWx0ZWRfX/mJo7wUN7Sjq
 +BejJ9ItavijwYf+MRw0heqYkXZ82Tg6ro/mCwSlh9JC6B1TaKv5Jo/zCmSpS3zmYEov5Jq6c+1
 x5zIMmpw7oVxkAxP1Ekqqig49ns+BTut1JCkjdIZ1K+dj1by3jqIk0MHLbHvCNDtQBOd+MI28Cr
 1XLcgH1x3/zcreCisB75n9GFk67jGxe6VFVzCIHIFf5m3JNVcxlY5+qtSevqcSrSOuJCMsVpK2l
 I9r7YdeKahnj3bWBFpK+f0+nHMpVnlHEKhueMNAJcliMFF+EJ9V9CQSYpzOt1IIfeic7KWBS05E
 eRnlWZeaoTgZMbpH+rWN6lpM97wPpiiX669ezS5HfCGY9xAOZS8fmpalqgzVMQWOA8b2fxu2rY7
 Un88Bn0CUgEqfOGv/BMqtKdQPm7Igw==
X-Proofpoint-GUID: BH2vrW_sk5OvrvvfTOK0iM8bmIW7KDJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226822

Unify indentation of sed commands in do_configure() for better
readability. No functional changes.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../wpa-supplicant/wpa-supplicant_2.11.bb                   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index b9a8964439..4a8ee1423f 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -46,9 +46,9 @@ do_configure () {
 		echo 'CONFIG_TLS=openssl' >>wpa_supplicant/.config
 	elif ${@ bb.utils.contains('PACKAGECONFIG', 'gnutls', 'true', 'false', d) }; then
 		echo 'CONFIG_TLS=gnutls' >>wpa_supplicant/.config
-        sed -i -e 's/\(^CONFIG_DPP=\)/#\1/' \
-               -e 's/\(^CONFIG_EAP_PWD=\)/#\1/' \
-               -e 's/\(^CONFIG_SAE=\)/#\1/' wpa_supplicant/.config
+		sed -i -e 's/\(^CONFIG_DPP=\)/#\1/' \
+		    -e 's/\(^CONFIG_EAP_PWD=\)/#\1/' \
+		    -e 's/\(^CONFIG_SAE=\)/#\1/' wpa_supplicant/.config
 	fi
 
 	# For rebuild
-- 
2.34.1


