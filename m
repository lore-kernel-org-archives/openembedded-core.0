Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D50C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 01:26:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.111821.1699493157462236250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 17:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DuPABK+i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9677a88a23=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A90onC9021582;
	Wed, 8 Nov 2023 17:25:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=afY0f
	1je5KlOfMqdAZgGUrGcZiGD706/Bd492zpGhW0=; b=DuPABK+ii5NwWWAIYnQcD
	akM14MKsniUiuGQZS76Y3OZK8k6uJROTfcE2yMk1nqu7U9kTd1Cvjkw07hLhRf/Y
	rkqrluEnSeN8sFaHVdsPstvBzTJnfPZtj1dbSUPhu4t6hEp5dQSnPWc2juiV03WI
	N9825x+BBl70OrgX+d6hTTajYPdF8ZRTQEmFrZ3343WVGJU41fT3qAsGeblGLbGj
	2eoCGjy3fe4aOGW65tO5iV3t2EX4bmePrkYK/zuEuzW0fdan+v9Vi3AN5Lhbnqzf
	iqKtf136uofuCDPJUItcTXskx4n1/MBhm6Y2KqlGVcdLJ60qBqxdGCE7QdKX5XKA
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2t1chh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 08 Nov 2023 17:25:55 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 17:25:58 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 17:25:58 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [RFC 1/5] valgrind: make ptest depend on all components
Date: Wed, 8 Nov 2023 17:25:51 -0800
Message-ID: <20231109012555.4074359-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MRAUAGR3JjPKkSCaZJnl7olmLxhMuSRp
X-Proofpoint-ORIG-GUID: MRAUAGR3JjPKkSCaZJnl7olmLxhMuSRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_01,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxlogscore=696 impostorscore=0 clxscore=1011 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311090009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 01:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190367

From: Randy MacLeod <Randy.MacLeod@windriver.com>

When the helper scripts were split into separate packages, they
weren't added as ptest dependencies. Fix that.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.21.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
index 68ab319a1b..a2feda6aae 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
@@ -139,7 +139,9 @@ RDEPENDS:${PN}-ptest += " bash coreutils curl file \
    perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
    perl-module-carp perl-module-symbol \
    procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg \
-   util-linux-taskset"
+   util-linux-taskset \
+   ${PN}-cachegrind ${PN}-massif ${PN}-callgrind \
+"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-gconv-utf-32"
 
 # One of the tests contains a bogus interpreter path on purpose.
-- 
2.42.0


