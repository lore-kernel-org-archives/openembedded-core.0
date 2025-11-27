Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7ACD116F0
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 03:00:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10244.1764212426582036967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 19:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MRmHO8E7;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XqgytBzt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQMkvAB1849691
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tVTXFjmS9qA
	vWGUMKApczP6sk6kHzfH3b89cYc3aUPY=; b=MRmHO8E7zmKYz/Q+oR9UgdZL7lU
	c3IuUrVq4l0Rf5Q+tgIMK+4O6yre14R24co64WiOvOY6jAOTRQl/+TI7nxPWKjAI
	EOW3nVFnm0PhtXmGl8nKwo3gyV9TZ2tqvU+I1wp/JuC7Ekrc6N9J3oWd5Mz+nNZk
	TrMa/QCF0N9c0y/7r9+uuxOB8kYtUIqvqhpF61qeIP0wTpdYO0//cmwSNBPbQK3p
	zUwLoug2q9yMaB2XibE7edEPpx1uUe6NshVIoUCrwF12eTFWpkcWIXzSItOqdRps
	dQ9I8sek6PZ48HxjfFKJL5C84vcPe7y8aVf8o9VkihniUECR4kgH3WeIJRQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0mst6s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:00:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2982b47ce35so4266035ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 19:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764212424; x=1764817224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVTXFjmS9qAvWGUMKApczP6sk6kHzfH3b89cYc3aUPY=;
        b=XqgytBztE+ct9n+g9jHpaNMtfJ0j4YEkW7d878MrpYGP9VVQMM0cxiGyE1y8siWrT8
         rCka5yv1kqryqXhGQKTWaJgSNA8QjgKKD+wUF9VDdl+W6NEiql1v3q2Sjf2Wrms3Ya8X
         swsH/BJS8elh18gln0euDMRLkwnals7HHEeVW/ALQinT8JybMkso7cPu1eii3U96Hm/9
         n3CirozSDu7Z77AgvDiAYilgwMn3KG/V2JKojZpG7ZkpvslhWyPk+8Kzc2wyc6VHRdVd
         RVIGH1slAvmKnITTBLOQIDcXhdP91LzKg5bX8mrf6qwZ9Ad5N5sVPyFZs/pBBE6RS5ge
         A9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764212424; x=1764817224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tVTXFjmS9qAvWGUMKApczP6sk6kHzfH3b89cYc3aUPY=;
        b=g4fx5x/9VbTe+5K3QzAF7aw5InfxjZJfc7RBhOPTlxOI3DbId+Vv6OYdJAHphXODc9
         eaQfTsMW6i7mQE1WzJy6W9MYT1+PC4c98ivTn6of+CwoQsUlLpUHWjK4wZNw9Xea3+fn
         h+KPQbbmsTfSatNyfB/k/R4zyU5IG6CpT5Dpq2J4gbRyD6FkTSKCL0MLDU7/o8KsA+tr
         O6bDoEUg84atAIa5zIM/VkiybOwCe67TBgo3RGNuGHK6xQM013VXlWeKdUVXt3E9pTyH
         M+xRHv8zqMFr0jfN53S8JYbBcKt1ES2odQdzfiqMSqrWA6GcJnKNdRwaepvv9JWgE5+U
         7ZWw==
X-Gm-Message-State: AOJu0YwZ2MdCscbPQEHk6l2wPdfrrqwpWQamcqQiJfXH1dMTcMeYdoxK
	bm5t2xBtNW1vN0c4h798Yu48NB5rYsl7lCx5wGdZKsZ1Rq0FsSIqYiQ/ZFW9ZF2Va+C2yLtlYMP
	9X3JVGK3UhCWI+/mKc6c9wAb/02f/4cFEWVuV97Fxilq9ywiTA8xbnFh1NdhWQRCN5VULUnuMJH
	mrt+0Witgkv728HauzvA==
