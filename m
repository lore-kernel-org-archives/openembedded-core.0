Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B116EC47DDF
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 10:20:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10911.1706696441396382381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 02:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b4gCdBP2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2760dde7e0=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40V6c7Jt002501
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 02:20:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=z2ChN
	3yQdyAWnbJKI6o9YfkPRPCGbOp8+7ifYzTytI8=; b=b4gCdBP2fdH/MMg2igdrd
	dRhOW3p05KQckz4yHS/q7qsLIhphRDKqLwLNKeAFJzb9whNkCv8OqoNKA9Hrbi4a
	9mrxRirp54K/8GyfwUbrB4AbX8rEwFzKCXH5uG5T9RpHspuHZTJww3HNNFI1cYCJ
	Gdwa3JQtMeSg3NWZhP1Tbb4od0uFKfcPB28ie42XI44GMRB4aVSFnayujqn9AMji
	pNzlnLqMiKqVJ83dqQwbaLvhWc8QVAal1PzU5cxlKV3zGMy0/9GS0pua2h6G/QdU
	CN0LdzP9Vu0m33tC0GZhJu2s9J1ITfK8Gg77Yrs1rU6toLS9RF5mQ5vRd7H6rLNB
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vyatvgd18-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 02:20:40 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 02:20:23 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 02:20:22 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rpm: fix dependency for package config imaevm
Date: Wed, 31 Jan 2024 18:20:18 +0800
Message-ID: <20240131102018.2027338-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nIgEKmnrBnUVAP3X0dlB6J1RhdVDJDQO
X-Proofpoint-ORIG-GUID: nIgEKmnrBnUVAP3X0dlB6J1RhdVDJDQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_05,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=651 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401310078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 10:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194513

From: Kai Kang <kai.kang@windriver.com>

The dependency `ima-evm-utils` of package config `imaevm` has been
removed during rpm upgrade. Add it back, otherwise it fails to run
do_configure when the package config `imaevm` enabled.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.19.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.bb b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
index af11dec5ef..123b8cddfd 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
@@ -78,7 +78,7 @@ PACKAGECONFIG[selinux] = "-DWITH_SELINUX=ON,-DWITH_SELINUX=OFF"
 PACKAGECONFIG[dbus] = "-DWITH_DBUS=ON,-DWITH_DBUS=OFF"
 PACKAGECONFIG[audit] = "-DWITH_AUDIT=ON,-DWITH_AUDIT=OFF"
 PACKAGECONFIG[fsverity] = "-DWITH_FSVERITY=ON,-DWITH_FSVERITY=OFF"
-PACKAGECONFIG[imaevm] = "-DWITH_IMAEVM=ON,-DWITH_IMAEVM=OFF"
+PACKAGECONFIG[imaevm] = "-DWITH_IMAEVM=ON,-DWITH_IMAEVM=OFF,ima-evm-utils"
 PACKAGECONFIG[fapolicyd] = "-DWITH_FAPOLICYD=ON,-DWITH_FAPOLICYD=OFF"
 PACKAGECONFIG[readline] = "-DWITH_READLINE=ON,-DWITH_READLINE=OFF,readline"
 
-- 
2.34.1


