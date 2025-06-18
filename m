Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D66C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 21:21:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.7309.1750281661885559515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 14:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=b3JgXVD4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IHuPfg024672
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SF/2SxdgCVJhFVdyXueN66J/zGhkwBQ48kt
	Sk4pZ5jo=; b=b3JgXVD4ib2DvAonyWdq8pFkyN/2lY5fWSSK6Fi7mwUf/OSO7Ny
	GjVhUzNk0XzuA+jK53b7T89dzdysJhty6mpcVWPUxNIsgR4VcDvGrQ73rIWflIvy
	QAyBDekuT2kRnwzkyyynxGFQTgsXHZ0wom9DU4gqqzsQp3zSOF/gjn2CPOhyhJ4q
	ANLDJOqPXBv7im6PRBuR8MyIFeNvO20/uEo2eGPqNJqAf80/PQoEa5iBA4Ja2geg
	RV6c93j2NnLuBPh/7ITMcT0tAIoXM0cmCe9dRHtPlXtcshI3e5zlXEv60BVd0gIZ
	ktETpWc1K0LroHF6hyngc5IcgHy72aj152w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca5s0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d399065d55so16612685a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281660; x=1750886460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SF/2SxdgCVJhFVdyXueN66J/zGhkwBQ48ktSk4pZ5jo=;
        b=in7Kg3qXORmA5WkjZmHmSwzfQCayE9/gBbUpBvbC+LmBO+ZfUzgDSpFHdUWw6/dtS5
         SBpBFXYjbKefeirraPFf7/lXi4awgcRo+/JXJxIPvQJqNJRSttcuSsVEy8549vE95fFc
         axELtPZXRW7PdQ0vvt7cNziobEE/Er6JUSH6M7Q2SJG02m8xi6buYBrjkW69FxtriEKc
         3hci7W+fdMvh+0uxGzE2pzsSZrsGagPfiJhNwpp839DlkH5pQ9RAeAqFzn40arEqIT05
         iytGf7e+YMbA3fxy7JktKzVLyAN0cWyDcWHyTY4Yfnm0RWmUSgg3yKix1hoDDx9VsT/a
         umvQ==
X-Gm-Message-State: AOJu0Yw6RZWHyXWY8PTaNMSm7r+ZxdQTyidiwSP5bhLsIHhf6pCJygnm
	BwJJ+2iYObWJ5ccDdrEp3M6q51m9qVCE4M5PRe51Ba52v6PtnTPQ/6zHo9/ZUO7h3bAFqy2Pn2/
	udDjZzN74UMYBpR3Rx+pf3xSfahvfpDrFl9J5B9jSYIBu2NYzw35iSVGzV4y7lxGKaiUMbjlCF2
	cD61LIXhXq54mdWrdiP31v
X-Gm-Gg: ASbGncuUlttib4yB1AuobQxMXQBjsCJInd+z/7NiP86uM9vN7qTiIbS+fO+3JGOFdvH
	MGMcWDI2toR7zs3Pcr/nec9V47iudH6M+Owsw/OKLx53N3+GeNFpc9ZpQR+h3hqCMZSx23r2gR7
	pRWtCKmZaQMKojND2MzAJ26CTyHmMQut6sR+u5cidSM2W+P9MU2AiJjJCa7sv5fl3eaIg6WXoFf
	CP8G3cEUi2fq1sCl9ooORi34H7Q7BabXq0jMHy66FnxPTyP6gzEAuxI4l/AdRMS7NrmWouUaRZO
	Am7HNAvk1SiwXPNurBSOGJm5S5eFlShe9WfH+RhQKEGFZfoHZ1pkZ1OZMm3iAKvxIdk3MLZfh7U
	uqCYW/zwxE3mFD2/DWiLjwn0+ZUZB9B5Q5Sk=
X-Received: by 2002:a05:620a:40cb:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7d3c6c0d376mr3322800785a.8.1750281659688;
        Wed, 18 Jun 2025 14:20:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwwHJl8J0x7cNphPPo4v1jeZP9hfd+XDnXHoy9IDhiL69WnTBopieFlbJjWDndI+tx9K9WYg==
X-Received: by 2002:a05:620a:40cb:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7d3c6c0d376mr3322797885a.8.1750281659256;
        Wed, 18 Jun 2025 14:20:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c12e2sm2368806e87.153.2025.06.18.14.20.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:20:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 1/8] default-providers: fix GLVND providers to be selected at runtime
Date: Thu, 19 Jun 2025 00:20:48 +0300
Message-Id: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hKZty27QAIcDY30VVOcXrme3DrsD8Hus
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE4MyBTYWx0ZWRfX195oZXs186lU
 aZbANgXsWCEZY8DNf+Vggx/Y1A7vIXUfzpp311DB2hZIWZWLRwl5yY+LSueohgRR3oOU5Ox2rxy
 ZyscN62JfdkrkvbyNgxqHBlFcM0Liv1UKwPitpoG+8Yq5SeWd/caWVYBHTD7vdDj2WFTFFQx0xg
 H7VydplbO9AU/d0+Wr0AbQjveLWdiPSj1X9yUr8yZ9tdgxj810K5l4iQ+IsCXPzlJ9+js+JnDqr
 nnj9KNu0SEmdecmsiBP6RMF1kuelaL2SYAEs06V5l6anYLQ2Nt9kHBIwZTgqgUmj0HtUp3Z3oth
 t3O3R5jZ8Laq0QoYB93GcJKf8v42gOsSUeQrezQWTpEpMtMEjKUeBc8UeG6v8GpAFR9SToceVkC
 i2Jok3JhRBPOYW/7mqvlrlyupSlEiqG7pp3YvcTQC7GaVSRUkWGgOfOv8l5GtBDq1rIJd87a
X-Proofpoint-ORIG-GUID: hKZty27QAIcDY30VVOcXrme3DrsD8Hus
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=68532dbd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=FpLzd-OWU6oQ4w_CiacA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=919
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219037

The virtual-{libegl,libglx}-icd names are RPROVIDES, not PROVIDES,
because they are a runtime dependency of libglvnd. Make
default-providers follow that and specify PREFERRED_RPROVIDER instead of
PREFERRED_PROVIDER for those names.

Fixes: 9d3b4c9bc403 ("mesa: sort out PROVIDES for the glvnd case")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/default-providers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 4f094163546c..274ad0c4f630 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -7,9 +7,7 @@ PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libsdl2 ?= "libsdl2"
 PREFERRED_PROVIDER_virtual/libsdl2-native ?= "libsdl2-native"
 PREFERRED_PROVIDER_virtual/egl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libegl-icd ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libglx-icd ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
 PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
@@ -68,4 +66,6 @@ PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
 PREFERRED_PROVIDER_nativesdk-mesa ?= "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?= "nativesdk-libsdl2"
 
+PREFERRED_RPROVIDER_virtual-libegl-icd ?= "mesa"
+PREFERRED_RPROVIDER_virtual-libglx-icd ?= "mesa"
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?= "rxvt-unicode"
-- 
2.39.5


