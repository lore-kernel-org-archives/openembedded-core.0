Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1084C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 15:57:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1010.1783699048192528847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 08:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CqHgwWZA;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=LhaQZ/jh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEcSLv1078374
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 15:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BuG3a4uWNUZUlhr0d0oGw5L4b+H+mUuIUB+
	/vX6ubGk=; b=CqHgwWZArYAzDJMJpnlg3QKXK3IVvJt88TssPUI3nI0Jln1zT5k
	YM5gDPlyBqduwwZ10YljKTmvYdmp75473MYfCxlYolrnfFmtBrvmu8cwbLGJI6ef
	DVVj42mCLrmr2VADi5z8GYJG3Qg8OCrm8Ejojq8QhwOpGuBXqc6/CaAUzamGmuOv
	/RJq0C5EZAvo/HGxqZ1LxBUpcP0X4u0SmfM+JGum6UY6EMc9Da6bypLtsAA6v3oL
	mk+M0oJqd0Q/70+3qaN+X0YWwNTeG2Bhl0u748j5EVV3+MD5JL8w64cFmi4htgoy
	KpDh5JB1BUa1m/MEpCwyqNSBdFiKcooZFQw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f9ea4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 15:57:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso11123511cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783699046; x=1784303846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BuG3a4uWNUZUlhr0d0oGw5L4b+H+mUuIUB+/vX6ubGk=;
        b=LhaQZ/jhLTolCU2EbSdfzwTRVivXL4fAwsQtMhLb089vlhhVnk2o10WWuuKTh5JvUf
         GC1nwt7SXvebG+o4JzisrlnVnHB7HBzxqAKd5zb9z/EHu2T6jKf7jAtAmvc5wCL24FWr
         JHbOfm/lxAUNUWap2hHP93LFaqJPzXFRJrdsoq6arnmtnNeRRHeV7IbT23DSyd6VNgc+
         JGk+A4nMHPpi9IBtI2rWR0Ux7ImiTH9LUYsBF9K7PV9CCCh3QZ0ml1sISnfAwT48bFti
         cAaP/Vp5VEeFd1T89miPMHzq3oMeY0YnxBrK72HojtTggDD6easfESRlgnJoBr9lqPV/
         aeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699046; x=1784303846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuG3a4uWNUZUlhr0d0oGw5L4b+H+mUuIUB+/vX6ubGk=;
        b=nTQb/9uR6D4oMEaXwLt3C3MeGrdEr97vvZfKAbXTSZolffpxQneigC6m7iclLS96le
         blybMWsTohZqUszmMsmPklvohYiuP/Imv25PgkRvawLnG18WT4RBmHV6PPk80SPBARzQ
         V+HdDZur0zX7zNXjaEdv0qvYd73UmbmaV3XZed0vboLE4c+3GpP9/X/5MBpjgfZhFt5C
         jUD0NnGEP0qoWPE7CarLT5K2bQ+b6g6jLXk7Y8MH9aDt5DDWxx2iJQioAsi9UWdOH3py
         x/3jA8Qve2O6nHyXPn1oWiaLM8zIiGxb8MJXVaX+n0gwY7yslKZWPe1x42DAm6Lk58S/
         lZog==
X-Gm-Message-State: AOJu0YzwxjVkhoJILlOW6G5wr559GuQxn5FgwbxFVDswj08zF9r5ODwG
	kaEQt/TvYKl1W38jcXHX9wxZ3jWm9CnrJoGIvE/nxpZIb+pMCqkSYPZxaxopz7mQJMyuVHud168
	caZKgNas1B/j8VwwpJrotdRN1x3Dkq5q72wHBQaS5gJVDjuz3p0vlKiDU1QO/VAxzpxb3BsydeS
	JE8/KKI23XVJDqM78=
