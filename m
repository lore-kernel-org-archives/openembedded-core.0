Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34B2CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:29:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.27457.1761697768905479871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=galkRkpE;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=J0Uqgump;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlHb02609607
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 00:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vPHsEekwi1c
	raIND9m4R1IQjgXQJA+lhkF8OA/FcPAI=; b=galkRkpEVM5RA4DXVs7dRjuDgF5
	JuvmIfrcyoDabPVhsq1WE2/CxSq0PXVzX6YwbnIjeJ3n1Wg5VM8Cij10+eSHhcfM
	J3OF3xg0PEwNm56tEy3fAPNiWerFPCD0JWlwPnuQgI4E+1oOtPCphz81lJUYkLO8
	6t8gLiLPamPZ2XLldGBTAp1T9D9A73l1sYmvbe0RPgVLV7awvzdZm8dY9RyDL0sG
	YX2MQeTIJz/qzPYqY+6Zq5U/rEznSBbBT2CXFHHTt0MFbrXVfmwfuscJ+6uxDrGC
	zEDvUMC8qckG9fQvuLWTqPijMTL6OGxmrhK+2LzvwsvIJxOunAHbCOept/A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a00nuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 00:29:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ecf72a45f5so101881411cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 17:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761697767; x=1762302567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPHsEekwi1craIND9m4R1IQjgXQJA+lhkF8OA/FcPAI=;
        b=J0Uqgump65nIEGgOuSxUy4L+rf7sOZwey8txXjquFFB3bLMyzXgOOs5wtNwV2BJv+k
         1g5b9MMMJ+GlImnFkHYyoH58dWIu/TIYKCsrdsJ7LoBVHvZ2EmzsoagwOhR4/wm8VUO+
         llcPSaD2ezE2c3HVSpoXExjfmNsAHIOYICljeiTUEofZuohzeQfbIvU6J9Vc74dEPIRY
         a5+jrJkaZlF3I3ldpYszCYCc8SNM/DnLm64HTTHfZIVwXiVNWp/tsEE1l6SXFkrftDLL
         37ND/Ovjg9arkYF4McCnuYcdXk5gUrUVWk6IpM40vxqfj1ohEdbc7xCfj+mnBfeNIb55
         1VeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761697767; x=1762302567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPHsEekwi1craIND9m4R1IQjgXQJA+lhkF8OA/FcPAI=;
        b=UdjOa2XdXJlLtNGHnpy627KFsUABGQ3x77uP0v5kFGeMbj9vMVwWy/sOSO6jqBqce7
         xsS4LxFI5EPAZPE9lgbvv0yidLHrMC9Fj2a++ausTkGAkn6LXjDU8+bApd2lEz4l92xb
         VJsT2Q+l2avfayivY1n6HvttOV9ym0nhFoxH1fhTNzl8HIEMjFQ4hTozXJIfajkoFcvf
         4zjAxzNb/vzdOFNv2+UfYZ+iiusvwtYdjc2hg/1GB1ts12YkICG6wzsNmSPmFob1PM2Z
         4hblX8PXUWLpKjc+qlWeSJ+DZ9yt1Z+nn7tujgYqzvqHJYtaTDdQEb7rAo2sCbm4wCQe
         n4Sw==
X-Gm-Message-State: AOJu0Yy/rS4tvqMtY4s86S349jweNEhhtmLS0vd5iq7621kHXIn9Y4HJ
	vezXvpgh5DTdP32jz2aF6HTRpgZZHrO3ZcOZdo//6bMGGe4Av74MsO5o2qdNtjmyRJdy8ImtwI8
	U3Z9hQy3CVxOga1S53n3rUifzvNdg+ktQCNmx4jDkPNyfdspOc6p8yG6YNVb39RfkLJwVjz8ght
	R0jHgh2Pg9l7UUDY8=
X-Gm-Gg: ASbGncsz0I/lWyTu+5Fm6tt/niivChWuNmC0NvcmSa5JFP7mc4TZYco8iPKI6bl8aBZ
	uOlXlpK50gaRvsTLVDYEnoqz4p7fzwfZz4oEHLSUfs8Yy05HJrCGn5b34uJPWNtqA3vLa975aRQ
	eZDgBUHdW4N4ZyFqxRVmaRVUesC83Lp+IghVacSpwPy+3L+ztESoxQ0PbHX0B6yx7ieq7k7+kOe
	EdrWjGj65PGPEzoDE4ch6IqA+ZToz+ZlfgIk42+kDNUcEvYnOHNbLgEfX/WEgRI88o8D5vnyAu4
	rhyIUbewg6lJ9HvP2pLX8j0YwXaHj7lvhCi/67sJyfYsXdc6tpc74lnySvAqBAUv39qz8wA3IYA
	Vg7/HIZZXQ/7LBR4gYuC53QLzYArsUG5kZ6YRUXza5Tn7BuQIwIS/uxK9xhxaR1p46NW28NABGl
	8U9/XqlapYf3FP
