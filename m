Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767D9C25B06
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 15:18:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.5956.1660490290155231373
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 08:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=q1LIHVER;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5225295450=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27EFI9Mw002618
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 15:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=RzHgthSLWgOC1J+DcEG9xoYUYqbaZMtB/wpjMVL4S1A=;
 b=q1LIHVERGXjsBOTEjFY8JnnO79/fYhDFdhBboogVVfS/XxNVLhS2h3pH/nmwQTis21+A
 Kx8bIpWT+ekJ1ePmby6fQVPiZT1wgTcj3w6G/6MwKychGS7t8YScP2CiPNOTz6J8+GNj
 Rk2z08KDfZjJkb2XVgCiIk+rR0fepmYyPCGmoQiQQ0JTdO4xu5kV8fA7uksUVWaY+PCt
 Iumdx0gN/hC/6GQKLZ+mBnrV3dXeFvnC0JwjgUILBP2zqXqrkgCs+BSNK6UVPbW4KoYM
 1y6qGVGX/51FRgKwySUJC4QKjZ1ig7mT9p1b2idsq6Q1aOKW/58Yd2U2FKOuimlmJh2a +A==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx2x8gy9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:18:09 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Aug 2022 08:18:07 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 14 Aug 2022 08:18:07 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] packagegroup-self-hosted: update for strace
Date: Sun, 14 Aug 2022 23:18:02 +0800
Message-ID: <20220814151802.9877-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nshbPB-dRexp-hbx9P8zUwCAoqK-LVHK
X-Proofpoint-GUID: nshbPB-dRexp-hbx9P8zUwCAoqK-LVHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-14_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=773 adultscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208140068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 15:18:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169324

From: Kai Kang <kai.kang@windriver.com>

strace has been set imcompatible with riscv32, so update in
packagegroup-self-hosted.bb accordingly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 772b86b39a..a1b0ee2883 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -98,11 +98,14 @@ RDEPENDS:packagegroup-self-hosted-sdk:append:libc-glibc = "\
     glibc-utils \
     rpcsvc-proto \
     "
+
+STRACE = "strace"
+STRACE:riscv32 = ""
 RDEPENDS:packagegroup-self-hosted-debug = " \
     gdb \
     gdbserver \
     rsync \
-    strace \
+    ${STRACE} \
     tcf-agent"
 
 
-- 
2.17.1


