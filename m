Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878E0D65C5F
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:08:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16723.1765984112946485100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=AKASGtIa;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Bn0sBcvG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKpAT3048740
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eGKV38FAc4Ba8zUNf40v80YQXUITNDNIZnc
	mBjC0nY0=; b=AKASGtIaX2PeehwmadrI7iIhRtXXdLOeBwBEZE94CUuu30Mwadm
	EPvdcP0E4lIOjlbCpOf6zR3qzjEFTwXOJtzY+Cl4Opu2sLUge/xx1qXzaKZrUJKO
	dObA+IIhpFAZTH86RiacGpgkc9RJn8/W3ZOZvlV2rWwFcQcLwCvsOc00WTY1UtkT
	WAgIY0w5YBQpXx+hT4Gc/Bg6qhnDJvemy7BVvJBMjYXqFjJ3b/xgpeJl+IAiJlGx
	IifJajUyqr+uugAyLDz4cvI5KMJhqgDDrTH68rMufEaZ9R4Q9OUPM4s9gA6qNmkz
	Kkn1RdzE+/HCdPI92gMBjS2lLV1nCd/sgoQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgqad2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:08:31 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-787cb36b60dso78522317b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765984111; x=1766588911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eGKV38FAc4Ba8zUNf40v80YQXUITNDNIZncmBjC0nY0=;
        b=Bn0sBcvGzG8zQS2L0HCjL13T6Rx7bnN7Xz1Ht/8UqhAfCEEILv7H8gotMNRk0l0Qx4
         OnSZhB2sO0IKCs1dqwMVleLXyirHQw80rooaj1uo7ZYZ/TYRsz2bgtzyNjOQ/UzUEyUX
         xInbserh5pcfpeS2jeKeRpKD+v6ipmH073zx1k0t1fur8XUbv++GmqLJQ7tEYwzckUgQ
         UyC37VTCpmnj7/4CBjBi2Gxgg5pnN6/ZYYY52J4P318UGNBLXFBBHH4u6pJXtoBeu8iU
         BHhrUKsXXyhhLjMgllOI5rsCGPvI18Q4wm2y3ZoDqDSD1FJ6byFF7l2VncQ+k+v/KMft
         0Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765984111; x=1766588911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGKV38FAc4Ba8zUNf40v80YQXUITNDNIZncmBjC0nY0=;
        b=u6rqEi2ZKKDD07ruWXqKzj1hBIIvcivkxbJESjoP3nBPw0UZJ/bKWh/zhaZ5OTcHL+
         Hyua1TqFTJ8+AbEaQSmAbJnb61cpkWtmV1fFg/P7mkryFtnB9RjbmP1HSi9AwPO6sl3l
         c2mW12c5H9i8NUVQRmP+dHa9lusaesvY9KkG4g3Wnvp1dw6MNgG/TF6/pmIks+8snhkt
         lR8kMHFRX8lxa0jdvxu/jkEUiRe8vyQUYVlOBrrUa0dPP2IFZdNANPVYVd8RudeTNPpH
         v0JGZt3x9tsVV6DQVw7N23FHlH/z7nuJRubaN4hFhUqL3ZvA79M+Jm+Bu5NXUjbtEey8
         +Qnw==
X-Gm-Message-State: AOJu0YywuTzzN98WTvwqf/eBUrhnQW24ZE/XUclL1Dmzp/GHB6Lhm1Z1
	8d/VxQs0IxjThKtih1yh+wAXCe2FZFPbOqZXUEOdmy1x9QpbSUZVpxw3AjGcJrbt6hO6Ki/bRVe
	UYhq+3yY/D3biw6Ju3cVSainX33brqFmgyT1szNwgZz/UpIA2VdjAmmv4l+bMsklAcyLwhJESOC
	FW5xJEWlPRIPKo8LsGgw==
