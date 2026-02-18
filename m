Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D622E9A049
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 12:23:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10864.1771417376583452095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 04:22:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fjySmf17;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6509523d13=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I9FlvK1377447
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 04:22:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=PjfKnySvtg1cNHTK6TWXcUZw5h8Syj8GvfRtrmAzODA=; b=fjySmf17Se6z
	Valr94LpcV/7OO21FgJKjl5IXHQM3E1QMoLY9wDBfMQhqq2ghFNXebZ5yTh/YRCF
	APwXaeyHrrGm9foEI/bxeEQ1I/P4lvVyUK6UY10eCUC2adcWyUT+F/ADTfpwIOqn
	PxJjVkHOrmnqrNJIKYmdWn1TGKbEQxpOjS2/PzXobu9VzKavCTgza83qiS+6KODf
	db4HI8RaqDxBvaCZ9HlDXdvucI9bUvlwUyJrJMyeMe2/+6FjQbNDyXoLune3vuRX
	rivFadAsb6qbDz1Je2NiP1KxSuzUf6NVLQLD79ycmHldeMh9pt4r3HGOjbjDBs14
	vnIra8qhkA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ccbamt6sg-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 04:22:56 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 18 Feb 2026 04:22:54 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 18 Feb 2026 04:22:54 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v6 5/7] lib/oe/package.py: Don't redirect stderr
Date: Wed, 18 Feb 2026 04:22:51 -0800
Message-ID: <70c6ef0d02e5e47fe99be43bf90f5b040b9386cb.1771409846.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1771409846.git.liezhi.yang@windriver.com>
References: <cover.1771409846.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=SsCdKfO0 c=1 sm=1 tr=0 ts=6995af20 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=G_CNgP1_34ZBAdHNgzoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwOSBTYWx0ZWRfX4apzA5umdykI
 8lKE9oHf7un5gxM6c+nmgKuOuqCGr2RdVCXfHstckD2i5KTSMDEa/yYIFpR1QJRE9+jVBQVYtpZ
 UyW8EO5ErhaHxqZlg8rGIvdw30Hho0rR70puKPiwcukRtQafYMFQWjh1PAsGES7gO1VepdXSizB
 DCwOrp/mYjHG89122A0PNDFBRUdHyeX9Q3tVgWvonkghm1QBHmv2N5cO6zrpWr8IF3b6XUu8P7j
 hCXSmx42KsijdN3+qv0x09a53ulQoCw5miSwqcmx+1SoaQIuAwND5fzay2JQg2wgG+MsMxlGbPM
 Ny+k/trK+xTLaJoPmKkeusLSKg57oOgsjAnpS8PAeMzEljNzcq8WN5lIiRRLeod3u01R8AfOEve
 6vTvIhI4E8bDBEWmhFeAXExCDX14p5KyQCgHRbOwZLBwyMw5UTzuhm8vuBvtZSuWHBxCY8K/X/p
 nMBs71kLxVa2+6uWrYg==
X-Proofpoint-ORIG-GUID: liMA1VciZ3iq02CWwcVSnvxrdIud8ekb
X-Proofpoint-GUID: liMA1VciZ3iq02CWwcVSnvxrdIud8ekb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602180109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 12:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231303

From: Robert Yang <liezhi.yang@windriver.com>

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d389a9f43b..f97eae104f 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -276,7 +276,7 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
 
         return provides, requires
 
-    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles).decode("utf-8")
     provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)
-- 
2.49.1


