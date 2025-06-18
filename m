Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD33C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:05:47 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.8263.1750255538087238254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=B6hTd+nK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9FP8w014148
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PSiHvpORtK5
	4MleIl50UTzsfquyGBx/8lZqOz+FElG4=; b=B6hTd+nKyipspFRVjwX6XaSS8+h
	xWVqkUrXSYonaQVFhS6G67TD5AXk9YOyB1pPCt3d6aQOFPf8WcEQbjFpY0ZxS7/5
	dHBw1ONkGGvPlvXr0TidiwTWMsvFCxo3hazglyXOA5+NuRAE/Npmu6HZoh0HtTgd
	+o+rl6kSA0MboKyoPlO6xrv53yGZHGX59Y30byAQLYdkCA66FF9IpxVlKjH8cTQv
	PB8qM/i+lkfHrrgjNXlqOfxBwIPqs1zbvtAj2+ouY2otcSU4pGHIGPeULdHgo5h8
	IuKPOs2EdTqAdLu0DruMhkd/o83uCT7EMwriBKB1A5kSTzh+pqJobg7fjsA==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47b9akutrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:37 +0000 (GMT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-87326a81ceaso78915439f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255536; x=1750860336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSiHvpORtK54MleIl50UTzsfquyGBx/8lZqOz+FElG4=;
        b=FozO+8SAgpd3YDGlB7DNVKT/jWLthJrk0PeXutIJcDaoMW0wxfG1sfqYReZJLiZJgR
         qggbOdR6+mGcYFe+3hqYn7Ty0KH8yNPG62Z+ps+TdqG+JGcxMQkhwJUwyczekuPkN7c7
         aS9Lt9cS1Xnpyb7PB5zuiaGi/4tEZOAS+83BgWPpipXPY9ORM3KXmcuexE8pLbbWhI3A
         eisXjmVUgbarjDdgBwcqW/oeEiVgpQ6ezLFKfE8InFHnVBBHyrhWXz5H+SA4LzQoNAR2
         JeYOqhy+YRn2nGjD4QmkFNIjXWQoB7PL+TQsw3HKxLKtkIGEaY5lumyEOLxq5/qsL4Gl
         Z52w==
X-Gm-Message-State: AOJu0YyZjqokdzyyF118T6CCw/pMsoasCck2Z3nRO9xAEEsfCvTB85V6
	DPXzt1xY73KXtEVXFutZFbk+YqDmAUWOf0a4XVI3TYTYp0vlpr3PTTOH+H43RZ4gbzaEUKISv1S
	aOq0HhiyBpt34irEk0yXInP9wsz147qWvtXyPf9BR+RNRrGRuXt2AndTZCTKhsQxMepwWyhs9fc
	ToCh6UKahIsHX5erEyxuS7
X-Gm-Gg: ASbGncvjmyYNk8PnbbEzb5qe3kvGUmXYR0HdFF5/Q3uPh5cVJX6/jOCo78X5AjsnVmt
	l5oAB11Eb/0bA6A1rfS19fdc9XmpnZ3HiHXONtrw5oeZNHNO/Iq4evV/yBxfnVF9nSJos6N5ENI
	hSwbSOe2BHmAF1EX7R8VudLGYumnKJJUaUPuhhPlcYOFwIzgCWAFSAa5ngxIUEUrVpaj4VcVJz4
	mWCASjulood8jt8tHcjL6e+gS5WFDJBBAQ9NsjpRuk0/ROypzaxQ0vmclO+VPxLY73JeGk8hRKo
	y1x9AMwCNWPKF0h6UpoqKj81nuz4PwHw/vOX3iqbTnsZB2RLu5oNPJGq8epKTuvdbqZCknw9vs2
	vfxgQaNjMz5uDDQk06MSd7s+vOtd83z89tqE=
X-Received: by 2002:a05:6e02:490b:b0:3dc:879b:be95 with SMTP id e9e14a558f8ab-3de2b3d8ad6mr27272365ab.5.1750255535686;
        Wed, 18 Jun 2025 07:05:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGESFR10lm7Fma3BiyHBmHPijVlUKauciB6sERHoLJbiX/KwfacmzFruWQElP6+wY3SgXk+TA==
X-Received: by 2002:a05:6e02:490b:b0:3dc:879b:be95 with SMTP id e9e14a558f8ab-3de2b3d8ad6mr27271595ab.5.1750255534782;
        Wed, 18 Jun 2025 07:05:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3b769f9esm20164281fa.30.2025.06.18.07.05.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:05:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 8/8] default-providers: handle GLVND-related providers
Date: Wed, 18 Jun 2025 17:05:26 +0300
Message-Id: <20250618140526.1431757-8-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2hH7JcRdboUY91i675Gybkv7CnqCHHCd
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=6852c7b1 cx=c_pps
 a=uNfGY+tMOExK0qre0aeUgg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=K_Wat8gt5nRy7bLjIfAA:9 a=61Ooq9ZcVZHF1UnRMGoz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExNyBTYWx0ZWRfXxptAbaY5vuLY
 xP0p4u2yXOkQkURW7r1sl9J3KkrtD0xpLhjW3YxHO86AyLOEnt/acvSYHFMfWrJe7VHRW227UD0
 FYTELntFl8+cw64oonT0lcmrhJi4g+QNDvwZ3W6Vv1S+IVd3ySHmtTtB6kSj7bYzp0Nj7VOduJ5
 p7IL5HtLQlS1YBLRmuhIjked0jtUFqcBvr4XxMsITwma2r2K68xNmk9NsIo7jpR3b6QYQNNdZUB
 ZGQvNap04RYubCsbKkCEyVvs9/kqXIKLPC5yl81wj4sN+OMbofbojiqx0a3xrkOA95DTrwZ9kxZ
 yPjSkzuSC40YCq5Mr+2gskUmytX7ks/h7MSzbqj/Ik9mLI0iG2/jBOOjPbuQTBhZGSHiezDjFJf
 2KRlUY787lFsvUhzKRhobdBKYui3XGgH7Ba0VN5mRWZ1/sqNBXAkMHnpFLlMOkhho+T7yZsk
X-Proofpoint-GUID: 2hH7JcRdboUY91i675Gybkv7CnqCHHCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219021

If GLVND is enabled, then libglvnd is providing all OpenGL / ES
libraries. Tune default-providers.inc to select a correct package in
this case.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/default-providers.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 274ad0c4f630..3f113543cd9c 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -6,13 +6,13 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libsdl2 ?= "libsdl2"
 PREFERRED_PROVIDER_virtual/libsdl2-native ?= "libsdl2-native"
-PREFERRED_PROVIDER_virtual/egl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
-PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
+PREFERRED_PROVIDER_virtual/egl ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgl ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgl-native ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd-native', 'mesa-native',d)}"
+PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'nativesdk-libglvnd', 'nativesdk-mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles3 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
 PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-utils"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-utils-native"
-- 
2.39.5


