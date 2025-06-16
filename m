Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE49CC71155
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 16:08:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.1004.1750090111893261087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 09:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=olEhUJdA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G9PQFO006188
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KSF7lGwo+O1aB3ZWX18e2dA7zWGL0FBGdbM
	RtMXlTi8=; b=olEhUJdAnMYdk5EXoIc5UP2bTYoaf7PV9iiQfgjuLbrtiFWtJDF
	1PzNX/KzPkhFaiSkav2B8T+PA6MpKev2EJAduPEbQCDPVO1F2RNmAWSWSS07KQrW
	07TMiTVNMw7lWtDaq2GFd8wIIIZfU3/c543jA9R2GgxR7Ry14fLl8pEqGCYIWcDe
	AlT+dH99MCDpI19LNaAbFAT9YCxcrnvgPIL7gFhsMFaiMA/RUkCFmY4Chke/em9M
	SVS+IWIAgywrTz7b9QrPdlvTVS4at5h8EQSU3vg9WFbHSnUPGLEoFjadezVTFT0L
	7+9ZtBYBX8pMUA+5SWwWgkG8XPl1GDNBVIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsw3wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:08:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso787169185a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090106; x=1750694906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSF7lGwo+O1aB3ZWX18e2dA7zWGL0FBGdbMRtMXlTi8=;
        b=bmaE402VDagQTPXq0OZuFsg+4NWkKP96KDMoaMoxNusurcLKzEUVzinXMtxKfQE76s
         us7AfDL7LJEgCYL3HdxKmXys2vPusLACOAVkLGkarITUsJjTfxd09/WIYsTOiUzoa2M7
         wI1tBwVqyK5Js/ZLIc7MPT8H8aDUgoWoJAEy8gAQ47Rqx3yCXCUAog3fRp/idq5mbUc4
         i1GcHH82djdInDpxSonK121ZiGdDg2CGqvAueTpJqlphTdJeBjRBST9naAZxbSwoTQq/
         bWh32oQZ1KY1yuws7p4/WdHa451C9wRW95tX3dRDZMOsSAlk8sI7Bqxrl2BGWC8+XHk9
         Z4ag==
X-Gm-Message-State: AOJu0YzeJyudOUpjdmwcVMkF6RWQmuLkLBhCC55OZF9b2Rsm9Eq8P6hm
	1Q6V/b/egZtVil7S8mrrphOX8kpl3addGSIwYUWIXO49vzy1M3FDS6XuTqWzuttdSDWdQwVzHdh
	HKbDgSzEAPree+lqxHlYq5M83Bklk10tfZn9oC6lmLHRzdnXXNBsOKkCQ113jZOC1tJRbO4u8Qq
	ZVxMFZAmyXoEeKBtSbzQ==
X-Gm-Gg: ASbGncuvO6eXydnUoaGBKAdnq+JygpmBkyhLhHdIQed013wZUtSYymxa5O9g03UcJSf
	uUvrYVr+67Rpn7RekvCMKDSDSGEiybPmYCOTsS2ZDbYk9O+30BLgRHj4AIGchh2LV35j4HewHbK
	GG43Vj5IKbWh7b4CZ7jh0JVix3CGvL5l7nHNvyBb/709I5zHQi7Sq0m4p7YpaP6krTCKEjD2sPR
	+9HU6pT4n+YJz9eRvW9sXLUdRbjbmYxQan+jQ7lza+eKfAguMWf7yl65SpIveBEI6Vr1w/aWgGS
	rDRCVBVchx2uzcXrowBaNhCHUe2lB0i96498BYO7Ya++cQPetomCWcc8cV0Cw6bDEivGBbx8ILV
	GsSivIjVafaEib2aa3gnGUMLgIXkMo5jQnVA=
X-Received: by 2002:a05:620a:44d4:b0:7c5:4b18:c4c3 with SMTP id af79cd13be357-7d3c6cd9fa8mr1224704985a.30.1750090106446;
        Mon, 16 Jun 2025 09:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmTCEBE8D6NPdAmMGFel7CofneUxsHQfShMHP56SZJNwKQMTSwHxad0z8lMhzvPkre/vIe6Q==
X-Received: by 2002:a05:620a:44d4:b0:7c5:4b18:c4c3 with SMTP id af79cd13be357-7d3c6cd9fa8mr1224699185a.30.1750090105838;
        Mon, 16 Jun 2025 09:08:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c1a7esm1591241e87.154.2025.06.16.09.08.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:08:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] qemu.inc: handle GLVND-related providers
Date: Mon, 16 Jun 2025 19:08:24 +0300
Message-Id: <20250616160824.1518028-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNSBTYWx0ZWRfXy3+W4ri6wP8D
 aX4CS0c+yMVRRFHOgD6i2Hj/h7o2+TvH/rJyVYLttKAaoqH37pmJ+bsfaSf4ihDlvg3YYeeHqt2
 csvpamsIQlrDJHOq4W07uZULNXQ9U375Hi1YnB7VvJ8/MdXvHjL/9BhY7UBuqxzkZ3ore12/qDB
 bzR5Oud3q2V4j/ehEBFQSrQDhMkEVmaPkg1OFjxXiRWIhv9/LeFIj38uCOy5W3HWJ4Jm/Uh4LFM
 hFSJxucHN/EJeaJXwUp5xGokY6Uc4M2RbjjWf3scVYiQ5sBo40aJ3hboRe5ZhVzk153HWnkV6Yc
 4Ya6QgmdfIKWOoitWrQTCoRnRH7PKMecqHSJkl+Al9OMcBox2hKKpe3vyW2zaglh8KxhgWLiQq3
 tX4cStDCP10k+GlRk3293WxgBrkDjI8bZHWKM6/UwryjrudxybtHY/HfORYWO4zONUAw1z4N
X-Proofpoint-ORIG-GUID: SUK_9-6uG1MMOmfbdZ9qmHIYaklkjn3z
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=6850417b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=W9iCNbZZEcnRtfTvM1gA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: SUK_9-6uG1MMOmfbdZ9qmHIYaklkjn3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:08:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218834

If GLVND is enabled, then libglvnd is providing all OpenGL / ES
libraries. Tune qemu.inc to select a correct package in
this case.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/machine/include/qemu.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index d7392d476238..4fa18812dbc3 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,9 +1,9 @@
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/egl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
+PREFERRED_PROVIDER_virtual/egl ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgl ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles3 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
 
 XSERVER ?= "xserver-xorg \
             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
-- 
2.39.5