X-Gm-Gg: AY/fxX5rjEaW1g2NKJtIq5YFQBC0BMHVCW4EwB0xryNlfNQk89U7to8r4nkt9stEcSf
	3BHTPSNAN765kcsWYV8ZvDv/oOBk1QZ979LTg6kK9wfv6OGvziKGYcsV363xclSjGz67exXYKyD
	U586N8N3LVT3imhp6gOVng3KZu501KxKftVkTmAAT0Ae65cFB2ToLVG63ex+7628GmUAsW8olwX
	cUDSNgZeyZMZvLpwg9NIt+3IsZnQW+1/WYLgTwSqoRcZ4hKb8GfVQzh5CyKMv6lpIs9vht9ZPpB
	oexncCDCN+hKDZl/ffB6JZNa3mZ8wSOb6IKbUM3aCBUTb3d7Bf8hMMV6fT6oN/vx28YEtgyTAwR
	BvQjMwYOLaKUT9zlCNPC9VfKvMFemOZ7N
X-Received: by 2002:a05:690c:7004:b0:787:ca87:595c with SMTP id 00721157ae682-78e66ca48fdmr352408377b3.9.1765984110957;
        Wed, 17 Dec 2025 07:08:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4h16Lta6ZQNw/Pzji1d00aOVoXox/wMC52fZleXQtjZRPo0yCI2Vupw3zWg2ZoBGfJk8gSw==
X-Received: by 2002:a05:690c:7004:b0:787:ca87:595c with SMTP id 00721157ae682-78e66ca48fdmr352407947b3.9.1765984110475;
        Wed, 17 Dec 2025 07:08:30 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b801cbac4c5sm52792066b.59.2025.12.17.07.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:08:30 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Fix and adjust ukify packaging
Date: Wed, 17 Dec 2025 16:08:25 +0100
Message-Id: <20251217150828.1044438-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=6942c76f cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HnmVqgPLSETmD6ZL1HwA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExOSBTYWx0ZWRfX0w/GTbjcSxP5
 Twrtlx4crdmlBSnM3Y2QfqxzHb/LMatJ9UMiM8MV4wnoibVxtPUEJC4WGWCw2ecd2lAEheUo1Hr
 lpoJ1m0oAFgrBXx0IyDPX1FodXDtsRJOhiKxcnz4fPDCcSe/aEDKjBg/cR9EBddi1Dr+DSb9Ke+
 Skb4IxQ0lb5QEozKA7+QoMyzkDQrNRciMKQUC2jY0s4SlEYLhOIebA9PcQd3ZzYKq5KX5HBTLTg
 7jEDJL/rTuG7DK2kJ7pP+eNuoC1qSILNKKe6qdyfl2IJK6LeB8kRbfrQX44S9FEB7flrI/7J+rn
 Cz9onees+Eu8ftEOZM15s60g1WCJGuh0zFgLetaUaj9BkLZV8qjp0EDPiENw0c8rivi2Bb+kCoI
 gt8N6dTLtf8jVFPW6+5No77GKd1PCQ==
X-Proofpoint-ORIG-GUID: KXX_x2HkyzNizTd-Nht8XuwjUpfeoZ18
X-Proofpoint-GUID: KXX_x2HkyzNizTd-Nht8XuwjUpfeoZ18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228050

This packages up 'ukify' from systemd to be used as an, optional,
stand-alone tool to generate and inspect Unified Kernel Images (UKIs) on
the target. The original plan was to add this to sytemd-boot, as
systemd-boot-native already handles 'ukify', but the recent systemd
upgrade snuck in 'ukify' under the radar. So package it up properly from
inside the systemd recipe.

Changes since v2:
 * Add python3-pyzstd to ptest-packagelist.inc, as suggested by Mathieu Dubois-Briand
Changes since v1:
 * Adjusted pyzstd patch to not specify an upper limit to the setuptools
   version, as suggested by Alexander Kanavin.

Koen Kooi (2):
  python3-pyzstd: import 0.17.0 from meta-python
  systemd: package 'ukify' seperately

 meta/recipes-core/systemd/systemd_258.1.bb    | 19 +++++++++++++
 ...emove-setuptools-version-limit-of-74.patch | 27 +++++++++++++++++++
 .../python/python3-pyzstd_0.17.0.bb           | 19 +++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb

-- 
2.34.1


