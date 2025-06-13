Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35717C71135
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 12:04:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.8801.1749816243233268984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 05:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HK6EuUcx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9Mfkv032314
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 12:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6c6esXuKmtStxB8NaeXaIRLze9Y6J51hxzY
	skFCM8u0=; b=HK6EuUcx+Rb9g98UBd9kDe51EpwfkSVWQg1BkzoliNNTUdFkc6C
	UXOYCWWWY7Shu377CYRAieF2hTwQzS048kJTj5Ehaf55zEKTCcXx8t06A2SoHWHD
	VbvDd9ZPJUHbNdnRaGucIGjDjEwsJvhzyiH8Cw+ZQOJn03RQhIxFPVuqNvcOXsOX
	MR0M2zQvadJpOV2fOpyWQrMXBGe3flJN4qpCj/ElsEHNp9DM3oEiMJMMe6qF619J
	D/fIyOUKELQD+uYweor3ihGdUQrKHc607NgMFRlHA5DGZQrwhpD6awWAqgW4V8QF
	RqTVg4+1Kd6w9j88wKjD6lghn/SL8cf0kIQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jbpmwu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 12:04:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fad29c1b72so29128536d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749816241; x=1750421041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6c6esXuKmtStxB8NaeXaIRLze9Y6J51hxzYskFCM8u0=;
        b=oPltaCYTdYuMWPyaPrb8jNCTIC1hZ8OPY1htWRznl8dYt9wTSbH14H4kPkmxqXWmRN
         nPr3gEXiWhJGs71tlFXUqXK1R4Z2WA3V6R3AJqKZAVhVWcMYRXtwFcgwgSMNZUNPyVxb
         Myv2jn8zesTzZJ6SP9Azq8/gkO8tDHDodjG1DiOWUnP+0vlUC0Y6cKrGBgRHNJ88QGwt
         Rz6aN5N1x+K6hYO6UN5bJxV6F3L/ixMQIct881hlGN4LtQ3tHc78wzMqXMW4EVMJdXWC
         KRrAaRto2U/DLK18o9KWpFetxp5WoL6K/KoemNxuMUxQhx7jhAPglH27ycDz3pR930kC
         /7Mg==
X-Gm-Message-State: AOJu0YwYk3/VifHJfMi/BOp29PRtvIfcZtL/+ZXcJedCJtetHKxmIDrq
	nb4Zv+svI1LlNrba9mz1AQT4UfmlFRXRbsMLFoAFRDqZV7H6wMTTAulUvegOVZQkAVpTbh2IJuT
	I1jMrnu5N3KZQxyZSvCRmOZbuw+5re3g9GU/NYPZxyaSHzST0AAMlnk4lY6Cz8T/auFbGn6kFOu
	gNfyj19yb9uPMlua+h7g==
X-Gm-Gg: ASbGncvddxzJUBtkWx3oxj24u5Td9jKHsaXYWwcy5mju8rcYGapkRzE5QTMM6PwuhLg
	Dy3ZrG1PYhYBGUQa4c1hU1fhBLKGTnoALXIG/gwdTbCjaz5213WSGKuwNegCiSEoVGc0p8jYOOU
	tZm6ifz+ZAEbxG3h8Q04wLf6uflh9/wkni4BkAya6s4vILJerniYCjg1KEFs1msRhvw0X/UYUiU
	6+E+I9WLsPM/QqvPWcQRrLZqWZSlOOqM+Z+/PcLlE4V+0mefkVHp7Lia/I6JYIg4X0cBu/5yXCH
	kxO0l59A7ut3YGtQGrQKzYa2f+a/GZlq3czsQ79qO38RKljDftXfFTpVSd/2zAbQsEBHyN1qQRW
	WqFvxDD39PbRD9MdWa4Sa/2IKMe3XwIibMPI=
X-Received: by 2002:a05:620a:25d0:b0:7c5:5883:8fbf with SMTP id af79cd13be357-7d3bc3ec5damr380695085a.21.1749816241158;
        Fri, 13 Jun 2025 05:04:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0oh3ILpG/ZGs/othYcKd0pkeBjxIhxyQnNkvr0MJJvjlgyr24YiZ6bEEOw7zQ1dYzB5QJ+Q==
X-Received: by 2002:a05:620a:25d0:b0:7c5:5883:8fbf with SMTP id af79cd13be357-7d3bc3ec5damr380690185a.21.1749816240582;
        Fri, 13 Jun 2025 05:04:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm422913e87.31.2025.06.13.05.03.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 05:03:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/3] mesa: fix RPROVIDEd package names
Date: Fri, 13 Jun 2025 15:03:56 +0300
Message-Id: <20250613120358.2011626-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jHoSPnKgsTIrnlKE5Zgw3G-awCLAiscu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA4NyBTYWx0ZWRfXxeGpOSVdIBHb
 HUxShgXschmviUzyeDqx4ZV8HJaGANrX/TVE7UO7qwqkeR/jXW8JDyXdQxqWNlVA5AqpQMFejv7
 d5Ky2tZW1OBJU8eAQsbMsX+ra4JdmTSuZNMMUfaqWhSdnFLhz3/VsNNy74Pidf1k+U4IPpDSzb7
 fc7s4pTYaDfHGRPgWUbZZUIiyJNwA5ABPWyki2ZRuaTGOIQZAK8dOe97Q7toIz/nYB0UdLPs3zp
 emIpnDryQ2jlKcCHMcpHw/07/9+1QNTkUyn5j61zY0SvwrQTygYrtlYPWc8hwh9MRx9KvMonS6V
 nTL2023E6oxJqKZ1yIkpyNgX0mK3+UiL6M32v1cdDtPRDtEUqFV4E/G0YuOQEs3rqw4qcgWQ3+P
 hV0sUg9HYD6qfcM1mfuCa2h8kGZDzpfM+GOMTcBT+q0Ch8HKwnHAYuIjyHcQNy3Amk+BQw1h
X-Proofpoint-ORIG-GUID: jHoSPnKgsTIrnlKE5Zgw3G-awCLAiscu
X-Authority-Analysis: v=2.4 cv=OLgn3TaB c=1 sm=1 tr=0 ts=684c13b2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=9Lscu--00yPY4GOp4jwA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=991 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 12:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218596

The BCP for virtual runtime package names is virtual-foo. Make mesa
follow the established convention and change the names of the provied
packages to virtual-foo-icd.

Fixes: 9d3b4c9bc403 ("mesa: sort out PROVIDES for the glvnd case")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b222e72fdddd..b13222b66b87 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -284,7 +284,7 @@ python __anonymous() {
     if 'glvnd' in pkgconfig:
         for p in ("libegl", "libglx"):
             fullp = mlprefix + p + "-mesa" + suffix
-            d.appendVar("RPROVIDES:" + fullp, '%s-icd' % p)
+            d.appendVar("RPROVIDES:" + fullp, ' virtual-%s-icd' % p)
     else:
         for p in (("egl", "libegl", "libegl1"),
                   ("opengl", "libgl", "libgl1"),
-- 
2.39.5


