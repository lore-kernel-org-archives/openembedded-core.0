Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BBDC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 09:02:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3894.1717059756803351224
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 02:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=68801c3898=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44U89Z3a020028
	for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 02:02:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yeg2208bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 02:02:36 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 02:02:35 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 02:02:34 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemd: fix wrong path of tmp.mount
Date: Thu, 30 May 2024 17:02:34 +0800
Message-ID: <20240530090234.3919267-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UjN8hkh7J9MahEw2L6btFsgzwJkA6918
X-Proofpoint-GUID: UjN8hkh7J9MahEw2L6btFsgzwJkA6918
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=883 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405300067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 09:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200014

From: Changqing Li <changqing.li@windriver.com>

According to meson.build, tmp.mount is installed under
"prefixdir/'lib/systemd/system'", but for 64bit system, rootlibdir is
/usr/lib64/systemd/system, this make tmp.mount not removed, and /tmp
still mounted as tmpfs filesystem. Fixed by using rootlibexecdir, which
is /usr/lib/systemd/system.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/systemd/systemd_255.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.6.bb b/meta/recipes-core/systemd/systemd_255.6.bb
index 62842d43c8..15b631fc07 100644
--- a/meta/recipes-core/systemd/systemd_255.6.bb
+++ b/meta/recipes-core/systemd/systemd_255.6.bb
@@ -320,8 +320,8 @@ do_install() {
 	# if the user requests /tmp be on persistent storage (i.e. not volatile)
 	# then don't use a tmpfs for /tmp
 	if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
-		rm -f ${D}${rootlibdir}/systemd/system/tmp.mount
-		rm -f ${D}${rootlibdir}/systemd/system/local-fs.target.wants/tmp.mount
+		rm -f ${D}${rootlibexecdir}/systemd/system/tmp.mount
+		rm -f ${D}${rootlibexecdir}/systemd/system/local-fs.target.wants/tmp.mount
 	fi
 
 	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
-- 
2.25.1


