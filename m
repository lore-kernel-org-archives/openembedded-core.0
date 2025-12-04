Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D32D1F9B6
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 10:48:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40729.1764845298143363800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 02:48:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=H6KFa5zi;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=QTejpOHV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AEwpq1130992
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 10:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lsd2ObiCYKESQGf4esBfadSWK197PTZAsIN
	qpgaAMaI=; b=H6KFa5zi48tKBKxEe+jnBL6uMjvSdcMf/KRXpSz9qIEz8EqHP5x
	d8eokGDE+ue3AoABWkFphdJZWqoOWhGy0MRhsyK6ig1pQaKwwx1Z8Ziy1O4MhNvY
	fECOIOzmCUTqwNpu/F7S61MkgXwUKb85oXZtat/FwPZwenZIdoSu2pzSQJwfg/f2
	OZfnPIfJfLKzBt8sLkyUtvDO98Vry5kmcAZ/TfLfP36YvAYBihFXAoITDnP72d+G
	UvvarDyISmTQUYi7cQ3DT6Apeg2nqTinAP6DEQaNi41rC2+PrRGt0kSdOhzLsUmw
	BKzyiEtaB3v4VWo677DZQfcovBixwoKvjVA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f01ecw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 10:48:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8804b9afe30so21353256d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 02:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764845296; x=1765450096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lsd2ObiCYKESQGf4esBfadSWK197PTZAsINqpgaAMaI=;
        b=QTejpOHVxtfVpIIh9ti+KHqv9gRHznwYdBXNDbSM8zezcO8D4NcgFJTQoCBTDXnZJP
         vjQd9QMUZ5AqwnjCVVZmYeMhiyU4OQI2VZEr2afprYfNFD1hTrPwS2q3S5hJfnWHiaK9
         3P33xX5jVh6xZcR7zUIUiYpGlz2/kl8b6Aa8zSKsvQKc1t7ROaZKxrvVY3FcJa/mGpX4
         ARsxoY1xbp2Sbwh5JhvDc4dvrNyEw/pSqo/hJsTZSJlBN98AnMErlBcrdMUqpsit0wm5
         86Y0PF6IIf9VNVHkiYsBmjBxDzx7A2uGRcfhjwsIiqAuaAGl8ykgTdWHqleU0dbN4A5D
         kaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764845296; x=1765450096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsd2ObiCYKESQGf4esBfadSWK197PTZAsINqpgaAMaI=;
        b=wbxx3rJUm0fTAEHw5M0qu+O8Iyc7juTHFaF6PTgDrVcT/wFRPfe3cLifs8TaA4tw/q
         U0rYKjTEWR+xpAU3l0hQO+gtNi56lwAAs6nZOAjGNp0Nw+Ihs9Ou5oM1gaKV4w/drln4
         UuNhdIVeO5ZQSoQ+l9TimdUhxi4rbk633Jvjo/dSciEYRv1qlhI5aYfGgLYHxaJsldjY
         7LZx+WMS204zVNsNFAhZxkMKbOivJA4EKhndV5R1cLZvd/iDK2Tm7GdVPA/HRyC1mIYH
         Af8uG9UJllANoLyYFsNP6zADFShILJgErhowf86pO58QCdxawbAzU/CjtZ199j8rpRDw
         eahw==
X-Gm-Message-State: AOJu0YzmuIMf3M87fMcqX74iX+PHh3hATd7lwrI5QglzIpAtLuZ7kXXs
	6SwAlvbS+S/ispyZl5CveDsBkfK2k/jX0lKq7AMiT1xuCTHGp7dvddfx63HF/zdCpC/Cwm0ypZD
	Uz4OR6aP4g8AdAqiNFgug0Yn5RZnTtUrXBJ31xBHkdxWdMw/FObfzy6GTx2P+ERnx6ZZIUrJ9aW
	oY1cJZScb1MrhG7Sw=
