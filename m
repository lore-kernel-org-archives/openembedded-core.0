Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD11C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:13:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17129.1702030381235409764
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:13:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PDHP+xS+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07066c4dc9=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B881BJg024063
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Dec 2023 10:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=hsT+nu+giaIKGLv+slcuMBcC/xdBc2NyYVqtVIKOaps=; b=
	PDHP+xS+RAAyEBNZPF3ygf7cHSevxEhA9TCHYdKCgWPihPBxQRt0jw3kvikeE1n1
	D5zIgF9P6XWrCcPgABr7iCSL7Ltz3FkF3ArxMj4mWP0gNS4ARnZmAS4r6/Ug6/hS
	InwRdZucxbjmSCG+Q4X4UUr3i1vrBpcEXuM8OtVY9hjAlJh7BVbq0fNhkp4LkGgu
	G5yBDoVwAtle8XwyWxs6asnZ8nxrquIyozbFADawCfhHiFvmuLRHHvMH4v8Pcpd6
	8u9RWshzvOsz4a9kmGnq1kFG0y6ZKhhSPF+iBHi0ZxXcOlV+dTbzQtAqcFDkJghk
	hQb/PgUucDh1Qre559k/fg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53jq3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:13:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 02:13:03 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 02:13:02 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/5] systemd: support persistent tmp
Date: Fri, 8 Dec 2023 18:12:52 +0800
Message-ID: <20231208101253.4042712-6-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208101253.4042712-1-changqing.li@windriver.com>
References: <20231208101253.4042712-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2SRWTcrhLTSk5P4NgDjGW46Tn4GCBF1c
X-Proofpoint-GUID: 2SRWTcrhLTSk5P4NgDjGW46Tn4GCBF1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=850 mlxscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312080083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192027

From: Changqing Li <changqing.li@windriver.com>

* update 00-create-volatile.conf, for volatile tmp, make /tmp ->
/var/tmp, /var/tmp -> /var/volatile/tmp and set age of /var/volatile/tmp
to 10d

* if VOLATILE_TMP_DIR/VOLATILE_LOG_DIR set to no, remove volatile
related configs from 00-create-volatile.conf

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../systemd/systemd/00-create-volatile.conf   |  3 ++-
 meta/recipes-core/systemd/systemd_254.4.bb    | 23 +++++++++++++------
 2 files changed, 18 insertions(+), 8 deletions(-)

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
index 0c12926bef..10f86749b4 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -289,6 +289,22 @@ do_install() {
 	done
 
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${nonarch_libdir}/tmpfiles.d/
+    if  [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = False ]; then
+        sed -i -e "/^d.*\/var\/volatile\/log/d" ${D}${nonarch_libdir}/tmpfiles.d/00-create-volatile.conf
+    fi
+
+    if  [ ${@ oe.types.boolean('${VOLATILE_TMP_DIR}') } = False ]; then
+        sed -i -e "/^d.*\/var\/volatile\/tmp/d" ${D}${nonarch_libdir}/tmpfiles.d/00-create-volatile.conf
+        sed -i -e "/^L+.*\/tmp/d" ${D}${nonarch_libdir}/tmpfiles.d/00-create-volatile.conf
+
+    else
+        # For volatile tmp, /tmp link to /var/tmp, /var/tmp links to /var/volatile/tmp, so don't need
+        # mount /tmp again
+        rm -f ${D}${systemd_unitdir}/system/tmp.mount
+        rm -f ${D}${systemd_unitdir}/system/local-fs.target.wants/tmp.mount
+        # The age are set in 00-create-volatile.conf
+        rm -rf ${D}${nonarch_libdir}/tmpfiles.d/tmp.conf
+    fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
@@ -308,13 +324,6 @@ do_install() {
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


