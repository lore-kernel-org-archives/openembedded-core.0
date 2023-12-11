Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2251AC10F07
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 00:58:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.97619.1702256301184140761
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 16:58:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aH1srFMC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0709ce2531=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB0tEVl003279
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=IBOOYR8Gr8dp2E4woF7U9LzjAPdPSUgELdYvZIrRTUg=; b=
	aH1srFMC7TE4Cx0Br53ijHBbfnt1ZxTuQQljRqVb+GYLBtnoQwI8stY8AG+Yegw/
	PyTtLzrIsIMHLrUrDXgRxP7cyxyFifNUPgF3m5MCVI3Dz3Sg395Jrjzjs6nn4uFn
	9gwrPLMajXz/qkCpXpwSNTNUZOK/Zy58d4KpP6+BuGDdxearpelCAAIBLY+bmQLL
	MzsYdTzo9ah2J2rxa5DojblIc7pHrIAotmqBHYOui9pcWD4dgLibzrMtFNbHQO9R
	/98NZphog5kmHltUY3Wr/RGYv/txsj3CmU1nmXz0vR8uDWaSFyYKT7dlsVYeAcvD
	m1gcJs5SuBHeQ3iAhCO4gQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvmd490v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:20 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 16:58:24 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 10 Dec 2023 16:58:24 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/5] initscripts: support persistent tmp
Date: Mon, 11 Dec 2023 08:58:13 +0800
Message-ID: <20231211005815.1119314-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211005815.1119314-1-changqing.li@windriver.com>
References: <20231211005815.1119314-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Jh3Ah2eZEMx1vt91OdybRMepaM6nS7gu
X-Proofpoint-ORIG-GUID: Jh3Ah2eZEMx1vt91OdybRMepaM6nS7gu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 00:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192133

From: Changqing Li <changqing.li@windriver.com>

* default volatiles file is for VOLATILE_TMP_DIR=yes, and
VOLATILE_LOG_DIR=yes, if they set to no, remove volatile related config

* replace /var/volatile/tmp with /var/tmp for populate-volatile.sh

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../initscripts/initscripts-1.0/volatiles            |  1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb     | 12 +++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index cd8a4be05f..a280c47dda 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -28,6 +28,7 @@ d root root 0755 /var/volatile/log none
 d root root 1777 /var/volatile/tmp none
 l root root 1777 /var/lock /run/lock
 l root root 0755 /var/run /run
+l root root 0755 /var/log /var/volatile/log
 l root root 1777 /var/tmp /var/volatile/tmp
 l root root 1777 /tmp /var/tmp
 d root root 0755 /var/lock/subsys none
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 4b34c6a67f..c6a0d35dbf 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -103,12 +103,14 @@ do_install () {
 	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
-	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
-		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/volatile/log' \
-			${D}${sysconfdir}/default/volatiles/00_core
+	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = False ]; then
+		sed -i -e '/^[d|l].*\/var\/volatile\/log/d' ${D}${sysconfdir}/default/volatiles/00_core
 	fi
-	if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
-		sed -i -e "/\<tmp\>/d" ${D}${sysconfdir}/default/volatiles/00_core
+	if [ ${@ oe.types.boolean('${VOLATILE_TMP_DIR}') } = False ]; then
+		sed -i -e "/^[d|l].*\/var\/volatile\/tmp/d" ${D}${sysconfdir}/default/volatiles/00_core
+		sed -i -e "/^l.*\/tmp/d" ${D}${sysconfdir}/default/volatiles/00_core
+		sed -i -e 's;TMPROOT="${ROOT_DIR}/var/volatile/tmp";TMPROOT="${ROOT_DIR}/var/tmp";g' \
+			${D}${sysconfdir}/init.d/populate-volatile.sh
 	fi
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
-- 
2.25.1


