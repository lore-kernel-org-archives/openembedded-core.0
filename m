Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A1CCAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 15:25:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.19603.1757690753163854299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 08:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Z726dr0r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fNEV023361
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LHl5FfTgQlItAfJPbVFmVUSWLcax7b4wOxj
	t9dBjbBw=; b=Z726dr0rnAfvLXfiwDxMy9qnKvLkd5ChK9hliPuCA70bV4jTfTB
	3sDblOcNTzgPt5KeIJaYynuZkGpS59m6dwzA/UZ8CZ+dwojhZSwUSur464FamGIK
	OJx0QvKhA6ngaCPl6h0lzgH7VOX6hlVhGsAvpETYdUeLpkUATXVDDVEelfDZX1Z2
	hl4mtvCBYBysS4phmHMMDjfXzPMKljQpgZw/2G63Bemb4FEat62MtRhrBE+9Yokg
	YMGDe64IiDO+kpVypW2qgiAM7NLP0r46Wo+qL6JwgrQT2TnKqRdMtILVoA18cKog
	ubKPQJOHNVM+xhMdl1XFBoEqaXNL65mo4NQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2g5b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:25:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b62de0167aso52824731cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 08:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757690750; x=1758295550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LHl5FfTgQlItAfJPbVFmVUSWLcax7b4wOxjt9dBjbBw=;
        b=QWOOwj32bRz0ehAIBTYwNvjrv2skxEZv+Y2iumNPP3QznzuH1QT9tcFY8iAq/IZFQU
         C3ffI1A7yD847bjmOatoHl6DQqqnQoOW/Sq7rQMlE/rhtkSLX0FZu69OsE3gNYTnDEjc
         JnUEmNX+k+P8Z9rZyPHQXpWk8S6EhEnyIjt/7yyCeU+H3AGcryxJJQUik+yC88d71hT4
         hHuh2KG3XearLsDBMCK02PD9Z7xhxoQuQENlcZBhYVEEzw0xuYpjNxYUJXHBOc7FVSR0
         AfHCQfkoWfrH9F1/HsuG8IfG1wac+Hud+DoOx4BR3vt6eqSLtI/bG3BAMI9DR0eh9qPF
         RxUw==
X-Gm-Message-State: AOJu0Ywnltr0B/xVTKs+sPgJtRRpiA5jxBynRXrOY5hBEFc39EJ5Mjm5
	1SgJnx0OjW9Xg74vZ6swyxSiELxVV5Y1653ES3+6/86fKdAGxJ95E4t5PGbb+UItPZ/zUv+suri
	kvC/A3AeT+xBn42Qrj2E8Vt4Bz+9MTOzsRJXyxxBheuIkqROq0GXwNMlnnbZtDfXUxl1clfleTe
	yMtk/7NYYYowBmN24=
X-Gm-Gg: ASbGncsNtV9sDkBmppDnD6rP98rvq8K9BAlQ1BzDlSlmxbxQewABzblWACgGb+VrSxr
	oqqAhwDQINVyUyx9yXFx2nbaHyvGwb5InbPsH5IQbnGUWxymTx6NAluPT9OyMaiUTBv1RZm7mF4
	IBKzaNPFxcXxcky2BYs+LQWB0s4lBsJjAosPUIAAh2UBq/FUwIgNLAepdFViEapW+X3WmtOEaWe
	50H6ojMQzwj+H7XpdKG2zLcdodyAHr9P4yuL8CtMBEipwx9WDZhOPEEvnF8/D00oFlRHy4OruWb
	i+EVYIiCpKDLi8PLCO9hBlJV8I6W7kUDLffg/POxsLZv82MQ01/lKSjvtjw6og7QOynA9Yt6Xyn
	V/Rr1l5vOlKuC6GJLmWC6EQyCoYNXZR+/8StStW/zEHO/d66sUxIl
X-Received: by 2002:ac8:5c8d:0:b0:4b2:8ac4:f074 with SMTP id d75a77b69052e-4b77d10e6c2mr50468051cf.70.1757690750483;
        Fri, 12 Sep 2025 08:25:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0bR927CjgKVMhUQBaVtFaXurWTBjHpRCxJwJjYflLkjKVGcJkIhdmahMRuBqQmnrAu/7aSg==
X-Received: by 2002:ac8:5c8d:0:b0:4b2:8ac4:f074 with SMTP id d75a77b69052e-4b77d10e6c2mr50467441cf.70.1757690749857;
        Fri, 12 Sep 2025 08:25:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b62c9sm1223465e87.27.2025.09.12.08.25.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:25:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] bitbake.conf: add vulkan to DISTRO_FEATURES_FILTER_NATIVE{,SDK}
Date: Fri, 12 Sep 2025 18:25:46 +0300
Message-ID: <20250912152548.730100-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c43b80 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=IeDgzFn7HfRGmQwnkU0A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: zFpDubiagL6T1ca6AROu9b47cPGf24Aj
X-Proofpoint-GUID: zFpDubiagL6T1ca6AROu9b47cPGf24Aj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX7dDJrF/wsfA/
 pm1IW/gx/ljCrRnaxFzdLHYPaBL+uVt6yrLwJW6U/LLt5QYiDrXH0z+zXNzvdYBW7Eylh8NZGit
 ElyICvakQlFdaHg2VzFen7ew6b5fFRA2iMDD4hpzdrq83hHLf/LKIEw5sm+MwtGU/0WG3pzGIbl
 qnlfEuhvFgFP1LT4gZIUoi/hgSJqqAlJluB0YjTriftH8300wOa66EZAlo80jy3QkFt8z+8TWOE
 ZVrvIu/+iDKeFRjc4GPpnxx/zGof2mAGcJ6+DPtflzxildeluGu+cuHwUfne2KaAM3XLdzeMmif
 +4BqG5zM7nK+FVdOQka00VVZWr86+j9FtdmtBjrDy6rUWxBQ4u9W4eDM1cKpfrtSNoUl22aqImU
 JRNxjaAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223320

Follow the example of OpenGL and propagate vulkan from the target
DISTRO_FEATURES into the native build. This helps us to resolve mesa ->
mesa-native dependency if 'opengl' is not a part of DISTRO_FEATURES

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e90c7bbc85c..6ed8128b101a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -915,8 +915,8 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl wayland"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl wayland vulkan"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl wayland vulkan"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
-- 
2.47.3


