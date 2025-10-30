Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C15CCF9FC
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 11:54:26 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.23627.1761825259973573508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 04:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IPIfyFCG;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=PP2NsHHW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9SQ9W1994958
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RBTkzc6dMov
	eJc4Uohclom/DQ48xNDRSN1PuvteiySg=; b=IPIfyFCGZhUX9ZtA8xdRwPuH05G
	Zl28zmtbJGl/h3dqtANirwy4l7Gi5fv55USWUwC5j0c68eFLCHit9sOQdg7+XDm0
	sdImIeCBtsX5cB10J2XEGlCUK5QJ15LPNEWbONH6pDbrpgKZEfUXfiZJBpt0unxd
	5XJeumt5UvPrxeaN+jRaszeDZrlfmRRnsPzPIvEXVAVA+CYcOaz5etfwfH1yRv8y
	EXaZew9DaUrroOv8vAzjiJFZuIQzowfRthX0sFNlGWSa8UNY71SqoxszlI+3yyri
	SpoJcsD3d2WfPx9OpMpe1PwnpXsIy/bNxfdUy12PK1oFJN8YAnX+2bzXyBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr71qgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:54:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8aafb21d6so22660751cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 04:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761825258; x=1762430058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBTkzc6dMoveJc4Uohclom/DQ48xNDRSN1PuvteiySg=;
        b=PP2NsHHWg8Zz9LLDuAXhRuaFw643qc5yUXa/Z37ulYqccUnmYfNgS9aEZaQXrQ2uTb
         w6tsn8YAdsRWk8Cve/IvOG4suODeOd7XIlM30RYRNYD4MpFtgAwdvukirssgaNXnONM2
         fKEsLMrWHLNbEVGpiuRnLk4q6aam9ABnzeRqvAYezh2wafMCodWFUVkf3G5xxRFrLrMT
         EgI2hzy/5YiZHU10zpjwuzWD3rY4UIHkaN6Sdym/a9GDpjosa1uHhdOMQJ5xQ8cQXmx2
         drm6e31kQTbZuBiUaAYUsks+CxbMACuy3+M2wECEL2CLolzhrBwhxzpj41jdZ+AYc84/
         CGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825258; x=1762430058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBTkzc6dMoveJc4Uohclom/DQ48xNDRSN1PuvteiySg=;
        b=oUt1NoNbmCR9EMDQ9mPyJw+uMNndVj88rtuANJLB/c4NTkz+Dd6L3sGk+j6//IDRn1
         W30Lv27QRo/kB4+dBzlzgKnxKX6bR+BEuzixkgpTuW3hw5o5+zSDEcngPyVNdTDnMF+q
         JuRH4E44cVMGYLx6rfX8l3cMqmgYxLA+46GCNbGDBKp0wDdtzY8qzlW5dxpd4aXYGpzT
         /bVCR/j7gN3ipTH39vKs2nG8pTgZo/F97UODrmc19Jseqpb7Wpz5yNNjtt2TuSFrUYnr
         SXT3UtQdqDZnoKTbmtPBAPNQXnu+JATXhZRMhphoaTekHYeYWvgd6XsPKRy4hqwdE8Fc
         lXzQ==
X-Gm-Message-State: AOJu0YxdVizc2nOLaMZXiPV53+jnWyc3coHvMXGNYkSlN/8Kx84i7/c6
	iI1epkoamr8Zfu2CBSfnXEsL8mwtqWFd4GelQZrxW1ZoRNBJy6cgzPB/rO38ePlDH1gX3MGqplq
	AJJP5E/N2LaYpLXP+tiSfXdzsgN9POsCFCjY9/34MkWwSE3+C8wuPscOKgzJHGbrGxDYyq9FtzZ
	TudGuvb11nPS7q9Bg=
