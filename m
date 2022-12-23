Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B5CC4332F
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 09:32:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.68840.1671787952590764970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Dec 2022 01:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9356c28f5c=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BN96xV3016288
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Dec 2022 09:32:31 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r9cpek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Dec 2022 09:32:31 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 23 Dec 2022 01:32:30 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Fri, 23 Dec 2022 01:32:29 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES
Date: Fri, 23 Dec 2022 17:32:29 +0800
Message-ID: <20221223093229.823322-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -r5csPIdxpIPYqM0P8ZvOHviGbt4Vsk7
X-Proofpoint-ORIG-GUID: -r5csPIdxpIPYqM0P8ZvOHviGbt4Vsk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-23_04,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxlogscore=659 priorityscore=1501 clxscore=1011 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212230081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Dec 2022 09:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174976

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  $ bitbake gcr
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/oe-core/meta/recipes-gnome/gcr/gcr_4.0.0.bb DEPENDS on or otherwise requires it)
gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'gcr' has no buildable providers.
  Missing or unbuildable dependency chain was: ['gcr', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-gnome/gcr/gcr_4.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
index 264069ffd1..22edd386fc 100644
--- a/meta/recipes-gnome/gcr/gcr_4.0.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
@@ -20,6 +20,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
 UPSTREAM_CHECK_REGEX = "gcr-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
+
 SRC_URI += "file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch"
 SRC_URI[archive.sha256sum] = "c45855924f0ee7bab43e2dd38bfafd2ac815c6e9864341c0161e171173dcec7c"
 
-- 
2.25.1


