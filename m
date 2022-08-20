Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A1BC28D13
	for <webhook@archiver.kernel.org>; Sat, 20 Aug 2022 02:29:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3124.1660962554718041732
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 19:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aE/mi0vS;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5231ae9cc0=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27K0dc9G027190;
	Fri, 19 Aug 2022 19:29:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=MX1MakDJS6UIJtllj0047vFn/XkXNTiCx0dKHnSIDcc=;
 b=aE/mi0vSWMyFlcXNdK8e/r9oe1K6to7h6QtAyNhsVnxE1KxEo1PsaFqCiNazOq2G4t5p
 U5X8YYHbbgW0ZcbGPBkn5vwnLAFfQxiy6hkXX32/CBi/9jWhdu0aj7X1LODNNYoSHiRR
 ie5eGChVelvAyawDCMFinqW3WEej9JridUBlNjBreF4be19V8Apx5uYzJApXjiaS5G0B
 qM2Ga4Iok9wvS2TPAZZ4IyEakWhE2IgT5ZDJqPaAjR2mLXErURdKPr3UHx1DncMXMCFI
 Z7iKAzwC85b/E6LL/wlK0PkTpzklD+Li1z3RCSkxaEAT63qeN5p8wcHP+2zaQtBsutYZ HA==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx783dyd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Aug 2022 19:29:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 19 Aug 2022 19:29:10 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 19 Aug 2022 19:29:10 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>
Subject: [PATCH] rust: conditionally copy tools like rustfmt
Date: Fri, 19 Aug 2022 19:29:10 -0700
Message-ID: <20220820022910.173452-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220819072727.2236928-39-alex@linutronix.de>
References: <20220819072727.2236928-39-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: L1aciXRQEROUX-Td8wAFFBV6JbYvkB2J
X-Proofpoint-GUID: L1aciXRQEROUX-Td8wAFFBV6JbYvkB2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_13,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=569 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208200008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Aug 2022 02:29:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169646

For qemuppc/mips, rustfmt isn't being built so check
that it and related tools exist before copying them.
qemuppc/mips are not well-supported in the Rust world
but will work to get the build to fixed later.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.63.0.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.63.0.bb b/meta/recipes-devtools/rust/rust_1.63.0.bb
index 3081cd5ef3..050f398794 100644
--- a/meta/recipes-devtools/rust/rust_1.63.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.63.0.bb
@@ -43,8 +43,10 @@ rust_do_install:class-nativesdk() {
 
     install -d ${D}${bindir}
     for i in cargo-clippy clippy-driver rustfmt; do
-        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
-        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
+        if [ -e build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ]; then
+            cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
+            chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
+        fi
     done
 
     chown root:root ${D}/ -R
@@ -60,8 +62,10 @@ rust_do_install:class-target() {
 
     install -d ${D}${bindir}
     for i in cargo-clippy clippy-driver rustfmt; do
-        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
-        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
+        if [ -e build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ]; then
+            cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
+            chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
+        fi
     done
 
     chown root:root ${D}/ -R
-- 
2.35.1


