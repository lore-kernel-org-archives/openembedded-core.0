Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983C4D65C63
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:08:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17120.1765984114680753411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nol+w7BL;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bHfXxRja;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKrZu2764423
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VSR3XR5/H+O
	/jOTq065MDiTfXdSjyAyilbg3XYh/0l4=; b=nol+w7BLQcA7Wn2+2dvfMNAvRXO
	RDiWC9ddWmJhpcGB/811bAFcgpOG1dPR4YGLw9M0DWtzLMgViMwvDdVORjnXopg2
	AgOdAHjkvH6GXTkJkPdgc9QsRvWWMhIXWjYviNJlmDtpIRu9yNFfyMi9wh4Eoymi
	I8NxbPCEupSlxoEd4hz6lpudrZyHcj89CcK9o5Xv+pxaJNs06F/0Vv9wKjKXKtLD
	iUNtavx0yQja+oW1MkcGzfKVd44iRTzfN4ifA7MZUnDZ/QryDVW/yxUPe001CqTB
	4PqKN8pRqFAdSPIy1Ldm2J8ei/6QWhoh2rCvRQJNBwW9dsP1MgJRlQhLQdw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fefjv0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:08:33 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-78c3306a3e7so80796807b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765984113; x=1766588913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSR3XR5/H+O/jOTq065MDiTfXdSjyAyilbg3XYh/0l4=;
        b=bHfXxRjaO0icAv7bsrRmjxI3NJf+fNwgPkd6S4FWHo+mVReXGDYSyRFE3Z+6uxLrgV
         ZJYBATHByFmqSojNsEc8APzrIbMdpXNmJL1weNykitNa12cnE0grYDKHtgNqfz+iXHHS
         8sbYDB9jhdQzCpuzcjeJ/1SYdH0WNb+WV4oMo74teAmEmXAGde3+h0BEHuS6gAg81PHY
         vZ0KfBxvTVaa7UmlxmmXYlAl7Q4QRkCzvnSpRkjmMYwds/yldBZfyD94kzk5SpQmrW26
         EiCzvuQBDXTyaBJ6PLbT+yFxLHYD02J+L+xdi4un1EGHZoAR0OL74PQwDEvaFiu0G+/m
         ciWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765984113; x=1766588913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VSR3XR5/H+O/jOTq065MDiTfXdSjyAyilbg3XYh/0l4=;
        b=dspELl1DJGaZJbrE8Xn6OiiFDoeLOCxR3iW6dS2gwfTgG3WED5HPAJQTp2DtMhF5Xc
         xdcvzyk4fcmx5MkX3+48MWOI/f79RH80YkEZhus2kuMa172vI7f0Txu4TKuKJZdgNxda
         wmVjDX3ekEBNU8qoaqFGbHyudQ04hNdTtfeQsKBVzd80YQ0D68MOx8VVNsAnNjFkyJDZ
         eUsAbP/J3ZRTR4EQ7x8hKy1y1MLXnl9rcjHg2VwDZQg/11eteUBJsP5FG72r1kCeGqce
         xOVgsBYDugjDUMIJrJxnnMb9j0X0I/3cnVRb3A8sr0iPix8j1RXrxXTGAQIi3b+mIikH
         ZXWQ==
X-Gm-Message-State: AOJu0YwlCaH6fzz9NLGSg11aFHmvU+OeiNH9jnRitgwz2HXc3Za7Nr8I
	JrxDqrnTpLQeHzR9A6efThi1Xo35Ov7FOd5E8VzNTRDAXY7gKEnZH7mVJsu7oFA+iBeNDIa/9vj
	uSsO5pLggdfazs4SAG5tq5O7sYDhhMDOv4U4hnfUVNN68Q6FZlUsDMFGIeOVoVQr91JShBME/Jo
	/Vvjucsr6DXLv2nKElRQ==
