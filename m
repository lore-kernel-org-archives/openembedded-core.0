Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E66EB5961
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 03:20:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10532.1770780017580195028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 19:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IHjXDU+y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6502e9d17b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B1U2KQ3781698
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:20:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=PjfKnySvtg1cNHTK6TWXcUZw5h8Syj8GvfRtrmAzODA=; b=IHjXDU+yyXm0
	R0Of25mpX+43mNVD1KsPPbwMGeNfaWtHnwZ/jPtkwdx4xoSipZyPRSt3mdww7xza
	wBDiCSvZnPGwZ0Eu11HjotCf2BZTh34KyEB7S4FQryxkYaqRRP55sLq+rpRXnfsU
	jxUbx0SKKxHTh/nfTwTyr+OPUhaw+sSp7i0vVJzPVJ3w/pkkrJyKIvViYHRJRmS/
	a4dfIWvvbG1jFjR/lX5GugfLV9kQgSkF9kqzztculTRDW4ATSL9GwAI0uTmuS0DJ
	D3bSlbiNtJ1xCNGe53qfb3M++Qh4E038j5w3iAoQGXrDU+3XeUMsKdeuazyXwGtE
	N9It13TM8g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4uyx9-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:20:17 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 19:20:15 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 19:20:15 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v5 5/7] lib/oe/package.py: Don't redirect stderr
Date: Tue, 10 Feb 2026 19:20:12 -0800
Message-ID: <9e8091448e0e3e3e2ef05951e4ecd0149f18c49c.1770779786.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1770779786.git.liezhi.yang@windriver.com>
References: <cover.1770779786.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698bf571 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=G_CNgP1_34ZBAdHNgzoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ZNtVFauUaJCwb7iHh08tIMyEA28OHoLN
X-Proofpoint-GUID: ZNtVFauUaJCwb7iHh08tIMyEA28OHoLN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAyNSBTYWx0ZWRfXwXA0l06Eic0z
 5QDkLHeiC2Q2skd0vJvtpXa2o/QOUEsAVEaaNoUV5nSBekHmpO9iOQ7sVaGideAN5XvbHRtD/cy
 uvyqpvRNg7lZqzccIz+2QKRimVpD6q5QqS9t/n5//GeTjDekr8n0UlSsuHURThihkO5J4xivhsE
 /tYVeqmBBFzMEryrsRFcJhjEWDAakx9btD3vnMlsAtayWYUG2m0KjXTXsXKNwzPcJxNWImzbfuy
 6FhIsnDgSlYW+YfmEu7/TiBVBqvrKqyJpGKVzzV3z+opZ/e6CNL/zQjzx/kTWI72A120ue7/JT1
 XeOtfz4U8/c3677M1HpDidQJu0Z3N4JeTczvd1QNzJtsUAYZ6pQW5maGD9PoZn0u2iVJprZ+WoX
 syIPYChbZ5czupgKaqsoWzORV5C+k15CVpiKVGTbPYrZ3OZ+bf3A1ffTADCcL9amZ3zUcLoUIJJ
 NXcZg2xA0j/VIqtRZuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 03:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230955

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


