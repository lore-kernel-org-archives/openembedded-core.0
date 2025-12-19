Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26649D767FB
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 12:01:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15342.1766145675066269657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 04:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fFKmGldM;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Z4QnuOu9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB1EBn4154540
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+gB/Ynz2EyXSfUBFFZq7KN/1IJQi16jQxRs
	ZZeYTqoc=; b=fFKmGldMQP2AXE8kLJnfdsKhL62H4FEVNDgVD8bPR3gKCsb4O7U
	pZNlAGWfTl6tw09MQii27YYH/3TvK2icRc17dR0kkda8egdVcKpVB3QhznjuVzRT
	YNKQgfCvY8N5EihQd0y2uWxxhm7Od2Qd+/U4/SGl21vIkQIOK6c12YP0FFJhSGID
	2uQCf/mWqtMWA1HWs/Ye1S5IB3+iK/++1tv0KuSDZp6YYDuAAaF/v4zlcaeaxUYK
	5okr/jEP4xiZ9pDXcnzFKd2mnW6zxCrCxxu1yplbZn+97nwD6qTM/rrNUiwxsZl1
	C4UYUSy/tNYs7jv3no/jpGuNWevY1DE61Nw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ctk0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:14 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-559597352f9so750156e0c.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 04:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766145673; x=1766750473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+gB/Ynz2EyXSfUBFFZq7KN/1IJQi16jQxRsZZeYTqoc=;
        b=Z4QnuOu9cPhC2ehkB0Q0ACYdadQi59SqHBDxOTh1PQyIUTifMy+bdsm+MouVfeGoeL
         eT5mtQFqSV5RcnxnLJ7YiZwXq36I5Sp7W9THYJlAeIqX/E6BI6BBCQ+bOJivuZBjVrIQ
         mT2OntBu+rfLJFE0z2ToFVbU2/9Sl6osgvD5RjmVD0BTewBRFeu/cw4vxvV8p+DVQ6nh
         jpJUooiniSy+Pl6Kzv2NCuYoZieIJcXQnbpSaBn517tJnRCH5V6I8yPSsHIszjFLI+P1
         Ojs/2nez2iU+ofeOX3C8DOWxKkes8xSd6diKMbW4LQyhbk2zn59y6+EsFOe9bx41v/VP
         ZIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766145673; x=1766750473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gB/Ynz2EyXSfUBFFZq7KN/1IJQi16jQxRsZZeYTqoc=;
        b=UmUjM1pT4Gr98QsHwNaCiLPIIAoXIdnHHtig6mRvsCT5kQHNcDbOSAFrXmjZF/fybK
         yjNNCJgBFpIudDKh1ZjM15/yrqfZx4/ntQECoPcX10ELtviETVmaVm/2CaxaFuLPguvC
         8Q8JX7YYtiXgM3Dv3D10NFXkDhXnLQdyPMS352jwhhHDh22YXCmS04KyUTXs4Pzr4y2+
         SJAvKLZ+3Pj/uHYeoBddELVJygLJaaH3t+Cwr3z+TBcae2sDDxmyb4FWOPnn82OObT0y
         JR4wzO6VSy5z0oeeYq7TrQNnJYsuGe3jB1530MWgBqgYa9BnjEMSPR4X8lSJuouSWUGp
         shAA==
X-Gm-Message-State: AOJu0YwmOekHVp43fpHHgSliXwbAs+kSR9SkFu0dBy8c9W7SVd++FRCG
	q6ehfMHEFymncq5pL67o21w5QwenVaBdnW42+yvYeVdIc0+nVsJ65MBZECOqGUE1TOgdpQ3jFtK
	D8fKPyq7/9PihTVeMDiu59MBgUtX76krXdPONTa6u63z8N6rZtObvUHd1Fq8BXyCy+p1Ve7vIJ1
	Ay5oGzxf6N/Plp8MI=