X-Gm-Gg: AY/fxX7/zrVgFf3TKLEuF711ev1z4Q8g+cGJDf9xOhrG3RisUakWkEWgdtqUnxBUEbY
	UOb1ae+8/eAbpAYvMpF8YeTpnHwo6CmBGMjcvutuc7Mg3JHyCGw9EjwnIKV8KG8+mQF4abm0+C+
	onGP4oZ/qD7M9onN+vR5fPz7ryhCARLQCIDjxX7YrDBGG7LEPyKPf1jBPXzYuLT1SKteyfgvSjZ
	7Zz4yMm/1RQE0afeVt45vrRdmqd80ybj+9Ccs6XEpilj5DKK2PujqcQVA204zC1+hhkNV/bsTSP
	A4x8i+zuts6TWViEX8Gc3qbhB4Tfje09QLTZRiqrQuDFR10gyFNqE9yRSUtgAs/yhlBzdKV6eR4
	2dLAubo0tyzJvlbHU0M/O+GrIDa25wibQ
X-Received: by 2002:a05:690c:25c4:b0:786:59d3:49c2 with SMTP id 00721157ae682-78e66c26772mr135002907b3.35.1765984112996;
        Wed, 17 Dec 2025 07:08:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPLCB7+zSTFvWrZ8Me0DSznv8l6BPRvugcxdjD0aWMqceCeuhOSTm75sRMdjkvhvJqUrkFSw==
X-Received: by 2002:a05:690c:25c4:b0:786:59d3:49c2 with SMTP id 00721157ae682-78e66c26772mr135002657b3.35.1765984112580;
        Wed, 17 Dec 2025 07:08:32 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b801cbac4c5sm52792066b.59.2025.12.17.07.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:08:32 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v3 3/3] ptest-packagelists.inc: add python3-pyzstd
Date: Wed, 17 Dec 2025 16:08:28 +0100
Message-Id: <20251217150828.1044438-4-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217150828.1044438-1-koen.kooi@oss.qualcomm.com>
References: <20251217150828.1044438-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExOSBTYWx0ZWRfX4bo8WSqwK2S3
 WHYNnrF9+dGU+hDuw6SIbn+ZmVIZmFLUBP9urL/N3p9T9Nlo7UQi33c8jbSz40cSch0tIKT427R
 svRcMYoSXWI6LB1BtX4cPOQwGF6yUrEdHLF7iXmfROYj1RVEV5Dk4a6I9NCKYrhrw8m+XhuB9gS
 g4N/qU7MyOjCEaZK+9P/aKuTH2oMSM/kt+sCYpeTjZQAYcAGmB0K4PwDsUsOXICB7j6Cs0Qewii
 j6utc+/7OX2Yd87bwOy9o7rI8QBYolF/jdIYG2sYTua6vIkkBBlPqQj4s6nPh7DvhEdk0lSeKfs
 //7R5ML6xEnmpWBUB1IaKecK8vhouf4/hsUC8fKBb/ESnRxOppl8jABrLHpyNWcL8oC5DGjo8Px
 f68thJAJBR+LrY8MiTB5ovU9d7jx5Q==
X-Proofpoint-ORIG-GUID: 1vVR5V5z5bWbEjOFZ6pZtz-NSpjunxxR
X-Proofpoint-GUID: 1vVR5V5z5bWbEjOFZ6pZtz-NSpjunxxR
X-Authority-Analysis: v=2.4 cv=R48O2NRX c=1 sm=1 tr=0 ts=6942c771 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=D4WGGTV1mRTJFl8SKGMA:9
 a=kA6IBgd4cpdPkAWqgNAz:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228053

Suggested-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 09613294d6..9aba19215c 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -76,6 +76,7 @@ PTESTS_FAST = "\
     python3-pyasn1 \
     python3-pytz \
     python3-pyyaml \
+    python3-pyzstd \
     python3-rpds-py \
     python3-trove-classifiers \
     python3-uritools \
-- 
2.34.1


