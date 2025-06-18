Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2179DC7115D
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:05:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.8212.1750255530428093231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=krDOpYaG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IBuScp024372
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bmleG52VCq3hTBm8s8IhmNjA30ZuoyW18cB
	pHEMUK8c=; b=krDOpYaGRyL1pINrGNs/bT568ZcPo4OSMzcAypTC1gvDW6BX5FP
	SamwdpBSZs8s2hNfLLKCoan5/YSV7U9Re6bYdaIOl8eRTtpXvdmIpCOCgL3w5a0R
	Q/3skYEmCTNCOwM0N8Xn+6fNeejVMkSraA2fI0NYiYaiyU1SUnvxvYgyF1g8jnPV
	KAiThXS3K/4zAcgSA3r66AxnAS659Qech8Uk8T5xLNOfWW7W+ZpR/PeZwCvvrVNS
	ev8tBDSF2AG74kKKxbo/B01iEj9ZrCHXdeXN1K4eAB8ddm7agbEv6DkDknqPURNx
	EbwR9TZoDE/7xEBg2zAZ+gdawWymiyCAGfA==
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw138c6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:29 +0000 (GMT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-8754cf2d6e2so684579339f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255528; x=1750860328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmleG52VCq3hTBm8s8IhmNjA30ZuoyW18cBpHEMUK8c=;
        b=nRB5SK/k21M0B1FHrnP9lt701yPWxGYuusGFR7t30c8YWaTY5OQcJoVBQ8cRQxowEj
         huRimeJSPjdRR7jgAyRNleUe7zoG//2DEUgkvrDa3D4c1+IP++ILYDY4ZtQ+BxMYpDGF
         /9+dO1haTGY4e6uK7iTqrdmfpCaTF4Vm1QsEbqAZyknJBJtgRlyYGT93ZFsnfD4HTKXI
         4BVhX3hhtIkiR9ZEh2AfSriYgN5IATQDm252KgX09w9zS6Ot6s9QU8IQ4e1VPlDRNPhx
         TaMZaLzMMqeiANs1dkP3xC4Tco4azvBGTqbCF0MJaWr5EZGLEHBAdoUsYq+JDsvTSgG1
         nIvA==
X-Gm-Message-State: AOJu0YwsA1Yu4GeKXWfsMNVO6O3U3K9Vmr8BLkkLtqwDEKadib526qtd
	RFj8HQf5E/WPX6+E9OzlGWb1iv7n3YRcV/gGa2XO3N+3TmnjEXMJ1AoIYmxUITy3hoK57kHr0fD
	jr7AoBweiphby9BS9JCkKim60fM8hGX3jg9K9dYbDz3oB/j2QIVrF+EwJr9HRSya19oYpmkxab8
	KMXHupORzThfDeZQ5Gu6as
X-Gm-Gg: ASbGncuEj3MXWed+bt/7mZOdWMVvLPnR3llxio61FmJ4iEwRCNoAAi6WC062RMAivHv
	EwVa9nmk7w3G2UdXGKygCuP57Hl3myV+fI4a3x/4TYYInghTad2iHnT8sSESkerzwjA6BpQ1MhC
	T8honmZt8eU3nGS4o+TkNoZzlGGxlmG7TPCLV0Kfy3wVt/ARxmkEmrtlMrrOelp6a4L5A67b9gH
	nDzn2na3Zb/UdaGEi85kZeCWTKoSDfgh8EJHHphWT1z1kDvzMKAzSWJjSEtnESZew0cB+rcy5uz
	hgEMu6Ykdsi04fnl1DeFtQilAALJAGv32ov4+qS9dVX9G3ZPNRum9sB9YAtea+2TZtNV25Xhmj2
	kOiJ+z2Ob7RUStY8DTUjaHmQXuK3e6VtiFe0=
X-Received: by 2002:a05:6e02:2583:b0:3dd:d18c:126f with SMTP id e9e14a558f8ab-3de07d50c73mr180306095ab.10.1750255528153;
        Wed, 18 Jun 2025 07:05:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdeQVuag2yPh1JSAmb1uTg/GZbxtDyaNyYcG1nFAUOBIpadHXFgX5v7bOj+Xx/ddzcGiUaEA==
X-Received: by 2002:a05:6e02:2583:b0:3dd:d18c:126f with SMTP id e9e14a558f8ab-3de07d50c73mr180305465ab.10.1750255527496;
        Wed, 18 Jun 2025 07:05:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3b769f9esm20164281fa.30.2025.06.18.07.05.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:05:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 1/8] mesa: fix RPROVIDEd package names
Date: Wed, 18 Jun 2025 17:05:19 +0300
Message-Id: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=6852c7a9 cx=c_pps
 a=x6q9Wowz3da5qcMoR2tSzg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=9Lscu--00yPY4GOp4jwA:9 a=TsFzuV67ciA61D7d30EA:22
X-Proofpoint-ORIG-GUID: aaHqNw6dblM9rOXFcK1rncp9k9N3x2RQ
X-Proofpoint-GUID: aaHqNw6dblM9rOXFcK1rncp9k9N3x2RQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExNyBTYWx0ZWRfX8AvcnqoQ99p1
 QqXJqe0f3nrq1iUvkBWIVIF4F0bFQPlmBVb0ahX2+emFce671ZEDgMrx+xNAToebM3+zCdYJcNJ
 BvZYjufadyJrc8YOqAaEzJ6iukeCU1EeIH6T7/t0kpkvhV96ZGeRQ1Uqd9kanKwtVDSKhCNBTLD
 ilhEjQS13L5qrCFaoo6Nypm72H9xnFXMpP/hpP9vJ/dctFOVWAjzBcGGBwD+hPd2k88rJyivLZK
 5szYIR1ltA698JGuEyfkEEY4FSH0oUXBQ4yUUcq1QpShZj4qfhLlBPxgx9IBBiTvDDpYQrJDl38
 KEnquYcqnytXSJu4aeqOSQgRjPxy2SQEoAVIHsKlrluepMESRGtrS2/E83PNzBasBmLdOXFiq6b
 rjbz/TCxvDOv/pacarz2rU4onuG/zCCV8S6YWPUtQ5v0EcfjwY3k8URWYsSUWha5oSHyUWu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=989 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219014

The BCP for virtual runtime package names is virtual-foo. Make mesa
follow the established convention and change the names of the provied
packages to virtual-foo-icd.

Fixes: 9d3b4c9bc403 ("mesa: sort out PROVIDES for the glvnd case")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 56ac18ea534b..a583edc57f6f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -287,7 +287,7 @@ python __anonymous() {
     if 'glvnd' in pkgconfig:
         for p in ("libegl", "libglx"):
             fullp = mlprefix + p + "-mesa" + suffix
-            d.appendVar("RPROVIDES:" + fullp, '%s-icd' % p)
+            d.appendVar("RPROVIDES:" + fullp, ' virtual-%s-icd' % p)
     else:
         for p in (("egl", "libegl", "libegl1"),
                   ("opengl", "libgl", "libgl1"),
-- 
2.39.5