X-Gm-Gg: ASbGncs7YOlX7O5ErR4e6u5lRozrNzqVdZpjuzTVlLb7lZJdCqw/fDPtjxo/pvke+z1
	JccXxvlxC3SbrrIuqlC0Q2XekPK+9+3mLc33l2dCRT1TznMG5IVA4MIG99qcuwSZStTOBN5R6tW
	SkT2WFubAqVITAlLsiG2FDne+lj0WI4FSGHDk/ZioyuY7CXVjbc0AtQd2p0KmQJgvZRDWuc/HJY
	rojbsKBh4QmxCfclEaQ5j+EJqgR/SfmMU3+kuN1WW7vRYwT9iUpoS8engX/xtNTxtYNOJM/eq7J
	RSBeFSgkAmayYZKhDDogk0nkQsdhvDk8OIBmiS4s6LTZCagat3viHrdaNv9JnBS78arDfXc0GIj
	sl8FbdKDghxRBmtuKVOVAwv02AYIcRO0hlzHgp5EHsLH0gBAxstFFttYZTgd2wbrlDWafX1J6uK
	zgONwx2aTb0pTUwX+YqKBGz9Q=
X-Received: by 2002:a05:6214:29ce:b0:880:4c2f:5075 with SMTP id 6a1803df08f44-888195995d0mr81055436d6.56.1764845296218;
        Thu, 04 Dec 2025 02:48:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRbAvdsh9MG4HXCUDtCdk+Behr2ftjonDNSoV6vY8USAXPzT9b+oloUw09URMgS/1K1LWW8Q==
X-Received: by 2002:a05:6214:29ce:b0:880:4c2f:5075 with SMTP id 6a1803df08f44-888195995d0mr81055226d6.56.1764845295686;
        Thu, 04 Dec 2025 02:48:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a416sm400355e87.17.2025.12.04.02.48.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 02:48:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: upgrade 25.2.5 -> 25.2.7
Date: Thu,  4 Dec 2025 12:48:14 +0200
Message-ID: <20251204104814.3255908-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _1dBc4EyTWXFeoj7cD3cfd0GgmoHlpIX
X-Proofpoint-ORIG-GUID: _1dBc4EyTWXFeoj7cD3cfd0GgmoHlpIX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA4NyBTYWx0ZWRfX4TEs3Bb8Ewty
 wgH6ABVJel1K7VdR37MnZQXImscZ7RqpVQbcrimZ0+7xq85jYpPwE0XN6j7D0pP4BvN7J+cvoMi
 Yzfm3PTGSW5LxY49FA38Qwiw8YgRLgcIZDMg+pxdvEyohNbOY68q56eyTlTJt7H5pCJ7vweihVL
 EuXwZlQL5QYLsJbIDqLZAx//3T2SDO4XT6z1DMNnBJtRdzbI8v5sIUsTQvWyEvBqi3WHKiC+AnP
 EPJvrABe6WRCKK7Ulh0AyBfZJ9hXx6FYGMgvY/9983GTxZzLr4rFLhqyJmwgRq/x//9hePv4AAa
 q8+W756Z59P40q2S7f6sG07B4GOAVmTN+4jF6Z+BR9HdcLXqPVJQW0VE3l9TlcL0wRsY73RNrm6
 DCvZpmsieQxjblIOu+VsJJ4CqDgQVw==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=693166f1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ZpVaWaFtAAAA:8 a=EUspDBNiAAAA:8
 a=LBTFswcSqxV6BzKNEaMA:9 a=OIgjcC2v60KrkQgK7BGD:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 10:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227278

Pick up the release from 25.2 branch, fixing several issues with the
drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e8786aa2e986..d34b5ff07713 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"
-PV = "25.2.5"
+SRC_URI[sha256sum] = "b40232a642011820211aab5a9cdf754e106b0bce15044bc4496b0ac9615892ad"
+PV = "25.2.7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.3


