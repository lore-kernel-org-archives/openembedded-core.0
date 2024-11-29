Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECC5D729EC
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 15:33:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.117285.1732894424860137137
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 07:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2063098a0a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATE0Gok013179;
	Fri, 29 Nov 2024 15:33:32 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671at8y3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Nov 2024 15:33:32 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 29 Nov 2024 07:33:30 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 29 Nov 2024 07:33:30 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>
Subject: [PATCH 2/2] gcr: correct gpg2 -> gpg
Date: Fri, 29 Nov 2024 07:33:30 -0800
Message-ID: <20241129153330.2203199-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129153330.2203199-1-hongxu.jia@windriver.com>
References: <20241129153330.2203199-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YkI9xWsGvFBv9-622EQmvO1GiHn8as_W
X-Authority-Analysis: v=2.4 cv=TIS/S0la c=1 sm=1 tr=0 ts=6749decc cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=aGKfLwWOUcjFUVLmQosA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YkI9xWsGvFBv9-622EQmvO1GiHn8as_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-29_14,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=530 adultscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2411290127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 15:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208024

Due to commit [gnupg: upgrade 2.5.0 -> 2.5.1] applied, drop
gpg2 and use gpg to instead

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-gnome/gcr/gcr_4.3.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_4.3.0.bb b/meta/recipes-gnome/gcr/gcr_4.3.0.bb
index 73b36a3dea..6c620dc391 100644
--- a/meta/recipes-gnome/gcr/gcr_4.3.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.3.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
-CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
+CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg'"
 
 CFLAGS += "-D_GNU_SOURCE"
 
@@ -51,7 +51,7 @@ EXTRA_OEMESON += "--cross-file=${WORKDIR}/meson-${PN}.cross"
 do_write_config:append() {
     cat >${WORKDIR}/meson-${PN}.cross <<EOF
 [binaries]
-gpg2 = '${bindir}/gpg2'
+gpg = '${bindir}/gpg'
 ssh-add = '${bindir}/ssh-add'
 ssh-agent = '${bindir}/ssh-agent'
 EOF
-- 
2.25.1


