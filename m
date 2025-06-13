Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B85C71151
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 12:04:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.8733.1749816249610075298
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 05:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KJLDjwrm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D8IwTf026067
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 12:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SF/2SxdgCVJ
	hFVdyXueN66J/zGhkwBQ48ktSk4pZ5jo=; b=KJLDjwrmLuLV+NOTHFYRy9dYrhn
	hrUhZ9Azb61uIJ0B8qqaXzgXFZSU7k/IXux97LQVvypdRHH23jY/B0x7rpWex+zN
	L8RDVedGpFjjnnWxvaMnYcJo8ApV+inxl0/5QLsp5nZXjtH5koIFOD9HC4P+v7BV
	r3BmC2XOE6vXzXd/MAk3NkBeUn83/CPMIHPDycE1R5C2lt3EBnutHzyM/j/fB3bP
	mGxsPfoHD3oDXFKyXJcd+m+XzWC8ANQ/5gF4GsRUdJGnbApT8+FB3leiQgftkndi
	Re3TAS/qml66on1Gm1dsBrWcjntd5OGJg+GKymKFEGVspatYfVdjJ/iVSLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2ye8rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 12:04:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d097fd7b32so489005185a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749816248; x=1750421048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SF/2SxdgCVJhFVdyXueN66J/zGhkwBQ48ktSk4pZ5jo=;
        b=hJZGyEzNRsT9SNwgy3vTX5NF2zO4cVM5MwyljkwGvqfsocWGRaP1G4QC+OfTDNB/E7
         8K/GPWOQWTPc52VG+qFzPZIG7wucnk8WDQ3MA6n0pweed1ivp6ZsZOkOCvl7nY4mgJLd
         4nwKBkzi277wsyzOJ/2Yx3K7l4iWJCZdPg9dK1NZE2FBBRkiuC6B7CAvFf8Axr5r240w
         DywuZg5AIDuL//fJENQO7ol0DrzuAb+HTwohD0w0JSgmU1xRkgEWG6iVA+fmDnCgz8o0
         Lo9cPhI278uzHPfWW2toNltfourdn+U8/MsDWDBDYKr9UMBe8RBonlCwoA5pKyaJKAWc
         iBJw==
X-Gm-Message-State: AOJu0YyZycNhL3R8s5KmeWoe2IESB6bwnsKcAYfJ/WyNCwI/NCKi7U53
	vPmufajF+6pEjpEqxuVDVpSWGLJtnzlHcUFYSagrdbz/Rf8M/99EB+9iLryUjWqAmbPZC5Hl3gR
	LL6b0ippucfED/wpWgmMxcxkQ5JgwretsxbqT9oOwQxGNMF0E0NLeDcRP8klBADyAQhI1ViYm7A
	7m7Pg0jTWCWmf8E5L8zg==
X-Gm-Gg: ASbGncvVMvmmGpefQE5RgqxPXw0MAbF3mXCJ0BObQELnSVyFBrN2NR3jrej8XHsnOLY
	nQgydwxGqKE1iip/tlW3Za/OjoNSHlPCHYtSIJpkIRlSRMa2jbrwJTKYiO6Uz1NL/ZHSUADQx/N
	flAK2KNskgEOyxUd7BqkGKW5yFAw0928V38gsktzBhwXQLvixDrktMPlIZ0A3IoYRKXEBA05WGW
	Cn+b/DT57M91uxi13FEtinLwODc8BGx9Now3ev17+2Zoih6Kp+MAHb8fuBNbZq0VBv1LkYFMlV5
	0lf3IvtuxiC270wUCWcJ09eJQ4+x7olG+dKKoEBPtxaAtjd6Husz9DLIQP/9fueG3jSEM54ORBc
	IOockKFG0sf0st7U0EMOpXJVVxLtbtPvayJk=
X-Received: by 2002:a05:620a:6008:b0:7d2:28c7:7795 with SMTP id af79cd13be357-7d3bc447521mr488793785a.35.1749816247616;
        Fri, 13 Jun 2025 05:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6lbUSzZlIHLDE7brAobwvoxbIiCmz5PofOxJ2lNhIpGYhzW7dCbPKEyMudj+7d00eYvS6Sw==
X-Received: by 2002:a05:620a:6008:b0:7d2:28c7:7795 with SMTP id af79cd13be357-7d3bc447521mr488734085a.35.1749816242166;
        Fri, 13 Jun 2025 05:04:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm422913e87.31.2025.06.13.05.04.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 05:04:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] default-providers: fix GLVND providers to be selected at runtime
Date: Fri, 13 Jun 2025 15:03:57 +0300
Message-Id: <20250613120358.2011626-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250613120358.2011626-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250613120358.2011626-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA4NyBTYWx0ZWRfX78y8CbAXYRYG
 nIsphaYot1SCv9XZPr35fIKTAAEFRCHofxJSs4iBMGyBxvFoEzCfkH8zEJ2Z0k1bfLaKBkbBmaf
 853EZlzwiha2Vgu4W61cXbWK7BIq2s2AgPZRtEqC/E+O+OX42yjP4ieqZ/y0bcFNPNazAbQuwq9
 X3i114qVjri0ZCkn/2dYFTSB4SL+NmsVLI/Lspoyb91UcrU+6HAOIRRz8AHB6wr7dg9cawleY71
 Eix83eYtZwnZc99nV7/GUi2eq4dJDDimPe+HoXRORpc3v45KBwnB5Ff0enj2JwjaYjFV0dcwORg
 Lub4x/fCr3eRT7xcmYPqM/Wz1Q+fOwRi1IDfPO9wvF3wJKqFduCR0Pk9yCrjQ0M08AJr5N3arDv
 qI1OQw6Y5XKzn528SMEMRcVkqBioJSpY7Wldw4+2P/dS95BHXJY4fjVl+VytiSOINHREftmI
X-Proofpoint-GUID: d2yFUItvdfInQCFq-hO-rSb1XatKFOYf
X-Proofpoint-ORIG-GUID: d2yFUItvdfInQCFq-hO-rSb1XatKFOYf
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=684c13b9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=FpLzd-OWU6oQ4w_CiacA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=934 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 12:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218598

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


