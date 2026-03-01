Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86840FD0066
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 12:26:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.136987.1772367976591787367
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 04:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gK+JsOUT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75206bce17=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621CKmIA3942698;
	Sun, 1 Mar 2026 04:26:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/xHGGpf49UioH1Bc9MBRE/ygq6100zH9r5G2mTev4Uo=; b=
	gK+JsOUTz8/i2n7caEx0Q4wNqvlMUyyiBfvGr3FdwaxKtVfOwCBhe964HFz/JbBy
	JwEgPOARB/p+Ahf/nI4c63+6+OJ2nTNV0Xg11//AOHZnonPROGWAwmQ0OptTfxE1
	Lriq8KYBg2r4pB5Lhd43+/kHLei5rkOTkn5sviIGlhE6+UBbAOcRwr3hdL/1GR8g
	0z7XlmNX1T9pfSVEXk/2SH8uOTAGPc0oEGvcgfEaEqEC6/qH8Od+P1GEbjeNP4tD
	SSh/NHrm559d02wK5fT2c/+yvnHJ4FvoKhqGPyZ90gSwKrFyLfbkgyXVtkj1SubO
	rd2yxrYpfXelp321YoRvLA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh41456-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 01 Mar 2026 04:26:06 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 1 Mar 2026 04:26:05 -0800
Received: from ala-lpggp3.wrs.com (10.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 1 Mar 2026 04:26:05 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v7 6/7] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Sun, 1 Mar 2026 04:26:03 -0800
Message-ID: <c783e8fb5127f0edc1c76ff0e43078b774edadb3.1772367692.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1772367692.git.liezhi.yang@windriver.com>
References: <cover.1772367692.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kA7t3z_OAwqUOxZkASwqjyteoarpl-o4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDExMiBTYWx0ZWRfX27CxRep7sTYA
 PQIEwL6TrZiwMib7GrCcUufSBmcKwctA0WvmipSiGGfqiM1+yQkxkzj7WYgdqbp07iItXkoiD7W
 Rv0iV2m7l5OhTb9PIRluN+19eeoQD8zeVfqaatFg2rTh8PqJxl4M1RWV1juchNywwrRRpjM4A3m
 AwoFVcYh91caz8r//QP0VUQPEKhxZMLvnmiyLjx6rFYG8uzfydIK3cA30OAO5aKzQYKsF/ZjXSP
 ApPWb1IclBl2lVAJJWWuhJd2+XvY6Fl9dD4mKdu/aNGKl5e5gMNco0Y+ZS5FCRDYbq7HjY9OTj3
 0r1J3vFpVWQhweWIlNXea0PGIhU+RKzIg6PA556WQZ4Bs1rXoAeYAg5tZESgFQTZLZI7uDZWDN3
 CGVro9cEl4TR/T5rV3U/Xm3mChM/yRDdc5eo5Q5jH/K3+MMoIP3Os/xmHjV2kz/Q+eFwZrc/twd
 4RGJqCMUACcsUBSbn/g==
X-Proofpoint-GUID: kA7t3z_OAwqUOxZkASwqjyteoarpl-o4
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a4305e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=4Dhi_sbw-4GiiV7o3rsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 12:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232136

From: Robert Yang <liezhi.yang@windriver.com>

The rpm package requires /usr/bin/pkg-config when it has .pc files.
Fixed:
1) target-sdk-provides-dummy.bb:
  - package acl-dev-2.3.2-r0.core2_64 from oe-repo requires /usr/bin/pkg-config, but none of the providers can be installed

2) nativesdk-sdk-provides-dummy.bb:
  - package nativesdk-wayland-dev-1.24.0-r0.x86_64_nativesdk from oe-repo requires /usr/bin/pkg-config, but none of the providers can be installed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 1 +
 meta/recipes-core/meta/target-sdk-provides-dummy.bb    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 1d71f373a4..9fd8122d77 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -8,6 +8,7 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
+    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 849407cca5..618016b315 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -52,6 +52,7 @@ DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
+    /usr/bin/pkg-config \
     libperl.so.5 \
     libperl.so.5()(64bit) \
 "
-- 
2.49.1


