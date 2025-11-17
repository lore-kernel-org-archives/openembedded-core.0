Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A376CCD19A
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 01:23:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6490.1763342583674345097
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 17:23:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gxkZrVJ+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34165bd6f8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH0U1j6894351
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 17:23:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=B+85YX9HQ634iUOA1CD2d1AOvZhiDyYnbuogg9/aC7A=; b=gxkZrVJ+ED9k
	JXZMTRq0dAzh4sqGgnpIVpWjQL8BWxcwKY2hT0GY7j1GzJyu3xPZU/QuyxGJMmJ4
	++C/CupqRMiwzCH/lcTRnfspMi0MIRbDopnoHHw8xItTGXPVEkzFLi2+x4QFOpHx
	ytrPSC41zbc2tAcY/we4Lvxem3qMqCwYKkGxoZHtdrLBTZ5UWOUqyiig+Z/RpIHQ
	yBB9NdqIUSwSyQ3nFNLVhrtMkv9FHcNEgxnFm+aq4ZbFoMFDngeyF1+9HgaD8cr/
	i9m5OvVpcPXgmBTAgiNM+YtEGVArBhHWHocaByOndII6b9Kl4BDO030mYoUng7Ga
	MFkv+vzzLA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2s97e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 17:23:03 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 17:23:02 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 17:23:02 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/1] buildhistory.bbclass: Warn when PRSERV_HOST is not enabled
Date: Sun, 16 Nov 2025 17:23:02 -0800
Message-ID: <c04ffc4774e13357136539bea81f3e4e95529d67.1763342137.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1763342137.git.liezhi.yang@windriver.com>
References: <cover.1763342137.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAwOCBTYWx0ZWRfX4YCGSyxjKsch
 M5vkB07aRZHmK+/tFrEmvlMnNkb3Bt+Z7KMkcE6cuc4IdlaPb1YGN1HjkVfz3f4UJqke59TT524
 mlrcSEbagDli+2BnQo0hQEGcT1v78rmxXJTUmQgObZdRw8vnDIPrJzNae/lJOC42FBvkdH3JQEK
 es+N7ILbIaf7ypLj3LXEBENiQoGFh1ccOGOHYk2/Jxc2N2JrA/4L5NgS4nE0FVBm7AsEZEIMI2g
 +Kv8ARektKJkex9Q6Hyf3tQwdaBP3RDKBafE2rCNe9MQrAC5oSnJ4qai/hYYlBAArDP4WMUwyZV
 +6EZM5zGSus88Vb4dmDbbmmvcx7UVFmN54qfKvVxqSbMvd8b8ZZJJhYZXDsMS06inh//kT6PlNW
 ZVWHM6KIzE7C7oT/agsCSbz9QZF+Mg==
X-Proofpoint-ORIG-GUID: A0vtGn7TcZ9-xYdYyqE4m5PwqkTQ_smG
X-Proofpoint-GUID: A0vtGn7TcZ9-xYdYyqE4m5PwqkTQ_smG
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691a78f7 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=XpoIkthIeTa-b61LbZYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 01:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226481

From: Robert Yang <liezhi.yang@windriver.com>

The version-going-backwards check may fail without PRServer, and it's not easy
to debug, so warn for that.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/buildhistory.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 4a380c10c6..831134f15f 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -57,6 +57,13 @@ BUILDHISTORY_PRESERVE = "latest latest_srcrev sysroot"
 PATCH_GIT_USER_EMAIL ?= "buildhistory@oe"
 PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 
+python() {
+    warn_qa = d.getVar('WARN_QA')
+    error_qa = d.getVar('ERROR_QA')
+    if ('version-going-backwards' in warn_qa + error_qa) and not d.getVar('PRSERV_HOST'):
+        bb.warn('PRServer is not enabled, version-going-backwards check may fail!')
+}
+
 #
 # Write out the contents of the sysroot
 #
-- 
2.49.0


