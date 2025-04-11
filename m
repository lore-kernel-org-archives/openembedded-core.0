Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169FEC369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 22:09:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.38512.1744409356080449515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 15:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eij+5NKm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BC6ZTm006840
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DUwP7IekGjvx0PyOy0G5Bs
	AzyxmG2HZXdNzQ3p8VmV8=; b=eij+5NKm+VkyL9qorLJ9jHPcZZs1IuJHlI5VDk
	KOFYhGm/+T5gjhq427NwGjHVebVAcwJHXZUvSdJAUt8miNNVhjZDheYFKEdUEuiu
	5OPmU43uxEI0KaDPDbW0YtIzwl4MIOQ01O23sNQ2dwFFCVhzZdJQVTe8u3Eydne+
	SSg4h+n5+kxsr0CwMe1TOfIvmMQ3SO3+g+3gVqVC/9zkJAfScF7pF4WdKppFBxDj
	F+13RpLbmE42Jib+0OKDveL5BOYiXtb0Ll2j4RUPOZ/75yx3gQG5HJqeZmCyXSlW
	hy4sJ0oZehRk73WotGwrNjypfNwtjSfCvgfwtkzrSf0p43CQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3mqeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c9abdbd3so250283885a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 15:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744409354; x=1745014154;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUwP7IekGjvx0PyOy0G5BsAzyxmG2HZXdNzQ3p8VmV8=;
        b=ncTNhziWaPZtXJA+p2FmhYepndD+BKAaMpLdFyrxD+5O3bukeN/XkXjUAOn1BWhf41
         QOpsMh/2OUy6BW6O4VYh2Rz1gKa6UcxLaGPLQ6M/xiIPrroofgArgJ8s0KypgGg5UAVd
         LEu8uwhBbcmBgJcus6bhF6hjP27ni9uY0KTLTE0BQf02sQ57at9WMwN1HLBLBRfSfHXk
         qf+oUzPaPnZWWgVsYZNdhlUR8/gsrXNkkhHx0f9HHnNquNcBqCAAj5Mz/go7ypgED2OZ
         abYEjhzr6NMNjdZQuRmkEjByNC2zTloXy758jiERmLnGxrDa02Sg9qe1XEId8YUb+iR0
         G0xg==
X-Gm-Message-State: AOJu0Yxzu/QXhNfTQSfDeZH5GtQXXFNRLMrc/hbi3+LE3OrxohTyY1FE
	qUjF5nn+JlJFODfSwNOE75oupS8KiwOsACDUNkGQ/RIeqD7GNF7piN9Hysc/RD2NLQipAuW7rij
	VPZiGdpki3Bn6T7m3I7F4eWSl1FbpbsX6Au5c/hYJsDLS7IiYWCYC52PAWZ+sJjvQv32T+C+uLE
	zeowk=
X-Gm-Gg: ASbGncsLbPM6/EM8EMO3RIW2odtnGoCShZzV4Fm6PElafXYVP3jscMDmlf7Psane1Vv
	+w4j03fKQPowTYMSZ+YqdaqNEcz8rHB5bnotrTPOPqAwR1Hga3QJR4EB1ByD1NeHgXO4VyCmTA1
	QvJiNhjwBgTYbxIrE6T3KDx+DM7+J4MAhxfH5cHTs6Qhvw6DPQCN+Oo6ocU9Tef+vsyVUpk346X
	JhPqfJgh8jxZUzOEBh8ve0O8afd/orectSmoqYLtvg/KR+YFb2STyt0yqzep6zhp5N3pVuw6jxu
	4PvjUcSG0iPVNpgsuEYA/OZqnj54Lrn0J6mvUmXHWTWqqNYVfanXR9ST2/t2zMP7e95pVCoMQWP
	G12Ce572N/6iDf5RDuu+7HRT3
