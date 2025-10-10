Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9C3CCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 12:01:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.7226.1760097696944156913
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 05:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=i8D6IGhn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6Wlcc032265
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Nq4gP0WPXm5
	xDKwCZW8DcRR1IxWgQ09dpr5k5gMSaH0=; b=i8D6IGhnUiIHaFSnWXSXpitvAw6
	EpgGvBT0KDuRsKfcGqCJlGeiFEC4F6uuyYlsIfO5Qt7LKxQwulljfuzHGpBCHyEq
	CaAChUXCJtl6PwmWvEuayFbJyxT6BBLSco86Jlxi+POuH1eNLY65jeX+T2mOAJ/b
	H5k8T837cxazH/EmLWqxWNfrl3ka85/Di56PR0DsTD03VxqXoLyBbEYPWMJDkYim
	NYDjZ4oFRF1oSh96tGj+g0uJidXLicnR5Znxev40/s62Rd4rXbPKWtKSlVLIaiwe
	eavv1zxgl52ZpGZLLT4hiV7zWTE/eS+/l7+vwc8djpBCEQWnb5AKPprcd9Q==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kx7xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:01:35 +0000 (GMT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-8870219dce3so533523939f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 05:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760097694; x=1760702494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq4gP0WPXm5xDKwCZW8DcRR1IxWgQ09dpr5k5gMSaH0=;
        b=WRUkHX4uSJWEZDkfesdqZM5bnPjzaecjBqTflTEYhrGYDPEkiE3e8nEVxddjf8foua
         onDioTyOLpQszqLUT/wbX4mRRUiG8KoSHlv5DXN/IiTSMIQKMQ/2MSM2iv7PqYFUwV1O
         8Vp2T7EjoDCATThU2+yDXolIlTJ4Iv2ilolMZ4ePzC4aMFHotfzLkGBJ0QhMnNlESP0n
         MYhA/KVpwXcesbr/DCk+SGXTgdU3D8GQfhdqU3Zgm0Ov/1do/tKmTid/PVCArmeez4sc
         hbtjmUHmMhJf8s61Bk128XlD6qm1biWOWGGxp8oCL2s50SyPmXvLgEURPbIQiunCJE5R
         BfDA==
X-Gm-Message-State: AOJu0Yw6O69pjijYOcKRsitjDAvW7270If4Tc5PRvLtjeqDIzpHSU+/t
	vEySwG/UfbDXrUUwbQJ7uaJ2SPdmbFaWnfBUfAq8qnxhbwWigvDNnj82PJxnKf04Mmc/cPMGriS
	ylItWVBOalfcVP1UvBtzy6v7Bcw14iSHNbgl9tQNX3uasJvlL5BIW4k4A8rS0SEymKjKjrd6pqK
	Z4HTbtoa3eRzkS0Ew=
X-Gm-Gg: ASbGncuWeiQW7a0WIUodJTLUFZ2ixOrTy0wSLhZlI+czphnLlpwweQanzDWb50Wf8UV
	FgpE9X+qbETeWoH7upS4kmwfO62M4MBQXca7xEBHu8UpuYofigYLxWg8xduBpWrHz0pm5iQuHME
	tsj2JLP6iGiWB1Qf0i31xQFpl1MQxqlJmLSWAb6UoGO20k1ORnudF5VPnnAT3+YLYj4HHMM4Qpv
	zFz2yZRqWvFUktpiiPEUaNUXUeHqj1ClrhntBaTRGgsNSZ8Lov1jNdLqQfSkzDzJHGHWAksKdZ7
	SjwWLH8kNtcB0SAN6ToU5w+iMM8H9bG+2d+gvHLvkc4oObHRebLHElX34yQpzrIkiX/AWF11va5
	fp3n8P8rAuOLBh6SiOhb2dfKrSkESrC66P7K58iQdD71o1Hr6ToRF
X-Received: by 2002:a05:6e02:3e02:b0:42f:9db5:26c4 with SMTP id e9e14a558f8ab-42f9db52ae1mr18212495ab.13.1760097694200;
        Fri, 10 Oct 2025 05:01:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQStZAa6tv9dTISgbJQChRiUY1WmnAtcWaZdN/avuq0mOjl9ITJCFarA5l1Gq81KCYdRdr4A==
X-Received: by 2002:a05:6e02:3e02:b0:42f:9db5:26c4 with SMTP id e9e14a558f8ab-42f9db52ae1mr18211815ab.13.1760097693474;
        Fri, 10 Oct 2025 05:01:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-376350710edsm3603321fa.1.2025.10.10.05.01.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:01:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] mesa: drop asahi -> opencl dependency
Date: Fri, 10 Oct 2025 14:59:49 +0300
Message-ID: <20251010120125.2868011-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2P84cTPNFhqa
 J65x6Jc4cZw79qT6nQc9fRc5MAj69W79UAABIxJ9NWnpK1HrC7K/kYWFLa6WtgXcoL/oNZXvCfx
 3P1DKNN7v8039hCqHpnjh30h98SauRPPQJ7uKUQtxQ8sAW7TKD4yVWvOk5nNqnaTFD0Lh+nPN91
 etV0zgbIbrGhXaiLNinofx7n4eopAt/sO6T6VSCcnCWj806uzaAJSpDUK73IhLFs9+0DA49PUpz
 CK5Qk+lFl0IO/zdmu+7WhXDTX8YMAscF0HhUekT7kQbnP7MkXXCWTcqjPPWUWct+wOw8v2rhd+r
 ElCTQu7ev2Pe31IdzBdMZRYp+mr1W7uvhOt531DyBXy8gtgd5tkbeInqFOBplEU8jwPLlLgjjGa
 7WHt00DeNdZVxJWVXpVW0RlBWIJWPA==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e8f59f cx=c_pps
 a=uNfGY+tMOExK0qre0aeUgg==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=EUspDBNiAAAA:8 a=J9kIK0ruHIn45RiiZloA:9 a=61Ooq9ZcVZHF1UnRMGoz:22
X-Proofpoint-GUID: S8hZQP_57CYHf2p0iUW-zSO8TPkBsiuC
X-Proofpoint-ORIG-GUID: S8hZQP_57CYHf2p0iUW-zSO8TPkBsiuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224680

The Asahi drivers depend on the clc to be available, but not on the
RustiCL. Make it possible to build asahi drivers with opencl disabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index f299f9570284..5716243fd242 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -82,7 +82,7 @@ PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
 VULKAN_DRIVERS_AMD = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',amd', '', d)}"
-VULKAN_DRIVERS_ASAHI = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc opencl', ',asahi', '', d)}"
+VULKAN_DRIVERS_ASAHI = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc', ',asahi', '', d)}"
 VULKAN_DRIVERS_INTEL = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',intel', '', d)}"
 VULKAN_DRIVERS_SWRAST = ",swrast"
 # Crashes on x32
@@ -147,7 +147,7 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', ''
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
 
-GALLIUMDRIVERS_ASAHI = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc opencl', ',asahi', '', d)}"
+GALLIUMDRIVERS_ASAHI = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc', ',asahi', '', d)}"
 GALLIUMDRIVERS_AMD = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r300', '', d)}"
 GALLIUMDRIVERS_IRIS = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',iris', '', d)}"
 GALLIUMDRIVERS_NOUVEAU = "${@bb.utils.contains('PACKAGECONFIG', 'nouveau', ',nouveau', '', d)}"
-- 
2.47.3


