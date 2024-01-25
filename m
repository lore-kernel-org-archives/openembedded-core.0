Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0CAC47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 09:26:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13503.1706174757695143042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 01:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PI92/9u1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1754dbe244=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P6l2lg028753
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 01:25:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=t2DbO
	nX3tg2bwMavzqvH2bPRdmr1GmoLLHT15zDnWlw=; b=PI92/9u1NiiYlPK2dNtlz
	CRSrs2hvCK85CdKUykobW9XCzS8W9GMYoW1vEBZ0VDd37mkacdDAqiqQjfgLS1Ek
	XjlCU6uwuQd99X296YZTB5DgDky7eHYEzeBciLrZfYwnKTx2QgpZ8yzXz810yxh5
	o6501cWVa4Z0GiA7a+pB6COhWVrX8eBYhmjoLYp+5cqcxALx4EdfvLObiQMUEl2s
	1hULX55VF8Du92XXzzcH44Nkkqiay15RNHO6CA/ubpsnfbzf7cQeszLVIBEVtmDY
	0TyIUlAF7h/UpXdzSo4y5eVAp0yancr3iv/n5eG2awAJCQrdwMNbPvrFEeDoheXI
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv5rb7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 01:25:56 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 01:26:02 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 01:26:01 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] pkgconfig: Correct the PV
Date: Thu, 25 Jan 2024 17:25:52 +0800
Message-ID: <20240125092554.3657475-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: RkasDQK8PbVjfjELKbahaPdxIEq0yb70
X-Proofpoint-GUID: RkasDQK8PbVjfjELKbahaPdxIEq0yb70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_04,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxlogscore=518 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 09:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194310

From: Mingli Yu <mingli.yu@windriver.com>

Correct the PV to make the version consistent.

Before the patch:
 # rpm -qa | grep pkgconfig
 pkgconfig-0.29.2+git0+d97db4fae4-r0.core2_64
 # rpm -ql pkgconfig
 /usr
 /usr/bin
 /usr/bin/pkg-config
 /usr/bin/x86_64-wrs-linux-gnu-pkg-config
 /usr/share
 /usr/share/aclocal
 /usr/share/aclocal/pkg.m4
 # pkg-config --version
 0.29.2

After the patch:
 # rpm -qa | grep pkgconfig
 pkgconfig-0.29.2-r0.core2_64
 # rpm -ql pkgconfig
 /usr
 /usr/bin
 /usr/bin/pkg-config
 /usr/bin/x86_64-wrs-linux-gnu-pkg-config
 /usr/share
 /usr/share/aclocal
 /usr/share/aclocal/pkg.m4
 # pkg-config --version
 0.29.2

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 16e6c5b609..53d2335317 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRCREV = "d97db4fae4c1cd099b506970b285dc2afd818ea2"
-PV = "0.29.2+git"
+PV = "0.29.2"
 
 SRC_URI = "git://gitlab.freedesktop.org/pkg-config/pkg-config.git;branch=master;protocol=https \
            file://pkg-config-esdk.in \
-- 
2.25.1


