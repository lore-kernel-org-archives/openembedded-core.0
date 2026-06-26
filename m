Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DEFC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 20:06:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43213.1782504383872700822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 13:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ETFqRrlH;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=DU6kZz9x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8etl313698
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 20:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eNsKFdhfbl5XU54t6/mep+hGDtAQh/ucH0R
	C26Pmiq0=; b=ETFqRrlHAVwffsuYfXgkA9j2FPog0BhFBX7RcpVWsaGpzdHJjD1
	vM/mZ4iASwiluMUVPhhGYu9D7+Hpbl1M5B/QpbUSh0SK6RWBWMhnPh1/1P1CfuY5
	xfk8ySf2YXUE8OIPnTClewnS5YGz4sFJ1uwVoyWv98N7BkoR8R7Xm5wESoWuAh1s
	2/9ZtF3JaqrFjar0lOoeWmgBtvvReHaOOgeIc9m12agUZF9AM9Z37pgGr+5XarZu
	c1Vo2UjK8MmnyD1Fy4Q10hntZ6xd2dMzwTJtb2Go26Ui4GV7lKTMcrxKJcicpNND
	wx4oeZkZu/Fe9RGKP3cWiJNVH+Q7LI0iyBA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1ups91t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 20:06:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966df3665efso367562241.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 13:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782504382; x=1783109182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNsKFdhfbl5XU54t6/mep+hGDtAQh/ucH0RC26Pmiq0=;
        b=DU6kZz9xZ61I/e0F7p40IwdNQYvzOLpcKTIb5rFPGndluf1uzvy0ATDn6mvNKF7yiP
         eJrOI6cInxhUcEJa3oczb4N77PDbd/mjtocQQ/ZZa4EmuQTsb6whDyTd8d2XNXVA5bLV
         F/fja2vooukKeRER65Yi3uX1dM6jVw57HnevJMNH5M994r0qbtLNkeswj6M6G8LLvfov
         sAWpQDcxvNaD7BZkBkjSs2VfaOY2JQI24sdSk0SX7ppijC9OgWg4ahcGTTw2Mutl1gwb
         tBQjhfxPj9Kw2qY/IVFCYPHY875vnp1LbUu7eKmuzT2f3SaUCn2rP3JrmzSqdN8kigJl
         nBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782504382; x=1783109182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNsKFdhfbl5XU54t6/mep+hGDtAQh/ucH0RC26Pmiq0=;
        b=sZU9RwYK6eL7shsfbOfBG9s9rSLbI/UV/V9Si4Qj2EzVtq/11OzOW7l9Ty/z7ydNgR
         ZYF4VaHWDZinMi5EgOQ22x8FwSNhI2qJAiOvRhynLBXcH5iYzuWS88E6NUvtWk5GtsYm
         zPInf6p2yd2RIN3QmaANoK5FdQJ80mWhXNqpRYjIurKfOd+9tV/jte+aj5n5dOOEsRSO
         Qlsq/4LWE6qwyWgB3js5mGEjyJYMcA7aJyI8gqtuhJKB3UU06GKcLj/ro79UUETg6oc6
         3XfKaNdwP2M9+uyE2D2ZA+8++u6oDxjAjvp9MS9sE/M+akv/fGdXGQgQyCq8FE83lJbT
         SyAA==
X-Gm-Message-State: AOJu0Yyr1j2qMpwHWFXnQB5kEN9H0oNAfVHRHp/+1JscWZ1U0Mr0mdVz
	pbjLkbVl7e98nD9UaUztnvbmGuGPSudsLp2AspIm8VM9/6eqe0tW1UNb876CpPVzuN5mUttFnw6
	0L+jqO2W3+EIabYot4RbvDUDdZmPd92E+pINI+Pa1Q1Qasnm4iyHkkwFoCGvNRqZsdz8zLXJmey
	gIZ7drL2FCicouih8=