X-Gm-Gg: AY/fxX4pJ5HumoYREbhSoVUgu/R8klw4vdB8Y1QAfO+ae43LD7FDxAGCxYIR3U2wp8B
	ZnN2JQ3Mj1adWxyxb6phZ5Mq48STlpCu11zkK9Ffw1YAv40tP6SkghXnSoqf2EXcJFFQKfuzp8x
	JA6fXLhhR59KB/mdKHO3BHAP2OdzUgjFQDBpDdvKBuhG5ylh4rOmlJ5qyIyy2Jol+AuqZS8mRT5
	VLO/7V57d7vL942CYNE2F/D++4TjaQpbWW1oHVwcm0U9cAl73PsUkFV2mdzMNRhw65ltFA8HR/x
	A9Xh40EGW1JPvbpRdtrzIoEX3ZhiEcO6nSE9d1YNuLkaR5T25eMD5n+aZJ0jFHjHe34paZj7OZm
	QWe7CppkWTxts4BEj5+I1g/gZbZ+a1hCs
X-Received: by 2002:a05:6122:616c:b0:54a:721a:e4db with SMTP id 71dfb90a1353d-5615bce8455mr840694e0c.3.1766145673170;
        Fri, 19 Dec 2025 04:01:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx1gr76OYbjYj05fRcmswk+IvEmy8PCEwCj7D1mOtd/SV5re0FmLcJWL+N3LaW7lY7cxTqqg==
X-Received: by 2002:a05:6122:616c:b0:54a:721a:e4db with SMTP id 71dfb90a1353d-5615bce8455mr840665e0c.3.1766145672735;
        Fri, 19 Dec 2025 04:01:12 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c03sm2002120a12.18.2025.12.19.04.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:01:11 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Fix and adjust ukify packaging
Date: Fri, 19 Dec 2025 13:01:05 +0100
Message-Id: <20251219120109.1967755-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sBH7Pz_UhoiTzMbNe73WlVvvjmJwVMX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5OSBTYWx0ZWRfX/NDAQRTw3XGh
 FLDvdM7a4s5OSR5xDDh8XAQs/KvrTrtVEcJmw7U7MLisyrs/yrMNp6LYEO8AgSsknox5rFQNJfy
 41ZX6NbAuVgGAXlLFAI7CRjD7sOVjyTCm2soZtKJYGrQBbjjuZ88Ewx20MrJmJ55CgsdstNIQEY
 yFmXk+apYoJRSCI0BPqarpOwsid3RR6X2ovEtzS0EjiMJqz+MmqQbgGdHLor98vypnjRfomByk5
 Qqp5LCPocw2QZYTP08/dqfHSvz0yLo3TrQUhwD01GI0G31X6NiZB2ayM+faBq5nqWzjd1obi/ws
 Z34IyABY0o4nXNDZ8syz/q6UMPPYizywkGlCRZibSvUkJ5wAkdHhDCRqGab6OnhycDjp3YhsrSJ
 +rtlWM7cQ7j5EHacQexHy6iUYRKsSbb0wn8rn4kIGpxGFrQtN3rRsPhpzHsWIW/ODuw3SbZsiRI
 AIPP1ld0YJcQ73Zgb8w==
X-Proofpoint-ORIG-GUID: sBH7Pz_UhoiTzMbNe73WlVvvjmJwVMX4
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=69453e8a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HnmVqgPLSETmD6ZL1HwA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228221

This packages up 'ukify' from systemd to be used as an, optional,
stand-alone tool to generate and inspect Unified Kernel Images (UKIs) on
the target. The original plan was to add this to sytemd-boot, as
systemd-boot-native already handles 'ukify', but the recent systemd
upgrade snuck in 'ukify' under the radar. So package it up properly from
inside the systemd recipe.

Changes since v3:
 * Add SUMMARY to python3-pyzstd, as suggested by Mathieu Dubois-Briand
 * Add a maintainer entry for python3-pyzstd, as suggested by Mathieu Dubois-Briand 
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


