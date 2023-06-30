Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA11EB64DA
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 09:14:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8138.1688116495696183555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 02:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gH1z5Nja;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65456dd8b3=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35U5E2qO000914
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 09:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=6PXh/
	PuLUuaUjml+LY6pRK59MYSZ9Wq4LQernS+Gv/k=; b=gH1z5Nja7IJvXCJR59EN/
	nTiAV2VN94PMHxdcs0jQP+r1QQzWvuhVF5XW2rirtXYplfhG0l6NHk/igKqhI5df
	eU9BwNafw3xgblY6U/a2kTL3wAqNTiI0BOjC8zYZPOgmEEQcSSMcPJAsDOiZDd3O
	HPlL5r5KNxQN8eqAb6FZZn3MHexYwPSrQers+FrSl56zU14tVPmsxu7iJXImiHRh
	0ZV2FB1aGy/o9Irf+2XQll1tczp5q6tVeDxnXr70IA/oEHG8k4NL+Y3ZWAcHGnGa
	aKlhOVDi1MtNwge+nGekcwiVHiN8FCBgYYbzHLH80JCZ9/lNpHh6oag+yP1+OeeW
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb5px2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 09:14:54 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 02:14:53 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 30 Jun 2023 02:14:52 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][PATCH 1/2] dnf: only write the log lock to root for native dnf
Date: Fri, 30 Jun 2023 17:14:50 +0800
Message-ID: <20230630091451.3331563-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: aEzPZWqdzfCTgl-jOI7lQF-yBrW-o_pO
X-Proofpoint-GUID: aEzPZWqdzfCTgl-jOI7lQF-yBrW-o_pO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_05,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306300077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 09:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183689

From: Changqing Li <changqing.li@windriver.com>

From commit 742a1b7124, log_lock.pid is writen to root, but following
file is not changed, which will make it never deleted, and an unexpected
file exist in root dir after boot target.

$ tail  -n 1 etc/tmpfiles.d/dnf.conf
r /var/log/log_lock.pid

Besides, root dir may be read-only, so it is better still
keep the log_lock.pid under /var/log, only write the log lock to root
for native dnf for fixing issue mentioned in 742a1b7124

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/dnf/dnf_4.16.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.16.1.bb b/meta/recipes-devtools/dnf/dnf_4.16.1.bb
index ff79701dc7..9134411fa9 100644
--- a/meta/recipes-devtools/dnf/dnf_4.16.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.16.1.bb
@@ -15,9 +15,10 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0030-Run-python-scripts-using-env.patch \
            file://0001-set-python-path-for-completion_helper.patch \
-           file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
+SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
+
 SRCREV = "94b7cc7956580405b219329541d6b40db6499cf1"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