X-Gm-Gg: AfdE7clyFdrgiK5jX8ITAtJpTMlUbEpfyULzykTZBcDDmeXVKmYVf5H7DSh+i9wkMvM
	DpSrhNJBlhWJng8W5TodQMToiIiyDVO5aDrzn+gAfvbL0NSu6e+ztQV40aFZUI1gtks+ebnaVew
	x0ba6RQLqWoaT0UJ6Z1HOOK9LuBcjAUr9xgeQbInPrZiVJrdYbKIHPXBgrOokrVbdWmkAEyeKm6
	TFPvcN8+6wuLywgmaFHFd+5+m3fwGaizgAiYFDqOXSPPUGsXo60bm3QalPfWHdJ9Oyzy42Xw4MF
	abg0GywKT4LfkkZMfOwF+p9YY/PNiSM6YSzLtaIZx8qmUymPrJct5x3LfIJiPnt2bvXj2ugMnAX
	EHXScRTKGc0M4p6cI3dAbeSMR8fWqwne2j6993nRfUA9FEl077xJ+2PK+3F3rSLp9Wn8AGzVk31
	xBXU0iql9G1cTASTKMd/+MOU8k
X-Received: by 2002:a05:6122:5215:b0:5bd:742d:ba77 with SMTP id 71dfb90a1353d-5bd742dc11bmr2327571e0c.10.1782504381921;
        Fri, 26 Jun 2026 13:06:21 -0700 (PDT)
X-Received: by 2002:a05:6122:5215:b0:5bd:742d:ba77 with SMTP id 71dfb90a1353d-5bd742dc11bmr2327561e0c.10.1782504381051;
        Fri, 26 Jun 2026 13:06:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afcb314sm51790951fa.15.2026.06.26.13.06.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:06:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: drop opencl from DISTRO_FEATURES_FILTER_NATIVE/_NATIVESDK
Date: Fri, 26 Jun 2026 23:06:16 +0300
Message-ID: <20260626200616.89570-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE2NiBTYWx0ZWRfXwlqOY6u3NKae
 l4GNLeRTJOfzmzgHhoiSS+4kGi0sg8xCaZKgt/3snw527TV+JXKett+PKYEefJt67sQpBSvkFEv
 Uq1dGIkOme/ZX8ijTkslTiNJEhnh33n73Y92FAqVJVnerREb2pT2/Pj9UTLflYgdm7wK1D/abla
 jzmVqFJYqAYMSKLoL5BUuLBFMMTXCY2ds0NlR9imuke5/i/mIj5zaHN+sQf790kOighP75k0C8Y
 z7MHXzxAb7gc3DeEQeXYnATxlIvQhCUJb9MJT6GJ/9xfA1jpxguyn0kDRoukZtqY0oiFrRtof1U
 kzlYwmeTNxAVx165Dl06Sl0J+d5th8aHLB9DY5bvCTcAtIdCmVVbEyyLANHBam8wUdZtN3WOWws
 4yiSvT7IjqzAQHy0jtLU6L7KgDR9cwu9Tb08uD5VgYVx/JE+ATS9Um4+dKQpdUlNLx1SR3HA8H7
 cKuh1oobNs79zuwAXnw==
X-Proofpoint-GUID: jQyWGmqEzFnGdXw2-QhAW_1MJ38Gudc_
X-Proofpoint-ORIG-GUID: jQyWGmqEzFnGdXw2-QhAW_1MJ38Gudc_
X-Authority-Analysis: v=2.4 cv=R6kz39RX c=1 sm=1 tr=0 ts=6a3edbbe cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=zjgqDhZ9QSqlqWxKTBMA:9
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE2NiBTYWx0ZWRfX7uzIxnZrkBZm
 gCBAPGgonkwZmSsPf4vHcukfKrmyqfv8++9T2mcNjkIGEfUcpH34rQZuv4wOKtWxBJFJDAvM00p
 KpGVm4vz+d/l19PW26CfJphW4ZnL9PQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 20:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239659

Since the commit ac5e0160df78 ("mesa: depend on mesa-tools-native for
less expensive libclc dependency"), there is no mesa -> mesa-native
dependency anymore, thus there is no need to propagate the opencl
DISTRO_FEATURE. Drop it from DISTRO_FEATURES_FILTER_NATIVE and
_NATIVESDK.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2d834357222a..bdf37d0da247 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -919,8 +919,8 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl wayland"
 
 MACHINE_FEATURES_DEFAULTS = "rtc qemu-usermode"
 
-- 
2.47.3


