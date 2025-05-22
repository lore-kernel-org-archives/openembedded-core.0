Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B32DC54ED0
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:46:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.25718.1747925171135651270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BK36NDC2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8Z4st011354
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=elJqMBc9h1G
	bsz8olAfOeI01UNJlANvzu3hWGIEsjc4=; b=BK36NDC26U6G9DDpCHP22k/0nhk
	TQqfgGlpvXMA5OsNcIRWeb/UDx0XIZzklfCaL22A8Nv0sflCS8Ep1iddpSC5ESOT
	2YAaaxS8yJKRwi2WZzASicC/nG6cB8akWcT7UkLbqAZ39VF/sbQoR82kjEWj0e+1
	5HtBp/5x3CgsmTNgR7qbDOuuHH1LuVSn5l4jrx56ERCrXqKU0J0PHDo+B3i0kDwj
	gVa0rTffK5wbnFmtKyXmUvDg5iTqz0SfjnDxfX5qSF+m80u5f44enxOalpkRmGA5
	3/Ul3KIFLE+uVGMSbAyN2m6L5MVfotqX1XH5fihZ0+CBFNa5j6AWM87g28w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb6jjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8bdbd9174so206538606d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 07:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925169; x=1748529969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elJqMBc9h1Gbsz8olAfOeI01UNJlANvzu3hWGIEsjc4=;
        b=u1XYhBJrZeF1JsyO/tFmK0yum9lFmME+A+bMObZA48C7eme+AYO3Ao+fyW0+/Sh1hh
         +KMw9d+XHhYKoX9rOvZ5iyouaYuHSf/hNSx+79mPWb+AY9wpaT3YO1EG8SaQ7Fb2b6Jg
         uYIyGRd6eYzHdP+rFUbXil23XiWkbuClxw08eB7w+qjSEbIsynXmaGOs1rh7aYOqiajx
         60wZsZcKot3EyPk18gStq0A321s8A8IUQkOQqqRovCRd1Pzyc1+yltmNR03pkidpwRN0
         JhVXLUDj0MeooOfC6qaySSnZF80z6ZyfZtCfWakU2OHe0gHtblgyzmy/vMhTw/qMywEd
         yBiw==
X-Gm-Message-State: AOJu0YyBEFr0m+7hxIhtude9pU04dAFtB7vj4dySOOl7ck9J0LjFqCGL
	TDpoL2Yka0qS5BLeJEtVJHYhB/Zd8Cvkvq9dAQyLIdGEtJBWt68/va7ECMb7P9+yXlkI7S0VhiU
	psGkLqwMioO/BubM6oBBzSBcmJViyA+lCla2TGIlInvoTg+R6rahV2I1F0Lps5qbgMOJlheUi9S
	32eZ9RITCe1GiQDPs=
X-Gm-Gg: ASbGncuknZj3SwmK4Os8fdjHQQZCbgqIkOfXBAYW8NVA17xG7irbTnllY13WTxVtPIR
	lI1WxCLCdjvLn3VPU/UaxeKuARp7LfIFhJCO/XhfkeE5w7Urh/3+Wb5ge1iTpW38qaIFi05wiPj
	VVfE+4xRF8HrB3soueaIAynoUR0DTbR+DVJ3iyYWqfk6HAYK+tw1qSthxGEIicCBG33ZAi4pHKL
	2OriEtoQLh9Gd+LEuF8HBDfSalbK2VT0SaVUTnaxgrIJVPy0HOrn2cd51Z3cISpg7nJ2pxuvruf
	xrymAvjNkK4TTHh0k+cG9vhUYkwsC7Jy9j4HwBidv2842AKeVc5mHDXOKgrRSt1hxGjsg6DwdDx
	Q8L+rBRfX4SCBjGNSkqua7AX3
X-Received: by 2002:a05:6214:402:b0:6f2:d25e:8f60 with SMTP id 6a1803df08f44-6f8b2c91d64mr423456086d6.22.1747925169010;
        Thu, 22 May 2025 07:46:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDoGIiu0RbHoJKWplF5fQhlNaONs2vX90TrWNDr2cuacgE0HckqK0Nk2a7ihcm9fNGQEu+BQ==
X-Received: by 2002:a05:6214:402:b0:6f2:d25e:8f60 with SMTP id 6a1803df08f44-6f8b2c91d64mr423455616d6.22.1747925168611;
        Thu, 22 May 2025 07:46:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cabdasm33031551fa.44.2025.05.22.07.46.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:46:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 02/12] mesa: drop useless -Dshared-glapi flag
Date: Thu, 22 May 2025 17:45:55 +0300
Message-Id: <20250522144605.2876771-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TZL79hjMMezeiOFGqkBSnDLL0Cif0nSl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MCBTYWx0ZWRfX4p87YS6poSY2
 r+qWHrJMNT/pzD+GHGhArtBpwGLmKd9z+IALdEgCcRl9/KsfMwfhAq8Qp3K9S3dvluHbED0/qRa
 fNkgLJhfJj+DHn2Eg/zpEsE9/fz8kam6RYiFyRhRF4SCl0/w3TTDWltaoJNnm3lZOJErXY/hgvQ
 mmmm1YTAgV92LfLVdCpGGkFXK4zAL8QjCsiFRjtMlpnD1QjLYApEZQj0sgUaazVZPYL9nPu1dzE
 v51NvhXfJkVy7XODYKs/QDnGDO36QP2KRdZZB6ZQErQgtCkDj9PUdvt8TcoALeclZoV16zMafvb
 2bxfY7M6jTHo9LTWYIgsxvxUvACQWEoM7JO5tvfJhGUOU+t/ikk35GV+ldqEk8ayMK7xvlCAl19
 +hn+fDGSZFkP8FP0bzKVaPq0OdsgFcIFjs0vXHakSAUjQ9hIoA4OJZysSOkUQ8+dXSKo83GI
X-Proofpoint-GUID: TZL79hjMMezeiOFGqkBSnDLL0Cif0nSl
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f38b2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=OQp4uNaVuwmCJKMus2EA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=875 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217113

Mesa 25.1 dropped support for static glapi, making this switch
deprecated (and useless). Drop it from the build options.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 2ff69c3ace2c..7fc306156dad 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -68,7 +68,6 @@ def check_buildtype(d):
 MESON_BUILDTYPE = "${@check_buildtype(d)}"
 
 EXTRA_OEMESON = " \
-    -Dshared-glapi=enabled \
     -Dglx-read-only-text=true \
     -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
 "
-- 
2.39.5


