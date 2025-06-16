Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED162C71155
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 16:10:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.1080.1750090241181860740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 09:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QcuVseth;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8kF4g024998
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6c6esXuKmtStxB8NaeXaIRLze9Y6J51hxzY
	skFCM8u0=; b=QcuVsethuLKJy0LKyu2/EatT3Bwt5XGKwvOV4kC8mCxOR+/hpKk
	7Ifk+RiaN642+BaGnMfhuEIbhY6b2CTKBnFK7S4kSNgLXxN1rd/0GiMqiiDS1hZV
	aMMlsb9XH5Qbuuekhjod8fHBUxjyd8IkayXSOnBrSXw4sfEldIfpd9Uy3eHGPmCb
	LjCdCesWRa2sCr66etP9qp1JWbpa7GgiI7EzFv0rSrHWVwObo5lkRiZzueyHFbHZ
	PEjCm+xdFVbdWsnsZqyA1FDxLPc/4tT0klbstBQSa+kyEDsAsuRz0w7/d+hzGvnN
	m5h0keaRuncTToi2gMCQmz2GFiUj5P7WneQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsw47h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5750ca8b2so712027085a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090239; x=1750695039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6c6esXuKmtStxB8NaeXaIRLze9Y6J51hxzYskFCM8u0=;
        b=EhqXawPtA59dThTazqNjLNXL6IpJZkiQ8Ob0WRsWd+YS/roNDToonOV7oCoCyQcgS2
         ro6Tsddo27FsMF5MFfsXTN1AwSJ0yLORVVwse+ZEH9CIOMx0OTNguZeCZgOuaMq8x66r
         MdRt2DZSTDzcs6qf4IGz622be9ZlPThwK9sCgkerqKytbqy7HiN8V/ffKQqKzGbOBnmU
         8Xgj/ScFj78bsPctrek/eaCP/qcHFunkkF5YrWEE3Vy8lekshia6scbext6jpoQDq6fd
         Eith1LjQfeRkrVndV03iByBQeUZ7UTK/daB2czbGo9Q3XJHh/OaNeydHeWLzz0xCiTVu
         AvSg==
X-Gm-Message-State: AOJu0YyZifJvE6HxtC4mUZfUjNTQ7Ordor2Ju2YXq9k1C4+iCeHAeCHr
	n2t/9BTymb2NBe3Q8R1pZsw7Nmu40KWQmx0q8tUH/v9ui47lElvQJeEAFLixXp15ZQNwNv/5MF8
	HsczxVwWK9FClKu2lxfSjgoQnF7VlnuKV7v6dP/ZNunIRRXwwhhXQ7PKnjXXKgBhoaNYyLLnAGb
	MuBNMtTQ33U44XvOqC5g==
X-Gm-Gg: ASbGnct9mtJMSRXWgF9WY5o9+QmaphzqGtx+rUSHEQAumh/G8d9UaiX3DtIaRI8InYQ
	kWgIVdi4r40nWNE+Ebp6AeamJVE1+ZbIn9KRXWg1J0QAkVnQnSiQIV08WfUJgBbEPJphhHvV7Un
	ymQeNMnbgIB8fKcu/Fvkyz0OpRYKfLS889qubc46c4PRmgx3ate310E39fVqcr5Qw/e4dYUgGfv
	BbqJEVSt/I1ucvpFnYg7usvS/m1bAnZ8dsCbtjKDdpoQuc04bA5KUEyCTDFBHzALXbw/EONQr1b
	iOtPOTU+XqXHN+CKPF8m8NpvIdtBxlrphpwsTQPUx7/4F5qTsoH4Nz/+3x9DTC2NGfLlXG/S3YI
	QhpsG7wGhm8Rf9p0RkMN4LSYXHu4/mk4LnlA=
X-Received: by 2002:a05:620a:40cd:b0:7d2:266b:bbd with SMTP id af79cd13be357-7d3c6b7a4a0mr1452319385a.0.1750090238843;
        Mon, 16 Jun 2025 09:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUX2EmTwM8tpgMsphZpKp+iCJAfwCC92qaO2bNbcWgo2+sZFStEMtiPuad9HUGJ0W379Jc0g==
X-Received: by 2002:a05:620a:40cd:b0:7d2:266b:bbd with SMTP id af79cd13be357-7d3c6b7a4a0mr1452315185a.0.1750090238414;
        Mon, 16 Jun 2025 09:10:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f8151sm1590255e87.243.2025.06.16.09.10.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:10:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/8] mesa: fix RPROVIDEd package names
Date: Mon, 16 Jun 2025 19:10:30 +0300
Message-Id: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNSBTYWx0ZWRfX29cHkkQRyoSv
 w82s2t/5hKhRD+TK9fvtew4BCztMvayoPPRdOkwgVRvbXVusdMeleSlCeDC3aw+7Zfmg/qmBe4H
 iIqjQMdqO/dqIwh2Cq1wORZKDsIuyDOpU5h1X0Izyf/mFI3BBLLf2d+vWR27PoieZr1LGq4m8OB
 LlTGzMFNdaeu587Hp0grrLjF+SXaivRcne2tpe/ocB73eahUvezjH//Y+spuwlWtreMg77OLnQj
 A9V3iMKP7/i3zPZC4ZwBlQj6OgMioNDrcEpey1XqxvFZCB0xoveCUkqv0iLm3iMO7VftG52jSGd
 SO3GuzgM0vzGYr51vLgA76p+IHSR9EPHxpA5U+JMOA7icYGZyanIagXeeNg942QIAWT5/TOMynW
 MdpVaaHabbwnH/ilR8dkdVNEa8sdpCzVMtpPLpRGjrV0nwjIE95bRsbdAHvnxcvxuw572BME
X-Proofpoint-ORIG-GUID: S2mntwIco4Wmn7V1DQNvQjewLK8I_ErA
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=68504200 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=9Lscu--00yPY4GOp4jwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: S2mntwIco4Wmn7V1DQNvQjewLK8I_ErA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=990 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218835

The BCP for virtual runtime package names is virtual-foo. Make mesa
follow the established convention and change the names of the provied
packages to virtual-foo-icd.

Fixes: 9d3b4c9bc403 ("mesa: sort out PROVIDES for the glvnd case")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b222e72fdddd..b13222b66b87 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -284,7 +284,7 @@ python __anonymous() {
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


