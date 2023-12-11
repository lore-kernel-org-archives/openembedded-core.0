Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2810CC10F04
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 00:58:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.97075.1702256302131560028
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 16:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LfI7DXoL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0709ce2531=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB0ssHk002836
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=Goux2k0vGLR0myg26ro8us7PAwdQgGaSZGx+wj4q+tU=; b=
	LfI7DXoLDZKisxqWbk8+UbTS5/xkxm6Mqqu2/2+Zo9poWm9FWKfMYkBlkU6xA0EG
	uP0FtWq4seui96Ya0P9kab2ahEPQvj4Y+BI/sgl+UqJZYxQFnzPNAH4KAXExbip5
	jT0ubP7Z263hn6iXPPZd9RCZrbrn5lOUqGcrEZDGBw6ifSqZ0K7O92iDGiJycWhF
	3GPKdmtD0UDFEDtHTR/3w77zsPudhokrjs2GyAPEByDKQrvAK/DwH19RSW/zFQEW
	q7+3cBGTLP7oro/UjfgHQDPmzYvS4LOPHYPpg1MKCTrkHfjp2aHZoJfhuQGJJoWC
	o0swub+FNaQVQyL0KmLYmw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvmd490v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:21 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 16:58:25 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 10 Dec 2023 16:58:25 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/5] systemd: support persistent tmp
Date: Mon, 11 Dec 2023 08:58:14 +0800
Message-ID: <20231211005815.1119314-5-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211005815.1119314-1-changqing.li@windriver.com>
References: <20231211005815.1119314-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EbRSlmF8gX6LtWyLEFYw6NratNHsi_NH
X-Proofpoint-ORIG-GUID: EbRSlmF8gX6LtWyLEFYw6NratNHsi_NH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=845 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 00:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192134

From: Changqing Li <changqing.li@windriver.com>

* update 00-create-volatile.conf, for volatile tmp, make /tmp ->
/var/tmp, /var/tmp -> /var/volatile/tmp and set age of /var/volatile/tmp
to 10d

* if VOLATILE_TMP_DIR/VOLATILE_LOG_DIR set to no, remove volatile
related configs from 00-create-volatile.conf

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../systemd/systemd/00-create-volatile.conf   |  3 ++-
 meta/recipes-core/systemd/systemd_254.4.bb    | 22 +++++++++++++------
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
index c4277221a2..860f2783ef 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -5,4 +5,5 @@
 
 d		/run/lock		1777	-	-	-
 d		/var/volatile/log		-	-	-	-
-d		/var/volatile/tmp		1777	-	-
+d		/var/volatile/tmp		1777	-	-   10d
+L+      /tmp                   1777    root   root   -     /var/tmp
diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 0c12926bef..01ef5cfd7b 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -289,6 +289,21 @@ do_install() {
 	done
 
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${nonarch_libdir}/tmpfiles.d/
+	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = False ]; then
+		sed -i -e "/^d.*\/var\/volatile\/log/d" ${D}${nonarch_libdir}/tmpfiles.d/00-create-volatile.conf
+	fi
+
+	if [ ${@ oe.types.boolean('${VOLATILE_TMP_DIR}') } = False ]; then
+		sed -i -e "/^d.*\/var\/volatile\/tmp/d" ${D}${nonarch_libdir}/tmpfiles.d/00-create-volatile.conf
+		sed -i -e "/^L+.*\/tmp/d" ${D}${nonarch_libdir}/tmpfiles.d/00-create-volatile.conf
+	else
+		# For volatile tmp, /tmp link to /var/tmp, /var/tmp links to /var/volatile/tmp, so don't need
+		# mount /tmp again
+		rm -f ${D}${systemd_unitdir}/system/tmp.mount
+		rm -f ${D}${systemd_unitdir}/system/local-fs.target.wants/tmp.mount
+		# The age are set in 00-create-volatile.conf
+		rm -rf ${D}${nonarch_libdir}/tmpfiles.d/tmp.conf
+	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
@@ -308,13 +323,6 @@ do_install() {
 		rm -rf ${D}${localstatedir}/log/journal/remote
 	fi
 
-	# if the user requests /tmp be on persistent storage (i.e. not volatile)
-	# then don't use a tmpfs for /tmp
-	if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
-		rm -f ${D}${rootlibdir}/systemd/system/tmp.mount
-		rm -f ${D}${rootlibdir}/systemd/system/local-fs.target.wants/tmp.mount
-	fi
-
 	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
 	install -d ${D}${systemd_system_unitdir}/multi-user.target.wants
 	install -d ${D}${systemd_system_unitdir}/poweroff.target.wants
-- 
2.25.1