X-Received: by 2002:a05:620a:d8e:b0:7c7:a56f:5ee with SMTP id af79cd13be357-7c7af0cbaabmr543746385a.24.1744409354532;
        Fri, 11 Apr 2025 15:09:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGYKWbtSJ3UlpMju/ecO58V1bETBlcUggs98TlKjSBRdaOE2/gZD8+aAM+4WNRl2GlHahc4Q==
X-Received: by 2002:a05:620a:d8e:b0:7c7:a56f:5ee with SMTP id af79cd13be357-7c7af0cbaabmr543744385a.24.1744409354195;
        Fri, 11 Apr 2025 15:09:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510076sm518432e87.175.2025.04.11.15.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:09:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] mesa: small improvements after 25.0 merge
Date: Sat, 12 Apr 2025 01:09:09 +0300
Message-Id: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAWT+WcC/x3LSwqAMAwA0auUrA3Y1oB4FXFRbNQs/NCACMW7G
 1w+hqmgXIQVBleh8C0q52HwjYN5S8fKKNkMoQ3Udt7jzpowEC7ysCKl2C9MlHOcwZ6r8B9sGaf
 3/QDoXYEoXwAAAA==
X-Change-ID: 20250411-mesa-25-fixes-5a38fe55dd3c
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GTPKm4XNsMXXKC1OnihD63E5nUAz80YAOKIHNYdPIwQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn+ZMGoWXsFIFGiJdgC9H96NRPB5nKT5gH9wR3v
 XOhOp16+PCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/mTBgAKCRCLPIo+Aiko
 1R11CACI4Wi7fGorE2uGSBgIGxnzWnXxz6f055Yaecvs+BtAQ6mCQ4Ampm4Ed7Y6L70kA/qw9h1
 98NTr8m/Xioqi5PHqPrV1D9YriJ207BtiJR9jFXZsvjtz7J3+TsdJxU4/dyHbJyG1UPRl0kxmoA
 +MFPO9vFzkT0gsCkh021iVlR3fz827/Gu1jYbDIwm+Vf+yZHY7RpXywtqjEBkdVJiZvqdxOYcp2
 gOH3AV5D6Q7JcF6v5h+yZFjmNGDn/SclPwRwuklgduI2oslZReqtMYTMoSfa7vT6MRHyDit/0Ay
 Tb0B02dhPgv+3V30SBUqflYg1xNglC/0dO2qBKf1SSZMcRir
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f9930b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=CJ6_PtDyLJe0CVsK_isA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: NP9HuWRXec6fBGLaLUzi5x_6dLdL9cqn
X-Proofpoint-ORIG-GUID: NP9HuWRXec6fBGLaLUzi5x_6dLdL9cqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=99
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=99 mlxscore=0
 mlxlogscore=487 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214762

Several small improvements after Mesa 25.0 recipe was merged:
- Drop the kmsro as suggested by Martin
- Replace the bindgen patches with meston-based fix (Dylan Baker)
- Update the status of the merged patch
- Rework how x86-specific drivers are selected to allow fine grained
  control

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      mesa: drop kmsro PACKAGECONFIG
      meson: pass -target and -I to bindgen calls
      mesa: drop the bindgen patch
      mesa: update patch status
      mesa: don't buid Intel drivers outside of x86 world
      mesa: introduce amd PACKAGECONFIG
      mesa: hanlde svga Gallium driver through PACKAGECONFIG too

 meta/classes-recipe/meson.bbclass                  |  1 +
 ...able-SIMD-blake-optimisations-on-x32-host.patch |  2 +-
 ...vide-cross-compilation-arguments-to-LLVM-.patch | 67 ----------------------
 meta/recipes-graphics/mesa/mesa.inc                | 48 ++++++----------
 4 files changed, 19 insertions(+), 99 deletions(-)
---
base-commit: 183e043de423fd3f7833366ca524a6f7d17e6d14
change-id: 20250411-mesa-25-fixes-5a38fe55dd3c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


