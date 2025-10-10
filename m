Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9E1CCD18C
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 12:01:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.7231.1760097702734454014
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 05:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ElFIE2hi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6WhgD018535
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TYdQehtvwKc
	SOfcD5pRT7u0quUscXRAYuyKVrpa2gYg=; b=ElFIE2hiGmAlRMCgo+y/M/7vHOi
	5jO58p/TMztiaJTDdBdyxPOg/eUzKrDIQbdDy/pj5OpoIttaPihShVBdJUKUn1Ec
	oT+4bRvsX1CrewAlQfDyVN8j7pxc8Ell+Njrtu/q00JIcTx/t6e4b5wyzs/3M3P+
	QGzIxW2JwYNf/KEfoOlgUDBrfXxSkn5k3NBNskw0ngu5JldrG89yB7Lji+cBl/jC
	XHF001qqmiYQNWX6qziyoFqFEN+/EIkdIp7QQ18ss8gH6rwJ+QC3Pipb/APMRgAe
	nHvgsuxVUh8yXCYYq3t2tuouI4AlY2XvWXLTNlAdknyOi+SwHHtTgoXs7wg==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m68n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:01:42 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-427811cad57so109569865ab.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 05:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760097700; x=1760702500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYdQehtvwKcSOfcD5pRT7u0quUscXRAYuyKVrpa2gYg=;
        b=CgJb0Fu8rlgp2rTBCiCcOcHhAB3shvOzSsMzKjpSyvJbs1tlhUvg1I1acdfTqH3530
         XO+mmpUXJ5BxPEzUTICM2QXQcLty2NkAydxeCXJVZgvbWjWu0nsru0nd/HAApT/SQhvi
         PpXbD/Y4GmHeOelSA/5WbUQrjawS56jsdDQ8Um2Hhiy7EFi1yp5w5tITKiSck89D+4JJ
         /jV7ywZED5W4GrHxs1yw0cGJQ6tXlr7k8dfGw5jnq+y5eCYUEWXQ2fNF/sc0WagPWQHF
         tmj8sAtzgEvPlYoCd75vMqVi4F2izma6637Ff6MU4JhDX+lPolf9Rytgb+9D9UBDh2BY
         rf5Q==
X-Gm-Message-State: AOJu0YwUuNEGJ2ysgghp9cd8lhX1FmUTU/BWI53FOuhfxBMyCfzaKQOZ
	TPlNoNE+qRHDPrFxidGppDe7zV4S2NBpMpJ/hYTeZJFuRSO0X22B1A4kgZRHgw65CWa5NaHE5L+
	yP6ru/sdD2/pdqLr/YAAHFBnGtab5DtJ68VpS1xB2nWAVq2x4GRWtwpwCLvc2LwyBRSKtR31zIK
	CIEPkL32CTsQ4TLoI=
X-Gm-Gg: ASbGncvZ+WGz8xfn1i/YJ4QdYOKLYOovjk481w5YD0CBnBmbxGd6xSzYUlvBcPpET54
	hthPY6wDnAFnS9NZhgmQb1G2BDyokV/+KUiAVngNGXAv6Fkn2cFANx7QJTu0LdmcFN/0meo4z97
	zXx2Nel1f7abfh/g91SanAZPAENA/EW89ziGySrv2l/nSFfattr+1v2YavRccADegKdxHF4MLUj
	4UgPcwEmUBnjYQbFVoz0yOAlETRnpzaNQ+oObJqB3a4tj0G5BCMZ9Y+VTw+5LfGaguAkGKyxdJK
	E+FyvRQjzsz7cK+afbm4ir9VLbsfcZaS/ldFM8ko9oQEIFvLFJ77EE0YtyTHK3ULBcVRgfFkuHk
	r1g0miGZoCkKMtWbAHhAyHL8X3pMLRQwDivqxJkB+KaFxzbQQragx
X-Received: by 2002:a05:6e02:3a04:b0:42d:7dea:1e2b with SMTP id e9e14a558f8ab-42f874010b9mr104897395ab.24.1760097700235;
        Fri, 10 Oct 2025 05:01:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxCxRLVQ6vvQWgrwcbE8AfjAX95DN1vPVgdGpFtqoYSDN8yt0HaF5TFlA7Ei1UrlHp+0yt8w==
X-Received: by 2002:a05:6e02:3a04:b0:42d:7dea:1e2b with SMTP id e9e14a558f8ab-42f874010b9mr104896905ab.24.1760097699648;
        Fri, 10 Oct 2025 05:01:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-376350710edsm3603321fa.1.2025.10.10.05.01.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:01:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] mesa: drop useless freedreno-fdperf PACKAGECONFIG
Date: Fri, 10 Oct 2025 14:59:52 +0300
Message-ID: <20251010120125.2868011-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0+lcCL5KZwWK
 pN3q/mGYzQx+9Mc/ZYWf/L+sGjO5K37LD9X7OxHIVvKUuntSuklGlIW/CpetW7XwT3L3CpPdAgH
 3PovEiWyW8Erjq3wgci8kzRpxzBEutAFQMsFMwt8TwYD7h7NyqXF2wTuUuFe4Oelnug9XlJZxnk
 6nlR0LpD5Hs684AYTX96U4rJPvQZjwsaMsNjeLoBOmPAwLFJwhhkx4t3s44NnS3NjGq6TPQYNN5
 ATYPvLh2jGauCxrTy9Mao6sL9rRJOUkF7UQoySEiFHb2zSK2N7id7UYjIhW+1p219o9t8r00dhp
 dThl60erGJ50xw2Hbi/BpMLBhl2DuJPz06NwMXDZCh9csFGfxu1QtmjCyiWQK3v0nD43vwycIXW
 QnMvHFKW2So7MbiCOZx06C3QyQrssA==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e8f5a6 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=EUspDBNiAAAA:8 a=PZeYnjUMqWj4SCv1n98A:9 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-GUID: OVxx_Iyi8pBwCRebCc2BRXV1fF3R7te_
X-Proofpoint-ORIG-GUID: OVxx_Iyi8pBwCRebCc2BRXV1fF3R7te_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224681

File the fdperf dependency into the main freedreno tools dependencies
(by using conditional) and drop the extra freedreno-fdperf PACKAGECONFIG
which was created just to pull in the libconfig dependency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ee00214111c2..db12fdce6b86 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -148,11 +148,8 @@ TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
 
 # dependencies for tools.
-TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
-
-# the fdperf tool requires libconfig (a part of meta-oe) so it needs special
-# treatment in addition to the usual 'freedreno tools'.
-PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
+TOOLS_DEPS_FREEDRENO = " ncurses libxml2 ${@bb.utils.contains('BBFILE_COLLECTIONS', 'openembedded-layer', 'libconfig', '', d)}"
+TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ${TOOLS_DEPS_FREEDRENO}', '', d)}"
 
 PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
 PACKAGECONFIG[xmlconfig] = "-Dxmlconfig=enabled, -Dxmlconfig=disabled, expat"
-- 
2.47.3