X-Received: by 2002:a05:622a:228d:b0:4e8:a73c:87d8 with SMTP id d75a77b69052e-4ed15c6402emr17160151cf.71.1761697766714;
        Tue, 28 Oct 2025 17:29:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvvplN8tYjWtrwiM1fJBbQSmd4K+8FgC73WxHtcVUG8flaQGmLZ2qO6jA6nTXamQSE2NYweQ==
X-Received: by 2002:a05:622a:228d:b0:4e8:a73c:87d8 with SMTP id d75a77b69052e-4ed15c6402emr17159871cf.71.1761697766091;
        Tue, 28 Oct 2025 17:29:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09204esm32212511fa.8.2025.10.28.17.29.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:29:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] libconfig: upgrade 1.7.3 -> 1.8.1
Date: Wed, 29 Oct 2025 02:29:17 +0200
Message-ID: <20251029002918.3728797-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251029002918.3728797-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251029002918.3728797-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAwMSBTYWx0ZWRfXwreSfpsuH9qx
 cc5XBoOaxMKfc5cqPwpZKmNUlvYoCSMs2WDR5xPj7V0K7ACUekekQ4nswN0VZdPm37MgWf0Rtgn
 IZIN0xAhcZgN88aUnNsTOz+H4hSGJ/i0dG8ObA1a2SRGN711GSktELNOj0LpmdtAJOFCX6baueh
 +8SWwBOqhYNG7YW6Tk86Q34l/ZOwKDf13pr3sP+tANovnLWm4qxILWsD6KWHqSSzBFmxYrQrvvj
 Yd5aqia25MjQBwvu1sXYqVaiINjfNc81QfmpdoA+DFve1OsjGRu/vshtHpczQibKUwL+Y0UMs0I
 L2HP9MUFQIxgMm6SfqgKPnoufSq7q7VKiE/mec0NZDXVGp82gbjxCL33o3ypbVVyzVVBcjEkdNp
 pWgV3PJJYMjCY3nc4dkU3wd5KmY96g==
X-Proofpoint-GUID: 4KQmVnD1I2u0r-rH8-8fkQlrrEOvKtPm
X-Proofpoint-ORIG-GUID: 4KQmVnD1I2u0r-rH8-8fkQlrrEOvKtPm
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69015fe8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=DhSyHLvEJQhI92jpAMYA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_09,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 00:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225419

Upgrade libconfig to the latest release.

License-Update: update LGPL-2.1 text
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../libconfig/{libconfig_1.7.3.bb => libconfig_1.8.1.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/libconfig/{libconfig_1.7.3.bb => libconfig_1.8.1.bb} (77%)

diff --git a/meta/recipes-extended/libconfig/libconfig_1.7.3.bb b/meta/recipes-extended/libconfig/libconfig_1.8.1.bb
similarity index 77%
rename from meta/recipes-extended/libconfig/libconfig_1.7.3.bb
rename to meta/recipes-extended/libconfig/libconfig_1.8.1.bb
index bd7d7e64b889..924e8fd4575c 100644
--- a/meta/recipes-extended/libconfig/libconfig_1.7.3.bb
+++ b/meta/recipes-extended/libconfig/libconfig_1.8.1.bb
@@ -5,12 +5,11 @@ BUGTRACKER = "https://github.com/hyperrealm/libconfig/issues"
 SECTION = "libs"
 
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=17c8e32f0f72580cc2906b409d46b5ac"
 
 SRC_URI = "git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master;tag=v${PV} \
-    file://0001-Fix-declarations-to-allow-build-with-gcc-15.patch \
 "
-SRCREV = "525922a6b49ca19235cdf307376e7c9c539d1b93"
+SRCREV = "47ec93c588f534d20f6ee8704d2a2cec339db7b7"
 
 # needed when we modify grammar.y with above patch
 DEPENDS += "bison-native"
-- 
2.47.3


