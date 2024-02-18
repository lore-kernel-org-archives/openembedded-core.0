Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985B8C4829E
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 05:41:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13485.1708234876316743776
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Feb 2024 21:41:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JT5v94JU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=27787d4edb=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41I5U2mR017137
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 05:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=GYCDP
	ze6Ma6yLYXJitTtWxnP4l7a6ovLucFyyE1Hv7Y=; b=JT5v94JU/83Vd6WV/bt6w
	vHjOzt8iSnb09d5lgKF4c4JUmtZiTa46ObuOe0LTcqnXkwI0eB43nNW7xRjsjZtT
	QhtzyBAaeO26ziUFN7VEpRXiC4Wm4bMsWfA20ult0Vw9MPA1IF6S3psuHnaktBpa
	amQTQKraIZNIpyv7m5xdkTn8GhKRDNBN91z2Xbahs7ndZMZlOleHYqKGujvyuWdw
	27ibZK4fl8u98uL0TGdkxQRG8iAhnAHAO7NoTofS6XRUWHUvKdio/lMgZeLu3re5
	GxDo8xqZ3qDNtZ1FYl2eXQJDItGub8auskySrOFQxLTJpRczld3TINQ3dmtdVG6/
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3waj0y0tet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 05:41:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 17 Feb 2024 21:41:13 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sat, 17 Feb 2024 21:41:12 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V4] systemd: fix a dead link under /var/log
Date: Sun, 18 Feb 2024 13:41:12 +0800
Message-ID: <20240218054112.3637709-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jszMGGGrVU-BgV1JJeP5G-GsKnOHnw51
X-Proofpoint-ORIG-GUID: jszMGGGrVU-BgV1JJeP5G-GsKnOHnw51
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-18_03,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402180040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 05:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195821

From: Changqing Li <changqing.li@windriver.com>

Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
install README.logs under systemd doc dir.

But for OE, systemd doc dir is splited into package systemd-doc, when it
is not installed on the target, there will be an dead link:
Eg:
root@intel-x86-64:/var/log# ls -l README
lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/systemd/README.logs
root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file or directory

First, package this link into systemd-doc to fix above issue.  Second,
create the symlink according to the value of VOLATILE_LOG_DIR, when
VOLATILE_LOG_DIR is true,  /var/log is a link to /var/volatile/log, so
/var/log/README need link to ../../../usr/share/doc/systemd/README.logs,
while VOLATILE_LOG_DIR is false, /var/log is a dir, so /var/log/README
need link to ../../usr/share/doc/systemd/README.logs.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/systemd/systemd_255.1.bb | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.1.bb
index 9e09c89355..db21b70718 100644
--- a/meta/recipes-core/systemd/systemd_255.1.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -382,10 +382,22 @@ do_install() {
 	# add a profile fragment to disable systemd pager with busybox less
 	install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/systemd-pager.sh
 
-    if [ -n "${WATCHDOG_TIMEOUT}" ]; then
-        sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
-            ${D}/${sysconfdir}/systemd/system.conf
-    fi
+	if [ -n "${WATCHDOG_TIMEOUT}" ]; then
+		sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
+			${D}/${sysconfdir}/systemd/system.conf
+	fi
+
+	if [ -f "${D}${nonarch_libdir}/tmpfiles.d/legacy.conf" ] \
+		&& grep -q '^L \/var\/log\/README' ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf 2>/dev/null; then
+
+		sed -i -e '/^L \/var\/log\/README/d' ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf
+		touch ${D}${nonarch_libdir}/tmpfiles.d/legacy-doc.conf
+		if "${@'true' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'false'}"; then
+			echo "L /var/log/README - - - - ../../../${datadir}/doc/systemd/README.logs" > ${D}${nonarch_libdir}/tmpfiles.d/legacy-doc.conf
+		else
+			echo "L /var/log/README - - - - ../../${datadir}/doc/systemd/README.logs" > ${D}${nonarch_libdir}/tmpfiles.d/legacy-doc.conf
+		fi
+	fi
 }
 
 python populate_packages:prepend (){
@@ -622,6 +634,8 @@ FILES:${PN}-udev-rules = "\
                         ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
 "
 
+FILES:${PN}-doc  += "${nonarch_libdir}/tmpfiles.d/legacy-doc.conf"
+
 CONFFILES:${PN} = "${sysconfdir}/systemd/coredump.conf \
 	${sysconfdir}/systemd/journald.conf \
 	${sysconfdir}/systemd/logind.conf \
-- 
2.25.1


