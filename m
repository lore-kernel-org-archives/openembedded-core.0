Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06394C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 22:18:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.1785.1743113902405826808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 15:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=X3sSZPoK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REo2uY010192
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lrnxHIQhpnz
	Qk8LjlG6rp9IzYwU1+oVEHFQn83Bqpwk=; b=X3sSZPoKAGsX0zXRCSrutEAKYFh
	InlAeZLCkX1gIgKiRTAn6Wwd5JevdA4Qo4zjjOAtWSFNMPtj3xmiypPyPk0Nk3Ek
	JQ4SAmt+gXqhb6qheLSM9a02ac0qaJ3pZRSnM4TSxoEx2RUrGBSmKx0SwAwuoPIF
	RsB74zYAHan5+EfLiUxXTV4NgB+h/itTNK2+cunmTpEncwMNmZDSNS3+yeKn5a7n
	o/j4ZacwX6pEnEBIPVrGws+I06K3ULAb6C4Du5TYQcFH+lxloe2QA9MzJdxuTXo7
	AJNQoSu3pGi6YbXwevjtoBVRptbwmpZnDE+Jw3D7Dvh7OaoXLI/shmqVW6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcyj2am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f876bfe0so49688485a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 15:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743113900; x=1743718700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrnxHIQhpnzQk8LjlG6rp9IzYwU1+oVEHFQn83Bqpwk=;
        b=USXQNoGnkdK1f3sgsyxUNTKvGRlvgW6qSbK6WwJ9FgKMglCXjikeFWYhMplwijmeAg
         AF1UcP5QjGWx7kjAY/kXwXvwVrkBURgZ7WiwPmM/kyPXj3oT1MyCJCjZVTuGd0wWChta
         G7WGJRN4H1ZX2zjfShDoU6En8jNCRVVgBrsAndKu9CoOiVAbESTZAL6YpAY4qmn7b9u+
         6ybDqjjmAWzGA/ryxqvmoa0avIwcyjWEZx3P+MIIkZ5Dz1UX0x7pR4BTVfqRH8enAWn8
         PPfLN8yvoRcs26+w6hh+LgU7jaawWaQdSn5KFlc1DTlrH+U2JNVdfLATW3KefJYcav64
         F/8Q==
X-Gm-Message-State: AOJu0YxB96kgqIQ+wrT4TwS9DVEU2QfhF3E1pS5QcF6yAx8pgZcOOQaM
	YfybaC+YrinQnKlP8AoIlRTvnKsNHb8HeFrsQE91/ywHbgoWk/GYlKy8Ulzc2NrKE+dlPS6J28C
	oZdYKdFzCZvc9PnBc9LNFeKBsi/LH87v1GzkTI2JunW36YqoxgL56DQmvWY/DEuLHWnBDnjddBH
	5xg/+jQB1940A=
X-Gm-Gg: ASbGnctkWCSj4vYDR0gXck6Lr41n/WgE3relYfbMKA0H2RxjItPxq+wUGdVyCS/M1aD
	cr2cet1ZCl08uBNGldHlI8mB3Xq2K411/xL2ijEiDQ1gnR7tJcvB9C9trOZVnLXdLRCbFgrzwn+
	8RK78rgX9B0BOeWd9nJHzLkL8Awu1FUKcX5r+ZV1YwCs3mGLljhlWe8jPMvsfx9QHcrZgW0ZVGe
	oLehiQUaOGhoCBPmy+CPwW3t8x+UYHhjkofHYbJ+E/QDDuU/Z+44uDAQGSJDUXR/381P+C0KGVf
	jka11O9fczGJxiaJItkq75PT4clW6kUY0lNO3eGRnO5de20RGiRr7ZiFy1qCY5pK+AK3SIiRAdz
	1kcNeBpgR2GbKSn5aDbBwhP1vktCF
X-Received: by 2002:a05:620a:2410:b0:7c5:57d6:ce3c with SMTP id af79cd13be357-7c5ed9f3a06mr691508885a.22.1743113899961;
        Thu, 27 Mar 2025 15:18:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElHuEVKs7Eh1ly/S6dFNghlo4sE4+HVOE9WiNr9YcGn5MY1lMQdBWI/MBD1LzjBc8E6ItG5Q==
X-Received: by 2002:a05:620a:2410:b0:7c5:57d6:ce3c with SMTP id af79cd13be357-7c5ed9f3a06mr691505385a.22.1743113899454;
        Thu, 27 Mar 2025 15:18:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b59808sm1019081fa.107.2025.03.27.15.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 15:18:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/7] llvm: use OECMAKE_SOURCEPATH to specify cmake dir
Date: Fri, 28 Mar 2025 00:18:02 +0200
Message-Id: <20250327221807.2551544-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e5cead cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=D0RIUQgIwEgepnv7z8kA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: kSpm4LLbhgt16ooUcHNsZFqObhBlG7WM
X-Proofpoint-GUID: kSpm4LLbhgt16ooUcHNsZFqObhBlG7WM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=968
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213794

Instead of pushing an `llvm` sourcedir into S, specify it through the
OECMAKE_SOURCEPATH so that all the patches are applied to the topdir and
debug paths also use top path to map.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 296a164cdd7f..7470d2b4d8a5 100644
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