X-Gm-Gg: AfdE7cng8wq7u/2KDu9xzo7SCMMHK+GJUrx5JZv+p39g9lJno6UEcEu2nj4LwCoK5CL
	ivTmKE1HA1jF3PlDbeJ5y+xngrWnyYWfxVovitNv1XKbW/VBULKci+rWrA0JMQcTlsmA3F+2Va4
	QpoDSp5ordJLZzaan4YS+0HKI7LnlQ3fVo7sjqz52UrP2UnSKvG6WEgJhFCOGuUTBxbrs2cAE2D
	DJF6c7C4+DRuEkVuw8TaeTjmrcknxXRSjBB1pdSViAuTgGwtCjKOR/zaysWyCZfBMNFjUL2K8B7
	xFkI+K3sy4pAVdJJ1isb4fBj/7Tg12vy6OPPjDUlcLT2eE6QKyGyK3AwztlgfnNJX0YpQ8eSFBh
	6jNv8hPtuQKbuDyjjBgZUUDi7gg==
X-Received: by 2002:ac8:57ca:0:b0:517:9407:5c38 with SMTP id d75a77b69052e-51caa1280famr42833131cf.24.1783699046246;
        Fri, 10 Jul 2026 08:57:26 -0700 (PDT)
X-Received: by 2002:ac8:57ca:0:b0:517:9407:5c38 with SMTP id d75a77b69052e-51caa1280famr42832971cf.24.1783699045832;
        Fri, 10 Jul 2026 08:57:25 -0700 (PDT)
Received: from toster.lan ([185.228.162.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada023acsm641374866b.54.2026.07.10.08.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 08:57:25 -0700 (PDT)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH] os-release: set BUILD_ID vardepsexclude with weak assignment
Date: Fri, 10 Jul 2026 16:57:21 +0100
Message-ID: <20260710155721.214588-1-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a511666 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=YIx/k7VQn7/pPcQ+xNwIKQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4DAB_A2dYxb8BpKuJkAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 5LFitX-yaZodLzA6LLlIFjLXGHhSlwyr
X-Proofpoint-GUID: 5LFitX-yaZodLzA6LLlIFjLXGHhSlwyr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE1OCBTYWx0ZWRfX/9OFQw5fvxqO
 DpTIpIO0MA3yWL/KRq4jq6qBiWUsl52fAXR7dSWdw1IWIIJH9rj1ZcGcWU5USWu4bUhU0MIYxd8
 EfL0SWgK0e+rhnNK7t85w3r5xNsRkrc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE1OCBTYWx0ZWRfX2VOZ2gMzrMsI
 GEIHYpS4t3R/Gz55EHcatM/BxqkgirbIi8UGvxV/4CA6+jAyjWL6Xzl4U/L3dDVjTkAQH6BjZeP
 GieHQIHoqXXEoNtCDwsXH9nwUEcjNg4w2grAKPDIKgjAJqt6mGGq4AJT9sa+PgL3WlbJz6WKibQ
 PQgjFh02pgWqfilCrg8Au/5KJY8zy6k0LgHcJOS070+zeBDeVrJrUqvalosOIAyKTmvjEbc1iER
 iiMNaqAdH4DzPR1C8X27D9NPaLarCxgR7upE7kI0PlNRUCGWapxPtgLuXjTvStld/+PEaCRdl3A
 rK1252rnlbUI/5XdAZe8pnljgOThjyQWDDm3CTwC7QHXXwZZZhfrFyeB6O1cVNOx/oC3tnNs4NR
 q0o9NwB0j9OJhqdnV6USrbIWS1IZekRXgctHKtWiJn7bA6/PFfkTC11+Ep+x6bGlfux7vBBvfYE
 8JtjgcPU+LCDvDg+XOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100158
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 15:57:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240659

BUILD_ID is defined using a weak assignment so that we can modify it
externally. However, if we do it, we also need to do the same thing
for BUILD_ID[vardepsexclude] with the new value we assigned to
BUILD_ID.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 meta/recipes-core/os-release/os-release.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index e1906d05d8..bbbf9e3e11 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -41,7 +41,7 @@ CPE_DISTRO ??= "${DISTRO}"
 CPE_NAME = "cpe:/o:openembedded:${CPE_DISTRO}:${VERSION_ID}"
 
 BUILD_ID ?= "${DATETIME}"
-BUILD_ID[vardepsexclude] = "DATETIME"
+BUILD_ID[vardepsexclude] ?= "DATETIME"
 
 def sanitise_value(ver):
     # unquoted fields like VERSION_ID should be (from os-release(5)):
-- 
2.55.0


