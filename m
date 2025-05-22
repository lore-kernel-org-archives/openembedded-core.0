Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BAEC54EDA
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 17:13:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.29165.1747934026822783609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 10:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=m4vGH3J2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFTZmx020957
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KlW02JWfISQ
	M4la5wAGqEg92q2mkats/s6js+66vY24=; b=m4vGH3J25AVk7jy3Z24rQdGyirR
	YYKq06CRoiV/Y6qTwPqcfo6DvRRMsWhTQ6F0AQHp3ChHRcjxeUOmNn49nmFogCI+
	gLV4bkx7FSRgsDTFKG2narvi8Aj+CQDMl6w7ni3wKbrvdpZrU5MCAPo9A2jDWIbx
	QZn/RzaTjKoIeXp6CPGyI1XY4m0M9fYqEkIJoszouTDnWXwLbFCvEKeFPAH0h76/
	W15czA2sB6FWkUWgRLa2ULwOYZcUK+eBbKOsfLz0pkFnzDCA6bKNPXl4+2Ssgg1+
	3YSpvIamf9FyPOQZ4xTRCqGBcAuMdeQotqeFjCI+9KaYFmZG7egoh8E6AGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf07b0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54a6b0c70so740863685a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934025; x=1748538825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlW02JWfISQM4la5wAGqEg92q2mkats/s6js+66vY24=;
        b=xB6cToNIgR2oTbfMxb+cdggTURXwoL5D4NGCfoyuDran/I6y1enL1t5VjgtXKJ6G8t
         VtosXmOyAWsQPOTF8i2GtmEx6xrFQokbrB+wwrFjrW3uqZKrBZpw4m6+6FucSUhn4uhQ
         sNSp3h3QSZ5X4F7nqPcqkCAr/ngPxF1wyKgwPXZHfIIYClznNoAErji7ypsY8Cmg8giF
         trcRx2wpVx6Ie50g5Q+1AWc4uHSn3e1siuRpnUsZ+VIelCMLunDAoNGZUEijpQMVwyjU
         LJqJjV92nUyo8PwsnGlLTtWDMkhzX9apiNlpn360c95Tu/9i4mA7kQbjwd9wOIq+fMgp
         LEVQ==
X-Gm-Message-State: AOJu0YzwVMDXuyZzRuE0TJleivyDJ7IywytghzZBUyaFEgnkRT1vi9/5
	Mv5RgkLlMbjo/lZLkk6GRV/Rwj6OLis0MUkTP3V5pntsONpo08ISXXqMfxV4elm1fAHIINYlGtd
	y2trM0ruDi/DuRMeKXcDebtRvSNBnrVpSVDGy7Zed17hWdCqF416reUJpAhepDYKIPA/kW4zta8
	WQj9iqH6BvxyYpzKk=
X-Gm-Gg: ASbGncuoq8aC1Wawc1KdGzQ7/hLf1hnPal+kjg8E+RYN+8B2sKKQHaT1sEA7qxbhLuH
	WZghuw+MeOhrbxCL/cBm1kAHW8hv8pVPXhfEnz2h3bsotf4t9flV0yifiuZGYfbilirX80bKBa3
	v6Rsf6zGK30mSVaoP6Qas8HAJ+JZEtWqeM1D6XqqgyLz1CKCcYyhnF+eauhPyyQMYV9Rx0Yiv1J
	9NZAlUVMNlm3FiD53gHnaoh+2SCqDnIwUi5BKLzeN94Ll1VcvfVkko3H71fWyp8mxzMeKUIYBTz
	KOUuDMqtXLEBxhqskMEDmIRmn+xVN5mZofCDu5D0udDHmZtpzTEyK6sPu0t2NInGYwD1c4inf1Q
	Hcqh32798SIwiyoeUx/kww0J0
X-Received: by 2002:a05:620a:394e:b0:7c5:4088:e48c with SMTP id af79cd13be357-7cd46731a86mr3750375385a.29.1747934024865;
        Thu, 22 May 2025 10:13:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWX8KT2MTW7NleGSRhvTrHn38ZRmdhPRoIwZrcsOVVG85XmXPTSJ/SZb7GPfP0QyWTpJ1jjQ==
X-Received: by 2002:a05:620a:394e:b0:7c5:4088:e48c with SMTP id af79cd13be357-7cd46731a86mr3750371985a.29.1747934024485;
        Thu, 22 May 2025 10:13:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f165c7sm3501438e87.32.2025.05.22.10.13.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:13:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 07/11] mesa: drop gallium-pipe support
Date: Thu, 22 May 2025 20:13:30 +0300
Message-Id: <20250522171334.3040820-7-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sxk6TJXa8l_HE-960u7Tp0DVjFWgCjRJ
X-Proofpoint-ORIG-GUID: sxk6TJXa8l_HE-960u7Tp0DVjFWgCjRJ
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682f5b4a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=UHK4iJJ_pXMy7vzKq9IA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE3NCBTYWx0ZWRfX83ebF7qBggNo
 2gC/1NQ989Yj+tPVJ0pFYuHKwcDGHY5KKc2HPP8ZVkgF7flL7P2Yyt2klI5nr3Ikrrtt9LzvhV6
 3SdacxzhW1XL4+8eP1fCmlbS3mU/pji9GO98Mr/zCyqZBvBifCewK5K98ANxQWiek1cTuJFWTSl
 KkdaHU3TBkeUP/HpT3ZA5+BITW4zAGVSXsofyB1bfjF9NwF6GMPiou9vcueeapro13X3LXhmBSB
 /VDXArD2xocQGDWq2gOUTGwEItnX2CXdyyBV8bFqk1/NfHQ27olwn5pp/xHngAeuIzn5AePMIXn
 tdnpu/jPImCH8J5jGmXB4KN316/KWjNdWJSmXixcoZfJfOWynjjyzEGe+tSxzXh9eJhHtBJNmM7
 sUdK7FnSQ+/Y9X8accqWJAkEjRSpfw2jTEwr7EW0bNh06QS9QP3020Tk6jBtWLnQPr9O2+5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217137

With Clover being gone, there are no more separate gallium-pipe
libraries. Drop corresponding parts of the recipe.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3d2914a66fbe..78747c8e6cf5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -317,9 +317,6 @@ python mesa_populate_packages() {
                 d.appendVar("RPROVIDES:%s" % lib_name, pkg_name)
                 d.appendVar("RCONFLICTS:%s" % lib_name, pkg_name)
                 d.appendVar("RREPLACES:%s" % lib_name, pkg_name)
-
-    pipe_drivers_root = os.path.join(d.getVar('libdir'), "gallium-pipe")
-    do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
 }
 
 PACKAGESPLITFUNCS =+ "mesa_populate_packages"
@@ -337,7 +334,7 @@ FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
-FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/*.icd"
+FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
 
-- 
2.39.5