X-Gm-Gg: ASbGncvNVUlVnAzUXZOk7QWtR7Aj0ekWIk2heAT48rX0iaoCEwcjYhjBbEVtA23aKgo
	NuLSxNJ7AWouYYtQ7ZDaHmFyNl+x8nBNwH9n6jYZ0THU1RwMU6SqpCdHe0j9kHgnviPxmpBovnA
	L3q1MKOKjTZN/QPe43UlVFUE+0IacYDxM2lk0BNnMq32Zl/q7bOnoypbUGeYaqS6wQPWy02e4mK
	h8YwBeMeD0FKSdntgy7tCXhE6V+E/9nw62gIy4ItvOuDXYiI3NvgDojtDm7enlS059TxoLQXR6U
	m+uFmQVDtpl4el3/2AQpP5kyd+sab/ozURHZQpn5fQfInrZEgFWRk3mdVD6MwvGYJaJ8hmq+xXD
	qVDN3E7PjkzhKPVXIclNpa20FRe87ecYzFVh2sVDlK8lkwuDUEABtc3USZ+sYFi3qQ3WU
X-Received: by 2002:a17:903:1ae5:b0:295:7453:b580 with SMTP id d9443c01a7336-29b6c6cf3b9mr208349985ad.58.1764212423945;
        Wed, 26 Nov 2025 19:00:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHspRElCTWARX6FELjdp4GtZWLVkh7+rHW2ir4XulFyTxBqomKSdIyDFsacF1J5/qrleiiobg==
X-Received: by 2002:a17:903:1ae5:b0:295:7453:b580 with SMTP id d9443c01a7336-29b6c6cf3b9mr208349035ad.58.1764212422886;
        Wed, 26 Nov 2025 19:00:22 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce4415b1sm648025ad.22.2025.11.26.19.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 19:00:22 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v2 4/4] wpa-supplicant: enable OWE support
Date: Thu, 27 Nov 2025 11:00:08 +0800
Message-Id: <20251127030008.1421302-5-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251127030008.1421302-1-miaoqing.pan@oss.qualcomm.com>
References: <20251127030008.1421302-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _DzPishZ9tBknT0T3ZMXYA9XUc_40O2J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDAyMyBTYWx0ZWRfX9ji+OL1N1Ve2
 XBLuyoj0Ysi6MFSm8OoIUpTQALdiNGPjb+cnySyxbxGqobPG6HGxRmOp2kqone2/wkXa5zUOmZI
 u/UMeGfkdbZAfZnlyvJvEmcMpm1AMAXUIpW1iJdNQ29Cd4KDdc3hNLzt9ngrn7F/K+p/hMxaYE4
 AQCx73pu9WvHI2QP+PW3468hcT1w9nGODzM0dpT+X7nOzraBWkpXmTuyIaNcAXMPkKTp3YzbjY/
 s8Hdb+tOMYn2sGJhESTHCjIADi/ACEiF4RrQf25GY05slcOrgcHYaD+K5LWiT6jSJ5y0VGHn0Dd
 dMJaCw7EaiHEsuZctRedWvLO5esXH06CA0JE5+CKe8i8qjWkpkMxUh7MZ/NaPLxZyDGu3uH3+6g
 uPpOZ6I5WUyMbzh2npOExkIHlqirhA==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=6927beca cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kX1YWtxo-AknxJAGEQkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: _DzPishZ9tBknT0T3ZMXYA9XUc_40O2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226823

Enable Opportunistic Wireless Encryption (OWE) in wpa_supplicant for
easier testing and examples by setting CONFIG_OWE=y in defconfig.

OWE is standardized in IEEE Std 802.11-2024 and specified by RFC
8110 (updated by RFC 9672).

Disable OWE when PACKAGECONFIG selects gnutls to prevent build
failures.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../wpa-supplicant/wpa-supplicant/defconfig                     | 2 +-
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
index e313894ecd..8a68d56ffd 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -639,7 +639,7 @@ CONFIG_BGSCAN_SIMPLE=y
 
 # Opportunistic Wireless Encryption (OWE)
 # Experimental implementation of draft-harkins-owe-07.txt
-#CONFIG_OWE=y
+CONFIG_OWE=y
 
 # Device Provisioning Protocol (DPP) (also known as Wi-Fi Easy Connect)
 CONFIG_DPP=y
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 4a8ee1423f..971e55150d 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -48,6 +48,7 @@ do_configure () {
 		echo 'CONFIG_TLS=gnutls' >>wpa_supplicant/.config
 		sed -i -e 's/\(^CONFIG_DPP=\)/#\1/' \
 		    -e 's/\(^CONFIG_EAP_PWD=\)/#\1/' \
+		    -e 's/\(^CONFIG_OWE=\)/#\1/' \
 		    -e 's/\(^CONFIG_SAE=\)/#\1/' wpa_supplicant/.config
 	fi
 
-- 
2.34.1


