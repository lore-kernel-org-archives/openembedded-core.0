Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1469D116ED
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 03:00:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10295.1764212416065749028
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 19:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=AwMzdh7L;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Vv6z+WVK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQJM6j52221831
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YZe9437k1H28N4lHqpi6OVTqaowm7JDVjP+
	uVWbbsso=; b=AwMzdh7LRD8gOMZOTCT1VMiflTPuMv1eaXAe5OtUOs+T7qjQBMe
	nJ0XvqJUcKLPrMbiGeR23mHGe6PIdsYOq/5I4JJi4xs195CRWmN9waFs8ptBT48c
	/vverI4ssOePZOtwdHmVUTWA5qcT+karZUuEj+8RK5EpaE2mR5pnMiBi8lBfdRmY
	LRRdRDE5dF+0AAMM+LJevCGI/qUz0wlvyQCDQd0JS/fLFdPIFa8fsnWN6NCgLUwU
	VdkhLZpPyqe5ymUv2AihE+iKo2IdcUXJ4beyB+CnbifX+VObW1eEQgxVIpp0M7O8
	hr1sfs3H7Am/x2LQN15DEQl9t45ZRg140KA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n48vgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:00:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297dde580c8so13216695ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 19:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764212415; x=1764817215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YZe9437k1H28N4lHqpi6OVTqaowm7JDVjP+uVWbbsso=;
        b=Vv6z+WVKvSOYXT8tmgizcHYmQqpKgkZ/Wd8ICQpkHc/HVZiqJU5vEmrlG1bw2tiujK
         8NbEA6ubsQl7dh8lnEvYCZl3bKBOWKfxbJ1Gg4+xIAJkVX3wRPJ44kamqMMd6W3lmavW
         /XVfwvnp2OJcfCjSufK5NGKjJ+zpLqZg/5YhZCjngZq5vokisZRAGyW0iykEBYOuBZvx
         XtixKCtuQlWO1KdVZwcU4mA6WOyAB1TIyVDOG/W3Xl9KPZVwgy3v22k09S9z+t6nkUo9
         65kAFc3Pjzd/tRZpUFr7LwOA93kD2taPwkriz6RUOVdNXJMmMPXQfuN3rGwOJm4zcvzl
         BJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764212415; x=1764817215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZe9437k1H28N4lHqpi6OVTqaowm7JDVjP+uVWbbsso=;
        b=WQ6PwBOI3jZo4lUoOrGU6YhhCGTiYsquD0cIW3PUEdXn6RFmV7wcWXLIb1+MV5iyak
         m28R0WbcvHdYUh2C72X+TmcwZ7tmny6vjrnAldvQ5uukwbMsw7FXFzfVvtNwIt+OCMxi
         CXXSyvnxs0yfPAvY+/wAHWmaeD1yAs/twrEluVU7fmfdtwwPcqMdwOnss1HfRG8nt7ag
         WWQDV7Ud97njH5irEj3t7vdUEVMVm7Tws3qngYcnWjWwXJz0PpG5ChSOTwQNByB0QZNh
         qCqjCnB/zznijQbjw4FEhnd5gkf3cB/avoWtPNy754DFjoYE+/wlk9xNDVyNGReSW2C/
         VmmA==
X-Gm-Message-State: AOJu0Yyx0DFfHRo3ViPAgCAGfoj4DDcpZbQSXT/KIfFYB/l9thj3JydC
	QoGK7Et/wEyDx3UeN5H6EEBmPMVYUytt4YAz70JuwmWBoZ92Yyq34k/i/J7hpC50hbKxohh7qsE
	Ji0AMuxzRvkHSKi45ujEt0W4UOecDmupZv/X+Xq13Tfx17KLnNjsDxohWELUQZ/eLWDybMjMOjY
	GRepNrGUM0vfLihsrGAQ==
