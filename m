Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BEACEBF93
	for <webhook@archiver.kernel.org>; Sun, 16 Nov 2025 11:54:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7106.1763294062818591374
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 03:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gN/jC6CF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=341579856b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGBaq50342296
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 11:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=uW4HHddp9ofFqAv80pEL/Le5M7e0yLw+8dy2/pk/Xj0=; b=gN/jC6CFg4Mv
	86bMMmHq0xU2+n2U3T2NFBYQtC3e93IHMXFXn91deMljPJM+CKbNPjGa4W6ai4E3
	PaYyqD++OPuv7WaynUBdIG1HXGZ+8ktabmJadDEzQ8fKeNw8sMEdAK2Eq2nDr+zh
	fegXSDjNkWD6u/1wjQhY4X2UohDzHzHkYjoEN3rYlLVm6H/LlNj6L/7mbK24c0lq
	1iVggdY0RgkifFULx0ZYKWDKMOcBfkP2+Ib9/75RXP2nULx2aVFO8oMSoYBkjE7n
	gvHoxL7FdgQKnoB9yHarJFW6WQAkkqX+WSBkAf9WXLKqSMTKjF9M60RH1b6PKN+f
	N/7OPuo8Tw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aegg89045-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 11:54:21 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 03:54:20 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 03:54:20 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] package.bbclass: Fix base_ver for AUTOINC
Date: Sun, 16 Nov 2025 03:54:20 -0800
Message-ID: <0336a138f7ad4aff0f2cd3b9549aba5a467a8986.1763293945.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1763293945.git.liezhi.yang@windriver.com>
References: <cover.1763293945.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDA5OSBTYWx0ZWRfXzWEHHwOtM8xv
 JBL9tu4CVDgDUUGj0l6umapz3ZnvtEydAQ3OS8QVQ5+b9ia4OZ6bazEjX3gsHWpz5DlLn8FPDpw
 CST+6MUWy5OVy0CQQ6m14N8DaK1NBRPKucMwNAYecfislABp8W9Kfy+vQzQWUv9WWJRHu/T9gNB
 WdMUNFwMAzy7kMSyU5DeBXlXusoEUg0fNmw/r7b7q7fd7sC+GdQTVxABgrRcaPQ7FSSCYZEjzCl
 YmMVsCQZSJBsan94E/l1WMQcl5a+JLo+Cb7mJEPGNqtv1dE8VP2/PI227UTWUrqlIqSCCshlJjw
 BjvWKjaSbowyhepmcIVBX2TIIbPOufjtWbh5rjsfEwBWNCpo/rFDrBqEi6zj2/A0WBsj4sH0KZJ
 gOLB6fZSb8L69YXko296uTz7tsVIKA==
X-Authority-Analysis: v=2.4 cv=U+CfzOru c=1 sm=1 tr=0 ts=6919bb6d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=VrdWWUnlEglZnysO2HwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3Ul4NfrOLzcNihCIOJtphATxG9-HroA4
X-Proofpoint-GUID: 3Ul4NfrOLzcNihCIOJtphATxG9-HroA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511160099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 11:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226472

From: Robert Yang <liezhi.yang@windriver.com>

The srcpv isn't in PV any more after the following commit:

a8e7b0f932 base/package: Move source revision information from PV to PKGV

So the version.find(srcpv) will be -1, which would make base_ver to something like:
glibc-2.39+git-r (The 0 is removed)

There will be bugs when both of the following conditions are met:
* The srcrev is upgraded from value such as cff104 to b027d5 (b is less c)
* The PR value is changed from value such as r0 to r10

This would make glibc-2.39+git-r can't match glibc-2.39+git-r1, so the AUTOINC won't work,
and would still be git0, then buildhistory would report errors like:

ERROR: glibc-2.39+git-r0 do_packagedata_setscene: QA Issue: Package version for package glibc-src went backwards which would break package feeds (from 0:2.39+git0+cff1042cce-r0.0 to 0:2.39+git0+b027d5b145-r10.0) [version-going-backwards]

Strip PR to make it work as before, just like it stripped the string after
srcpv in the past.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes-global/package.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index d7ff333f20..bd32a6ede5 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -296,8 +296,10 @@ python package_get_auto_pr() {
         conn = oe.prservice.prserv_make_conn(d)
         if conn is not None:
             if "AUTOINC" in pkgv:
+                pr = d.getVar('PR')
+                # Strip PR to make AUTOINC can increase when SRCREV is changed
+                base_ver = "AUTOINC-%s" % version[:-len(pr)]
                 srcpv = bb.fetch2.get_srcrev(d)
-                base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
                 value = conn.getPR(base_ver, pkgarch, srcpv)
                 d.setVar("PRSERV_PV_AUTOINC", str(value))
 
-- 
2.49.0