X-Gm-Gg: ASbGnctpeEmsFXT5WOe9vdvmJ31EZ3+VUlOVgyUp5wPJwinlaFiNGHcxjkCu1XiX6wJ
	ujK5qN7aGirlNsL8ryQyS1KDT1wQvd9kRmvT9rlQuq4OJbfN1gsTTHIsRq4CfWw8OsQXhZB2+62
	fs+61SumlyQcJQG1YzSPomjdpc40OLCTG2DkUYu++HrDno6MI+l3JJ6FNncwWQuMsLIlBkBxZkK
	6tmer6+n8lQPxD17zO1Ww6M+/YNHQhB42/wQJ8yiW9FjVPWmdct507R/c7X4Og2SWVX+olCb/gP
	8IVTxP1vvn5RezWDYA80D/pM7UUKQarONIQXYOAaSHA++I9bG6SwmxfC/kzLbR0UnNTYdX7GYIV
	yqcssc+qxDpbAeyzIEnwiCRdzfTTlOosvCcNuQYJp8EG3FUaGAKAv/aY9PlfJYUHObhf60oZY9K
	i8hlOy6BG3959R
X-Received: by 2002:a05:622a:1a87:b0:4e8:affc:29a7 with SMTP id d75a77b69052e-4ed15c98840mr85813131cf.69.1761825257942;
        Thu, 30 Oct 2025 04:54:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxMrPF5vYxlGizfbZ0xXr7nVPGi5+p8YS0KZ282/gRiKhzSy4lWyuPnzpgp6kS8VMjGmdePA==
X-Received: by 2002:a05:622a:1a87:b0:4e8:affc:29a7 with SMTP id d75a77b69052e-4ed15c98840mr85812771cf.69.1761825257310;
        Thu, 30 Oct 2025 04:54:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-593097eb2d4sm2909130e87.66.2025.10.30.04.54.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 04:54:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 2/2] mesa: drop freedreno-fdperf PACKAGECONFIG
Date: Thu, 30 Oct 2025 13:54:15 +0200
Message-ID: <20251030115415.2566247-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251030115415.2566247-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251030115415.2566247-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5NiBTYWx0ZWRfX9S5KGxiVd+Oy
 dtAbegrUaiGAF6a/G4EZxzTXe6WSN/aUOV+gkkEkQ/5O0X19sGVe96zKwN4tWCEN6enmTsuOutv
 ihxakqbaVV84/kHWTJNa7k208hUPUDUuB0V+8KZbpR+aoXq/9g/jSEOXF+fH13+psUfFfdqYb18
 airbCDBlDHbSOX4dmmlzcFYwd87bnuTWab7nJLmdjcXMiNps2yzxF3eclMCytWv+EMn1Jb0iV2I
 IuTCuOcBLSBlqFOQU7KHGyqt4OOqNkRdoKNL5qjdm29cipx6alLjsM2pD2g0SnMzh8/Y5u8uUo3
 UBL7+rV2JfV9pcLduX+iV44m5wrQFlOGX65IXLpc9ByOx8LmGBP1AkJ9BwOGpjW71ZIX5HtgTSY
 DaMvLoVng3SCZhZmv/mfeuQqzuDsGA==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=690351eb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=WcHs0SwSEHyATT4nbykA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: UjHetbz85woueQ6Wcm7bMd_J16V54iTa
X-Proofpoint-GUID: UjHetbz85woueQ6Wcm7bMd_J16V54iTa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225492

With libconfig being a part of OE-Core, we can now drop separate
freedreno-fdperf config option and merge the dependency into other
freedreno tools dependencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6a36aea259f0..fe778e58ee4d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -148,11 +148,7 @@ TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
 
 # dependencies for tools.
-TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
-
-# the fdperf tool requires libconfig (a part of meta-oe) so it needs special
-# treatment in addition to the usual 'freedreno tools'.
-PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
+TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libconfig libxml2 ', '', d)}"
 
 PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
 PACKAGECONFIG[xmlconfig] = "-Dxmlconfig=enabled, -Dxmlconfig=disabled, expat"
-- 
2.47.3


