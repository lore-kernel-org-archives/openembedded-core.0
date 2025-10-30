Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38F3CCF9E3
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 11:52:36 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.24013.1761825154035378357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 04:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VlPI38hw;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IaJ7JnzV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7NMvk1599075
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RBTkzc6dMov
	eJc4Uohclom/DQ48xNDRSN1PuvteiySg=; b=VlPI38hwipOfdRRwFVopZp8J9gd
	95dhku/xJ/+UGYIaCZOrwa15eYNvJH2X5bgGaTSesyx9Eq5wkE6T+U3+TAYG/ckY
	i7rXcs885sQT1fp7QVBDFKCTszJjQAkk1ZRotQLlgMfqUoguZTxvgSTdKniEhvJZ
	TwzsC/JRz8pmpTtBQD+vnO49SrhdsP6Ss5ohEnpp96IovcHCZW/VtrFL+Hu7SbVv
	YlzW0J0AHIrJY10FZ9YFh8tAWpxECtkCdqEsSXnBLsR0iMJhIBgT0HZhXtIlWlOm
	L3xgx/ketFHNRVbsbJUaeXctWx3fUod/nomp58IWL/oD1Q1984xViZhl/GQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ta7tapv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:52:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ecf72a45f5so25409451cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 04:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761825152; x=1762429952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBTkzc6dMoveJc4Uohclom/DQ48xNDRSN1PuvteiySg=;
        b=IaJ7JnzVR496rNRL8mQaP6K2B62vQAP4KT9o5eyiF1KHt0mPvdtJB4Dxo9Nrzg/gL3
         YK5CgTDOqI0wGJyyyuLT4ZqTSOnznsuHFVMJjzIpleosDTVNc6pwQvql/jo7xzJIxajq
         ECL+2Pce0MNENcGRXL4oxiurvPXAU5w1hRQkwoj1xnVvyEsTd+Q0NMH8aMkmD+0bo1pk
         8gb+CD+5FUDCaJSbjow6rvmC8hyTX1olQeVD7UB/G/JFKwWkVnO6feln6xoWNeXswISM
         4vxPlYjldivwYHtpyYMV8ZRnTXO0w8jhgdN6IPLzavOe1aR7EuoLOil7X5BoSpCSb25i
         /qBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825152; x=1762429952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBTkzc6dMoveJc4Uohclom/DQ48xNDRSN1PuvteiySg=;
        b=CcHM0xqNGCoBzUnbjWtTJYsfFviKvINjYSbIwClf1MDqiSQOJlq2SrdFETLT2NIaZ4
         TIxFKSmtXFKVd9y50AefIBxiGgkZomSADdMMJS3YJBmx8P480NTOsAOouEY8QQMon81a
         YjquXXYhhXBky4z+ATgdDCZt58r3KDf3Jf6xvBGy8Eohe1hMx6H0KbNXaPqqX9uW4Xsf
         VAO4HT/GMcRlvjGibFDPLNCEvckS4YUsWC8tVth35gvPUabBYwiQ6PLToMqiYlOz7S6d
         vCwBfe7GkLQpF3/76JcDP3EER7NOclyRhQe5VisE4XxtvI2t7IAeB5GS5zYtnp+L3Ai8
         pCxw==
X-Gm-Message-State: AOJu0YwRx3+OEH6U56OToFH/mCxuHE6cTJ7Un605HJhFY79dRvyA8c0j
	GI0qD2P3ZFIRFRk2Fl9tMuccKgNOnB4OQ2ceTjFqA1Kx2cf0Nhx45r46VcuOIhdua10MAoMBZ12
	DmzThgyow3Yw7SN7gIorcMNGLV4VkrkVfugQKi2uL1WrAl7d3TBi1ycgDm8f5gMSKDgr5mEjsi/
	a/XeplE6w3q6MuXhA=
X-Gm-Gg: ASbGncvaVyJikNqrV5K/oUilzk9EwAoPFddYdpjFbJhIPq+M32UGoIPLRhCA+LGFjiN
	LVN0VP6Km1fXQpDenw1K95WsPGV3wlcSNFms8qwmk+ttvc5uhdLLo0T3M10yseUt3OmkIO1splS
	eXCOhA+VMatvWuyocc65l/lLy1rR+5gipKcOd9tMHS0TZzrQNoYurG/kh738EPuYoJcVJtUXEnk
	hpX6/Af4CFKLjvyzFsqixwkMVKdokcWxf30UNsX4T2CBQfH77ug+y+YnzmdWeOL2LrmnFMvnkM5
	kHgJBe0Eeyxq29TUHfehFmFRzl6oFwOe7PYaM57JOdR7Wr6Gvce8pYj6fAaxZ+8cAljk8qeJtSN
	vPKPamuuClqg2zB95Y7nR5vplWf2NCL6+kb1uBnT6492Ss22Lr0jEmkpbMn6eOSqHadYjvI956S
	RqhNmsXqyvY+Jc
X-Received: by 2002:ac8:5fd6:0:b0:4e7:1f73:b40a with SMTP id d75a77b69052e-4ed15b53eb5mr75694011cf.1.1761825151899;
        Thu, 30 Oct 2025 04:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCRf9H7LQZrpimsrlhWT4EOUyhxC42u75dtMa20ynXFr7PDqelTM63k2L0dVfp5UD4sp7/Zg==
X-Received: by 2002:ac8:5fd6:0:b0:4e7:1f73:b40a with SMTP id d75a77b69052e-4ed15b53eb5mr75693781cf.1.1761825151422;
        Thu, 30 Oct 2025 04:52:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f6e644sm4599182e87.79.2025.10.30.04.52.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 04:52:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/2] mesa: drop freedreno-fdperf PACKAGECONFIG
Date: Thu, 30 Oct 2025 13:52:27 +0200
Message-ID: <20251030115227.2559731-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251030115227.2559731-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251030115227.2559731-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aaVsXBot c=1 sm=1 tr=0 ts=69035180 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=WcHs0SwSEHyATT4nbykA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Qkx2-0yc5P8dwm2HaU13JKq4RRekLNCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5NiBTYWx0ZWRfX7TDvdSMQUDDF
 T9eNl9E4WqQMfftES5HImF2Nu5w9xkoI92qmy8Ng9QQIaVluNMw9yzTwGlF6JhlH5DjjedJ+zZ+
 8w2h0zAdpGwPld2LZ7nSiXt0aIJd3NRnmEtuUz6JbBh5Aj0YU3FUJn8tKpt9lJ19Wr30H9XYSoC
 8Nz7d83AnDifiTmBxVBQrbxlDKk/lCXjhTtPPOm+BhQN2aoJRVlXPHHGNdiovB+oCZLxZ/hTSeV
 fT+9wibdlPQc0MOp9G23FH23MOFwsIBdYtSfODrWyQatmk/YX1SqIsmmGa2agnabSiIqwWJ3/Wh
 dmxtqK1zfMY51abkaJHReAwNPbFNxcAnT0X8zJ3wlH54g3bFDj7IfynKJ3NT/lzOQ19q+PvA/Z+
 mT95gmTQMFZ+q/2Su8M1jGNMoZRX9Q==
X-Proofpoint-GUID: Qkx2-0yc5P8dwm2HaU13JKq4RRekLNCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225490

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


