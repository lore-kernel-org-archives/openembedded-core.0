Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC503EA3F1C
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 07:10:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15030.1770707446072060904
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 23:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=opvX95Er;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6501c5c083=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A4uQ2u1403957
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 07:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=dRySL5+xjljaYZKCCX8Se1AXEq70E1sF/+lyB3YwS+E=; b=opvX95ErnkFX
	suE6N5r9h5kdx5mHIJ0lvXnUUs0nyjRPY6YCTofQmHAWt0qC3ohqzkjMr0ee3/jU
	1CoeVb4Vlfe60GEpegiwZgFadzPuz7c6B4s2w8L36/n5HWF+jDaqWQ3wYZGimu2U
	nMwAOHe1craR2albykfAS/Iqj46kcJrI0nOy+OLYbIXKmN4EQppmPHi8+aPNCP+i
	KKXSJY3pbqmfCODyS/xOose8idr09y3csgjp3SnVRrjbL9AkQzJNnhwTbXEvXdbW
	H8VIKJuOYtHPvKrLqJlwAPgLvU0YcLOq3aCqSbtvwNXzIldguSkn5wLpZSs0yGZ2
	aCIv1+/VHw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwk0fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 07:10:44 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 9 Feb 2026 23:10:43 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 9 Feb 2026 23:10:43 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 5/7] lib/oe/package.py: Don't redirect stderr
Date: Mon, 9 Feb 2026 23:10:40 -0800
Message-ID: <1728350a9f53ac8b2900e256ae18c8778b77b139.1770707181.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1770707181.git.liezhi.yang@windriver.com>
References: <cover.1770707181.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698ad9f4 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=G_CNgP1_34ZBAdHNgzoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ww-4EdTM-V9koYxRxSYrrC_7AS7WTjm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA1OSBTYWx0ZWRfX0RZ/x6R8xtZ+
 VgXYWMAgXolqICryaqMk+XBn8FTMzY1BpW50JDHYDRJrRV3oRDra9nC4OgHafJLBpbYSzP4UrOK
 jcFS/KEe6VqrSXGajfkEgdrKyry20AkHQs0Wf0ilC7O07ZedoqA4TyeTtQcUUS+DUEEI6U3Xy3P
 d4qXD+9FjlOgl0I3M8JhJyvbg4Hh/cmHwbGdHDWE1rwdWkGKOpmSzeLBwQlIYRlChHS1PliGdwo
 rTD8z3IlAPpFmDYV8bE/xciICwZ62uj4o46H5EfRJxLqRXLYj9EAA+XECnPp1PTl6Mw/okNA1cy
 DqO2nB/XpDZI34InZiXb6TVUliCi1Gf8+rKvRLUcSMVz3S7b0tT8KicQMnj/5cOaZ05UUATEcy6
 iEVwhXOTH197VTVATU6vYj87/caf4JFR25N3QVMNC5DkoDh+vEQ79tQsNTwQ2OpH6nBGovhS2JH
 3spB09lI9EhnCQkMuKA==
X-Proofpoint-ORIG-GUID: ww-4EdTM-V9koYxRxSYrrC_7AS7WTjm4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 07:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230857

From: Robert Yang <liezhi.yang@windriver.com>

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 279cd567b3..17535ebd6d 100644
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


