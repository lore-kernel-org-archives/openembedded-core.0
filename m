Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434ACC46CA3
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:13:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17128.1702030380564440440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MhPXnHPX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07066c4dc9=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B88FJ8k007072
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Dec 2023 10:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=BwFZxKQEkjBFkseDOCTz+xQmS/EfSL8OIq/o5N/rS/w=; b=
	MhPXnHPXiGjABR03PXB/veLlHkVkV044HdgXA2XocnvlrPw0+NKYaF5nQbnZ9i/b
	bBj0+n98W46zcss9MdOo9BsGfS04wUHs02WG2QCUor4/gvhTHFFQh1mOnUvMFlIb
	0Q7eyCytqPFUvfi6UVXeg7uQVTLF21cZ8SjnJ0GY/q9QfoBauR+u2FFjXQUk1jiW
	hsxp3fDxUYByIYRdxKxRbvzmMceEpgVc/5kFC2Mi8a8KbieIWJGEIMqRqCpfcxKJ
	7O9jvNroQH3s+IFI8jtaZ/S6kU0XNMRhkZejXr/Cd1Mz/CNF3MoiameQUOev7Nhh
	cgqKAVeqzAbCDRdWwODXPQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53jq3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:12:59 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 02:13:02 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 02:13:01 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/5] initscripts: support persistent tmp
Date: Fri, 8 Dec 2023 18:12:51 +0800
Message-ID: <20231208101253.4042712-5-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208101253.4042712-1-changqing.li@windriver.com>
References: <20231208101253.4042712-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Ba02rkT_i747M1Cuzy8sxjnWLnGWAIAG
X-Proofpoint-GUID: Ba02rkT_i747M1Cuzy8sxjnWLnGWAIAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312080083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192025

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
index 4b34c6a67f..c2eff7e02f 100644
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
+	if  [ ${@ oe.types.boolean('${VOLATILE_TMP_DIR}') } = False ]; then
+		sed -i -e "/^[d|l].*\/var\/volatile\/tmp/d" ${D}${sysconfdir}/default/volatiles/00_core
+		sed -i -e "/^l.*\/tmp/d" ${D}${sysconfdir}/default/volatiles/00_core
+		sed -i -e 's;TMPROOT="${ROOT_DIR}/var/volatile/tmp";TMPROOT="${ROOT_DIR}/var/tmp";g' \
+			${D}${sysconfdir}/init.d/populate-volatile.sh
 	fi
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
-- 
2.25.1