X-Gm-Gg: ASbGncsbYpudxgdG+WgwXEKnGugb6S3eOxw8Zr/WEmbwN9cuP3WPzCQhIrl8aDJlrJK
	5s6U62n16D7QHvD1iIhWDWVWLfna2vO9tOpNFz905p46uoCXw0LwvEQG9kbLixItxooi41TMFOL
	Rhh/GE8+O4WZ1tCKnrEEUT1pqe9ChiWqUf8iceljk3IadQCTNwFVLiBJ6BeBpu4YlWLxPyj4M+t
	FXVxO3TTriMTiBUa40mkZVCCbol4mh7qGLydpF0IOVkuHRmu/s2DN3PmDWC1iUBvrPpAutqeh7f
	C+t7kUflB+mCWSnmpr+3Fy3UgHUdFMI/SqAtUVWgVZIKYd5kz62+kvKUML4aT7V8N4MpS0mUzn6
	syD1pt3irQ9qECyYNKgcJo/261a6omAlvhRo5i1qtAvDJgu+GI9vA3ntezkIcz6XhJ9UQ
X-Received: by 2002:a17:903:2412:b0:295:592f:94a3 with SMTP id d9443c01a7336-29bab1c5abemr96074115ad.48.1764212414717;
        Wed, 26 Nov 2025 19:00:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEz3F2crjzEnGsw49SkhzPzrPX6eQwDb7T0vLHU9adyKbCSHylLgmb5BSgoEacdb9BrlRReqg==
X-Received: by 2002:a17:903:2412:b0:295:592f:94a3 with SMTP id d9443c01a7336-29bab1c5abemr96073665ad.48.1764212414256;
        Wed, 26 Nov 2025 19:00:14 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce4415b1sm648025ad.22.2025.11.26.19.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 19:00:13 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v2 0/4] wpa_supplicant: restore defconfig and enable new features
Date: Thu, 27 Nov 2025 11:00:04 +0800
Message-Id: <20251127030008.1421302-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDAyMiBTYWx0ZWRfX4ldxXddG+AA+
 kn7l+Wr/8PRu19+rQPBwt8Wiq7TdcFajeo1/M3TLMPI9TxCvYhb58DlIh4KtndhDzGw1BZNDDqh
 L6EgZUj0WK57uGtRCNAiI2juuf9gNYvZ39JfW8olMPjTV1/KDfgnR4iBQy193hyY/7F6IC2CJwE
 BVOH/I5LLhQ0kDv9vBqkhlxfp/NQnLSTEU1RgBsvADmwOAVVAJ1yFGTEpXvRgtXtgYkZtMBjrVV
 Mr9Q0aUmPD+E15TEZDs8WOdgBIAQ8VpS53Yk0wmuN0Ig7VicASURekPyqCnCeCfJN/GpxEu91G1
 ouMmoFBDhwv/PleBjz9KydojL0ZCxxmYgdAR/4czp+WH3/tSYOun3cr6ufdhe5+6lKgpXBcH2oT
 ZUzcfzKrBMvzKMbh8IVUCMZsit5Jhg==
X-Proofpoint-GUID: vcMBP4Rfq2Ve-Z_COjQcaXK1xffCgtj0
X-Proofpoint-ORIG-GUID: vcMBP4Rfq2Ve-Z_COjQcaXK1xffCgtj0
X-Authority-Analysis: v=2.4 cv=EP4LElZC c=1 sm=1 tr=0 ts=6927bebf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gQ8M9uwLrIa9jTmwnTUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226820

This series includes:

1. Restore use of packaged defconfig.
2. Fix sed indentation in build scripts.
3. Enable 802.11be (Wi-Fi 7) support.
4. Enable OWE (Opportunistic Wireless Encryption) support.

--
v2: updated commit messages.
--
Miaoqing Pan (4):
  wpa-supplicant: restore use of packaged defconfig
  wpa-supplicant: fix sed indentation
  wpa-supplicant: enable 802.11be support
  wpa-supplicant: enable OWE support

 .../wpa-supplicant/wpa-supplicant/defconfig   | 688 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |  12 +-
 2 files changed, 696 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig


base-commit: f0f7632595792a73ea0a935b924e8bdf9954ec7b
-- 
2.34.1


