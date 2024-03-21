Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4173CC6FD1F
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 20:23:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7830.1711052592233839633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 13:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FXOiO71H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38108fcf55=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LBAx29023926
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 13:23:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=XcOxI
	YJrCq/Y762YIzTB1MSHo2A4Zsx+s8dc4XeD3H4=; b=FXOiO71HuwXwx0vFDqJZM
	TcfrQtC2GuDUFTOzxE/r263jI01qQkNS1WspulKbP1ud+nag4V4LNFS5QbmCsOsO
	J7Y4X+KW+gZO5zKc5+Z3qPs17yER4LvS1W4vmG+IHhmW7/sFGqrGWxrOxCIYTa0J
	EimM6DUANRQzLk0/TX+A9yNUYvorWDxSYzhRRXfNOj7Hu43ufNXlBVgUwSIozl1E
	nOF5TJQScOz+oqTdWW/LbEaSmjl6tp/MYQQOJwZhhrNfCgVtVcUflZotVlbK32hU
	9mMUykGIiY8CbSm85lhqKoo0FlEGzO0PmqBhvwwBJwhfYMF6r/D180QV6GE4Ip3e
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ww6q0n8gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 13:23:11 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 21 Mar 2024 13:23:11 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Thu, 21 Mar 2024 13:23:11 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] systemd: enable mac based names in NamePolicy
Date: Thu, 21 Mar 2024 13:23:11 -0700
Message-ID: <20240321202311.3137949-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bNNquQmHkRl5ow754CMi7WoO9pq-qdm6
X-Proofpoint-ORIG-GUID: bNNquQmHkRl5ow754CMi7WoO9pq-qdm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_12,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 mlxlogscore=618 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 20:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197429

From: Joe Slater <joe.slater@windriver.com>

Some BSPs only provide information to construct a
predictable network interface named based on a mac
address, so we enable that NamePolicy option.

This policy has been adopted for sysvinit as of
commit 4a7b42fcf6981d3120c08091a7ed3d4d7bcd41f0.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../systemd/systemd/0001-NamePolicy.patch     | 33 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.4.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-NamePolicy.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-NamePolicy.patch b/meta/recipes-core/systemd/systemd/0001-NamePolicy.patch
new file mode 100644
index 0000000000..46955cbcbb
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-NamePolicy.patch
@@ -0,0 +1,33 @@
+From 9bb09886320eb286108fb370b2634a66b3e3b9ff Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Thu, 21 Mar 2024 16:28:31 +0000
+Subject: [PATCH] systemd: enable mac based names in NamePolicy
+
+The default NamePolicy for network interface names does not
+include names based on mac addresses.  Some BSPs, though, do
+not provide information to compute other names, so we enable
+mac names as a last resort.
+
+Upstream-Status: Inappropriate [enable feature]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ network/99-default.link | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/network/99-default.link b/network/99-default.link
+index 429ac31e80..543ce54661 100644
+--- a/network/99-default.link
++++ b/network/99-default.link
+@@ -15,6 +15,6 @@
+ OriginalName=*
+ 
+ [Link]
+-NamePolicy=keep kernel database onboard slot path
+-AlternativeNamesPolicy=database onboard slot path
++NamePolicy=keep kernel database onboard slot path mac
++AlternativeNamesPolicy=database onboard slot path mac
+ MACAddressPolicy=persistent
+-- 
+2.35.5
+
diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.4.bb
index bcef3e6b7a..b02e44d9c0 100644
--- a/meta/recipes-core/systemd/systemd_255.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.4.bb
@@ -28,6 +28,7 @@ SRC_URI += " \
            file://systemd-pager.sh \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
+           file://0001-NamePolicy.patch \
            "
 
 # patches needed by musl
-- 
2.25.1


