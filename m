Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F98C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 17:13:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.29163.1747934021886804818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 10:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=c2fJgVW/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFM1AZ021305
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tq1rNWl0d6H
	7kdK9oMfNdTVx5iWEh9Lz2+tSVLcy7Ys=; b=c2fJgVW/EgVUYCr/Ul4khGOP16B
	Z90JjmXj3mGhm1FC2sWx9pS2n6wsRdWMk7kKyr7ufMCva3EMtp2FO6VkiH4CJX5W
	y2/33uJY/pfsU0NcsO9IwdWDC5YQE47VsWt/2I5YX7GDpOfhwyk6HV/tZX9xyl8f
	AMMFzJNGf9/mDhP2l7EYf40MjNQpmcJrnSSrZcaND2ED6GxNzh0OTcRP307sBlDF
	QEwdRE7YcVs0T5uERusuqdQdBcxqAx8YC6csXv8vh2Ay1v9C6pOWcIZ6hl34sjlo
	TR84ehtDFT+JRZzpCCxY8Z8Wy3ZGHzvK+kX+B247Xxt00wN0jby+AZXf6zg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb5h0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5750ca8b2so1198928885a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934019; x=1748538819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tq1rNWl0d6H7kdK9oMfNdTVx5iWEh9Lz2+tSVLcy7Ys=;
        b=LYsQoNE5sJOxplaYAVZOs4+JbNa7jCQuS68+KYxYxg71bpNKQK6YzdLerZqUHE6hoT
         561kRoecG2AaNQE1ECcoh6gWZor1ZyLw335Wh9eMkfph0GIYZUl+B2lY6cgUzjwlq4/i
         UkgVr+Grup1OqzDrNEHT5lOahHg5Xvszorv8Vkv71BP5Dor6U+lBoKceJcVac959gBR9
         2T4LT4+vPRQjSTxs5G41LcCVouA5W3J/JMdc9zS8OZSD7vfOBLb4Hz0r7puQyc8yKFmU
         cSLhr6Evrapeuw42hb7aUsSRnKaiUlIUPLMidQNfc3gDiSPABW3Wnt1dRDjnTkaRQrrC
         tH3A==
X-Gm-Message-State: AOJu0YyG9i3iIP5ada8vH4M2Ey+BJ1kotOfKkpyLd1QW9TxoLi5HaVRl
	U3ObZcutR+hhyrHOzC2n0x+gXi8PRjWS8PeL9nPu5nxxir1iQyS+8MHb7V6UDpbXZpLePR1Jb+a
	TbSGlxCXGCz0fpW0zO3Nizkw+/wu753Nwtosl4jbXtg4Z3tjPcLXYfdzbluapn93u438FpePXwG
	tVBZrbuRtaKTgTntc=
X-Gm-Gg: ASbGncuIYMnyBY1ibu1DvQhVLhH36b4lGr+X4gOPwt3ER8rmAVgaybSqC/X24sBVu4F
	q6F8Hn5Xc9Ph4NxmFtc5qt+0Feyt4cj17JmKvZNRLZWev0nAegg/JarOHKVNkaxHFFBZseBsmF8
	yKZMvDKbJqS+aFWtW0oHdrAAG+XK03JFXPic2guSExzEA9VsBBQxE0H0KYpmujhgrRiRdIrKk8w
	5OphJemCuCW1LxqxLCBVffNzzmOcUg3yoc80gPQaRGxL+Wn0yVPTFwSJZIPWGVF3hcst90kLgHT
	hYXakKPHlc0+WluBery8z5SvTeou9vFSltmYbCDHz2OgUPS2penZYCqHDf2XDA8qWlygja+qNAp
	r1Mr0g+sDcog1TGynIi1i9PQ3
X-Received: by 2002:a05:620a:459f:b0:7ca:f349:4265 with SMTP id af79cd13be357-7cd4670aa2emr3603284485a.4.1747934019682;
        Thu, 22 May 2025 10:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEklVQY9u5/QXy+s0ZxxnC+/l35LeV+kN4AiqcZMXzwWqYzYu8THOLt2rT/5nIBCGXCbPjLLg==
X-Received: by 2002:a05:620a:459f:b0:7ca:f349:4265 with SMTP id af79cd13be357-7cd4670aa2emr3603279985a.4.1747934019253;
        Thu, 22 May 2025 10:13:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f165c7sm3501438e87.32.2025.05.22.10.13.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:13:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 03/11] mesa: drop -Dgallium-opencl flag
Date: Thu, 22 May 2025 20:13:26 +0300
Message-Id: <20250522171334.3040820-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f5b45 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=ljLuNc_75jdkrf6jWyIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: mytPrOG8uBpj0Bf7qmTEM28FfyqWHGYr
X-Proofpoint-GUID: mytPrOG8uBpj0Bf7qmTEM28FfyqWHGYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE3NCBTYWx0ZWRfXytLtpJ0K0c7x
 PAmxmxwB9FKZ71eP43sK5az0kM7ueUNwqs4ixzpfYWMUPnSxXMNg7mq6IXvdvllc4J17C0FshHr
 8f6J+DZkyc7bKpHVeTM0YLBAzCJJDnzwt3BPsL1lqv3XjufVfxce8GxaymhZPjCkflAQjPflo23
 B6TOQ79dXSxuetKn09BhrHa9cPUKQNanDU9T9OTLM5Pn8q6uDNlIDQx9LkqA+1eu/MNMw9PM+Gs
 HRzSTQ8vCXmnvSqhhwVDQghkjEPZkP4F+p/nUH7WWdxb+mkmWmt87AQNztBgsoV9khfBt5GNS1m
 CHIxqKz5ckgHWmw2hcEe5sYeJJi6H8/qL0Cvn5CnezQ7gbrVervQXcsLcwEcabiQVZBuAY/o71Q
 MW89EIbzbYBERJLsqwujEZGaVSMG1wFJRYmqshFtZey6Y5SsThPPKU53zdP7Vj2Pcw7gJCNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=911 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217135

The Clover support has been deprecated upstream and got explicitly
disabled by the 0001-dont-build-clover-frontend.patch patch. Drop it
from the build flags.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 7fc306156dad..89fa19a5668f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -145,11 +145,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
 # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
 # Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] = " \
-    -Dgallium-opencl=icd -Dgallium-rusticl=true, \
-    -Dgallium-opencl=disabled -Dgallium-rusticl=false, \
-    bindgen-cli-native \
-"
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
-- 
2.39.5


