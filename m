Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F22C3601C
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 15:18:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.11407.1743607115440054732
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 08:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Sp2ANd7e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532AT8kC023203
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 15:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AS+w1P7zyHFnfLucYjiktS7bjXogJ0ROIA2ty176TmE=; b=Sp2ANd7efU5QQtyX
	L9HfFczkw87BlBwUVAL740FUPa40SNp5AAWwuywBGi0ptvN8x7Ac00ATwMqVIbTw
	nPW3wkeEqdPEyHPAww+1H1Y4hfkoVTor2n0wuTUNoRp1stFuEgoQxbOkVzM9gTKQ
	Mim/0lfpKiQe+L6LhHlfwgBD6L/IkKhChHW+a1VV0+5qjMuQxEU2JvKVB6KXgnl9
	DXkGtfV3ytRyVCT0R8WZ0DbnuGadalAwiRL7BR84APvVpyxVG4/dj8cLxMbRyD7F
	jlMUONRptivKzWTyCehcA9Y7vtzdvLSbM5CN4PKE2jXZnMK8anXelzRmldm7obyT
	eIEAxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ruadt6gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c57f80d258so1023809685a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 08:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607112; x=1744211912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS+w1P7zyHFnfLucYjiktS7bjXogJ0ROIA2ty176TmE=;
        b=htQ5/kC4seGwQhr2MZAR3Ih1ITPHR4tcrMRfkY+9/alDdnQFHYMi7FKqy9q5HDmoXn
         Mc+yqoYUQp8xwJNhW1zylJF1aFUlNx1rzzp9NVJjoOo+qpuOeY4E8rzrVlTpHWT1KErF
         XeQIGpi5LtKlAsq42pR02FJyVUDIVeMkEnym9FPgcevY8oNwYWsXSmyvv2bmWQbswWVa
         9XWaxeplXKXAXR5V02AQsg7ein/9yDEsW2LN3kIfFi0YZXKpui+13jL3WRx/uvfOoY4f
         Mu4DiB3M5BmYZqbIIB5szpriI0rBg8C/mU9KkKvfLfmxb+OkcYO0TCcarKhfcGRPCvVE
         EItA==
X-Gm-Message-State: AOJu0YyEb2RAokq5pz1YtFgQXJW7KGeHuNXOzKeCu3r5EtfAMrOgcZgM
	H7iqe/liH5vCCyn1RwYb/35doXqfUSChKU4v+aSWg7REJS48bYqFnjHyNbFCxnpERMVrBRfYrXa
	f6ajBMS0Kj9V7wpsNz92hR4OoG6Ie6gackTbtF9xvBD4AGSxL+Z9GnOm1PStQk4lU9ZQAd0bhxA
	VF4eZ862IC9qk=
X-Gm-Gg: ASbGncsOOL0+xJamX7+Tk8IpyUllgJL6aId57jqEEEJTo8+2eb2JHw+km3FyqMX+Ktg
	ngTuOkHtW6nhFZ8Ey7S8mly6mX13lFBUVTzElHD+yexfd2O8lLQlhOMm57W0znr/e4hN2I0hQ4K
	TbyJF5SIuOxIxyQ2rvxt9obow9qlFcB1rncXw4yRbJeKQU4LPEMa1mrIKY26H0zpDWIsEKC0ZEm
	oOONlLUxU5LoUeahtHvGoBhv4zLXQ7Yn653GPKY6itQhu0bcLMSSinj7g5hsjPObBBulpxjI3q7
	5/CuPJdnGgIyfV18zme8g3RZg7joWM+WfUSPtvU7sJA1kwIRiJ7FOk9wpuJrgQ5qGw4THFjiS69
	FPDi5MrO5tW2yX6DFgm/YyTYPRlcs
X-Received: by 2002:a05:620a:903:b0:7c7:6c20:1ae0 with SMTP id af79cd13be357-7c76c201b11mr65485685a.35.1743607112175;
        Wed, 02 Apr 2025 08:18:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMNLX3dmkfsdQ9h0lPmH4NeJQbfUuAxJXwyK3WXojLSjyj6SxEeOpcJYJrNoYgcmxlyWUMVA==
X-Received: by 2002:a05:620a:903:b0:7c7:6c20:1ae0 with SMTP id af79cd13be357-7c76c201b11mr65483185a.35.1743607111826;
        Wed, 02 Apr 2025 08:18:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd35925d7sm19946371fa.91.2025.04.02.08.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:18:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 18:18:25 +0300
Subject: [PATCH v5 03/11] llvm: use OECMAKE_SOURCEPATH to specify cmake dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-mesa-25-v5-3-ab35f021a83b@oss.qualcomm.com>
References: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
In-Reply-To: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Up3cMTdzpBSB2lLY9eOM+XuWIZCZmELrydx0Z1G8gjc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn7VVAf2iTn9dmEhrR6/HxVDdb0fJInIcNjf+F/
 f6ICxFT5sWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+1VQAAKCRCLPIo+Aiko
 1dBpB/9QFeseliypw8sPQa+HwmBB4Lz+pw5udX+10hpZa60QMVWkp58U6URez83lN26C2qvH6+X
 YdQAGWanMq9Ej9yUGJHuqU3sGVEKuwGDVLQOUzgEur1QWh66ihzltuqtQ9XDM1bsT6babbqu9qS
 qU9vAX3/+kvAdZ5at49DkCsE7a5AIQq9qz6qvz9pSp+20DqC/HkKXJ2QXeOZ2IlmhMhyfPi2Mum
 0Ud2uS1p68higb9ANb3zc6Y7CNmroKmPmpcXl2JhdGkaalmhq6ovwSUPV92TKvzwbS63Yz0Wkpc
 Pg8p1jR+gxwXyFPCxJ0yp/dWl3SsbXLUPItg+7KvIK7G3+WU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VI/dn8PX c=1 sm=1 tr=0 ts=67ed554b cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=D0RIUQgIwEgepnv7z8kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Tlq6t0sTlHXyadkQAO6jX_1Zf69dUuH9
X-Proofpoint-GUID: Tlq6t0sTlHXyadkQAO6jX_1Zf69dUuH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=805 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214271

Instead of pushing an `llvm` sourcedir into S, specify it through the
OECMAKE_SOURCEPATH so that all the patches are applied to the topdir and
debug paths also use top path to map.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 296a164cdd7ffb45f056c879cc5fc4fbc459caba..7470d2b4d8a55868fe5d2e88f5843a2ec3faf7c0 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -24,15 +24,17 @@ MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
 LLVM_RELEASE = "${PV}"
 
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
-           file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           file://0007-llvm-allow-env-override-of-exe-path.patch \
+           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
            file://llvm-config \
            "
 SRC_URI[sha256sum] = "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e44293d7ee9a7f62aad9a"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/llvm-project-${PV}.src/llvm"
+S = "${WORKDIR}/llvm-project-${PV}.src"
+
+OECMAKE_SOURCEPATH = "${S}/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 

-- 
2.39.5


